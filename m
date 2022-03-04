Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD04CDC26
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284478.484006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCV8-0008P6-Q9; Fri, 04 Mar 2022 18:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284478.484006; Fri, 04 Mar 2022 18:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCV6-0007np-J2; Fri, 04 Mar 2022 18:18:00 +0000
Received: by outflank-mailman (input) for mailman id 284478;
 Fri, 04 Mar 2022 17:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2H-0005R5-Rt
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:13 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 433b3b5c-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:13 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2G-0000AI-G5; Fri, 04 Mar 2022 18:48:12 +0100
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
X-Inumbo-ID: 433b3b5c-9be3-11ec-8539-5f4723681683
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
Subject: [PATCH 25/36] xen/arm: bring back get_xen_paddr
Date: Fri,  4 Mar 2022 18:46:50 +0100
Message-Id: <20220304174701.1453977-26-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

In order to efficiently coloring Xen, we need to relocate it and move
the xen code to a unique memory region that will be marked as colored
for Xen itself. This region will be out target region and it will be
placed as high as possibile in RAM. To do that we need to use the old
get_xen_paddr function that was part of the relocation feature.
Moreover the size of the region we want to relocate is not equal to xen
code size anymore because of coloring.
In the worst case the target region must be greater than xen code
size * avail. colors. However the get_xen_paddr assumes to handle a
memory with size equals only to xen code region.
Add a new "size" parameter to handle also the coloring case.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Acked-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/setup.c | 54 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 0bfe12da57..8d980ce18d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -570,6 +570,60 @@ static paddr_t __init next_module(paddr_t s, paddr_t *end)
     return lowest;
 }
 
+#ifdef CONFIG_COLORING
+/**
+ * get_xen_paddr - get physical address to relocate Xen to
+ *
+ * Xen is relocated to as near to the top of RAM as possible and
+ * aligned to a XEN_PADDR_ALIGN boundary.
+ */
+static paddr_t __init get_xen_paddr(uint32_t xen_size)
+{
+    struct meminfo *mi = &bootinfo.mem;
+    paddr_t min_size;
+    paddr_t paddr = 0;
+    int i;
+
+    min_size = (xen_size + (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1);
+
+    /* Find the highest bank with enough space. */
+    for ( i = 0; i < mi->nr_banks; i++ )
+    {
+        const struct membank *bank = &mi->bank[i];
+        paddr_t s, e;
+
+        if ( bank->size >= min_size )
+        {
+            e = consider_modules(bank->start, bank->start + bank->size,
+                                 min_size, XEN_PADDR_ALIGN, 0);
+            if ( !e )
+                continue;
+
+#ifdef CONFIG_ARM_32
+            /* Xen must be under 4GB */
+            if ( e > 0x100000000ULL )
+                e = 0x100000000ULL;
+            if ( e < bank->start )
+                continue;
+#endif
+
+            s = e - min_size;
+
+            if ( s > paddr )
+                paddr = s;
+        }
+    }
+
+    if ( !paddr )
+        panic("Not enough memory to relocate Xen\n");
+
+    printk("Placing Xen at 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           paddr, paddr + min_size);
+
+    return paddr;
+}
+#endif
+
 static void __init init_pdx(void)
 {
     paddr_t bank_start, bank_size, bank_end;
-- 
2.30.2


