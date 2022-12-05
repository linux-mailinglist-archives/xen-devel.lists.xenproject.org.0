Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B08642A07
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453696.711291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2C1Q-0006jU-UA; Mon, 05 Dec 2022 14:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453696.711291; Mon, 05 Dec 2022 14:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2C1Q-0006hJ-RE; Mon, 05 Dec 2022 14:00:40 +0000
Received: by outflank-mailman (input) for mailman id 453696;
 Mon, 05 Dec 2022 14:00:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2C1P-0006hD-Pa
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:00:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2C1P-0000MY-AZ; Mon, 05 Dec 2022 14:00:39 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.30.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2C1P-00051R-2Y; Mon, 05 Dec 2022 14:00:39 +0000
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
	bh=RNjTClr3RloRAVTkO6tPXSi0WGn9e/EGWvYj/+ORM3o=; b=Pz0de0hueeuFd5D2q71gCw8h4U
	/dtv574zxrwbMJepHhuoRLFE9rKkb0xHWPQrjL2sjPjYYcsQF3ILZAm+ANECo7mW5/vI3Lb81ZdCZ
	1t5vWxkOMU4UOWAsVQWPRFPKikpDKlPjWyB3+hNEaVXchJaUTCvvh+Rge8UCb35khfAY=;
Message-ID: <0ec00287-c917-5222-5743-0c804275df38@xen.org>
Date: Mon, 5 Dec 2022 14:00:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
 <e4e25940-9637-2046-18e0-82a863c2737e@xen.org>
 <6E96FD3A-9CA8-4158-9041-EEAAAD7F7F7D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6E96FD3A-9CA8-4158-9041-EEAAAD7F7F7D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2022 13:48, Rahul Singh wrote:
> Hi Julien,
> 
>> On 3 Dec 2022, at 9:54 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 01/12/2022 16:02, Rahul Singh wrote:
>>> This patch adds basic framework for vIOMMU.
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>>   xen/arch/arm/domain.c                | 17 +++++++
>>>   xen/arch/arm/domain_build.c          |  3 ++
>>>   xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>>>   xen/drivers/passthrough/Kconfig      |  6 +++
>>>   xen/drivers/passthrough/arm/Makefile |  1 +
>>>   xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
>>>   xen/include/public/arch-arm.h        |  4 ++
>>>   7 files changed, 149 insertions(+)
>>>   create mode 100644 xen/arch/arm/include/asm/viommu.h
>>>   create mode 100644 xen/drivers/passthrough/arm/viommu.c
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 38e22f12af..2a85209736 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -37,6 +37,7 @@
>>>   #include <asm/tee/tee.h>
>>>   #include <asm/vfp.h>
>>>   #include <asm/vgic.h>
>>> +#include <asm/viommu.h>
>>>   #include <asm/vtimer.h>
>>>     #include "vpci.h"
>>> @@ -691,6 +692,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>           return -EINVAL;
>>>       }
>>>   +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>>> +    {
>>> +        dprintk(XENLOG_INFO,
>>> +                "vIOMMU type requested not supported by the platform or Xen\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>>   @@ -783,6 +791,9 @@ int arch_domain_create(struct domain *d,
>>>       if ( (rc = domain_vpci_init(d)) != 0 )
>>>           goto fail;
>>>   +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
>>> +        goto fail;
>>> +
>>>       return 0;
>>>     fail:
>>> @@ -998,6 +1009,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>>>   enum {
>>>       PROG_pci = 1,
>>>       PROG_tee,
>>> +    PROG_viommu,
>>>       PROG_xen,
>>>       PROG_page,
>>>       PROG_mapping,
>>> @@ -1048,6 +1060,11 @@ int domain_relinquish_resources(struct domain *d)
>>>           if (ret )
>>>               return ret;
>>>   +    PROGRESS(viommu):
>>> +        ret = viommu_relinquish_resources(d);
>>> +        if (ret )
>>> +            return ret;
>>
>> I would have expected us to relinquish the vIOMMU resources *before* we detach the devices. So can you explain the ordering?
> 
> I think first we need to detach the device that will set the S1 and S2 stage translation to bypass/abort then we
> need to remove the vIOMMU. Do you have anything that you feel if we relinquish the vIOMMU after detach is not right.

iommu_release_dt_devices() will effectively remove the device from the 
domain. One could decide to store the S1 information per device and 
therefore it feels wrong that we are removing the S1 information later on.

In addition to that, a device can be removed while the domain is running.

Therefore I think it would make more sense to remove the vIOMMU every 
time we deassign the device.

>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index bd30d3798c..abbaf37a2e 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -27,6 +27,7 @@
>>>   #include <asm/setup.h>
>>>   #include <asm/cpufeature.h>
>>>   #include <asm/domain_build.h>
>>> +#include <asm/viommu.h>
>>>   #include <xen/event.h>
>>>     #include <xen/irq.h>
>>> @@ -3858,6 +3859,7 @@ void __init create_domUs(void)
>>>           struct domain *d;
>>>           struct xen_domctl_createdomain d_cfg = {
>>>               .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>> +            .arch.viommu_type = viommu_get_type(),
>>
>> I don't think the vIOMMU should be enabled to dom0less domU by default.
> 
> I am not enabling the vIOMMU by default. If vIOMMU is disabled via the command line or config option
> then viommu_get_type() will return XEN_DOMCTL_CONFIG_VIOMMU_NONE and in that case
> domain_viommu_init() will return 0 without doing anything.

What I mean by default is if the command line is set then you will 
enable the vIOMMU for both dom0 and dom0less domUs.

vIOMMU should be selected per-domain.

> 
>>
>>>               .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>               /*
>>>                * The default of 1023 should be sufficient for guests because
>>> @@ -4052,6 +4054,7 @@ void __init create_dom0(void)
>>>           printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>>>       dom0_cfg.arch.tee_type = tee_get_type();
>>>       dom0_cfg.max_vcpus = dom0_max_vcpus();
>>> +    dom0_cfg.arch.viommu_type = viommu_get_type();
>>
>> Same here.
>>
>>>         if ( iommu_enabled )
>>>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>>> new file mode 100644
>>> index 0000000000..7cd3818a12
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/viommu.h
>>> @@ -0,0 +1,70 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>>> +#ifndef __ARCH_ARM_VIOMMU_H__
>>> +#define __ARCH_ARM_VIOMMU_H__
>>> +
>>> +#ifdef CONFIG_VIRTUAL_IOMMU
>>> +
>>> +#include <xen/lib.h>
>>> +#include <xen/types.h>
>>> +#include <public/xen.h>
>>> +
>>> +struct viommu_ops {
>>> +    /*
>>> +     * Called during domain construction if toolstack requests to enable
>>> +     * vIOMMU support.
>>> +     */
>>> +    int (*domain_init)(struct domain *d);
>>> +
>>> +    /*
>>> +     * Called during domain destruction to free resources used by vIOMMU.
>>> +     */
>>> +    int (*relinquish_resources)(struct domain *d);
>>> +};
>>> +
>>> +struct viommu_desc {
>>> +    /* vIOMMU domains init/free operations described above. */
>>> +    const struct viommu_ops *ops;
>>> +
>>> +    /*
>>> +     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
>>
>> Did you mean ID rather than type?
> 
> I mean here type of physical IOMMU on the host available SMMUv3, SMMUv1 or IPMMU.
> If you think ID is the right name here I will change it.

Hmmm... I inverted the two names. I was actually asking whether ID 
should be Type instead.

Cheers,

-- 
Julien Grall

