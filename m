Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100E965C5E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786284.1195855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxeg-00072M-15; Fri, 30 Aug 2024 09:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786284.1195855; Fri, 30 Aug 2024 09:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxef-00070N-TC; Fri, 30 Aug 2024 09:10:53 +0000
Received: by outflank-mailman (input) for mailman id 786284;
 Fri, 30 Aug 2024 09:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjxee-000709-Dz
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:10:52 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bff18149-66af-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 11:10:49 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c22b1f470dso1223680a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 02:10:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce48f0sm1692255a12.79.2024.08.30.02.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 02:10:48 -0700 (PDT)
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
X-Inumbo-ID: bff18149-66af-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725009049; x=1725613849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XT4Yg5crDkbfU+vWXD1Sxz60wgfsa6qjHCvF7zSJeBM=;
        b=FOo1Kyzq7UW6jn8XGE4LIVO+x02srQvlZpXKt6jlx10+xiuQe9KkZYVtDbrFjkV32H
         Pm4CazqCwZRl7Vgjsh0WZ0oWvHlSiwpxi2lrfsAXmJCcmB4iauMRusZOQ8GqwNSVWm8q
         HbeDMMf++uU+floEqgdf4xh0k1lAXch9SEOWrZJfRc+rodt+j+M5oe2kCWqF1Ck3HhFQ
         Uibfpbuhvjg0TxfMVmQ6bFI7t32zSQmqVRVNlVcPGFrwTEdsxMzYhb+NRFd7zfulhpem
         XA4LYRNfIbEI8ltUX8u4LcmxgIZugEndMujTmjr6N2u7Z1deW9cwmjLJ9LTmT2La+pEE
         QbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009049; x=1725613849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT4Yg5crDkbfU+vWXD1Sxz60wgfsa6qjHCvF7zSJeBM=;
        b=AyMPhagXDQvXx3IQdSB6aa6cTEtnDkL6dvmkMNpFN3iSs6Be6Gg16q0Chv8jENCh7+
         /xWy/FnUOJRz/KoNSTgoMl5Qtx8VFujIDV+0yBU/oBCWtnfXoIF9V2bXoo/uwvlC4K7b
         NfZ9nwMQxSZo+4sFQWKbd9u1Uzm7oFofOk7hV7JgSf8vbuYH9hvsRdwi7h1DdAA3kZN+
         F3NLr5M5ZRj8ED3nWX8tnP/1NWD7wb/gRS/8LDXRP+ejR5v9WEHbdZgw7dg2o1i7qLgq
         r+UzzCziiNKOc/TeVCyV6zaY/ibwFdtfMU2uhJr7Sc1uaietsRePS4ffB4YuYSrhbxD9
         2xww==
X-Forwarded-Encrypted: i=1; AJvYcCU7RyDWvq8rYF8RA3g+4wTsQqICwIDPKmBQ5pWY97E/u4oP5Ofsz36Oq7KDSKCFs+SX1uWg7cjbgqk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYW0A/kFbfJMet5S9Vkk+Bn3j0/vDFMUUsYVfIci/IB9yFj2bo
	FRurMl3TTci0ijRlQBkTRQN7Vij1bISGAFhcgx9AwArTcazvTZKuk40GFcVYJokSWW6VbRwtKnY
	=
X-Google-Smtp-Source: AGHT+IHJp+KUOuuaozWcoh+fyOQ+7mb/vnqP2h6dzbn6Cjs2FM9QmDeiMj60CLxF2CYMf5F3/4ocvA==
X-Received: by 2002:a05:6402:4496:b0:5c0:8ea7:3deb with SMTP id 4fb4d7f45d1cf-5c21ed61ba7mr4777167a12.22.1725009048923;
        Fri, 30 Aug 2024 02:10:48 -0700 (PDT)
Message-ID: <b9f46431-b91c-4c30-8d88-b6decdf12b06@suse.com>
Date: Fri, 30 Aug 2024 11:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/bitmap: remove comment-based deviations
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
 <1eae8fa0-2d4c-4cf6-8120-fd7fefa523ed@suse.com>
 <45a72e19-dceb-46a1-9771-066e64f69f38@bugseng.com>
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
In-Reply-To: <45a72e19-dceb-46a1-9771-066e64f69f38@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 10:13, Federico Serafini wrote:
> On 28/08/24 16:50, Jan Beulich wrote:
>> On 28.08.2024 15:12, Federico Serafini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -565,6 +565,10 @@ of this macro do not lead to developer confusion, and can thus be deviated."
>>>   -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>>>   -doc_end
>>>   
>>> +-doc_begin="The expansion of an argument surrounded by tokens '{', '}' and ';' is safe."
>>> +-config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
>>> +-doc_end
>>
>> Not the least because this is quite a bit wider than ...
>>
>>> --- a/xen/include/xen/bitmap.h
>>> +++ b/xen/include/xen/bitmap.h
>>> @@ -103,13 +103,10 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
>>>   #define bitmap_switch(nbits, zero, small, large)			  \
>>>   	unsigned int n__ = (nbits);					  \
>>>   	if (__builtin_constant_p(nbits) && !n__) {			  \
>>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>>   		zero;							  \
>>>   	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
>>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>>   		small;							  \
>>>   	} else {							  \
>>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>>   		large;							  \
>>>   	}
>>
>> ... what's needed here, I wonder if we're not opening up avenues to
>> problems by generally permitting that pattern. Plus in the description
>> I'm missing a statement to the effect of why this is (always) safe.
> 
> The rational of the rule is that if a macro argument expands to an
> expression, there may be problems related to operator precedence, e.g.:
> 
> #define A(x, y) x * y
> 
> A(1+1, 2+2) will expand to: 1+1 * 2+2
> 
> Yes, the deviation is more general and wider than what is needed for
> the specific case but it is safe: if the expanded argument is between
> one of the aforementioned tokens, then there are no operators involved
> and no precedence issues.
> 
> I can add some details in a v2.

Please do,taking into consideration also language extensions that we use,
e.g. the statements-as-expressions one (where figure braces exist inside
an expression).

Jan

