Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CE74B07E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 14:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560482.876423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHkHS-0004Wl-78; Fri, 07 Jul 2023 12:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560482.876423; Fri, 07 Jul 2023 12:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHkHS-0004Ut-4N; Fri, 07 Jul 2023 12:09:46 +0000
Received: by outflank-mailman (input) for mailman id 560482;
 Fri, 07 Jul 2023 12:09:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHkHQ-0004Un-8G
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 12:09:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHkHO-0000j8-Mw; Fri, 07 Jul 2023 12:09:42 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.10.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHkHO-0004h7-Ce; Fri, 07 Jul 2023 12:09:42 +0000
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
	bh=tjRTW6MHvp6uRfBAvVGBMSmlrRbdRew7+gkDZhSENAU=; b=jdoytZ2e665g5xXPSeRdU2CAJj
	nbvFNeqB7AGZ4FJETMrmC5s6Ca8J8UVf488bJq2Je3YwzpNDtQ8ZmnPGxeb95OEHD0J+K65hwH4Y/
	2lnJ77itKGy00IHzj2DFAkXy/CCqzzpo1lfFdRYANheKVJvaJIeJ1MSUwWhUVeKxKUZI=;
Message-ID: <9ca3724c-6ee7-9853-524e-6f55b3702dc4@xen.org>
Date: Fri, 7 Jul 2023 13:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
 <ZKfjoXqb6Kgav-vL@MacBook-Air-de-Roger.local>
 <04c05db8-1e15-f2c1-ebc1-0563d442a808@xen.org>
 <ZKftKtkjgFLWaW_x@MacBook-Air-de-Roger.local>
 <7f89a925-6c4e-7840-041b-2e0816ed7b71@xen.org>
 <ZKf4PMkKF3x2VwXl@MacBook-Air-de-Roger.local>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZKf4PMkKF3x2VwXl@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/07/2023 12:34, Roger Pau Monné wrote:
> On Fri, Jul 07, 2023 at 12:16:46PM +0100, Julien Grall wrote:
>>
>>
>> On 07/07/2023 11:47, Roger Pau Monné wrote:
>>> On Fri, Jul 07, 2023 at 11:33:14AM +0100, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 07/07/2023 11:06, Roger Pau Monné wrote:
>>>>> On Fri, Jul 07, 2023 at 10:00:51AM +0100, Julien Grall wrote:
>>>>>> On 07/07/2023 02:47, Stewart Hildebrand wrote:
>>>>>>> Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
>>>>>>> code base. It will be used by the vPCI series [1]. This patch is intended to be
>>>>>>> merged as part of the vPCI series.
>>>>>>>
>>>>>>> v1->v2:
>>>>>>> * new patch
>>>>>>> ---
>>>>>>>      xen/arch/arm/Kconfig              | 1 +
>>>>>>>      xen/arch/arm/include/asm/domain.h | 2 +-
>>>>>>>      2 files changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>>>> index 4e0cc421ad48..75dfa2f5a82d 100644
>>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>>> @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
>>>>>>>      	depends on ARM_64
>>>>>>>      	select HAS_PCI
>>>>>>>      	select HAS_VPCI
>>>>>>> +	select HAS_VPCI_GUEST_SUPPORT
>>>>>>>      	default n
>>>>>>>      	help
>>>>>>>      	  This option enables PCI device passthrough
>>>>>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>>>>>>> index 1a13965a26b8..6e016b00bae1 100644
>>>>>>> --- a/xen/arch/arm/include/asm/domain.h
>>>>>>> +++ b/xen/arch/arm/include/asm/domain.h
>>>>>>> @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>>>>>>      #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>>>>>> -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
>>>>>>> +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
>>>>>>
>>>>>> As I mentioned in the previous patch, wouldn't this enable vPCI
>>>>>> unconditionally for all the domain? Shouldn't this be instead an optional
>>>>>> feature which would be selected by the toolstack?
>>>>>
>>>>> I do think so, at least on x86 we signal whether vPCI should be
>>>>> enabled for a domain using xen_arch_domainconfig at domain creation.
>>>>>
>>>>> Ideally we would like to do this on a per-device basis for domUs, so
>>>>> we should consider adding a new flag to xen_domctl_assign_device in
>>>>> order to signal whether the assigned device should use vPCI.
>>>>
>>>> I am a bit confused with this paragraph. If the device is not using vPCI,
>>>> how will it be exposed to the domain? Are you planning to support both vPCI
>>>> and PV PCI passthrough for a same domain?
>>>
>>> You could have an external device model handling it using the ioreq
>>> interface, like we currently do passthrough for HVM guests.
>>
>> IMHO, if one decide to use QEMU for emulating the host bridge, then there is
>> limited point to also ask Xen to emulate the hostbridge for some other
>> device. So what would be the use case where you would want to be a
>> per-device basis decision?
> 
> You could also emulate the bridge in Xen and then have QEMU and
> vPCI handle accesses to the PCI config space for different devices.
> The ioreq interface already allows registering for config space
> accesses on a per SBDF basis.
> 
> XenServer currently has a use-case where generic PCI device
> passthrough is handled by QEMU, while some GPUs are passed through
> using a custom emulator.  So some domains effectively end with a QEMU
> instance and a custom emulator, I don't see why you couldn't
> technically replace QEMU with vPCI in this scenario.
> 
> The PCI root complex might be emulated by QEMU, or ideally by Xen.
> That shouldn't prevent other device models from handling accesses for
> devices, as long as accesses to the ECAM region(s) are trapped and
> decoded by Xen.  IOW: if we want bridges to be emulated by ioreq
> servers we need to introduce an hypercall to register ECAM regions
> with Xen so that it can decode accesses and forward them
> appropriately.

Thanks for the clarification. Going back to the original discussion. 
Even with this setup, I think we still need to tell at domain creation 
whether vPCI will be used (think PCI hotplug).

After that, the device assignment hypercall could have a way to say 
whether the device will be emulated by vPCI. But I don't think this is 
necessary to have from day one as the ABI will be not stable (this is a 
DOMCTL).


Cheers,

-- 
Julien Grall

