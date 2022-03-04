Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE4F4CDC28
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284482.484026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCVD-00012M-DJ; Fri, 04 Mar 2022 18:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284482.484026; Fri, 04 Mar 2022 18:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCVB-0000Vv-HM; Fri, 04 Mar 2022 18:18:05 +0000
Received: by outflank-mailman (input) for mailman id 284482;
 Fri, 04 Mar 2022 17:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2F-0005R5-Lt
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:11 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41dd6d85-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:10 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2E-00008L-6Q; Fri, 04 Mar 2022 18:48:10 +0100
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
X-Inumbo-ID: 41dd6d85-9be3-11ec-8539-5f4723681683
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
	Luca Miccio <206497@studenti.unimore.it>
Subject: [PATCH 22/36] xen/arch: init cache coloring conf for Xen
Date: Fri,  4 Mar 2022 18:46:47 +0100
Message-Id: <20220304174701.1453977-23-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add initialization for Xen coloring data. By default, use the lowest
color index available.

Benchmarking the VM interrupt response time provides an estimation of
LLC usage by Xen's most latency-critical runtime task.  Results on Arm
Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
reserves 64 KiB of L2, is enough to attain best responsiveness.

More colors are instead very likely to be needed on processors whose L1
cache is physically-indexed and physically-tagged, such as Cortex-A57.
In such cases, coloring applies to L1 also, and there typically are two
distinct L1-colors. Therefore, reserving only one color for Xen would
senselessly partitions a cache memory that is already private, i.e.
underutilize it. The default amount of Xen colors is thus set to one.

Signed-off-by: Luca Miccio <206497@studenti.unimore.it>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index d1ac193a80..761414fcd7 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -30,10 +30,18 @@
 #include <asm/coloring.h>
 #include <asm/io.h>
 
+/* By default Xen uses the lowestmost color */
+#define XEN_COLOR_DEFAULT_MASK 0x0001
+#define XEN_COLOR_DEFAULT_NUM 1
+/* Current maximum useful colors */
+#define MAX_XEN_COLOR   128
+
 /* Number of color(s) assigned to Xen */
 static uint32_t xen_col_num;
 /* Coloring configuration of Xen as bitmask */
 static uint32_t xen_col_mask[MAX_COLORS_CELLS];
+/* Xen colors IDs */
+static uint32_t xen_col_list[MAX_XEN_COLOR];
 
 /* Number of color(s) assigned to Dom0 */
 static uint32_t dom0_col_num;
@@ -216,7 +224,7 @@ uint32_t get_max_colors(void)
 
 bool __init coloring_init(void)
 {
-    int i;
+    int i, rc;
 
     printk(XENLOG_INFO "Initialize XEN coloring: \n");
     /*
@@ -266,6 +274,27 @@ bool __init coloring_init(void)
     printk(XENLOG_INFO "Color bits in address: 0x%"PRIx64"\n", addr_col_mask);
     printk(XENLOG_INFO "Max number of colors: %u\n", max_col_num);
 
+    if ( !xen_col_num )
+    {
+        xen_col_mask[0] = XEN_COLOR_DEFAULT_MASK;
+        xen_col_num = XEN_COLOR_DEFAULT_NUM;
+        printk(XENLOG_WARNING "Xen color configuration not found. Using default\n");
+    }
+
+    printk(XENLOG_INFO "Xen color configuration: 0x%"PRIx32"%"PRIx32"%"PRIx32"%"PRIx32"\n",
+            xen_col_mask[3], xen_col_mask[2], xen_col_mask[1], xen_col_mask[0]);
+    rc = copy_mask_to_list(xen_col_mask, xen_col_list, xen_col_num);
+
+    if ( rc )
+        return false;
+
+    for ( i = 0; i < xen_col_num; i++ )
+        if ( xen_col_list[i] > (max_col_num - 1) )
+        {
+            printk(XENLOG_ERR "ERROR: max. color value not supported\n");
+            return false;
+        }
+
     return true;
 }
 
-- 
2.30.2


