Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A691E9CFDB6
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 10:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838651.1254618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFYM-0004ql-9a; Sat, 16 Nov 2024 09:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838651.1254618; Sat, 16 Nov 2024 09:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFYM-0004oS-6Q; Sat, 16 Nov 2024 09:57:18 +0000
Received: by outflank-mailman (input) for mailman id 838651;
 Sat, 16 Nov 2024 09:57:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCFYL-0004oM-5o
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 09:57:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCFYK-007zIC-18;
 Sat, 16 Nov 2024 09:57:16 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCFYK-007u1W-1E;
 Sat, 16 Nov 2024 09:57:16 +0000
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
	bh=xM9MBGdF3i3F4N90skfvnHYi+jOj9ehEuL1gE+3pHBI=; b=CLGXiX3uppkHmJm/3ZVQcudyfW
	S3OdkffKoLezQ2QXjpgt8DiBFm/jpeFoCkqnuK8Dv6wKyWsNGsJqM8sgn0cESn/4uD3BhuVeyxJ47
	amIjZY3F7fnHJpZT3kRnFV+egVulyV86uZzjPTBoDCZ4g6l0/gSDhPsokIGvacpiK71o=;
Message-ID: <04a358de-ed76-46b4-bc09-f3f343e09186@xen.org>
Date: Sat, 16 Nov 2024 09:57:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Munakata Hisao <hisao.munakata.vt@renesas.com>
References: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
 <4dbf2c4d-f7bd-4032-b52f-29c24e3ec055@xen.org>
 <22282f26-5c66-444b-b63a-d5442e6fcdad@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <22282f26-5c66-444b-b63a-d5442e6fcdad@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 15/11/2024 18:53, Ayan Kumar Halder wrote:
>>> +Assign vCPUs from CPU pool
>>> +--------------------------
>>> +
>>> +`XenSwdgn~arm64_assign_vcpus_cpu_pool~1`
>>> +
>>> +Description:
>>> +Xen shall assign vCPUs to a domain from a CPU pool.
>>
>> Same remark about the wording. You create a domain with N vCPUs and 
>> *assign* a CPU pool to a domain. 
> 
> Ok, so all the previous 3 requirements can be merged into
> 
> Xen shall create a domain with N vCPUs and assign a CPU pool to a domain.
> 
> Or
> 
> Xen shall create a domain with N vCPUs.

I think this one is better because it is not mandatory for the user to 
select a CPU pool and you will have it ...

> 
> (which of the two looks better to you if we keep the next requirement ?)

... by the next one.

> 
> Comments:
> 
> Here N is determined by the device tree configuration provided by the user.
> 
>> You also assign pCPU to a CPU pool.
>>
>> But I am not sure about if this requirement is actually necessary 
>> given ...
>>
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~static_domains_configuration~1`
>>> +
>>> +Specify CPU pool scheduler
>>> +--------------------------
>>> +
>>> +`XenSwdgn~arm64_specify_cpu_pool_scheduler~1`
>>> +
>>> +Description:
>>> +Xen shall assign a CPU pool scheduler to a domain.
>>
>> ... you have th is one.
> So, we can keep it as it is.
>>
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~static_domains_configuration~1`
>>> +
>>> +Assign virtual UART
>>> +-------------------
>>> +
>>> +`XenSwdgn~arm64_assign_virtual_uart~1`
>>> +
>>> +Description:
>>> +Xen shall assign a virtual UART to a domain.
>>
>> Are we talking about the virtual PL011 or the fake emulation of the 
>> real UART we do?
> virtual PL011.

Is it possible to specify it in the market requirements?

[...]

>>> +
>>> +Static VM definition
>>> +--------------------
>>> +
>>> +`XenMkt~static_vm_definition~1`
>>> +
>>> +Description:
>>> +Xen shall support specifying resources for a domain.
>>
>> Compare to the other requirements, this is quite a vague. Should we 
>> list the resources?
> 
> The list of resources depends on what the user has provided in the 
> device tree configuration.
> 
> But the requirement is correct as it is. Xen allows direct assignment of 
> devices to domains (ie passthrough).
> 
> How do you want to write it ?

This is probably a better question for Bertrand. I don't know how market 
requirements are usually described. I was making a comparison with the 
other where you explicitely listed the expected resources (e.g. CPU, 
Memory, device).

Cheers,

-- 
Julien Grall

