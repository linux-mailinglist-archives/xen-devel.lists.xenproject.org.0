Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E99C8637
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836155.1252031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWDf-0002Rf-33; Thu, 14 Nov 2024 09:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836155.1252031; Thu, 14 Nov 2024 09:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWDf-0002Q0-04; Thu, 14 Nov 2024 09:32:55 +0000
Received: by outflank-mailman (input) for mailman id 836155;
 Thu, 14 Nov 2024 09:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWDc-0002Ps-Rg
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:32:52 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68eb9ebe-a26b-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 10:32:47 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso6041171fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:32:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da244924sm17233795e9.7.2024.11.14.01.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 01:32:46 -0800 (PST)
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
X-Inumbo-ID: 68eb9ebe-a26b-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzMiLCJoZWxvIjoibWFpbC1sajEteDIzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY4ZWI5ZWJlLWEyNmItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTc2NzY3Ljg3MzM5NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731576767; x=1732181567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CzXrmpKY1AwjTX7JjIVttAni6DzCxl8k37LNhWVE4xI=;
        b=Z9HKLu3fTx8W5tnV1rOpCaWKq9Sg6mc8UIIEwzmaEOnu0PxjOt6f6f4Ej6th4ZwF9u
         YmowEL3k+QbcIKy4BYs9BMeIhTQLiU4uAkC7lz2Y1olFrem3MwFuskqt2ji77XP7HEnl
         LHW1UYE1gPtbWvsV+CoBWFLuhH9x2ub0INKGDJC/NNfcfRpGqRJNaMMAZWU358aECgnV
         jstrplap7SSnThW/E5SvJ0aYDsg+b/cdk1PM8GfjP2bu5otl0fe4Te//9UIISyw3U3Cs
         rZmBvqwXpmagQEdg3VBhQdGFm5mUv7em/LCPOt47Zv/0aJl8DHOQItE8TswYKIinOWVy
         K6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731576767; x=1732181567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzXrmpKY1AwjTX7JjIVttAni6DzCxl8k37LNhWVE4xI=;
        b=iXPy3l5H96+kchGWPeoyoLBmaLa60r1LnDkrPIGGyvvP6GGEiRCjS6HZ/1dv2dgIm9
         UIsccNKy5NunUbS/eVoqTQLWaw9hNanmRc4Pb/ak9MdDxjAJvQMORmIM8DTMnufQH3R1
         ke1a8kcmjlT90IEpzu63gU3BVDTOQomopZaS+SC+B8sUIV1oU4dyikf/WfxrcSg6VFOa
         CVkHbVIowUzX1BBSPLX2tLdKIvwTYtV99Ax42/TkoFP9wBFpYGBj3Ta9mqPUkcTmRCCm
         cTGqOEV6gK+mTS3OnIwqaObKwqa2ZeUX3kx/PKQcR8db3dnSEy6rvWKU32DRaBCXA+Mg
         y+7w==
X-Forwarded-Encrypted: i=1; AJvYcCUD6bWdgdLyCdR8kYJ9eU8NeFhf/cIgzAiMrcOj8ib0AXwQsv0q1JOOzYZDjvNZ5Z6nH1N6E2exVQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYhGdvGl69vBbC5V1J4GaTzEhTEthbj03austMr9A7dcmEOmp5
	yKTYWbrBiTyX8dGfdk1tIwJkPNWCl8r0iHsjmED8yqRu0TYGIzprmiR5Ft5j5g==
X-Google-Smtp-Source: AGHT+IHE7fDkyB35uuCrBW4Nz99ABm/O5HwOliuZXdahrOdib1s1d71HXmngT11EV4b4HDMRPzn/Rg==
X-Received: by 2002:a2e:b896:0:b0:2ff:559e:c877 with SMTP id 38308e7fff4ca-2ff5909e884mr11336211fa.33.1731576767119;
        Thu, 14 Nov 2024 01:32:47 -0800 (PST)
Message-ID: <318c3af2-6233-4778-9fe9-2f9397025039@suse.com>
Date: Thu, 14 Nov 2024 10:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/multicall: Change nr_calls to uniformly be
 unsigned long
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com>
 <20240621205800.329230-3-andrew.cooper3@citrix.com>
 <660fc551-c6bc-456f-8e9e-80b3e592fece@suse.com>
 <alpine.DEB.2.22.394.2411121912400.222505@ubuntu-linux-20-04-desktop>
 <35b585a0-7d19-4b02-8ad6-90c7df3ae6ac@suse.com>
 <alpine.DEB.2.22.394.2411131825400.222505@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2411131825400.222505@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 03:34, Stefano Stabellini wrote:
> On Wed, 13 Nov 2024, Jan Beulich wrote:
>> On 13.11.2024 04:15, Stefano Stabellini wrote:
>>> It is challenging to create a solution that satisfies everyone for this
>>> patch. However, we should add R8.3 to the clean list as soon as possible
>>> to enable rule blocking in GitLab-CI. Failing to do so risks introducing
>>> regressions, as recently occurred, undoing the significant efforts made
>>> by Bugseng and the community over the past year.
>>>
>>> Unless there is a specific counterproposal, let us proceed with
>>> committing this patch.
>>
>> Well, I find this odd. We leave things sit in limbo for months and then
>> want to go ahead with a controversial solution? Rather than actually
>> (and finally) sorting out the underlying disagreement (of which there
>> are actually two sufficiently separate parts)? Plus ...
> 
> The reason is that several MISRA regressions were recently introduced.
> These regressions could have been easily detected by GitLab CI if we had
> marked the rules as clean. I believe we should expedite accepting the
> fixes and marking the rules as clean. We can always adjust the fixes or
> deviations later to better suit our preferences. In my opinion, we
> should prioritize marking the rules as clean.
> 
> 
>>> On Mon, 24 Jun 2024, Jan Beulich wrote:
>>>> On 21.06.2024 22:58, Andrew Cooper wrote:
>>>>> Right now, the non-compat declaration and definition of do_multicall()
>>>>> differing types for the nr_calls parameter.
>>>>>
>>>>> This is a MISRA rule 8.3 violation, but it's also time-bomb waiting for the
>>>>> first 128bit architecture (RISC-V looks as if it might get there first).
>>>>>
>>>>> Worse, the type chosen here has a side effect of truncating the guest
>>>>> parameter, because Xen still doesn't have a clean hypercall ABI definition.
>>>>>
>>>>> Switch uniformly to using unsigned long.
>>>>
>>>> And re-raising all the same question again: Why not uniformly unsigned int?
>>>> Or uint32_t?
>>
>> ... this question of mine effectively represents a concrete alternative
>> proposal (or even two, if you like).
>>
>> The two parts where there appears to be disagreement are:
>> 1) When to (not) use fixed width types, as presently outlined in
>>    ./CODING_STYLE.
>> 2) How to type C function parameters called solely from assembly code (of
>>    which the hypercall handlers are a subset).
>>
>> And maybe
>> 2b) How to best express such function parameters when they're (sometimes)
>>     shared between native and compat handlers.
>>
>> Of course 2) is affected by, as Andrew validly says, there not being a
>> formally clean ABI definition.
>>
>> My fear is that if this gets committed as is, it'll be used as a handle to
>> force in further similarly questionable / controversial changes to other
>> hypercall handlers. Which is why I think the controversy needs sorting out
>> first (which admittedly is hard when the ABI is fuzzy).
> 
> While I appreciate your concern, as you know, aligning on the topics
> above takes time. I do not believe it is in the interest of the
> community, both contributors and reviewers, to delay marking this rule
> as clean. Honestly, I do not mind how it gets marked as clean, as long
> as we do it soon.
> 
> Additionally, please keep in mind that the Xen Project tends to have a
> long memory. As a result, there is usually little risk of the so-called
> "slippery slope" problem.
> 
> If you prefer a deviation I am OK with that too. I just want 8.3 as
> clean :-) 

No, please no deviations when we can avoid them. Since it feels like it's
always (going to be?) me to give in when there is such disagreement, why
don't I do so here as well: Go ahead.

Jan

