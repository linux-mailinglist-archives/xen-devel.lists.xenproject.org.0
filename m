Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D9918758
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749270.1157311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVl-000669-9p; Wed, 26 Jun 2024 16:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749270.1157311; Wed, 26 Jun 2024 16:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVl-00061q-5A; Wed, 26 Jun 2024 16:28:45 +0000
Received: by outflank-mailman (input) for mailman id 749270;
 Wed, 26 Jun 2024 16:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVk-0005pK-0t
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26804efe-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:42 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7194ce90afso570376166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:42 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:40 -0700 (PDT)
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
X-Inumbo-ID: 26804efe-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419321; x=1720024121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsReVAeUjwha0aJ48SN5/6FToZpj38HQfON50NxdYE0=;
        b=G49dRa14RDgt4uNpwBdbXEC5Sm101BrenmgMQQgmobHltitg/A8Wr6+aJzhl5SNoX6
         Tgu0b2gYm69xETNMg8RU+ZY9rjt07VycDw2YMHMxBtICPPlabakoX8YMueLqAD5IDN21
         ttPWSBvSTMdLhfn0P8ZAIGZOsBTcC+ZzIOBiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419321; x=1720024121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsReVAeUjwha0aJ48SN5/6FToZpj38HQfON50NxdYE0=;
        b=BttpK94NaD+LNP2PpUE33zz8gG8LxEEVs32EoNSE0ISv19HOVHj9KxJi598XlenHTx
         tGGq4vU9QQXVvk9sc/zFMndaHktAe6WFwzZmhYmrKcNXqPPL6CXmqfugxEjL+6brnC+C
         2wOckidUgXdv7gu9rs9p5NsxU5vDNLAiq2vkd3j3b9Jr+geCtpvW4y2WzO94XMUPkFeP
         tmdo6rqOTsJvCXJRlowfsPLhvKOVRaLU5KkUWOASqP70DVOecBifljn12YrT52xX8CQJ
         dwFMJMmR2ve0lsOU0rAk9xhJXFMiJXXOvN5+PeE4M/X91W/p1iKWfSkZovX95lCFL49c
         31eA==
X-Gm-Message-State: AOJu0Yzv5XsUMKkjC7wygGWiKm7+GoiuSRb1iu+C79IxYg/IveH3oEJN
	4ilsX//H3RMmaKCf3UIGeu0Ozrot/6dcZFEuiUd6StQbY9psQ/iSDeyuxy/V/Z8BHKsLX3tvcfm
	WQz0=
X-Google-Smtp-Source: AGHT+IHCZu3RrV7SRUnu1c4M4htC2NGSpi5ANIL/1I0tyNvDVlF5ERgDnwZW3Gzmg/CNckHZIaIl6Q==
X-Received: by 2002:a17:907:cbc2:b0:a72:7d5c:ace0 with SMTP id a640c23a62f3a-a727d5cae14mr293649566b.11.1719419321136;
        Wed, 26 Jun 2024 09:28:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for 4.19 v4 02/10] x86/vlapic: Move lapic migration checks to the check hooks
Date: Wed, 26 Jun 2024 17:28:29 +0100
Message-Id: <b4e82173268e21480f9657f7457080d9fa9e310c.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While doing this, factor out checks common to architectural and hidden state.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
This puts essential LAPIC information in the stream. It's technically a feature
but it makes 4.19 guests a lot more future-proof. I think this should go on 4.19

v4:
  * Replaced BUG() with ASSERT_UNREACHABLE(), and allow ret -EINVAL on release.
  * Adjust printk() to be clearer
  * Assign lapic_check_common() outside the "if" condition.
---
 xen/arch/x86/hvm/vlapic.c | 85 ++++++++++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 9cfc82666ae5..1a7bca5afd2f 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1553,60 +1553,91 @@ static void lapic_load_fixup(struct vlapic *vlapic)
                v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
 }
 
-static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
-{
-    unsigned int vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
-    struct vlapic *s;
 
+static int lapic_check_common(const struct domain *d, unsigned int vcpuid)
+{
     if ( !has_vlapic(d) )
         return -ENODEV;
 
     /* Which vlapic to load? */
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !domain_vcpu(d, vcpuid) )
     {
-        dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
+        dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vCPU %u\n",
                 d->domain_id, vcpuid);
         return -EINVAL;
     }
-    s = vcpu_vlapic(v);
+
+    return 0;
+}
+
+static int cf_check lapic_check_hidden(const struct domain *d,
+                                       hvm_domain_context_t *h)
+{
+    unsigned int vcpuid = hvm_load_instance(h);
+    struct hvm_hw_lapic s;
+    int rc = lapic_check_common(d, vcpuid);
+
+    if ( rc )
+        return rc;
+
+    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) != 0 )
+        return -ENODATA;
+
+    /* EN=0 with EXTD=1 is illegal */
+    if ( (s.apic_base_msr & (APIC_BASE_ENABLE | APIC_BASE_EXTD)) ==
+         APIC_BASE_EXTD )
+        return -EINVAL;
+
+    return 0;
+}
+
+static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int vcpuid = hvm_load_instance(h);
+    struct vcpu *v = d->vcpu[vcpuid];
+    struct vlapic *s = vcpu_vlapic(v);
 
     if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
+    {
+        ASSERT_UNREACHABLE();
         return -EINVAL;
+    }
 
     s->loaded.hw = 1;
     if ( s->loaded.regs )
         lapic_load_fixup(s);
 
-    if ( !(s->hw.apic_base_msr & APIC_BASE_ENABLE) &&
-         unlikely(vlapic_x2apic_mode(s)) )
-        return -EINVAL;
-
     hvm_update_vlapic_mode(v);
 
     return 0;
 }
 
-static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
+static int cf_check lapic_check_regs(const struct domain *d,
+                                     hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
-    struct vlapic *s;
+    int rc;
 
-    if ( !has_vlapic(d) )
-        return -ENODEV;
+    if ( (rc = lapic_check_common(d, vcpuid)) )
+        return rc;
 
-    /* Which vlapic to load? */
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
-    {
-        dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
-                d->domain_id, vcpuid);
-        return -EINVAL;
-    }
-    s = vcpu_vlapic(v);
+    if ( !hvm_get_entry(LAPIC_REGS, h) )
+        return -ENODATA;
+
+    return 0;
+}
+
+static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int vcpuid = hvm_load_instance(h);
+    struct vcpu *v = d->vcpu[vcpuid];
+    struct vlapic *s = vcpu_vlapic(v);
 
     if ( hvm_load_entry(LAPIC_REGS, h, s->regs) != 0 )
+    {
+        ASSERT_UNREACHABLE();
         return -EINVAL;
+    }
 
     s->loaded.id = vlapic_get_reg(s, APIC_ID);
     s->loaded.ldr = vlapic_get_reg(s, APIC_LDR);
@@ -1623,9 +1654,9 @@ static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, NULL,
+HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, lapic_check_hidden,
                           lapic_load_hidden, 1, HVMSR_PER_VCPU);
-HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs, NULL,
+HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs, lapic_check_regs,
                           lapic_load_regs, 1, HVMSR_PER_VCPU);
 
 int vlapic_init(struct vcpu *v)
-- 
2.34.1


