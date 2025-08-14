Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E15B26E98
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 20:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082265.1442214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcMl-0004v0-Fi; Thu, 14 Aug 2025 18:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082265.1442214; Thu, 14 Aug 2025 18:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcMl-0004tY-By; Thu, 14 Aug 2025 18:07:55 +0000
Received: by outflank-mailman (input) for mailman id 1082265;
 Thu, 14 Aug 2025 18:07:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umcMk-0004tS-DA
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 18:07:54 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981e746b-7939-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 20:07:52 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a207aef58so565585e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 11:07:52 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8ff860acbsm25345824f8f.51.2025.08.14.11.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 11:07:50 -0700 (PDT)
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
X-Inumbo-ID: 981e746b-7939-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755194871; x=1755799671; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pkgY3Ci0S+KloWF5rHnFY8ifcBvH5plQNSURnhdoKY=;
        b=rmtYo5TGgcP6vFjyHaXg3Mv04hmHfOmXmE0IbQtrbwKA1XiWE1RNoxVhM0tx9CAb8g
         7YyxF9aZJ1AoYbWNTkTl7wbjbtOGRdYCmhBnVfNgnCsHNr5VwquHAr5tmwvtqDyWncbv
         LcfJc4QlmdKTd8ZeHWA2AxVqHCkrExsAvkfzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755194871; x=1755799671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pkgY3Ci0S+KloWF5rHnFY8ifcBvH5plQNSURnhdoKY=;
        b=VLmwrCmS+xA4h+axHf2YaCtsmcmJIMQTJblMO064AFdc7VpgVSU3v5TY20x3r6AX9y
         xmgjvgJfnBMNxpg+paFwUdjkk6DR/oOiqSxIigLqaPGRrhPuwAlK+65VbVL7SPItqMfY
         2pn/z+O34/A00+sFdReDd2h3x0TU11A0+FnrWGyRx/UO6s2uaDJ0Cm61/LcWDSfItOYA
         IYutjet3eS9a2gLJ2T+RpE4WMv9XlZeNh6tjR9Gx9wAs6faeY7IZwPbkyxGeTmCtoEiL
         a0Fnz++Hb2e4Rm6ZM8OeW7Bo55tE7eZiiReoZpvbJ5swScVfIYqe8y7aA6dysluucIT5
         QXkw==
X-Gm-Message-State: AOJu0YzfNvcbSaW9L63G3tUiMInq9Jga7mDYeLfYR/fMKv73zTRvvWz3
	3EdfmazOVM/8JcSIK6O3yY0MVVBl8ll4V+cgDx3M6kNBejOPWJHR/0NN4/TUFRDqe9V2+EyyPHM
	7DsyO
X-Gm-Gg: ASbGncvKmpM1S62ETuqgaJfsff25WaqpCvKIWFITjr2qKnyFa/hAOv/om917hY9JIcK
	gwIeniKx94vaYTbreU5c7IfB/bdiJ8GfWzuEv9q3EahnaSHX2+bIcZPBISd67ys5uDQOe2X7Hu3
	IQ62Gu60I/wP7Eg1BuRL8zaQRyHybsCJpf+QHymJa+6gdjqujFLkoixA3cxIqc17++pLPWbsSzy
	pfImsoiRdI7NHSFJYqfecWR9m6oNRWA2YcF8+W9UrEAbGF2fWVfxp6UpC3BNSyzFyGfZU7CnhWq
	9NvbtbSGVceQwiOLKirk7RaHVmu0WG8vgKXlQJkGomjYHu6BJ6o9+p8nEXOVakJujyxoNTD5cFm
	mQnfqAgke2zMOr2FuJTm7MTW1uLfyOHa5XLaAvizjuPKmzyn9JkdthMkpFE4rEnMqmIOzhfLt7G
	9h
X-Google-Smtp-Source: AGHT+IED7jhBoBGqAQq90HTQh8vZ1TU5nMlDO7A8ImLuxr3k/87DhKvz/z5+RnXy1M8QB7TOfJwjlA==
X-Received: by 2002:a05:6000:400b:b0:3b7:775d:e923 with SMTP id ffacd0b85a97d-3ba506624edmr3110458f8f.4.1755194871320;
        Thu, 14 Aug 2025 11:07:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1.1 08/22] x86/traps: Introduce percpu_early_traps_init() and set up exception handling earlier
Date: Thu, 14 Aug 2025 19:07:48 +0100
Message-Id: <20250814180748.2532533-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-9-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-9-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As things stand, we set up AP/S3 exception handling marginally after the
fragile activity of setting up shadow stacks.  Shadow stack setup is going to
get more complicated under FRED.

Introduce percpu_early_traps_init() and call it ahead of setting up shadow
stacks.  To start with, call load_system_tables() which is sufficient to set
up full exception handling.

In order to handle exceptions, current and the speculation controls needs to
work.  cpu_smpboot_alloc() already constructs some of the AP's top-of-stack
block, so have it set up a little more.  Zero the whole structure to subsume
other misc setup.

This gets us complete exception coverage of setting up shadow stacks, rather
than dying with a triple fault.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rename to percpu_early_traps_init()
 * Reorder setup
---
 xen/arch/x86/acpi/wakeup_prot.S |  5 +++--
 xen/arch/x86/boot/x86_64.S      |  5 ++++-
 xen/arch/x86/smpboot.c          | 19 ++++++-------------
 xen/arch/x86/traps-setup.c      | 12 ++++++++++++
 4 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 92af6230b31f..cc40fddc38d4 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -63,6 +63,9 @@ LABEL(s3_resume)
         pushq   %rax
         lretq
 1:
+        /* Set up early exceptions and CET before entering C properly. */
+        call    percpu_early_traps_init
+
 #if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
         call    xen_msr_s_cet_value
         test    %eax, %eax
@@ -117,8 +120,6 @@ LABEL(s3_resume)
 .L_cet_done:
 #endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
 
-        call    load_system_tables
-
         /* Restore CR4 from the cpuinfo block. */
         GET_STACK_END(bx)
         mov     STACK_CPUINFO_FIELD(cr4)(%rbx), %rax
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 95a6b6cf63bd..d0e7449a149f 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -30,7 +30,10 @@ ENTRY(__high_start)
         test    %ebx,%ebx
         jz      .L_bsp
 
-        /* APs.  Set up CET before entering C properly. */
+        /* APs.  Set up early exceptions and CET before entering C properly. */
+
+        call    percpu_early_traps_init
+
 #if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
         call    xen_msr_s_cet_value
         test    %eax, %eax
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index ce4862dde5a7..efb5adb3a12a 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -327,12 +327,7 @@ void asmlinkage start_secondary(void)
     struct cpu_info *info = get_cpu_info();
     unsigned int cpu = smp_processor_id();
 
-    /* Critical region without IDT or TSS.  Any fault is deadly! */
-
-    set_current(idle_vcpu[cpu]);
-    this_cpu(curr_vcpu) = idle_vcpu[cpu];
     rdmsrl(MSR_EFER, this_cpu(efer));
-    init_shadow_spec_ctrl_state(info);
 
     /*
      * Just as during early bootstrap, it is convenient here to disable
@@ -352,14 +347,6 @@ void asmlinkage start_secondary(void)
      */
     spin_debug_disable();
 
-    get_cpu_info()->use_pv_cr3 = false;
-    get_cpu_info()->xen_cr3 = 0;
-    get_cpu_info()->pv_cr3 = 0;
-
-    load_system_tables();
-
-    /* Full exception support from here on in. */
-
     if ( cpu_has_pks )
         wrpkrs_and_cache(0); /* Must be before setting CR4.PKS */
 
@@ -1064,9 +1051,15 @@ static int cpu_smpboot_alloc(unsigned int cpu)
             goto out;
 
     info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
+    memset(info, 0, sizeof(*info));
     info->processor_id = cpu;
     info->per_cpu_offset = __per_cpu_offset[cpu];
 
+    init_shadow_spec_ctrl_state(info);
+
+    info->current_vcpu = idle_vcpu[cpu]; /* set_current() */
+    per_cpu(curr_vcpu, cpu) = idle_vcpu[cpu];
+
     gdt = per_cpu(gdt, cpu) ?: alloc_xenheap_pages(0, memflags);
     if ( gdt == NULL )
         goto out;
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 99257bbb16ec..758c67b335bd 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -127,3 +127,15 @@ void percpu_traps_init(void)
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
 }
+
+/*
+ * Configure exception handling on APs and S3.  Called before entering C
+ * properly, and before shadow stacks are activated.
+ *
+ * boot_gdt is currently loaded, and we must switch to our local GDT.  The
+ * local IDT has unknown IST-ness.
+ */
+void asmlinkage percpu_early_traps_init(void)
+{
+    load_system_tables();
+}
-- 
2.39.5


