Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2FB31516F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 15:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83267.154498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Ttt-0000pP-7E; Tue, 09 Feb 2021 14:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83267.154498; Tue, 09 Feb 2021 14:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Ttt-0000p0-3X; Tue, 09 Feb 2021 14:21:57 +0000
Received: by outflank-mailman (input) for mailman id 83267;
 Tue, 09 Feb 2021 14:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9Tts-0000ov-C0
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 14:21:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1a553e2-f37c-4660-9402-b38d3034adc0;
 Tue, 09 Feb 2021 14:21:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B0AFAD6A;
 Tue,  9 Feb 2021 14:21:54 +0000 (UTC)
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
X-Inumbo-ID: d1a553e2-f37c-4660-9402-b38d3034adc0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612880514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIQB3lHLlmRhkVMcXJDBArQs4ArE4UWm4/bPgZ6ct9A=;
	b=Yq1vrBGj7DGnnkuAVbyaw2O4Ws/sJE7DJZq0pEBEMipj9uMSzKhHFoD1Aeo/SDBaSQF7w0
	3RS6l6spLAtasQLLNAnuZ0aQYzJ4sJSlcLLnwDhkMyNmF534UFlQrDSEIQ7tiGfGL+Q1tu
	y5MCn3EEGBpoTaRWLO/FYRceyUJ7xwU=
Subject: Re: [PATCH HVM v2 1/1] hvm: refactor set param
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210205203905.8824-1-nmanthey@amazon.de>
 <edf1cd78-2192-2679-9a34-804c5d7b75c5@suse.com>
 <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
 <b8529792-3d99-2e0d-7ebe-31c2c406145f@suse.com>
 <9f753ee9-73c5-aa2c-3c68-eed7e0c2608b@amazon.de>
 <a52cb2ac-fa85-73cd-0c53-3ee002d6b3ea@suse.com>
 <adee7548-0a60-d7d1-731f-474a585edf6c@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a50a8c3-44f5-9ea9-7ff1-0d716bc05ebd@suse.com>
Date: Tue, 9 Feb 2021 15:21:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <adee7548-0a60-d7d1-731f-474a585edf6c@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 14:56, Norbert Manthey wrote:
> On 2/9/21 2:45 PM, Jan Beulich wrote:
>> On 09.02.2021 14:41, Norbert Manthey wrote:
>>> On 2/9/21 10:40 AM, Jan Beulich wrote:
>>>> On 08.02.2021 20:47, Norbert Manthey wrote:
>>>>> On 2/8/21 3:21 PM, Jan Beulich wrote:
>>>>>> On 05.02.2021 21:39, Norbert Manthey wrote:
>>>>>>> @@ -4108,6 +4108,13 @@ static int hvm_allow_set_param(struct domain *d,
>>>>>>>      if ( rc )
>>>>>>>          return rc;
>>>>>>>
>>>>>>> +    if ( index >= HVM_NR_PARAMS )
>>>>>>> +        return -EINVAL;
>>>>>>> +
>>>>>>> +    /* Make sure we evaluate permissions before loading data of domains. */
>>>>>>> +    block_speculation();
>>>>>>> +
>>>>>>> +    value = d->arch.hvm.params[index];
>>>>>>>      switch ( index )
>>>>>>>      {
>>>>>>>      /* The following parameters should only be changed once. */
>>>>>> I don't see the need for the heavier block_speculation() here;
>>>>>> afaict array_access_nospec() should do fine. The switch() in
>>>>>> context above as well as the switch() further down in the
>>>>>> function don't have any speculation susceptible code.
>>>>> The reason to block speculation instead of just using the hardened index
>>>>> access is to not allow to speculatively load data from another domain.
>>>> Okay, looks like I got mislead by the added bounds check. Why
>>>> do you add that, when the sole caller already has one? It'll
>>>> suffice since you move the array access past the barrier,
>>>> won't it?
>>> I can drop that bound check again. This was added to make sure other
>>> callers would be save as well. Thinking about this a little more, the
>>> check could actually be moved into the hvm_allow_set_param function,
>>> above the first index access in that function. Are there good reasons to
>>> not move the index check into the allow function?
>> I guess I'm confused: We're talking about dropping the check
>> you add to hvm_allow_set_param() and you suggest to "move" it
>> right there?
> 
> Yes. I can either just no introduce that check in that function (which
> is what you suggested). As an alternative, to have all checks in one
> function, I proposed to instead move it into hvm_allow_set_param.

Oh, I see. What I'd like to be the result of your re-arrangement is
symmetry between "get" and "set" where possible in this regard, and
asymmetry having a clear reason. Seeing that hvm_{get,set}_param()
are the non-static functions here, I think it would be quite
desirable for the bounds checking to live there. Since
hvm_allow_{get,set}_param() are specifically helpers of the two
earlier named functions, checks consistently living there would as
well be fine with me.

Jan

