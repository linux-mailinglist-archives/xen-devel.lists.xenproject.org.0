Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE38CB2258
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 08:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182528.1505395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEHb-0003Zz-GX; Wed, 10 Dec 2025 07:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182528.1505395; Wed, 10 Dec 2025 07:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEHb-0003X2-DV; Wed, 10 Dec 2025 07:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1182528;
 Wed, 10 Dec 2025 07:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTEHZ-0003Ww-CH
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 07:06:41 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c57c3514-d596-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 08:06:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso5304535e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 23:06:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d35904sm27747065e9.9.2025.12.09.23.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:06:37 -0800 (PST)
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
X-Inumbo-ID: c57c3514-d596-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765350398; x=1765955198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n2rUepR2JxU7xCMZFVHhVI8Kb+gjIUPdxVT6PD7ILq0=;
        b=OfSCtbJ4bp9VbvRK9S1F48L75oGlicfq5xwGJB7xjjf5DIid1WgdP7PG5PCrplyNfS
         876Xpa6uVW292hXmEajw/RLJU6oex/LNe04MHrm4P7JNFkB2oZLR5uAKAjwwr9wbJuQ3
         SpKfne8u1VzHKI1Uwb+o6oRGJtipjMSfW36FQy8GTObZpREz1qWERjiS6S6QNRHIVRz1
         utGd9LfvVAX3tHu1ibL8cEVIRf5DcvRMCCCDUYUd9uP3TT9P+Oqf3yU60tzr282tb82m
         dHHTOKdOSQcs5gRTYG0KLR5vl71ox2kl3RF6FDPQXYRJJWKkhEUnWULi+BDz0wtUeTh1
         QMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350398; x=1765955198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2rUepR2JxU7xCMZFVHhVI8Kb+gjIUPdxVT6PD7ILq0=;
        b=MARmZBs0lHzSe+NETb7u3fbaz5RYtpYpmka1zWaNbTLmlpZFMo+GCPEF5orgfIVYO0
         qXh36fzfir9I9QijBVQI6tScXKRqAErdofT8u+MSRPgqiFfVtgUTzUnu9MEUXxWIxWX3
         06ZZ49Vq5nSxzz0GklGSJswmhGj3zQFPhwZoGL7PPrtCEl1eJPgd0qjpQARZgwPZH8hL
         UhyR4gNBKINUNz+MHRPLYLOSypUz0sf687tktmwNatmcsT87mQoNOc6sTla1J5sLTQt/
         /QcuOAdWPBxHoyfeWiAMewuR4jP6dabDUS3UzQhplHlkodoMb+3HUxNl772TbB++jOxU
         Ogdg==
X-Forwarded-Encrypted: i=1; AJvYcCW3+aV3zADYn13RaXgMH9YcFtAYMUfzNnJHUh8Cvl3OuIn1u9pdZVKh2nHUd9Un8gqittGsJq/pQuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWAKp7e/mQmSHuzHVSYnR3AUv4QH2T5Cnj9+fIUdWPldJouLRA
	vrACTQUJH39WRPVxdnrOlvvwAxpUdCnyX+m6IAEQXUh0MVeNw3Y/pmju+nvjgsJzDA==
X-Gm-Gg: ASbGncvBJDs/HKyJUhyUL5or+XCI00QCxr1mtWihtWR90A3W6nqVchkSdaNr8OICsjQ
	/kM2s6ayz24sMOs7g4ucsePy5EBK9624YfwLgs7+46/9Wz9RzOjcS7id59j6e3XeSUTI/hu0yWk
	dBqtWOuTHioxuHHN6oIPwQvY/HioSUL1DXF5pwgmXzovCXmwTGbW3rSFbO24ptZSJxqsKIY13Ww
	GkprqCgg8C15+GQRks88vsxAaTbC9oGxFCvPoLRY0+4paRP0NL39bMRlM2SSeFZoZsz7nVeeVVQ
	Id6S1DmLhN1pEEDs52b7NA4yr47Wd7so6SMOsO0bUQoGTX5DWSHtsRgLEqjRnHYDtSfUXVTXm6X
	5hzguTa6sOG3Z3ilqmU8f8oacCTRNX9g3O0Urtq4KKmU2fpbqoX7kSM6XZrc9TOpR5DSZqg2YyC
	KKa60ZMIg5G9avVbLjlNdOtwJXtMrGzGs5D0i+M7dyeLcMawuRCn5DdMe+wLUhaAaUPbz6FN+xM
	Xc=
X-Google-Smtp-Source: AGHT+IGxFctI4wpLHGz6N/DNGti/3WQih3A+sHOk7lbFxOPreLppRdmE7qW9jwlOn8cZhfn8KcjSyw==
X-Received: by 2002:a05:600c:3147:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47a838ca7famr10472495e9.3.1765350397900;
        Tue, 09 Dec 2025 23:06:37 -0800 (PST)
Message-ID: <621089a4-d946-46ce-a3cf-4d0938d4a39a@suse.com>
Date: Wed, 10 Dec 2025 08:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/19] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <2c41da84b3e7fb0f6e6c3c856bff6edaf9e1d505.1763986955.git.oleksii.kurochko@gmail.com>
 <889df78f-7196-4b44-9558-fb83f432e18a@suse.com>
 <36be69fb-9362-43a4-8308-1e62be60d27f@gmail.com>
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
In-Reply-To: <36be69fb-9362-43a4-8308-1e62be60d27f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 18:09, Oleksii Kurochko wrote:
> On 12/9/25 2:47 PM, Jan Beulich wrote:
>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>> +            *md_pg = p2m_alloc_page(p2m);
>>> +            if ( !*md_pg )
>>> +            {
>>> +                printk("%pd: can't allocate metadata page\n", p2m->domain);
>>> +                domain_crash(p2m->domain);
>>> +
>>> +                return;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    if ( *md_pg )
>>> +        metadata = __map_domain_page(*md_pg);
>>> +
>>> +    if ( t >= p2m_first_external )
>>> +    {
>>> +        metadata[ctx->index].type = t;
>>> +
>>> +        t = p2m_ext_storage;
>>> +    }
>>> +    else if ( metadata )
>>> +        metadata[ctx->index].type = p2m_invalid;
>>> +
>>> +    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>> +
>>> +    unmap_domain_page(metadata);
>>>   }
>> Just to mention (towards future work): Once a metadata page goes back to be
>> entirely zero-filled, it could as well be hooked off and returned to the pool.
>> Not doing so may mean detaining an unused page indefinitely.
> 
> Won’t that already happen when p2m_free_table() is called?

Well, that's when both page table and metadata table are freed. But what if a
leaf page table is moving back to holding all p2m_ram_rw mappings? Then the
metadata page is unused, but will remain allocated.

Jan

