Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAEA4CDC03
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284413.483700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU6-0002lT-Ki; Fri, 04 Mar 2022 18:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284413.483700; Fri, 04 Mar 2022 18:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU6-0002Zt-6P; Fri, 04 Mar 2022 18:16:58 +0000
Received: by outflank-mailman (input) for mailman id 284413;
 Fri, 04 Mar 2022 17:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC24-0005R5-Kq
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:00 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39bbb6ac-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:47:57 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC20-0008Pk-Ky; Fri, 04 Mar 2022 18:47:56 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 39bbb6ac-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 05/36] xen/arm: compute LLC way size by hardware inspection
Date: Fri,  4 Mar 2022 18:46:30 +0100
Message-Id: <20220304174701.1453977-6-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

The size of the LLC way is a crucial parameter for the cache coloring
support, since it determines the maximum number of available colors on
the platform.  This parameter can currently be retrieved only from
the way_size bootarg and it is prone to misconfiguration nullifying the
coloring mechanism and breaking cache isolation.

Add an alternative and more safe method to retrieve the way size by
directly asking the hardware, namely using CCSIDR_EL1 and CSSELR_EL1
registers.

This method has to check also if at least L2 is implemented in the
hardware since there are scenarios where only L1 cache is availble, e.g,
QEMU.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/coloring.c | 76 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 8f1cff6efb..e3d490b453 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -25,7 +25,10 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/param.h>
+
+#include <asm/sysregs.h>
 #include <asm/coloring.h>
+#include <asm/io.h>
 
 /* Number of color(s) assigned to Xen */
 static uint32_t xen_col_num;
@@ -39,6 +42,79 @@ static uint32_t dom0_col_mask[MAX_COLORS_CELLS];
 
 static uint64_t way_size;
 
+#define CTR_LINESIZE_MASK 0x7
+#define CTR_SIZE_SHIFT 13
+#define CTR_SIZE_MASK 0x3FFF
+#define CTR_SELECT_L2 1 << 1
+#define CTR_SELECT_L3 1 << 2
+#define CTR_CTYPEn_MASK 0x7
+#define CTR_CTYPE2_SHIFT 3
+#define CTR_CTYPE3_SHIFT 6
+#define CTR_LLC_ON 1 << 2
+#define CTR_LOC_SHIFT 24
+#define CTR_LOC_MASK 0x7
+#define CTR_LOC_L2 1 << 1
+#define CTR_LOC_NOT_IMPLEMENTED 1 << 0
+
+
+/* Return the way size of last level cache by asking the hardware */
+static uint64_t get_llc_way_size(void)
+{
+    uint32_t cache_sel = READ_SYSREG64(CSSELR_EL1);
+    uint32_t cache_global_info = READ_SYSREG64(CLIDR_EL1);
+    uint32_t cache_info;
+    uint32_t cache_line_size;
+    uint32_t cache_set_num;
+    uint32_t cache_sel_tmp;
+
+    printk(XENLOG_INFO "Get information on LLC\n");
+    printk(XENLOG_INFO "Cache CLIDR_EL1: 0x%"PRIx32"\n", cache_global_info);
+
+    /* Check if at least L2 is implemented */
+    if ( ((cache_global_info >> CTR_LOC_SHIFT) & CTR_LOC_MASK)
+        == CTR_LOC_NOT_IMPLEMENTED )
+    {
+        printk(XENLOG_ERR "ERROR: L2 Cache not implemented\n");
+        return 0;
+    }
+
+    /* Save old value of CSSELR_EL1 */
+    cache_sel_tmp = cache_sel;
+
+    /* Get LLC index */
+    if ( ((cache_global_info >> CTR_CTYPE2_SHIFT) & CTR_CTYPEn_MASK)
+        == CTR_LLC_ON )
+        cache_sel = CTR_SELECT_L2;
+    else
+        cache_sel = CTR_SELECT_L3;
+
+    printk(XENLOG_INFO "LLC selection: %u\n", cache_sel);
+    /* Select the correct LLC in CSSELR_EL1 */
+    WRITE_SYSREG64(cache_sel, CSSELR_EL1);
+
+    /* Ensure write */
+    isb();
+
+    /* Get info about the LLC */
+    cache_info = READ_SYSREG64(CCSIDR_EL1);
+
+    /* ARM TRM: (Log2(Number of bytes in cache line)) - 4. */
+    cache_line_size = 1 << ((cache_info & CTR_LINESIZE_MASK) + 4);
+    /* ARM TRM: (Number of sets in cache) - 1 */
+    cache_set_num = ((cache_info >> CTR_SIZE_SHIFT) & CTR_SIZE_MASK) + 1;
+
+    printk(XENLOG_INFO "Cache line size: %u bytes\n", cache_line_size);
+    printk(XENLOG_INFO "Cache sets num: %u\n", cache_set_num);
+
+    /* Restore value in CSSELR_EL1 */
+    WRITE_SYSREG64(cache_sel_tmp, CSSELR_EL1);
+
+    /* Ensure write */
+    isb();
+
+    return (cache_line_size * cache_set_num);
+}
+
 /*************************
  * PARSING COLORING BOOTARGS
  */
-- 
2.30.2


