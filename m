Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D778D33D8
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 12:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731770.1137460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCG5p-0007od-01; Wed, 29 May 2024 09:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731770.1137460; Wed, 29 May 2024 09:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCG5o-0007ls-T2; Wed, 29 May 2024 09:59:36 +0000
Received: by outflank-mailman (input) for mailman id 731770;
 Wed, 29 May 2024 09:59:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sCG5m-0007lm-Uw
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:59:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCG5g-0003rA-Nr; Wed, 29 May 2024 09:59:28 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCG5f-0008Lt-Gi; Wed, 29 May 2024 09:59:27 +0000
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
	bh=b124mvg5qzZDE/KIEcur7k4yY6QifKGxb9xSVpWeEXI=; b=RbvaeSl3B2IAMRvYMtGLwhkxla
	Cvprdxq+3PLWZgAx+UYrrpQSllnNIlQgqPLox2SnMM9u1dVnfvmsVr3XVW2bRns/hOY9ztpT1kLWe
	h0S6v41uw+d17jD/7FCj76pgl/4Ao7IxBrd5wnOBHT0dUj0nwQUKNtuyNQbw4Ay9NuQE=;
Message-ID: <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
Date: Wed, 29 May 2024 10:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
 <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/05/2024 09:36, Jan Beulich wrote:
> On 29.05.2024 09:50, Oleksii K. wrote:
>> On Tue, 2024-05-28 at 09:53 +0100, Julien Grall wrote:
>>>>>> +/**
>>>>>> + * generic_test_bit - Determine whether a bit is set
>>>>>> + * @nr: bit number to test
>>>>>> + * @addr: Address to start counting from
>>>>>> + *
>>>>>> + * This operation is non-atomic and can be reordered.
>>>>>> + * If two examples of this operation race, one can appear to
>>>>>> succeed
>>>>>> + * but actually fail.  You must protect multiple accesses with
>>>>>> a
>>>>>> lock.
>>>>>> + */
>>>>>
>>>>> You got carried away updating comments - there's no raciness for
>>>>> simple test_bit(). As is also expressed by its name not having
>>>>> those
>>>>> double underscores that the others have.
>>>> Then it is true for every function in this header. Based on the
>>>> naming
>>>> the conclusion can be done if it is atomic/npn-atomic and can/can't
>>>> be
>>>> reordered.
>>>
>>> So let me start with that my only request is to keep the existing
>>> comments as you move it. It looks like there were none of test_bit()
>>> before.
>> Just to clarify that I understand correctly.
>>
>> Do we need any comment above functions generic_*()? Based on that they
>> are implemented in generic way they will be always "non-atomic and can
>> be reordered.".
> 
> I indicated before that I think reproducing the same comments __test_and_*
> already have also for generic_* isn't overly useful. If someone insisted
> on them being there as well, I could live with that, though.

Would you be ok if the comment is only on top of the __test_and_* 
version? (So no comments on top of the generic_*)

> 
>> Do you find the following comment useful?
>>
>> " * If two examples of this operation race, one can appear to succeed
>>   * but actually fail.  You must protect multiple accesses with a lock."
>>
>> It seems to me that it can dropped as basically "non-atomic and can be
>> reordered." means that.
> 
> I agree, or else - as indicated before - the wording would need to further
> change. Yet iirc you've added that in response to a comment from Julien,
> so you'll primarily want his input as to the presence of something along
> these lines.

I didn't realise this was an existing comment. I think the suggestion is 
a little bit odd because you could use the atomic version of the helper.

Looking at Linux, the second sentence was dropped. But not the first 
one. I would suggest to do the same. IOW keep:

"
If two examples of this operation race, one can appear to succeed but 
actually fail.
"

-- 
Julien Grall

