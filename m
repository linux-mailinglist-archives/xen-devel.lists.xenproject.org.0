Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103291D7997
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jafgQ-00077G-RZ; Mon, 18 May 2020 13:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jafgP-00077A-Hj
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:19:53 +0000
X-Inumbo-ID: 41d15d00-990a-11ea-a863-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41d15d00-990a-11ea-a863-12813bfff9fa;
 Mon, 18 May 2020 13:19:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 25FF8B209;
 Mon, 18 May 2020 13:19:54 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] x86: clear RDRAND CPUID bit on AMD family 15h/16h
Message-ID: <4f76749b-54bd-7c39-6c90-279ce25cb57c@suse.com>
Date: Mon, 18 May 2020 15:19:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Inspired by Linux commit c49a0a80137c7ca7d6ced4c812c9e07a949f6f24:

    There have been reports of RDRAND issues after resuming from suspend on
    some AMD family 15h and family 16h systems. This issue stems from a BIOS
    not performing the proper steps during resume to ensure RDRAND continues
    to function properly.

    Update the CPU initialization to clear the RDRAND CPUID bit for any family
    15h and 16h processor that supports RDRAND. If it is known that the family
    15h or family 16h system does not have an RDRAND resume issue or that the
    system will not be placed in suspend, the "cpuid=rdrand" kernel parameter
    can be used to stop the clearing of the RDRAND CPUID bit.

    Note, that clearing the RDRAND CPUID bit does not prevent a processor
    that normally supports the RDRAND instruction from executing it. So any
    code that determined the support based on family and model won't #UD.

Warn if no explicit choice was given on affected hardware.

Check RDRAND functions at boot as well as after S3 resume (the retry
limit chosen is entirely arbitrary).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Still slightly RFC, and still in particular because of the change to
parse_xen_cpuid(): Alternative approach suggestions are welcome. But now
also because with many CPUs there may now be a lot of warnings in case
of issues.
---
v5: Extend a comment. Drop cpu_relax(). Mark is_forced_cpu_cap() __init.
v4: Check always, including during boot. Slightly better sanity check,
    inspired by Linux commit 7879fc4bdc7.
v3: Add call to warning_add(). If force-enabled, check RDRAND still
    functioning after S3 resume.
v2: Re-base.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -488,6 +488,10 @@ The Speculation Control hardware feature
 be ignored, e.g. `no-ibrsb`, at which point Xen won't use them itself, and
 won't offer them to guests.
 
+`rdrand` can be used to override the default disabling of the feature on certain
+AMD systems.  Its negative form can of course also be used to suppress use and
+exposure of the feature.
+
 ### cpuid_mask_cpu
 > `= fam_0f_rev_[cdefg] | fam_10_rev_[bc] | fam_11_rev_b`
 
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -4,6 +4,7 @@
 #include <xen/param.h>
 #include <xen/smp.h>
 #include <xen/pci.h>
+#include <xen/warning.h>
 #include <asm/io.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
@@ -747,6 +748,26 @@ static void init_amd(struct cpuinfo_x86
 		if (acpi_smi_cmd && (acpi_enable_value | acpi_disable_value))
 			amd_acpi_c1e_quirk = true;
 		break;
+
+	case 0x15: case 0x16:
+		/*
+		 * There are some Fam15/Fam16 systems where upon resume from S3
+		 * firmware fails to re-setup properly functioning RDRAND.
+		 * By the time we can spot the problem, it is too late to take
+		 * action, and there is nothing Xen can do to repair the problem.
+		 * Clear the feature unless force-enabled on the command line.
+		 */
+		if (c == &boot_cpu_data &&
+		    cpu_has(c, X86_FEATURE_RDRAND) &&
+		    !is_forced_cpu_cap(X86_FEATURE_RDRAND)) {
+			static const char __initconst text[] =
+				"RDRAND may cease to work on this hardware upon resume from S3.\n"
+				"Please choose an explicit cpuid={no-}rdrand setting.\n";
+
+			setup_clear_cpu_cap(X86_FEATURE_RDRAND);
+			warning_add(text);
+		}
+		break;
 	}
 
 	display_cacheinfo(c);
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -11,6 +11,7 @@
 #include <asm/io.h>
 #include <asm/mpspec.h>
 #include <asm/apic.h>
+#include <asm/random.h>
 #include <asm/setup.h>
 #include <mach_apic.h>
 #include <public/sysctl.h> /* for XEN_INVALID_{SOCKET,CORE}_ID */
@@ -98,6 +99,11 @@ void __init setup_force_cpu_cap(unsigned
 	__set_bit(cap, boot_cpu_data.x86_capability);
 }
 
+bool __init is_forced_cpu_cap(unsigned int cap)
+{
+	return test_bit(cap, forced_caps);
+}
+
 static void default_init(struct cpuinfo_x86 * c)
 {
 	/* Not much we can do here... */
@@ -498,6 +504,27 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	printk("\n");
 #endif
 
+	/*
+	 * If RDRAND is available, make an attempt to check that it actually
+	 * (still) works.
+	 */
+	if (cpu_has(c, X86_FEATURE_RDRAND)) {
+		unsigned int prev = 0;
+
+		for (i = 0; i < 5; ++i)
+		{
+			unsigned int cur = arch_get_random();
+
+			if (prev && cur != prev)
+				break;
+			prev = cur;
+		}
+
+		if (i >= 5)
+			printk(XENLOG_WARNING "CPU%u: RDRAND appears to not work\n",
+			       smp_processor_id());
+	}
+
 	if (system_state == SYS_STATE_resume)
 		return;
 
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -72,6 +72,9 @@ static int __init parse_xen_cpuid(const
             {
                 if ( !val )
                     setup_clear_cpu_cap(mid->bit);
+                else if ( mid->bit == X86_FEATURE_RDRAND &&
+                          (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
+                    setup_force_cpu_cap(X86_FEATURE_RDRAND);
                 mid = NULL;
             }
 
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -165,6 +165,7 @@ extern const struct x86_cpu_id *x86_matc
 extern void identify_cpu(struct cpuinfo_x86 *);
 extern void setup_clear_cpu_cap(unsigned int);
 extern void setup_force_cpu_cap(unsigned int);
+extern bool is_forced_cpu_cap(unsigned int);
 extern void print_cpu_info(unsigned int cpu);
 extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
 

