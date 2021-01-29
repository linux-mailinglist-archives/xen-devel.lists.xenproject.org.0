Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97630837E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77628.140769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J46-00079Z-Ov; Fri, 29 Jan 2021 01:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77628.140769; Fri, 29 Jan 2021 01:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J46-00078Y-6i; Fri, 29 Jan 2021 01:59:14 +0000
Received: by outflank-mailman (input) for mailman id 77628;
 Fri, 29 Jan 2021 01:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Ivg-0004da-Lt
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:32 +0000
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48c0507c-26f8-47b6-b7c4-36f0116b0e24;
 Fri, 29 Jan 2021 01:49:24 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id r14so8744346ljc.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:24 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:22 -0800 (PST)
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
X-Inumbo-ID: 48c0507c-26f8-47b6-b7c4-36f0116b0e24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yHZDWbqsnnHHHjfd2iWbdB0nAif5Wc6wWeD5M/+zjqk=;
        b=rI9PkNpdToPqeWalJrNwob6+vrOCbPe4W3YpVj4tPWtDm1dK2mDYqY8hmAA25d2+8f
         ezJgBXk3yJm27eLnoDHdwQxqQCljQ13/YR7PmrSBk1MG3gdVc4vz94kP43JJ1SZvLSlZ
         a2qAVnwehERTxFR/+UKKZmIFyvztP78efInzwECIc3PzORnJr1CgdWtE1y1yyCQ36cFh
         bNByyce2bZzmeVFwV2ubdjnjMsbnf5r70WTRme0844tQaiqcWzeq68bRaB6JQysAxNK7
         0U8o28qn7F22B0w996Z5tjsuCukiDPom8rpZScQlW+S7zPwMHWtDdcSFYoCJXGpq85dC
         QR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yHZDWbqsnnHHHjfd2iWbdB0nAif5Wc6wWeD5M/+zjqk=;
        b=HNGuysyOwqSxuW2cwknkl8ff7t7eGZpMhKAMZXGum95SALLdRW+ixXn1823ThjIgrN
         AD4E8ZfC5z2oDvQlx1NfHfURzNOqD46Qx8C3A4ZfP7KnSarU4WkXs0u3eGRIWkM2Sa8R
         L1q4nmPDcN0ae45KY+z9cW4QMXg1EN7g3adPg7YeCiKNJugvW3OzvTP/wv/lwos1+3Ca
         ATAZ6FXdfpQCAMzMxl9iv2+I3pTULpy64SrUiTEwzUl5Zmw6hDraQSE5gBDMxLsDtvrB
         ghdy2V+vPtio6rRhq5mAEEAwV4tgWRvNPYcqhUcucqrKBZ89HwG15CNFtGOZw8pT3FoW
         IaUQ==
X-Gm-Message-State: AOAM53121I59IOfYITA9T/BB8V2yPGQ96htsQtBvCPS0QufFGotDzj2t
	onLgOn/TcpyI7coG9RiVANUcKcH6eWjs4g==
X-Google-Smtp-Source: ABdhPJywtxd0avHPJo4IDv+C7oO/ZT0z6gNVCBhFZ0T2TPq2hZc0VjSlgwTG9S4slmEXh9fP6sIWKg==
X-Received: by 2002:a2e:b8c6:: with SMTP id s6mr1101564ljp.275.1611884963249;
        Thu, 28 Jan 2021 17:49:23 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 17/24] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Fri, 29 Jan 2021 03:48:45 +0200
Message-Id: <1611884932-1851-18-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces a helper the main purpose of which is to check
if a domain is using IOREQ server(s).

On Arm the current benefit is to avoid calling vcpu_ioreq_handle_completion()
(which implies iterating over all possible IOREQ servers anyway)
on every return in leave_hypervisor_to_guest() if there is no active
servers for the particular domain.
Also this helper will be used by one of the subsequent patches on Arm.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Paul Durrant <paul@xen.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - update patch description
   - guard helper with CONFIG_IOREQ_SERVER
   - remove "hvm" prefix
   - modify helper to just return d->arch.hvm.ioreq_server.nr_servers
   - put suitable ASSERT()s
   - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in set_ioreq_server()
   - remove d->ioreq_server.nr_servers = 0 from hvm_ioreq_init()

Changes V2 -> V3:
   - update patch description
   - remove ASSERT()s from the helper, add a comment
   - use #ifdef CONFIG_IOREQ_SERVER inside function body
   - use new ASSERT() construction in set_ioreq_server()

Changes V3 -> V4:
   - update patch description
   - drop per-domain variable "nr_servers"
   - reimplement a helper to count the non-NULL entries
   - make the helper out-of-line

Changes V4 -> V5:
   - add Stefano's and Paul's R-b

Changes V5 -> V6:
   - no changes

---
---
 xen/arch/arm/traps.c    | 15 +++++++++------
 xen/common/ioreq.c      | 16 ++++++++++++++++
 xen/include/xen/ioreq.h |  2 ++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index cb37a45..476900e 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2275,14 +2275,17 @@ static bool check_for_vcpu_work(void)
     struct vcpu *v = current;
 
 #ifdef CONFIG_IOREQ_SERVER
-    bool handled;
+    if ( domain_has_ioreq_server(v->domain) )
+    {
+        bool handled;
 
-    local_irq_enable();
-    handled = vcpu_ioreq_handle_completion(v);
-    local_irq_disable();
+        local_irq_enable();
+        handled = vcpu_ioreq_handle_completion(v);
+        local_irq_disable();
 
-    if ( !handled )
-        return true;
+        if ( !handled )
+            return true;
+    }
 #endif
 
     if ( likely(!v->arch.need_flush_to_ram) )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 07572a5..5b0f03e 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -80,6 +80,22 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
     return &p->vcpu_ioreq[v->vcpu_id];
 }
 
+/*
+ * This should only be used when d == current->domain or when they're
+ * distinct and d is paused. Otherwise the result is stale before
+ * the caller can inspect it.
+ */
+bool domain_has_ioreq_server(const struct domain *d)
+{
+    const struct ioreq_server *s;
+    unsigned int id;
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+        return true;
+
+    return false;
+}
+
 static struct ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
                                            struct ioreq_server **srvp)
 {
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 0b433e2..89ee171 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -83,6 +83,8 @@ static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
+bool domain_has_ioreq_server(const struct domain *d);
+
 bool vcpu_ioreq_pending(struct vcpu *v);
 bool vcpu_ioreq_handle_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
-- 
2.7.4


