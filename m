Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2F463FCD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 22:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235517.408554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msAWj-0008NI-1g; Tue, 30 Nov 2021 21:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235517.408554; Tue, 30 Nov 2021 21:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msAWi-0008L0-Uk; Tue, 30 Nov 2021 21:19:00 +0000
Received: by outflank-mailman (input) for mailman id 235517;
 Tue, 30 Nov 2021 21:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msAWh-0008Ku-HV
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 21:18:59 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20ec84cd-5223-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 22:18:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43850)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msAWZ-000CEy-0C (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 21:18:51 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D19DF1FC17;
 Tue, 30 Nov 2021 21:18:50 +0000 (GMT)
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
X-Inumbo-ID: 20ec84cd-5223-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <35e2dab8-e274-839c-23a8-25f4c121cd08@srcf.net>
Date: Tue, 30 Nov 2021 21:18:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <66e64fc5-34f1-7877-42b1-3533136f56ab@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/3] x86/vPMU: invoke <vendor>_vpmu_initialise() through a
 hook as well
In-Reply-To: <66e64fc5-34f1-7877-42b1-3533136f56ab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2021 09:10, Jan Beulich wrote:
> I see little point in having an open-coded switch() statement to achieve
> the same; like other vendor-specific operations the function can be
> supplied in the respective ops structure instances.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Yeah, that logic was just bizarre.

Now that the ARM folks have added XEN_DOMCTL_CDF_vpmu, there is a huge
quantity of simplification which can be done around
vpmu_available()/etc, but that's definitely future work.

I think it would probably be good to get a position where we can enable
hwdom vpmu by default.  There is a spec on how to share perfcounters
with firmware, which we ought to investigate to let the watchdog
coexists beside vPMU.

> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -480,12 +470,17 @@ static int vpmu_arch_initialise(struct v
>          return -EINVAL;
>      }
>  
> -    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
> -
> +    ret = alternative_call(vpmu_ops.initialise, v);
>      if ( ret )
> +    {
>          printk(XENLOG_G_WARNING "VPMU: Initialization failed for %pv\n", v);
> +        return ret;
> +    }
> +
> +    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
> +    vpmu_set(vpmu, VPMU_INITIALIZED);

It occurs to me that if, in previous patch, you do:

    if ( ret )
        printk(XENLOG_G_WARNING "VPMU: Initialization failed for %pv\n", v);
+    else
+        vpmu_set(vpmu, VPMU_INITIALIZED);

then you don't need to undo the adjustments in
{svm,vmx}_vpmu_initialise() in this patch.

>  
> -    return ret;
> +    return 0;
>  }
>  
>  static void get_vpmu(struct vcpu *v)
> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -529,11 +516,22 @@ int svm_vpmu_initialise(struct vcpu *v)
>                 offsetof(struct xen_pmu_amd_ctxt, regs));
>      }
>  
> -    vpmu_set(vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED);
> +    vpmu_set(vpmu, VPMU_CONTEXT_ALLOCATED);
>  
>      return 0;
>  }
>  
> +static const struct arch_vpmu_ops __initconstrel amd_vpmu_ops = {
> +    .initialise = svm_vpmu_initialise,
> +    .do_wrmsr = amd_vpmu_do_wrmsr,
> +    .do_rdmsr = amd_vpmu_do_rdmsr,
> +    .do_interrupt = amd_vpmu_do_interrupt,
> +    .arch_vpmu_destroy = amd_vpmu_destroy,
> +    .arch_vpmu_save = amd_vpmu_save,
> +    .arch_vpmu_load = amd_vpmu_load,
> +    .arch_vpmu_dump = amd_vpmu_dump

As you're moving everything, trailing comma please.

> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -893,11 +880,20 @@ int vmx_vpmu_initialise(struct vcpu *v)
>      if ( is_pv_vcpu(v) && !core2_vpmu_alloc_resource(v) )
>          return -EIO;
>  
> -    vpmu_set(vpmu, VPMU_INITIALIZED);
> -
>      return 0;
>  }
>  
> +static const struct arch_vpmu_ops __initconstrel core2_vpmu_ops = {
> +    .initialise = vmx_vpmu_initialise,
> +    .do_wrmsr = core2_vpmu_do_wrmsr,
> +    .do_rdmsr = core2_vpmu_do_rdmsr,
> +    .do_interrupt = core2_vpmu_do_interrupt,
> +    .arch_vpmu_destroy = core2_vpmu_destroy,
> +    .arch_vpmu_save = core2_vpmu_save,
> +    .arch_vpmu_load = core2_vpmu_load,
> +    .arch_vpmu_dump = core2_vpmu_dump

And here.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although
preferably with the VPMU_INITIALIZED adjustment.

~Andrew

