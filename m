Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAEDBC8F63
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140546.1475399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pTE-00065r-TB; Thu, 09 Oct 2025 12:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140546.1475399; Thu, 09 Oct 2025 12:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pTE-00063b-Q6; Thu, 09 Oct 2025 12:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1140546;
 Thu, 09 Oct 2025 12:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6pTD-0005xr-4C
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:10:07 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e471c28f-a508-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 14:10:06 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e4ad36541so9843335e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 05:10:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d4caa4sm82405685e9.12.2025.10.09.05.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:10:05 -0700 (PDT)
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
X-Inumbo-ID: e471c28f-a508-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760011805; x=1760616605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BTyPoVhOlecL5F0GEeDUlRjaCSfL2lX6QJCafF7dvLA=;
        b=GCMP6xNGhyGpX8+vS8rgCc9PePM9alu87n7zs6WCriNLfHqqp2y7eQnL5zinhKdtEp
         DLqdANyMEaSXtznJJThPMbMWOF7oTDEv5b6SbdRQVjbeq7OibckFqsQrZCgLMTd1bDZE
         N1zEAEAJZsfB7lAsVgqNnceB0R+qCoSrcMjsF0N1hb3OVHfCt24LI16HauBaGLf9nj/D
         iFNJWN+atqzaqrycocY7DHerUXcF4SoZZhVtkieYLblqVoVSKYSH0RD/SnmJ/+iKYIk4
         V7nIHsnnae/FJyDNfljtUiXDSuCG7eV0YVUMH0dGgHAC/yUyAJgwE3e85i/hy6Q6uIvH
         5XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760011805; x=1760616605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTyPoVhOlecL5F0GEeDUlRjaCSfL2lX6QJCafF7dvLA=;
        b=m80Ll0R6Hm0t4eSnCeTkT9QFBIo/daznQQYc+pNOse/zLyLDEMkBlE2h57LMc8QddV
         N0+1+fCsZFgUPgx8k73AIYjxtf4q77SS1PHzfUODbMd7r/mi30xQacJ3FuLeHoY3GtYG
         bWwZ8DfgqbQeRyaPCTYhobDY3EF6cCQ0BMH7yYuB22EpU2q0U4wsEGG4jvsGGcafhL3V
         2U07ryf3OBh0r1tNAfTRCHFld4CZlrIq84HHzjZQucwjw7U1hLy6lyEsuUDmqWyPgrtA
         1To5GWHAyl6vE95Vyrzoo+hu0IPht5NICbr23+xpVP4PjroJooJoGf+cY9gKJXgoRjku
         HA8A==
X-Forwarded-Encrypted: i=1; AJvYcCVRG6C7wpAslngXnK4Lsw6KYh1bP1nnCaD/YtBhX26zWXlMCRtkH4w28aqROCb7DQmfDWec3KvqIUE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy70StceArzwHSbIr3h2NMdOGRG9mT+rQs7+SdZavo87vJD0P43
	pa9/Pn89fPVlN9rmx3hNzaYollP5rI/qZT4ypLnLfyNw//pWw1iMmXbw+fQ62hghWA==
X-Gm-Gg: ASbGncvZ7aXvF/8ihPAu3rPqB4ugMWigvsjnssd+bi4/Gn9uK0gpDz6igW/k6lISaXE
	00SeAMqgH+QoKCCOk/ndupzZJXSAAR+XZXIlidYUq+4Y2Q9EEpREdFQfEnJG6N6dxkz5RiaBJjo
	GKJ+5/Z5dNIzjK1rGX3OxcKN9XO1+IXi4M4P3lH8aULFZ3158pVDigAA2cUDNBlUEcXDUPIwQS6
	Y3tTRg1cEExMkxMPzmeANp2bVrLLJ4vn5HzFSkH25d/cAA8+LKxQxm/N7LaWT96PZEuG0y68EgX
	QVocwBowvi0G0d6QmLmfEMPsALftRbGErNz2IqsVc2+YzPDsA/y/VdPTNvd2wyhFAcTFR0NhclI
	9fOXraZPZmu6w3QUNDVQGDp7z5z1FlUeJeTQi+X8UT1I7Da4Y/n2kYkir/C8N0W6wUla37gsAVg
	deVjB7SzfmQ5XFDzM1t+d1FCxCuS2lSRs=
X-Google-Smtp-Source: AGHT+IH0bc3ZiBvMxkow6bsZZGu2FSKqFT0EfFlWgViqdSQtcoBqu8kVQnN8ipRNMhJRXOcPkEFH2A==
X-Received: by 2002:a05:600c:8206:b0:46c:d476:52f3 with SMTP id 5b1f17b1804b1-46fa9b021abmr49935745e9.26.1760011805485;
        Thu, 09 Oct 2025 05:10:05 -0700 (PDT)
Message-ID: <fb6debfa-cdc2-491c-a488-6a4bf64ca7ad@suse.com>
Date: Thu, 9 Oct 2025 14:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
 <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>
 <5142b7c4-ab2e-4f73-a60d-3d23fe255ca7@gmail.com>
 <4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com>
 <e875ffa9-28c5-4733-b079-babad3734a9c@gmail.com>
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
In-Reply-To: <e875ffa9-28c5-4733-b079-babad3734a9c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2025 13:34, Oleksii Kurochko wrote:
> On 10/7/25 3:25 PM, Jan Beulich wrote:
>> On 01.10.2025 18:00, Oleksii Kurochko wrote:
>>> On 9/23/25 12:41 AM, Jan Beulich wrote:
>>>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>>>> +    if ( *md_pg )
>>>>> +        metadata = __map_domain_page(*md_pg);
>> Not this conditional assignment for ...
>>
>>>>> +    if ( t < p2m_first_external )
>>>>> +    {
>>>>>            pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>    
>>>>> -    return rc;
>>>>> +        if ( metadata )
>>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>>>> +    }
>>>>> +    else
>>>>> +    {
>>>>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>>>>> +
>>>>> +        metadata[ctx->index].pte = t;
>>>> Afaict metadata can still be NULL when you get here.
>>> It shouldn't be, because when this line is executed, the metadata page already
>>> exists or was allocated at the start of p2m_set_type().
>> ... this reply of yours. And the condition there can be false, in case you
>> took the domain_crash() path.
> 
> Oh, right, for some reason, I thought we didn’t return from|domain_crash()|.
> I’m curious whether calling|domain_crash()| might break something, as some useful
> data could be freed and negatively affect the internals of|map_regions_p2mt()|.
> 
> It might make more sense to use|panic()| here instead.
> Do you have any thoughts or suggestions on this?

domain_crash() is generally preferable over crashing the system as a whole.
I don't follow what negative effects you're alluding to. Did you look at
what domain_crash() does? It doesn't start tearing down the domain, that'll
still need invoking from the toolstack. A crashed domain will stay around
with all its resources allocated.

Jan

