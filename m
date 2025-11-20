Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD44C7519E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 16:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167616.1493889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6sX-000101-U1; Thu, 20 Nov 2025 15:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167616.1493889; Thu, 20 Nov 2025 15:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6sX-0000yG-RF; Thu, 20 Nov 2025 15:47:25 +0000
Received: by outflank-mailman (input) for mailman id 1167616;
 Thu, 20 Nov 2025 15:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM6sX-0000yA-3n
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 15:47:25 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 326ed53b-c628-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 16:47:19 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64166a57f3bso1624724a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 07:47:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d56a70sm234763166b.22.2025.11.20.07.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 07:47:18 -0800 (PST)
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
X-Inumbo-ID: 326ed53b-c628-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763653639; x=1764258439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=scMljv+rHG3lTXnc01UIm/PkoYUr6nYZyfEEPjK3hBE=;
        b=GMOT/C3pFx0hlLgFdN7oEFQQW05kt4T7kXFBgp4n1dQq+mSZ1IoIvmwl6/z3PMpwcq
         fwhCGxTpkLgv8k8qEeYb2Clg0mJ4ZqEZZhbIg9RUrS0YaRs6378SVsJZA/UxRyuHIj9I
         EAfhE7fQlfu+hgR3XiTDJJOFanhD60nbsUMJESABpN6hUXepnQ2w1mY97qKv2ZCY/WrH
         3dtgeOazfY87LF+PkM5MELYPaKvGJu9383pFMGubLsr9Ek6DsdLegYMugaZ4VCV4ofb6
         g5De8i7TDx/IhR1WpFZKEVrj2sX9D+v5pxA+k9DbQeZ9aY0hp+C+xFC9Na0CGD3Opi4C
         4dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653639; x=1764258439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scMljv+rHG3lTXnc01UIm/PkoYUr6nYZyfEEPjK3hBE=;
        b=q7ToyFApvrNz2hPUJspphFXpQGNY+yht5tcIK4VO199x0F1jxFHjduD77TwyXbrsEO
         /CDL9XnJlTCpkBlpX+UEZ0a6TEORIZItFUgr242kkQ7/Smr+NKnJWegf9kOjY9DVtnwE
         1YgLUFgKlzo8cY9eBOrvFQKyRG4OC6lzRcIb/c/I2yUvfYCFVFngpwLBe03O1oWl2ngv
         NOTJhsxR8QObGnt06/bm5zdQ8SfRpvTjEjnpRREH7C7jn58FhhB7BYGwLNZlqQdvuY2b
         V0oX6xwu+SE+xBa6aExNn53T4MOldPiVPsqTtY2FZoniVc9qig+YsoGPsPcBBMXuJcWR
         PU7A==
X-Forwarded-Encrypted: i=1; AJvYcCUIufKikIV9nI3olGwnVUHTxPRACmrX94dIPlCUIVrb6pwb9e881XREmC1dGc6EZlFwRznOoRyp5mI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoviLN+ptXrhXOh+EJvyfot7wiJvLgVIGEoCnprEpHn3hNVyy7
	kdtuAul9YhTkoeaCT/zcBruocs5mdEp8SnqW5tIsFr3D/Ay4UyRcTl46WhcwqC4vMQ==
X-Gm-Gg: ASbGncteAIXlxtqJNSJnmkqKd8gZfE0S1P0hVe8+qdoOsZcBk3tk7exBfX8RB+ZkGaU
	kkvy2DJyUxESA8WttetPYbV7mNUxe6ChWGQy5gvAjEkCz6eVrmE+jJeKYKZ5RK0fny3n6wAibi5
	ozncPioD3vtSJPKcCEtHTOnMcHwHWigfBHr+mxZ3e87bJMM8utv3s5Z22wMGi3L4HSBlYsKXwpU
	1YFm0rz7GNGxuBSBV3h3SWrmIFI1TW8mP2o2nd8uVWf4uUTRmJoZS2sn+q82qgL8g1VXi9eFRDv
	1dpWHoqRkgTerTvhKkQktxaaXg8o5FgtzSeA50D8Hsw0KXdyuwQTRfbGXoD0C+M2DRh1KPoxITE
	PGr5w3QCryfEdwfvV4ACnSIAOQWMHbarleLT3mwThiACpVj+LL9b202Bold5O9lHlLjUrCm29Nn
	D0O+OJDpyLr1tqgW5ihqgLH3rt4g5WrBo8gyJRnJNDK7jsI+VR7sB2BOqlpoALebREj97OopRKJ
	xA=
X-Google-Smtp-Source: AGHT+IFu6xsPQxnnmYbw6DdWh3zv8tISqpRT8LkP0xsJafPYd9Z9SyItorNxEgoovdUAn3RxGJSHYg==
X-Received: by 2002:a17:907:7f08:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b7654d8d1f2mr391513666b.3.1763653638527;
        Thu, 20 Nov 2025 07:47:18 -0800 (PST)
Message-ID: <b859d5c1-b602-4e61-b667-2701e0f31434@suse.com>
Date: Thu, 20 Nov 2025 16:47:16 +0100
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
In-Reply-To: <e2cbb6b9-ab07-4aad-8eb8-f4dd859ac6f6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 16:38, Oleksii Kurochko wrote:
> On 11/18/25 7:58 AM, Jan Beulich wrote:
>> On 17.11.2025 20:51, Oleksii Kurochko wrote:
>>> On 11/12/25 12:49 PM, Jan Beulich wrote:
>>>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>>>> +    if ( *md_pg )
>>>>> +        metadata = __map_domain_page(*md_pg);
>>>>> +
>>>>> +    if ( t < p2m_first_external )
>>>>> +    {
>>>>>            pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>    -    return rc;
>>>>> +        if ( metadata )
>>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>>> Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
>>>> p2m_alloc_page()'s clearing of the page won't have the intended effect?
>>> I think that, at least, at the moment we are always explicitly set p2m type and
>>> do not rely on that by default 0==p2m_invalid.
>> You don't, and ...
>>
>>> Just to be safe, I will add after "if ( metadata )" suggested
>>> BUILD_BUG_ON(p2m_invalid):
>>>          if ( metadata )
>>>              metadata[ctx->index].type = p2m_invalid;
>>>                  /*
>>>           * metadata.type is expected to be p2m_invalid (0) after the page is
>>>           * allocated and zero-initialized in p2m_alloc_page().
>>>           */
>>>          BUILD_BUG_ON(p2m_invalid);
>>> ...
>> ... this leaves me with the impression that you didn't read my reply correctly.
>> p2m_alloc_page() clear the page, thus _implicitly_ setting all entries to
>> p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
>> ftaod).
> 
> I think I still don’t fully understand what the issue would be if|p2m_invalid| were
> ever equal to 1 instead of 0 in the context of a metadata page.
> 
> Yes, if|p2m_invalid| were 1, there would be a problem if someone tried to read this
> metadata pagebefore it was assigned any type. They would find a value of 0, which
> corresponds to a valid type rather than to|p2m_invalid|, as one might expect.
> However, I’m not sure I currently see a scenario in which the metadata page would
> be read before being initialized.

Are you sure walks can only happen for GFNs that were set up? What you need to
do walks on is under guest control, after all.

> But just to be safe when such case will occur I am okay with putting
> BUILD_BUG_ON(p2m_invalid) before p2m_alloc_page() in p2m_set_type() function.

Thanks.

>>>>> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
>>>>> +
>>>>> +/*
>>>>> + * Free page table's page and metadata page linked to page table's page.
>>>>> + */
>>>>> +static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
>>>>> +{
>>>>> +    if ( tbl_pg->v.md.pg )
>>>>> +        p2m_free_page(p2m, tbl_pg->v.md.pg);
>>>> To play safe, maybe better also clear tbl_pg->v.md.pg?
>>> I thought it would be enough to clear it during allocation in p2m_alloc_page(),
>>> since I'm not sure it is critical if md.pg data were somehow leaked and read.
>>> But to be safer, we can add this here:
>>>     clear_and_clean_page(tbl_pg->v.md.pg, p2m->clean_dcache);
>> I didn't say clear what tbl_pg->v.md.pg points to, though. I suggested to clear
>> the struct field itself.
> 
> Won't be enough just tbl_pg->v.md.pg = NULL; ?

Exactly that, yes.

Jan

