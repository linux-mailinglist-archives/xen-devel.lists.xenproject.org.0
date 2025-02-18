Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C0A39EAB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891455.1300494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOVT-0000th-3i; Tue, 18 Feb 2025 14:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891455.1300494; Tue, 18 Feb 2025 14:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOVT-0000rG-14; Tue, 18 Feb 2025 14:23:27 +0000
Received: by outflank-mailman (input) for mailman id 891455;
 Tue, 18 Feb 2025 14:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z85K=VJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tkOVR-0000rA-8z
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:23:25 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e91497c2-ee03-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 15:23:23 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso1067040066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:23:23 -0800 (PST)
Received: from localhost.localdomain ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9723a559sm433606266b.96.2025.02.18.06.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:23:21 -0800 (PST)
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
X-Inumbo-ID: e91497c2-ee03-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739888603; x=1740493403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1QHuBqdP3oQGhhFm7OT4LUVWD1CiM/VNYviy//az2o=;
        b=UXOhLuWzOVTIhsCkS87oYRE3hwHnH8V5k8DBRGfFVU2fECnhkuUGr3MNiAmejVVGky
         Gm4BZYXixTrLPwaLvONzhUa1SILgPPEaHfaAl1YIDNajzcur4/T/ExLyBhfj2BqK3avF
         9iu15TCiQ2sJpg9pLpRxviBXIRyt4M2E1ke5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739888603; x=1740493403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1QHuBqdP3oQGhhFm7OT4LUVWD1CiM/VNYviy//az2o=;
        b=E2/X28uQ4YkyMxqNr8vpjiOND3siTBLshEzKDEbiVU/UXkv+Vr6ehexIOwYi2Fwu7y
         HGbxCYJrtBujJHy9YzYFYUc4cFmCoUlCDtiqAbdYoISKwqzKtTBLJfDRO+VZ4uRjGzPS
         uLVqCV3dz2iJRYOVGHpj9xSI3GwrtRAFltLYfBIfDprDnosAI+3S40ujEq8xuO0/9f0K
         nfh6YxFrT8XOBGDUTcHc2Wf4Goin+kB0h/m2Amx1V2xVJfgknKu7pcajyVn61ibRxPbj
         WX3GX2BM7VZzMRXU/Uttu6Tvs8u0Fuffpb8faczbnEBlb8GOhAf0dHFYvds135cPFakO
         oJ3Q==
X-Gm-Message-State: AOJu0YxV17hu15LkduaYwlRIPKCTt5xrS4FEMbwhFQezAzNupNJxNhnU
	XvG9DZSbtdIo4k0yA5jvUacCd4ZkU4sFqwCWb2vCqg+YOWwzX9I2DbF0bC0s0zQSHcRHz7pttZd
	w
X-Gm-Gg: ASbGnctkHHG2QVyL04XhxYUDuARhiT+VEDKcLc/onJed+YYjvwhZleVwt4ydv1hcLgd
	4GYrE0FlHYrdJ8aUuIqBKtQLXwIZDKkE3VNos9k+mnxnCi7ynp6aX/K9JB7JPT+t+0HOF72swal
	wL/46tFJnVNtdqHaXaqDZPRXw9I8wLxObjgoj+OZ6tlBXzIXVtmXpJzxsFyybl2brdJqj0eeXj7
	r/YkmPtpoOKd9Sh1OGVWQnszFU4dbNfSHin6RLQJpAvqHohdtgziTd0guj1JTcZIL+LbSaJXvEN
	BcCh+yFKiL3uY1yplvnu3LAGaSgR52IR6bkO
X-Google-Smtp-Source: AGHT+IGc+CTrPL8MYBCQebQpYq+N77Cdeekxnzdkzsku6eWm5WRH4dQ0KvAA4/IizQ6ZUOxI9NAuxQ==
X-Received: by 2002:a17:907:7fac:b0:ab3:85f2:ff67 with SMTP id a640c23a62f3a-abb70aa61e8mr1418488066b.16.1739888602342;
        Tue, 18 Feb 2025 06:23:22 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
Date: Tue, 18 Feb 2025 14:22:59 +0000
Message-ID: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Today, Xen hardcodes apic_id = vcpu_id * 2, but this is unwise and
interferes with providing accurate topology information to the guest.

Introduce a new x2apic_id field into hvm_hw_lapic.  This is immutable
state from the guest's point of view, but it will allow the toolstack to
eventually configure the value, and for the value to move on migrate.

For backwards compatibility, the patch rebuilds the old-style APIC IDs
from migration streams lacking them when they aren't present.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
I've split this one from the rest of the topology series as it's independent
and entangled with another patch from Andrew.

Changes since v7 of the topology series:
  * Minor changes to commit message and some comments in the code.
    * Notably all references to 4.19 are now 4.20 and "Nov. 2024" is now
      "Feb. 2025".
  * Moved x2APIC ID recovery to the hidden state context handler.
  * s/rsvd_zero/_rsvd0/
---
 xen/arch/x86/cpuid.c                   | 21 ++++++++++-----------
 xen/arch/x86/hvm/vlapic.c              | 16 ++++++++++++++--
 xen/arch/x86/include/asm/hvm/vlapic.h  |  1 +
 xen/include/public/arch-x86/hvm/save.h |  2 ++
 4 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 2a777436ee27..f33f7bd2069f 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -138,10 +138,10 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         const struct cpu_user_regs *regs;
 
     case 0x1:
-        /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
         if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+            /* Large systems do wrap around 255 in the xAPIC_ID field. */
+            res->b |= vlapic_x2apic_id(vcpu_vlapic(v)) << 24;
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -310,19 +310,18 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
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
+             * The x2APIC ID is per-vCPU, and fixed irrespective of the
+             * requested subleaf. Xen 4.20 and earlier leaked x2APIC into PV
+             * guests. The value shown is nonsensical but kept as-was during
+             * the Xen 4.21 dev cycle (Feb. 2025) for compatibility.
+             */
+            res->d = is_hvm_domain(d) ? vlapic_x2apic_id(vcpu_vlapic(v))
+                                      : 2 * v->vcpu_id;
         }
         break;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 3363926b487b..61c4aadd95e3 100644
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
 
@@ -1606,6 +1606,9 @@ static int cf_check lapic_check_hidden(const struct domain *d,
          APIC_BASE_EXTD )
         return -EINVAL;
 
+    if ( s._rsvd0 )
+        return -EINVAL;
+
     return 0;
 }
 
@@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
 
+    /*
+     * Xen 4.20 and earlier had no x2APIC ID in the migration stream and
+     * hard-coded "vcpu_id * 2". Default back to this if we have a
+     * zero-extended record.
+     */
+    if ( h->size <= offsetof(struct hvm_hw_lapic, x2apic_id) )
+        s->hw.x2apic_id = v->vcpu_id * 2;
+
     s->loaded.hw = 1;
     if ( s->loaded.regs )
         lapic_load_fixup(s);
@@ -1687,6 +1698,7 @@ int vlapic_init(struct vcpu *v)
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
index 7ecacadde165..a70d46811ab5 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -394,6 +394,8 @@ struct hvm_hw_lapic {
     uint32_t             disabled; /* VLAPIC_xx_DISABLED */
     uint32_t             timer_divisor;
     uint64_t             tdt_msr;
+    uint32_t             x2apic_id;
+    uint32_t             _rsvd0;
 };
 
 DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
-- 
2.48.1


