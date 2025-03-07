Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5BAA5614D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 07:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904583.1312437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRfk-00006D-SL; Fri, 07 Mar 2025 06:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904583.1312437; Fri, 07 Mar 2025 06:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRfk-0008W5-Oq; Fri, 07 Mar 2025 06:59:04 +0000
Received: by outflank-mailman (input) for mailman id 904583;
 Fri, 07 Mar 2025 06:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqRfk-0008Vz-0Q
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 06:59:04 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6f1a52e-fb21-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 07:59:02 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390eebcc331so923279f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 22:59:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8da097sm42929185e9.17.2025.03.06.22.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 22:59:01 -0800 (PST)
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
X-Inumbo-ID: a6f1a52e-fb21-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741330742; x=1741935542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8wyvEdczGpWizVGjAAtGsizqbzD28+n1382w2Q2Yo9Y=;
        b=WQdy0otQDqcWlQ00cO2kaxZezqs369UKXVtmVKoZLv+p73pFOCa7qtIlJl52hXkv/0
         JKl0CRSnOsbj+2SX2ozc/7UHGi+h4ueD/+63rzEntEvCdh4HVcHjRot4C2iZgeWyXJcH
         JycU2pGWljDCW587eSstrS7sxxgjFXz4OYSThMqgT6dnTvKAK0YiHR1lLCAyqR1/7eQD
         G8bC4/nSyjokeWOto5g5+ygKsRbYsOwLR00rxHCas6ejX8Rx1jjVz2oI7WMSgSDhRYoN
         g2ZxQDOZLmEB48hIAIpMGrOl/C6j1dHdILI0lwvevfnwqf/q5FDypfM95SNM01FZcKb+
         Z4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741330742; x=1741935542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wyvEdczGpWizVGjAAtGsizqbzD28+n1382w2Q2Yo9Y=;
        b=a2A1fvJ+SejQ0stCI5V8M0lH1WKFjnvonp+wduAkaYBa0zlx7gCAnnGwcxa+Bz1N2y
         I/R1ZXgd59qaNXkRa4nmBLoXXdZ5qVqnjrLV11pSRaNXq54IVVNgpi9DXpigCF18aqHz
         03GuDNo5DWiyUC1p3CvRtKhu9v92j/XPForbQF5RHP+Fqk1vH+ADrMQ1Pjk8rRuq+2HP
         7YwnF/MSSpfxjnt1mAIw0iPPNcl8ms9zVAaYDnxHGuQ9MKZhgug2TE/yqg/I3fEL6ySk
         q0KHCG7YhrmfZZpoXP3Zjcir5BXOSNce0K20r/ChcYXuITi8iZ7ZyXm1ZTiTjQEjHAou
         b30g==
X-Forwarded-Encrypted: i=1; AJvYcCUUcYIOHpyD/w6lR9+OYYilHlAukptSZUGoE+In+a8SPEi1VmoIr4a43Hf8GwaM8yRKr/YFtkg1exE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4dMBofLcZev67d4zLe4cNpt7bG5ZqJbY5zGp0IODWV5b3sz4n
	tyPrm/RqPwKUrgO0xI46amKY76My7CrotckehmEgnerPgQeD2HUdoetYFIjPsQ==
X-Gm-Gg: ASbGncvXzCCbgzCKOqmKiJfmuw39d4CiS3YKO8M5fhSIFaWHckRBM4BCtzGOgLy1aKE
	6xe/6W5dw1vVQwDbTyDRprLuune9MJrifvvd6GIxHehPl0vCLLl3TeEPaHKhZDKHVPcr7ubgvoS
	rHCC2o70rafqJiETx4SQV3F6jeyv5Zn9XdglOZ+3QDQSRZm8Gpw/ptvRHd9v4WidIvn8wpLVx32
	f5lKqea2SSKCyOlSdqxc7OqT6jYxdRId1ReP+mPc+6rczEmj14hvMYAlEke6hADebNh+0jwOJpw
	QUemCYRrsdM/ib0cFTEYMj/ea/nRF/hQ4bOdy7v1dNv/hP766lNEi5MkWEdmmCfq4Qi67QIaIew
	oU3s88Szu0KXPsNoP7Z4NXtvY9nBCxg==
X-Google-Smtp-Source: AGHT+IE5vcZz3t/1VI8X2rhG6LIhDSoEgAzGWuW0O+IhDM7Oa3j5x8TxiMkMD523NYOMd3SgjTcSdQ==
X-Received: by 2002:a05:6000:1888:b0:390:e904:63ee with SMTP id ffacd0b85a97d-3912982e891mr3970918f8f.17.1741330742073;
        Thu, 06 Mar 2025 22:59:02 -0800 (PST)
Message-ID: <8166d698-9761-40d6-a4c0-c7614d97367e@suse.com>
Date: Fri, 7 Mar 2025 07:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Don't cast away const-ness in vcpu_show_registers()
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
 <5eadc0e9-54ce-464c-80fe-e7b7cfd45ecf@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <5eadc0e9-54ce-464c-80fe-e7b7cfd45ecf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2025 00:17, Andrew Cooper wrote:
> On 05/03/2025 7:53 am, Jan Beulich wrote:
>> On 03.03.2025 17:52, Andrew Cooper wrote:
>>> On 26/02/2025 7:33 am, Jan Beulich wrote:
>>>> On 26.02.2025 00:02, Andrew Cooper wrote:
>>>>> The final hunk is `(struct vcpu *)v` in disguise, expressed using a runtime
>>>>> pointer chase through memory and a technicality of the C type system to work
>>>>> around the fact that get_hvm_registers() strictly requires a mutable pointer.
>>>>>
>>>>> For anyone interested, this is one reason why C cannot optimise any reads
>>>>> across sequence points, even for a function purporting to take a const object.
>>>>>
>>>>> Anyway, have the function correctly state that it needs a mutable vcpu.  All
>>>>> callers have a mutable vCPU to hand, and it removes the runtime pointer chase
>>>>> in x86.
>>>>>
>>>>> Make one style adjustment in ARM while adjusting the parameter type.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>>> CC: Julien Grall <julien@xen.org>
>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>
>>>>> RISC-V and PPC don't have this helper yet, not even in stub form.
>>>>>
>>>>> I expect there will be one objection to this patch.  Since the last time we
>>>>> fought over this, speculative vulnerabilities have demonstrated how dangerous
>>>>> pointer chases are, and this is a violation of Misra Rule 11.8, even if it's
>>>>> not reasonable for Eclair to be able to spot and reject it.
>>>> On these grounds
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> Thanks.
>>>
>>>> irrespective of the fact that a function of this name and purpose really, really
>>>> should be taking a pointer-to-const.
>>> No - this is a perfect example of why most functions should *not* take
>>> pointer-to-const for complex objects.
>>>
>>> There is no such thing as an actually-const vcpu or domain; they are all
>>> mutable.  The reason why x86 needs a strictly-mutable pointer is because
>>> it needs to take a spinlock to negotiate for access to a hardware
>>> resource to read some of the registers it needs.
>>>
>>> This is where there is a semantic gap between "logically doesn't modify"
>>> and what the C keyword means.
>> And hence (in part) why C++ gained "mutable" ages ago.
> 
> Sure.  If we were writing in C++, then an internal splinlock being
> mutable would be a fine thing.
> 
> But we're writing in a language where there is no such concept.
>>> Anything except the-most-trivial trivial predates may reasonably need to
>>> take a spinlock or some other safety primitive, even just to read
>>> information.
>>>
>>>
>>> Because this was gratuitously const in the first place, bad code was put
>>> in place of making the prototype match reality.
>>>
>>> This demonstrates a bigger failing in how code is reviewed and
>>> maintained.  It is far too frequent that requests to const things don't
>>> even compile.  It is also far too frequent that requests to const things
>>> haven't read the full patch series to realise why not.  Both of these
>>> are a source of friction during review.
>>>
>>> But more than that, even if something could technically be const right
>>> now, the request to do so forces churn into a future patch to de-const
>>> it in order to make a clean change.  And for contributors who aren't
>>> comfortable saying a firm no to a maintainer, this turns into a bad hack
>>> instead.
>>>
>>> i.e. requests to const accessors for complexity objects are making Xen
>>> worse, not better, and we should stop doing it.
>> Okay, let's agree that we don't agree in our perspectives here.
> 
> I'm not saying this to be mean.  If C could do something like C++'s
> mutable, then this wouldn't be an issue.
> 
> But, I have lost count of the number of times I have had to reject
> requests of yours to const a pointer, on the basis that it can't
> compile.  Your review feedback cost one of my team-members a week trying
> to fulfil a const request before asking me for help, and it was another
> impossible example.
> 
> Of all feedback given by reviewers (it's not only you), requests to
> const are the ones that are most often wrong in my experience.

I am entirely certain you're wrong here, unless maybe you mean solely
comments on patches of yours. There are far too many places where we're
still lacking const, and people are copying such instances far too
blindly.

>  Probably
> only ~50% of requests are correct, yet it takes a very seasoned
> developer to come back and say "no, that doesn't compile", because
> that's really a "I think you're wrong" needing knowledge in a subtle
> part of the language.
> 
> My request is to all reviewers.  Please take far more care before asking
> for const.  There are absolutely cases where it's right, but a false
> request is more problematic than it appears at the surface.

I am attempting to be quite careful with such requests, but as for any
review comment mistakes / oversights happen. Furthermore relatively
often I put such comments as questions, in the hope to indicates this
way that the change request depends on the result actually building
fine. In fact things not building doesn't necessarily mean the comment
was outright wrong - it often means code elsewhere isn't properly
constified.

My request to all submitters: Constify your patches properly up front.

Jan

