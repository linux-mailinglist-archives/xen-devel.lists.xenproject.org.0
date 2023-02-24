Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1376A21C3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501413.773153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9A-0001oe-EP; Fri, 24 Feb 2023 18:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501413.773153; Fri, 24 Feb 2023 18:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9A-0001m7-8d; Fri, 24 Feb 2023 18:50:20 +0000
Received: by outflank-mailman (input) for mailman id 501413;
 Fri, 24 Feb 2023 18:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd98-0001Wv-4B
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:18 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14bfc9df-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:17 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id cq23so1153781edb.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:17 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:16 -0800 (PST)
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
X-Inumbo-ID: 14bfc9df-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScwbromLqQzqYYYpYwRfyt5tCHilx4TfocktUtAVLMw=;
        b=imsg0nhoS2lUO0ejUqH5ReEs5g1iPOUXNMG0gXXT+zTgb0LKTjD4Tzpw/dreiswITJ
         6RcEN9yg7Jnptj7GcpBW1Adc6x/Px8M1KmADIsipt2XQ1E5NNYKf8EfwnzyGk3iFiY6X
         dc3FBkIm4yT6VKu2cC3eRfc1kWvSluLjxoqo64mWyVV+e52l1hnUhgMBYvOuP5tYXRlM
         Rfd2wUIwz4sGx52UXdJXi2W1JmmGWDzTsHm7QkhXmckENPca+FN3t4JyAwbCK2BOtLB/
         QwQhKzBZQ+iW66p8mgkD1xXYlscnQa+CCG+5kaJGgWYhAGndoJoefVXdiyCQk2S8ykos
         nycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScwbromLqQzqYYYpYwRfyt5tCHilx4TfocktUtAVLMw=;
        b=ikoNIfE0cxaoKKjyQocaudJcI9W4m3hSjrDNqHTniuetCJve5Kbbr6nSMtirqPzXYN
         5Fdr4W52IoQYucsViRxVBbisgjbcdOhN4VIcH2CWaaamfiPj+LjmBpfKPM0mpHXlo0sD
         0DRJB+LZKhfWtBHSPFp8UD5nuhbfTrQtLKPPALqatS9er4dCwDVFF14asUW3KEJPt/ri
         EyVY1b3JGLxWHLmBHqzbCqHKUG5YYdGEZyRysiqW1NKgNGn9DzCZjVXioXQYuvji41HP
         CbZB44+5BcvhSRP9WfmfTkQPEHa1oGcSGGBaf66/puCkV6mBiWWH2fa6q3iKZiCwsY1I
         wW5w==
X-Gm-Message-State: AO0yUKX8UbcXCoEf2GdiscTsJJX+TpbvNjZjSULCsIngZ8yIGepjW3IS
	c2kH8rg54SULrY9XesFC6VFEj4X8RcY=
X-Google-Smtp-Source: AK7set+cVi/w59x3bEbuJP1hWtElJc4+bNCGVmyhyPPnhZd7wAT6Q8FRGFrb7dZx/jeBefRhvhWilQ==
X-Received: by 2002:a05:6402:510f:b0:4af:6e08:319 with SMTP id m15-20020a056402510f00b004af6e080319mr769584edd.15.1677264617008;
        Fri, 24 Feb 2023 10:50:17 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 01/14] x86/svm: move declarations used only by svm code from svm.h to private header
Date: Fri, 24 Feb 2023 20:49:57 +0200
Message-Id: <20230224185010.3692754-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new private header in arch/x86/hvm/svm called svm.h and move there
all definitions and declarations that are used solely by svm code.

Take the opportunity to remove the forward declaration of struct vcpu, that is
a leftover since the removal of svm_update_guest_cr()'s declaration.

Take the opportunity to re-arrange the header as follows, all structures first,
then all variable decalarations, all function delarations, and finally all
inline functions.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - add SPDX identifier in priv header, reported by Andrew
  - add #ifndef header guard, reported by Andrew and Jan
  - move svm_invlpga() as well, it was not called anyway
  - fold patch removing redundant forward declaration of struct vcpu into
    this patch, suggested by Andrew
  - rearrange the header in the way Jan's proposed
  - update commit message

 xen/arch/x86/hvm/svm/nestedsvm.c       |  1 +
 xen/arch/x86/hvm/svm/svm.c             |  2 +
 xen/arch/x86/hvm/svm/svm.h             | 62 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/svm/svm.h | 41 -----------------
 4 files changed, 65 insertions(+), 41 deletions(-)
 create mode 100644 xen/arch/x86/hvm/svm/svm.h

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 77f7547360..a341ccc876 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -27,6 +27,7 @@
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
 #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
 
+#include "svm.h"
 
 #define NSVM_ERROR_VVMCB        1
 #define NSVM_ERROR_VMENTRY      2
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 9c43227b76..6d394e4fe3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -55,6 +55,8 @@
 
 #include <public/sched.h>
 
+#include "svm.h"
+
 void noreturn svm_asm_do_resume(void);
 
 u32 svm_feature_flags;
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
new file mode 100644
index 0000000000..9e65919757
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * svm.h: SVM Architecture related definitions
+ *
+ * Copyright (c) 2005, AMD Corporation.
+ * Copyright (c) 2004, Intel Corporation.
+ */
+
+#ifndef __X86_HVM_SVM_SVM_PRIV_H__
+#define __X86_HVM_SVM_SVM_PRIV_H__
+
+#include <xen/types.h>
+
+struct cpu_user_regs;
+
+unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
+void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
+
+static inline void svm_vmload_pa(paddr_t vmcb)
+{
+    asm volatile (
+        ".byte 0x0f,0x01,0xda" /* vmload */
+        : : "a" (vmcb) : "memory" );
+}
+
+static inline void svm_vmsave_pa(paddr_t vmcb)
+{
+    asm volatile (
+        ".byte 0x0f,0x01,0xdb" /* vmsave */
+        : : "a" (vmcb) : "memory" );
+}
+
+static inline void svm_invlpga(unsigned long linear, uint32_t asid)
+{
+    asm volatile (
+        ".byte 0x0f,0x01,0xdf"
+        : /* output */
+        : /* input */
+        "a" (linear), "c" (asid));
+}
+
+/* TSC rate */
+#define DEFAULT_TSC_RATIO       0x0000000100000000ULL
+#define TSC_RATIO_RSVD_BITS     0xffffff0000000000ULL
+
+/* EXITINFO1 fields on NPT faults */
+#define _NPT_PFEC_with_gla     32
+#define NPT_PFEC_with_gla      (1UL<<_NPT_PFEC_with_gla)
+#define _NPT_PFEC_in_gpt       33
+#define NPT_PFEC_in_gpt        (1UL<<_NPT_PFEC_in_gpt)
+
+#endif /* __X86_HVM_SVM_SVM_PRIV_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index cf9ed517d5..7d5de0122a 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -20,37 +20,6 @@
 #ifndef __ASM_X86_HVM_SVM_H__
 #define __ASM_X86_HVM_SVM_H__
 
-#include <xen/types.h>
-
-static inline void svm_vmload_pa(paddr_t vmcb)
-{
-    asm volatile (
-        ".byte 0x0f,0x01,0xda" /* vmload */
-        : : "a" (vmcb) : "memory" );
-}
-
-static inline void svm_vmsave_pa(paddr_t vmcb)
-{
-    asm volatile (
-        ".byte 0x0f,0x01,0xdb" /* vmsave */
-        : : "a" (vmcb) : "memory" );
-}
-
-static inline void svm_invlpga(unsigned long linear, uint32_t asid)
-{
-    asm volatile (
-        ".byte 0x0f,0x01,0xdf"
-        : /* output */
-        : /* input */
-        "a" (linear), "c" (asid));
-}
-
-struct cpu_user_regs;
-struct vcpu;
-
-unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
-void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
-
 /*
  * PV context switch helpers.  Prefetching the VMCB area itself has been shown
  * to be useful for performance.
@@ -96,14 +65,4 @@ extern u32 svm_feature_flags;
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
 
-/* TSC rate */
-#define DEFAULT_TSC_RATIO       0x0000000100000000ULL
-#define TSC_RATIO_RSVD_BITS     0xffffff0000000000ULL
-
-/* EXITINFO1 fields on NPT faults */
-#define _NPT_PFEC_with_gla     32
-#define NPT_PFEC_with_gla      (1UL<<_NPT_PFEC_with_gla)
-#define _NPT_PFEC_in_gpt       33
-#define NPT_PFEC_in_gpt        (1UL<<_NPT_PFEC_in_gpt)
-
 #endif /* __ASM_X86_HVM_SVM_H__ */
-- 
2.37.2


