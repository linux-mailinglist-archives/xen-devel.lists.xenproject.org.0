Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CA187CE91
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 15:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693878.1082523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8Jc-0006vH-Ok; Fri, 15 Mar 2024 14:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693878.1082523; Fri, 15 Mar 2024 14:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8Jc-0006tj-Lv; Fri, 15 Mar 2024 14:13:44 +0000
Received: by outflank-mailman (input) for mailman id 693878;
 Fri, 15 Mar 2024 14:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl8Jb-0006td-9Y
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 14:13:43 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3967bb13-e2d6-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 15:13:41 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d4541bf57eso28119331fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 07:13:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gq25-20020a170906e25900b00a46636af78dsm1747620ejb.100.2024.03.15.07.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 07:13:40 -0700 (PDT)
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
X-Inumbo-ID: 3967bb13-e2d6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710512020; x=1711116820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfDziWEKbg23n7KL+NCj4ZqT+RMsRJjyK9lajTzkRjM=;
        b=P5HCwQYSZ0qEFV3g9d4CrYRAnVCTVrXdfStfC320KbAo8hQinGmtrMimaeCkHe3uAI
         9NhB9fMTu4h3UeRDGujW5+tEPNb8zK0pQuFGQhkIyY6AyVs896N0nSnTihnE+4QLsSpH
         R4FlOLjwXGydyVAh3c1J0rA3lh9FsH0q6q1yEqjpDAaVOw5wDunuzpIsuz0Y8et7gDtA
         stHghVPjtTC+Oji+/qJUzQpdOofNHl9xR/4fcS+ubt9T5YPUDnUKKq1rL8NxQWeLS96Y
         iZjHQ0rABnEDcg2SWUQu6oLc58RSXlTkj7PFYkASqC0VlJtGXXw/9jcerqVFk/9vbrPv
         Dpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710512020; x=1711116820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sfDziWEKbg23n7KL+NCj4ZqT+RMsRJjyK9lajTzkRjM=;
        b=massAHtMAJvXJBWXBdaZwCzERQSdHZBOaxm4A2q5TKkwOpDxC2mIkETf6EgCpDY7oY
         2AUp7fvBGWt88nkdWdmCVDfgneD/ciVGcXnKHh8xQXfZOmM7v3n1+MWkDQcrToNPhDtb
         berEIeCsQxTAMPnjajJgXMD19ZOWMeoPzwg/EzuyGiBu6eDeI6hC5dGm08LOYa9N+Vwi
         d6m5qyFp6z9EUDVHMk1bhzVUeCq550zbYXO01C1a74XeTzgXC1GuQWgNGlQxMBppv6ce
         xN/nTOP/hmfpsOAzHh86gJe3eonZbJ+QDWsHDeD+0bXTBGxTcsdyKXKaszv8YWAqYC5v
         Byag==
X-Forwarded-Encrypted: i=1; AJvYcCVdZecSG+SedbITUF8zlRowkAYem3aru2k9+uch/lk5z7E1q5IswtuCQTL3bIi8nGVfC8ZX9GuY2E2njzNnrIUTvN388DvZaROaByEJj/c=
X-Gm-Message-State: AOJu0YyrF88mc5vuqCq4HG6RJAmlBOB089EVxnAhJL5ZwVXbisC3DQJC
	QyYIVKoUQV+R2s/6jgCmK1Pjvsq0cJmZPhduV3XqjGcuue9Aeyur93mhqqHDuA==
X-Google-Smtp-Source: AGHT+IH5ZDPDDiCFv6+tSLuP8UYVAgt/mTfpvUOZS2NM0l9jJQP5m0RwTcrTlUPqyNQN9b3YKDMEOQ==
X-Received: by 2002:a2e:9357:0:b0:2d2:ad40:a7de with SMTP id m23-20020a2e9357000000b002d2ad40a7demr3390835ljh.20.1710512020411;
        Fri, 15 Mar 2024 07:13:40 -0700 (PDT)
Message-ID: <7109ef7e-040c-4d11-ba4b-d898ed2530ff@suse.com>
Date: Fri, 15 Mar 2024 15:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 federico.serafini@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com, George Dunlap <george.dunlap@cloud.com>
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
 <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
 <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com>
 <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com>
 <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
 <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com>
 <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org>
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
In-Reply-To: <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.03.2024 14:55, Julien Grall wrote:
> Hi Jan,
> 
> On 15/03/2024 13:24, Jan Beulich wrote:
>> On 15.03.2024 13:17, George Dunlap wrote:
>>> On Fri, Mar 15, 2024 at 11:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> It sounds like Andy and Stefano feel like this is a situation where "a
>>>>> fixed width quantity is meant"; absent any further guidance from the
>>>>> CODING_STYLE about when fixed widths should or should not be used, I
>>>>> don't think this change would be a violation of CODING_STYLE.
>>>>
>>>> As with any not sufficiently clear statement, that's certainly true here,
>>>> too. Yet if we try to give as wide meaning as possible to "a fixed width
>>>> quantity is meant", there's basically no restriction on use of fixed width
>>>> types because everyone can just say "but I mean a fixed width quantity
>>>> here". I think the earlier sentence needs taking with higher priority,
>>>> i.e. if a basic type does for the purpose, that's what should be used. The
>>>> 2nd sentence then only tries to further clarify what the 1st means.
>>>
>>> Come, now.  There are lots of situations where we just need some sort
>>> of number, and there's no real need to worry about the exact size.
>>> There are other situations, where we mean "whatever covers the whole
>>> address space" or the like, where it makes sense to have something
>>> like "unsigned long", which changes size, but in predictable and
>>> useful ways.  There are other situations, like when talking over an
>>> API to code which may be compiled by a different compiler, or may be
>>> running in a different processor mode, where we want to be more
>>> specific, and set an exact number of bits.
>>>
>>> Should we use uint32_t for random loop variables?  Pretty clearly
>>> "No".  Should we use uint32_t for the C entry of a hypercall, even
>>> though the assembly code allegedly makes that unnecessary?  At least
>>> two core maintainers think "maybe just to be safe".  That's hardly a
>>> slippery slope of "anyone can say anything".
>>>
>>> Other than "it's in CODING_STYLE", and "it's not really necessary
>>> because it's ensured in the assembly code", you haven't advanced a
>>> single reason why "uint32_t" is problematic.
>>
>> And it isn't, I never said it would be. But if we set rules for
>> ourselves, why would we take the first opportunity to not respect them?
> 
> I am a bit confused. Reading through the thread you seem to agree that
> the written rules are respected here. So what rules are you talking about?

What was proposed is use of a fixed width type where according to my
reading ./CODING_STYLE says it shouldn't be used.

Jan

