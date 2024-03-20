Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65D880C66
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695766.1085822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqjY-0002KB-US; Wed, 20 Mar 2024 07:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695766.1085822; Wed, 20 Mar 2024 07:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqjY-0002Hq-RG; Wed, 20 Mar 2024 07:51:36 +0000
Received: by outflank-mailman (input) for mailman id 695766;
 Wed, 20 Mar 2024 07:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmqjX-0002Hb-Gb
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:51:35 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aafd2936-e68e-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 08:51:32 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso531053966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 00:51:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ak8-20020a170906888800b00a46b4544da2sm3964527ejc.125.2024.03.20.00.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 00:51:32 -0700 (PDT)
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
X-Inumbo-ID: aafd2936-e68e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710921092; x=1711525892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=264kYHMNrCnzKREFunj4TW0vQGlF/lmI4/pk1dPm/GE=;
        b=M6Y2IRfku6TaCzQZiCGVZV83hJ0IgKqPtPkBwq3BGRHyUJWXm0cQz61vAXoRLpq1HW
         YWnoJpLTJBAvqON19cc9ATCtl7xr92FixrNU5cigIXs2V++ph9+MrYUiViIc0dx1mfJN
         OBWz60bpJ0xBF1lZil7+lu1D/8b6KHYgZLVJkuBFFxKvIcAUPkNzdel63TBCrjXjzR3h
         I1QmXtPXhEMZnp3tMUUQYehQXUr0l/EyfMmHNFWDNkYeQiFfhZxJ5YoYFOsIanSQfqQt
         zF+FE5hXp9P1KxEZu/ELMCs3+m8n2KSi6OyVysrnxbg8VuatNdb217CwdbZfD48SNLp6
         QiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710921092; x=1711525892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=264kYHMNrCnzKREFunj4TW0vQGlF/lmI4/pk1dPm/GE=;
        b=CtETCzv4PLbtD6E6bClm9WjbPPM77z2ZkXY1ghLRe46PxgYlErZ6ADz1QOfZZWbLfz
         kuvd7VFGCbbomyAaYXnFE3b6gJ7vv400EGbSO44OlVDc+b5zGMHcRB73FMCdKBONVdwa
         eyaauJ8cKnTK3ULSNiFn2Uk8sCy+ORIqtDpBPGnUP4Ha8M86ePV8M1Qgc0Jd/za1IDvw
         uxDOjN8BLwFmTCpSg3ZWj9dJyuO5Vu5ZiSsrv38kVc56jB3FpeKlFDKN7h9yaI05ie9X
         aY/rmLKXWAdsJCW+Xafvx7uD41uVA8XQqwOLSrxWUentUxYOeRnBj9SvXrVIY0Y5J2aE
         Y2gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8Fm9Nw8wbxuKNhr4Zp+XwA7nHMsz6+SpYwUFVzdXgewK+c9WdB1iVpYeBS8p5ydWWyJdYifBotFtPL+73ZMebwhErIFmOCUPymoGdMTQ=
X-Gm-Message-State: AOJu0YxHkKVF/uh7fLem+TRUPmkMNQF0m4p2ykPPDrLRkkUbMB3Nwu4G
	gx1CR5bb+VR5/2Pu2HhEPYJDs5KZbyRhTMVF04U7gPWuWQWfhX9AfB/qx3/3bA==
X-Google-Smtp-Source: AGHT+IHtv+XzZNa/R00/jRtgycGltymphZM8VseCmYqQksNyeRocCY1USJXsZziK8RQ49YKe1FxeeQ==
X-Received: by 2002:a17:906:5292:b0:a46:2cc4:421 with SMTP id c18-20020a170906529200b00a462cc40421mr10285617ejm.74.1710921092354;
        Wed, 20 Mar 2024 00:51:32 -0700 (PDT)
Message-ID: <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
Date: Wed, 20 Mar 2024 08:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
 <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
 <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop>
 <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop>
 <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com>
 <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 07:01, Stefano Stabellini wrote:
> On Tue, 19 Mar 2024, Jan Beulich wrote:
>> On 19.03.2024 04:37, Stefano Stabellini wrote:
>>> On Mon, 18 Mar 2024, Jan Beulich wrote:
>>>> On 16.03.2024 01:07, Stefano Stabellini wrote:
>>>>> On Fri, 15 Mar 2024, Jan Beulich wrote:
>>>>>> On 14.03.2024 23:17, Stefano Stabellini wrote:
>>>>>>> Xen makes assumptions about the size of integer types on the various
>>>>>>> architectures. Document these assumptions.
>>>>>>
>>>>>> My prior reservation wrt exact vs minimum sizes remains.
>>>>>
>>>>> We have to specify the exact size. In practice the size is predetermined
>>>>> and exact with all our supported compilers given a architecture.
>>>>
>>>> But that's not the purpose of this document; if it was down to what
>>>> compilers offer, we could refer to compiler documentation (and iirc we
>>>> already do for various aspects). The purpose of this document, aiui,
>>>> is to document assumption we make in hypervisor code. And those should
>>>> be >=, not ==.
>>>
>>> Well... I guess the two of us are making different assumptions then :-)
>>>
>>> Which is the reason why documenting assumptions is so important. More at
>>> the bottom.
>>>
>>>
>>>>> Most importantly, unfortunately we use non-fixed-size integer types in
>>>>> C hypercall entry points and public ABIs. In my opinion, that is not
>>>>> acceptable.
>>>>
>>>> The problem is that I can't see the reason for you thinking so. The C
>>>> entry points sit past assembly code doing (required to do) necessary
>>>> adjustments, if any. If there was no assembly layer, whether to use
>>>> fixed with types for such parameters would depend on what the
>>>> architecture guarantees.
>>>
>>> This could be the source of the disagreement. I see the little assembly
>>> code as not important, I consider it just like a little trampoline to
>>> me. As we describe the hypercalls in C header files, I consider the C
>>> functions the "official" hypercall entry points.
>>
>> Why would that be? Any code we execute in Xen is relevant.
> 
> There are a few reasons:
> 
> - the public interface is described in a C header so it makes sense for
>   the corresponding implementation to be in C
> 
> - the C entry point is often both the entry point in C and also common
>   code
> 
> - depending on the architecture, there is typically always some minimal
>   assembly entry code to prepare the environment before we can jump into
>   C-land; still one wouldn't consider those minimal and routine assembly
>   operations to be a meaningful hypercall entry point corresponding to
>   the C declaration in the public headers
> 
> - as per MISRA and also general good practice, we need the declaration
>   in the public header files to match the definition in C

Throughout, but especially with this last point, I feel there's confusion
(not sure on which side): There are no declarations of hypercall functions
in the public headers. Adding declarations there for the C entry points in
Xen would actually be wrong, as we don't provide such functions anywhere
(to consumers of the ABI).

>>> Also, as this is an ABI, I consider mandatory to use clear width
>>> definitions of all the types (whether with this document or with
>>> fixed-width types, and fixed-width types are clearer and better) in both
>>> the C header files that describe the ABI interfaces, as well as the C
>>> entry points that corresponds to it. E.g. I think we have to use
>>> the same types in both do_sched_op and the hypercall description in
>>> xen/include/public/sched.h
>>
>> There are two entirely separate aspects to the ABI: One is what we
>> document towards consumers of it. The other is entirely internal, i.e.
>> an implementation detail - how we actually consume the data.
>> Documenting fixed-width types towards consumers is probably okay,
>> albeit (see below) imo still not strictly necessary (for being
>> needlessly limiting).
> 
> I don't see it this way.
> 
> As the Xen public interface description is in C and used during the
> build, my opinion is that the public description and the C definition
> need to match.
> 
> Also, I don't understand how you can say that public interfaces don't
> strictly necessarily have to use fixed-width types.
> 
> Imagine that you use native types with different compilers that can
> actually output different width interger sizes (which is not possible
> today with gcc or clang). Imagine that a guest is written in a language
> other than C (e.g. Java) based on the public interface description. It
> cannot work correctly, can it?

They'd need to write appropriate hypercall invocation functions. As per
above - we don't provide these in the public headers, not even for C
consumers.

> I don't see how we can possibly have a public interface with anything
> other than fixed-width integers.

That's the consumer side of the ABI. It says nothing about the internal
implementation details in Xen. All we need to do there is respect the
ABI. That has no influence whatsoever on the C entry points when those
aren't the actual hypercall entrypoints into the hypervisor.

>>>> As to public ABIs - that's structure definitions, and I agree we ought
>>>> to uniformly use fixed-width types there. We largely do; a few things
>>>> still require fixing.
>>>
>>> +1
>>>
>>>
>>>>> We have two options:
>>>>>
>>>>> 1) we go with this document, and we clarify that even if we specify
>>>>>   "unsigned int", we actually mean a 32-bit integer
>>>>>
>>>>> 2) we change all our public ABIs and C hypercall entry points to use
>>>>>    fixed-size types (e.g. s/unsigned int/uint32_t/g)
>>>>>
>>>>> 2) is preferred because it is clearer but it is more work. So I went
>>>>> with 1). I also thought you would like 1) more.
>>>>
>>>> For ABIs (i.e. structures) we ought to be making that change anyway.
>>>> Leaving basic types in there is latently buggy.
>>>
>>> I am glad we agree :-)
>>>
>>> It is just that I also consinder the C hypercall entry points as part of
>>> the ABI
>>>
>>>
>>>> I'm happy to see a document like this added, for the purpose described
>>>> above. But to me 1) and 2) and largely independent of one another.
>>>
>>> Good that you are also happy with a document like this.
>>>
>>> The remaining question is: what about the rest of the C functions in Xen
>>> that are certainly not part of an ABI?
>>
>> As per above - anything internal isn't part of the ABI, C entry points
>> for hypercall handlers included. All we need to ensure is that we consume
>> the data according to what the ABI sets forth.
> 
> It doesn't look like we'll convince one another on this point. But let
> me try another way.
> 
> In my view, having mismatched types between declaration and definition
> and having non-fixed-width types in C hypercall entry points is really
> bad for a number of reasons, among them:
> - correctness
> - risk of ABI breakage
> - mismatch of declaration and definition

What mismatches are you talking about? There's nothing mismatched now,
and there cannot be any mismatch, because the consumers of the ABI don't
call Xen functions directly.

> In your view, the drawback is not following the CODING_STYLE.
> 
> The two points of views on this subject don't have the same to lose. If
> I were you, I would probably not invest my energy to defend the
> CODING_STYLE.
> 
> 
>> To use wording from George when he criticized my supposed lack of actual
>> arguments: While there's nothing technically wrong with using fixed
>> width types there (or in fact everywhere), there's also nothing technically
>> wrong with using plain C types there and almost everywhere else (ABI
>> structures excluded). With both technically equal, ./CODING_STYLE has the
>> only criteria to pick between the two. IOW that's what I view wrong in
>> George's argumentation: Demanding that I provide technical arguments when
>> the desire to use fixed width types for the purpose under discussion also
>> isn't backed by any.
> 
> I don't think we are in violation of the CODING_STYLE as it explicitly
> accounts for exceptions. Public interfaces declarations and definitions
> (hypercalls C entry points included) are an exception.

If that was technically necessary, I would surely agree to there being an
exception here.

> In my opinion, using fixed-width integers in public headers and C
> definitions (including C hypercall entry points) is top priority for
> correctness. Correctness is more important than style. So, if we need to
> change the CODING_STYLE to get there, let's change the CODING_STYLE.
> 
> 
>>> Those are less critical, still this document should apply uniformily to
>>> them too. I don't understand why you are making the >= width assumption
>>> you mentioned at the top of the file when actually it is impossible to
>>> exercise or test this assumption on any compiler or any architecture
>>> that works with Xen. If it cannot be enabled, it hasn't been tested, and
>>> it probably won't work.
>>
>> Hmm, yes, that's one way to look at it. My perspective is different though:
>> By writing down assumptions that are more strict than necessary, we'd be
>> excluding ports to environments meeting the >= assumption, but not meeting
>> the == one. Unless of course you can point me at any place where - not
>> just by mistake / by being overly lax - we truly depend on the == that you
>> want to put in place. IOW yes, there likely would need to be adjustments
>> to code if such a port was to happen. Yet we shouldn't further harden
>> requirements that were never meant to be there.
> 
> I have already shown that all the current implementations and tests only
> check for ==. In my opinion, this is sufficient evidence that >= is not
> supported.
> 
> If you admit it probably wouldn't work without fixes today, would you
> security-support such a configuration? Would you safety-support it? I
> wouldn't want to buy a car running Xen compiled with a compiler using
> integer sizes different from the ones written in this document.
> 
> Let me summarize our positions on these topics.
> 
> Agreed points:
> - public interfaces should use fixed-width types
> - it is a good idea to have a document describing our assumptions about
>   integer types
> 
> Open decision points and misalignments:
> - Should the C hypercall entry points match the public header
>   declarations and ideally use fixed-width integer types? 

As per above, this question just cannot be validly raised. There are
no public header declarations to match.

> I'd say yes and I would argue for it
> 
> - Should the document describing our assumptions about integer types
>   specify == (unsigned int == uint32_t) or >= (unsigned int >=
>   uint32_t)?
> 
> I'd say specify == and I would argue for it

Actually, I had a further thought here in the meantime: For particular
ports, using == is likely okay - they're conforming to particular
psABI-s, after all (and that's what the compilers used also implement).
I'd nevertheless expect >= to be used in common assumptions. That way
for existing ports you get what you want, and there would still be
provisions for new ports using, say, an ILP64 ABI. Common code would
need to adhere to the common assumptions only. Arch-specific code can
work from the more tight assumptions. (If future sub-arch variants are
to be expected, like RV128, arch-code may still be well advised to try
to avoid the more tight assumptions where possible, just to limit
eventual porting effort.)

Jan

