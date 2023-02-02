Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9E6687C1E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488748.756979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXgf-0004Ew-Kl; Thu, 02 Feb 2023 11:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488748.756979; Thu, 02 Feb 2023 11:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXgf-0004CJ-I4; Thu, 02 Feb 2023 11:23:29 +0000
Received: by outflank-mailman (input) for mailman id 488748;
 Thu, 02 Feb 2023 11:23:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNXge-0004CD-41
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:23:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXgd-0000po-L8; Thu, 02 Feb 2023 11:23:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXgd-0000Vt-FR; Thu, 02 Feb 2023 11:23:27 +0000
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
	bh=x/EtjnLXPMVGOEp5mtmu9HbFmS/ExaZ1FcZQ0QFbics=; b=W1OVWcPb9l+azIY8WynzO2Xr7U
	GVAygdQ9FM90Af2Or2UXkPuNig6uqvURU8dmLlvlmCgnQnkMgmGLDNMvwA1DbkGqX0pET33ve39BM
	KloEsp4kzKOVT6qgIojEit41Jf+/zEf1MHgI7QHmeQFxahtVyG6JEemFAzmw7mZY9Y9Q=;
Message-ID: <d51773ff-8aab-6512-a75c-e2590eabe6b4@xen.org>
Date: Thu, 2 Feb 2023 11:23:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] xen/arm: Add support for booting gzip compressed
 uImages
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayankuma@amd.com
References: <20230202084905.6950-1-michal.orzel@amd.com>
 <20230202084905.6950-3-michal.orzel@amd.com>
 <3ef695c9-9b5e-3323-a901-d6daf030e07d@xen.org>
 <f3312bfc-f02d-f8e1-3a88-3b0570b745c0@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f3312bfc-f02d-f8e1-3a88-3b0570b745c0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/02/2023 11:12, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 02/02/2023 12:01, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 02/02/2023 08:49, Michal Orzel wrote:
>>> @@ -265,11 +284,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>>>    #define IH_ARCH_ARM             2       /* ARM          */
>>>    #define IH_ARCH_ARM64           22      /* ARM64        */
>>>
>>> +/* uImage Compression Types */
>>> +#define IH_COMP_GZIP            1
>>> +
>>>    /*
>>>     * Check if the image is a uImage and setup kernel_info
>>>     */
>>>    static int __init kernel_uimage_probe(struct kernel_info *info,
>>> -                                      paddr_t addr, paddr_t size)
>>> +                                      struct bootmodule *mod)
>>>    {
>>>        struct {
>>>            __be32 magic;   /* Image Header Magic Number */
>>> @@ -287,6 +309,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>        } uimage;
>>>
>>>        uint32_t len;
>>> +    paddr_t addr = mod->start;
>>> +    paddr_t size = mod->size;
>>>
>>>        if ( size < sizeof(uimage) )
>>>            return -EINVAL;
>>
>> Shouldn't we return -ENOENT here?
> Frankly speaking, I do not want to fall through in such a case.
> If a kernel size is less than 64B, something is wrong, isn't it?

I agree something is likely wrong but this should not be the job of 
kernel_uimage_probe() to enforce this for everyone.

To give a concrete example, let's imagine we decide to re-order the call 
so kernel_uimage_probe() happens *after* an new header A than would 
require 128 bytes (the number is made up).

It would be wrong for A to return -EINVAL because the other protocol may 
require a smaller size. The same goes here even at least for consistency.

So if you really want to enforce a minimum size, then such check should 
be in the caller. Then each probe could return -ENOENT if the size is 
too small.

> I am not sure if Xen would handle a kernel whose size is less than a page.

I don't see any reason why it would not be.

> 
> I do not like the whole falling through in kernel_probe even in case of obvious violations.
> But this is something not related to this series so I added to my TODO to properly handle
> the return types from kernel_probe path. If you really think, we should return -ENOENT here,
> then ok (although I do not like it). Could this be done on commit if you insist on that?

See above for an alternative proposal. Depending on the version we 
settle on I can do it on commit (but this is not going to happen today 
as OSSTEst is still blocked).

Cheers,

-- 
Julien Grall

