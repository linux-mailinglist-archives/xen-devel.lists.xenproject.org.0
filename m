Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369398BC4A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808068.1219877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9E-0003I0-BD; Tue, 01 Oct 2024 12:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808068.1219877; Tue, 01 Oct 2024 12:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9E-0003Co-5V; Tue, 01 Oct 2024 12:38:36 +0000
Received: by outflank-mailman (input) for mailman id 808068;
 Tue, 01 Oct 2024 12:38:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9C-0002vk-DU
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:34 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11da5997-7ff2-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 14:38:33 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c88c9e45c2so4808893a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:33 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:31 -0700 (PDT)
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
X-Inumbo-ID: 11da5997-7ff2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786312; x=1728391112; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D90t4YTJEGwdBnk8XSsABj6XnnDwF6CKUln1kNou/II=;
        b=hVDnUuSiS1c4cthZvqqIznEOGXf4QGMTY1zw0NpGLEoHXax0shQYClQHCVrU1TGV8S
         l0aOAXh7Ou/LAjUh7kDpyilFBiDUL4glmqK4A50SJK4m5hQ/ytpGYuue4dUGC9wJfYag
         S55jIESnsQMb/7wygt9dvlAOlVvhrPckST42I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786312; x=1728391112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D90t4YTJEGwdBnk8XSsABj6XnnDwF6CKUln1kNou/II=;
        b=pOPbnOq9VD+x90NdGlkyDTKTX2Ss71MKoew+0bVCdiF1GJ2xmQWTpcnGOtv7E6zWF3
         1eBx8qJSWLJmAroSY8wcRmxItkCd3sB4l+ZezlucaAdKAJHYbifnU9yrDCqCNsGEHbkH
         yDyGacHVvggbH5XR71syS2pQiv0njE0WSbXkWlGUadyZ3V+ydmcclWUpZ6ezDTWgq24I
         3I7XaGv2O5WlUDfU4YZJDgRuMnXgUJUKHU3TXoNCAa+8yPxM6gQTlIxxwd9aDubFBSVI
         QoSjmPEbKWDAAyOvQZVYRMDcuf1gZmiMhgOsY7YT5rK6hu6ZCJXXzhL+3Yne2jm3C88h
         4dCg==
X-Gm-Message-State: AOJu0YyZMzAVDbB8zWQRYms7fvbYW4AYwY1a8wp+j//Gs7VUqQ83FAQf
	AyCE/KKpF4xCocp5G5jdieR4i42MWRD1AaI59bsv2uQgWjaOlvuMhPhrt95Gr8JFwGzAJXqJhZS
	M5Ug=
X-Google-Smtp-Source: AGHT+IGBNNwmvNBx4ZTClnC8czS1nkcnS+4eIgXWGX+u53rZMl9rdxum7DUhCOTHoUuAEXC+gEHh3g==
X-Received: by 2002:a05:6402:3507:b0:5c8:9f3e:5efc with SMTP id 4fb4d7f45d1cf-5c8a2a04200mr3054439a12.6.1727786312168;
        Tue, 01 Oct 2024 05:38:32 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 03/11] xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
Date: Tue,  1 Oct 2024 13:37:59 +0100
Message-ID: <20241001123807.605-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the initial x2APIC ID to be sent on the migration stream.
This allows further changes to topology and APIC ID assignment without
breaking existing hosts. Given the vlapic data is zero-extended on
restore, fix up migrations from hosts without the field by setting it to
the old convention if zero.

The hardcoded mapping x2apic_id=2*vcpu_id is kept for the time being,
but it's meant to be overriden by toolstack on a later patch with
appropriate values.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/cpuid.c                   | 14 +++++---------
 xen/arch/x86/hvm/vlapic.c              | 22 ++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vlapic.h  |  1 +
 xen/include/public/arch-x86/hvm/save.h |  2 ++
 4 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 2a777436ee27..dcbdeabadce9 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -138,10 +138,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         const struct cpu_user_regs *regs;
 
     case 0x1:
-        /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
         if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+            res->b |= vlapic_x2apic_id(vcpu_vlapic(v)) << 24;
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -311,18 +310,15 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0xb:
         /*
-         * In principle, this leaf is Intel-only.  In practice, it is tightly
-         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
-         * to guests on AMD hardware as well.
-         *
-         * TODO: Rework topology logic.
+         * Don't expose topology information to PV guests. Exposed on HVM
+         * along with x2APIC because they are tightly coupled.
          */
-        if ( p->basic.x2apic )
+        if ( is_hvm_domain(d) && p->basic.x2apic )
         {
             *(uint8_t *)&res->c = subleaf;
 
             /* Fix the x2APIC identifier. */
-            res->d = v->vcpu_id * 2;
+            res->d = vlapic_x2apic_id(vcpu_vlapic(v));
         }
         break;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 101902cff889..02570f9dd63a 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1090,7 +1090,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
 static void set_x2apic_id(struct vlapic *vlapic)
 {
     const struct vcpu *v = vlapic_vcpu(vlapic);
-    uint32_t apic_id = v->vcpu_id * 2;
+    uint32_t apic_id = vlapic->hw.x2apic_id;
     uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
 
     /*
@@ -1470,7 +1470,7 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
     vlapic_do_init(vlapic);
 }
 
@@ -1538,6 +1538,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
     const struct vcpu *v = vlapic_vcpu(vlapic);
     uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
 
+    /*
+     * Loading record without hw.x2apic_id in the save stream, calculate using
+     * the traditional "vcpu_id * 2" relation. There's an implicit assumption
+     * that vCPU0 always has x2APIC0, which is true for the old relation, and
+     * still holds under the new x2APIC generation algorithm. While that case
+     * goes through the conditional it's benign because it still maps to zero.
+     */
+    if ( !vlapic->hw.x2apic_id )
+        vlapic->hw.x2apic_id = v->vcpu_id * 2;
+
     /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
     if ( !vlapic_x2apic_mode(vlapic) ||
          (vlapic->loaded.ldr == good_ldr) )
@@ -1606,6 +1616,13 @@ static int cf_check lapic_check_hidden(const struct domain *d,
          APIC_BASE_EXTD )
         return -EINVAL;
 
+    /*
+     * Fail migrations from newer versions of Xen where
+     * rsvd_zero is interpreted as something else.
+     */
+    if ( s.rsvd_zero )
+        return -EINVAL;
+
     return 0;
 }
 
@@ -1687,6 +1704,7 @@ int vlapic_init(struct vcpu *v)
     }
 
     vlapic->pt.source = PTSRC_lapic;
+    vlapic->hw.x2apic_id = 2 * v->vcpu_id;
 
     vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
     if ( !vlapic->regs_page )
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 2c4ff94ae7a8..85c4a236b9f6 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -44,6 +44,7 @@
 #define vlapic_xapic_mode(vlapic)                               \
     (!vlapic_hw_disabled(vlapic) && \
      !((vlapic)->hw.apic_base_msr & APIC_BASE_EXTD))
+#define vlapic_x2apic_id(vlapic) ((vlapic)->hw.x2apic_id)
 
 /*
  * Generic APIC bitmap vector update & search routines.
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde165..1c2ec669ffc9 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -394,6 +394,8 @@ struct hvm_hw_lapic {
     uint32_t             disabled; /* VLAPIC_xx_DISABLED */
     uint32_t             timer_divisor;
     uint64_t             tdt_msr;
+    uint32_t             x2apic_id;
+    uint32_t             rsvd_zero;
 };
 
 DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
-- 
2.46.0


