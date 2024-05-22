Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AD8CBAD4
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 07:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727212.1131626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9exB-00059H-SD; Wed, 22 May 2024 05:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727212.1131626; Wed, 22 May 2024 05:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9exB-00056z-Pb; Wed, 22 May 2024 05:55:57 +0000
Received: by outflank-mailman (input) for mailman id 727212;
 Wed, 22 May 2024 05:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9exA-00056r-D7
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 05:55:56 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3aacc1e-17ff-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 07:55:54 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57822392a0dso2111453a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 22:55:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17f37sm1718809566b.224.2024.05.21.22.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 22:55:53 -0700 (PDT)
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
X-Inumbo-ID: f3aacc1e-17ff-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716357354; x=1716962154; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LePKoXr0FLblhlhUauuhiDI0SW2kKNtKN3dtQv1Flfo=;
        b=BVjbZyUtDpJ9nnfYj2yQdMgG51swxb8HdqOHZGrwxB0ALKrubJW9NaykqWjVp8B5jL
         WCaVPzOFl6T7OIuZzYtZMiDNMIky/ixZvklavBmqAUkBwQpFBm5rIAXVLMgMpz9OfdpM
         WLDppAGj12xpzZhFvDQABcsG1t80bvgYiHaIKIkwi/cbCHjMjcDNlGvC8D8ZjZOdwRBu
         Ox92baWmlIdXIDFvTan3J/UYY9Z3h7p6SyxHGGeE3Gpb/u5WyysKzzLwvl2cnXxNP1zU
         07N1XlvT8DndRGOxLpVeuVCSws+CvmAGuhmOpT8Y5tS3oGBoni34N4qt/8V4lRe4/L/5
         zljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716357354; x=1716962154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LePKoXr0FLblhlhUauuhiDI0SW2kKNtKN3dtQv1Flfo=;
        b=JmMRMnCCfPp4lyt+fYA0zQ6nPQ0VxGw+VfSHfd2cT0esLglY27/P1Q7H3QxCs9yPHN
         VEy8bJiHqRZ/YGbwBeyH06Xo3EO1ykrzUqnKqTf2XfdgBQ5xiPJ0wIDH289VCd3d+3dR
         MTczdxurym9F2Slc3Z4HGddRY8P+B8kvCNdoEtmaOYFimN6Lao9NR5B4r/3BPI6luW8/
         wQXEz3f6xvevVjI29CJIiGoDpasN/nmgCtwo2HEfpEBj/Uh4CuWTtrrtlL15MQwVnBSG
         HHERHa/WBPiF2N/+mHDZ+OncJZG0XnJqiSID2eYKNPN7pcXqhEwsJKP63YSWwkFUYl1+
         lh9w==
X-Forwarded-Encrypted: i=1; AJvYcCWnzizW47wEpuIogNryTTqEyhg9STi0JkBE79uawOUomcnTrQ1nY+5U9Ro2QRGpG+HVgNJbhl/ZHyZd6VzUeIUQ1jwFPzvsJ1oCRwp3xV8=
X-Gm-Message-State: AOJu0YwNJ4S1mOn525vx8g5sEkLLqka3Bq2vDsGYTAIMI4NmmeDUOJfj
	tXHnd+W3GUGBSdy1tmpdLrgPcEtiQevxWGuRyTwQ7WRVeVdc2U8x1K/JzSujcA==
X-Google-Smtp-Source: AGHT+IEcx7Ep/6O5ryEQJBBnbjc5YGxzDB+UpytZQa/jmueNtrdtr8NSLOzRDrok5Fe7PNE1eDf5Hg==
X-Received: by 2002:a17:906:374e:b0:a59:ba2b:590e with SMTP id a640c23a62f3a-a62281cb3e8mr45481266b.48.1716357353843;
        Tue, 21 May 2024 22:55:53 -0700 (PDT)
Message-ID: <6115ebe4-0554-48b6-bf4f-8370e9a9f539@suse.com>
Date: Wed, 22 May 2024 07:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
 <245e535a-5b23-4d3e-83e5-dc797068652c@suse.com> <Zky-4C2WOTboJFLb@mail-itl>
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
In-Reply-To: <Zky-4C2WOTboJFLb@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2024 17:33, Marek Marczykowski-Górecki wrote:
> On Tue, May 21, 2024 at 05:16:58PM +0200, Jan Beulich wrote:
>> On 21.05.2024 04:54, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/arch/x86/include/asm/mm.h
>>> +++ b/xen/arch/x86/include/asm/mm.h
>>> @@ -522,9 +522,27 @@ extern struct rangeset *mmio_ro_ranges;
>>>  void memguard_guard_stack(void *p);
>>>  void memguard_unguard_stack(void *p);
>>>  
>>> +/*
>>> + * Add more precise r/o marking for a MMIO page. Range specified here
>>> + * will still be R/O, but the rest of the page (not marked as R/O via another
>>> + * call) will have writes passed through.
>>> + * The start address and the size must be aligned to SUBPAGE_MMIO_RO_ALIGN.
>>> + *
>>> + * This API cannot be used for overlapping ranges, nor for pages already added
>>> + * to mmio_ro_ranges separately.
>>> + *
>>> + * Return values:
>>> + *  - negative: error
>>> + *  - 0: success
>>> + */
>>> +#define SUBPAGE_MMIO_RO_ALIGN 8
>>
>> This isn't just alignment, but also (and perhaps more importantly) granularity.
>> I think the name wants to express this.
> 
> SUBPAGE_MMIO_RO_GRANULARITY? Sounds a bit long...

..._GRAN? ..._CHUNK? ..._UNIT? (Perhaps also want to have MMIO_RO_ first.)

>>> +static int __init subpage_mmio_ro_add_page(
>>> +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
>>> +{
>>> +    struct subpage_ro_range *entry = NULL, *iter;
>>> +    unsigned int i;
>>> +
>>> +    list_for_each_entry(iter, &subpage_ro_ranges, list)
>>> +    {
>>> +        if ( mfn_eq(iter->mfn, mfn) )
>>> +        {
>>> +            entry = iter;
>>> +            break;
>>> +        }
>>> +    }
>>> +    if ( !entry )
>>> +    {
>>> +        /* iter == NULL marks it was a newly allocated entry */
>>> +        iter = NULL;
>>> +        entry = xzalloc(struct subpage_ro_range);
>>> +        if ( !entry )
>>> +            return -ENOMEM;
>>> +        entry->mfn = mfn;
>>> +    }
>>> +
>>> +    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
>>> +    {
>>> +        int oldbit = __test_and_set_bit(i / SUBPAGE_MMIO_RO_ALIGN,
>>> +                                        entry->ro_qwords);
>>
>> Why int, not bool?
> 
> Because __test_and_set_bit returns int. But I can change to bool if you
> prefer.

test_bit() and the test-and set of functions should eventually all change
to be returning bool. One less use site to then also take care of.

Jan

