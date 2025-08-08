Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E7B1EF72
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075024.1437514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcf-0007En-Dc; Fri, 08 Aug 2025 20:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075024.1437514; Fri, 08 Aug 2025 20:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcf-00077k-7L; Fri, 08 Aug 2025 20:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1075024;
 Fri, 08 Aug 2025 20:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcd-0005tW-EJ
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:27 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a5e068f-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:27 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso1813886f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:27 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:25 -0700 (PDT)
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
X-Inumbo-ID: 8a5e068f-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684606; x=1755289406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVi01EX33hOUrp3MMSd3/Vp73DFlKzoPe7RHBP32PRE=;
        b=l2P59wmR4jF4FKc2/fKvU95WSbrQAzwaU+aEzmgAztNdISJOfT+dgxwdWQcnXieHYR
         1B0q+GYlYYhCsINrmv6L8x2ZZ52+GcmJaOrcd5drkU2qVEqWI10wUkY10W9Qi98azZBo
         J2uPX5IPudEtG0THuGlnRJKZeAAjF6orlrNNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684606; x=1755289406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVi01EX33hOUrp3MMSd3/Vp73DFlKzoPe7RHBP32PRE=;
        b=fScvTiAf+Ymj3prVS+Maz3gaTlSrBO1Kclj8J4WLUqJgKFO3wZ5UCUSwmX5uo6IgrA
         CbNpK0DkHHvstLDiaDrQBqAx9KnbOMaztA4xSoFfJs9FKZO/bZ8qkc9+VzTbQvCCGk66
         qWTrmg8tYpp3tTiXbMBh3PIPDWoAUEvNiO0LQZH9OsUm00VXNYUK6AxV/8VAp5JJAgJ3
         gWcSkpUfeOM9jLzPjoTYwQbtz5SFu7BMWL8eYg3jFUwqzAvw7+aOZ5TnBSK1lQVYnD0C
         QTL73cOt4ZBefWm2H+TQKmicUlokSdHZiEjB77robdjUs6mrU8BkqB78A+n+U+/gjcLM
         eqQA==
X-Gm-Message-State: AOJu0YyuvMcmuTKVNwJiTU6WrrcFKk1P+JLn20j+4Yr/pWtZ0dkD/tif
	OWUac8UHPjZHLJbjJz980xGSv78EceoeevPbJ8VIptDmEKroC/OdgaePiwhBiNVQSa8gj5RPlUN
	nocbe8Dw=
X-Gm-Gg: ASbGncuC4m+JkGGlBoLqzRgb9VbyGv5YGbDD7OutVHFiKw59KibhO5jKzi9UxqvgSrf
	OEoCd1cYBcR5dNIKIuWto05BLz7ICSq66PKLZSteplidNnPWGGemW865vWjwjplwLVlpVMSdKFE
	NinBGYns0YFN6V4QEJ63LQ5aGc9CIDvlOdDODCjW28MUm/Rx1BDZDFEwYeZh3HbS1BKIYJgeHtX
	GGEBFI2SyAcs9QDjHqnI3b0+kLgDFqblnLIUOl01ibq0eVPJWJ1e6l6V6J13JqHZPyhmuz5RITw
	c5u/qxWjG1TEiEa9zI+8+Ac7DTGKHxDbY+Mba/GElmEXWHWrhBBLYzAgSYj2BbrWr1SDnSW6rAU
	pyd+jEw1kNVBRjxwYANssyFDEqZ6832T5wg3KP3xGHgHejOm+02FJZ9S8P0NUSV11XHE9uOfynF
	Ho
X-Google-Smtp-Source: AGHT+IFcWAFnsh+w6TGUK7qxOIWp6b3CF1PqJ7dhPI4YKqhFhpNG4OBh3gsO+Yg3uQaEBt5spBU4Fg==
X-Received: by 2002:a05:6000:400b:b0:3b7:61e5:a8a5 with SMTP id ffacd0b85a97d-3b900b83578mr3949467f8f.47.1754684606025;
        Fri, 08 Aug 2025 13:23:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/22] x86/traps: Introduce ap_early_traps_init() and set up exception handling earlier
Date: Fri,  8 Aug 2025 21:23:00 +0100
Message-Id: <20250808202314.1045968-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As things stand, we set up AP/S3 exception handling marginally after the
fragile activity of setting up shadow stacks.  Shadow stack setup is going to
get more complicated under FRED.

Introduce ap_early_traps_init() and call it ahead of setting up shadow stacks.
To start with, call load_system_tables() which is sufficient to set up full
exception handling.

In order to handle exceptions, current and the speculation controls needs to
work.  cpu_smpboot_alloc() already constructs some of the AP's top-of-stack
block, so have it set up a little more.

This gets us complete exception coverage of setting up shadow stacks, rather
than dying with a triple fault.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/wakeup_prot.S |  5 +++--
 xen/arch/x86/boot/x86_64.S      |  5 ++++-
 xen/arch/x86/smpboot.c          | 17 ++++-------------
 xen/arch/x86/traps-setup.c      | 12 ++++++++++++
 4 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 92af6230b31f..60eca4010042 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -63,6 +63,9 @@ LABEL(s3_resume)
         pushq   %rax
         lretq
 1:
+        /* Set up early exceptions and CET before entering C properly. */
+        call    ap_early_traps_init
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
index 95a6b6cf63bd..0dfcc8a88a40 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -30,7 +30,10 @@ ENTRY(__high_start)
         test    %ebx,%ebx
         jz      .L_bsp
 
-        /* APs.  Set up CET before entering C properly. */
+        /* APs.  Set up early exceptions and CET before entering C properly. */
+
+        call    ap_early_traps_init
+
 #if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
         call    xen_msr_s_cet_value
         test    %eax, %eax
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index ce4862dde5a7..8af6556999d7 100644
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
 
@@ -1064,8 +1051,12 @@ static int cpu_smpboot_alloc(unsigned int cpu)
             goto out;
 
     info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
+    memset(info, 0, sizeof(*info));
+    init_shadow_spec_ctrl_state(info);
     info->processor_id = cpu;
     info->per_cpu_offset = __per_cpu_offset[cpu];
+    info->current_vcpu = idle_vcpu[cpu];
+    per_cpu(curr_vcpu, cpu) = idle_vcpu[cpu];
 
     gdt = per_cpu(gdt, cpu) ?: alloc_xenheap_pages(0, memflags);
     if ( gdt == NULL )
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 370f4d5f7b60..8ca379c9e4cb 100644
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
+void asmlinkage ap_early_traps_init(void)
+{
+    load_system_tables();
+}
-- 
2.39.5


