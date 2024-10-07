Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05299391B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812505.1225283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvEh-0004t8-RF; Mon, 07 Oct 2024 21:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812505.1225283; Mon, 07 Oct 2024 21:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvEh-0004rT-OV; Mon, 07 Oct 2024 21:25:47 +0000
Received: by outflank-mailman (input) for mailman id 812505;
 Mon, 07 Oct 2024 21:25:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sxvEg-0004rK-SZ
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:25:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sxvEc-0001kX-JP; Mon, 07 Oct 2024 21:25:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sxvEc-0000x1-Db; Mon, 07 Oct 2024 21:25:42 +0000
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
	bh=qNbhSI5DIZ/cinGKIaF6vNU1V6SegZJbxkOIxeLm+94=; b=NhaEi5edEz3HEjtUB45gDTqx5k
	aaMUScwZ5iVT+YVkzN7751psiWQDADZySlo47ObGcK4Gb4ocuZnN2/Ijk6CyTKweGwtxhwHHEVgzw
	loZBNmj2nYe3IvcAJmYdBnNdPFOfwRm7cuaxMKYWFIYCrpQcPI6sW7dXmA8T9dqQ8Nhk=;
Message-ID: <3b160dfe-9f46-479b-acd6-57f6ca6da72e@xen.org>
Date: Mon, 7 Oct 2024 22:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-5-ayan.kumar.halder@amd.com>
 <c27ebb1a-6ca4-41d7-99d8-ea613e3120fc@suse.com>
 <c0ce0c42-6b23-4687-a444-81a617629125@amd.com>
 <dc2ba7dd-fc55-4f4b-a33f-c733bb142efe@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dc2ba7dd-fc55-4f4b-a33f-c733bb142efe@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 24/09/2024 13:22, Jan Beulich wrote:
> On 24.09.2024 13:54, Ayan Kumar Halder wrote:
>> Hi Jan,
>>
>> On 23/09/2024 11:23, Jan Beulich wrote:
>>> On 18.09.2024 19:51, Ayan Kumar Halder wrote:
>>>> Secondary cpus initialization is not yet supported. Thus, we print an
>>>> appropriate message and put the secondary cpus in WFE state.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> Changes from :-
>>>>
>>>> v1 - 1. NR_CPUS is defined as 1 for MPU
>>> Not quite, what you do is ...
>>>
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -11,6 +11,7 @@ config NR_CPUS
>>>>    	default "8" if ARM && RCAR3
>>>>    	default "4" if ARM && QEMU
>>>>    	default "4" if ARM && MPSOC
>>>> +	default "1" if ARM && MPU
>>>>    	default "128" if ARM
>>>>    	help
>>>>    	  Controls the build-time size of various arrays and bitmaps
>>> ... merely set the default. I wonder how useful that is, the more that
>>> - as per the description - this is temporary only anyway.
>>
>> Yes, I can enforce a build time check like this.
>>
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -295,6 +295,12 @@ void asmlinkage __init start_xen(unsigned long
>> fdt_paddr)
>>        struct domain *d;
>>        int rc, i;
>>
>> +    /*
>> +     * Currently MPU does not support SMP.
>> +     */
>> +#ifdef CONFIG_MPU
>> +    BUILD_BUG_ON(NR_CPUS > 1);
>> +#endif
>>        dcache_line_bytes = read_dcache_line_bytes();
>>
>> Does this look ok ?
> 
> Well, I'd still want to understand the purpose (if I was maintainer of
> this code at least). You can't bring up secondary processors yet - fine.
> But why does that mean you want to limit the build to NR_CPUS=1? Any
> number is fine, but just not useful?

I have suggested to restrict NR_CPUS because it is not clear whether 
cpu_up() would even work on MPU. In its current state, it may return an 
error but could also corrupt the system.

At least for Xen on Arm, we have no other way to temporarly disable SMP 
support (aside modify the provided DTB, but I would like to avoid it).

Cheers,

-- 
Julien Grall

