Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293DCB99D1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185682.1507734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NW-0002e5-6h; Fri, 12 Dec 2025 19:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185682.1507734; Fri, 12 Dec 2025 19:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NW-0002cU-1x; Fri, 12 Dec 2025 19:00:34 +0000
Received: by outflank-mailman (input) for mailman id 1185682;
 Fri, 12 Dec 2025 19:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU8NT-0001RM-Tp
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:00:31 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1c553f4-d78c-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 20:00:26 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so10887735e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 11:00:26 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4af065sm16863975e9.6.2025.12.12.11.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 11:00:25 -0800 (PST)
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
X-Inumbo-ID: d1c553f4-d78c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765566025; x=1766170825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps58niqN4uMF+QvTxFnqL3rpQIPJOM5Dbdsk2f6ndKM=;
        b=rQXKKXrnffc6Em9tBU9yy6CYBh7ISw/GtOIjhTsmK353I9psGFLgQ2UQNqlGlqxyNM
         Ejov3SUypcYXuxPFYA3tr9gi+FSp5BA3lEb0H2SVUCB2P7MRef7zFZYoaCnLSO12WrkD
         XtRJDwzCojFzlxhz8cdoSWcvh7ViNlvU7VPGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566025; x=1766170825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ps58niqN4uMF+QvTxFnqL3rpQIPJOM5Dbdsk2f6ndKM=;
        b=IM/yqLOmfYxhWfu7qgeG3s9zZ5fgqqdoNVYKQHZHKD8kEQbYVyD0Vu6ntNI6EjUE0h
         Y+qAIhDMK6VCjeeAUrHvkhNF9X+uE40ssRnYAGfR5uAfmCAeLCHixQKTu/Ks6tMhzC8Y
         oUZZOZzoeyHo1yr5oZnpX8e0hCeKkCLqt5I/hyrp/RZYreAIQtblz6pxsW/P9L4uFomK
         BB3x24ZrtyIoV3y7g4vFt9/W5+IyknaVMJpMy1latkmPljDwZ6ROfjF/90IwbNXIjWe7
         FQUbDLpXrnFPyMFI52M4kBB0wi7VjycdtP0tTqX/AKOD8zIxz7zkwf+GfLTVZMuVINCg
         k/0Q==
X-Gm-Message-State: AOJu0Yx0DLKMfddJkXJOrhQUsHJapgkyVJxi1zVRzAuiTEqVrMqeX3g0
	UBidWjj2AiiePmLyDBp28/bYDUlkWGJWtqW1Qmh8AE4lrQwU1URwGvNYc0CLQAUiWsc7nrhC6JZ
	WnQaJ
X-Gm-Gg: AY/fxX4EQgBWlrQ3Pwt80A3VCWoksBeBzXmWICHvsJchdZqcKa1FTTe/2s1qvMQpncn
	ydIgkyzGLCMx+xvVudmOGHimL2k5vK+k1l1RnwDshGH2dWYAc/9xRN4OxtzvxHdjf55pWctnECI
	h7y3JGpfd9kL3Y2TCIFKtwzvwIcPFimp2c9z6VwvOka1+bklwpP5dzhp4LrFlcG9XED9T0dTtud
	pktuWdbgWBEhiEO2pHXJqcTrtOxNhwJkQlNBFEJfTAOs0gECKagSVlAJ0q7Dz64EDvSy8U5ZsWZ
	TA4/+XI4Kxfv5JM4jhtNbpWELGsy3oAq2LZWzl1JiT6P/1BqqJyW0ehZ1TBfMPiTQeDoVE1cjaq
	eXz1Olcsx6CoVO0rLIpvmcFhwvXdVvqHyOEsP0pyxrX37eP4PdYCM6VYK6AHjSzlU1weIGrSUDJ
	Srojgc9uLIMQtecpJpFLfV46PXxqC/bLNIJl6rH9Y4O7XmYVngJQpaBJSrJHwIwh8z6F5rL86i
X-Google-Smtp-Source: AGHT+IF2qe996kPERecRDoM8QDX/3zB5zvYJGrTiyLOU8tcL3/NKmQ859lEMGlquUYzV+H9OAcEtvA==
X-Received: by 2002:a05:600c:3e1a:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47a8f9051c4mr34560195e9.21.1765566025573;
        Fri, 12 Dec 2025 11:00:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/5] x86/svm: Merge nestedsvm.h into svm-types.h
Date: Fri, 12 Dec 2025 19:00:19 +0000
Message-Id: <20251212190020.2570076-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
References: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While doing so, move the ns_gif field to beside ns_hap_enabled to remove 7
padding bytes, and make some style fixes to comments/etc.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/hvm/svm-types.h     | 66 +++++++++++++++-
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h | 79 --------------------
 2 files changed, 65 insertions(+), 80 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h

diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 1c26daa981a7..637b94fa37da 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -5,7 +5,71 @@
 #ifndef X86_SVM_TYPES_H
 #define X86_SVM_TYPES_H
 
+#include <xen/types.h>
+
 #include <asm/hvm/svm/vmcb.h>
-#include <asm/hvm/svm/nestedsvm.h>
+
+struct nestedsvm {
+    uint64_t ns_msr_hsavepa; /* MSR HSAVE_PA value */
+
+    /*
+     * l1 guest physical address of virtual vmcb used by prior VMRUN.  Needed
+     * for VMCB Cleanbit emulation.
+     */
+    uint64_t ns_ovvmcb_pa;
+
+    /* Cached real intercepts of the l2 guest */
+    uint32_t ns_cr_intercepts;
+    uint32_t ns_dr_intercepts;
+    uint32_t ns_exception_intercepts;
+    uint32_t ns_general1_intercepts;
+    uint32_t ns_general2_intercepts;
+
+    /* Cached real MSR permission bitmaps of the l2 guest */
+    unsigned long *ns_cached_msrpm;
+    /* Merged MSR permission bitmap */
+    unsigned long *ns_merged_msrpm;
+
+    /* guest physical address of virtual io permission map */
+    paddr_t ns_iomap_pa, ns_oiomap_pa;
+    /* Shadow io permission map */
+    unsigned long *ns_iomap;
+
+     /*
+      * Cached guest_cr[0] of l1 guest while l2 guest runs.  Needed to handle
+      * FPU context switching.
+      */
+    uint64_t ns_cr0;
+
+    /*
+     * Cache guest cr3/host cr3 the guest sets up for the l2 guest.
+     * Used by Shadow-on-Shadow and Nested-on-Nested.
+     * ns_vmcb_guestcr3: in l2 guest physical address space and points to
+     *     the l2 guest page table
+     * ns_vmcb_hostcr3: in l1 guest physical address space and points to
+     *     the l1 guest nested page table
+     */
+    uint64_t ns_vmcb_guestcr3, ns_vmcb_hostcr3;
+    uint32_t ns_asid;
+
+    bool ns_gif;
+    bool ns_hap_enabled;
+
+    /* Only meaningful when vmexit_pending flag is set */
+    struct {
+        uint64_t exitcode;  /* native exitcode to inject into l1 guest */
+        uint64_t exitinfo1; /* additional information to the exitcode */
+        uint64_t exitinfo2; /* additional information to the exitcode */
+    } ns_vmexit;
+
+    union {
+        uint32_t bytes;
+        struct {
+            uint32_t rflagsif:1;
+            uint32_t vintrmask:1;
+            uint32_t reserved:30;
+        } fields;
+    } ns_hostflags;
+};
 
 #endif /* X86_SVM_TYPES_H */
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
deleted file mode 100644
index 205989e80095..000000000000
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ /dev/null
@@ -1,79 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * nestedsvm.h: Nested Virtualization
- * Copyright (c) 2011, Advanced Micro Devices, Inc
- *
- */
-#ifndef __ASM_X86_HVM_SVM_NESTEDSVM_H__
-#define __ASM_X86_HVM_SVM_NESTEDSVM_H__
-
-#include <xen/types.h>
-
-struct nestedsvm {
-    bool ns_gif;
-    uint64_t ns_msr_hsavepa; /* MSR HSAVE_PA value */
-
-    /* l1 guest physical address of virtual vmcb used by prior VMRUN.
-     * Needed for VMCB Cleanbit emulation.
-     */
-    uint64_t ns_ovvmcb_pa;
-
-    /* Cached real intercepts of the l2 guest */
-    uint32_t ns_cr_intercepts;
-    uint32_t ns_dr_intercepts;
-    uint32_t ns_exception_intercepts;
-    uint32_t ns_general1_intercepts;
-    uint32_t ns_general2_intercepts;
-
-    /* Cached real MSR permission bitmaps of the l2 guest */
-    unsigned long *ns_cached_msrpm;
-    /* Merged MSR permission bitmap */
-    unsigned long *ns_merged_msrpm;
-
-    /* guest physical address of virtual io permission map */
-    paddr_t ns_iomap_pa, ns_oiomap_pa;
-    /* Shadow io permission map */
-    unsigned long *ns_iomap;
-
-    uint64_t ns_cr0; /* Cached guest_cr[0] of l1 guest while l2 guest runs.
-                      * Needed to handle FPU context switching */
-
-    /* Cache guest cr3/host cr3 the guest sets up for the l2 guest.
-     * Used by Shadow-on-Shadow and Nested-on-Nested.
-     * ns_vmcb_guestcr3: in l2 guest physical address space and points to
-     *     the l2 guest page table
-     * ns_vmcb_hostcr3: in l1 guest physical address space and points to
-     *     the l1 guest nested page table
-     */
-    uint64_t ns_vmcb_guestcr3, ns_vmcb_hostcr3;
-    uint32_t ns_asid;
-
-    bool ns_hap_enabled;
-
-    /* Only meaningful when vmexit_pending flag is set */
-    struct {
-        uint64_t exitcode;  /* native exitcode to inject into l1 guest */
-        uint64_t exitinfo1; /* additional information to the exitcode */
-        uint64_t exitinfo2; /* additional information to the exitcode */
-    } ns_vmexit;
-    union {
-        uint32_t bytes;
-        struct {
-            uint32_t rflagsif: 1;
-            uint32_t vintrmask: 1;
-            uint32_t reserved: 30;
-        } fields;
-    } ns_hostflags;
-};
-
-#endif /* ASM_X86_HVM_SVM_NESTEDSVM_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.39.5


