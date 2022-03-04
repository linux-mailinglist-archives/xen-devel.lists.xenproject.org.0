Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4FA4CDC0A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284425.483775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUE-0004lG-Tu; Fri, 04 Mar 2022 18:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284425.483775; Fri, 04 Mar 2022 18:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUD-0004Vu-NZ; Fri, 04 Mar 2022 18:17:05 +0000
Received: by outflank-mailman (input) for mailman id 284425;
 Fri, 04 Mar 2022 17:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC29-0005R5-LP
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:05 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bd73a6b-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:00 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC24-0008Rc-7e; Fri, 04 Mar 2022 18:48:00 +0100
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
X-Inumbo-ID: 3bd73a6b-9be3-11ec-8539-5f4723681683
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
Subject: [PATCH 10/36] xen/arch: check color selection function
Date: Fri,  4 Mar 2022 18:46:35 +0100
Message-Id: <20220304174701.1453977-11-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Dom0 color configuration is parsed in the Xen command line. Add an
helper function to check the user selection. If no configuration is
provided by the user, all the available colors supported by the
hardware will be assigned to dom0.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 17 +++++++++++++++++
 xen/arch/arm/include/asm/coloring.h |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index f6e6d09477..382d558021 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -179,6 +179,23 @@ uint32_t *setup_default_colors(uint32_t *col_num)
     return NULL;
 }
 
+bool check_domain_colors(struct domain *d)
+{
+    int i;
+    bool ret = false;
+
+    if ( !d )
+        return ret;
+
+    if ( d->max_colors > max_col_num )
+        return ret;
+
+    for ( i = 0; i < d->max_colors; i++ )
+        ret |= (d->colors[i] > (max_col_num - 1));
+
+    return !ret;
+}
+
 bool __init coloring_init(void)
 {
     int i;
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 8f24acf082..fdd46448d7 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -26,8 +26,16 @@
 #define MAX_COLORS_CELLS 4
 
 #ifdef CONFIG_COLORING
+#include <xen/sched.h>
+
 bool __init coloring_init(void);
 
+/*
+ * Check colors of a given domain.
+ * Return true if check passed, false otherwise.
+ */
+bool check_domain_colors(struct domain *d);
+
 /*
  * Return an array with default colors selection and store the number of
  * colors in @param col_num. The array selection will be equal to the dom0
-- 
2.30.2


