Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8F91875B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749271.1157327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVm-0006Za-EG; Wed, 26 Jun 2024 16:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749271.1157327; Wed, 26 Jun 2024 16:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVm-0006Xo-BM; Wed, 26 Jun 2024 16:28:46 +0000
Received: by outflank-mailman (input) for mailman id 749271;
 Wed, 26 Jun 2024 16:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVl-0005pK-1C
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2708ca72-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:43 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f8ebbd268so142352466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:43 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:41 -0700 (PDT)
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
X-Inumbo-ID: 2708ca72-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419322; x=1720024122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/arT7jrgNzKbHjKJBGTvYB0vtdlsaxsy4yOtpT+pfjQ=;
        b=UaVUiPbr2JgDxbWB/dK1VFuXZECS0y7X3GUMPyuIVgAQaJRy7XawYE+pfvWnXkDJve
         ngJzX1p1wJjMfpD0Fyn36iKjQAeCiHRQCyReBcsDSgraigbabx9LjLBMzIAxKQ7wnijU
         J6W1SL2vXDaznYRFF93QMKXAc4fABuCbZr+UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419322; x=1720024122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/arT7jrgNzKbHjKJBGTvYB0vtdlsaxsy4yOtpT+pfjQ=;
        b=vRUYXAlcGwYhjfiZZhda3ISamo1Zyz8vRD334FuLFWJ6tIelXtc4gxNjlcjYKUC4aX
         90gG8rBw5DFuaj8i1TO1jrP1KhZXNWXl64kdiJgeV+6DgZSOWNM56A6wGOdVQIkqQCMY
         Xia0D4NsAYtJ6BRrQ504TWY1dBc+DELsD2bT9slEy1cOzDGJics6kdXjX60XWIl9e3+5
         jbJkRPOYqp91OM6K9Qa9HV0C4+ZOCNgjbKonztUF6Lr10vAGWYxuU5vCPly9NLds4T/T
         OVHzqQnNOMtGIsYvU9u5wIyI/kjlfccAIY2EynjMZcRZefZGZh5jwYrcb0QV2Y4VwldF
         xZvg==
X-Gm-Message-State: AOJu0YzT9btL1oq81pDHrYkUuJ+hEHTuNcbvBDRrbgTIye+fGoLjzCsx
	vEZSk1jWikmSOnShHKjM2rLDazYtYyDSLDKOvNNSn3CYHiPDLe/gUAjnYYANC1vNJ6F3S4mMymo
	EtGc=
X-Google-Smtp-Source: AGHT+IHkphF+PpBgLaj8v7JiBBQGt/9/WfXJ5n0pdihowoSgcBiOCYQPdv1UTqbLZ2PaPIjiH/NwKA==
X-Received: by 2002:a17:906:b54:b0:a72:5a0d:4831 with SMTP id a640c23a62f3a-a7296f809cfmr7910966b.23.1719419322071;
        Wed, 26 Jun 2024 09:28:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v4 03/10] xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
Date: Wed, 26 Jun 2024 17:28:30 +0100
Message-Id: <5beadf9d7997ed2df1a7c28cc2f0c5583ca7f7a3.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the initial x2APIC ID to be sent on the migration stream. This
allows further changes to topology and APIC ID assignment without breaking
existing hosts. Given the vlapic data is zero-extended on restore, fix up
migrations from hosts without the field by setting it to the old convention if
zero.

The hardcoded mapping x2apic_id=2*vcpu_id is kept for the time being, but it's
meant to be overriden by toolstack on a later patch with appropriate values.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Same rationale as previous patch for inclusion in 4.19

Roger replied to v3 with an R-by for this patch. I didn't add it here because
the patch has seen substantial changes and it's probably worth looking at again

All changes are removals. In particular...

v4:
  * Removed hooks into cpu policy update events. They are no longer relevant.
  * Remove the derivation (within Xen) of x2apic_id from vcpu_id via lib/x86.
    * Rearranged for toolstack to provide those on hvmcontext blobs on a later
      patch. This still works out because the default is the legacy scheme of
      apicid=vcpuid*2
---
 xen/arch/x86/cpuid.c                   | 14 +++++---------
 xen/arch/x86/hvm/vlapic.c              | 22 ++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vlapic.h  |  1 +
 xen/include/public/arch-x86/hvm/save.h |  2 ++
 4 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index a822e80c7ea7..7ee596ab66a4 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -139,10 +139,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         const struct cpu_user_regs *regs;
 
     case 0x1:
-        /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
         if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+            res->b |= vlapic_x2apic_id(vcpu_vlapic(v)) << 24;
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -312,18 +311,15 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
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
index 1a7bca5afd2f..b57e39d1c6dd 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1072,7 +1072,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
 static void set_x2apic_id(struct vlapic *vlapic)
 {
     const struct vcpu *v = vlapic_vcpu(vlapic);
-    uint32_t apic_id = v->vcpu_id * 2;
+    uint32_t apic_id = vlapic->hw.x2apic_id;
     uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
 
     /*
@@ -1452,7 +1452,7 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
     vlapic_do_init(vlapic);
 }
 
@@ -1520,6 +1520,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
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
@@ -1588,6 +1598,13 @@ static int cf_check lapic_check_hidden(const struct domain *d,
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
 
@@ -1672,6 +1689,7 @@ int vlapic_init(struct vcpu *v)
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
2.34.1


