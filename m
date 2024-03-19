Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF0487F8E2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 09:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695247.1084850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUUt-0004mG-PO; Tue, 19 Mar 2024 08:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695247.1084850; Tue, 19 Mar 2024 08:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUUt-0004kj-LW; Tue, 19 Mar 2024 08:06:59 +0000
Received: by outflank-mailman (input) for mailman id 695247;
 Tue, 19 Mar 2024 08:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmUUr-0004kd-VH
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 08:06:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6e1c50f-e5c7-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 09:06:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46dd7b4bcbso43727566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 01:06:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 di17-20020a170906731100b00a45aa7cb029sm5756003ejc.36.2024.03.19.01.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 01:06:54 -0700 (PDT)
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
X-Inumbo-ID: a6e1c50f-e5c7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710835615; x=1711440415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNRWCo+o1B68GBRRcxYDYCJpuCK2Mo5BzztG9yF8XPU=;
        b=gl0n2OkZ//FVAdr5AfoHGGlekVQ2a0288jhJuRg/X5rt3K51R6dSrg0DLWlLWLbnj9
         0kkrKRj23ygIZOET4GJQ6a5U/3sIwppN8+oZl/FmR4025btuVtZqDBrU5Pagb9UOpglu
         qH2OlFWLPaipxwPgdq4uO2x2mqWD6VygVHMAH3n3X83iYA8sbVuFCCtewKZzbuGljp74
         bpAxovhIGWOU2IzEpLG7ul3C/2nPIigUjTQiano+jkSm3trxW+yUILdMI1doZJqMaPva
         ++69PpzFxoFkarbcicBEaISx7DylaiHZngy+1W1utLwXvoZFxYn1bNVa1VADudgQraDA
         KxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835615; x=1711440415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNRWCo+o1B68GBRRcxYDYCJpuCK2Mo5BzztG9yF8XPU=;
        b=swGMMX48PyJGfMiYjcxqcF3+eDHsaCDbNIJ/980UUYecNuR8e16Fl8yDwP9BivQY8a
         /6nCrHfMwYQV+pHZAPTtgQeOvxakU7zJDMeoKr8bKhMWLdDINH8FqF34aQ3wkIJQ6IzM
         VcXU/rkpdiYFIzueEzdaKiaT9/ReKQeKUpXbNHGMw9upjrSVmmhAhDW9cpN3+A1JKcAh
         IuULr5ned6N85PR6OLBRnhNG46WpO8OmYrD7PRQoexKUi6CN3NnWXwGrArZxFzFIad9D
         ywQaWLa0HsVARRMKBsX0aN3gZpqhj/AoSr2f40gB1TLnmwt9CNAFczS5KfrQfQy2GgBo
         STuw==
X-Forwarded-Encrypted: i=1; AJvYcCVeXVFgnKh/ZDIeLDCd11k4kzI1dQV8RXPKxj20XEj2W6YuKqSW6EmIhTANbHrlkGlXVi75TlJDDp9FEH3gOBoPUzf5UWExmUvY0bsxzkA=
X-Gm-Message-State: AOJu0YxUa8A9Q1zU9lXa1SB/zneTGK8nVMqHLC3krAq4kr927gJ9Bnux
	TAWHj7QIRF62hCBbAL3wrK6sSsoDQLUMbr+RKHW6QisDKEH9VP1f7RZjOJXoYg==
X-Google-Smtp-Source: AGHT+IHlY36jXRq5Ip1pxI3H7UpbW+X/Bt2GUgs04mLKuhGAluLrGQadGYxTet0RtcqdbwHxzVOT4w==
X-Received: by 2002:a17:907:174c:b0:a46:47d5:2851 with SMTP id lf12-20020a170907174c00b00a4647d52851mr8752702ejc.29.1710835615159;
        Tue, 19 Mar 2024 01:06:55 -0700 (PDT)
Message-ID: <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com>
Date: Tue, 19 Mar 2024 09:06:54 +0100
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
In-Reply-To: <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 04:37, Stefano Stabellini wrote:
> On Mon, 18 Mar 2024, Jan Beulich wrote:
>> On 16.03.2024 01:07, Stefano Stabellini wrote:
>>> On Fri, 15 Mar 2024, Jan Beulich wrote:
>>>> On 14.03.2024 23:17, Stefano Stabellini wrote:
>>>>> Xen makes assumptions about the size of integer types on the various
>>>>> architectures. Document these assumptions.
>>>>
>>>> My prior reservation wrt exact vs minimum sizes remains.
>>>
>>> We have to specify the exact size. In practice the size is predetermined
>>> and exact with all our supported compilers given a architecture.
>>
>> But that's not the purpose of this document; if it was down to what
>> compilers offer, we could refer to compiler documentation (and iirc we
>> already do for various aspects). The purpose of this document, aiui,
>> is to document assumption we make in hypervisor code. And those should
>> be >=, not ==.
> 
> Well... I guess the two of us are making different assumptions then :-)
> 
> Which is the reason why documenting assumptions is so important. More at
> the bottom.
> 
> 
>>> Most importantly, unfortunately we use non-fixed-size integer types in
>>> C hypercall entry points and public ABIs. In my opinion, that is not
>>> acceptable.
>>
>> The problem is that I can't see the reason for you thinking so. The C
>> entry points sit past assembly code doing (required to do) necessary
>> adjustments, if any. If there was no assembly layer, whether to use
>> fixed with types for such parameters would depend on what the
>> architecture guarantees.
> 
> This could be the source of the disagreement. I see the little assembly
> code as not important, I consider it just like a little trampoline to
> me. As we describe the hypercalls in C header files, I consider the C
> functions the "official" hypercall entry points.

Why would that be? Any code we execute in Xen is relevant.

> Also, as this is an ABI, I consider mandatory to use clear width
> definitions of all the types (whether with this document or with
> fixed-width types, and fixed-width types are clearer and better) in both
> the C header files that describe the ABI interfaces, as well as the C
> entry points that corresponds to it. E.g. I think we have to use
> the same types in both do_sched_op and the hypercall description in
> xen/include/public/sched.h

There are two entirely separate aspects to the ABI: One is what we
document towards consumers of it. The other is entirely internal, i.e.
an implementation detail - how we actually consume the data.
Documenting fixed-width types towards consumers is probably okay,
albeit (see below) imo still not strictly necessary (for being
needlessly limiting).

>> As to public ABIs - that's structure definitions, and I agree we ought
>> to uniformly use fixed-width types there. We largely do; a few things
>> still require fixing.
> 
> +1
> 
> 
>>> We have two options:
>>>
>>> 1) we go with this document, and we clarify that even if we specify
>>>   "unsigned int", we actually mean a 32-bit integer
>>>
>>> 2) we change all our public ABIs and C hypercall entry points to use
>>>    fixed-size types (e.g. s/unsigned int/uint32_t/g)
>>>
>>> 2) is preferred because it is clearer but it is more work. So I went
>>> with 1). I also thought you would like 1) more.
>>
>> For ABIs (i.e. structures) we ought to be making that change anyway.
>> Leaving basic types in there is latently buggy.
> 
> I am glad we agree :-)
> 
> It is just that I also consinder the C hypercall entry points as part of
> the ABI
> 
> 
>> I'm happy to see a document like this added, for the purpose described
>> above. But to me 1) and 2) and largely independent of one another.
> 
> Good that you are also happy with a document like this.
> 
> The remaining question is: what about the rest of the C functions in Xen
> that are certainly not part of an ABI?

As per above - anything internal isn't part of the ABI, C entry points
for hypercall handlers included. All we need to ensure is that we consume
the data according to what the ABI sets forth.

To use wording from George when he criticized my supposed lack of actual
arguments: While there's nothing technically wrong with using fixed
width types there (or in fact everywhere), there's also nothing technically
wrong with using plain C types there and almost everywhere else (ABI
structures excluded). With both technically equal, ./CODING_STYLE has the
only criteria to pick between the two. IOW that's what I view wrong in
George's argumentation: Demanding that I provide technical arguments when
the desire to use fixed width types for the purpose under discussion also
isn't backed by any.

> Those are less critical, still this document should apply uniformily to
> them too. I don't understand why you are making the >= width assumption
> you mentioned at the top of the file when actually it is impossible to
> exercise or test this assumption on any compiler or any architecture
> that works with Xen. If it cannot be enabled, it hasn't been tested, and
> it probably won't work.

Hmm, yes, that's one way to look at it. My perspective is different though:
By writing down assumptions that are more strict than necessary, we'd be
excluding ports to environments meeting the >= assumption, but not meeting
the == one. Unless of course you can point me at any place where - not
just by mistake / by being overly lax - we truly depend on the == that you
want to put in place. IOW yes, there likely would need to be adjustments
to code if such a port was to happen. Yet we shouldn't further harden
requirements that were never meant to be there.

Note that by writing down anything more strict than necessary, you'd also
encourage people to further wrongly treat e.g. uint32_t and unsigned int
as identical. Such wrong assumptions had been a severe hindrance in doing
ports from 32- to 64-bit processors some 20 years ago. I would have hoped
that we'd learn from such mistakes.

Jan

