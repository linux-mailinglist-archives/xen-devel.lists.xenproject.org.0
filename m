Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1028388A579
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697775.1088867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolm6-00085s-6m; Mon, 25 Mar 2024 14:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697775.1088867; Mon, 25 Mar 2024 14:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolm6-00083n-3S; Mon, 25 Mar 2024 14:58:10 +0000
Received: by outflank-mailman (input) for mailman id 697775;
 Mon, 25 Mar 2024 14:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rolm5-00083h-8A
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 14:58:09 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17123b2b-eab8-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 15:58:07 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a474c4faf5eso174975366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 07:58:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x20-20020a170906b09400b00a469e55767dsm3125682ejy.214.2024.03.25.07.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 07:58:07 -0700 (PDT)
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
X-Inumbo-ID: 17123b2b-eab8-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711378687; x=1711983487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huJjcNoZ7SphTouJw8YE47BK1mjEvt25On/jfB4rk8w=;
        b=NgqU16jQLRvOj7rliwLYfZPaHwYIhtiuFXDxEP7HCbHazpeeojZh2JA3rXALUQ/aoV
         dy8rqPVQHBpocSaMo740X0JsIqs+qqbWgZBxLkojg4SzrETn2bLA47HDbHsbCOzxOMzP
         kX3EgdU1zYpo+KjHC/SzS+oHrd+r/gyleTxvTzoRAufGjoZN2S/exqRfBYfa1fLND7Zt
         coMvJSJ6j6dIxYY3Ug0fQLV634nDImq6sQl3ptvhveOucdJqkQvNZjM7l/sLenrzsLlu
         YqVzgZ5YhLv9vip+XVd00eeBtDSz2lOBhCQ14MHxNH2clVnyLdVVV8npK70t5+FEUOo2
         5X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378687; x=1711983487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huJjcNoZ7SphTouJw8YE47BK1mjEvt25On/jfB4rk8w=;
        b=XaT1aewnh1dCQ0W6Ce+3bEOZQ48DjQlQWMtMUzRRKtn7S8DdkMDgHkNis0EiXoHbPK
         QuB5X2LH8pF6mBtYN6HSj3vxZ4PkEql9RStGMX3ePkkJ5tpaogKXy9jAXnuEGW00+mW1
         hURlhXdSMIzSUUf1t4Y0XDJTzGryaSDaiLnjFvY6pyRTVCpaNyy3s1ohYg6qvMeljSs4
         wCEZvre1vVoV38B+ey5pqm982bZPd4CpGIxyJHjFlNxVC13JnQmB469l5ESycIDBwu4C
         khXKiyDrFDJGZOkpOt22X+OMxImqHXUtZz++M5kZaD5Fm0mHPjLjN4xfh5QRJoJ8rVq5
         X4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUuhBc9mDQCn7VYpXiBtKuTCOn0+1O8V6hSA1Cna8zBLUMAlmkiDdVOMAGaQsS3dmaSRte0zwZKgraPRwKxtuapV4SB9o1LLUFrD03bbdE=
X-Gm-Message-State: AOJu0Yx3z2DbPqhpdIBTK5OhygH2Cujv8kbaayhBJLmWWTFRNhApFxkQ
	Kr5YGQaO5DF8YNbvR4XbKes6BVLwZ+NdXr1WM7nSQy3c0XrGWYT9HNhnFsYZeg==
X-Google-Smtp-Source: AGHT+IHovogu8MivfcpidG1ZM+5E4UrE654S/pyvmLBeLyVeP15cruCT4aBgpGE6MEy+izDVLfhLgg==
X-Received: by 2002:a17:906:f9d8:b0:a47:499b:d735 with SMTP id lj24-20020a170906f9d800b00a47499bd735mr4048576ejb.14.1711378687295;
        Mon, 25 Mar 2024 07:58:07 -0700 (PDT)
Message-ID: <b1777a3a-d468-40ea-aa5b-79d506a24abf@suse.com>
Date: Mon, 25 Mar 2024 15:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 08/11] x86/altcall: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <653ead65966226f50b0e4ae0268912c9710f9dba.1711118582.git.nicola.vetrini@bugseng.com>
 <072aa89b-2a03-4823-af72-28a2a882b373@suse.com>
 <bacda1cba33d40092209d30f48cb9c3b@bugseng.com>
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
In-Reply-To: <bacda1cba33d40092209d30f48cb9c3b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2024 15:47, Nicola Vetrini wrote:
> On 2024-03-25 10:38, Jan Beulich wrote:
>> On 22.03.2024 17:01, Nicola Vetrini wrote:
>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>> of macro parameters shall be enclosed in parentheses". Therefore, some
>>> macro definitions should gain additional parentheses to ensure that 
>>> all
>>> current and future users will be safe with respect to expansions that
>>> can possibly alter the semantics of the passed-in macro parameter.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Hmm. These macros are, at least in part, hard to read already. The 
>> added
>> parentheses, while necessary when following the rule to the letter, are
>> making things worse, even if just slightly. I therefore have a proposal 
>> /
>> question:
>>
>>> --- a/xen/arch/x86/include/asm/alternative.h
>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>> @@ -243,28 +243,28 @@ extern void alternative_branches(void);
>>>
>>>  #define alternative_vcall0(func) ({             \
>>>      ALT_CALL_NO_ARG1;                           \
>>> -    (void)sizeof(func());                       \
>>> +    (void)sizeof((func)());                     \
>>
>> Like this, all that's touched here are (syntactical, but not real) 
>> function
>> invocations. Function calls, like all postfix operators, are highest
>> precedence. Hence by omitting parentheses in that case no breakage can
>> happen as a result: If the passed expression is another postfix one, 
>> that'll
>> be evaluated first anyway. If any other expression is passed (aside 
>> primary
>> ones, of course), that'll be evaluated afterwards only due to being 
>> lower
>> precedence, irrespective of the presence/absence of parentheses.
>>
>> Therefore, where harmful to readability, can we perhaps leave postfix
>> expressions alone?
> 
> While I can understand the benefits of this, and the reasoning on 
> postfix expressions, what about, for instance (modulo the actual 
> invocation, this is just an example)
> 
> alternative_vcall0(2 + f) or similar scenarios?

Any kind of such expression will break with alternative_callN()'s
using of [addr] "i" (&(func)) as an asm() operand. Which clarifies
that even of the postfix expressions only some (in particular not
increment, decrement, and function call) could potentially be used
with the altcall machinery.

That said, you have a point in (indirectly) expressing that my
earlier description wasn't quite right (as in: too generic, when
it really needs tying to the specific case here).

Jan

