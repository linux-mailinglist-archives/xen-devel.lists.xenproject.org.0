Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917B976CFA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797605.1207594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solNj-0008Jr-18; Thu, 12 Sep 2024 15:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797605.1207594; Thu, 12 Sep 2024 15:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solNi-0008HD-U0; Thu, 12 Sep 2024 15:05:14 +0000
Received: by outflank-mailman (input) for mailman id 797605;
 Thu, 12 Sep 2024 15:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1solNi-0008GF-18
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:05:14 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68909608-7118-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 17:05:12 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so365639566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:05:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d63c0fsm761729766b.213.2024.09.12.08.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 08:05:10 -0700 (PDT)
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
X-Inumbo-ID: 68909608-7118-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726153511; x=1726758311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tslD/+NUmWSF20tFFtxL0ZialOgHnAtbApYc1g+LpQY=;
        b=PhYV0vDTAiXl21cC0mEf5cM/ZDXMQuQliv5FP6ma7lA/znLnHpNFdtJ6TMXEzw1RgS
         K4acQjnLTNvT1M00rzCloacaHmuxzFHQXLXenZSPOU3LqVREPFytQQW6cEWSRY/2nofg
         PGHmoAMWrk1ltvB1n03hi42ewBu0I7P+ROdNRWJyQkKoXbMB9N2L8CXJ6vlDK+Rnxkqq
         TI8z/Iznc8zUcLSDTP5TdQQldn2cRdZErbN+FR4W3CHajMfKD//xzZDgDuCC8LxCsHRe
         MFYCWvWxEHFbstthZfNLa8ePcqz5bAC6gU+mR2RCPyUD8e8aGa027T7by0fQBPfGkXs7
         dttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153511; x=1726758311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tslD/+NUmWSF20tFFtxL0ZialOgHnAtbApYc1g+LpQY=;
        b=X4hzFrpMFjsZMHOsvzWrvd3gQ0+/9alhKHht55ojB/ZtHdJhiwCp9zKhUKcuB23QQ8
         +cNJHxXbPIc1vWnCEzBy89xwq8fd/HtrztwDE9EmGi7qcn7JWbggsrRf4/37GWo6kBLT
         uohHcY2RFtAZJVTQAQPJW3NlhXkK0i5WJo3mxrTp3OciWUsZUvSsYKiSM/0N+NzHBMdi
         JDqTgiKHklFc6iexhVheNzuODpv4EgB/tnIIzc+oauvDmhPkJEVVCmAafGtlOrmULnA+
         hZG8FRi9D1j1vLzpceROvgi6Xi/2fgOzWLjuMlHA7oHiXyZr2Wzm/vyFKGGQo78iFddK
         KLAA==
X-Forwarded-Encrypted: i=1; AJvYcCWME4Dl0m7YD8aDcn/X+xv9UCUs6aB/VINw3y53iFMPFwNR6bhsLk/T4WFTTJxIWe+ouoVbTvbaXyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywgpc6h+CNp6X1mdVbXin++4+6ty06L8HWTuB5E2RkJ38hQb0xm
	qzDq5XprkjALqc0amsSxhBfH9VQbRIS3ds0UQhZCZRP3NUOtzheC+dhmAhKsPQ==
X-Google-Smtp-Source: AGHT+IGx74XmrlQGnEUC8NyARncl1AbTorcCcmIui5Nu5lJi+8EfPo68TVelOs4JDlpctLV1DxsHsQ==
X-Received: by 2002:a17:907:9626:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a902a8c2779mr331239066b.22.1726153510843;
        Thu, 12 Sep 2024 08:05:10 -0700 (PDT)
Message-ID: <74beb539-304b-4707-94bc-7a9d92d72742@suse.com>
Date: Thu, 12 Sep 2024 17:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
 <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com>
 <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop>
 <44738f93-e99b-4f1c-9ed3-59dd2eac7aff@suse.com>
 <alpine.DEB.2.22.394.2409111808580.611587@ubuntu-linux-20-04-desktop>
 <e2542d65-d5a5-44aa-a90b-ea8dad6a547f@suse.com>
 <CACHz=Zhn+UdO_Sfeispv47Dx22ux+i9-kJVkBLPJ+qxV52nB3w@mail.gmail.com>
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
In-Reply-To: <CACHz=Zhn+UdO_Sfeispv47Dx22ux+i9-kJVkBLPJ+qxV52nB3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2024 17:03, Frediano Ziglio wrote:
> On Thu, Sep 12, 2024 at 3:35 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.09.2024 03:13, Stefano Stabellini wrote:
>>> On Tue, 10 Sep 2024, Jan Beulich wrote:
>>>> On 10.09.2024 06:57, Stefano Stabellini wrote:
>>>>> On Mon, 9 Sep 2024, Jan Beulich wrote:
>>>>>> On 05.09.2024 17:48, Alessandro Zucchelli wrote:
>>>>>>> This section explains which format should be followed by header
>>>>>>> inclusion guards via a drop-down list of rules.
>>>>>>>
>>>>>>> No functional change.
>>>>>>>
>>>>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>>>>>>
>>>>>>> ---
>>>>>>> Changes in v6:
>>>>>>> - edit inclusion guards naming conventions, including more details
>>>>>>
>>>>>> Yet I'm afraid that from my pov we're still not there. Specifically ...
>>>>>>
>>>>>>> --- a/CODING_STYLE
>>>>>>> +++ b/CODING_STYLE
>>>>>>> @@ -159,6 +159,34 @@ Emacs local variables
>>>>>>>  A comment block containing local variables for emacs is permitted at
>>>>>>>  the end of files.  It should be:
>>>>>>>
>>>>>>> +Header inclusion guards
>>>>>>> +-----------------------
>>>>>>> +
>>>>>>> +Unless otherwise specified, all header files should include proper
>>>>>>> +guards to prevent multiple inclusions. The following naming conventions
>>>>>>> +apply:
>>>>>>
>>>>>> ... reading this, I can't derive ...
>>>>>>
>>>>>>> +- Private headers: <dir>__<filename>_H
>>>>>>> +    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>>>>>>> +    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
>>>>>>> +    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
>>>>>>
>>>>>> ... the absence of an equivalent of the arch/ part of the path. As per
>>>>>> my recollection we agreed on that shortening, but it needs spelling out
>>>>>> in the textual description. Such that it is possible to derived what to
>>>>>> uses as a name for, say, a header under common/, crypto/, or drivers/
>>>>>> (or anywhere else of course). Specifically with the further examples ...
>>>>>
>>>>> Are you asking for something like this?
>>>>>
>>>>> Omit the word "arch" from the filepath.
>>>>>
>>>>> If you prefer an alternative wording please suggest the text.
>>>>>
>>>>>
>>>>>>> +- asm-generic headers: ASM_GENERIC__<filename>_H
>>>>>>> +    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
>>>>>>> +
>>>>>>> +- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
>>>>>>> +    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
>>>>>>
>>>>>> ... here and ...
>>>>>
>>>>> Suggested text:
>>>>>
>>>>> Omit the words "arch" and "include/asm" from the filepath, ASM is also
>>>>> prefixed.
>>>>>
>>>>>
>>>>>>> +- Xen headers: XEN__<filename>_H
>>>>>>> +    - include/xen/something.h -> XEN__SOMETHING_H
>>>>>>
>>>>>> ... here, where more than just one path component is omitted, deriving
>>>>>> what's meant can end up ambiguous. Yet ambiguity is what we absolutely
>>>>>> want to avoid, to preempt later discussions on any such naming.
>>>>>
>>>>> Suggested text:
>>>>>
>>>>> Omit the words "include/xen" from the filepath, XEN is always prefixed.
>>>>>
>>>>> Please suggest a specific alternative if you prefer
>>>>
>>>> Looks like I still didn't get across my point: The verbal description
>>>> that's ahead of all of the examples should be complete enough to describe
>>>> the whole set of rules, in sufficiently abstract terms. Then the examples
>>>> will be easy to prove as fitting those rules, and it will be easy to
>>>> derive the naming for further identifiers. IOW - no, I'm not asking for
>>>> the examples to be further commented, but for the naming rules to be
>>>> _fully_ spelled out.
>>>
>>>
>>> Hi Jan, we have gone back and forth on this a few times, but neither
>>> Alessandro nor I fully understand your perspective. To help streamline
>>> the process and save time for everyone, I suggest you provide an example
>>> of the rules written in the style you believe is appropriate. Once you
>>> set the initial direction, Alessandro and I can continue and complete
>>> the rest in that preferred style.
>>
>> If you really expect me to do so (hence effectively me becoming the one
>> to make the proposal, which I never meant to), it'll have to wait until
>> I'm back from the GNU Tools Cauldron and the PTO I'm taking immediately
>> afterwards.
>>
>> Jan
>>
>>> On a related note, I have encountered formal specifications that use less
>>> formal language than this simple code style and naming convention
>>> adjustment. I feel we might be over-engineering this, and in my opinion,
>>> the current version is sufficient. Any additional time spent on this
>>> could be better used addressing MISRA violations that pose real safety
>>> risks for Xen users.
> 
> Why not just following the simple rule?
> If file is arch/arm/arm64/lib/something.h have a
> ARCH__ARM__ARM64__LIB__SOMETHING_H guard, if file is
> arch/x86/lib/something.h have a ARCH__X86__LIB__SOMETHING_H guard.

We've been there before: Identifiers get overly long this way.

Jan

