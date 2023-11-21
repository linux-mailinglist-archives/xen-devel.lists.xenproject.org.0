Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B57F3654
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 19:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638122.994444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Vid-0008J6-Np; Tue, 21 Nov 2023 18:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638122.994444; Tue, 21 Nov 2023 18:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Vid-0008Fz-L8; Tue, 21 Nov 2023 18:43:31 +0000
Received: by outflank-mailman (input) for mailman id 638122;
 Tue, 21 Nov 2023 18:43:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r5Vic-0008Fl-2Q
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 18:43:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5Vib-0000Uk-MY; Tue, 21 Nov 2023 18:43:29 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.19.28]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5Vib-0006Tv-Fo; Tue, 21 Nov 2023 18:43:29 +0000
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
	bh=RbSG12YnPK0YYG6wsraIypDQ7wBn8B6bIs+d7cKamqU=; b=RfoqGP/orJwLhiyuBXGpkqNGKh
	9u2GLu/1dDu57rQEFIZ4KVXK+4jNdL/F5z6ZfJIGRqGS9hKC3weLxiUL0Zf2nHQrwChm3WmZ9pfrn
	GMrgrgcVRRDAtp95nasU7z+Qs3wGjeExXMqcGhsieKuXXutqssSJL+a9w5c+pLP4F/Ss=;
Message-ID: <b2706623-15bf-4ea6-9742-83a199ecf4f9@xen.org>
Date: Tue, 21 Nov 2023 18:43:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm64/mmu: head: Replace load_paddr with adr_l
 where appropriate
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-4-michal.orzel@amd.com>
 <d015e81d-16cd-4e93-80c9-ba6418a23b1d@xen.org>
 <c32253c7-6907-4bfd-8a3a-9488539d19b8@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c32253c7-6907-4bfd-8a3a-9488539d19b8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/11/2023 18:13, Michal Orzel wrote:
> On 21/11/2023 17:30, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 21/11/2023 09:45, Michal Orzel wrote:
>>> Macros load_paddr and adr_l are equivalent when used before the MMU is
>>> enabled, resulting in obtaining physical address of a symbol. The former
>>> requires to know the physical offset (PA - VA) and can be used both before
>>> and after the MMU is enabled. In the spirit of using something only when
>>> truly necessary, replace all instances of load_paddr with adr_l, except
>>
>> I don't buy this argument. The advantage with using "load_paddr" is that
>> it is pretty clear what you get from the call. With "adr_l" you will
>> need to check whether the MMU is on or off.
>>
>>> in create_table_entry macro. Even though there is currently no use of
>>> load_paddr after MMU is enabled, this macro used to be call in such a
>>> context and we can't rule out that it won't happen again.
>>>
>>> This way, the logic behind using load_paddr/adr_l is consistent between
>>> arm32 and arm64, making it easier for developers to determine which one
>>> to use and when.
>>
>> Not really. See above. But there is also no documentation stating that
>> "load_paddr" should not be used before the MMU is on. And as I said
>> above, I find it easier to work with compare to "adr_l".
> I guess it is a matter of taste. load_paddr requires adding a physical offset to

I agree this is a matter of taste.

> calculate an address, where in fact we have no places in the code where this is truly needed.

I added adr_l only recently (2019). Before hand, we were using 
open-coded adrp and load_paddr (which was introduced in 2017).

> Seeing an instance of this macro makes me think that this piece of code runs with MMU enabled.

Fair enough. But how do you know when 'adr_l' effectively returns a 
physical address or virtual address? You could go through the functions 
call but that's fairly cumbersome.

This is why I don't particularly like this change and I am afraid, I 
will not ack it.

> We could in fact remove it completely and the only reason I did not is because you told me [1] that
> one day we might want to use it.

Yes I still have plan to use it.

Cheers,

-- 
Julien Grall

