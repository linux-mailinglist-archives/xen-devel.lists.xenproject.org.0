Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385887D31B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 18:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693977.1082677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBjN-0003OT-7l; Fri, 15 Mar 2024 17:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693977.1082677; Fri, 15 Mar 2024 17:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBjN-0003LS-4Q; Fri, 15 Mar 2024 17:52:33 +0000
Received: by outflank-mailman (input) for mailman id 693977;
 Fri, 15 Mar 2024 17:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+CdM=KV=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1rlBjL-0002sX-4Y
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 17:52:31 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb15cd4d-e2f4-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 18:52:30 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33ed7ef0ae8so137624f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 10:52:30 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net
 (default-46-102-197-201.interdsl.co.uk. [46.102.197.201])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a5d69c6000000b0033e9f6997c7sm3631448wrw.66.2024.03.15.10.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 10:52:29 -0700 (PDT)
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
X-Inumbo-ID: cb15cd4d-e2f4-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710525149; x=1711129949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhANpMH0RmM2IazXWYR9pQ3eiDcQ2h+dRBwSMMkIqgk=;
        b=LKj7pryhWyugbzCwRfcBBbY2VW+UULNr2ePhyMDZZMsTzBqbXzIgYB/6OnSPJqH3fD
         lVSPwJyCQ1BjXX2ok1HiTU012xtoFgJvPZgxkvLHB6bp0UDas6Nh4iY9T94p6HpqBjUu
         tnLyzIV9KdfvcaA75uVIrLm6JSPfDfdYrsr0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525149; x=1711129949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhANpMH0RmM2IazXWYR9pQ3eiDcQ2h+dRBwSMMkIqgk=;
        b=jYAz4bOMQ2aUwl5o1zOaEDXpRgR4o8kyHxIBBI4OXhb/eLWUBD01aJwUn+nq+uvbSs
         Zl/7mn26k3Iulnd+2RKilnpgfNfTn1LXSdEH5Eg7KVR4Wrf849EJ2bqqcM3t7/tqAfjE
         IZbaOLOM50FAn7Ls+LrO0l3wY+Yy4f/hZRNeplJYpV9uBiZ+BHHrIU4vNCXR8RwqTNyD
         CTTvIbkWXqH/q2kE5x+AYqQSlVbpVjM0YtKRI0LRJHUFTJAOjUBLGjk1Uon4bCyJaPzU
         vjFupNey1970RrDvoM4XY2xq9Ftgt9MUCmFHoMvvMpX+v9OxX8r1daa5elPpx+S1IkiF
         GMIQ==
X-Gm-Message-State: AOJu0Yy0AMM33jdJVVdZBR79U4fznhtR2JFBJkIvoj/i88RMk5KN3Aqn
	9MkDicltejoImwKebfP6a1WjUQxvUmFAejMKSTNsadQmol7YTBM2Fi87tjYFINMI1jyfMtXaF7T
	i
X-Google-Smtp-Source: AGHT+IHbuMsADpmNOECnVBNngfrOhAuNJq6QcV5ZjMangmbYD50/9fKavTSvct6iL02sv/soYyNy4Q==
X-Received: by 2002:a5d:58c4:0:b0:33e:d8f:3466 with SMTP id o4-20020a5d58c4000000b0033e0d8f3466mr3295974wrf.33.1710525149322;
        Fri, 15 Mar 2024 10:52:29 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/2] x86: Refactor LBR feature to MSR_DEBUGCTL feature
Date: Fri, 15 Mar 2024 17:52:24 +0000
Message-Id: <2f690a115fc78989bfc2e331221d7e10b5dcb196.1710524011.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710524011.git.matthew.barnes@cloud.com>
References: <cover.1710524011.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last Branch Record and Bus Lock Detect both belong to the same MSR.

The same mechanism that restores LBR also restores BLD.

Therefore, the name of the feature that enables this mechanism should
reflect restoring the MSR, instead of one field.

No functional change.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/hvm/vmx/entry.S           | 4 ++--
 xen/arch/x86/include/asm/cpufeature.h  | 2 +-
 xen/arch/x86/include/asm/cpufeatures.h | 2 +-
 xen/arch/x86/traps.c                   | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index a0148f78584d..acfdc370289d 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -47,12 +47,12 @@ ENTRY(vmx_asm_vmexit_handler)
 
         /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
         mov host_msr_debugctl(%rip), %eax
-        .macro restore_lbr
+        .macro restore_msr_debugctl
             mov $MSR_IA32_DEBUGCTLMSR, %ecx
             xor %edx, %edx
             wrmsr
         .endm
-        ALTERNATIVE "", restore_lbr, X86_FEATURE_XEN_LBR
+        ALTERNATIVE "", restore_msr_debugctl, X86_FEATURE_XEN_MSR_DEBUGCTL
 
         mov  %rsp,%rdi
         call vmx_vmexit_handler
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 9bc553681f4a..084501c76a03 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -223,7 +223,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_aperfmperf      boot_cpu_has(X86_FEATURE_APERFMPERF)
 #define cpu_has_lfence_dispatch boot_cpu_has(X86_FEATURE_LFENCE_DISPATCH)
 #define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
-#define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
+#define cpu_has_xen_msr_debugctl boot_cpu_has(X86_FEATURE_XEN_MSR_DEBUGCTL)
 #define cpu_has_xen_shstk       (IS_ENABLED(CONFIG_XEN_SHSTK) && \
                                  boot_cpu_has(X86_FEATURE_XEN_SHSTK))
 #define cpu_has_xen_ibt         (IS_ENABLED(CONFIG_XEN_IBT) && \
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 7e8221fd85dd..060d7c1d5c9e 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -34,7 +34,7 @@ XEN_CPUFEATURE(SC_RSB_PV,         X86_SYNTH(18)) /* RSB overwrite needed for PV
 XEN_CPUFEATURE(SC_RSB_HVM,        X86_SYNTH(19)) /* RSB overwrite needed for HVM */
 XEN_CPUFEATURE(XEN_SELFSNOOP,     X86_SYNTH(20)) /* SELFSNOOP gets used by Xen itself */
 XEN_CPUFEATURE(SC_MSR_IDLE,       X86_SYNTH(21)) /* Clear MSR_SPEC_CTRL on idle */
-XEN_CPUFEATURE(XEN_LBR,           X86_SYNTH(22)) /* Xen uses MSR_DEBUGCTL.LBR */
+XEN_CPUFEATURE(XEN_MSR_DEBUGCTL,  X86_SYNTH(22)) /* Xen uses MSR_DEBUGCTL */
 XEN_CPUFEATURE(SC_DIV,            X86_SYNTH(23)) /* DIV scrub needed */
 XEN_CPUFEATURE(SC_RSB_IDLE,       X86_SYNTH(24)) /* RSB overwrite needed for idle. */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7d8eee013d00..16bef5d76620 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1940,7 +1940,7 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
         return;
 
     /* #DB automatically disabled LBR.  Reinstate it if debugging Xen. */
-    if ( cpu_has_xen_lbr )
+    if ( cpu_has_xen_msr_debugctl )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, host_msr_debugctl);
 
     if ( !guest_mode(regs) )
@@ -2129,10 +2129,10 @@ void percpu_traps_init(void)
             return;
         }
 
-        setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
+        setup_force_cpu_cap(X86_FEATURE_XEN_MSR_DEBUGCTL);
     }
 
-    if ( cpu_has_xen_lbr )
+    if ( cpu_has_xen_msr_debugctl )
     {
         host_msr_debugctl |= IA32_DEBUGCTLMSR_LBR;
         wrmsrl(MSR_IA32_DEBUGCTLMSR, host_msr_debugctl);
-- 
2.34.1


