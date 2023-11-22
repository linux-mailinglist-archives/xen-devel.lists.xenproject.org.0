Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544697F4BF5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638875.995803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pm5-0000ty-Bu; Wed, 22 Nov 2023 16:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638875.995803; Wed, 22 Nov 2023 16:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pm5-0000rY-97; Wed, 22 Nov 2023 16:08:25 +0000
Received: by outflank-mailman (input) for mailman id 638875;
 Wed, 22 Nov 2023 16:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1AL=HD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r5pm3-0000rQ-Vi
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 16:08:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b5b0443-8951-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 17:08:21 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b344101f2so2058885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 08:08:21 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 z16-20020adfe550000000b0032db4e660d9sm17520712wrm.56.2023.11.22.08.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 08:08:20 -0800 (PST)
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
X-Inumbo-ID: 5b5b0443-8951-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700669301; x=1701274101; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WlOzmEGGIobJ3lpXFLaNZf6H36XuGl3WrF8R2PCpfWQ=;
        b=IErFsDxa4fdGdzCG9YvKK9T+pbqc5jMe0W8Jp3YqCvu/QoIb1NEYgRKlGguRsKhQe4
         fKyhU+hAlweUES/L2V6MK6nqXaPDcOcYFQlTsoVBrwdiuE9UWu8eXmLDNZuJAvutXR/b
         P4GkaE5agNGSC4iXilbC3XxqKfQbVxj6ArTDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669301; x=1701274101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlOzmEGGIobJ3lpXFLaNZf6H36XuGl3WrF8R2PCpfWQ=;
        b=QEc/4Gn6Gp933ZlQw+22oT0ymvcFeducazlT/LU+ZTvSedLqR26D7ouSij6OcfcKKR
         Wp1PSrRvZdiK8ef3Dx7dMW8fm0N+fNM8LnfL16zmSS4aUmqBvbWXZBqmMpODyun8hD0I
         GvTVKQrfZWYMtIKUHB5ReEih8qd0dB+ZcvtrvHMMu2wfxtqU7XxLmWYmiwhJLpLQqG3l
         AqH74lw5lgF8BVfD/ffWem1hhJmDdc8tzEQRGn78O3YcGa9HtDjXLi89lDhlIwitmvzc
         caapmV4ScGFpfNqg8DoC0ii9jYdGz6rhPcei+AfjUUulSTF1tAdTlMc8j/HfuUq/OxMU
         mD+A==
X-Gm-Message-State: AOJu0YyNoCYT6IwOHZ1F/uCdVrYd1MNXFfZCWRyFfWsF5ltysAFtxW0v
	cQqMChqhnw8zx3T/LJe9+u9/2797dl0NLlipk+4=
X-Google-Smtp-Source: AGHT+IGoZLvI9kxp+SK35C5Ly9Z68wbHpUo4aZZZLlUiPUWB2QhzKYzjr6jnJgLi5kwUqeC/njzi+g==
X-Received: by 2002:a05:600c:5ca:b0:408:36bb:5b0c with SMTP id p10-20020a05600c05ca00b0040836bb5b0cmr5851348wmd.7.1700669300636;
        Wed, 22 Nov 2023 08:08:20 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] xen/x86: On x2APIC mode, derive LDR from APIC ID
Date: Wed, 22 Nov 2023 16:08:17 +0000
Message-Id: <20231122160817.15266-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
registers are derivable from each other through a fixed formula.

Xen uses that formula, but applies it to vCPU IDs (which are sequential)
rather than x2APIC IDs (which are not, at the moment). As I understand it,
this is an attempt to tightly pack vCPUs into clusters so each cluster has
16 vCPUs rather than 8, but this is problematic for OSs that might read the
x2APIC ID and internally derive LDR (or the other way around)

This patch fixes the implementation so we follow the rules in the x2APIC
spec(s) and covers migrations from broken hypervisors, so LDRs are
preserved even for hotppluggable CPUs and across APIC resets.

While touching that area, I removed the existing printk statement in
vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
mode and wouldn't affect the outcome) and put another printk as an else
branch so we get warnings trying to load nonsensical LDR values we don't
know about.

Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Removed underscores from (x2)APIC_ID in commit message
  * Added commit msg explaining the removal of the vlapic_load_fixup() printk
  * Restored lowercase to hex "F"s
  * Refactored a bit vlapic_load_fixup() so it has a trailing printk in
    case of spotting a nonsensical LDR it doesn't understand.
  * Moved field in domain.h with the other booleans
  * Trimmed down field name in domain.h
  * Trimmed down field comment in domain.h

If the field name in domain.h still seems too long I'm happy for it to be
trimmed further down, but I do want to preserve the "_bug_" part of it.
---
 xen/arch/x86/hvm/vlapic.c             | 62 +++++++++++++++++----------
 xen/arch/x86/include/asm/hvm/domain.h |  3 ++
 2 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5cb87f8649..cd929c3716 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1061,13 +1061,23 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
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
+    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
+    uint32_t apic_id = vcpu_id * 2;
+    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
+
+    /* This is a migration bug workaround. See wall of text in lapic_load_fixup() */
+    if ( vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id )
+        apic_ldr = x2apic_ldr_from_id(vcpu_id);
 
-    vlapic_set_reg(vlapic, APIC_ID, id * 2);
-    vlapic_set_reg(vlapic, APIC_LDR, ldr);
+    vlapic_set_reg(vlapic, APIC_ID, apic_id);
+    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
 }
 
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
@@ -1498,27 +1508,35 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
  */
 static void lapic_load_fixup(struct vlapic *vlapic)
 {
-    uint32_t id = vlapic->loaded.id;
+    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
+    if ( !vlapic_x2apic_mode(vlapic) ||
+         (vlapic->loaded.ldr == x2apic_ldr_from_id(vlapic->loaded.id)) )
+        return;
 
-    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
-    {
+    if ( vlapic->loaded.ldr == 1 )
+       /*
+        * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC
+        * mode got LDR = 1. We can't leave it as-is because it assigned the
+        * same LDR to every CPU.  We'll fix fix the bug now and assign an
+        * LDR value consistent with the APIC ID.
+        */
+        set_x2apic_id(vlapic);
+    else if ( vlapic->loaded.ldr ==
+              x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id) )
         /*
-         * This is optional: ID != 0 contradicts LDR == 1. It's being added
-         * to aid in eventual debugging of issues arising from the fixup done
-         * here, but can be dropped as soon as it is found to conflict with
-         * other (future) changes.
+         * This is a migration from a broken Xen between 4.4 and 4.18 and
+         * we must _PRESERVE_ LDRs so new vCPUs use consistent derivations.
+         * This is so existing running guests that may have already read
+         * the LDR at the source host aren't surprised when IPIs stop
+         * working as they did at the other end. To address this, we set
+         * this domain boolean so future CPU hotplugs derive an LDR
+         * consistent with the older Xen's broken idea of consistency.
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
+        vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id = true;
+    else
+        printk(XENLOG_G_WARNING
+               "%pv: bogus x2APIC loaded id=%#x ldr=%#x\n",
+               vlapic_vcpu(vlapic), vlapic->loaded.id, vlapic->loaded.ldr);
 }
 
 static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 6e53ce4449..2fee3874cd 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -106,6 +106,9 @@ struct hvm_domain {
 
     bool                   is_s3_suspended;
 
+    /* Compat setting for a bug in x2APIC LDR. See vlapic_load_fixup() */
+    bool x2apic_ldr_bug_with_vcpu_id;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
-- 
2.34.1


