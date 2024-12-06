Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E59E668D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849691.1264297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQOi-0005sv-EZ; Fri, 06 Dec 2024 04:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849691.1264297; Fri, 06 Dec 2024 04:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQOi-0005qo-Bf; Fri, 06 Dec 2024 04:57:00 +0000
Received: by outflank-mailman (input) for mailman id 849691;
 Fri, 06 Dec 2024 04:56:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA7-0004Ka-Nh
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 644bfbde-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A52EF5C732E;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 474BEC4CEDD;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6D9E77175;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 644bfbde-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=WDr/PwUo7NPVqK8vVCu/sN3ApYHaNVXqHBFVutTjEsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g9qa65XgT5Ti4I/dt0zAvh88VVZ8gYPwjf1RlnWBD6k0hqV7efZ2HqXdNt1syG6Gs
	 Uzio9wCFBAMxJSwgLQ633VtFVqKBKw5sdipxVH4KpcjxT6bgmioK9u/cPVyOFt1axG
	 0+L8CcziOT19Rf4F37f8A3yxU49YxRNdKfn2EbGCHtn00nEDiUPFWcp02do6FsDUu8
	 w0/Pmv8IbSkCJCmvFBJF0gXjinqNcIt4+0yLnkwokU9vYCkurq6yGDxPlLfV+Oas6X
	 KM7DVGtHII2LbcdmOKDJ2VkdUHASud+eWqsDXQtwK2s2dbo/gmA/sGH/2Ez7FKoU3O
	 SW53fiVi2h/yQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:42:00 -0800
Subject: [PATCH v2 30/35] x86/hvm: add helpers for raising guest IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-30-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=1876;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=7BbjWtYddozrVOKtAkZI0QGQoqm6ofyyNdgxey+37YU=;
 b=uhL0RGFLhulzxy34cTyyqujnBOZL+ZBS9SzwALgDFSK48UaqsfdXhwT9z9YUX31hMSipGTyQr
 NaKRK096AcJApdMQnckrIdCUs36HPCgT/O+UwoSDG/wyfSUkq8syezC
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Added convenience wrappers for asserting/de-asserting interrupts in the
hardware emulation code.

That will be used for PCI-based NS8250 emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/irq.c             | 24 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/irq.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 1eab44defca4c82ec35769617c66c380cc07d1b6..9e3a50d21dcf281c1015116094e47795c51ed5d0 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -242,6 +242,30 @@ void hvm_isa_irq_deassert(
     spin_unlock(&d->arch.hvm.irq_lock);
 }
 
+void hvm_irq_raise(struct domain *d, unsigned int irq)
+{
+    if ( irq < NR_ISAIRQS )
+    {
+        hvm_isa_irq_assert(d, irq, NULL);
+    }
+    else
+    {
+        hvm_gsi_assert(d, irq);
+    }
+}
+
+void hvm_irq_lower(struct domain *d, unsigned int irq)
+{
+    if ( irq < NR_ISAIRQS )
+    {
+        hvm_isa_irq_deassert(d, irq);
+    }
+    else
+    {
+        hvm_gsi_deassert(d, irq);
+    }
+}
+
 static void hvm_set_callback_irq_level(struct vcpu *v)
 {
     struct domain *d = v->domain;
diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
index 87e89993a44f48f366fa84e851688f383cb562d4..27bb9f64171c1b8aac2cf119699e60c91e727177 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -210,6 +210,9 @@ void hvm_maybe_deassert_evtchn_irq(void);
 void hvm_assert_evtchn_irq(struct vcpu *v);
 void hvm_set_callback_via(struct domain *d, uint64_t via);
 
+void hvm_irq_raise(struct domain *d, unsigned int irq);
+void hvm_irq_lower(struct domain *d, unsigned int irq);
+
 struct pirq;
 bool hvm_domain_use_pirq(const struct domain *d, const struct pirq *pirq);
 

-- 
2.34.1



