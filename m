Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A08A2F0B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 15:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704667.1101161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvGgi-0006sf-SD; Fri, 12 Apr 2024 13:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704667.1101161; Fri, 12 Apr 2024 13:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvGgi-0006qN-Oy; Fri, 12 Apr 2024 13:11:28 +0000
Received: by outflank-mailman (input) for mailman id 704667;
 Fri, 12 Apr 2024 13:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUrc=LR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rvGgh-0006qH-Go
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 13:11:27 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 293025d0-f8ce-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 15:11:24 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712927477349578.7052116436201;
 Fri, 12 Apr 2024 06:11:17 -0700 (PDT)
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
X-Inumbo-ID: 293025d0-f8ce-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1712927479; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ckGdccv9H6YRNv8IRlx5U1rOd1uYDmzixixCUZeLT+j8YjxFOdutNiVvzbh64gjKuxuLq9URN5Gd2rqtikYzgs39Wr/M6WQ0OOA8oIcZntfmyrqFMYcxvvjvthAQBMJzBCr0ZNEefuoyz8+o9jWNz8DuN1Z5kv0SkjbTcsvV9Og=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712927479; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D8LDroXoeKTAwey/qNemToMasADUwp3bpi+P0Z8aJOs=; 
	b=AkFcqhxzkAMX51TVpBhmhLVR4ppK2WZPjiGN9mgsdeM9suLIWB5BL1vBLeDBOWBUkC68YMic3+mObXpJNUYBacrNIEtg81gSlejpNCgWM7bO7HlgaDBwjd128CKukwG55JWgCYe/cfZfLjiJ7widZyr3CmZFTIxh+sNlxmeEC+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712927479;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=D8LDroXoeKTAwey/qNemToMasADUwp3bpi+P0Z8aJOs=;
	b=mfSUos6zW7zfS4Fb0t6oGNDfgL+i5t2XyE+sBwu0D8wDHnZ/fXgAnID2FWRa4z2p
	ADP279wVsOrnfA860p9A1zFKwVr2n/ZTcVFASI1keH2kSzQ7eodWld+s2vulW5vPtzu
	Y/qzI/ZRPoWCgiIivGrPMKRuEYgutab3Ci/psVJQ=
Message-ID: <7da2b3cd-a9a3-4264-81ef-a363a507d6b6@apertussolutions.com>
Date: Fri, 12 Apr 2024 09:11:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
 <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
 <c03b4f1e-f2c9-4f92-a369-b8afad56bc0b@apertussolutions.com>
 <9a5112a3-26fe-49a8-93ed-cd8c9610576c@apertussolutions.com>
 <5e63a5b7-d62f-443c-9755-66dbc70fee98@citrix.com>
 <8551e410-332d-4e74-91b8-677bba38f90c@apertussolutions.com>
 <7a28a0ac-07a2-42d9-9872-ebc27d751bd9@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <7a28a0ac-07a2-42d9-9872-ebc27d751bd9@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/12/24 08:53, Andrew Cooper wrote:
> On 12/04/2024 1:51 pm, Daniel P. Smith wrote:
>> On 4/12/24 08:18, Andrew Cooper wrote:
>>> On 12/04/2024 12:41 pm, Daniel P. Smith wrote:
>>>> On 4/12/24 07:34, Daniel P. Smith wrote:
>>>>> On 4/11/24 15:24, Andrew Cooper wrote:
>>>>>> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>>>>>>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>>>>>>> index 1bcb007395ba..9b4891731b8b 100644
>>>>>>> --- a/xen/common/gzip/gunzip.c
>>>>>>> +++ b/xen/common/gzip/gunzip.c
>>>>>>> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned
>>>>>>> long image_len)
>>>>>>>     __init int perform_gunzip(char *output, char *image, unsigned
>>>>>>> long image_len)
>>>>>>>     {
>>>>>>> +    struct gzip_data gd;
>>>>>>>         int rc;
>>>>>>
>>>>>> By the end of this series,
>>>>>>
>>>>>> Reading symbols from xen-syms...
>>>>>> (gdb) p sizeof(struct gzip_data)
>>>>>> $1 = 2120
>>>>>>
>>>>>> x86 has an 8k stack and this takes 1/4 of it.  Other bits of state
>>>>>> are
>>>>>> dynamically allocated, even in inflate.c, so I'd highly recommend
>>>>>> doing
>>>>>> the same for this.
>>>>>
>>>>> I take it you are mainly talking about crc_32_tab? Yes, I can switch
>>>>> that to being dynamically allocated.
>>>>
>>>> Never mind, reading your comment on patch4 made me realize you wanted
>>>> the instance of struct dynamically allocated. Though the answer is
>>>> still, yes, we can dynamically allocate it.
>>>
>>> I wrote this before realising that crc_32_tag could be shrunk.
>>>
>>> If it's only1k on the stack, then that's a whole lot less bad, and is
>>> perhaps ok.  I guess it depends on the stack size of the other
>>> architectures.
>>>
>>> Still - I expect dynamically allocating would be a safer course of
>>> action.  Internal blocks are dynamically allocated already, so this is
>>> "just" one more.
>>
>> Another course of action that could be considered is making a unit
>> file global instance of the struct, and then memset() it to zero
>> instead of allocating and freeing from heap. The global instance
>> should be able to be made init_data and dropped after init was complete.
>>
>> I am good with either way, just let me know which would be preferred
>> and I will adjust appropriately.
> 
> Other things inside gzunip() are dynamically allocated.  I'd keep this
> consistent with the others.

Ack.

v/r,
dps

