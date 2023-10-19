Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353C7CF5F5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619178.963822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQil-0000ID-60; Thu, 19 Oct 2023 10:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619178.963822; Thu, 19 Oct 2023 10:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQil-0000FW-3E; Thu, 19 Oct 2023 10:57:43 +0000
Received: by outflank-mailman (input) for mailman id 619178;
 Thu, 19 Oct 2023 10:57:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtQij-0000FQ-B0
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:57:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQif-0004q4-EW; Thu, 19 Oct 2023 10:57:37 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQif-0007qx-8n; Thu, 19 Oct 2023 10:57:37 +0000
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
	bh=HqxkxgGSE0Uf9AmAYoZUvxI294P3qe6ii1mgaGKmSmM=; b=lbIfM69BdMUEC20jkCh1gra1+m
	qgacBwqUAv3GCu6+Ms/vo/D8Zo8en0aoofy+VNHO+FUMDh7nySx5FwdO0gWDO9650TYlo4fpCWTH0
	ycvlmCT8fVex24awaqf/oTzf9mkxvQbmcylaxNPTFJ1bar+4l8oosmELU6MCWn9EnpEE=;
Message-ID: <5059771d-3842-4a7c-814d-69388179b246@xen.org>
Date: Thu, 19 Oct 2023 11:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
 <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/10/2023 11:53, Jan Beulich wrote:
> On 19.10.2023 12:42, Julien Grall wrote:
>> On 19/10/2023 10:14, Jan Beulich wrote:
>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/asm-generic/device.h
>>>> @@ -0,0 +1,65 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +#ifndef __ASM_GENERIC_DEVICE_H__
>>>> +#define __ASM_GENERIC_DEVICE_H__
>>>> +
>>>> +struct dt_device_node;
>>>> +
>>>> +enum device_type
>>>> +{
>>>> +    DEV_DT,
>>>> +    DEV_PCI,
>>>> +};
>>>
>>> Are both of these really generic?
>>
>> I think can be re-used for RISC-V to have an abstract view a device.
>> This is for instance used in the IOMMU code where both PCI and platform
>> (here called DT) can be assigned to a domain. The driver will need to
>> know the difference, but the common layer doesn't need to.
> 
> Question to me is whether DT and PCI can be considered "common", which
> is a prereq for being used here.

I think it can. See more below.

> 
>>>> +struct device {
>>>> +    enum device_type type;
>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>>>> +#endif
>>>> +};
>>>> +
>>>> +enum device_class
>>>> +{
>>>> +    DEVICE_SERIAL,
>>>> +    DEVICE_IOMMU,
>>>> +    DEVICE_GIC,
>>>
>>> This one certainly is Arm-specific.
>>
>> This could be renamed to DEVICE_IC (or INTERRUPT_CONTROLLER)
>>
>>>
>>>> +    DEVICE_PCI_HOSTBRIDGE,
>>>
>>> And this one's PCI-specific.
>>
>> Are you suggesting to #ifdef it? If so, I don't exactly see the value here.
> 
> What to do with it is secondary to me. I was questioning its presence here.
> 
>>> Overall same question as before: Are you expecting that RISC-V is going to
>>> get away without a customized header? I wouldn't think so.
>>
>> I think it can be useful. Most likely you will have multiple drivers for
>> a class and you may want to initialize certain device class early than
>> others. See how it is used in device_init().
> 
> I'm afraid I don't see how your reply relates to the question of such a
> fallback header being sensible to have, or whether instead RISC-V will
> need its own private header anyway.

My point is that RISC-V will most likely duplicate what Arm did (they 
are already copying the dom0less code). So the header would end up to be 
duplicated. This is not ideal and therefore we want to share the header.

I don't particularly care whether it lives in asm-generic or somewhere. 
I just want to avoid the duplication.

Cheers,

-- 
Julien Grall

