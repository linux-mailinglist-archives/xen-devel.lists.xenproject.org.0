Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DAB94BEAE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774176.1184688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Px-0004kb-Eg; Thu, 08 Aug 2024 13:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774176.1184688; Thu, 08 Aug 2024 13:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Px-0004hC-B8; Thu, 08 Aug 2024 13:43:01 +0000
Received: by outflank-mailman (input) for mailman id 774176;
 Thu, 08 Aug 2024 13:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Pv-0002jZ-Md
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:42:59 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fbddc41-558c-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:42:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso109161666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:42:59 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:42:57 -0700 (PDT)
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
X-Inumbo-ID: 1fbddc41-558c-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124578; x=1723729378; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m48u/GdGc4dt8JDS23gHEKeM1ld2/77KdzYrt97Of94=;
        b=HxiR+QXllcTe5SIve620DTPQeoj6qR1AByWMbw3BtkhNytI6lr4VhjpkwnmnUeNfSg
         Xmkhw8imHXrdia9/m7AqcPN0gX1KfEvtskIbKkr9GhxqZF8pWXE/B34t/PfvUxYSh5g/
         PG+bmFoxs1SzQB8QLXlmuOtWGg3moSzjA2LSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124578; x=1723729378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m48u/GdGc4dt8JDS23gHEKeM1ld2/77KdzYrt97Of94=;
        b=Wo6LGSmRL5f/dLI+8JEbkbPaCtCFEstVESEeQric1OIn/q2F13V/gWS7hkyICL13ah
         rSlEIvkvo9TxG5ykGlrVBTT6BoMwvWcIzYzTN0EC5av4NvYh/KjCDgQTT4EeitWRMvGx
         +qTFs6uNfaRk+YKAdmpc3Nw8c6qFcThUAxtYvwDqT+J4PmJfpmxcK1+6VWlO4g1c/i1z
         dY2XHjDKXZNojqVQIP7TbE1MxZEblfU/2/A02be1WOYv9u9gLKodryo8ON/TxnSNsDrM
         j3Vd02iM30iu99nHCVMZUjKsp72mBbYmSwJmII2psuHN6KyTpdJsQPsZnoCFF9sg9J8E
         4tuw==
X-Gm-Message-State: AOJu0YyGjuCBaYIEYWB+CCbXdkixJYlNVg1jiUBYwD4965G17HcfGZPU
	oXy+ZV28LSsOJCuVO2OvMoq1mHwrcCPAeRDBje3ZMp351x0omAZM2wjrLEUqDVpo/XTLyx1bHKF
	0
X-Google-Smtp-Source: AGHT+IG5xlBgPWGBV+bvZoU3GFLz+ML1HJ9O5ctJOBxa+Plc/GHfcNRz8omRfI6Vg1lzm2pP9h5rSg==
X-Received: by 2002:a17:907:7f88:b0:a72:7fea:5800 with SMTP id a640c23a62f3a-a8090ee36e5mr157675166b.63.1723124578171;
        Thu, 08 Aug 2024 06:42:58 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 02/10] x86/vlapic: Move lapic migration checks to the check hooks
Date: Thu,  8 Aug 2024 14:42:42 +0100
Message-ID: <20240808134251.29995-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While doing this, factor out checks common to architectural and hidden
state.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5:
  * No change
---
 xen/arch/x86/hvm/vlapic.c | 81 +++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 2ec95942713e..521b98988be9 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1554,60 +1554,85 @@ static void lapic_load_fixup(struct vlapic *vlapic)
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
+        ASSERT_UNREACHABLE();
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
+        ASSERT_UNREACHABLE();
 
     s->loaded.id = vlapic_get_reg(s, APIC_ID);
     s->loaded.ldr = vlapic_get_reg(s, APIC_LDR);
@@ -1624,9 +1649,9 @@ static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
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
2.45.2


