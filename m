Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC552142C
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325508.548099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOL1-0002pA-IQ; Tue, 10 May 2022 11:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325508.548099; Tue, 10 May 2022 11:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOL1-0002lz-FW; Tue, 10 May 2022 11:47:35 +0000
Received: by outflank-mailman (input) for mailman id 325508;
 Tue, 10 May 2022 11:47:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noOL0-0002lt-M9
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:47:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noOKz-0004XF-Eo; Tue, 10 May 2022 11:47:33 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noOKz-0006ev-8H; Tue, 10 May 2022 11:47:33 +0000
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
	bh=PBCnjY1Xs7W8fg99x7eyE7kLdyVJN+nzlRK29bfjA08=; b=OmlEcytSMcbaUV7ibfUceGeY6q
	O3bgi3VUV3gQSt4r1Mj+uIRaMTc+LlxYuQahHbCvsCilEiQtyMED3yK+BoB5qUkkAoXepd3SkTpT1
	T7uAE5N+Ji7IKexv2gHeizm8e54ZR509NTBaGfFbY/J+DmkWMYYTaa8O+wS7Tl+lANLU=;
Message-ID: <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
Date: Tue, 10 May 2022 12:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
To: Andrew Cooper <amc96@srcf.net>, Lin Liu <lin.liu@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
 <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
 <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/05/2022 12:34, Andrew Cooper wrote:
> On 10/05/2022 12:17, Julien Grall wrote:
>>>
>>>>
>>>>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>>>>> index 0a2b16d05d..16b2e6f5f0 100644
>>>>> --- a/xen/include/xen/unaligned.h
>>>>> +++ b/xen/include/xen/unaligned.h
>>>>> @@ -20,62 +20,62 @@
>>>>>       static inline uint16_t get_unaligned_be16(const void *p)
>>>>>     {
>>>>> -    return be16_to_cpup(p);
>>>>> +    return be16_to_cpu(*(const uint16_t *)p)
>>>>
>>>> I haven't checked the existing implementation of be16_to_cpup().
>>>
>>> It's a plain dereference, just like this.  AFAICT, it wasn't unaligned
>>> safe before, either.
>>
>> Well, technically an architecture could provide an override for the
>> copy. I agree that arm32 is already bogus but...
>>
>>>
>>> It should be reasonably easy to fix in a followup patch.  Just memcpy()
>>> to/from the void pointer to a stack variable of the appropriate type.
>> ... I disagree that it should be fixed in a follow-up patch. It should
>> be fixed now as this is where the badness is spread to any architecture.
> 
> No.  That is an inappropriate request to make.
> 
> Lin's patch does not alter the broken-ness of unaligned on arm32, and
> does improve the aspect of the hypervisor that it pertains to.  It
> therefore stands on its own merit.
I am not sure sure why switching from *cpup* improves things... and as 
usual you haven't answered to the clarification questions.

> 
> Your choices are to either fix it yourself (after all, you are the
> maintainer who cares about this unrelated bug), or you ask Lin kindly if
> he has time to look into fixing the unrelated bug after this series is
> complete.

Or 3) keep *cpup* so there is only one place to fix it.

> 
> It is not reasonable to say "this unrelated thing is broken, and you
> need to fix it first to get your series in".  Requests like that are,
> I'm sure, part of what Bertrand raised in the community call as
> unnecessary fiction getting work submitted.

To be honest, you put the contributor in this situation. I would have 
been perfectly happy if we keep *cpup* around as there would be only a 
place to fix.

With this approach, you are effectively going to increase the work later 
one because now we would have to chase all the open-coded version of 
*cpup* and check which one is not safe.

Cheers,

-- 
Julien Grall

