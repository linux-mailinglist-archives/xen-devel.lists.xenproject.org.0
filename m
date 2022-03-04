Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793B4CDC19
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284458.483886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUe-0001Tz-EO; Fri, 04 Mar 2022 18:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284458.483886; Fri, 04 Mar 2022 18:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUc-000168-P2; Fri, 04 Mar 2022 18:17:30 +0000
Received: by outflank-mailman (input) for mailman id 284458;
 Fri, 04 Mar 2022 17:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2R-0005R4-4w
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:23 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48cccd0d-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:22 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2P-0000FR-Rf; Fri, 04 Mar 2022 18:48:22 +0100
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
X-Inumbo-ID: 48cccd0d-9be3-11ec-8eba-a37418f5ba1a
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
Subject: [PATCH 29/36] xen/arm: add dump function for coloring info
Date: Fri,  4 Mar 2022 18:46:54 +0100
Message-Id: <20220304174701.1453977-30-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Display general information about coloring support both during boot and
when requested by the user.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/coloring.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index aae3c77a7b..c590e1629a 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -24,6 +24,7 @@
 #include <xen/types.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
+#include <xen/keyhandler.h>
 #include <xen/param.h>
 
 #include <asm/sysregs.h>
@@ -434,6 +435,29 @@ void coloring_dump_info(struct domain *d)
     printk("]\n");
 }
 
+static void dump_coloring_info(unsigned char key)
+{
+    int i;
+
+    printk("Coloring general information\n");
+    printk("Way size: %"PRIu64"kB\n", way_size >> 10);
+    printk("Max. number of colors available: %"PRIu32"\n", max_col_num);
+
+    printk("Xen color(s):\t[");
+    for ( i = 0; i < xen_col_num; i++ )
+        printk(" %"PRIu32" ", xen_col_list[i]);
+    printk("]\n");
+}
+
+static __init int register_heap_trigger(void)
+{
+    register_keyhandler('C', dump_coloring_info, "dump coloring general info", 1);
+
+    /* Also print general information once at boot */
+    dump_coloring_info('C');
+    return 0;
+}
+__initcall(register_heap_trigger);
 /*
  * Local variables:
  * mode: C
-- 
2.30.2


