Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E073A5737C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 22:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905374.1313227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqf8b-0006Pv-DD; Fri, 07 Mar 2025 21:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905374.1313227; Fri, 07 Mar 2025 21:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqf8b-0006Nj-A2; Fri, 07 Mar 2025 21:21:45 +0000
Received: by outflank-mailman (input) for mailman id 905374;
 Fri, 07 Mar 2025 21:21:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqf8Z-0006Nd-R7
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 21:21:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqf8Z-0079qU-1Z;
 Fri, 07 Mar 2025 21:21:43 +0000
Received: from [2a02:8012:3a1:0:5057:2808:1e53:9bd7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqf8Y-00D921-3A;
 Fri, 07 Mar 2025 21:21:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=2nus3HuRh077mA9zNPG2smM1poHCXmQR1XkCOKtZ2Gc=; b=rwdG7Ag2rxomndtfvID3Z2TqQX
	w0pAvafJm1tD0VPvWHM1ndd3j2YS4IgSx+kB9xNKq3g6cONQumVUS5N/0xBfXqDPd5CgdUoL7NIlg
	bvd8R0nCft+hYSwWYblLVO14qWdrhvZTSj7NqTL3c3wuKL9xPDkwTJsXNzkseY+OxsGs=;
Message-ID: <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
Date: Fri, 7 Mar 2025 21:21:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
Content-Language: en-GB
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
 <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org>
 <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 07/03/2025 17:58, Jason Andryuk wrote:
> On 2025-03-07 04:01, Julien Grall wrote:
>> Hi,
>>
>> On 06/03/2025 22:03, Jason Andryuk wrote:
>>> Add capabilities property to dom0less to allow building a
>>> disaggregated system.
>>>
>>> Introduce bootfdt.h to contain these constants.
>>>
>>> When using the hardware or xenstore capabilities, adjust the grant and
>>> event channel limits similar to dom0.
>>  > > Also for the hardware domain, set directmap and iommu.  This 
>> brings its
>>> configuration in line with a dom0.
>>
>> Looking the device tree bindings, a user would be allowed to disable 
>> "passthrough" or even "directmap". This means, we would never be able 
>> to disable "directmap" for the hardware domain in the future with the 
>> existing property (this is to avoid break backwards compatibility).
>>
>> Instead, I think we should check what the user provided and confirm 
>> this is matching our expectation for an hardware domain.
>  >
>> That said, I am not entirely sure why we should force directmap for 
>> the HW domain. We are starting from a clean slate, so I think it would 
>> be better to have by default no directmap and imposing the presence of 
>> an IOMMU in the system.
> 
> Ok, it seems like directmap is not necessary.  It was helpful early on 
> to get things booting, but I think it's no longer necessary after 
> factoring out construct_hwdom().
> 
> What exactly do you mean by imposing with respect to the iommu?  Require 
> one, or mirror the dom0 code and set it for the hwdom?
> 
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;

I mean requires one. Without it, you would need to set directmap and I 
don't think this should be allowed (at least for now) for the HW domain.

> 
>> Lastly, can you provide an example of what the hardware domain DT node 
>> would looke like?
> 
> I've attached a dump of /sys/firmware/fdt from hwdom.  (This is direct 
> mapped).

Sorry if this was not clear, I am asking for the configuration you wrote 
in the host DT for create the hardware domain. I am interested to know 
which properties you set...

> 
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -12,6 +12,7 @@
>>>   #include <xen/sizes.h>
>>>   #include <xen/vmap.h>
>>> +#include <public/bootfdt.h>
>>>   #include <public/io/xs_wire.h>
>>>   #include <asm/arm64/sve.h>
>>> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>>>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>>               panic("No more domain IDs available\n");
>>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>>> +        {
>>> +            if ( val & ~DOMAIN_CAPS_MASK )
>>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>>> +
>>> +            if ( val & DOMAIN_CAPS_CONTROL )
>>> +                flags |= CDF_privileged;
>>> +
>>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>>> +            {
>>> +                if ( hardware_domain )
>>> +                    panic("Only 1 hardware domain can be specified! 
>>> (%pd)\n",
>>> +                           hardware_domain);
>>> +
>>> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
>>> +                d_cfg.max_evtchn_port = -1;
>>
>> What about d_cfg.arch.nr_spis? Are we expecting the user to pass 
>> "nr_spis"?
> 
> Further down, when nr_spis isn't specified in the DT, it defaults to:
>      d_cfg.arch.nr_spis = gic_number_lines() - 32;

Thanks. One further question, what if the user pass "nr_spis" for the HW 
domain. Wouldn't this result to more issue further down the line?

> 
> Dom0 does:
>      /*
>       * Xen vGIC supports a maximum of 992 interrupt lines.
>       * 32 are substracted to cover local IRQs.
>       */
>      dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) 
> - 32;
>      if ( gic_number_lines() > 992 )
>          printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
> 
> So I think it's fine as-is?  I could add the min() and warning if you 
> think it's necessary.

Regardless this discussion, I wonder why we didn't add the min(...) here 
like for dom0 because we are using the same vGIC emulation. So the max 
SPIs supported is the same...

What I am trying to understand is whether it is ok to allow the user to 
select "nr_spis", "vpl011" & co if they are either not honored (like for 
vpl011) or could introduce further issue (like for nr_spis as the HW 
domain is supposed to have the same configuration as dom0).

I also don't think it is a good idea to silently ignore what the user 
requested. So far, on Arm, we mainly decided to reject/panic early if 
the setup is not correct.

Cheers,

-- 
Julien Grall


