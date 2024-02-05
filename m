Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E074484969D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675728.1051136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvO9-0006n4-TN; Mon, 05 Feb 2024 09:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675728.1051136; Mon, 05 Feb 2024 09:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvO9-0006lL-QM; Mon, 05 Feb 2024 09:35:41 +0000
Received: by outflank-mailman (input) for mailman id 675728;
 Mon, 05 Feb 2024 09:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWvO9-0006ih-4F
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:35:41 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebf56445-c409-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 10:35:38 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fd72f71f8so5522105e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 01:35:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 je21-20020a05600c1f9500b0040efb490814sm7947906wmb.27.2024.02.05.01.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:35:38 -0800 (PST)
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
X-Inumbo-ID: ebf56445-c409-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707125738; x=1707730538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uMjQ6jp5wYZEe3NmQUyqQlqUL6pV9sndahTuPWK+ck=;
        b=MHqhTWR4+RjMOqsP4k8P6NdCKopI30/CNLDnr9lTfy3IA+YfUG2wbxtxn1Qui1togy
         IAYMdon5vk0PZS8hOpMiGKQaMEXPNafALOMWYApeGfQ0JnTmSd4qEgXW0FV8kmTLQtXV
         seXegV7W9LHFRX3LcrpmLtkSQtKfdn/zJvt1Uo54MldzaT1P+7YmKhN2Dj2woJ+MT0mX
         uVPPdCjkwaXEUEEqFdO6WCmHLdmXmQitCMOsIL8sZNCHK1EpTQFfBM9IY/kGV6zwAwWR
         8BmTNGblPxqPCVK9EJfTb9IijVFWhMfo7+wOxbCSxBuj02bvRsmjDF6OVHN6TrRpoclf
         5UUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125738; x=1707730538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uMjQ6jp5wYZEe3NmQUyqQlqUL6pV9sndahTuPWK+ck=;
        b=kxyAvseCnh444C/w26L98VbTrakD3zN8KRGdlkAUWTDlKH6TLXylPbF2sCj3h6haId
         9x0jNwBrLD2zBOXdcym+759FiHeqKlfKzXgkNJFup0kwsqMIsekQgKsppEG2pFD7RgoH
         U6VtClRlFExNxNE+0BA3QdsCzUisBsyy7xc8gWZAWzzn0yuRMx9Zdy8RjekgFhdTMQ+l
         5bXjcDkMJMqyK9w3hfsOl2vSYCH5rJkK050Osl49AHPvzejBf41pfPeGpGt+7oT886RS
         695Hxn/ldYXybPquUpZgeN2isR6wTlmJJskbz3mExIEABEJIa674KOD6Chorh2iztR2g
         KwFQ==
X-Gm-Message-State: AOJu0YwLe1LFWl7ilkBDA5PuHfJC6XPQOQW+VOkce+KruCJ3IiTcP5gQ
	GSHOVdfk3zlh8COL2UBM4H5fJWG/mT5V7OJn+jyNOzHGqwPZRo0EiJireH0jqQ==
X-Google-Smtp-Source: AGHT+IERZtHpeul+KmV0AOgCD71wnHdvIeZoqZ+jSKG/7ErB7HzscEWJG5vA8pKwCSnm4c5MrKAa9Q==
X-Received: by 2002:a05:600c:5248:b0:40f:b2ba:b893 with SMTP id fc8-20020a05600c524800b0040fb2bab893mr3806760wmb.1.1707125738312;
        Mon, 05 Feb 2024 01:35:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCULU1Ae+ltZSEb02wJqGuY4oW7VxxkEnkrKVGjzvS5NBYDaS77u6HAqBcQ7KtTlZn5KqUccX4FaxrtrhVMXWuzeufL7qLcBM3ctEnEAN7iFyPJ5SHQpT7FVq+vRUBJzRWnzCHlb2R0O2B+MtbYCQeiHYL0iAsAqTaR2Wz9ZU5w6iBDnC2y1n0jaitrPoU06KVc/xho7qaddaXFQf0E0TOwa/JFgqwaK0+lN6vzCcRUSkDIgPkkzf1MnjwFK4dgE/mVd4Yv4DjZM4E/rvAJII5p83ymN0LVflHJ4PPGpqfpiKrK7pNwwGA84tgMA6GIcvIKqZQnZdf5+fTBxQdjGMuX+SETciTGdIZAbCGjoHkgKFEUYJB/n9EaIe+tSXHEqfay3Fg==
Message-ID: <82e01801-2fef-4a5b-b343-2cd4a99af016@suse.com>
Date: Mon, 5 Feb 2024 10:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/15] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-5-carlo.nonato@minervasys.tech>
 <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
 <CAG+AhRW4Ng7wkhB5f2H5ruCmYgium0YXZgA_bu7=T6HErUEg2A@mail.gmail.com>
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
In-Reply-To: <CAG+AhRW4Ng7wkhB5f2H5ruCmYgium0YXZgA_bu7=T6HErUEg2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2024 12:39, Carlo Nonato wrote:
> On Thu, Feb 1, 2024 at 2:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> --- a/xen/common/llc-coloring.c
>>> +++ b/xen/common/llc-coloring.c
>>> @@ -17,6 +17,63 @@ size_param("llc-way-size", llc_way_size);
>>>  /* Number of colors available in the LLC */
>>>  static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
>>>
>>> +static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
>>> +static unsigned int __initdata dom0_num_colors;
>>> +
>>> +/*
>>> + * Parse the coloring configuration given in the buf string, following the
>>> + * syntax below.
>>> + *
>>> + * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
>>> + * RANGE               ::= COLOR-COLOR
>>> + *
>>> + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
>>> + */
>>> +static int parse_color_config(const char *buf, unsigned int *colors,
>>> +                              unsigned int num_colors, unsigned int *num_parsed)
>>
>> Is this function going to be re-used? If not, it wants to be __init.
>> If so, I wonder where the input string is going to come from ...
> 
> You're right. It needs __init.

Am I misremembering to have spotted a non-init use in a later patch?

>> Also "num_colors" looks to be misnamed - doesn't this specify an
>> upper bound only?
> 
> It's the real size of the colors array.

Hence my remark: It is _not_ the number of colors.

>>> +int __init dom0_set_llc_colors(struct domain *d)
>>> +{
>>> +    unsigned int *colors;
>>> +
>>> +    if ( !dom0_num_colors )
>>> +        return domain_set_default_colors(d);
>>> +
>>> +    colors = alloc_colors(dom0_num_colors);
>>> +    if ( !colors )
>>> +        return -ENOMEM;
>>> +
>>> +    memcpy(colors, dom0_colors, sizeof(unsigned int) * dom0_num_colors);
>>
>> sizeof(*colors) or some such please. Plus a check that colors and
>> dom0_colors are actually of the same type. Alternatively, how about
>> making dom0_colors[] __ro_after_init? Is this too much of a waste?
> 
> You mean an ASSERT on the two arrays type?

I don't think you can use ASSERT() for such very well. It's runtime
check, when here we want a build-time one. I'd therefore rather see
it be something like

   (void)(colors == dom0_colors);

Jan

