Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96834CDC12
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284437.483824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUR-000704-BP; Fri, 04 Mar 2022 18:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284437.483824; Fri, 04 Mar 2022 18:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUP-0006Uh-9Z; Fri, 04 Mar 2022 18:17:17 +0000
Received: by outflank-mailman (input) for mailman id 284437;
 Fri, 04 Mar 2022 17:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2G-0005R4-BY
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:12 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4253958d-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:11 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2E-000091-Vv; Fri, 04 Mar 2022 18:48:11 +0100
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
X-Inumbo-ID: 4253958d-9be3-11ec-8eba-a37418f5ba1a
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
Subject: [PATCH 23/36] xen/arch: coloring: manually calculate Xen physical addresses
Date: Fri,  4 Mar 2022 18:46:48 +0100
Message-Id: <20220304174701.1453977-24-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

During Xen coloring procedure, we need to manually calculate consecutive
physical addresses that conform to the color selection. Add an helper
function that does this operation. The latter will return the next
address that conforms to Xen color selection.

The next_colored function is architecture dependent and the provided
implementation is for ARMv8.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 43 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/coloring.h | 14 ++++++++++
 2 files changed, 57 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 761414fcd7..aae3c77a7b 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -222,6 +222,49 @@ uint32_t get_max_colors(void)
     return max_col_num;
 }
 
+paddr_t next_xen_colored(paddr_t phys)
+{
+    unsigned int i;
+    unsigned int col_next_number = 0;
+    unsigned int col_cur_number = (phys & addr_col_mask) >> PAGE_SHIFT;
+    int overrun = 0;
+    paddr_t ret;
+
+    /*
+     * Check if address color conforms to Xen selection. If it does, return
+     * the address as is.
+     */
+    for( i = 0; i < xen_col_num; i++)
+        if ( col_cur_number == xen_col_list[i] )
+            return phys;
+
+    /* Find next col */
+    for( i = xen_col_num -1 ; i >= 0; i--)
+    {
+        if ( col_cur_number > xen_col_list[i])
+        {
+            /* Need to start to first element and add a way_size */
+            if ( i == (xen_col_num - 1) )
+            {
+                col_next_number = xen_col_list[0];
+                overrun = 1;
+            }
+            else
+            {
+                col_next_number = xen_col_list[i+1];
+                overrun = 0;
+            }
+            break;
+        }
+    }
+
+    /* Align phys to way_size */
+    ret = phys - (PAGE_SIZE * col_cur_number);
+    /* Add the offset based on color selection*/
+    ret += (PAGE_SIZE * (col_next_number)) + (way_size*overrun);
+    return ret;
+}
+
 bool __init coloring_init(void)
 {
     int i, rc;
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 22e67dc9d8..8c4525677c 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -28,6 +28,20 @@
 
 bool __init coloring_init(void);
 
+/*
+ * Return physical page address that conforms to the colors selection
+ * given in col_selection_mask after @param phys.
+ *
+ * @param phys         Physical address start.
+ * @param addr_col_mask        Mask specifying the bits available for coloring.
+ * @param col_selection_mask   Mask asserting the color bits to be used,
+ * must not be 0.
+ *
+ * @return The lowest physical page address being greater or equal than
+ * 'phys' and belonging to Xen color selection
+ */
+paddr_t next_xen_colored(paddr_t phys);
+
 /*
  * Check colors of a given domain.
  * Return true if check passed, false otherwise.
-- 
2.30.2


