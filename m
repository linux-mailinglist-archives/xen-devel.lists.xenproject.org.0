Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A634CDC16
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284457.483874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUc-00018f-Nm; Fri, 04 Mar 2022 18:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284457.483874; Fri, 04 Mar 2022 18:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUa-0000jT-Tk; Fri, 04 Mar 2022 18:17:28 +0000
Received: by outflank-mailman (input) for mailman id 284457;
 Fri, 04 Mar 2022 17:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2T-0005R4-VH
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:25 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a70f9ea-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:25 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2Q-0000Fs-LA; Fri, 04 Mar 2022 18:48:24 +0100
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
X-Inumbo-ID: 4a70f9ea-9be3-11ec-8eba-a37418f5ba1a
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
Subject: [PATCH 30/36] xen/arm: add coloring support to dom0less
Date: Fri,  4 Mar 2022 18:46:55 +0100
Message-Id: <20220304174701.1453977-31-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Dom0less color assignment is performed via Device Tree with a new
attribute "colors". In this case the color assignment is represented by
a bitmask where it suffices to set all and only the bits having a
position equal to the chosen colors, leaving unset all the others.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/domain_build.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 03a2573d67..c7ca45c0c4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -27,6 +27,7 @@
 #include <asm/setup.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <asm/coloring.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -3173,6 +3174,10 @@ void __init create_domUs(void)
 {
     struct dt_device_node *node;
     const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+    u32 col_val;
+    const u32 *cells;
+    u32 len;
+    int cell, i, k;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -3241,6 +3246,31 @@ void __init create_domUs(void)
                                          vpl011_virq - 32 + 1);
         }
 
+        d_cfg.arch.colors.max_colors = 0;
+        memset(&d_cfg.arch.colors.colors, 0x0, sizeof(d_cfg.arch.colors.colors));
+
+        cells = dt_get_property(node, "colors", &len);
+        if ( cells != NULL && len > 0 )
+        {
+            if ( !get_max_colors() )
+                panic("Coloring requested but no colors configuration found!\n");
+
+            if ( len > sizeof(d_cfg.arch.colors.colors) )
+                panic("Dom0less DomU color information is invalid\n");
+
+            for ( k = 0, cell = len/4 - 1; cell >= 0; cell--, k++ )
+            {
+                col_val = be32_to_cpup(&cells[cell]);
+                if ( col_val )
+                {
+                    /* Calculate number of bit set */
+                    for ( i = 0; i < 32; i++)
+                        if ( col_val & (1 << i) )
+                            d_cfg.arch.colors.max_colors++;
+                    d_cfg.arch.colors.colors[k] = col_val;
+                }
+            }
+        }
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
-- 
2.30.2


