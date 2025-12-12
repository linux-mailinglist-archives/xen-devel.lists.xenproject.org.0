Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3DECB99D4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185678.1507694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NR-0001hv-SG; Fri, 12 Dec 2025 19:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185678.1507694; Fri, 12 Dec 2025 19:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NR-0001gF-PB; Fri, 12 Dec 2025 19:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1185678;
 Fri, 12 Dec 2025 19:00:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU8NP-0000Sh-U3
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:00:27 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d226ec3b-d78c-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 20:00:27 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso7525235e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 11:00:27 -0800 (PST)
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
X-Inumbo-ID: d226ec3b-d78c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765566026; x=1766170826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gL+Enjh91ePnBSDyCGD4ymXdSwQiUrx66mBkDlBghw=;
        b=GAFgkIia8SGUHqHwjLo+MgDEwXal1n2rn4xQnVEP/wlD6MAG+lQMzpdqnwQkpSM4iO
         yAXbRf4NQDzbHAsVzTETCvf5Ce+Zu3OZ45TER36Wa4s6h7OMW9VsyzrCNzPkCjh+EVYO
         +NCJBwQ2a6CXhHxxaVQ6FftiRXMnqKOSEGDkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566026; x=1766170826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3gL+Enjh91ePnBSDyCGD4ymXdSwQiUrx66mBkDlBghw=;
        b=mwdwKQj+EEtvswWe7Zgq2oV5YaL08os/GuGmv2fBYo8AIj2T3vpu/ynrZvyvGpeeCM
         kTLjESoSk4CN7oehUv14jVXJfxpJHia1ftYDYJEWJYP1C1jk1mofAKPmNyJPfMwRNBdy
         JhHwNWm8x5om9jYDGNh94Tfm459cvC9ncFlvrtm4aMBfSBzIyHBAgbP8YM7feFpCuBp3
         jXhnGjLfqc4CRUkc1U5SmM3Ih8LQkpsly+8BOAn27RPyjXBxP5MddhV8sT3uruxuGnRS
         0m0HmrYZFPR0f5up7y3/wYujed10w9fa+dLaherUSYMQQd47i4wQy6hDOCSgZtTua5Hr
         /zVA==
X-Gm-Message-State: AOJu0YxV73jFkpboNCfwC1fRiuCKaZKz6KKpxY94Rb94BULCxttP4YaJ
	yFxL5JWezLFGqPGZv89KJPw6ZiQ8o79/Py0hBQ/RiicpxZPGhgUYHmBNAvnEX1iK+rpURkRhXUN
	JoUKj
X-Gm-Gg: AY/fxX4bunJgHR6GqwEhAm8wtmMgflRl5dCirhkwIk9+n8PGJUl52/z470kpecb44QQ
	d3iadd2qst3kBbSDCCrJcluiEqhHdOzskbpaF4waKMIT7SmpQ+7WzXGS+TOSM+bgb1aO/Rjk0yo
	yIDSU4O2z6fRCGy6JW3YvlY+LYxW2h3fSw82CBi5T3yR/uCeiMu4raaO5qAbccdX38qlrXGf4dW
	JOI4wtmHHIAAKGCMFJDT79ODPuoJqPIKpMi6sPvFi/yB4H4v9IKCtqSyEHvnAw6HoLVpSoIZ3fU
	xJ95dU5jYYMRLq3OoTX7IfYpSNYl/1h1zTJHwzdbkcPAuzRmqfU8lWg0GdgHP9cPSD4R1aCwetc
	Tp7cRl98pg3XNhgm2pe6BFkZvwNO91cARmtc1oBGWZLdZA0/4bluQRb621Rm+bWyAkKAcl7Rs3A
	KnM5pFQlGU+2A2HdEmif8HqSHeOwPKw+W7tnpM54yjZlRAcjHpzumiiQ4Rn3oOXw==
X-Google-Smtp-Source: AGHT+IF2YyM3Nge3Hk1arDdyHtK4rfPZSN3vZVo2Suz25mW45G2SMbhU6hQaVB1ugtxKdC1Uludk7w==
X-Received: by 2002:a05:600c:1992:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-47a8f9055camr31813165e9.20.1765566026207;
        Fri, 12 Dec 2025 11:00:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/5] x86/svm: Merge vmcb.h into svm-types.h
Date: Fri, 12 Dec 2025 19:00:20 +0000
Message-Id: <20251212190020.2570076-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
References: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While doing so, make some style fixes to comments/etc.

This removes the include/asm/hvm/svm/ subdirectory.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/hvm/svm-types.h | 32 +++++++++++++-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h  | 55 ------------------------
 2 files changed, 31 insertions(+), 56 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/vmcb.h

diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 637b94fa37da..051b235d8f69 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -7,7 +7,37 @@
 
 #include <xen/types.h>
 
-#include <asm/hvm/svm/vmcb.h>
+struct svm_domain {
+    union {
+        uint64_t raw[2];
+        struct {
+            uint64_t length;
+            uint64_t status;
+        };
+    } osvw;
+};
+
+struct svm_vcpu {
+    struct vmcb_struct *vmcb;
+    unsigned long *msrpm;
+    uint64_t vmcb_pa;
+    int     launch_core;
+
+    uint8_t vmcb_sync_state; /* enum vmcb_sync_state */
+
+    /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
+    uint8_t cached_insn_len; /* Zero if no cached instruction. */
+
+    /*
+     * Upper four bytes are undefined in the VMCB, therefore we can't use the
+     * fields in the VMCB. Write a 64bit value and then read a 64bit value is
+     * fine unless there's a VMRUN/VMEXIT in between which clears the upper
+     * four bytes.
+     */
+    uint64_t guest_sysenter_cs;
+    uint64_t guest_sysenter_esp;
+    uint64_t guest_sysenter_eip;
+};
 
 struct nestedsvm {
     uint64_t ns_msr_hsavepa; /* MSR HSAVE_PA value */
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
deleted file mode 100644
index d1e200df564c..000000000000
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ /dev/null
@@ -1,55 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * vmcb.h: VMCB related definitions
- * Copyright (c) 2005-2007, Advanced Micro Devices, Inc
- * Copyright (c) 2004, Intel Corporation.
- *
- */
-#ifndef __ASM_X86_HVM_SVM_VMCB_H__
-#define __ASM_X86_HVM_SVM_VMCB_H__
-
-#include <xen/types.h>
-
-struct svm_domain {
-    /* OSVW MSRs */
-    union {
-        uint64_t raw[2];
-        struct {
-            uint64_t length;
-            uint64_t status;
-        };
-    } osvw;
-};
-
-struct svm_vcpu {
-    struct vmcb_struct *vmcb;
-    u64    vmcb_pa;
-    unsigned long *msrpm;
-    int    launch_core;
-
-    uint8_t vmcb_sync_state; /* enum vmcb_sync_state */
-
-    /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
-    uint8_t cached_insn_len; /* Zero if no cached instruction. */
-
-    /* Upper four bytes are undefined in the VMCB, therefore we can't
-     * use the fields in the VMCB. Write a 64bit value and then read a 64bit
-     * value is fine unless there's a VMRUN/VMEXIT in between which clears
-     * the upper four bytes.
-     */
-    uint64_t guest_sysenter_cs;
-    uint64_t guest_sysenter_esp;
-    uint64_t guest_sysenter_eip;
-};
-
-#endif /* ASM_X86_HVM_SVM_VMCS_H__ */
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


