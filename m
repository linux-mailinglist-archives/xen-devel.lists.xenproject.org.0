Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF708D394D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732084.1137927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMB-0000ns-SF; Wed, 29 May 2024 14:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732084.1137927; Wed, 29 May 2024 14:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMB-0000lM-NV; Wed, 29 May 2024 14:32:47 +0000
Received: by outflank-mailman (input) for mailman id 732084;
 Wed, 29 May 2024 14:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKMA-0000Tu-6P
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:32:46 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fceb73a-1dc8-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:32:44 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e95a74d51fso4463131fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:32:44 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a647b827400sm74614166b.69.2024.05.29.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:32:41 -0700 (PDT)
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
X-Inumbo-ID: 4fceb73a-1dc8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993163; x=1717597963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ0Z2MuZPai5+x8nYCnYhzQNJt6RhMWelwC5TWM5Ogs=;
        b=Cp8KFdxIfSXTeR3eYrG/dK5Z5vA92t89293nTSOlIEcgjvoenjQbdUY3S+TQOzyj5J
         ViDO4tT9JaODmNi8AOllIwSi74+v9GuJC9BR7nm2iTjwgkNvOWUGtsURj5gEwRQ4rOzh
         ls8z6EcQ/W/5dm639oxBD2Ax2Yuqup/GqMM9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993163; x=1717597963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQ0Z2MuZPai5+x8nYCnYhzQNJt6RhMWelwC5TWM5Ogs=;
        b=lVyqGRGt8P9gw8JFXBHV+HUvZaeOzAv+UYnqMiQEHZTaYOXdJAmqHo3TRbrY8/IVkW
         Exbf044EQD4T3FdS3e1r3CvTpex8SJ0E5P9DzyHTk2tjz88Avwj96NeSVEW9iaEnJ6Lm
         ut+M7lI0LdJg5iKBhbzcFRkCuku3GeqQ6IwSMoaT7w/EjHgpeHq+N6Q0axNR9ouna59n
         kyYnXCa6yWQtw0IFRqm0JmLfRPbrgbi9VfrAx/kNAbjA11hdrbzK+vR38JTrrtQTtkvR
         t1l2o3o9BTDcRW5ZCI4xgTxOywRIxQlok2kNIqG7cIeuQ262FpWJUV1ItOOLbpKvsOdQ
         aH5g==
X-Gm-Message-State: AOJu0YzYet9Zbjb5hCRTfK2W+Ha5xo6UboGxHGd48QNdvVQFVyp+Zun9
	QVyzSGZjjII/pb9J8Ryv6kwta7UTBHd4Z/5rZ9FCS+HOIYORBp42/c3ZDZ73SxzmeY1hx9ojI7T
	U
X-Google-Smtp-Source: AGHT+IHDUsIhMRGeVQpyBeVL9vJxvadAtJqOlw/C7yhkmpleEPvJsfTSGOUs7kr2FkkLuVGGYY6P2Q==
X-Received: by 2002:a05:6512:23a0:b0:529:be5c:8de0 with SMTP id 2adb3069b0e04-529be5c8f07mr4543915e87.49.1716993162398;
        Wed, 29 May 2024 07:32:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/6] x86/vlapic: Move lapic migration checks to the check hooks
Date: Wed, 29 May 2024 15:32:30 +0100
Message-Id: <f87f27de6fadf896bf4d50c8a37e2b9b7201afb2.1716976271.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716976271.git.alejandro.vallejo@cloud.com>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While doing this, factor out checks common to architectural and hidden state.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Moved from v2/patch3.
  * Added check hook for the architectural state as well.
  * Use domain_vcpu() rather than the previous open coded checks for vcpu range.
---
 xen/arch/x86/hvm/vlapic.c | 81 +++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 9cfc82666ae5..a0df62b5ec0a 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1553,60 +1553,85 @@ static void lapic_load_fixup(struct vlapic *vlapic)
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
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
                 d->domain_id, vcpuid);
         return -EINVAL;
     }
-    s = vcpu_vlapic(v);
 
-    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
+    return 0;
+}
+
+static int cf_check lapic_check_hidden(const struct domain *d,
+                                       hvm_domain_context_t *h)
+{
+    unsigned int vcpuid = hvm_load_instance(h);
+    struct hvm_hw_lapic s;
+    int rc;
+
+    if ( (rc = lapic_check_common(d, vcpuid)) )
+        return rc;
+
+    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) != 0 )
+        return -ENODATA;
+
+    /* EN=0 with EXTD=1 is illegal */
+    if ( (s.apic_base_msr & (APIC_BASE_ENABLE | APIC_BASE_EXTD)) ==
+         APIC_BASE_EXTD )
         return -EINVAL;
 
+    return 0;
+}
+
+static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int vcpuid = hvm_load_instance(h);
+    struct vcpu *v = d->vcpu[vcpuid];
+    struct vlapic *s = vcpu_vlapic(v);
+
+    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
+        BUG();
+
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
+        BUG();
 
     s->loaded.id = vlapic_get_reg(s, APIC_ID);
     s->loaded.ldr = vlapic_get_reg(s, APIC_LDR);
@@ -1623,9 +1648,9 @@ static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
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


