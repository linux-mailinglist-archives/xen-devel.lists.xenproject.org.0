Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64D7FA145
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642101.1001256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bwP-00046Q-34; Mon, 27 Nov 2023 13:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642101.1001256; Mon, 27 Nov 2023 13:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bwO-00044a-V8; Mon, 27 Nov 2023 13:46:24 +0000
Received: by outflank-mailman (input) for mailman id 642101;
 Mon, 27 Nov 2023 13:46:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhMp=HI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r7bwN-0003nj-3H
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:46:23 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59ae7999-8d2b-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 14:46:22 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-332ed1bd4cbso1659506f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 05:46:22 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a5d5491000000b0033307ffb19fsm936329wrv.37.2023.11.27.05.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 05:46:21 -0800 (PST)
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
X-Inumbo-ID: 59ae7999-8d2b-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701092781; x=1701697581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XD03BzMzLPcaKsTkQCuR7IMRGOgU6EQa6qDB+DeGE5I=;
        b=BfQPX07ni8k4tDgUwhtOLIxz99jY5kooAK6+N0NPr2f6HCYSfSSMuBcqtOlLy9W2bF
         EGD5L07sGg+7CRVVgXONhc176TBEYh4m65RTrlk4cJp9owEErO16hW3Tx80CD7zqSPd6
         ATFzbIYL3EQYHjJA54zVW0rzufToOc/GyKDIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701092781; x=1701697581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD03BzMzLPcaKsTkQCuR7IMRGOgU6EQa6qDB+DeGE5I=;
        b=n/T0MTeN4pAE8WNozYF8R16qvHGInk/zUv9tb8I6tEfEB2/mta0+ksXFEuuPeiHlbC
         9iobK/N0QFfQoXc50+1oJDmBSFbDNLGAE0T33LzzKANLjhtWiheQ2FNCX5yfqTfDhYml
         uxG9BwhyF7+Lh6hfFdESHF3jqv9pfoUkKDwD6vyC+7Sh5jiznQIMphyyC74Ps9GJI6Lj
         KTj81wWzdQ3EIauJIunbCNic37tCMpVfcZXKHbtvoC1SbLgEewWGNOEFhgvmJaQq+oE4
         WrBEZcr2y9F2C1djjEoqd9jAiSvngprVLUNgeMPLy8XPvzdds8+o9qfxF9+308yrGPLn
         vRcg==
X-Gm-Message-State: AOJu0YyAbThphVVpSz2tNo7+m7NIRZde/QO8QRepMELZMWlBY6HPBQRk
	os2KkMmy8uBHX2ljtLf22YIKM/6UkjzORHn/Z54=
X-Google-Smtp-Source: AGHT+IFLA55O3bpyRUqEMoG+MiB7QguPCnD07GyHwGntdMDyG1MMInjxoG58Cj+2iEhL0lwTlk84Hw==
X-Received: by 2002:a5d:4607:0:b0:32f:7649:2648 with SMTP id t7-20020a5d4607000000b0032f76492648mr8283421wrq.46.1701092781295;
        Mon, 27 Nov 2023 05:46:21 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5] xen/x86: On x2APIC mode, derive LDR from APIC ID
Date: Mon, 27 Nov 2023 13:46:19 +0000
Message-Id: <20231127134619.2978-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
registers are derivable from each other through a fixed formula.

Xen uses that formula, but applies it to vCPU IDs (which are sequential)
rather than x2APIC IDs (which are not, at the moment). As I understand it,
this is an attempt to tightly pack vCPUs into clusters so each cluster has
16 vCPUs rather than 8, but this is a spec violation.

This patch fixes the implementation so we follow the x2APIC spec for new
VMs, while preserving the behaviour (buggy or fixed) for migrated-in VMs.

While touching that area, remove the existing printk statement in
vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
mode and wouldn't affect the outcome) and put another printk as an else
branch so we get warnings trying to load nonsensical LDR values we don't
know about.

Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v5:

[Andrew]
  * Missing full stop in commit message
  * Specifically mention spec violation in the commit message
  * Use struct vcpu* directly rather than through vlapic_vcpu()
  * Braces in conditionals of lapic_load_fixup()

[Jan]
  * Restored information about id!=0 + ldr==1 being inconsistent.
    in the context of older fixup
---
 xen/arch/x86/hvm/vlapic.c             | 64 +++++++++++++++++++--------
 xen/arch/x86/include/asm/hvm/domain.h |  3 ++
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5cb87f8649..2d705020c8 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1061,13 +1061,26 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
     .write = vlapic_mmio_write,
 };
 
+static uint32_t x2apic_ldr_from_id(uint32_t id)
+{
+    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
+}
+
 static void set_x2apic_id(struct vlapic *vlapic)
 {
-    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
-    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
+    const struct vcpu *v = vlapic_vcpu(vlapic);
+    uint32_t apic_id = v->vcpu_id * 2;
+    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
 
-    vlapic_set_reg(vlapic, APIC_ID, id * 2);
-    vlapic_set_reg(vlapic, APIC_LDR, ldr);
+    /*
+     * Workaround for migrated domains to derive LDRs as the source host
+     * would've.
+     */
+    if ( v->domain->arch.hvm.bug_x2apic_ldr_vcpu_id )
+        apic_ldr = x2apic_ldr_from_id(v->vcpu_id);
+
+    vlapic_set_reg(vlapic, APIC_ID, apic_id);
+    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
 }
 
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
@@ -1498,27 +1511,40 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
  */
 static void lapic_load_fixup(struct vlapic *vlapic)
 {
-    uint32_t id = vlapic->loaded.id;
+    const struct vcpu *v = vlapic_vcpu(vlapic);
+    uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
 
-    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
+    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
+    if ( !vlapic_x2apic_mode(vlapic) ||
+         (vlapic->loaded.ldr == good_ldr) )
+        return;
+
+    if ( vlapic->loaded.ldr == 1 )
     {
-        /*
-         * This is optional: ID != 0 contradicts LDR == 1. It's being added
-         * to aid in eventual debugging of issues arising from the fixup done
-         * here, but can be dropped as soon as it is found to conflict with
-         * other (future) changes.
-         */
-        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
-             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
-            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
-                   vlapic_vcpu(vlapic), id);
+       /*
+        * Xen <= 4.4 may have a bug by which all the APICs configured in
+        * x2APIC mode got LDR = 1, which is inconsistent on every vCPU
+        * except for the one with ID = 0. We'll fix fix the bug now and
+        * assign an LDR value consistent with the APIC ID.
+        */
         set_x2apic_id(vlapic);
     }
-    else /* Undo an eventual earlier fixup. */
+    else if ( vlapic->loaded.ldr == x2apic_ldr_from_id(v->vcpu_id) )
     {
-        vlapic_set_reg(vlapic, APIC_ID, id);
-        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
+        /*
+         * Migrations from Xen 4.4 to date (4.19 dev window, Nov 2023) may
+         * have LDR drived from the vCPU ID, not the APIC ID. We must preserve
+         * LDRs so new vCPUs use consistent derivations and existing guests,
+         * which may have already read the LDR at the source host, aren't
+         * surprised when interrupts stop working the way they did at the
+         * other end.
+         */
+        v->domain->arch.hvm.bug_x2apic_ldr_vcpu_id = true;
     }
+    else
+        printk(XENLOG_G_WARNING
+               "%pv: bogus x2APIC record: ID %#x, LDR %#x, expected LDR %#x\n",
+               v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
 }
 
 static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 6e53ce4449..dd9d837e84 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -106,6 +106,9 @@ struct hvm_domain {
 
     bool                   is_s3_suspended;
 
+    /* Compatibility setting for a bug in x2APIC LDR */
+    bool bug_x2apic_ldr_vcpu_id;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
-- 
2.34.1


