Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622D4CDC0B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284422.483763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUD-0004WP-8l; Fri, 04 Mar 2022 18:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284422.483763; Fri, 04 Mar 2022 18:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUC-0004Df-Gf; Fri, 04 Mar 2022 18:17:04 +0000
Received: by outflank-mailman (input) for mailman id 284422;
 Fri, 04 Mar 2022 17:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC28-0005R5-LJ
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:04 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b6e7c23-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:00 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC23-0008R5-Fw; Fri, 04 Mar 2022 18:47:59 +0100
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
X-Inumbo-ID: 3b6e7c23-9be3-11ec-8539-5f4723681683
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
Subject: [PATCH 09/36] xen/arch: add default colors selection function
Date: Fri,  4 Mar 2022 18:46:34 +0100
Message-Id: <20220304174701.1453977-10-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When cache coloring support is enabled, a color assignment is needed for
every domain. Introduce a function computing a default configuration
with a safe and common value -- the dom0 color selection.

Do not access directly the array of color indices of dom0. Instead make
use of the dom0 color configuration as a bitmask.
Add a helper function that converts the color configuration bitmask into
the indices array.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 36 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/coloring.h |  7 ++++++
 2 files changed, 43 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index af75b536a7..f6e6d09477 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -143,6 +143,42 @@ static __init uint64_t calculate_addr_col_mask(uint64_t llc_way_size)
     return addr_col_mask;
 }
 
+static int copy_mask_to_list(
+    uint32_t *col_mask, uint32_t *col_list, uint64_t col_num)
+{
+    unsigned int i, k, c;
+
+    if ( !col_list )
+        return -EINVAL;
+
+    for ( i = 0, k = 0; i < MAX_COLORS_CELLS; i++ )
+        for ( c = 0; k < col_num && c < 32; c++ )
+            if ( col_mask[i] & (1 << (c + (i*32))) )
+                col_list[k++] = c + (i * 32);
+
+    return 0;
+}
+
+uint32_t *setup_default_colors(uint32_t *col_num)
+{
+    uint32_t *col_list;
+
+    if ( dom0_col_num )
+    {
+        *col_num = dom0_col_num;
+        col_list = xzalloc_array(uint32_t, dom0_col_num);
+        if ( !col_list )
+        {
+            printk(XENLOG_ERR "setup_default_colors: Alloc failed\n");
+            return NULL;
+        }
+        copy_mask_to_list(dom0_col_mask, col_list, dom0_col_num);
+        return col_list;
+    }
+
+    return NULL;
+}
+
 bool __init coloring_init(void)
 {
     int i;
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 70e1dbd09b..8f24acf082 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -27,6 +27,13 @@
 
 #ifdef CONFIG_COLORING
 bool __init coloring_init(void);
+
+/*
+ * Return an array with default colors selection and store the number of
+ * colors in @param col_num. The array selection will be equal to the dom0
+ * color configuration.
+ */
+uint32_t *setup_default_colors(uint32_t *col_num);
 #else /* !CONFIG_COLORING */
 static inline bool __init coloring_init(void)
 {
-- 
2.30.2


