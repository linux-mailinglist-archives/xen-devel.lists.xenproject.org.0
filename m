Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6198BC4B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808069.1219884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9E-0003SL-Qu; Tue, 01 Oct 2024 12:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808069.1219884; Tue, 01 Oct 2024 12:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9E-0003L6-Lq; Tue, 01 Oct 2024 12:38:36 +0000
Received: by outflank-mailman (input) for mailman id 808069;
 Tue, 01 Oct 2024 12:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9D-0002va-1i
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1186ec32-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:32 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c87853df28so6153650a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:32 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:30 -0700 (PDT)
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
X-Inumbo-ID: 1186ec32-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786311; x=1728391111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB02sToOMWoS+3+bvVBptWjoHbPyERDalpALvStk7iE=;
        b=C26rpQfH5gIZ6gzOlY/vAxSiFxOAwu9t2tAqKdVoQqAWCG81shbNyXSIuOuc/LhBDO
         agnwLrAiAU5AQ3FtoggFyG+zXSv1YKMnG3J5IuQkYDb43EWqV8wY1qgufm5rwl4ig1TE
         ub3ycllDRLekx/BIw46uQvgoyDKWE56yk0mXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786311; x=1728391111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB02sToOMWoS+3+bvVBptWjoHbPyERDalpALvStk7iE=;
        b=aU0/p8yTG7zKpUHGkeWzAFWqsWoZIfhn2ocgDhAsmj2lZ1bUGbKedkpIqow0gbThK+
         3rb1eUoOS8vzIvBJhbPfMEuOUk6y9ZQ6iZn1G/dn/+kGlfO97tEBCC7VerTUYclJ2WWq
         tYzb6G3/5VbZT/LOuuIeXbLbkWsQmaeqPSd9DpYL6cjYXZq0sszGtodpNfZrAM4ylu1Y
         6ywjEys9ac3oTbakS1m/qNvCjruWgdjv5r/jCymZQi2F52zQrVbGUCFKXRaMpZNW0ysj
         lmIHib+43l4X2wMOXjZ0nNBTnVbjBVoE0ac60Og7vtQrMC9YAZi479c52FDOdKOkAioe
         Wn3A==
X-Gm-Message-State: AOJu0YzI7TJ2wcNG7QcveW5g2t1cODf35fWC2p2aLl3K2JBFsYl7KBxM
	K00XQN9gV6S1eB3yR6PMxAXFryjT2WyRHqHBXERmVryBms4NGN8WhgWBh9NRqDKYgB4ScYIsArk
	u6+k=
X-Google-Smtp-Source: AGHT+IGO1GpmPkOQcfrmzXZzq9xBvb8Osa2Y450r5q4s9sfSXZx7bSEFH+ArJLFDVvvgsLXIky/HWQ==
X-Received: by 2002:a05:6402:26c8:b0:5c4:1320:e5a3 with SMTP id 4fb4d7f45d1cf-5c8824e7972mr14658094a12.16.1727786311392;
        Tue, 01 Oct 2024 05:38:31 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 02/11] x86/vlapic: Move lapic migration checks to the check hooks
Date: Tue,  1 Oct 2024 13:37:58 +0100
Message-ID: <20241001123807.605-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While doing this, factor out checks common to architectural and hidden
state.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
--
Last reviewed in the topology series v3. Fell under the cracks.

  https://lore.kernel.org/xen-devel/ZlhP11Vvk6c1Ix36@macbook/
---
 xen/arch/x86/hvm/vlapic.c | 84 ++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 992355e511cd..101902cff889 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1571,60 +1571,88 @@ static void lapic_load_fixup(struct vlapic *vlapic)
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
-        return -EINVAL;
+        ASSERT_UNREACHABLE();
 
     s->loaded.id = vlapic_get_reg(s, APIC_ID);
     s->loaded.ldr = vlapic_get_reg(s, APIC_LDR);
@@ -1641,9 +1669,9 @@ static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
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
2.46.0


