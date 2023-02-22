Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5369F3D0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499399.770541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnZ-0000sZ-QY; Wed, 22 Feb 2023 12:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499399.770541; Wed, 22 Feb 2023 12:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnZ-0000mK-KR; Wed, 22 Feb 2023 12:00:37 +0000
Received: by outflank-mailman (input) for mailman id 499399;
 Wed, 22 Feb 2023 12:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnY-0000FF-6p
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:36 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83df4187-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:35 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id x10so28531088edd.13
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:35 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:34 -0800 (PST)
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
X-Inumbo-ID: 83df4187-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58ojOoNDnWoUZmyiyDiKwllMRC7EMTKC77s0cYAKiQs=;
        b=XgUEknz8X7C+j8NC9vaUD5dfDiMVudUsOd4Dl75Mpy42/lrlJCoY5c/bn8HRXZCN/A
         UCYPo5Fn59qpVit5vVufPupjkBxLg+MxTc1Db1xXZv8uwf8Cg87r7/3mv4HHHXvUur2w
         2Aj/uXmAoIxis2bMeiq1Mr6J8ERfSqIXMtEh5plPrWqZBbiL/y69UrO7cyBe7Of65vEb
         6wIM3A/Qa7g3hppbQSjz6AXQo4DUDxb0uRmEul/x8l1O8mhH9dfqdWz0S8O96ohjTw/s
         SW6syULDQ09JTTgISRgDhI/9/a9aJsyBEBC0Z3s+8iLQVrF/7Z4x1yWlNYY7ot4yv2FW
         IjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58ojOoNDnWoUZmyiyDiKwllMRC7EMTKC77s0cYAKiQs=;
        b=19tRrjMjPJrOUEivZlwWMz3QimWnmyrT2v6CJTRg0bl1rqhPtB0b2hgIsJrcfz5s+b
         6k5WGym7c0/7JLkPwEYvPdTbWKS688y8RerZGotX1ebolBczUfatxm8tefWQw6afopGY
         g8BcFWRxMze6dnCv4Y9Diajz72D17l1QZoHKbNkSYLmdtvu5uPls2Sa15t4w5nEOiJbl
         /djQoWmqOyVJllcu3XOr1KTX3LjrblLeY7wZH3clvowQ2InPucZCKjcu3j8yktxEMjgf
         YcV74HAqaqrWjaggS8/yJJhnqrCHCXbHKw/0BWPj6tg4CynuaiYdPC/T4n48Xxo/Bxh2
         EzGw==
X-Gm-Message-State: AO0yUKVnZbWiOStjTq6FYMg3XmfjPvpIJ/cmbs1AwWazJBCJrvNj53aq
	RK5t3pkNesR40Dw11+bR/AIEXbt8ziw=
X-Google-Smtp-Source: AK7set+BMqvFT3yhEj6etKOZAcECpL3SSt3qrQjDUEFp/IysmDyOAD68iIW0dXQxo+QCz7UiqCGVuA==
X-Received: by 2002:a17:907:d50c:b0:896:427b:148 with SMTP id wb12-20020a170907d50c00b00896427b0148mr15722125ejc.1.1677067235052;
        Wed, 22 Feb 2023 04:00:35 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/9] x86/svm: move declarations used only by svm code from svm.h to private header
Date: Wed, 22 Feb 2023 14:00:17 +0200
Message-Id: <20230222120023.3004624-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new private header in arch/x86/hvm/svm called svm.h and move there
all definitions and declarations that are used solely by svm code.

The function svm_invlpga() stays in arch/x86/hvm/svm/svm.h because it is used
by arch/x86/hvm/svm/asid.h.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
 - new patch, the creation of a private header was suggested by Andrew and Jan

I have not added #ifndef guards as it is a private and it should not be
included by other headers. However, this is considered a MISRA-C violation
... I 'm not sure what to do.

 xen/arch/x86/hvm/svm/nestedsvm.c       |  1 +
 xen/arch/x86/hvm/svm/svm.c             |  2 ++
 xen/arch/x86/hvm/svm/svm.h             | 40 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/svm/svm.h | 29 -------------------
 4 files changed, 43 insertions(+), 29 deletions(-)
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
index 0000000000..b2ec293078
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -0,0 +1,40 @@
+#include <xen/types.h>
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
+struct cpu_user_regs;
+
+unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
+void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
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
index c62d0caa32..254de55ee9 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -22,20 +22,6 @@
 
 #include <xen/types.h>
 
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
 static inline void svm_invlpga(unsigned long linear, uint32_t asid)
 {
     asm volatile (
@@ -45,11 +31,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
         "a" (linear), "c" (asid));
 }
 
-struct cpu_user_regs;
-
-unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
-void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
-
 /*
  * PV context switch helpers.  Prefetching the VMCB area itself has been shown
  * to be useful for performance.
@@ -95,14 +76,4 @@ extern u32 svm_feature_flags;
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


