Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262276EB49
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576394.902474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYmr-00086G-Im; Thu, 03 Aug 2023 13:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576394.902474; Thu, 03 Aug 2023 13:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYmr-00084I-G6; Thu, 03 Aug 2023 13:54:45 +0000
Received: by outflank-mailman (input) for mailman id 576394;
 Thu, 03 Aug 2023 13:54:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRYmq-000849-EO
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:54:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRYmq-0007uk-5T; Thu, 03 Aug 2023 13:54:44 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRYmp-00086T-VY; Thu, 03 Aug 2023 13:54:44 +0000
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
	bh=IOmaq4fJVMiMgUgxVmaSThvgSoBQuYx4aMyfqBdqNFg=; b=FYYufqnspyNobNmhWMMF0tnp8N
	4smcUEITF382BAM9K5yHSVps1xZThXvdbQTwE5eq81NpoQEZSPEquDV/tfvnE/PFQNpFtvrgP+VBh
	O1Gn8XwPpNcBrTb+sWJZp31RDYV0y5Bju23VjyLRHKjAHNHw8QGdUTBCH54RhUab0CgQ=;
Message-ID: <868d3bb2-0d97-4cb5-b7b8-27ac3d0181d5@xen.org>
Date: Thu, 3 Aug 2023 14:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <9320a2b7-18cd-2766-b115-300755d64932@xen.org>
 <B2EA567E-1E51-44CC-94D8-DC8C765EC4AB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B2EA567E-1E51-44CC-94D8-DC8C765EC4AB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 14:03, Luca Fancellu wrote:
> Hi Julien,

Hi,

>>> +
>>>   config GICV3
>>>    bool "GICv3 driver"
>>>    depends on !NEW_VGIC
>>> @@ -92,6 +100,11 @@ config HAS_ITS
>>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>>>   +config VGICV2
>>> + bool "vGICv2 interface for guests"
>>
>> This description is a bit misleading as the vGICv2 will also be used for dom0 in the case of vGICv2.
>>
>>> + default y
>>
>> Please add a longer help.
>>
>>> + depends on (GICV2 || GICV3) && !NEW_VGIC
>>
>> In the near future, I don't expect anyone to introduce a new non-GIC of interrupt controller for Arm. But I would expect new version of the GIC. So I would drop (GICV2 || GICV3).
>>
>> Also when !NEW_VGIC is selected, this will make VGICV2 will be unselected. I was actually expecting the other way around given that new vGIC only offer v2 support.
>>
>> The rest of the changes LGTM.
> 
> Thanks a lot for having a look on this patch, you are right the NEW_VGIC is offering only v2 support at the moment, does this changes captures your
> Comments?
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5cdba07df964..1c600b3b8d04 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -110,15 +110,19 @@ config HAS_ITS
>           depends on GICV3 && !NEW_VGIC && !ARM_32
>   
>   config VGICV2
> -       bool "vGICv2 interface for guests"
> +       bool "vGICv2 interface for domains"
>          default y
> -       depends on (GICV2 || GICV3) && !NEW_VGIC
> +       help
> +         Provides a virtualised interface for the Generic Interrupt Controller that
> +         can be used by Xen's domains.

How about:

Allow Xen to expose a Generic Interrupt Controller version 2 like to Xen 
domains. This can be configured at the domain creation.

This option is mandatory when using GICv2. For GICv3, this allows domain 
to use GICv2 when the hardware supports it.

If unsure say Y.


> +         If unsure, say Y
>   
>   config HVM
>           def_bool y
>   
>   config NEW_VGIC
>          bool "Use new VGIC implementation"
> +       select VGICV2
>          ---help---
>   
>          This is an alternative implementation of the ARM GIC interrupt
> diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
> index 806826948e20..60cbf7f2f94a 100644
> --- a/xen/arch/arm/vgic/Makefile
> +++ b/xen/arch/arm/vgic/Makefile
> @@ -1,5 +1,5 @@
>   obj-y += vgic.o
> -obj-y += vgic-v2.o
> +obj-$(CONFIG_VGICV2) += vgic-v2.o
>   obj-y += vgic-mmio.o
> -obj-y += vgic-mmio-v2.o
> +obj-$(CONFIG_VGICV2) += vgic-mmio-v2.o
>   obj-y += vgic-init.o
> 
> 
> 
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
> 

-- 
Julien Grall

