Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062E1B1EF79
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075033.1437580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcn-0000ck-8T; Fri, 08 Aug 2025 20:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075033.1437580; Fri, 08 Aug 2025 20:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcm-0000V3-K4; Fri, 08 Aug 2025 20:23:36 +0000
Received: by outflank-mailman (input) for mailman id 1075033;
 Fri, 08 Aug 2025 20:23:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcj-0005tW-A6
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8de1f6e8-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:32 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so20485505e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:32 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:31 -0700 (PDT)
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
X-Inumbo-ID: 8de1f6e8-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684612; x=1755289412; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnuSzFJrJdbU/x73TUxu0/lQq8zKDVIUYGotpIOmF90=;
        b=GSYQ0UK3j08cp6HhNdpxeLF0fIGzqVp+rei5YzBtzbuGG420GJF/8zbPN12LMCN8x2
         JDMkSGcjbcrcy4ubVjD31kBj/Qcu86wquEiofzgYu7+5L8Hr3SXuOoD0QYkHh4FXWfdx
         NIGTn1wo7t0brWGsjRfAaXw033jnnspuYWNhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684612; x=1755289412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnuSzFJrJdbU/x73TUxu0/lQq8zKDVIUYGotpIOmF90=;
        b=rsgRkpKXrL6M+bdbR8YwCP37Nu8QNeflNrcgCJRppeXVmy2pRkmzEhe96H7Jdi0VCq
         EMEdbV77SNiDWiy3VNPVxtPegxEs+gY3lankzQlMOgy6wyW/5xih2jJxT+xaBF6LzhUG
         x5GxJxti+LG9AVpWhQD37naDXFotuB220pyvOTk5qpvRcbz7pnGVIEO97J5UHwtONqht
         BHgOW0TuTHOgto7buXmCNdAxNwDlvViciKKtyKT9FjJS5MH3XSUVv0ytZ3YqzIEJUxze
         GZgPCrxyWJamjd5iQqEdx3AEq5G7pJ7Gh6t2LsmLaTGw0a1zIbWJTXJOfujX8OZzJ7m0
         pQ6g==
X-Gm-Message-State: AOJu0YzZEvQAvWeo4w1+Hn4R6FACMXKo8ZjsgC5QvuXttzvp6GM9H+UB
	Wo9Z4RmgcsCHRl4u5d+XMfWtaesgYShk8xsFRbXJNCiv2Jq8qBEFFTVHQ5BQ+tU3hUWSG9/qHU/
	pjBsWhE8=
X-Gm-Gg: ASbGnctxcC5FnT5W+miLQVn5hVaprTF3KYN7d7vT23rj/pPLJ1sboyTIdUIAvZRcl+3
	j8lfP+EiWKbXsuVQaAOUyLksSGLMImMOO34W28qG/nU3SlUasyednpB4RF4SHRp876c82JG856A
	Wx3ryuk97ns3m+hDr6fBT6PIsieM2It/qKgu9tKQauKkaGPhwXpbZZUv/TYfLNozkFO1aBH30fH
	VziQ4cF8kuD08oxsVYsn7+yTP5j8UrIBPX0eNArmzK/PRxQZznO8ZoqrkcSGNZ0v9gdD2cVkqaH
	+w+QeqJFboD9WH4/DJkT4FO9snomQfmpnRSqMH64LwoIyQQ+/2q7uLZkil+XLXNap4tTWDNav+P
	ACyww3MeW3flwRQbsAz/v/yphcZRi6jW8kqX+8smxbr5I2PxJ6AI47hAKPF4bkyx3L+JnBUp4vf
	VuX57V/VqJscY=
X-Google-Smtp-Source: AGHT+IG7hgWCsa4bQd2lSIYwBLbz9l3LdUBr7IJMT7qdKkc5WBbzt9hhSlaY9vrTRKlSGdJCpgQ8Ag==
X-Received: by 2002:a05:600c:354a:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-459f4f0f57fmr43002675e9.18.1754684611999;
        Fri, 08 Aug 2025 13:23:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 16/22] x86/boot: Adjust CR4 handling around ap_early_traps_init()
Date: Fri,  8 Aug 2025 21:23:08 +0100
Message-Id: <20250808202314.1045968-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ap_early_traps_init() will shortly be setting CR4.FRED.  This requires that
cpu_info->cr4 is already set up, and that the enablement of CET doesn't
truncate FRED back out because of it's 32bit logic.

For __high_start(), defer re-loading XEN_MINIMAL_CR4 until after %rsp is set
up and we can store the result in the cr4 field too.

For s3_resume(), explicitly re-load XEN_MINIMAL_CR4.  Later when loading all
features, use the mmu_cr4_features variable which is how the rest of Xen
performs this operation.

No functional change, yet.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/wakeup_prot.S | 18 ++++++++++++++----
 xen/arch/x86/boot/x86_64.S      | 15 ++++++++++-----
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 60eca4010042..dfc8c6ac6e8c 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -63,6 +63,14 @@ LABEL(s3_resume)
         pushq   %rax
         lretq
 1:
+
+        GET_STACK_END(15)
+
+        /* Enable minimal CR4 features. */
+        mov     $XEN_MINIMAL_CR4, %eax
+        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
+        mov     %rax, %cr4
+
         /* Set up early exceptions and CET before entering C properly. */
         call    ap_early_traps_init
 
@@ -77,7 +85,9 @@ LABEL(s3_resume)
         wrmsr
 
         /* Enable CR4.CET. */
-        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
+        mov     $X86_CR4_CET, %ecx
+        or      STACK_CPUINFO_FIELD(cr4)(%r15), %rcx
+        mov     %rcx, STACK_CPUINFO_FIELD(cr4)(%r15)
         mov     %rcx, %cr4
 
         /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
@@ -120,9 +130,9 @@ LABEL(s3_resume)
 .L_cet_done:
 #endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
 
-        /* Restore CR4 from the cpuinfo block. */
-        GET_STACK_END(bx)
-        mov     STACK_CPUINFO_FIELD(cr4)(%rbx), %rax
+        /* Load all CR4 settings. */
+        mov     mmu_cr4_features(%rip), %rax
+        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
         mov     %rax, %cr4
 
         call    mtrr_bp_restore
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 0dfcc8a88a40..631ea2f8236e 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -11,16 +11,19 @@ ENTRY(__high_start)
         mov     %ecx,%gs
         mov     %ecx,%ss
 
-        /* Enable minimal CR4 features. */
-        mov     $XEN_MINIMAL_CR4,%rcx
-        mov     %rcx,%cr4
-
         mov     stack_start(%rip),%rsp
 
         /* Reset EFLAGS (subsumes CLI and CLD). */
         pushq   $0
         popf
 
+        GET_STACK_END(15)
+
+        /* Enable minimal CR4 features. */
+        mov     $XEN_MINIMAL_CR4, %eax
+        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
+        mov     %rax, %cr4
+
         /* Reload code selector. */
         pushq   $__HYPERVISOR_CS
         leaq    1f(%rip),%rax
@@ -45,7 +48,9 @@ ENTRY(__high_start)
         wrmsr
 
         /* Enable CR4.CET. */
-        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
+        mov     $X86_CR4_CET, %ecx
+        or      STACK_CPUINFO_FIELD(cr4)(%r15), %rcx
+        mov     %rcx, STACK_CPUINFO_FIELD(cr4)(%r15)
         mov     %rcx, %cr4
 
         /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
-- 
2.39.5


