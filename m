Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57D8675B3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685524.1066371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVe-000527-Cl; Mon, 26 Feb 2024 12:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685524.1066371; Mon, 26 Feb 2024 12:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVe-0004yr-8M; Mon, 26 Feb 2024 12:55:06 +0000
Received: by outflank-mailman (input) for mailman id 685524;
 Mon, 26 Feb 2024 12:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1reaVc-0004yB-Ou
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:55:04 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 424aa120-d4a6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 13:55:03 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3ee69976c9so380968166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:55:03 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a42e4b5ab00sm2379645ejc.41.2024.02.26.04.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 04:55:03 -0800 (PST)
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
X-Inumbo-ID: 424aa120-d4a6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708952103; x=1709556903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w2NVQzEy0Ft7WjMPLYhygiLJCz4wsG8joT9atA1+T0=;
        b=hO9r8gen6CzVyADc0NrIgyyZkflG5+7qFTw+sHz425Qjga04nLlx6ulcglBkMGNXgs
         IRma+fEJ1U9h0he1Tb6EMnxuBVBBODpMHgT6bR0IPcR3bCgWcoUPvQQ8K9uADzfcJ24Z
         4yswxwlUtf07QHXz9KosETFyMKllIotwh+ATY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952103; x=1709556903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5w2NVQzEy0Ft7WjMPLYhygiLJCz4wsG8joT9atA1+T0=;
        b=TEZQdRKjgssPu+JimXKQk65koO3BoH1aDA/b9UhHjQ8Ct8msciNcC7JKAg/59O53h1
         iGU0Idn6iAdYzTbTOshtalB15R5b7xr7rVD26KYDPBOEpkO6oo7YukTcog4xj7L10V3y
         RFDpx6zcYOJJnlV9fy/zvhaR8xa5ILSzCUhdF3EDgAn/7bnAk7ixTKUmmSyLkFnzL/gK
         63AlBChtvEx2sGBXq6ivdwQwQ8zIA+Aqkqri6s2Pzv5DmDF6oQlTcNer+kxkgd+Y4SV0
         R95wPSX0hJYwyCN6TG7LXNAZwxJpgxkZGc7NKm0oTB5GPUQXA+aI6KuzaJweWFRQ85xN
         BUsA==
X-Gm-Message-State: AOJu0YyDZlyW1qKqt9C1zJK+3t55iik81gac45kj2S8UFArVxdKCFd5c
	hGbptDvuC/Ivrjsfam3Pc1Ihgy67jsPLI6ceHaV0X1g6/4l992FzvcpjjUcyl2ZHRBww0nPDQF2
	c
X-Google-Smtp-Source: AGHT+IGeaEd9YSZ7F9GJ7i9W2ZNEQs6xzaQ1pXBI/vZpIn9E1CaFfrRiUdzlb2w6xdIdhxRn+1+Jtg==
X-Received: by 2002:a17:906:b115:b0:a3f:5b9b:a17b with SMTP id u21-20020a170906b11500b00a3f5b9ba17bmr4178004ejy.53.1708952103233;
        Mon, 26 Feb 2024 04:55:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/entry: Adjustments to "reduce assembly code size of entry points"
Date: Mon, 26 Feb 2024 12:54:59 +0000
Message-Id: <20240226125501.1233599-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
References: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some retroactive review, for if I'd got to the patch in time.

 * The new ASM-friendly BUILD_BUG_ON() should be in a header file.
 * entry_int82() wants the movl->movb treatment too.

Fixes: c144b9e32427 ("x86: Reduce assembly code size of entry points")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Fixes just to link the two patches.
---
 xen/arch/x86/include/asm/asm_defns.h | 12 ++++++++++++
 xen/arch/x86/x86_64/compat/entry.S   |  2 +-
 xen/arch/x86/x86_64/entry.S          |  8 --------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index a9a6c21c76cd..f18a11b36198 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -56,6 +56,18 @@ register unsigned long current_stack_pointer asm("rsp");
 #define ASSERT_INTERRUPTS_DISABLED \
     ASSERT_INTERRUPT_STATUS(z, "INTERRUPTS DISABLED")
 
+#ifdef __ASSEMBLY__
+
+.macro BUILD_BUG_ON condstr cond:vararg
+        .if \cond
+        .error "Condition \"\condstr\" not satisfied"
+        .endif
+.endm
+/* preprocessor macro to make error message more user friendly */
+#define BUILD_BUG_ON(cond) BUILD_BUG_ON #cond cond
+
+#endif /* __ASSEMBLY__ */
+
 #ifdef __ASSEMBLY__
 # define _ASM_EX(p) p-.
 #else
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index d4f0e4804090..93fbbeb4ae18 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -15,7 +15,7 @@ FUNC(entry_int82)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
-        movl  $HYPERCALL_VECTOR, 4(%rsp)
+        movb  $HYPERCALL_VECTOR, 4(%rsp)
         SAVE_ALL compat=1 /* DPL1 gate, restricted to 32bit PV guests only. */
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index a7bd8f0ca5b1..f8938b0b42fd 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -22,14 +22,6 @@
 #endif
 .endm
 
-.macro BUILD_BUG_ON condstr cond:vararg
-        .if \cond
-        .error "Condition \"\condstr\" not satisfied"
-        .endif
-.endm
-/* preprocessor macro to make error message more user friendly */
-#define BUILD_BUG_ON(cond) BUILD_BUG_ON #cond cond
-
 #ifdef CONFIG_PV
 /* %rbx: struct vcpu */
 FUNC_LOCAL(switch_to_kernel)
-- 
2.30.2


