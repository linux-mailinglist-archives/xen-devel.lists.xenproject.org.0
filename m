Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF949C8C0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 12:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260820.450950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCgam-0004P2-Sr; Wed, 26 Jan 2022 11:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260820.450950; Wed, 26 Jan 2022 11:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCgam-0004Li-Po; Wed, 26 Jan 2022 11:36:00 +0000
Received: by outflank-mailman (input) for mailman id 260820;
 Wed, 26 Jan 2022 11:35:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCgal-0004Lb-H9
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 11:35:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCgal-0000iW-Aa; Wed, 26 Jan 2022 11:35:59 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.95.98.192])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCgal-0007ty-4B; Wed, 26 Jan 2022 11:35:59 +0000
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
	bh=sj8F4iYQQIxRFAtoADA7BuxbuFdeMTl8Fo+UIm20iZA=; b=W9NSu0eqeiW3jNuEDYdfgZlIju
	0z0veDuWIhnow8mvsHpmlqp16+bDlUY6+rIKTYpp/8aq2lOhW/T5LcK/hiN51FXcbgMTrYhWDAw5+
	e077D5lzly1CROC7gPFpK4f59tPEOctSxsVXJHLzvJ4uCN6aJAzxFwikNmWF/THzM3ec=;
Message-ID: <a50d9fde-1d06-7cda-2779-9eea9e1c0134@xen.org>
Date: Wed, 26 Jan 2022 11:35:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] design: design doc for shared memory on a dom0less system
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Wei Chen <Wei.Chen@arm.com>
References: <20220126100943.4086208-1-penny.zheng@arm.com>
 <c820b027-1b23-a762-ca91-7a2f0a46f423@xen.org>
 <2C44219B-A661-481E-851B-B2DF07ED6F84@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2C44219B-A661-481E-851B-B2DF07ED6F84@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 26/01/2022 11:14, Bertrand Marquis wrote:
>> On 26 Jan 2022, at 10:58, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 26/01/2022 10:09, Penny Zheng wrote:
>>> This commit provides a design doc for static shared memory
>>> on a dom0less system.
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>   design/shm-dom0less.md | 182 +++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 182 insertions(+)
>>>   create mode 100644 design/shm-dom0less.md
>>> diff --git a/design/shm-dom0less.md b/design/shm-dom0less.md
>>> new file mode 100644
>>> index 0000000..b46199d
>>> --- /dev/null
>>> +++ b/design/shm-dom0less.md
>>> @@ -0,0 +1,182 @@
>>> +# Static Shared Memory between domains on a dom0less system
>>> +
>>> +This design aims to provide an overview of the new feature: setting up static
>>> +shared memory between domains on a dom0less system, through device tree
>>> +configuration.
>>> +
>>> +The new feature is driven by the need of finding a way to build up
>>> +communication channels on dom0less system, since the legacy ways including
>>> +grant table, etc are all absent there.
>>
>> Stefano has a series to add support for grant-table [2]. So I think you want to justify it differently.
>>
>>> +
>>> +It was inspired by the patch serie of "xl/libxl-based shared memory", see
>>> +[1] for more details.
>>> +
>>> +# Static Shared Memory Device Tree Configuration
>>> +
>>> +The static shared memory device tree nodes allow users to statically set up
>>> +shared memory among a group of dom0less DomUs and Dom0, enabling domains
>>> +to do shm-based communication.
>>> +
>>> +- compatible
>>> +
>>> +    "xen,domain-shared-memory-v1"
>>> +
>>> +- xen,shm-id
>>
>>  From the document, it is not clear to me what is the purpose of the identifier. Could you clarify it?
>>
>>> +
>>> +    An u32 value represents the unique identifier of the shared memory region.
>>> +    User valuing per shared memory region shall follow the ascending order,
>>> +    starting from xen,shm-id = <0x0>, to the maximum identifier
>>> +    xen,shm-id = <0x126>.
>>
>> Why is it limit to 0x126? And also, why do they have to be allocated in ascending order?
>>
>>> The special xen,shm-id = <0x127> is reserved for
>>> +    INVALID_SHMID.
>>
>> Why do we need to reserve invalid?
>>
>>> +
>>> +- xen,shared-mem
>>> +
>>> +    An array takes a physical address, which is the base address of the
>>> +    shared memory region in host physical address space, a size, and a guest
>>> +    physical address, as the target address of the mapping.
>>
>> I think shared memory is useful without static allocation. So I think we want to make the host physical address optional.
>>
>>> +
>>> +- role(Optional)
>>> +
>>> +    A string property specifying the ownership of a shared memory region,
>>> +    the value must be one of the following: "owner", or "borrower"
>>> +    A shared memory region could be explicitly backed by one domain, which is
>>> +    called "owner domain", and all the other domains who are also sharing
>>> +    this region are called "borrower domain".
>>> +    If not specified, the default value is "borrower" and owner is
>>> +    "dom_shared", a system domain.
>>
>> I don't particularly like adding another system domain. Instead, it would be better to always specify the owner.
> 
> Having an owner which is not Xen is creating a dependency so restart the owner you would need to restart the borrowers.

You don't necessarily have to. You can keep the "struct domain" and the 
shared pages in place and wipe everything else.

> To remove this dependency and allow use cases where any domain having access can be restarted without the other side
> needing to, having Xen as the owner is required.

> 
> Initial discussion started between Penny and Stefano went the way you said and I asked to modify it like this to have something
> more looking like a standard shared memory with only users but no “owner”.

My main concern with dom_shared is the permissions. How do you make sure 
that a given page is only shared with the proper domain?

> Also it fits to some of our use cases.

Would you mind to briefly describe them?

Cheers,

-- 
Julien Grall

