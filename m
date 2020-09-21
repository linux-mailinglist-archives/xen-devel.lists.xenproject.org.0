Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B89273160
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 20:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQ94-0003O6-Cf; Mon, 21 Sep 2020 18:02:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKQ93-0003KW-9x
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:02:33 +0000
X-Inumbo-ID: b8fc4c22-75bd-495e-bbca-5bdad6c84546
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8fc4c22-75bd-495e-bbca-5bdad6c84546;
 Mon, 21 Sep 2020 18:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=kRgAuPJg4QZgZY5JhR8JA1mjiraFCTIYdvp+6bJCoIk=; b=H34jv+ycNSiWmns6bXUCA0I/p
 DK9uipV5nBaqWuwKi1By0fUPcF4SO/wWIWVypLRKptbOHXivL/Mu6koqhb4F8a+KUfZSIvpQbVcOU
 wfS5f9f5j2tZhPoizJ95EyeCdlOoWi1oFFgowGHxuxPHVB35lFkQ0aCC0Ws5ycbfzJhvY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8x-00087T-FT; Mon, 21 Sep 2020 18:02:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8x-0003uk-6X; Mon, 21 Sep 2020 18:02:27 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 4/4] xen/mm: Provide dummy M2P-related helpers when
 !CONFIG_HAVE_M2P
Date: Mon, 21 Sep 2020 19:02:14 +0100
Message-Id: <20200921180214.4842-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921180214.4842-1-julien@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <julien.grall@arm.com>

At the moment, Arm is providing a dummy implementation for the M2P
helpers used in common code. However, they are quite isolated and could
be used by other architecture in the future. So move all the helpers in
xen/mm.h.

Signed-off-by: Julien Grall <julien.grall@arm.com>

---
    Changes in v4:
        - The tags were dropped as the previous version was sent a long
        time ago.

    Changes in v3:
        - Add Stefano's reviewed-by
        - Add George's acked-by

    Changes in v2:
        - Patch added
---
 xen/include/asm-arm/mm.h | 11 -----------
 xen/include/xen/mm.h     | 13 +++++++++++++
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index 29489a3e1076..5929201d0299 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -318,17 +318,6 @@ static inline void *page_to_virt(const struct page_info *pg)
 struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
                                     unsigned long flags);
 
-/*
- * Arm does not have an M2P, but common code expects a handful of
- * M2P-related defines and functions. Provide dummy versions of these.
- */
-#define INVALID_M2P_ENTRY        (~0UL)
-#define SHARED_M2P_ENTRY         (~0UL - 1UL)
-#define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
-
-/* We don't have a M2P on Arm */
-#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
-
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 4536a62940a1..15bb0aa30d22 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -685,4 +685,17 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
+/*
+ * Dummy implementation of M2P-related helpers for common code when
+ * the architecture doesn't have an M2P.
+ */
+#ifndef CONFIG_HAS_M2P
+
+#define INVALID_M2P_ENTRY        (~0UL)
+#define SHARED_M2P(_e)           false
+
+static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn) {}
+
+#endif
+
 #endif /* __XEN_MM_H__ */
-- 
2.17.1


