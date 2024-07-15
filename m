Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D3930E93
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 09:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758678.1168097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTFve-0000ix-6f; Mon, 15 Jul 2024 07:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758678.1168097; Mon, 15 Jul 2024 07:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTFve-0000hK-2m; Mon, 15 Jul 2024 07:15:22 +0000
Received: by outflank-mailman (input) for mailman id 758678;
 Mon, 15 Jul 2024 07:15:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTFvc-0000hE-GW
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 07:15:20 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd6c78a8-4279-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 09:15:18 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-58b447c5112so5244899a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 00:15:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2caedc92bc2sm3582000a91.35.2024.07.15.00.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:15:17 -0700 (PDT)
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
X-Inumbo-ID: fd6c78a8-4279-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721027718; x=1721632518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=arqopd3DaogN70g6E7wVKXIZIZyWriDLx8GiiDkO+Xs=;
        b=KDuBFGDvriLVqsS67zHnQAv3vkppcCzYnhs5scw3dzxB2SKjOTIY3bUFWlChRyl0k1
         2VHJDdLvrycNhMs1rAkgpYpCucochtdOshQMaA0lKocITg3uOMYIocxt3j40K93deEfO
         owm97NHSOYL1vT02oSHin396oUe2acv5ct7nqZxdR7orY8sF+ffVXvcOBsfKFeVldGWt
         BgVUa4C8j+bxn61q5zXIC82Xj3HKS8znNMBhZC38AIxYB0ZuQUS5O6H2yhyBql/kjdsz
         eu/Dv6OcAZaSqqr81qYB0gHxbCmzXmaFjkNOcGHagysgEWmvUYV7tnxH0bagN3+ATYmj
         fTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721027718; x=1721632518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arqopd3DaogN70g6E7wVKXIZIZyWriDLx8GiiDkO+Xs=;
        b=ao/N6XpsE29jpaFiCn+QVzJeQIEfQ/C/7ANgYA2RvDFvCw/Mz6C4rbyvIEBL7jDDBu
         RQFDGG7HqiO3wpo90aa1mEoE0oWeWOPWm5apEcvBgi8NRzNBAa6d3JwBWV3sIMd6hmP0
         5nG5kKkREl55hg1v8WZkEOmKKorH/jRthmatkID9kp3Lpw/y/NLtDrBC9hEpcl7Qz4oH
         JkjUiXKPtwlPjnC+bHqyZsyDF2s/q+ANJmFr/TJB17CpmbjN2ExMtSW3x0kzug2GaD8B
         6m6jF3qKYXxN1g86fgXG2k1nw/ZidMSmuJ0oNPWD6r99/6oGLhnNeg11+CkeIrQRuZl5
         9ppw==
X-Forwarded-Encrypted: i=1; AJvYcCUSewp1YjRK1xgrKuw80WP2oVp0D///+Wwu0h0xlT+LbQQtjvXsK8C/2P438YY1FwZ3w9wBSeQcdRSEwdzfeeAJfKZ0TLkahz2yrEXmkRU=
X-Gm-Message-State: AOJu0Yzv68warCAKbRfcJO2Dqh711CH2Vuhx74HmEBaMjHBw3fMsdFq1
	fI9mF/JpkGFc8wT4trIBNmDp30bk+2/w1/t/i+yQYNuIXzTx6k0bWoqET8H1rg==
X-Google-Smtp-Source: AGHT+IGbEjypicj/ZhBK+akIt4jPQ+zRfgnWjJVVWU7UHXBGTRlRxw2FRq8mNgDjMsNQjQVXciYAkQ==
X-Received: by 2002:a17:907:94c5:b0:a72:6b08:ab24 with SMTP id a640c23a62f3a-a780b68a964mr1526286366b.14.1721027717849;
        Mon, 15 Jul 2024 00:15:17 -0700 (PDT)
Message-ID: <1a29cebf-a120-47c8-8c84-899879c9f8db@suse.com>
Date: Mon, 15 Jul 2024 09:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.19] xen/bitmap: amend MISRA C deviation for Rule
 20.7
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <794724e70c4e45224916576af01070e8aebe9aab.1720517398.git.nicola.vetrini@bugseng.com>
 <5ff40947-5672-4497-83e7-53ea370b5f58@suse.com>
 <alpine.DEB.2.22.394.2407121423590.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2407121423590.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 23:26, Stefano Stabellini wrote:
> On Tue, 9 Jul 2024, Jan Beulich wrote:
>> On 09.07.2024 11:34, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/bitmap.h
>>> +++ b/xen/include/xen/bitmap.h
>>> @@ -103,18 +103,16 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
>>>  #define bitmap_switch(nbits, zero, small, large)			  \
>>>  	unsigned int n__ = (nbits);					  \
>>>  	if (__builtin_constant_p(nbits) && !n__) {			  \
>>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>>  		zero;							  \
>>>  	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
>>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>>  		small;							  \
>>>  	} else {							  \
>>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>>  		large;							  \
>>>  	}
>>
>> An observation I made only while discussing this on the meeting is that by
>> going from this form to ...
>>
>>>  static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
>>>  {
>>> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>>>  	bitmap_switch(nbits,,
>>>  		*dst = 0UL,
>>>  		memset(dst, 0, bitmap_bytes(nbits)));
>>
>> ... this form, you actually widen what the deviation covers to the entire
>> macro, which is too much. We don't want to deviate the rule for all of the
>> arguments, after all.
>>
>> However, it further occurred to me that the reason for needing the deviation
>> looks to merely be that in some cases (like the one above) we pass empty
>> macro arguments. That's getting in the way of parenthesizing the use sites.
>> We could avoid this, though, by adding e.g.
>>
>> #define nothing ((void)0)
>>
>> near the definition of bitmap_switch() and then using that in place of the
>> empty arguments. Provided of course this is the only obstacle to
>> parenthesization. At which point no deviation ought to be needed in the
>> first place.
> 
> 
> Roberto suggested in another email thread:
> 
>  
>> The problem comes from macro arguments that are expressions, in some cases,
>> and statements, in other cases, as it happens for bitmap_{switch,zero}.
>>
>> Possible solutions include:
>> - wrap the arguments that are statements in a do-while-false;
>> - add a ';' after the arguments that are statements.
>>
>> But what we recommend is to add a deviation for the cases where an argument,
>> after the expansion, is surrounded by the following tokens: '{' '}' ';'.
>> This will address all violations related to bitmap_{switch,zero} and requires
>> only a modification of the ECLAIR configuration which will look like this:
>>
>> -doc_begin="The expansion of an argument between tokens '{', '}' and ';' is safe."
>> -config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
>> -doc_end
>>
>> With this, all the remaining 71 violations in x86 code concerns msi.h, which we were
>> requested not to touch, and the 2 violations in arm code can be easily resolved
>> with a patch adding parentheses, for which a patch was already submitted by
>> Nicola and rejected by Jan.
> 
> 
> I think this is a good way forward because it is a simple deviation that
> makes sense to have, and makes sense as project wide deviation (it is
> not a deviation by name, e.g. deviating anything called
> "bitmap_switch").
> 
> I like Roberto's suggestion. Jan, are you OK with it?

See my reply there.

Jan

