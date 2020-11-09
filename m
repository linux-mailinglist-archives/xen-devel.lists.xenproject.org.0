Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFAF2AC3DC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 19:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22848.49374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcBwi-0004Wh-Iy; Mon, 09 Nov 2020 18:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22848.49374; Mon, 09 Nov 2020 18:31:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcBwi-0004WI-Ff; Mon, 09 Nov 2020 18:31:16 +0000
Received: by outflank-mailman (input) for mailman id 22848;
 Mon, 09 Nov 2020 18:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caUz=EP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcBwh-0004WD-Cc
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:31:15 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbff16a5-9f17-431f-b8b7-dc86d1f980ac;
 Mon, 09 Nov 2020 18:31:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=caUz=EP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcBwh-0004WD-Cc
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:31:15 +0000
X-Inumbo-ID: fbff16a5-9f17-431f-b8b7-dc86d1f980ac
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fbff16a5-9f17-431f-b8b7-dc86d1f980ac;
	Mon, 09 Nov 2020 18:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604946673;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EuxrYwKQ6NdxoHdWOE4LN5YptLu811gjirE/rRY+3T8=;
  b=DUV01Rlpfs/B0IGuQbtaPg8c9dMaB1onWBZ+G4dC218zfeBhnBbo5a1r
   b9SeqAoPWh55YH1AB1Oin86n2ZScfpJapWldzBwop4R4rLPet1Tz9Jwdc
   HHLiOVscaCQlLGX3n1TgAuUDtE+GBnbSPEKmahJX+v4V0EAX2L7u+Co4e
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s0+yVDksQT/XRSH0K1kEyjAZEbPfgL9se/j8rA87gtavcL9sdDEwlHPPjNSHnbZf9YfwFF4dtX
 s3ZrlM8ho0dsyxGpRxqMfiFa9frK/Vmcw2F7fcfISRXednhZ+vfppCEqG9Cn5cnk/6PiFeVznz
 EDonx88a3saOk8WfDRfFaUMAlADSL1FZlx+T2q5J2fqodhtroZjlKWIJhGGNyh8ylByx6+68/s
 oP5Ex4KM6fkvve1nYJbUFDMK62WALPI0cz/i+cFbiSIuCB6FLVnStk7MWyqUvRSJSQP2FG4d8J
 H6g=
X-SBRS: None
X-MesageID: 30787529
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,464,1596513600"; 
   d="scan'208";a="30787529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQIrBKCeXhL3o7m9xS8VctTS9WTW1KF5OcWs478xxrQEZx8AwnGKZ7r/D6zp4HUA5Eeoua/Uee4XqATTtoC6JggFiJOjXh33xVuUhWgdgE0VrWDHQLOKYr0Jef0bnHHb1LYQzanZriza4tUWI46/pyXDm/3Sof5kPET4uG33JV5ohF0EBu56c4u4ymh+tiGU7LWKjrKCnG1XdmtvXpNS7WodL79/z8VjPfc0fESnGFGlvI9wAKs2DZcCI9929DfvrQ/6EKCVqfWOf5E02FMP8FmkZP05g5eFTk525vQVORWANS58vH5nNMpJ3R+dSMV/IJoHM8qPe/k7We7uj+cN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tkv/RO8/ivEQBrckg2t8lPlq1vIMiZWaZKDqTuP15TU=;
 b=TVX5irkqcuB4kZvSf1M7OQoRo+y8l1JsVg33sDJDv1TfuBZwtWfchEuiEWXv0xH5+V4u3vQtLSJy2WHxaF0d+FUfYDYdxKtKexr+NugPNoy20OiyAGZJuUOQAnLIRWXRLLH+6QcfvL6/R1R9LX+tnl9uxmtXz+/tz2IUTNxBVXGGOy6wp2Qd/y+RA3ChFWV7l/Uav5qXQzJbruh2Mg+5PHPTkVAzjJYDUct36lVVrSDkRTn1snv3mri+LmssIVHQpl+qWQnoHScvd5POQsovqr6/hDeKq2PJjjw86OcHrAN7eJO5JbjjiH0S4aIbS6vKgJN6sFub2STJ/4UI7vQhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tkv/RO8/ivEQBrckg2t8lPlq1vIMiZWaZKDqTuP15TU=;
 b=GtGIGvchfrWyYeCsnQuNp12idhoqNMzKI0UirdQWtu0WQxGJ2nUY8aZOj5Ou84oxWRqAG/4axmM+j4RRq1USBV0kUsolLPQgZShnb7Ta/gNE5c9m0/mStauAbS1MqJD/wXy7I1SV1pm1c5tSTZcmGMVx06bOPNwLw2fPs1/sM2s=
Date: Mon, 9 Nov 2020 19:31:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
Message-ID: <20201109183102.mrqklmpqyka5u6bt@Air-de-Roger>
References: <20201109173819.7817-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201109173819.7817-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO2P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff2561ed-af50-42cb-80b7-08d884dda026
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB552505829E1175AEEF572A2F8FEA0@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3WDXQa1RooheRLI1doKLm5mUW8V/n/6GMV9VzCPuqVmEeabk3mq/ZqLkNv/ctNMWJFaUbGvRW2kcL2nszSQtpJr6Q/eJu3k6wQx0cIGHWzp6pO0bAvJOqoEqTa4hQeW3I6lZLIm9y+8da8FFR7wy0L0JBSgt5DUMriddYhTCTcq7K/r+4PFjrvgMeSrx+Or83dl/SMsX8R3RTW3/a9a+glUIp29xL1yTUOVmcV8wpdU2g5nAAQGBLdtxsxCa41EbgdkjOLixZEuyCoQge/edjj/v9y0oNgJkKGEGuyUx/LNpVRlK10cF0uryn/+F/1L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(8936002)(2906002)(8676002)(6496006)(956004)(4326008)(83380400001)(6862004)(86362001)(66556008)(6666004)(85182001)(9686003)(5660300002)(316002)(1076003)(54906003)(33716001)(66946007)(66476007)(478600001)(186003)(6486002)(6636002)(16526019)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: gee9EqPQwPiY0efA+/djNqQ7JlNcmIMuW8K8UGFJtypDgWlkWUGYGUKMPgV+Qy7BAWS7KMWcs8khI+6/OXLFXetOn0jwhviHi0HTd4x+ObOwtkHYxDxzOXu6Vrgj8LInibUwW5WuslBLXOt/MK6YjAoJUreP0a8u6LPhgohI9VTXSOXRxIWRveAdAON8458T319DVC8mgEsYKoqRI2W2tm82EPOXGRP8iA1ZURE+Y9MMy9YMaqlNoOJPYPrB5yttJeX7l1m6BvsjkMMtAPixbX4ie9UrhT7NzEsVwKyrz2tZNcoxpMt68VZJIUGCMfl+lLjfxr/ukflWMUW31TSzCLJINdTGR1EN+hOvvw4pXdCFCu1Fm/gpoxHZKoSjg9kgszEXaZN3TNDq5b+Uvz0yu1y5PSjrMjyP6IkPoRFmz4czFZ7UDaoz6w1tTZqHxv47Z3A43rnF6qCAcKxae7aQYpR4xxxp6F2Ezpr6F0eAJ+lwl61xF5yixKkyofbMo/qChL2d9VW1WIQg56zXvAfLGcJuocSnMi6VKQ1xEDWtNzGA/+LFBaWKXCBMCPyCH6GCfl+ZOGutEowf4nxdBUXmFJ/j0qpY3ELtRRXNVZiMwd53lMehMMGcyQR6nxzPw281hkNvqjTkvMHTplho1W2IIpcy/lzE0ckyYd9pgibAhxDhIxpw5cuoXl1bwcTc7IjWJPQf8+dsRkVR42T/vc6HAyIlL5MZoZlMMHKtuR8M2WbIOKpsO48uPbyCulLFSCcMH7FUDTCrAnOzch3aj8797vosNsjo+xRWy4KUwHdV8Ssqg5gyn+UHofjrPjv4PXXU4Nrx2tum/6/EcPCi3JPIzTnoyK+6ilrYven53Vx/w3hbblYZmzkWL7GDZ0hrGNyUuhG9k4/tBIYl3C7q7VplaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2561ed-af50-42cb-80b7-08d884dda026
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 18:31:08.4463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3ZEfEkTtQQfBZ+Da00J+4jQFP1iSEhMMpdSgYhSNK8PgzLYipUSFHblnxDt3w/SPuRuQjSFSO3LT1ZWKc5T5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 05:38:19PM +0000, Andrew Cooper wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Currently a PV hardware domain can also be given control over the CPU
> frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
> However since commit 322ec7c89f6 the default behavior has been changed
> to reject accesses to not explicitly handled MSRs, preventing PV
> guests that manage CPU frequency from reading
> MSR_IA32_PERF_{STATUS/CTL}.
> 
> Additionally some HVM guests (Windows at least) will attempt to read
> MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
> 
>   vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
>   d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
> 
> Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
> handling shared between HVM and PV guests, and add an explicit case
> for reads to MSR_IA32_PERF_{STATUS/CTL}.
> 
> Restore previous behavior and allow PV guests with the required
> permissions to read the contents of the mentioned MSRs. Non privileged
> guests will get 0 when trying to read those registers, as writes to
> MSR_IA32_PERF_CTL by such guest will already be silently dropped.
> 
> Fixes: 322ec7c89f6 ('x86/pv: disallow access to unknown MSRs')
> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> v2:
>  * fix is_cpufreq_controller() to exclude PVH dom0, and collapse to nothing in
>    !CONFIG_PV builds
>  * Drop the cross-vendor checks.  It isn't possible to configure dom0 as
>    cross-vendor, and anyone using is_cpufreq_controller() without an exact
>    model match has far bigger problems.

I was on the verge of doing this in v1, but wasn't really sure whether
there was any use case to change the vendor for dom0 cpuid.

>  * At least Centaur implements these MSRs.  Add access.
> ---
>  xen/arch/x86/msr.c             | 34 ++++++++++++++++++++++++++++++++++
>  xen/arch/x86/pv/emul-priv-op.c | 14 --------------
>  xen/include/xen/sched.h        | 17 +++++++++++++++++
>  3 files changed, 51 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 9c69ef8792..0a8ae4d22c 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -242,6 +242,25 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>              goto gp_fault;
>          break;
>  
> +        /*
> +         * These MSRs are not enumerated in CPUID.  They have been around
> +         * since the Pentium 4, and implemented by other vendors.
> +         *
> +         * Some versions of Windows try reading these before setting up a #GP
> +         * handler, and Linux has several unguarded reads as well.  Provide
> +         * RAZ semantics, in general, but permit a cpufreq controller dom0 to
> +         * have full access.
> +         */
> +    case MSR_IA32_PERF_STATUS:
> +    case MSR_IA32_PERF_CTL:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
> +            goto gp_fault;
> +
> +        *val = 0;
> +        if ( likely(!is_cpufreq_controller(d)) || rdmsr_safe(msr, *val) == 0 )
> +            break;
> +        goto gp_fault;
> +
>      case MSR_IA32_THERM_STATUS:
>          if ( cp->x86_vendor != X86_VENDOR_INTEL )
>              goto gp_fault;
> @@ -448,6 +467,21 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>              goto gp_fault;
>          break;
>  
> +        /*
> +         * This MSR are not enumerated in CPUID.  It has been around since the
> +         * Pentium 4, and implemented by other vendors.
> +         *
> +         * To match the RAZ semantics, implement as write-discard, except for
> +         * a cpufreq controller dom0 which has full access.
> +         */
> +    case MSR_IA32_PERF_CTL:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
> +            goto gp_fault;
> +
> +        if ( likely(!is_cpufreq_controller(d)) || wrmsr_safe(msr, val) == 0 )
> +            break;
> +        goto gp_fault;
> +
>      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
>          if ( !is_hvm_domain(d) || v != curr )
>              goto gp_fault;
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index 7cc16d6eda..dbceed8a05 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -849,12 +849,6 @@ static inline uint64_t guest_misc_enable(uint64_t val)
>      return val;
>  }
>  
> -static inline bool is_cpufreq_controller(const struct domain *d)
> -{
> -    return ((cpufreq_controller == FREQCTL_dom0_kernel) &&
> -            is_hardware_domain(d));
> -}
> -
>  static uint64_t guest_efer(const struct domain *d)
>  {
>      uint64_t val;
> @@ -1121,14 +1115,6 @@ static int write_msr(unsigned int reg, uint64_t val,
>              return X86EMUL_OKAY;
>          break;
>  
> -    case MSR_IA32_PERF_CTL:
> -        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
> -            break;
> -        if ( likely(!is_cpufreq_controller(currd)) ||
> -             wrmsr_safe(reg, val) == 0 )
> -            return X86EMUL_OKAY;
> -        break;
> -
>      case MSR_IA32_THERM_CONTROL:
>      case MSR_IA32_ENERGY_PERF_BIAS:
>          if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index d8ed83f869..b4d3e53310 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1069,6 +1069,23 @@ extern enum cpufreq_controller {
>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>  } cpufreq_controller;
>  
> +static always_inline bool is_cpufreq_controller(const struct domain *d)
> +{
> +    /*
> +     * A PV dom0 can be nominated as the cpufreq controller, instead of using
> +     * Xen's cpufreq driver, at which point dom0 gets direct access to certain
> +     * MSRs.
> +     *
> +     * This interface only works when dom0 is identity pinned and has the same
> +     * number of vCPUs as pCPUs on the system.
> +     *
> +     * It would be far better to paravirtualise the interface.
> +     */

Would it be useful to add an assert here that the domain cpuid vendor
and the BSP cpuid vendor match?

Is it even possible to fake a different cpuid vendor for dom0?

Thanks, Roger.

