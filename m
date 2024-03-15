Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5713987CCF9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693830.1082434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl6BX-000292-71; Fri, 15 Mar 2024 11:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693830.1082434; Fri, 15 Mar 2024 11:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl6BX-00026c-4L; Fri, 15 Mar 2024 11:57:15 +0000
Received: by outflank-mailman (input) for mailman id 693830;
 Fri, 15 Mar 2024 11:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl6BV-00026U-Ve
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 11:57:13 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27f52361-e2c3-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 12:57:11 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so2450103a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 04:57:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jy5-20020a170907762500b00a4675490095sm1374917ejc.42.2024.03.15.04.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 04:57:10 -0700 (PDT)
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
X-Inumbo-ID: 27f52361-e2c3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710503831; x=1711108631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yOmxhPCWXdF9hS0DFfqfFyhifL6yntj5Zf+pKecLhw=;
        b=QqDs1i++iFQyiOw7iKBXKB/DYvomWYJkM/beJqyvgX5ZgU/Qx269m75AxTLdHvOezL
         M9FszYFGyZdcR+CR084Qt4qMt4mInpUwo2Cyxr1AoG/7Neax8Q2T+X9bzRLjSiE3heqH
         Muhs3EQ9UXsnYnQaTHcbxQ2XkY1kJjvkqsKQ3nIhdMADcyE7b5V7H9W3nUOuM3VIuRMc
         2qNgqfVqjWASXGEYDUacXBrdHOl4GcS9/68VwDya1oGcNIDZowMYUvk7xyy9v5gn/E7W
         T/LwQDX0S3yQ11/LuWyXrK/NbvOQi+wY5eHoObs3h5uYGguuaPFiKcbf+XXVpWeK0sfK
         RxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503831; x=1711108631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yOmxhPCWXdF9hS0DFfqfFyhifL6yntj5Zf+pKecLhw=;
        b=iUPVrTvYDf5U4x5tifNw/3tHp4/iXbAgYvAbzT44ip/3Fi8aE0lbPZTg1E3UCF7YSb
         K95PyFJeLidRYXFDjEPauk+GoYG91hJBrFUSpc1iHlEfTj7dKReqbwegRkD9hHi9wcVf
         /VE8iz3b6qBXLyiOwCZdtWlPu9r01WjuwR0ld2YhBR626GoBaprD5WoYZQPEHikYNsSe
         PzwYUuN7WX0LYib11B8YRfnmwPilPAu5oGMXEghAW+WYrE+6WA8WeGXCIrsVnnc50dar
         YUxmFZukJEl0tgXFv2vzeL3b95rQU5VEWlUiuwG/gIL31RnUMwgXr+5Js2FS4/mP972S
         noGA==
X-Forwarded-Encrypted: i=1; AJvYcCXWjfMiVJJm2Nm7CjIYkGLSSuG7aiU8iZBDba58KlDeb//Kw4YXopRFgCMjCvf0zuBFrSyF99RwuAsh9VZJ6SmbsPY1X/KfQi2B1Ge5e9w=
X-Gm-Message-State: AOJu0YwfsswMQUH8+H5S5Ms3eDdd5oIwO5VqDUflsoV7nfUkd5/wTCvz
	tBFcHTvto3FWMP1wDaX+O/pFf2TB0HzPtI0qWpOE1w+2JtWeEQk1BPMiUI2mIA==
X-Google-Smtp-Source: AGHT+IGqu+M6FC5OCHBOnz1+6nH8cgOM/s8KP7vlnFOQjL6CrcodEGZEGlSpfEkKv2YdQdclQ3JYnQ==
X-Received: by 2002:a17:906:9c8c:b0:a3e:cdae:7aa2 with SMTP id fj12-20020a1709069c8c00b00a3ecdae7aa2mr3801232ejc.35.1710503830761;
        Fri, 15 Mar 2024 04:57:10 -0700 (PDT)
Message-ID: <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com>
Date: Fri, 15 Mar 2024 12:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 federico.serafini@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com, julien@xen.org
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
 <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
 <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com>
 <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
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
In-Reply-To: <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.03.2024 11:59, George Dunlap wrote:
> On Fri, Mar 15, 2024 at 6:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2024 01:21, Stefano Stabellini wrote:
>>> On Mon, 11 Mar 2024, Julien Grall wrote:
>>>> On 11/03/2024 11:32, George Dunlap wrote:
>>>>> On Sat, Mar 9, 2024 at 1:59 AM Stefano Stabellini
>>>>> <sstabellini@kernel.org> wrote:
>>>>>>
>>>>>> I would like to resurrect this thread and ask other opinions.
>>>>>>
>>>>>>
>>>>>> On Thu, 23 Nov 2023, Jan Beulich wrote:
>>>>>>> On 22.11.2023 22:46, Stefano Stabellini wrote:
>>>>>>>> Two out of three do_multicall definitions/declarations use uint32_t as
>>>>>>>> type for the "nr_calls" parameters. Change the third one to be
>>>>>>>> consistent with the other two.
>>>>>>>>
>>>>>>>> Link:
>>>>>>>> https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com/
>>>>>>>> Link:
>>>>>>>> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop/
>>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>>> ---
>>>>>>>> Note that a previous discussion showed disagreement between
>>>>>>>> maintainers
>>>>>>>> on this topic. The source of disagreements are that we don't want to
>>>>>>>> change a guest-visible ABI and we haven't properly documented how to
>>>>>>>> use
>>>>>>>> types for guest ABIs.
>>>>>>>>
>>>>>>>> As an example, fixed-width types have the advantage of being explicit
>>>>>>>> about their size but sometimes register-size types are required (e.g.
>>>>>>>> unsigned long). The C specification says little about the size of
>>>>>>>> unsigned long and today, and we even use unsigned int in guest ABIs
>>>>>>>> without specifying the expected width of unsigned int on the various
>>>>>>>> arches. As Jan pointed out, in Xen we assume sizeof(int) >= 4, but
>>>>>>>> that's not written anywhere as far as I can tell.
>>>>>>>>
>>>>>>>> I think the appropriate solution would be to document properly our
>>>>>>>> expectations of both fixed-width and non-fixed-width types, and how to
>>>>>>>> use them for guest-visible ABIs.
>>>>>>>>
>>>>>>>> In this patch I used uint32_t for a couple of reasons:
>>>>>>>> - until we have better documentation, I feel more confident in using
>>>>>>>>    explicitly-sized integers in guest-visible ABIs
>>>>>>>
>>>>>>> I disagree with this way of looking at it. Guests don't invoke these
>>>>>>> functions directly, and our assembly code sitting in between already is
>>>>>>> expected to (and does) guarantee that (in the case here) unsigned int
>>>>>>> would be okay to use (as would be unsigned long, but at least on x86
>>>>>>> that's slightly less efficient), in line with what ./CODING_STYLE says.
>>>>>>>
>>>>>>> Otoh structure definitions in the public interface of course need to
>>>>>>> use fixed with types (and still doesn't properly do so in a few cases).
>>>>>
>>>>> You didn't address the other argument, which was that all the other
>>>>> definitions have uint32_t; in particular,
>>>>> common/multicall.c:do_multicall() takes uint32_t.  Surely that should
>>>>> match the non-compat definition in include/hypercall-defs.c?
>>>>>
>>>>> Whether they should both be `unsigned int` or `uint32_t` I don't
>>>>> really feel like I have a good enough grasp of the situation to form a
>>>>> strong opinion.
>>>>
>>>> FWIW +1. We at least need some consistency.
>>>
>>> Consistency is my top concern. Let's put the "unsigned int" vs
>>> "uint32_t" argument aside.
>>>
>>> do_multicall is not consistent with itself. We need
>>> hypercall-defs.c:do_multicall and multicall.c:do_multicall to match.
>>>
>>> Option1) We can change hypercall-defs.c:do_multicall to use uint32_t.
>>>
>>> Option2) Or we can change multicall.c:do_multicall to use unsigned int.
>>>
>>> I went with Option1. Andrew expressed his strong preference toward
>>> Option1 in the past. George seems to prefer Option1.
>>>
>>> Jan, can you accept Option1 and move on?
>>
>> Counter question: Why do we have the opposite of what you all want stated
>> in ./CODING_STYLE?
> 
> Indeed, that's what I wanted to ask at the committer's meeting on
> Wednesday, but we ran out of time.
> 
>> Looking at the commit, it was actually George who ack-ed
>> it. I can accept option 1 if ./CODING_STYLE is first changed / amended.
> 
> That change was added in 2019, but I certainly remember discussions
> along these lines going on long before then.  Presumably there was a
> long unwritten tradition of avoiding explicitly-sized types unless
> necessary, and someone said, "that's not in the CODING_STYLE", and so
> you added it.  Having the expectation written down is certainly worth
> having, even if I don't personally care that much about it.
> 
> I will note that when I gave my Ack, I said that it probably wanted an
> Ack from then ARM maintainers as well [1]; that doesn't seem to have
> happened, so there's an argument that it was checked in improperly.

Hmm. "Would be good" doesn't sound like a strict requirement to me.
Don't forget that there was over 8 months between submission and your
ack. Anyone caring to object had their chance. I also didn't commit
this the same day you gave your ack.

> The coding style says, "Fixed width types should only be used when a
> fixed width quantity is meant".  In the discussion on v2 of the patch,
> I went through some uses of uint32_t, and regarding instances "Inside
> headers for public interfaces", you said [2]:
> 
>> Here fixed width types are definitely the right choice.
> 
> It sounds like Andy and Stefano feel like this is a situation where "a
> fixed width quantity is meant"; absent any further guidance from the
> CODING_STYLE about when fixed widths should or should not be used, I
> don't think this change would be a violation of CODING_STYLE.

As with any not sufficiently clear statement, that's certainly true here,
too. Yet if we try to give as wide meaning as possible to "a fixed width
quantity is meant", there's basically no restriction on use of fixed width
types because everyone can just say "but I mean a fixed width quantity
here". I think the earlier sentence needs taking with higher priority,
i.e. if a basic type does for the purpose, that's what should be used. The
2nd sentence then only tries to further clarify what the 1st means.

Jan

