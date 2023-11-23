Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB067F6574
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 18:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639961.997672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6DXd-0006S3-VK; Thu, 23 Nov 2023 17:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639961.997672; Thu, 23 Nov 2023 17:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6DXd-0006P9-Qx; Thu, 23 Nov 2023 17:31:05 +0000
Received: by outflank-mailman (input) for mailman id 639961;
 Thu, 23 Nov 2023 17:31:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6DXc-0006P3-5J
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 17:31:04 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11d4ec36-8a26-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 18:31:01 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso12704215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 09:31:00 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 ew3-20020a05600c808300b003fc16ee2864sm2536469wmb.48.2023.11.23.09.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 09:30:59 -0800 (PST)
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
X-Inumbo-ID: 11d4ec36-8a26-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700760659; x=1701365459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PK60LTsDPXIMDy8TaQakTEQfUtNlF61ykQ7ObNRH1o0=;
        b=KfFt8cN+9ozJB0PbAq4TuJ8kEsxiJia2mWLjNHVyMkhTouW33vfHxPjzzQ4/KACLfq
         naRRBcATrnCn9hNcZav7eShGJ1rZD11p/jOXk1KrSdrIHpvzK0oypL/zgqzEVM7E94gZ
         qx1whSNJSzgF9JVAEL9E4RqlIOSMISX5z7MW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700760659; x=1701365459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK60LTsDPXIMDy8TaQakTEQfUtNlF61ykQ7ObNRH1o0=;
        b=GdwCXnrauGBAfj9jMZDwZm6fnjZ1lJRGkfjttrYYk881Mhit6E89d0FjpGPxhkK7XC
         FTa24+zkOKk78pfA03tPKOlg6tajUzUSiCsqT3WAIbbH4UNQ+e/pBmDHPn2REVKRaVIn
         ZXoT59sH1y6NfIUcfSHSzJhGDJP1qD7GrjnfXItM0jFYFjIm0fSx53TAEJiwZgtfNfmO
         Lwj0Xu7guwRivK1T1BbYm3ezJ0tt/UVR1GsTofGw9rDE00Bqtx+ZvbVRZBbCxi69yx2W
         wOalghMxBaM2SJeoKK4VncI2Ceb4iQ0KSJiJpDpu23eksOHXaoz83wG4YQteFbORQ0Df
         U8Yg==
X-Gm-Message-State: AOJu0YyzEucd0AjLXacFHD3dGsVKgXyM6YY44X1FScAH7PxUQAf/2Jv/
	glwctw2scKHML9nRPjFOWaBUqAcAA6cv5QDyJQw=
X-Google-Smtp-Source: AGHT+IFGvli/Lrkj0Mj5i6uCWZekC+w8RBQleTlCYxVP1BS5codwWL/U77ADb4sGeVA0i7T5PqBbcg==
X-Received: by 2002:a05:600c:1382:b0:40b:305c:9c84 with SMTP id u2-20020a05600c138200b0040b305c9c84mr2971972wmf.12.1700760659540;
        Thu, 23 Nov 2023 09:30:59 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Date: Thu, 23 Nov 2023 17:30:57 +0000
Message-Id: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4:
  * Removed "See <function>()" part of comment in set_x2apic_id()
  * Removed _with_ in field name
  * Trimmed down comments further
  * Rephrased the Xen versions in the comments so it's implied not every
    Xen 4.X is affected (as they won't be after this patch is backported)
  * Replace Xen 4.18 reference with date+4.19 dev window
---
 xen/arch/x86/hvm/vlapic.c             | 66 ++++++++++++++++++---------
 xen/arch/x86/include/asm/hvm/domain.h |  3 ++
 2 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5cb87f8649..cd4701c5a2 100644
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
+    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
+    uint32_t apic_id = vcpu_id * 2;
+    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
+
+    /*
+     * Workaround for migrated domains to derive LDRs as the source host
+     * would've.
+     */
+    if ( vlapic_domain(vlapic)->arch.hvm.bug_x2apic_ldr_vcpu_id )
+        apic_ldr = x2apic_ldr_from_id(vcpu_id);
 
-    vlapic_set_reg(vlapic, APIC_ID, id * 2);
-    vlapic_set_reg(vlapic, APIC_LDR, ldr);
+    vlapic_set_reg(vlapic, APIC_ID, apic_id);
+    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
 }
 
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
@@ -1498,27 +1511,36 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
  */
 static void lapic_load_fixup(struct vlapic *vlapic)
 {
-    uint32_t id = vlapic->loaded.id;
+    uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
 
-    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
-    {
+    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
+    if ( !vlapic_x2apic_mode(vlapic) ||
+         (vlapic->loaded.ldr == good_ldr) )
+        return;
+
+    if ( vlapic->loaded.ldr == 1 )
+       /*
+        * Xen <= 4.4 may have a bug by which all the APICs configured in
+        * x2APIC mode got LDR = 1. We can't leave it as-is because it
+        * assigned the same LDR to every CPU.  We'll fix fix the bug now
+        * and assign an LDR value consistent with the APIC ID.
+        */
+        set_x2apic_id(vlapic);
+    else if ( vlapic->loaded.ldr ==
+              x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id) )
         /*
-         * This is optional: ID != 0 contradicts LDR == 1. It's being added
-         * to aid in eventual debugging of issues arising from the fixup done
-         * here, but can be dropped as soon as it is found to conflict with
-         * other (future) changes.
+         * Migrations from Xen 4.4 to date (4.19 dev window, Nov 2023) may
+         * show this bug. We must preserve LDRs so new vCPUs use consistent
+         * derivations and existing guests, which may have already read the
+         * LDR at the source host, aren't surprised when interrupts stop
+         * working the way they did at the other end.
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
+        vlapic_domain(vlapic)->arch.hvm.bug_x2apic_ldr_vcpu_id = true;
+    else
+        printk(XENLOG_G_WARNING
+               "%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected ldr=%#x)\n",
+               vlapic_vcpu(vlapic), vlapic->loaded.id, vlapic->loaded.ldr,
+               good_ldr);
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


