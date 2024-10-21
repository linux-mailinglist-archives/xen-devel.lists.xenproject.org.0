Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B65E9A6E92
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823734.1237793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc1-0007S6-AV; Mon, 21 Oct 2024 15:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823734.1237793; Mon, 21 Oct 2024 15:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc1-0007J6-7A; Mon, 21 Oct 2024 15:46:29 +0000
Received: by outflank-mailman (input) for mailman id 823734;
 Mon, 21 Oct 2024 15:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2ubz-00072f-KY
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:27 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1bd5b18-8fc3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:46:26 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso670324066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:26 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:25 -0700 (PDT)
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
X-Inumbo-ID: a1bd5b18-8fc3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525586; x=1730130386; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4JeQE08gNbfSWczpDPa3wKYhVIymZneTtaBPTmRUh4=;
        b=QYEkr2Ra5S1VXH9tIQPlrgItAiZG6jqghIZB/waLU7IkIPY6earLMxbSuGNEuM8flB
         IutR8xowSMSCLTmRQwt2NzOeBm7nlrsDXqtqjVMBFeic2+0+7YL6OlOweP+2gglEtCCU
         IcH7S4CK6ZZi+8kRheKxiRVjHqjKnifkWaDgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525586; x=1730130386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4JeQE08gNbfSWczpDPa3wKYhVIymZneTtaBPTmRUh4=;
        b=FWv5P2p9Q2ooJdQ+rs059HB+FyDvWhyBd7K5W4eizVJBCq7gwNYy9bXk3METkHc2c6
         H+HtstyYk75E2dwFJsKgYxa2hhmo2Lazv1/ohlflub0z3lfg3/UpU5TSVlhEewpJmbAZ
         y3RxDGweMrF9wMiCY3GuHAzH30tra+lvbRJLphJUeVsNUvM1rgVrQgiQloCK+XqZmwsh
         ly3ewg5mkYcB7efHgY+AQziD5B+oE/LZVN+3i1FW0NCy0+CclkAh4XKMSqwxduaSmcoP
         e7oxjlpFqfr18mMA42NI462eJHj4AJBWIp+ynkRJH73YwXJZ4u3Cq8JLEqKAMpturOX7
         NHqg==
X-Gm-Message-State: AOJu0YzQKqGghni68vE+NOGY6ogAZ19rLo6z+ewsMVAV2g7Szas1qVpZ
	4LaMNAbOJdJUAwnkCmhQzqD36I4qEZyjRL92hxwlge1TrtN/xxnNwQw4YezwXL7DMWmEAV3ld4b
	T
X-Google-Smtp-Source: AGHT+IFsK7Iu5vWYlhUZff+ic0jHttVXhWo6yGhM9JdgQlboahnygpBdmE//ilKBKhQ2dxolpNcy6w==
X-Received: by 2002:a17:907:7e9e:b0:a9a:161:8da4 with SMTP id a640c23a62f3a-a9a69cdd435mr1195055966b.55.1729525585741;
        Mon, 21 Oct 2024 08:46:25 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 02/10] xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
Date: Mon, 21 Oct 2024 16:45:52 +0100
Message-ID: <20241021154600.11745-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
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
v7:
 * Preserve output for CPUID[0xb].edx on PV rather than nullify it.
 * s/vlapic->hw.x2apic_id/vlapic_x2apic_id(vlapic)/ in vlapic.c
---
 xen/arch/x86/cpuid.c                   | 18 +++++++-----------
 xen/arch/x86/hvm/vlapic.c              | 22 ++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vlapic.h  |  1 +
 xen/include/public/arch-x86/hvm/save.h |  2 ++
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 2a777436ee27..e2489ff8e346 100644
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
@@ -310,19 +309,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         break;
 
     case 0xb:
-        /*
-         * In principle, this leaf is Intel-only.  In practice, it is tightly
-         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
-         * to guests on AMD hardware as well.
-         *
-         * TODO: Rework topology logic.
-         */
         if ( p->basic.x2apic )
         {
             *(uint8_t *)&res->c = subleaf;
 
-            /* Fix the x2APIC identifier. */
-            res->d = v->vcpu_id * 2;
+            /*
+             * Fix the x2APIC identifier. The PV side is nonsensical, but
+             * we've always shown it like this so it's kept for compat.
+             */
+            res->d = is_hvm_domain(d) ? vlapic_x2apic_id(vcpu_vlapic(v))
+                                      : 2 * v->vcpu_id;
         }
         break;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 3363926b487b..33b463925f4e 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1090,7 +1090,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
 static void set_x2apic_id(struct vlapic *vlapic)
 {
     const struct vcpu *v = vlapic_vcpu(vlapic);
-    uint32_t apic_id = v->vcpu_id * 2;
+    uint32_t apic_id = vlapic_x2apic_id(vlapic);
     uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
 
     /*
@@ -1470,7 +1470,7 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic_x2apic_id(vlapic)));
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
2.47.0


