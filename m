Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE64CDC1B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284461.483920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUl-000314-VP; Fri, 04 Mar 2022 18:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284461.483920; Fri, 04 Mar 2022 18:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUj-0002Wk-2d; Fri, 04 Mar 2022 18:17:37 +0000
Received: by outflank-mailman (input) for mailman id 284461;
 Fri, 04 Mar 2022 17:56:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2B-0005R5-La
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:07 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ddfbb0d-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:04 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC27-0008Ty-Il; Fri, 04 Mar 2022 18:48:03 +0100
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
X-Inumbo-ID: 3ddfbb0d-9be3-11ec-8539-5f4723681683
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
Subject: [PATCH 14/36] xen/arch: add dump coloring info for domains
Date: Fri,  4 Mar 2022 18:46:39 +0100
Message-Id: <20220304174701.1453977-15-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Print the color assignment for each domain when requested.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 12 ++++++++++++
 xen/arch/arm/domain.c               |  1 +
 xen/arch/arm/include/asm/coloring.h |  7 +++++++
 3 files changed, 20 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 382d558021..8061c3824f 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -332,6 +332,18 @@ static int __init parse_xen_colors(const char *s)
 }
 custom_param("xen_colors", parse_xen_colors);
 
+void coloring_dump_info(struct domain *d)
+{
+    int i;
+
+    printk("Domain %d has %u color(s) [ ", d->domain_id, d->max_colors);
+    for ( i = 0; i < d->max_colors; i++ )
+    {
+        printk("%"PRIu32" ", d->colors[i]);
+    }
+    printk("]\n");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 80a6f39464..fc12c79488 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1131,6 +1131,7 @@ int domain_relinquish_resources(struct domain *d)
 void arch_dump_domain_info(struct domain *d)
 {
     p2m_dump_info(d);
+    coloring_dump_info(d);
 }
 
 
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 1f7e0dde79..8609e17e80 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -40,10 +40,17 @@ bool check_domain_colors(struct domain *d);
  * color configuration.
  */
 uint32_t *setup_default_colors(uint32_t *col_num);
+
+void coloring_dump_info(struct domain *d);
 #else /* !CONFIG_COLORING */
 static inline bool __init coloring_init(void)
 {
     return true;
 }
+
+static inline void coloring_dump_info(struct domain *d)
+{
+    return;
+}
 #endif /* CONFIG_COLORING */
 #endif /* !__ASM_ARM_COLORING_H__ */
-- 
2.30.2


