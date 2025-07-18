Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1299B0A0AF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048405.1418639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciL6-0008P7-SI; Fri, 18 Jul 2025 10:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048405.1418639; Fri, 18 Jul 2025 10:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciL6-0008NG-PL; Fri, 18 Jul 2025 10:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1048405;
 Fri, 18 Jul 2025 10:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uciL6-0008NA-1h
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:29:16 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d5211eb-63c2-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 12:29:14 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1768152f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 03:29:14 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802ae4sm74248735e9.13.2025.07.18.03.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 03:29:13 -0700 (PDT)
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
X-Inumbo-ID: 0d5211eb-63c2-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752834554; x=1753439354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YI5K03YvlezWVtPZFrMaI3MhlGJ9u27QOuZkWWBoYew=;
        b=HA4jyXh5ThL32Us1B+sN7s8vVmDH4M5SfjfyATSaf78We5tg2PEtYEtSvRG21Hs0pg
         JQHzp3N28JAZVeKgMaNoGG06LIh4MrbADjCXZ97bYGaFkYE468qXMhLEF85qM+9BBllf
         rxoB+vNaE7LZSRrrj7boCKMFqwuB8ttuzrBCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834554; x=1753439354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI5K03YvlezWVtPZFrMaI3MhlGJ9u27QOuZkWWBoYew=;
        b=SayOglavK6JYWquMytkPjtD2vAVx/4ihRYnYI1/HKw1zUV+GnpPnAuWV2qkR3Q7wNW
         z34dQZgyWB2ZaLqQFTSClvCOebzgpeNzf2evuLZWYfik5a2oFrviK6/DKweS5w9gxjoo
         5C3DOUTMWwci4oNe0lEi9iFtozX7AidH/Y8HgdL+S4FQR7TIWeJCmknnPmsqShR29bUe
         JrEWdUb+/fCFCrrcT7zXNPKKeZCK+qJ/72pjrOTOqRGtfplafGuUUwDX6ERNb9yueGSF
         90YXESytmATzd3R0xe5OwlAcQy8rUKZjZcYmVR4AWGROemEqnWEMbYHnZt1e+QqDkxz6
         wy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQnVywWIN8orWyxCVpBnY7eP8+zGuvHtVWK4AoVAVdxnHuF/tSoHDx1HjGvR0tYB5XMdYqKKZaxq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwA0R+8moMlaToyP41SY03spi642jLewxysRZ/1wxA6NFJTDiM2
	O0osg7KHwafGvlgnVJ7pNwTZoI/Gmt5RG4oJ4c5upRc7X91HtC/ROZbAlpq4tUQ3pCc=
X-Gm-Gg: ASbGnct/8AWZ2SQ1f154gdN0BZAvKv2P871Rvzi/UP7qcrgPA71xrVQRfECIww9d/YS
	VHEuIoJCSWgORnAkML80L0xjQ5EMDFSsJimkuje6FbmrVXXLN1mIbxjR8Fe+jomWk4xnTpjEKId
	ORcZHiiPPyU8RwOw+lBY2WSh9gisRBO11q0Q7qqR1MnuLkrxjeDgg3z9BHoRBnH5irABDEnzwxC
	dlMwNDItPHISG4tQDi0wSUoj69XLqMC+yV20FFJ8UM4FeRlDYP/gs6seRF6fifWqlqGrGcjfc5Y
	FzlIKucKLiSJFbXf1nWUivpz4WrAwiSllDh1G+n5OSDwNH1uq9xSqbSO4QferC5HhwUNe2SzUzk
	Cr7MhoXgSE1q5mkzlvkzbyfrfAjnw1b/61glFxdsujKIFMzaNfi3R7TdvqnmobqlKChE6
X-Google-Smtp-Source: AGHT+IHolH24e9bsmobfNmm03u3P2RMDppLfRx+YNyVafSC/HMapxzwAosaS1d+DkJ5KuEcaKf77AQ==
X-Received: by 2002:a05:6000:290d:b0:3a4:d53d:be23 with SMTP id ffacd0b85a97d-3b60dd731cfmr8994207f8f.30.1752834554060;
        Fri, 18 Jul 2025 03:29:14 -0700 (PDT)
Message-ID: <3cefd149-505f-4e29-8018-492886050c6f@citrix.com>
Date: Fri, 18 Jul 2025 11:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/match-cpu: Support matching on steppings
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-6-andrew.cooper3@citrix.com>
 <a6abcc07-535f-433b-948a-702dc33093fa@suse.com>
 <03ecaa72-2370-47f7-b84b-83831d188f4e@citrix.com>
 <29cb9771-ee2a-4c7d-b661-74b37728bc2f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <29cb9771-ee2a-4c7d-b661-74b37728bc2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2025 6:53 am, Jan Beulich wrote:
> On 17.07.2025 21:39, Andrew Cooper wrote:
>> On 17/07/2025 9:11 am, Jan Beulich wrote:
>>> On 16.07.2025 19:31, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/cpu/common.c
>>>> +++ b/xen/arch/x86/cpu/common.c
>>>> @@ -1003,13 +1003,15 @@ const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
>>>>  	const struct x86_cpu_id *m;
>>>>  	const struct cpuinfo_x86 *c = &boot_cpu_data;
>>>>  
>>>> -	for (m = table; m->vendor | m->family | m->model | m->feature; m++) {
>>>> +	for (m = table; m->vendor | m->family | m->model | m->steppings | m->feature; m++) {
>>> Nit: Line length. But - do we need the change at all? It looks entirely
>>> implausible to me to use ->steppings with all of vendor, family, and
>>> model being *_ANY (if, as per below, they would be 0 in the first place).
>> I do keep on saying that | like this is pure obfuscation.  This is an
>> excellent example.
>>
>> It's looking for the {} entry, by looking for 0's in all of the metadata
>> fields.  A better check would be *(uint64_t *)m, or perhaps a unioned
>> metadata field, but..
>>
>> This is also a good demonstration of binary | is a bad thing to use, not
>> only for legibility.  Swapping | for || lets the compiler do:
>>
>> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-76 (-76)
>> Function                                     old     new   delta
>> x86_match_cpu                                243     167     -76
>>
>> and the code generation looks much better too:
> Feel free to switch to ||. (The use of | producing worse code is clearly
> a weakness of the compiler. Especially when used on non-adjacent fields
> I expect | to be quite a bit better, first and foremost by ending up
> with just a single conditional branch. Sadly I haven't seen compilers
> do such a transformation for us.)
>
> All of your reply doesn't address my remark regarding whether to check
> ->steppings here, though. (And no, whether to check it shouldn't be
> [solely] justified by the compiler generating better code that way.)

Well, as stated: "It's looking for the {} entry, by looking for 0's in
all of the metadata fields."

The intended usage of ->steppings, or ->feature for that matter, is not
relevant to the loop termination condition, which is simply "is all the
metadata 0".

>>>>      uint16_t model;
>>> Whereas the model is strictly limited to 8 bits.
>> There is space in here, if we need it, but you can't shrink it without
>> breaking the check for the NULL entry (going back to the first obfuscation).
> Breaking? Or merely affecting code generation in a negative way?

Shrinking model without adding (and checking) a new field would mean the
loop condition no longer covers all metadata.

~Andrew

