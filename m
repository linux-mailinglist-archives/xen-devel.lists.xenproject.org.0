Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D204CDC06
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284415.483708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU7-00032x-EA; Fri, 04 Mar 2022 18:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284415.483708; Fri, 04 Mar 2022 18:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU6-0002lQ-UQ; Fri, 04 Mar 2022 18:16:58 +0000
Received: by outflank-mailman (input) for mailman id 284415;
 Fri, 04 Mar 2022 17:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC25-0005R5-Ky
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:01 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a352594-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:47:58 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC21-0008Q0-Dy; Fri, 04 Mar 2022 18:47:57 +0100
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
X-Inumbo-ID: 3a352594-9be3-11ec-8539-5f4723681683
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
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 06/36] xen/arm: add coloring basic initialization
Date: Fri,  4 Mar 2022 18:46:31 +0100
Message-Id: <20220304174701.1453977-7-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Introduce a first and simple initialization function for the cache
coloring support. A helper function computes 'addr_col_mask', the
platform-dependent bitmask asserting the bits in memory addresses that
can be used for the coloring mechanism. This, in turn is used to
determine the total amount of available colors.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 83 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/coloring.h |  8 +++
 xen/arch/arm/setup.c                |  4 ++
 3 files changed, 95 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index e3d490b453..af75b536a7 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -39,8 +39,13 @@ static uint32_t xen_col_mask[MAX_COLORS_CELLS];
 static uint32_t dom0_col_num;
 /* Coloring configuration of Dom0 as bitmask */
 static uint32_t dom0_col_mask[MAX_COLORS_CELLS];
+/* Maximum number of available color(s) */
+static uint32_t max_col_num;
+/* Maximum available coloring configuration as bitmask */
+static uint32_t max_col_mask[MAX_COLORS_CELLS];
 
 static uint64_t way_size;
+static uint64_t addr_col_mask;
 
 #define CTR_LINESIZE_MASK 0x7
 #define CTR_SIZE_SHIFT 13
@@ -115,6 +120,84 @@ static uint64_t get_llc_way_size(void)
     return (cache_line_size * cache_set_num);
 }
 
+/*
+ * Return the coloring mask based on the value of @param llc_way_size.
+ * This mask represents the bits in the address that can be used
+ * for defining available colors.
+ *
+ * @param llc_way_size		Last level cache way size.
+ * @return unsigned long	The coloring bitmask.
+ */
+static __init uint64_t calculate_addr_col_mask(uint64_t llc_way_size)
+{
+    uint64_t addr_col_mask = 0;
+    unsigned int i;
+    unsigned int low_idx, high_idx;
+
+    low_idx = PAGE_SHIFT;
+    high_idx = get_count_order(llc_way_size) - 1;
+
+    for ( i = low_idx; i <= high_idx; i++ )
+        addr_col_mask |= (1 << i);
+
+    return addr_col_mask;
+}
+
+bool __init coloring_init(void)
+{
+    int i;
+
+    printk(XENLOG_INFO "Initialize XEN coloring: \n");
+    /*
+     * If the way size is not provided by the configuration, try to get
+     * this information from hardware.
+     */
+    if ( !way_size )
+    {
+        way_size = get_llc_way_size();
+
+        if ( !way_size )
+        {
+            printk(XENLOG_ERR "ERROR: way size is null\n");
+            return false;
+        }
+    }
+
+    addr_col_mask = calculate_addr_col_mask(way_size);
+    if ( !addr_col_mask )
+    {
+        printk(XENLOG_ERR "ERROR: addr_col_mask is null\n");
+        return false;
+    }
+
+    max_col_num = ((addr_col_mask >> PAGE_SHIFT) + 1);
+
+   /*
+    * If the user or the platform itself provide a way_size
+    * configuration that corresponds to a number of max.
+    * colors greater than the one we support, we cannot
+    * continue. So the check on offset value is necessary.
+    */
+    if ( max_col_num > 32 * MAX_COLORS_CELLS )
+    {
+        printk(XENLOG_ERR "ERROR: max. color value not supported\n");
+        return false;
+    }
+
+    for ( i = 0; i < max_col_num; i++ )
+    {
+        unsigned int offset = i / 32;
+
+        max_col_mask[offset] |= (1 << i % 32);
+    }
+
+    printk(XENLOG_INFO "Way size: 0x%"PRIx64"\n", way_size);
+    printk(XENLOG_INFO "Color bits in address: 0x%"PRIx64"\n", addr_col_mask);
+    printk(XENLOG_INFO "Max number of colors: %u\n", max_col_num);
+
+    return true;
+}
+
 /*************************
  * PARSING COLORING BOOTARGS
  */
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 60958d1244..70e1dbd09b 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -25,4 +25,12 @@
 
 #define MAX_COLORS_CELLS 4
 
+#ifdef CONFIG_COLORING
+bool __init coloring_init(void);
+#else /* !CONFIG_COLORING */
+static inline bool __init coloring_init(void)
+{
+    return true;
+}
+#endif /* CONFIG_COLORING */
 #endif /* !__ASM_ARM_COLORING_H__ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index b8d4f50d90..f39c62ea70 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -53,6 +53,7 @@
 #include <asm/setup.h>
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
+#include <asm/coloring.h>
 
 struct bootinfo __initdata bootinfo;
 
@@ -893,6 +894,9 @@ void __init start_xen(unsigned long boot_phys_offset,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    if ( !coloring_init() )
+        panic("Xen Coloring support: setup failed\n");
+
     /* Register Xen's load address as a boot module. */
     xen_bootmodule = add_boot_module(BOOTMOD_XEN, xen_paddr,
                              (paddr_t)(uintptr_t)(_end - _start + 1), false);
-- 
2.30.2


