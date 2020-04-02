Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CD19C3FC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 16:26:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK0mw-0005MZ-9L; Thu, 02 Apr 2020 14:25:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK0mu-0005MG-3T
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 14:25:44 +0000
X-Inumbo-ID: d5625c72-74ed-11ea-b4f4-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5625c72-74ed-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585837543;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xkRIIxCDsnHRvzf//DqSS43klv06BRzh7Vz62kSJN2w=;
 b=h3pNGXf1vnpqpac6lMDBABsqd/AUN9v5B1hfSS38pnmd80WfMxIwxj0K
 SmzMmd/FcC0LDTCFGUQOg+VbIFyVK0HOfpsAPXXWjFNEe0/Kg75c995N0
 zopBIcgVWbzu8XbVjoWdwiMRFiT3Q3NjmrZm0NglE66qPCqluoG+ZJRqQ 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kOefqFcTLPMd+GxgH9pEleIj1vPfcPQQoSu1pTWKywyACARgB90j8Aq29dLg9q0NigJabKXtG1
 YL6irxmk5V0wZuVUrT6DubL7+Cj9ZVgnJe8grdBrmOhM/+GlQxIDQcE/VXrtIEhlyByiM7Cmo0
 AtdM3BuBNV2aO57F5amD2DZhg9L6z0ytkPUMUwiHSJ7SBj8w/C0MfLP4c9qAl54KsZRq6+Qhah
 M15Ft4cPBaNPID/HZJ75BricJ/YDGfbtVgO3Y/IMuo4uy/OZya96TR0RSzdog2/MdPudjrbdHn
 qoA=
X-SBRS: 2.7
X-MesageID: 15056056
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15056056"
Subject: Re: [PATCH v4] x86: clear RDRAND CPUID bit on AMD family 15h/16h
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <68aa71c6-a41b-9f7c-f3ca-94060fae5db0@citrix.com>
Date: Thu, 2 Apr 2020 15:25:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Paul
 Durrant <Paul.Durrant@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09/03/2020 09:08, Jan Beulich wrote:
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

I'm not sure what is best to do here.  The type suggests that this is a
verbatim copy of the Linux commit message, but this tiny detail is Xen
specific.

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

CC'ing Paul & George for 4.14 things:

tl;dr Some AMD system firmware doesn't reinitialise the RNG
configuration on S3, resulting in the RDRAND instruction returning -1
and "data good".

AMD's recommended mitigation is to disable RDRAND entirely.  We can't
identify the problem before an S3 resume and finding the instruction
broken, and can't repair the damage at that point (The MSR needing
fixing has already been locked), and AMD don't have a list of DMI
quirks/equivalent to use to identify the buggy systems on boot.

Also, there is no public statement from AMD on the matter, but one
obvious fallout on Linux systems is systemd looping forever trying to
create a UUID which doesn't already alias in its database.

The impact of this would be substantially less bad if Xen could identify
(a lack of) platform support for S3 at boot, as AMD servers have never
supported S3.  This would reduce the user-nagging to only client
systems, but there isn't an obvious way to do this.

It's a complete mess, but I don't think we should put this out without
some form of release note.

> ---
> Still slightly RFC, and still in particular because of the change to
> parse_xen_cpuid():

FWIW, that is very similar to XenServer's AVX512 off-by-default bodge
until the default vs max policy work is ready.

I don't have a better suggestion right now, but hopefully something
better might become obvious when we've got more users.  Either way, I'm
expecting it to turn into a "switch ( mid->bit )" expression in due course.

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

"some" systems.

> +		 * from S3 firmware fails to re-setup properly functioning
> +		 * RDRAND.

I think this needs another sentence of explanation.

By the time we can spot the problem, it is too late to take evasive
action, and there is nothing Xen can do to repair the problem.

>   Clear the feature unless force-enabled on the
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

What do you think to clobbering RDRAND via the CPUMASK registers in this
case?  We've got full control there, and it would stop PV userspace as well.

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

Do you think it would be helpful to test in the opposite case as well. 
If we come back from S3 and find that RDRAND does actually work, then it
is safe to tell the user that they can re-enable.

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

Why the relax?  We're not polling hammering the memory bus waiting for
an unknown period of time until something changes.

We simply need up to 5 random numbers as fast as the RNG can produce
them (which is actually quite slow.  RDRAND has ~350 cycle latency minimum.)

~Andrew

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


