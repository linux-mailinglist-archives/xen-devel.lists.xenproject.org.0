Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96BA4CDC0C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284429.483793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUJ-0005bM-OP; Fri, 04 Mar 2022 18:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284429.483793; Fri, 04 Mar 2022 18:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUH-00056s-Vg; Fri, 04 Mar 2022 18:17:09 +0000
Received: by outflank-mailman (input) for mailman id 284429;
 Fri, 04 Mar 2022 17:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2A-0005R4-Aw
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:06 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ec47c14-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:05 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC29-0008V5-3U; Fri, 04 Mar 2022 18:48:05 +0100
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
X-Inumbo-ID: 3ec47c14-9be3-11ec-8eba-a37418f5ba1a
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
Subject: [PATCH 16/36] xen/color alloc: implement color_from_page for ARM64
Date: Fri,  4 Mar 2022 18:46:41 +0100
Message-Id: <20220304174701.1453977-17-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

The colored allocator should not make any assumptions on how a color is
defined, since the definition may change depending on the architecture.
Use a generic function "color_from_page" that returns the color id based
on the page address.
Add a definition for ARMv8 architectures.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/coloring.c             | 13 +++++++++++++
 xen/arch/arm/include/asm/coloring.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 8061c3824f..4748d717d6 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -196,6 +196,19 @@ bool check_domain_colors(struct domain *d)
     return !ret;
 }
 
+/*
+ * Compute color id from the page @param pg.
+ * Page size determines the lowest available bit, while add_col_mask is used to
+ * select the rest.
+ *
+ * @param pg              Page address
+ * @return unsigned long  Color id
+ */
+unsigned long color_from_page(struct page_info *pg)
+{
+  return ((addr_col_mask & page_to_maddr(pg)) >> PAGE_SHIFT);
+}
+
 bool __init coloring_init(void)
 {
     int i;
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 8609e17e80..318e2a4521 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -42,6 +42,13 @@ bool check_domain_colors(struct domain *d);
 uint32_t *setup_default_colors(uint32_t *col_num);
 
 void coloring_dump_info(struct domain *d);
+
+/*
+ * Compute the color of the given page address.
+ * This function should change depending on the cache architecture
+ * specifications.
+ */
+unsigned long color_from_page(struct page_info *pg);
 #else /* !CONFIG_COLORING */
 static inline bool __init coloring_init(void)
 {
-- 
2.30.2


