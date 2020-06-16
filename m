Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C41FAD51
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 12:01:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl8OW-00063F-Jp; Tue, 16 Jun 2020 10:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl8OU-000639-GL
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:00:38 +0000
X-Inumbo-ID: 398dfbca-afb8-11ea-b8a4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 398dfbca-afb8-11ea-b8a4-12813bfff9fa;
 Tue, 16 Jun 2020 10:00:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93198ADC1;
 Tue, 16 Jun 2020 10:00:39 +0000 (UTC)
Subject: Re: [PATCH 9/9] x86/spec-ctrl: Hide RDRAND by default on IvyBridge
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0733b2c-da6b-e5bc-3041-de30002bcb47@suse.com>
Date: Tue, 16 Jun 2020 12:00:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615141532.1927-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.06.2020 16:15, Andrew Cooper wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -512,11 +512,21 @@ The Speculation Control hardware features `srbds-ctrl`, `md-clear`, `ibrsb`,
>  `stibp`, `ibpb`, `l1d-flush` and `ssbd` are used by default if available and
>  applicable.  They can all be ignored.
>  
> -`rdrand` and `rdseed` can be ignored, as a mitigation to XSA-320 /
> -CVE-2020-0543.  The RDRAND feature is disabled by default on certain AMD
> -systems, due to possible malfunctions after ACPI S3 suspend/resume.  `rdrand`
> -may be used in its positive form to override Xen's default behaviour on these
> -systems, and make the feature fully usable.
> +`rdrand` and `rdseed` have multiple interactions.
> +
> +*   For Special Register Buffer Data Sampling (SRBDS, XSA-320, CVE-2020-0543),
> +    RDRAND and RDSEED can be ignored.
> +
> +    Due to the absence microcode to address SRBDS on IvyBridge hardware, the

Nit: "... absence of microcode ..."

> +    RDRAND feature is hidden by default for guests, unless `rdrand` is used in
> +    its positive form.  Irrespective of the default setting here, VMs can use
> +    RDRAND if explicitly enabled in guest config file, and VMs already using
> +    RDRAND can migrate in.

I'm somewhat confused by the use of "default setting" here, when at the same
time you talk about our default behavior for guests. Aiui the two "default"
mean different things, so I'd suggest dropping that latter "default".

This raises a question though: Is disabling RDRAND just for guests good
enough? I.e. what about Xen's own uses of RDRAND? There may not be any
problematic ones right now, but wouldn't there be a latent issue no-one is
going to notice?

> --- a/tools/libxc/xc_cpuid_x86.c
> +++ b/tools/libxc/xc_cpuid_x86.c
> @@ -503,6 +503,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>       */
>      if ( restore )
>      {
> +        if ( test_bit(X86_FEATURE_RDRAND, host_featureset) && !p->basic.rdrand )
> +            p->basic.rdrand = true;

Same question as before: Why do you derive from the host feature set rather
than the domain type's maximum one?

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -340,6 +340,25 @@ static void __init calculate_host_policy(void)
>      }
>  }
>  
> +static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> +{
> +    /*
> +     * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
> +     * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
> +     * compensate.
> +     *
> +     * Mitigate by hiding RDRAND from guests by default, unless explicitly
> +     * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
> +     * default setting, guests can use RDRAND if explicitly enabled
> +     * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
> +     * previously using RDRAND can migrate in.
> +     */
> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
> +         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&

This is the first time (description plus patch so far) that the issue
gets mentioned to be for and the workaround restricted to client parts
only. If so, I think at least the doc should say so too.

Jan

