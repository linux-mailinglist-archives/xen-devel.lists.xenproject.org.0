Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B8A55AD4
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 00:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904332.1312227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqKTo-0003XO-B3; Thu, 06 Mar 2025 23:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904332.1312227; Thu, 06 Mar 2025 23:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqKTo-0003Ub-7b; Thu, 06 Mar 2025 23:18:16 +0000
Received: by outflank-mailman (input) for mailman id 904332;
 Thu, 06 Mar 2025 23:18:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqKTn-0003UQ-5Q
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 23:18:15 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fef8f84-fae1-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 00:18:02 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bc638686eso16167785e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 15:18:02 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01952dsm3311679f8f.45.2025.03.06.15.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 15:18:00 -0800 (PST)
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
X-Inumbo-ID: 3fef8f84-fae1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741303081; x=1741907881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OwIYEN/bfwQjxdi9mjzfGuHZDdD9e5wqdn0bOG/mows=;
        b=fa/yuR6c5voAeNu9Cp4e7JktJpb3OqObSeBT5WNla7wY+hlDegRXq5DYSRY6phzUQk
         o2Q+qLplTt4lToT8QyeG+ov0GVFvyC4tH8MZ/xIKg4a4Og8ma3u9a/6NmLJwloUYtPiF
         MdFjUHTk1/pfVqNcsPFvwpUHc88TZGfHDCF0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741303081; x=1741907881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwIYEN/bfwQjxdi9mjzfGuHZDdD9e5wqdn0bOG/mows=;
        b=Yw97uqycCYNk9Tn7q/p6IlxPG4WiRCwVKn2y+bYKVqZUKiV7g0P94O2e10B3R4zSrP
         1DK/QQ6vnks8UA7AdJuteWgmGZOJhABIVU+ub74R+7xBxjXunONSqP8byjGsVlvFXAMZ
         8jN2T74e8sA9koOXPbcgJz3CNZ7dUJQ+7L6sRqZd9pRRPXBH0XL+uAtW19MGv6sUGkxV
         CR9AZo+ZzVzQZCqnFRCiE5wwZrf77o68prkuP19beh+YVpZRnp404arcRkOWPzD+gBdY
         AUxnnTfGhlNek2OXsWQ/4uyqdTpyT4FOz3CwErH/XQRxcyXeYwJFATsnBXSwRUcIwdPx
         IK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSRt0i7xXUD7i2iXZ7xmCqyZN70a+jKDmy66l5DnQhV61ZHD1cyoDqdtuzyOCzsAMbjbHiSQP/2F0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCSBGrFMjzVsztmGEoAEniyVQsktQM3cPbUDf7W3O+vPmbSpFt
	11MrK3UlsdD0Z8UTWSrMWJR9kRFCXIz9OZmLlpPGw/cPcSpsjigNGgQO2ADDdcc=
X-Gm-Gg: ASbGncu9JIcaWSOqEAuAfDmJkthiDC2Ep/+0BXEApcF7rM5EmvRwBUcgokHgN5hv4NG
	3RmGpm+0sox218ebEwHycKRkh2PiL4Q+T85Yi+I8/xl5+esK77/7tPEriQyh6gyoyqPj1wPHk4P
	vsZLa4QE4GHxi8dKJ6EwtEt20UHmRAYBt5C30LiibeREFJJOq7idhikdEIehGKmsJ0UnMqRF1Lw
	CIgkqwsXKdsE3vWpPtR0EVYocJEmneXE/auVxSUXivDpmKywWjlrSLqTMb5eejL01ySW6DRlt8E
	ncEJ0haVBOUdCoulki9jvwsVkRrXIJPY4gy3UbeL/iI5RU3//5udCGUwXESFd+8DYlK2uE17MMt
	sdjXJvLrd
X-Google-Smtp-Source: AGHT+IELQM2u047VHxfDzS0R25HoIuzXz89faGqDNTV/ljPUf0HA/xv0WoNNQQNBr11VhAipJ5nyQw==
X-Received: by 2002:a05:600c:3ba0:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43c5a60170fmr9330975e9.4.1741303081423;
        Thu, 06 Mar 2025 15:18:01 -0800 (PST)
Message-ID: <5eadc0e9-54ce-464c-80fe-e7b7cfd45ecf@citrix.com>
Date: Thu, 6 Mar 2025 23:17:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Don't cast away const-ness in vcpu_show_registers()
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225230213.1248136-1-andrew.cooper3@citrix.com>
 <7e77dceb-489b-4022-a665-2a008ddfe844@suse.com>
 <f62841d3-b0e4-4007-a056-a807a19fc988@citrix.com>
 <98998559-27d6-4b65-bd45-cb1755d48564@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <98998559-27d6-4b65-bd45-cb1755d48564@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 7:53 am, Jan Beulich wrote:
> On 03.03.2025 17:52, Andrew Cooper wrote:
>> On 26/02/2025 7:33 am, Jan Beulich wrote:
>>> On 26.02.2025 00:02, Andrew Cooper wrote:
>>>> The final hunk is `(struct vcpu *)v` in disguise, expressed using a runtime
>>>> pointer chase through memory and a technicality of the C type system to work
>>>> around the fact that get_hvm_registers() strictly requires a mutable pointer.
>>>>
>>>> For anyone interested, this is one reason why C cannot optimise any reads
>>>> across sequence points, even for a function purporting to take a const object.
>>>>
>>>> Anyway, have the function correctly state that it needs a mutable vcpu.  All
>>>> callers have a mutable vCPU to hand, and it removes the runtime pointer chase
>>>> in x86.
>>>>
>>>> Make one style adjustment in ARM while adjusting the parameter type.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>
>>>> RISC-V and PPC don't have this helper yet, not even in stub form.
>>>>
>>>> I expect there will be one objection to this patch.  Since the last time we
>>>> fought over this, speculative vulnerabilities have demonstrated how dangerous
>>>> pointer chases are, and this is a violation of Misra Rule 11.8, even if it's
>>>> not reasonable for Eclair to be able to spot and reject it.
>>> On these grounds
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Thanks.
>>
>>> irrespective of the fact that a function of this name and purpose really, really
>>> should be taking a pointer-to-const.
>> No - this is a perfect example of why most functions should *not* take
>> pointer-to-const for complex objects.
>>
>> There is no such thing as an actually-const vcpu or domain; they are all
>> mutable.  The reason why x86 needs a strictly-mutable pointer is because
>> it needs to take a spinlock to negotiate for access to a hardware
>> resource to read some of the registers it needs.
>>
>> This is where there is a semantic gap between "logically doesn't modify"
>> and what the C keyword means.
> And hence (in part) why C++ gained "mutable" ages ago.

Sure.  If we were writing in C++, then an internal splinlock being
mutable would be a fine thing.

But we're writing in a language where there is no such concept.
>> Anything except the-most-trivial trivial predates may reasonably need to
>> take a spinlock or some other safety primitive, even just to read
>> information.
>>
>>
>> Because this was gratuitously const in the first place, bad code was put
>> in place of making the prototype match reality.
>>
>> This demonstrates a bigger failing in how code is reviewed and
>> maintained.  It is far too frequent that requests to const things don't
>> even compile.  It is also far too frequent that requests to const things
>> haven't read the full patch series to realise why not.  Both of these
>> are a source of friction during review.
>>
>> But more than that, even if something could technically be const right
>> now, the request to do so forces churn into a future patch to de-const
>> it in order to make a clean change.  And for contributors who aren't
>> comfortable saying a firm no to a maintainer, this turns into a bad hack
>> instead.
>>
>> i.e. requests to const accessors for complexity objects are making Xen
>> worse, not better, and we should stop doing it.
> Okay, let's agree that we don't agree in our perspectives here.

I'm not saying this to be mean.  If C could do something like C++'s
mutable, then this wouldn't be an issue.

But, I have lost count of the number of times I have had to reject
requests of yours to const a pointer, on the basis that it can't
compile.  Your review feedback cost one of my team-members a week trying
to fulfil a const request before asking me for help, and it was another
impossible example.

Of all feedback given by reviewers (it's not only you), requests to
const are the ones that are most often wrong in my experience.  Probably
only ~50% of requests are correct, yet it takes a very seasoned
developer to come back and say "no, that doesn't compile", because
that's really a "I think you're wrong" needing knowledge in a subtle
part of the language.

My request is to all reviewers.  Please take far more care before asking
for const.  There are absolutely cases where it's right, but a false
request is more problematic than it appears at the surface.

~Andrew

