Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF25805810
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647988.1011842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWtK-0000ra-Fq; Tue, 05 Dec 2023 14:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647988.1011842; Tue, 05 Dec 2023 14:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWtK-0000pw-Ci; Tue, 05 Dec 2023 14:59:18 +0000
Received: by outflank-mailman (input) for mailman id 647988;
 Tue, 05 Dec 2023 14:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAWtI-0000mR-6j
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:59:16 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db529335-937e-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:59:15 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bf4f97752so3094487e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:59:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv7-20020a05600c548700b00405959469afsm18907541wmb.3.2023.12.05.06.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:59:14 -0800 (PST)
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
X-Inumbo-ID: db529335-937e-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701788354; x=1702393154; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9KlrpjUUVLnd/EEjtL8m/ZwmwonL3mRNYsh9nF13Vo=;
        b=W1lSZ3JoJGFNeigRl7hgOSoXIEotr5TxFwvxYD3SQIdWCLDCJMxmuB2IkcG10zkDUZ
         E3jlmzbmBbl2ysQe7QPHGQ1qivB+P34jJHjeqBTcXykHwqen6DTISHdiAwFhoqX5stlM
         1St3zA9ncQmE684ZvxdZIfGIDPIW0Cjt/ylbq1Mc2IGfkh41+Rhof141J4KBI5mf9nz2
         qPnVRmtEUxUllSNh5zdLjuVvuykxS6QLvI5y5Gyq3NYLalC5ZVUejjmzTq/XC0LQMyle
         89c9NZRXEUTv8G+viL0rkvE6dZsOwcnZBEdGPG09LRRNRh4DA7Gy7G8L0p6y9gxOxm6t
         Ae4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788354; x=1702393154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9KlrpjUUVLnd/EEjtL8m/ZwmwonL3mRNYsh9nF13Vo=;
        b=hNs4YC6lNYG5rYvD9UYwAj0nD3yCalVuDYWlOrtyqjjqUh7+OVyTOKU0+OzRa9RMhv
         uLYosql5fNFHtt/nUVOuQw/kaVadko7bUmUMnsxjt90r23m4bR4sGJ1HgzkmMOt/DlGG
         ADUKajONhoXl54I09nGPQBWGXcP56LMF1tO7v35j4JVE/hAMdLNuipUpciasEIgNJDkD
         NKvTnYnoP0hjbxMw3KA1RC4LkCEwEg6a3FUD2RIokxN9LDoxFLdycYiLlzLF7ZA1LNc4
         hMBjdwrVlePHFMasKKPTn9+qCi1+AZZLH9SKw22BZSzW5HCIWGS29cl38EfaVWLqorTU
         R+0g==
X-Gm-Message-State: AOJu0YwpjGaBZdBReo93E6SF7DFrFrcUuDBdEf1ADgTbJl6R/kIs31Ww
	So6829TepcZgBesTNiVX4h8RXaATJqHeWLovaftP
X-Google-Smtp-Source: AGHT+IHi7XVnVy70LEvG1GoHzuqIHMLykbSSgypfbxOWWUFK8Z4pPlUNMxj0CJ15+jiwBaHpal0Hag==
X-Received: by 2002:a05:6512:10c3:b0:50c:525:abd7 with SMTP id k3-20020a05651210c300b0050c0525abd7mr725734lfg.76.1701788354569;
        Tue, 05 Dec 2023 06:59:14 -0800 (PST)
Message-ID: <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com>
Date: Tue, 5 Dec 2023 15:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com> <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com> <ZW8zyXkUJDKVt-HX@macbook>
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
In-Reply-To: <ZW8zyXkUJDKVt-HX@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 15:29, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
>> On 04.12.2023 18:27, Roger Pau Monné wrote:
>>> On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
>>>> ..., at least as reasonably feasible without making a check hook
>>>> mandatory (in particular strict vs relaxed/zero-extend length checking
>>>> can't be done early this way).
>>>>
>>>> Note that only one of the two uses of hvm_load() is accompanied with
>>>> hvm_check(). The other directly consumes hvm_save() output, which ought
>>>> to be well-formed. This means that while input data related checks don't
>>>> need repeating in the "load" function when already done by the "check"
>>>> one (albeit assertions to this effect may be desirable), domain state
>>>> related checks (e.g. has_xyz(d)) will be required in both places.
>>>>
>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Do we really need all the copying involved in use of _hvm_read_entry()
>>>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
>>>> handle that way, but for strict loads all we gain is a reduced risk of
>>>> unaligned accesses (compared to simply pointing into h->data[]).
>>>
>>> See below, but I wonder whether the checks could be performed as part
>>> of hvm_load() without having to introduce a separate handler and loop
>>> over the context entries.
>>
>> Specifically not. State loading (in the longer run) would better not fail
>> once started. (Imo it should have been this way from the beginning.) Only
>> then will the vCPU still be in a predictable state even after a possible
>> error.
> 
> Looking at the callers, does such predictable state after failure
> matter?
> 
> One caller is an hypercall used by the toolstack at domain create,
> failing can just lead to the domain being destroyed.  The other caller
> is vm fork, which will also lead to the fork being destroyed if
> context loading fails.
> 
> Maybe I'm overlooking something.

You don't (I think), but existing callers necessarily have to behave the
way you describe. From an abstract perspective, though, failed state
loading would better allow a retry. And really I thought that when you
suggested to split checking from loading, you had exactly that in mind.

>>>> Would the hvm_sr_handlers[] better use array_access_nospec()?
>>>
>>> Maybe?  Given this is a domctl I do wonder whether a domain already
>>> having access to such interface won't have easier ways to leak data
>>> from Xen.  Maybe for a disaggregated setup.
>>
>> Hmm, now we're in the middle - Andrew effectively said "no need to".
> 
> I'm certainly not an expert on whether array_access_nospec() should be
> used, so if Andrew says no need, that's likely better advice.
> 
> Maybe the xsm check used in such desegregated setups would already
> stop speculation?

There's no XSM check anywhere near, and even if there was I don't see
how it would stop mis-speculation on those array accesses.

>>>> @@ -275,6 +281,78 @@ int hvm_save(struct domain *d, hvm_domai
>>>>      return 0;
>>>>  }
>>>>  
>>>> +int hvm_check(const struct domain *d, hvm_domain_context_t *h)
>>>> +{
>>>> +    const struct hvm_save_header *hdr;
>>>> +    int rc;
>>>> +
>>>> +    if ( d->is_dying )
>>>> +        return -EINVAL;
>>>> +
>>>> +    /* Get at the save header, which must be first. */
>>>> +    hdr = hvm_get_entry(HEADER, h);
>>>> +    if ( !hdr )
>>>> +        return -ENODATA;
>>>> +
>>>> +    rc = arch_hvm_check(d, hdr);
>>>> +    if ( rc )
>>>> +        return rc;
>>>> +
>>>> +    for ( ; ; )
>>>> +    {
>>>> +        const struct hvm_save_descriptor *desc;
>>>> +        hvm_check_handler handler;
>>>> +
>>>> +        if ( h->size - h->cur < sizeof(*desc) )
>>>> +        {
>>>> +            /* Run out of data */
>>>> +            printk(XENLOG_G_ERR
>>>> +                   "HVM restore %pd: save did not end with a null entry\n",
>>>> +                   d);
>>>> +            return -ENODATA;
>>>> +        }
>>>> +
>>>> +        /* Read the typecode of the next entry and check for the end-marker. */
>>>> +        desc = (const void *)&h->data[h->cur];
>>>> +        if ( desc->typecode == HVM_SAVE_CODE(END) )
>>>> +        {
>>>> +            /* Reset cursor for hvm_load(). */
>>>> +            h->cur = 0;
>>>> +            return 0;
>>>> +        }
>>>> +
>>>> +        /* Find the handler for this entry. */
>>>> +        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
>>>> +             !hvm_sr_handlers[desc->typecode].name ||
>>>> +             !hvm_sr_handlers[desc->typecode].load )
>>>> +        {
>>>> +            printk(XENLOG_G_ERR "HVM restore %pd: unknown entry typecode %u\n",
>>>> +                   d, desc->typecode);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        /* Check the entry. */
>>>> +        handler = hvm_sr_handlers[desc->typecode].check;
>>>> +        if ( !handler )
>>>> +        {
>>>> +            if ( desc->length > h->size - h->cur - sizeof(*desc) )
>>>> +                return -ENODATA;
>>>> +            h->cur += sizeof(*desc) + desc->length;
>>>> +        }
>>>> +        else if ( (rc = handler(d, h)) )
>>>> +        {
>>>> +            printk(XENLOG_G_ERR
>>>> +                   "HVM restore %pd: failed to check %s:%u rc %d\n",
>>>> +                   d, hvm_sr_handlers[desc->typecode].name, desc->instance, rc);
>>>> +            return rc;
>>>> +        }
>>>> +
>>>> +        process_pending_softirqs();
>>>
>>> Looking at this, won't it be better to call the check() hooks inside
>>> the hvm_load() function instead of duplicating the loop?
>>>
>>> I realize that you only perform the checks when the state is loaded
>>> from a domctl, but still seems quite a lot of code duplication for
>>> little benefit.
>>>
>>> hvm_load() could gain an extra parameter to select whether the input
>>> must be checked or not, and that would avoid having to iterate twice
>>> over the context.
>>
>> Well, see above.
>>
>>>> +    }
>>>> +
>>>> +    /* Not reached */
>>>
>>> ASSERT_UNREACHABLE() maybe?
>>
>> Hmm, I'd find it kind of odd to have such here. While hvm_load() doesn't
>> have such either, perhaps that's not a meaningful reference. Adding this
>> would make me fear introducing a Misra violation (adding dead code).
> 
> But isn't this the purpose of ASSERT_UNREACHABLE() exactly?  IOW:
> Misra will need an exception for all usage of ASSERT_UNREACHABLE()
> already.
> 
> I think ASSERT_UNREACHABLE() is much better than a Not reached
> comment: conveys the same information to readers of the code and has
> a run-time consequence on debug builds.

I see a difference between uses on paths were we assert that a certain
state cannot be reached (if all our logic is right) vs a case like the
one here where the compiler (or another tool) can actually prove that
the loop can't be exited the "normal" way.

Jan

