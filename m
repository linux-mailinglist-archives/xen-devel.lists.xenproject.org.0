Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CF9FF180
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2024 20:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863668.1275052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tShmi-00008l-Vx; Tue, 31 Dec 2024 19:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863668.1275052; Tue, 31 Dec 2024 19:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tShmi-000065-SF; Tue, 31 Dec 2024 19:20:08 +0000
Received: by outflank-mailman (input) for mailman id 863668;
 Tue, 31 Dec 2024 19:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oLC5=TY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tShmh-0008Vq-BB
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2024 19:20:07 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d9edc79-c7ac-11ef-a0db-8be0dac302b0;
 Tue, 31 Dec 2024 20:20:05 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361f796586so106577315e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2024 11:20:05 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a47c9b2efsm14205348f8f.91.2024.12.31.11.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 11:20:04 -0800 (PST)
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
X-Inumbo-ID: 3d9edc79-c7ac-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735672804; x=1736277604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKJNee8+koEDEhUpnEzgt+wwXlnSHYGx/h4AKjofkGI=;
        b=OuRPmN0/HW2wF4CDg2M4r8zcZaUULGWB0AqV4QLotGQBI6pCOyIpfwVejUhEEKYgDW
         0lA/evj/mDkQjO9XLzSyBNN9liYKO4WSD6ziTXXGQg6LR2cY6FMyhSmsLLhUtwDPC4zd
         Vkk03aK5BZvBgnrwSTwtsseF7WP2pCNK7ZEbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672804; x=1736277604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKJNee8+koEDEhUpnEzgt+wwXlnSHYGx/h4AKjofkGI=;
        b=WAQSdKxCGjpKpbhFOdYP5g8GYqXV8u9lebTdQ5PfzqN5mTUDxtS58j5P9hhik4fH0E
         6rDXYbSAoxdskGmXWZQyGUDJQDIpXZLVrAfYiwpGhvJ1Rnbk6hdMl0UD+NAGfVBo2Q6v
         eMIqHebwvU2KbMOd8jBPjH80KdvsA4YjRiopi4fHTU69rG2HViEFk19U8xSucdBTudiC
         9H/Zq8INwU1E+uRt5pL1CtOT8mC8dLUFu8wICGqDTZUBqOA+GKtWhRL3wpA4oLMD+Qvv
         aSXqoCn5RNASajOYqJjG42+YEXjyRqYsLDaBbdds4pV5IqIwdGKbcQn6l2R3PhX4CUVY
         dwBQ==
X-Gm-Message-State: AOJu0YwI3txC5gURVQ9QiBqbyk4mQdmXEo6YTcL0uzAlgft/+/sdANRD
	p1XO5gJJRSbgxGx59N16LJkogmnHg0atvgaVboTAys/mbauOig455ILdcOWNsI2jBP75k5yzbul
	AMpJL5Q==
X-Gm-Gg: ASbGncv3efFbPA6ICaVPIiTedWkicNeQLEHnI0EFnknETvUN9q5zP3m4j7XdKHOqPB8
	+KRygLANmbje7aLyX053nIv3e7Gr6gqgITU29fYPhBGlUZPM4A2mbWX2ZgAcYB2MHs05chtg3LM
	D4eLuC2QoTqZutltIsoO7cJkeqSMTQY1uS0oJ4rWnwpJo/E7DhuthvebpO3n/8S6mvZMPjvuXXC
	v8kI5m6kqxZwG+1i8fai89RKJAkNkiHxOTtGD9pskOyLjW+1Ouu+zJ2el+aLpbdmQ==
X-Google-Smtp-Source: AGHT+IEY1BUSmaKkGxGmKlNStEWO7pTkgxGUBRc0nN73AsGWI10o4S/9qM60oFBsJq17gUGt4o0p9g==
X-Received: by 2002:a5d:6481:0:b0:385:e2d5:cdf2 with SMTP id ffacd0b85a97d-38a221eaba2mr31848737f8f.19.1735672804560;
        Tue, 31 Dec 2024 11:20:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20] x86/traps: Rework LER initialisation and support Zen5/Diamond Rapids
Date: Tue, 31 Dec 2024 19:20:02 +0000
Message-Id: <20241231192002.1753737-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AMD have always used the architectural MSRs for LER.  As the first processor
to support LER was the K7 (which was 32bit), we can assume it's presence
unconditionally in 64bit mode.

Intel are about to run out of space in Family 6 and start using 19.  It is
only the Pentium 4 which uses non-architectural LER MSRs.

percpu_traps_init(), which runs on every CPU, contains a lot of code which
should be init-only, and is the only reason why opt_ler can't be in initdata.

Write a brand new init_ler() which expects all future Intel and AMD CPUs to
continue using the architectural MSRs, and does all setup together.  Call it
from trap_init(), and remove the setup logic percpu_traps_init() except for
the single path configuring MSR_IA32_DEBUGCTLMSR.

Leave behind a warning if the user asked for LER and Xen couldn't enable it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.20.  This is needed for Zen5 CPUs (already available) as well as Intel
CPUs coming shortly.  It also moves some non-init logic to being init-only.
---
 xen/arch/x86/traps.c | 86 ++++++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index fd8a4448e3f7..377194d7b620 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -114,7 +114,7 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_page, tss_page);
 static int debug_stack_lines = 20;
 integer_param("debug_stack_lines", debug_stack_lines);
 
-static bool __ro_after_init opt_ler;
+static bool __initdata opt_ler;
 boolean_param("ler", opt_ler);
 
 /* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
@@ -2092,56 +2092,10 @@ static void __init set_intr_gate(unsigned int n, void *addr)
     __set_intr_gate(n, 0, addr);
 }
 
-static unsigned int noinline __init calc_ler_msr(void)
-{
-    switch ( boot_cpu_data.x86_vendor )
-    {
-    case X86_VENDOR_INTEL:
-        switch ( boot_cpu_data.x86 )
-        {
-        case 6:
-            return MSR_IA32_LASTINTFROMIP;
-
-        case 15:
-            return MSR_P4_LER_FROM_LIP;
-        }
-        break;
-
-    case X86_VENDOR_AMD:
-        switch ( boot_cpu_data.x86 )
-        {
-        case 6:
-        case 0xf ... 0x19:
-            return MSR_IA32_LASTINTFROMIP;
-        }
-        break;
-
-    case X86_VENDOR_HYGON:
-        return MSR_IA32_LASTINTFROMIP;
-    }
-
-    return 0;
-}
-
 void percpu_traps_init(void)
 {
     subarch_percpu_traps_init();
 
-    if ( !opt_ler )
-        return;
-
-    if ( !ler_msr )
-    {
-        ler_msr = calc_ler_msr();
-        if ( !ler_msr )
-        {
-            opt_ler = false;
-            return;
-        }
-
-        setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
-    }
-
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
 }
@@ -2201,6 +2155,42 @@ void __init init_idt_traps(void)
         this_cpu(compat_gdt) = boot_compat_gdt;
 }
 
+static void __init init_ler(void)
+{
+    unsigned int msr = 0;
+
+    if ( !opt_ler )
+        return;
+
+    /*
+     * Intel Pentium 4 is the only known CPU to not use the architectural MSR
+     * indicies.
+     */
+    switch ( boot_cpu_data.x86_vendor )
+    {
+    case X86_VENDOR_INTEL:
+        if ( boot_cpu_data.x86 == 0xf )
+        {
+            ler_msr = MSR_P4_LER_FROM_LIP;
+            break;
+        }
+        fallthrough;
+    case X86_VENDOR_AMD:
+    case X86_VENDOR_HYGON:
+        ler_msr = MSR_IA32_LASTINTFROMIP;
+        break;
+    }
+
+    if ( msr == 0 )
+    {
+        printk(XENLOG_WARNING "LER disabled: failed to identy MSRs\n");
+        return;
+    }
+
+    ler_msr = msr;
+    setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
+}
+
 extern void (*const autogen_entrypoints[X86_NR_VECTORS])(void);
 void __init trap_init(void)
 {
@@ -2226,6 +2216,8 @@ void __init trap_init(void)
         }
     }
 
+    init_ler();
+
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
     this_cpu(gdt_l1e) =
         l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
-- 
2.39.5


