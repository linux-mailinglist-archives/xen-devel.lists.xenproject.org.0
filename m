Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAE4302B5C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74349.133648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47P6-00027H-0S; Mon, 25 Jan 2021 19:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74349.133648; Mon, 25 Jan 2021 19:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47P5-00026n-Q7; Mon, 25 Jan 2021 19:19:59 +0000
Received: by outflank-mailman (input) for mailman id 74349;
 Mon, 25 Jan 2021 19:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47Fp-0008N7-IV
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:10:25 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82ac12d1-e0c8-431d-9c79-6bb92b3af79a;
 Mon, 25 Jan 2021 19:09:12 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id i9so561369wmq.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:11 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:10 -0800 (PST)
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
X-Inumbo-ID: 82ac12d1-e0c8-431d-9c79-6bb92b3af79a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=40mdufwi456sOAvEGGJAfww9prSnsvb2RITUqz5aqvQ=;
        b=LTDketEEaOUlxBeDbQvhfdqx2EGE5X723UzuEsQPvowoSn7yWYLonQ/QTiAPmv7t6i
         7ntKYatrlFvtmeU5HoGHR4pI0r6kuOboENd3Qu9UiiMesbWprr4KHEDTWePS06Jj4+a5
         Jb1ysiNcbJgpopKarFa8Zzv1yzalCSTlbRg8kJ2VvgcAfS+QsWxMchS4METbiYxHzKFM
         jYXG3olMzqBZU2ww4bKNzHmbBhsnti41Ouiz21ndIm73QTaC5hM6/3CTiCxfTbxD4Yxa
         pmti0h78Gu7/TiFYiG0Pdutrb0neklTHJAqNfTwhuIH2WsIUBYnxNk5PSLe5GBV91sNA
         rxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=40mdufwi456sOAvEGGJAfww9prSnsvb2RITUqz5aqvQ=;
        b=BgHQV2BYKJegjWEacc9QGh8CGm4IEadPaFul8QKDCKTeDLJDT9Th4Pa+Np9LZJAkjh
         9Cc9UW0p/Dovq+oUontxictcI207t3qMKRuhrK4QEoKE4G9EWihSeG1IGW8eg9+durAV
         L5jzlePJmmb9Kbe9/ZC46WCjkQ6FMedzlqGDEtWeVVxdZrYFlrEIrRSFkmHAQGGewZ4R
         rgQnj4Yyl4YcXNIKtaSSJaMFQAjUv+1zTHzigp1noqrvpFGFJwwi5DM1AK+eSUwalOyB
         AfMsmQGEkePKFKt9oGLrm482CjWrxxdzFC//45iI3C8Jbor4GkAwaup07Fcex6KvMQZb
         fVaQ==
X-Gm-Message-State: AOAM533M1QeaPQBvkzya5wfRtxVXtrR2dyvYwGXZdNlzZ+KtpAOgsedf
	94v1dTMP6V55EQgByXsXAb7GiNkRlJz/eg==
X-Google-Smtp-Source: ABdhPJyC20Bu0VXZpG/L4U6pzWaBuR/eBS9UfA3ZYfw6wRr8mjrSTsSfebjSNqqjX6IMIFbXzyueDg==
X-Received: by 2002:a1c:b7d6:: with SMTP id h205mr1468426wmf.182.1611601751070;
        Mon, 25 Jan 2021 11:09:11 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 17/22] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Mon, 25 Jan 2021 21:08:24 +0200
Message-Id: <1611601709-28361-18-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

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

---
---
 xen/arch/arm/traps.c    | 15 +++++++++------
 xen/common/ioreq.c      | 16 ++++++++++++++++
 xen/include/xen/ioreq.h |  2 ++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 2039ff5..4cdd343 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2267,14 +2267,17 @@ static bool check_for_vcpu_work(void)
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


