Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B8D1D541D
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 17:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZc6q-0000JK-UN; Fri, 15 May 2020 15:18:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZc6p-0000JE-Hd
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 15:18:47 +0000
X-Inumbo-ID: 5ecfecac-96bf-11ea-a585-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ecfecac-96bf-11ea-a585-12813bfff9fa;
 Fri, 15 May 2020 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589555926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gmhiXTSPLW12MRbW/gilR9oElhljD8TCyuf173u7HbM=;
 b=fD/opMdMryppcs0pJov0FFZhRfrR4DLxx9urFoPdChWAtrxaZIjhlU4F
 flGqKPce8Ck9yvVymBB2m5cg2vjcLIuT51irwZGSzPIPMUfNhXlGrRnsH
 5y87c7ZiI5OI1V/2eVjlzAyPa5EGkuC/HDMqjP7036d+ef4yV4d6LONuw k=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 2Ygj9Ix/7obFuEFqhUqBg5tdIYd+kNhECKf79Zm0zTmQza7eD2JLf2DhKYDdhPMcmAg4plmKP8
 gyyMVnSuUJvSJ2X0SjDCqcykZ3FQ0PKqiUOfwjjIY6iUB756cBHGy2NEuvZrRsgnqZBKwJ9zHi
 /QagGRpWZmYqIqPX+L6My/zIziu44v6DPePLZC8CzqTSIpUSFSD1jeNLhXLp1x/ME0hzhl94tK
 u/2+Gun15LEyQeZe3ob7mylo6RgnoIgpBhcneXXG+JyPa8Fc3KPFwLcuwjvd793gqo7Sf6hw7f
 BaQ=
X-SBRS: 2.7
X-MesageID: 18001253
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="18001253"
Date: Fri, 15 May 2020 17:18:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4] x86: clear RDRAND CPUID bit on AMD family 15h/16h
Message-ID: <20200515151838.GU54375@Air-de-Roger>
References: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 09, 2020 at 10:08:50AM +0100, Jan Beulich wrote:
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

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Still slightly RFC, and still in particular because of the change to
> parse_xen_cpuid(): Alternative approach suggestions are welcome. But now
> also because with many CPUs there may now be a lot of warnings in case
> of issues.
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

Given this is the only user of is_forced_cpu_cap...

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

... I think this could be made __init?

Thanks, Roger.

