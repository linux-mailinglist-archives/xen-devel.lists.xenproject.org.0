Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B4338B80
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 12:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97035.184158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKg0h-0007J3-6B; Fri, 12 Mar 2021 11:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97035.184158; Fri, 12 Mar 2021 11:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKg0h-0007Ie-2l; Fri, 12 Mar 2021 11:31:15 +0000
Received: by outflank-mailman (input) for mailman id 97035;
 Fri, 12 Mar 2021 11:31:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lKg0f-0007IY-Oz
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:31:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKg0f-0006hh-HT; Fri, 12 Mar 2021 11:31:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKg0f-0007Sg-BG; Fri, 12 Mar 2021 11:31:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IF4NOy+NSVk8fTfzJIy8V92/ROQlDvQmES3zBmoN9dk=; b=p/h/psG41gByennYSJ7rjUE8/c
	YNAK3crFy/YwUGmQKa+hPGcUHhcbqnH5z+4K+xd9zXOSR+nY7r/glSawyGJuFyzfiBzDeKjs/BOe/
	jongY72bCqN2jr1tsjtYOf3eg3njSi5fsPhja6b85MWjN8kRWdcU5Y8Lj5g05wsgjlak=;
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
To: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com
References: <20210308115610.48203-1-luca.fancellu@arm.com>
 <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
 <72E0C95C-D5E1-471B-9590-F4D42E3E066B@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7ed12d12-6fed-cc3a-4a0b-76ad732d4337@xen.org>
Date: Fri, 12 Mar 2021 11:31:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <72E0C95C-D5E1-471B-9590-F4D42E3E066B@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 12/03/2021 09:38, Luca Fancellu wrote:
>>> +
>>>   size_t __read_mostly dcache_line_bytes;
>>>     /* C entry point for boot CPU */
>>> @@ -804,7 +833,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>       int cpus, i;
>>>       const char *cmdline;
>>>       struct bootmodule *xen_bootmodule;
>>> -    struct domain *dom0;
>>> +    struct domain *dom0 = NULL;
>>>       struct xen_domctl_createdomain dom0_cfg = {
>>>           .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>           .max_evtchn_port = -1,
>>> @@ -964,28 +993,33 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>       apply_alternatives_all();
>>>       enable_errata_workarounds();
>>>   -    /* Create initial domain 0. */
>>> -    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>> -    dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>> -    /*
>>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>>> -     * 32 are substracted to cover local IRQs.
>>> -     */
>>> -    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
>>> -    if ( gic_number_lines() > 992 )
>>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>>> -    dom0_cfg.arch.tee_type = tee_get_type();
>>> -    dom0_cfg.max_vcpus = dom0_max_vcpus();
>>> -
>>> -    if ( iommu_enabled )
>>> -        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>> -
>>> -    dom0 = domain_create(0, &dom0_cfg, true);
>>> -    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>>> -        panic("Error creating domain 0\n");
>>> -
>>> -    if ( construct_dom0(dom0) != 0)
>>> -        panic("Could not set up DOM0 guest OS\n");
>>> +    if ( !is_dom0less_mode() )
>>> +    {
>>> +        /* Create initial domain 0. */
>>> +        /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>> +        dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>> +        /*
>>> +        * Xen vGIC supports a maximum of 992 interrupt lines.
>>> +        * 32 are substracted to cover local IRQs.
>>> +        */
>>> +        dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
>>> +        if ( gic_number_lines() > 992 )
>>> +            printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>>> +        dom0_cfg.arch.tee_type = tee_get_type();
>>> +        dom0_cfg.max_vcpus = dom0_max_vcpus();
>>> +
>>> +        if ( iommu_enabled )
>>> +            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>> +
>>> +        dom0 = domain_create(0, &dom0_cfg, true);
>>> +        if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>>> +            panic("Error creating domain 0\n");
>>> +
>>> +        if ( construct_dom0(dom0) != 0)
>>> +            panic("Could not set up DOM0 guest OS\n");
>>> +    }
>>
>> It always felt a bit strange the dom0 creation is partly happening in setup.c when for domU everythink will happen in domain_build.c.
>>
>> Woule you be able to create a patch that will first move the code in a new function (maybe create_dom0())? The function would return NULL in case of an error or the domain.
> 
> Yes I will create a new patch with this change and I will put on top the v2 dom0less patch

I think it would be better to put it first. This will avoid some churn 
if the code movmement comes second (you would first indent and then move 
the code).

Cheers,

-- 
Julien Grall

