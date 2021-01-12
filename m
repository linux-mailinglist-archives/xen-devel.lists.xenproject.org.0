Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911CD2F3BFF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66073.117232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgl-0003ZZ-VB; Tue, 12 Jan 2021 21:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66073.117232; Tue, 12 Jan 2021 21:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgl-0003Yk-RV; Tue, 12 Jan 2021 21:58:55 +0000
Received: by outflank-mailman (input) for mailman id 66073;
 Tue, 12 Jan 2021 21:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRcj-0002PK-Ik
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:54:45 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4b63d93-25e6-437e-b459-e0880ef941a4;
 Tue, 12 Jan 2021 21:53:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i9so22270wrc.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:11 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:10 -0800 (PST)
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
X-Inumbo-ID: a4b63d93-25e6-437e-b459-e0880ef941a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4gV1F/7iWkG+qIxLslLKVNePdnGToVQ3S9ee1k+suSE=;
        b=VQNaOAI0D9Al/JYCJ/M+E8Vk7qpGkmtmIbHy9cv4NrB/21nCn4ce0AWcr3PSMDbyDB
         mOzYnOEFtJMm14QcPlTzYS438qS0JgV4D413m7qTnGp252f03xJlAiv0+yXSWJccq0Rz
         DX+cOJArZyjKLDzQFMvThYUGqc2G5kcwU2hc7OKhswI5GPAZ8FjXqQOoqIen1v6j6A1F
         rLCB8b6Kyw8mUSHLFjXbB1II+ZEAnWoAasFX4mVIkvbo6cMDT8oR/wIuXb+CpOgdLoZT
         Wjo05J3T+ELrpdtbt15iFAYo2ZMNQ0uY9gzauXhh8+Ik0u6h0YhDEC7M/2yfq1tEKSxt
         9rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4gV1F/7iWkG+qIxLslLKVNePdnGToVQ3S9ee1k+suSE=;
        b=HAA+6OzNEDcWdGre5z65KZ0zrGY4oVwE+xC5zD268kJpJkOz2TVYDhclNQPj3wj4y7
         iurI3BPAg/xdyFaXNMmklMjn9nvjV1KED1PrEalk7OAxqcGOMqhmx7UiE5Nimlfh3OGE
         okBoMQha6JEu11nbrWpstwoZqsAtcKnzm+Ln7zjtvNIVbiteRKltRq2OZYv7Cy8d/Jlk
         E/OnNCxlsSr8lpP3dFCPJLCMH69dfCKw7foFh63hr+WHvZn7wKvx5P/PK09jXbgdmHCS
         oJpD0j5jtpYcGrYxtHmmeVxX5nPz/SFo3/rhO7mH2wkwCeLAq0MxEz5X9G4S3s+H9cht
         OiZw==
X-Gm-Message-State: AOAM5327E/ue8ROv5Gi48e27q21z/lRyNw5QW0cWfBjjbw5gJN6mqhHh
	Z0iALEqVpBeTR96PyKKGsHhMLR8jpjsnew==
X-Google-Smtp-Source: ABdhPJykC8uvoHTbSy7OQGfg+bnoBoG3kuupl+GfMjGsUKUEPCvBWFILb+w5JbykKR0cb7oIyjFkSQ==
X-Received: by 2002:a5d:56c3:: with SMTP id m3mr774837wrw.419.1610488391081;
        Tue, 12 Jan 2021 13:53:11 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 17/24] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Tue, 12 Jan 2021 23:52:25 +0200
Message-Id: <1610488352-18494-18-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

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
---
 xen/arch/arm/traps.c    | 15 +++++++++------
 xen/common/ioreq.c      | 16 ++++++++++++++++
 xen/include/xen/ioreq.h |  2 ++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 4a83e1e..35094d8 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2262,14 +2262,17 @@ static bool check_for_vcpu_work(void)
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
index d5f4dd3..59f4990 100644
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
index ec7e98d..f0908af 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -81,6 +81,8 @@ static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
+bool domain_has_ioreq_server(const struct domain *d);
+
 bool vcpu_ioreq_pending(struct vcpu *v);
 bool vcpu_ioreq_handle_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
-- 
2.7.4


