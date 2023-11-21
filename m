Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E77F33A1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638023.994223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TZj-0007w4-EK; Tue, 21 Nov 2023 16:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638023.994223; Tue, 21 Nov 2023 16:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TZj-0007tQ-BW; Tue, 21 Nov 2023 16:26:11 +0000
Received: by outflank-mailman (input) for mailman id 638023;
 Tue, 21 Nov 2023 16:26:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYOq=HC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r5TZi-0007U8-2C
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:26:10 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac91bae3-888a-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:26:08 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b2979a74eso6256595e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:26:08 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b004068495910csm22075842wmq.23.2023.11.21.08.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:26:06 -0800 (PST)
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
X-Inumbo-ID: ac91bae3-888a-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700583967; x=1701188767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1C7a1pkmGRwzeNuLxH4QVvzRovP/wLpstV7Vt6zuKM=;
        b=SlZstvm/kIu9IMDcuozI7UmhXnL3a/rz3C+79vBeOJOnZw/Uf09CHC9/zzaZZh9gFW
         4CH97DTEv0v61hC1uUBQpLjKtR27Bs8Ls3+bxN4Pz2MxKREks19B/lwBEalAxbzGDb+g
         M8/heyhSHB34n1g7KIEEugkUokyIDvmN0PEfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700583967; x=1701188767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1C7a1pkmGRwzeNuLxH4QVvzRovP/wLpstV7Vt6zuKM=;
        b=ZSn7EVXG8hmBKgLLAfzyzBULcg5hFug0nn8GhKY9noD5vu0HGKbj2mph6DN4vtjIOW
         X+PueKCo83zd2E2cSqeB8NPkMwE8K1YVhxQJJn/o/oRN4C+kNTU3lb1wE+fsxmo9dXlo
         rcBeEvb/bgfPYXhbG4cAdCIQA72gzyAzwyYkdaniN/zt+jGvs2W4yG4VNIhNiGPZFqXw
         BF9O82E5A2b3bLHUuZR5HPwIZTpnszc2zD4+qmr84c2K3q2c6KCN8CUCHkHJSvd9cR8t
         XFWfjb/RhqT7m7UuDak/nmEg6dxaxN+7lGRUdmoLu7kHquWOyh9Oa0Dqdo6fOThvuKWP
         lOlA==
X-Gm-Message-State: AOJu0YzEN4Ji00Y2xGtL2m02AWtB+XjZgCfM7DEn8itoy1W0lKA2I/sv
	/6Lt29yyNm5tKpHLTPGeVhb2gyFwlsprF8h5uXY=
X-Google-Smtp-Source: AGHT+IFKuOX39eTxGssV95yCbj/UIZcFyttx2q8x8VeauYjMZmR9eBX1ezf1CxhpFIFutVMI2H8NlA==
X-Received: by 2002:a05:600c:510d:b0:408:3bbd:4a82 with SMTP id o13-20020a05600c510d00b004083bbd4a82mr7582283wms.15.1700583967064;
        Tue, 21 Nov 2023 08:26:07 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Date: Tue, 21 Nov 2023 16:26:04 +0000
Message-Id: <20231121162604.19405-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
registers are derivable from each other through a fixed formula.

Xen uses that formula, but applies it to vCPU IDs (which are sequential)
rather than x2APIC_IDs (which are not, at the moment). As I understand it,
this is an attempt to tightly pack vCPUs into clusters so each cluster has
16 vCPUs rather than 8, but this is problematic for OSs that might read the
x2APIC_ID and internally derive LDR (or the other way around)

This patch fixes the implementation so we follow the rules in the x2APIC
spec(s).

The patch also covers migrations from broken hypervisors, so LDRs are
preserved even for hotppluggable CPUs and across APIC resets.

Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
I tested this by creating 3 checkpoints.
 1. One with pre-4.4 broken state (every LDR=1, by hacking save_regs)
 2. One with 4.4 onwards broken state (LDRs packed in their clusters)
 3. One with correct LDR values

(1) and (3) restores to the same thing. Consistent APIC_ID+LDR
(2) restores to what it previously had and hotplugs follow the same logic
---
 xen/arch/x86/hvm/vlapic.c             | 81 +++++++++++++++++++--------
 xen/arch/x86/include/asm/hvm/domain.h | 13 +++++
 2 files changed, 72 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index a8e87c4446..7f169f1e5f 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1061,13 +1061,23 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
     .write = vlapic_mmio_write,
 };
 
+static uint32_t x2apic_ldr_from_id(uint32_t id)
+{
+    return ((id & ~0xF) << 12) | (1 << (id & 0xF));
+}
+
 static void set_x2apic_id(struct vlapic *vlapic)
 {
-    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
-    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
+    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
+    uint32_t apic_id = vcpu_id * 2;
+    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
 
-    vlapic_set_reg(vlapic, APIC_ID, id * 2);
-    vlapic_set_reg(vlapic, APIC_LDR, ldr);
+    /* This is a migration bug workaround. See wall of text in lapic_load_fixup() */
+    if ( vlapic_domain(vlapic)->arch.hvm.has_inconsistent_x2apic_ldr_bug )
+        apic_ldr = x2apic_ldr_from_id(vcpu_id);
+
+    vlapic_set_reg(vlapic, APIC_ID, apic_id);
+    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
 }
 
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
@@ -1495,30 +1505,57 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
 /*
  * Following lapic_load_hidden()/lapic_load_regs() we may need to
  * correct ID and LDR when they come from an old, broken hypervisor.
+ *
+ * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC mode
+ * got LDR = 1. This was fixed back then, but another bug was introduced
+ * causing APIC ID and LDR to break the consistency they are meant to have
+ * according to the specs (LDR was derived from vCPU ID, rather than APIC
+ * ID)
+ *
+ * Long story short, we can detect both cases here. For the LDR=1 case we
+ * want to fix it up on migrate, as IPIs just don't work on non-physical
+ * mode otherwise. For the other case we actually want to preserve previous
+ * behaviour so that existing running instances that may have already read
+ * the LDR at the source host aren't surprised when IPIs stop working as
+ * they did at the other end.
+ *
+ * Note that "x2apic_id == 0" has always been correct and can't be used to
+ * discriminate these cases.
+ *
+ * Yuck!
  */
 static void lapic_load_fixup(struct vlapic *vlapic)
 {
-    uint32_t id = vlapic->loaded.id;
+    /*
+     * This LDR would be present in broken versions of Xen 4.4 through 4.18.
+     * It's correct for the cpu with x2apic_id=0 (vcpu0), but invalid for
+     * any other.
+     */
+    uint32_t bad_ldr = x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id);
 
-    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
-    {
+    /*
+     * No need to perform fixups in non-x2apic mode, and x2apic_id == 0 has
+     * always been correct.
+     */
+    if ( !vlapic_x2apic_mode(vlapic) || !vlapic->loaded.id )
+        return;
+
+    if ( vlapic->loaded.ldr == 1 )
+       /*
+        * Migration from a broken Xen 4.4 or earlier. We can't leave it
+        * as-is because it assigned the same LDR to every CPU. We'll fix
+        * the bug now and assign LDR values consistent with the APIC ID.
+        */
+        set_x2apic_id(vlapic);
+    else if ( bad_ldr == vlapic->loaded.ldr )
         /*
-         * This is optional: ID != 0 contradicts LDR == 1. It's being added
-         * to aid in eventual debugging of issues arising from the fixup done
-         * here, but can be dropped as soon as it is found to conflict with
-         * other (future) changes.
+         * This is a migration from a broken Xen between 4.4 and 4.18 and we
+         * must _PRESERVE_ LDRs so new vCPUs use consistent derivations. In
+         * this case we set this domain boolean so future CPU hotplugs
+         * derive an LDR consistent with the older Xen's broken idea of
+         * consistency.
          */
-        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
-             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
-            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
-                   vlapic_vcpu(vlapic), id);
-        set_x2apic_id(vlapic);
-    }
-    else /* Undo an eventual earlier fixup. */
-    {
-        vlapic_set_reg(vlapic, APIC_ID, id);
-        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
-    }
+        vlapic_domain(vlapic)->arch.hvm.has_inconsistent_x2apic_ldr_bug = true;
 }
 
 static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 6e53ce4449..a42a6e99bb 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -61,6 +61,19 @@ struct hvm_domain {
     /* Cached CF8 for guest PCI config cycles */
     uint32_t                pci_cf8;
 
+    /*
+     * Xen had a bug between 4.4 and 4.18 by which the x2APIC LDR was
+     * derived from the vcpu_id rather than the x2APIC ID. This is wrong,
+     * but changing this behaviour is tricky because guests might have
+     * already read the LDR and used it accordingly. In the interest of not
+     * breaking migrations from those hypervisors we track here whether
+     * this domain suffers from this or not so a hotplugged vCPU or an APIC
+     * reset can recover the same LDR it would've had on the older host.
+     *
+     * Yuck!
+     */
+    bool has_inconsistent_x2apic_ldr_bug;
+
     struct pl_time         *pl_time;
 
     struct hvm_io_handler *io_handler;
-- 
2.34.1


