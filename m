Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146EB19BDB8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 10:44:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJvPu-0001Rc-Ku; Thu, 02 Apr 2020 08:41:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJvPt-0001RX-D5
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 08:41:37 +0000
X-Inumbo-ID: c2c57674-74bd-11ea-bb8b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2c57674-74bd-11ea-bb8b-12813bfff9fa;
 Thu, 02 Apr 2020 08:41:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7958AF38;
 Thu,  2 Apr 2020 08:41:33 +0000 (UTC)
Subject: Ping: [PATCH v4] x86: clear RDRAND CPUID bit on AMD family 15h/16h
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
Message-ID: <545d771a-dc8b-3764-e8f4-8871b1a27770@suse.com>
Date: Thu, 2 Apr 2020 10:34:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.03.2020 10:08, Jan Beulich wrote:
> Inspired by Linux commit c49a0a80137c7ca7d6ced4c812c9e07a949f6f24:
> 
>     There have been reports of RDRAND issues after resuming from suspend on
>     some AMD family 15h and family 16h systems. This issue stems from a BIOS
>     not performing the proper steps during resume to ensure RDRAND continues
>     to function properly.
> 
>     Update the CPU initialization to clear the RDRAND CPUID bit for any family
>     15h and 16h processor that supports RDRAND. If it is known that the family
>     15h or family 16h system does not have an RDRAND resume issue or that the
>     system will not be placed in suspend, the "cpuid=rdrand" kernel parameter
>     can be used to stop the clearing of the RDRAND CPUID bit.
> 
>     Note, that clearing the RDRAND CPUID bit does not prevent a processor
>     that normally supports the RDRAND instruction from executing it. So any
>     code that determined the support based on family and model won't #UD.
> 
> Warn if no explicit choice was given on affected hardware.
> 
> Check RDRAND functions at boot as well as after S3 resume (the retry
> limit chosen is entirely arbitrary).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Still slightly RFC, and still in particular because of the change to
> parse_xen_cpuid(): Alternative approach suggestions are welcome. But now
> also because with many CPUs there may now be a lot of warnings in case
> of issues.

Ping?

> ---
> v4: Check always, including during boot. Slightly better sanity check,
>     inspired by Linux commit 7879fc4bdc7.
> v3: Add call to warning_add(). If force-enabled, check RDRAND still
>     functioning after S3 resume.
> v2: Re-base.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -488,6 +488,10 @@ The Speculation Control hardware feature
>  be ignored, e.g. `no-ibrsb`, at which point Xen won't use them itself, and
>  won't offer them to guests.
>  
> +`rdrand` can be used to override the default disabling of the feature on certain
> +AMD systems.  Its negative form can of course also be used to suppress use and
> +exposure of the feature.
> +
>  ### cpuid_mask_cpu
>  > `= fam_0f_rev_[cdefg] | fam_10_rev_[bc] | fam_11_rev_b`
>  
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -4,6 +4,7 @@
>  #include <xen/param.h>
>  #include <xen/smp.h>
>  #include <xen/pci.h>
> +#include <xen/warning.h>
>  #include <asm/io.h>
>  #include <asm/msr.h>
>  #include <asm/processor.h>
> @@ -646,6 +647,25 @@ static void init_amd(struct cpuinfo_x86
>  		if (acpi_smi_cmd && (acpi_enable_value | acpi_disable_value))
>  			amd_acpi_c1e_quirk = true;
>  		break;
> +
> +	case 0x15: case 0x16:
> +		/*
> +		 * There are too many Fam15/Fam16 systems where upon resume
> +		 * from S3 firmware fails to re-setup properly functioning
> +		 * RDRAND.  Clear the feature unless force-enabled on the
> +		 * command line.
> +		 */
> +		if (c == &boot_cpu_data &&
> +		    cpu_has(c, X86_FEATURE_RDRAND) &&
> +		    !is_forced_cpu_cap(X86_FEATURE_RDRAND)) {
> +			static const char __initconst text[] =
> +				"RDRAND may cease to work on this hardware upon resume from S3.\n"
> +				"Please choose an explicit cpuid={no-}rdrand setting.\n";
> +
> +			setup_clear_cpu_cap(X86_FEATURE_RDRAND);
> +			warning_add(text);
> +		}
> +		break;
>  	}
>  
>  	display_cacheinfo(c);
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -11,6 +11,7 @@
>  #include <asm/io.h>
>  #include <asm/mpspec.h>
>  #include <asm/apic.h>
> +#include <asm/random.h>
>  #include <asm/setup.h>
>  #include <mach_apic.h>
>  #include <public/sysctl.h> /* for XEN_INVALID_{SOCKET,CORE}_ID */
> @@ -98,6 +99,11 @@ void __init setup_force_cpu_cap(unsigned
>  	__set_bit(cap, boot_cpu_data.x86_capability);
>  }
>  
> +bool is_forced_cpu_cap(unsigned int cap)
> +{
> +	return test_bit(cap, forced_caps);
> +}
> +
>  static void default_init(struct cpuinfo_x86 * c)
>  {
>  	/* Not much we can do here... */
> @@ -498,6 +504,28 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	printk("\n");
>  #endif
>  
> +	/*
> +	 * If RDRAND is available, make an attempt to check that it actually
> +	 * (still) works.
> +	 */
> +	if (cpu_has(c, X86_FEATURE_RDRAND)) {
> +		unsigned int prev = 0;
> +
> +		for (i = 0; i < 5; ++i)
> +		{
> +			unsigned int cur = arch_get_random();
> +
> +			if (prev && cur != prev)
> +				break;
> +			prev = cur;
> +			cpu_relax();
> +		}
> +
> +		if (i >= 5)
> +			printk(XENLOG_WARNING "CPU%u: RDRAND appears to not work\n",
> +			       smp_processor_id());
> +	}
> +
>  	if (system_state == SYS_STATE_resume)
>  		return;
>  
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -71,6 +71,9 @@ static int __init parse_xen_cpuid(const
>              {
>                  if ( !val )
>                      setup_clear_cpu_cap(mid->bit);
> +                else if ( mid->bit == X86_FEATURE_RDRAND &&
> +                          (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
> +                    setup_force_cpu_cap(X86_FEATURE_RDRAND);
>                  mid = NULL;
>              }
>  
> --- a/xen/include/asm-x86/processor.h
> +++ b/xen/include/asm-x86/processor.h
> @@ -166,6 +166,7 @@ extern const struct x86_cpu_id *x86_matc
>  extern void identify_cpu(struct cpuinfo_x86 *);
>  extern void setup_clear_cpu_cap(unsigned int);
>  extern void setup_force_cpu_cap(unsigned int);
> +extern bool is_forced_cpu_cap(unsigned int);
>  extern void print_cpu_info(unsigned int cpu);
>  extern unsigned int init_intel_cacheinfo(struct cpuinfo_x86 *c);
>  

