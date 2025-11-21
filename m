Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D1C77B61
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168210.1494280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLfv-0008H9-Mc; Fri, 21 Nov 2025 07:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168210.1494280; Fri, 21 Nov 2025 07:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLfv-0008F0-Ja; Fri, 21 Nov 2025 07:35:23 +0000
Received: by outflank-mailman (input) for mailman id 1168210;
 Fri, 21 Nov 2025 07:35:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vMLfu-0008Eu-5W
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:35:22 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fd1eaa9-c6ac-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 08:35:16 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b725ead5800so216306666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 23:35:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654ff3c6asm389626966b.52.2025.11.20.23.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 23:35:15 -0800 (PST)
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
X-Inumbo-ID: 9fd1eaa9-c6ac-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763710516; x=1764315316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SizfFWUoPSSHIUjbOQwiYKLCoQqMOtW9aRHbhhux/ko=;
        b=VnRGim3T8h4Fy/E1L25tuMCe+qVj4EVQDmvmENZI46p9V9rWZ05SfEVDgsfofJRJC6
         XNWc+xoTFpJpkCfGoLWh6Y997EeSBz4e8ns/eSucGGfumonFh7qN2gg6tw87VtlX8mQO
         UVNP2W6iHhLBh8tnKQ3Y6bqtQ1oMa3OzJby0djN2UeHh52HWSYcMP66T5d/nGV3iqe/7
         UlZr/5jycM7ah2vV2QQUmzjOuPVF3wt5OuM+W/zZiDfJ234M6+JG9JzN3QZDXXly/NyN
         e8tClS+IibACaqH3VoMgRuee7jqzlOCzVkBZ7i47dtTmzQoSNg0FH5c14jokVmBSt+cY
         Drcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763710516; x=1764315316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SizfFWUoPSSHIUjbOQwiYKLCoQqMOtW9aRHbhhux/ko=;
        b=pGZFW5IP4yeit8GCon561lxUqnvvsGbmqG/k6zKPf2iaRnY0wmho6SHehSy1LWnX3I
         pMappDr1to7etM8txsGI8Dm0EgFQWql1ubqrQ2Tmh67m9xYJ8Fv0g/8HteCLCBEaR4tY
         sMpqTJhWAblp53vdUSXT2fCdulmBs6eOHa4pec1F9woQgJQWYlrYgTZPjiLBWRcimM1u
         GTSThye/bOrgGrpLfYkuHYfJN3drrQOel/WnUiu1fH8wN2NAmL8JtrUZk6nXja1BTmPJ
         chmy4FxtVMORmpyEUGohESAdU/9TAD6+E5xo9N/zH/9DY3WNwAv8vTc7snQK7XUiaQUb
         IfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7ek7fXm0iPjmU5SSqRcI7ynmB2B7bFrfxEovSPavG9PsIK2aC9q2jqu4dHMPAEInh5vcC1+j7rWM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCZ8Ttx9z4f4mfjShcxAhSIFVMCHcVAMllbSvCG09B7Schnk91
	LQiSF43UqhBwoi1bapHqdcbk1BtC1D3OqfW8JFNVlTlxFKM29zivbF8a//UjRn4EqQ==
X-Gm-Gg: ASbGncvNO1klIvrsIBGV84p46o7v7slRLzWT39b6t4gYFf6m07CmM6sNZMN/FjzzV/K
	zYYMSe2jpg0w9cex3OvemlmdSC/q4cp5vHPMvrKP30/sZusNhcIUIvSL56PLYOihgnQSTwbtGAP
	oKugPY5VG+wx1TuXaCOHQZsd5aW6aSS3Ccc5B2lojhxjhl/A+HcJcar3sYlzlJbEiyPLz++cPI1
	teCvuUBZBNPlzjr1JlNUFRLSX7SspurHaSwykdxZAQUBpSG92hrnSXXy9C3UcQ7q9sY2v+CtHBL
	d+BYYwkYaj+XuYUOP7tkgWwougHaWxjsHEcw1QzN1nTI8jVznZmlCMGY0PvFIODkZ9rh65yeppx
	lwtaOPBiytVxpxnbz2n5zme9KhQOqu106+YdGb11F5dArHVtFz1Je6DLQxhCoj8JchmsiANsONH
	ZAX664eNJLFeyFSItiu73y9VTGPI/lAet9gIuz02hmHO0ZyOMYaES5U+bGwB2S22TY+VP9hWSsD
	A0=
X-Google-Smtp-Source: AGHT+IEN8YD+sRmuOWYzoYjMLM32lV4XQsOYJxn7FF9wwZSl+JKypw7Z+qyfmpmc7PSAkP/ecaF2qA==
X-Received: by 2002:a17:907:d93:b0:b73:806c:bab2 with SMTP id a640c23a62f3a-b76716d9e43mr109829966b.33.1763710516127;
        Thu, 20 Nov 2025 23:35:16 -0800 (PST)
Message-ID: <a1fc8b4b-735e-4f5d-a015-318b3e1f3550@suse.com>
Date: Fri, 21 Nov 2025 08:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 18/18] xen/riscv: introduce metadata table to store
 P2M type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
 <6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com>
 <5d4ec4d9-b4c1-4365-a343-f42b390da165@gmail.com>
 <6f431394-5c08-4974-85ae-4b38f1975289@suse.com>
 <e2cbb6b9-ab07-4aad-8eb8-f4dd859ac6f6@gmail.com>
 <b859d5c1-b602-4e61-b667-2701e0f31434@suse.com>
 <3f772780-75af-4d77-96c9-7eb7dc697ff8@gmail.com>
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
In-Reply-To: <3f772780-75af-4d77-96c9-7eb7dc697ff8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 17:52, Oleksii Kurochko wrote:
> 
> On 11/20/25 4:47 PM, Jan Beulich wrote:
>> On 20.11.2025 16:38, Oleksii Kurochko wrote:
>>> On 11/18/25 7:58 AM, Jan Beulich wrote:
>>>> On 17.11.2025 20:51, Oleksii Kurochko wrote:
>>>>> On 11/12/25 12:49 PM, Jan Beulich wrote:
>>>>>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>>>>>> +    if ( *md_pg )
>>>>>>> +        metadata = __map_domain_page(*md_pg);
>>>>>>> +
>>>>>>> +    if ( t < p2m_first_external )
>>>>>>> +    {
>>>>>>>             pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>>>     -    return rc;
>>>>>>> +        if ( metadata )
>>>>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>>>>> Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
>>>>>> p2m_alloc_page()'s clearing of the page won't have the intended effect?
>>>>> I think that, at least, at the moment we are always explicitly set p2m type and
>>>>> do not rely on that by default 0==p2m_invalid.
>>>> You don't, and ...
>>>>
>>>>> Just to be safe, I will add after "if ( metadata )" suggested
>>>>> BUILD_BUG_ON(p2m_invalid):
>>>>>           if ( metadata )
>>>>>               metadata[ctx->index].type = p2m_invalid;
>>>>>                   /*
>>>>>            * metadata.type is expected to be p2m_invalid (0) after the page is
>>>>>            * allocated and zero-initialized in p2m_alloc_page().
>>>>>            */
>>>>>           BUILD_BUG_ON(p2m_invalid);
>>>>> ...
>>>> ... this leaves me with the impression that you didn't read my reply correctly.
>>>> p2m_alloc_page() clear the page, thus_implicitly_ setting all entries to
>>>> p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
>>>> ftaod).
>>> I think I still don’t fully understand what the issue would be if|p2m_invalid| were
>>> ever equal to 1 instead of 0 in the context of a metadata page.
>>>
>>> Yes, if|p2m_invalid| were 1, there would be a problem if someone tried to read this
>>> metadata pagebefore it was assigned any type. They would find a value of 0, which
>>> corresponds to a valid type rather than to|p2m_invalid|, as one might expect.
>>> However, I’m not sure I currently see a scenario in which the metadata page would
>>> be read before being initialized.
>> Are you sure walks can only happen for GFNs that were set up? What you need to
>> do walks on is under guest control, after all.
> 
> If a GFN lies within the range[p2m->lowest_mapped_gfn, p2m->max_mapped_gfn], then
> |p2m_set_entry()| must already have been called for this GFN.

No. All you know from the pre-condition is that p2m_set_entry() was called for the
lowest and highest GFNs in that range.

Jan

> This means that either
> - a metadata page has been created and its entry filled with the appropriate type, or
> - no metadata page was needed and the type was stored directly in|pte->pte|
> 
> For a GFN outside the range(p2m->lowest_mapped_gfn, p2m->max_mapped_gfn),
> |p2m_get_entry()| will not even attempt a walk because of the boundary checks:
>      static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>                                 p2m_type_t *t,
>                                 unsigned int *page_order)
>      ...
>          if ( check_outside_boundary(p2m, gfn, p2m->lowest_mapped_gfn, true,
>                                      &level) )
>              goto out;
>      
>          if ( check_outside_boundary(p2m, gfn, p2m->max_mapped_gfn, false, &level) )
>              goto out;
> 
> If I am misunderstanding something and there are other cases where a walk can occur for
> GFNs that were never set up, then such GFNs would have neither an allocated metadata
> page nor a type stored in|pte->pte|, which looks like we are in trouble.
> 
> ~ Oleksii
> 


