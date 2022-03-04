Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7B4CDC24
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284475.483987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCV4-0007M6-Or; Fri, 04 Mar 2022 18:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284475.483987; Fri, 04 Mar 2022 18:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCV2-0006ot-3e; Fri, 04 Mar 2022 18:17:56 +0000
Received: by outflank-mailman (input) for mailman id 284475;
 Fri, 04 Mar 2022 17:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2C-0005R5-Lp
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:08 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fafe84e-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:07 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2A-000050-J4; Fri, 04 Mar 2022 18:48:06 +0100
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
X-Inumbo-ID: 3fafe84e-9be3-11ec-8539-5f4723681683
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
Subject: [PATCH 18/36] Alloc: introduce page_list_for_each_reverse
Date: Fri,  4 Mar 2022 18:46:43 +0100
Message-Id: <20220304174701.1453977-19-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
---
 xen/include/xen/mm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3be754da92..f0861ed5bb 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -488,6 +488,8 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
     list_for_each_entry_safe(pos, tmp, head, list)
 # define page_list_for_each_safe_reverse(pos, tmp, head) \
     list_for_each_entry_safe_reverse(pos, tmp, head, list)
+# define page_list_for_each_reverse(pos, head) \
+    list_for_each_entry_reverse(pos, head, list)
 #endif
 
 static inline unsigned int get_order_from_bytes(paddr_t size)
-- 
2.30.2


