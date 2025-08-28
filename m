Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE18B3A3C6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099226.1453240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureI9-0006Pw-9N; Thu, 28 Aug 2025 15:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099226.1453240; Thu, 28 Aug 2025 15:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureI9-0006HD-12; Thu, 28 Aug 2025 15:11:57 +0000
Received: by outflank-mailman (input) for mailman id 1099226;
 Thu, 28 Aug 2025 15:11:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCB-00035A-HT
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:05:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7912cd7a-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:05:45 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b00f23eso7067165e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:05:45 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:05:43 -0700 (PDT)
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
X-Inumbo-ID: 7912cd7a-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393545; x=1756998345; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wp5Ao2JF9SiNp1dV4sf74WMjn/dBY90/S0pUt68oOqo=;
        b=wWhjJYUL6iUUbcAtllYVy7hIFH9WbgTmU+oul+ZUvHcRVtwz+GPbCJjEPn3PBjDwvt
         MzPw/2Ty/6sZiYl+Qf4yPb5rI8l6LJTmBvdWcBTFW5AOM8pvdCLzTE563bRatWVjVzMc
         YOGatqzncXML4hg7zOrMPX2B8J9o/4AnkLXHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393545; x=1756998345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wp5Ao2JF9SiNp1dV4sf74WMjn/dBY90/S0pUt68oOqo=;
        b=Hsz84qSPzp6hqBbV6IjhI2c7L2+BskF6jKYPEjewGns3cdiz7MwWR4zS7ykeb3YBfw
         xAVmM23iubR9F6Q6/KyAwEx4mwFlNoxfGwZ0lGyru5gAChJjFtkhszpc3V7dC4q8AdmF
         yq5OokFSCNzfF1b896I4LRTQqCo7r1i1F3xYPy8wwe7+5zpfbdGbkNWj/865CTEobHuu
         52EQPpv5EybapM/adV/f5hB0LxRhAOZQq0q+H31AzUaUoTlAuPIsFdfg4ilLnp93rDVH
         sWdY0mXe5KqhH66JYHSoIsPAtWC0bc4EnoQgHvJXvuKM/PAnzMkgO+O6iU3poHeEnCix
         KA1g==
X-Gm-Message-State: AOJu0Yy+guPjvqxR/Bm6DhTcsAmXCt1312dOV4/I0KwPx+cuy424ga+p
	runRFEENXHdoCCeah2PkV8A+sEEjhI/3C++7W8he+eFipSzqumZDLzZYAwih1MpbCUBOh7dBMyg
	GV9hZ
X-Gm-Gg: ASbGncvHaB9Zkb9zrUj+s6GcqcNyCtG5wePIpYtQLb4r4d9zVc+tOLGqrIcp7L9it/C
	ZaaGLapwhD1S/zhvG2uo05cZACcYr+mSlRXDe6y3hUxUGaC6fphAGbnEHm46DbnwmDsl6rNaWjI
	In9ekxso+Jp2j0nxXTpWFbY4a5o2VlzKr9wzLk9DywKaW/jAjnCJpngwgPT0BUE5A0mBEG+ZPVq
	/9VfoX34odCMUBVW4Klh2v9wt+/7GunT8KvKtL6vHjJt6aN7CSk4ihfR/abWkW7KDcre1CXktCg
	lCshM8jGk41ge3jXBaPb6nv7WN+3RQ9ZYek5GpgUViWp9D2j5QEP6sNUY78ANr2ckrzMQ8pSkO8
	CxvMP9Ifk/mT/XkNHfAKjRWaQDNnTJndD/OY2fZXi9JLrKCnJrMJkRVWYVJEFbzZKL4AA7a2XC1
	pTmm0dgzBDoGQ=
X-Google-Smtp-Source: AGHT+IF7hXOcAj2k1kdTWbZDnHe2i2swNCPBNOS2g6Z9lsG3n/J6g13KEv6Z7zdBR196Rvr/1VVwlw==
X-Received: by 2002:a05:600c:190a:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-45b517954bfmr233867805e9.8.1756393544555;
        Thu, 28 Aug 2025 08:05:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 04/23] x86/boot: Adjust CR4 handling around percpu_early_traps_init()
Date: Thu, 28 Aug 2025 16:03:50 +0100
Message-Id: <20250828150409.901315-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

percpu_early_traps_init() will shortly be setting CR4.FRED.  This requires that
cpu_info->cr4 is already set up, and that the enablement of CET doesn't
truncate X86_CR4_FRED back out because of 32bit logic.

For __high_start(), defer re-loading XEN_MINIMAL_CR4 until after %rsp is set
up and we can store the result in the cr4 field too.

For s3_resume(), explicitly re-load XEN_MINIMAL_CR4.  Later when loading all
features, use the mmu_cr4_features variable which is how the rest of Xen
performs this operation.

No functional change, yet.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Extend comments
---
 xen/arch/x86/acpi/wakeup_prot.S | 18 ++++++++++++++----
 xen/arch/x86/boot/x86_64.S      | 15 ++++++++++-----
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index cc40fddc38d4..0f02ea7b4b9a 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -63,6 +63,14 @@ LABEL(s3_resume)
         pushq   %rax
         lretq
 1:
+
+        GET_STACK_END(15)
+
+        /* Enable minimal CR4 features, sync cached state. */
+        mov     $XEN_MINIMAL_CR4, %eax
+        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
+        mov     %rax, %cr4
+
         /* Set up early exceptions and CET before entering C properly. */
         call    percpu_early_traps_init
 
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
index d0e7449a149f..3a5ad2764448 100644
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
+        /* Enable minimal CR4 features, sync cached state. */
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


