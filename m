Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2842B1DAD5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 17:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073215.1436125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2ZQ-0002C7-HR; Thu, 07 Aug 2025 15:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073215.1436125; Thu, 07 Aug 2025 15:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2ZQ-0002AQ-Dz; Thu, 07 Aug 2025 15:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1073215;
 Thu, 07 Aug 2025 15:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uk2ZP-0002AK-8F
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 15:30:19 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ea50eb-73a3-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 17:30:14 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af95ecfbd5bso215330666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 08:30:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af96bc4fb0dsm744720866b.112.2025.08.07.08.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 08:30:13 -0700 (PDT)
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
X-Inumbo-ID: 69ea50eb-73a3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754580614; x=1755185414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oX7zJNSglFlShZAkmD9jfV8HWgXHlPPuKXa58RsdfN4=;
        b=UzCzcmcAUTH87Ulun8h+QAhY09Bfdu8gCks2i8xT5J6fjtg47EX+VbYExqTeJFvQ9c
         qZHlo7ohKY5di12nh3jSzKD6szBZVP5+v4CRP/G1fQBZxPUZpGpo7LWpy9SVKHvLQj/5
         vr/HccA752y7rfacpPdCgsAV3kxY6LLt8T3KZPCiwZIRohxia39n4eVubJtGEUwCfauM
         yF+BtjHIYLSaEVn/Inu0wSmCu4Blva5y9YfAcrff+FBrUH9LsPpj4ekSwdaKIwG3UV5H
         niKBBVOyDspUOqRiMISPyohCUulz9fDojKG2PV8tVxbCgFiIxtKqG6dZCPMVazrSLGtu
         veKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754580614; x=1755185414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oX7zJNSglFlShZAkmD9jfV8HWgXHlPPuKXa58RsdfN4=;
        b=IjpEvwYgVCpMjj/9NvylXj3PLpo2B9Ycz+j174Z8zVwJkRFphxowJtI9tjG3FBvZBa
         FCqhRS7CGx9eiQ93HPrBe9aFOXPHKWPsc5oq10MV3nLopao3kkwYPGHurb8r36P9wXqy
         XxIYjWrnh4BHIbkTj+Zx2SnwG43jRLbH2+vX0VWcaZV2uKctlixMrmpegC3SUEGijMR+
         R1JQaOZIoRDY5dNKPOLxNNzX5rdgQWExgRaakZM/hIr7WqdG3wg5PGwLju95bqPRHXIZ
         15/PlkqplNwcRawUqtYxZJjAHZEVGi11QOgn9kXXhmo+KeMya6eaZmxsZV82hfaEBfm5
         plEg==
X-Forwarded-Encrypted: i=1; AJvYcCVkERhj6ZCoe8eZSQ8lgdVECaG6Rjb7rI3jkQ6P2G1EkSBkIh0FlYcI/V24vgPyrJEEv5NLewW+8SI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzwr1NHkcPDKy0DfQo40cboOL/UgkVNIhrTnUc4ewEg9IBtPc6b
	ttXi0T54Aq1MmIA/UyU8RZDd0DF835X/XHU2cPIZ3CzTrEHwtzcbF99mf8uisqkWVQ==
X-Gm-Gg: ASbGncuHz+0XaxRLN4sB2qJni+5GEZw2XRgFBUeEg64JUlkCBpyfAeZbwNNVTaRaDq3
	nuiI4roxYEiLHGuEFKW5vmhVACrShRPwn1AkoeX81Prtz0BZhvrROlvHj07ZleIXaIdiSK96xND
	stN5g0N/7lbqjrjydOH0/chbwSLS/fI6XY7TB/plRUyajKJ2kWJYjcXlkyPP8uJJFN2JGxIXm6w
	WDLwcek6Y55AB6/pvTTgv4rJNRmAzqkHyX/kqkwiYWfv4g060M60zx0+Vf43oNL/UumQ8TTKBe+
	UsMsAEyrtPuhxHWsXebLyvOi5jobUXbGKDjZM49yHg4KMIG7U/mfrEpRECO9sn84T7e+RaInDlA
	tlXzMwG6I41/ZP1wWx5IhArhOFM7wtjMegzyXoh/7+NP3RN0f8hvrUK+xJEj+xILdXjqZhCLYbY
	sz6pu6CAA=
X-Google-Smtp-Source: AGHT+IE5v9wPcfGEbBvJOmKEJbeMPrqPy/q0EZrroHWcIFviUCpKBzW8ijmucZYUC/IoZVOJifwlBw==
X-Received: by 2002:a17:907:7b9d:b0:af9:34de:e4a1 with SMTP id a640c23a62f3a-af9902e4aacmr706788766b.33.1754580613633;
        Thu, 07 Aug 2025 08:30:13 -0700 (PDT)
Message-ID: <d81b41c9-59e1-4807-af27-9d952d35ba42@suse.com>
Date: Thu, 7 Aug 2025 17:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
 <3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com>
 <d160c6da-a4a8-44ca-9dc5-b1e3cb31bde5@gmail.com>
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
In-Reply-To: <d160c6da-a4a8-44ca-9dc5-b1e3cb31bde5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 14:00, Oleksii Kurochko wrote:
> On 8/5/25 12:37 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> +    /*
>>> +     * Return back nr_root_pages to assure the root table memory is also
>>> +     * accounted against the P2M pool of the domain.
>>> +     */
>>> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
>>> +        return -ENOMEM;
>>> +
>>> +    page = p2m_allocate_root(d);
>>> +    if ( !page )
>>> +        return -ENOMEM;
>> Hmm, and the pool is then left shrunk by 4 pages?
> 
> Yes until they are used for root table it shouldn't be in p2m pool (freelist),
> when root table will be freed then it makes sense to return them back.
> Am I missing something?

I'm commenting specifically on the error path here.

> Probably, you meant that it is needed to update p2m->pages?

That (I think) I commented on elsewhere, yes.

Jan

