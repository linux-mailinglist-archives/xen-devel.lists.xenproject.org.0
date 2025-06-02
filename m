Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFACACA9F1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002839.1382230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzdg-0005wf-D6; Mon, 02 Jun 2025 07:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002839.1382230; Mon, 02 Jun 2025 07:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzdg-0005uc-9Z; Mon, 02 Jun 2025 07:31:20 +0000
Received: by outflank-mailman (input) for mailman id 1002839;
 Mon, 02 Jun 2025 07:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uLzde-0005uU-GY
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:31:18 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b02b86a-3f83-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 09:31:05 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so762011f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 00:31:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafa34sm7220962b3a.103.2025.06.02.00.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 00:31:04 -0700 (PDT)
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
X-Inumbo-ID: 8b02b86a-3f83-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748849465; x=1749454265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr0W4d9Z7GhDmdsc2sW5D6VLyrwB0V2fU8lbKoKoQUw=;
        b=ALn+YBUnmGhbfoJLnLAjQZu2s6hB7uNBZMO3iC/7hIDFwFa1PuQdUH0IQEza6w7M1r
         2LGsZZQkOqEUfOHbOeZLoTTVAXIFEaJBXsSd1zoWADsURTKbwQu0Gh8IeDSJ9dJ7FOQf
         KaPxxKoeHoz2D/E+zlZkExROENnvarCn24FU3qrJ4d89xIiDxZ1P1cJZ0iaRKSLNOWhc
         +LKG8AO/9eCOuKPob3Kjv4plDwjNWY7oorL/yN0O66XFTlwoCfLeNFvjPyOv9m/XaZpC
         Ijj9/wwMPwqiJ+kry2SM2K1CaACnGUyYWEY+b+LUp9YBvcMeFlNfA/quyg1KDy80gN3w
         vBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849465; x=1749454265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr0W4d9Z7GhDmdsc2sW5D6VLyrwB0V2fU8lbKoKoQUw=;
        b=Mc9Dhl8pf6MeNGgAf6bf8RnQe8znWH8QcEYqiJcomNbpiGrpvuQwehcmqHgb4cuVB3
         KEi38OVNpVZx85ylxjTtIooUX3dMhhMV9ZOVIA0s3gw5jbGkNsjVfd+spBXpHEf3yBpv
         ANLJdOJO0U3TTVi5PpqqcQ+vq91vxsdYl4RGL7hNLiH5p8RINsZv6Dh6d/YR9kFRRmU2
         +P2hO1vZvedA4qBH384vFE8pAvSFI5z/Dg0fW4oOupTszN21hVWlqieSK/gaJ0CHe0Nd
         /h+9wLJlMADR7iMWWruJXLM71WTacRJqanayOUHXnG3k1NoSiMgKN8kPGuKPOZSK8PAw
         RFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRQOUzw7ZA0BAug7CZlZfrTWGUugbwJ7127FFUtZd+Movpw2EZqpoa5vJ+rc3I/5VN21ynMQRKhLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJkXybXOppu6TykQkq9tNTCJ1popctFxFou4fMQF/KEc4B3Bco
	GdnbZIlLwoBu0ma9jp+A/QhnORRpx9fN+G7sj9s4nZUCJJlb4pQszhxFYcSujMYt+w==
X-Gm-Gg: ASbGnctYCbxOW2wGNOJciCyPeVV9OfobIxNpD4ZdUjCdE9InF3L4aU2XkwPOiJYFvYr
	MPASll/7sFBjVbU9jWoFyLziVWb+FgHFnbYMEZzkhKJqmYyfn01FEghOKLX9ErBVoDki+X2l/Wn
	DVvrYBFP4LsnjM7CspTeYGLaKXkzaU15xBN3cpwjptdm67s/eACskgiFdnASFeV0/6V1hgIsaem
	GvzZRylls7jBohWEgOPowr9vYcBlZ3ucW/olYEleJQart8/u98MZLf8iANJG9BqqNabyTKDG1Uq
	4veiU/4QvcLcErseTo4tCdy7Oex57IqM5hw+RauGNtJIeoO0sSKbE1lk3OfvGnqLfrcncZUGEzX
	2Oxyu1Ao9eZRs5fhLE7zUxWYPzPnK1j4IfR/n
X-Google-Smtp-Source: AGHT+IGqLImJUHq14zafjBMpIwNYTLdYQPzO6D2+lNiq0zbBU72tBlNz8fbGL1lf8k6mI676RmXLiQ==
X-Received: by 2002:a05:6000:4013:b0:3a4:edf6:566b with SMTP id ffacd0b85a97d-3a4fe160d10mr4902997f8f.6.1748849464867;
        Mon, 02 Jun 2025 00:31:04 -0700 (PDT)
Message-ID: <8521480a-f14d-4ac4-826e-6ed066619070@suse.com>
Date: Mon, 2 Jun 2025 09:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cdd7b9ff21c81683ce2245bc2b5e0a7a87e51e3c.1747155790.git.sergii.dmytruk@3mdeb.com>
 <4896ab0b-f45e-43e9-bcee-f5496717eb2a@suse.com> <aDD0ZYM-PtV7NKVc@MjU3Nj>
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
In-Reply-To: <aDD0ZYM-PtV7NKVc@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2025 00:19, Sergii Dmytruk wrote:
> On Wed, May 21, 2025 at 05:45:04PM +0200, Jan Beulich wrote:
>>> +/*
>>> + *  Copyright (c) 2025 Apertus Solutions, LLC
>>> + *  Copyright (c) 2025 Oracle and/or its affiliates.
>>> + *  Copyright (c) 2025 3mdeb Sp. z o.o
>>
>> I'm curious: Considering the (just) 2 S-o-b, where's the 3rd copyright
>> line coming from?
> 
> I'll add "Daniel P. Smith" (already in CC), not sure why his S-o-B
> wasn't there.

Just to mention it: Be careful there; aiui you can't simply add someone else's
S-o-b without their agreement.

>>> +#define UEFI_SLR_TABLE_GUID \
>>> +    { 0x877a9b2aU, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }
>>
>> I'm not sure this is a good place to put UEFI GUIDs. Considering e.g ...
> 
> It's here because the GUID is related more to SLRT than to EFI.  I can
> move it if there is a more fitting place for table GUIDs.

It'll (at least somewhat) depend on where it's going to be used. A common problem
when definitions / declarations are introduced without any use.

>>> +/*
>>> + * Primary SLR Table Header
>>> + */
>>> +struct slr_table
>>> +{
>>> +    uint32_t magic;
>>> +    uint16_t revision;
>>> +    uint16_t architecture;
>>> +    uint32_t size;
>>> +    uint32_t max_size;
>>> +    /* entries[] */
>>> +} __packed;
>>
>> If x86-specific, the question on the need for some of the __packed arises
>> again.
> 
> The table is used to communicate data from pre-DRTM world to DRTM-world
> and is produced and consumed by unrelated software components that don't
> necessarily pad structures the same way by default.

How do other environments matter when this header is solely used by Xen?

>>> +/*
>>> + * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
>>> + */
>>> +typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);
>>
>> It being an internal header, ...
>>> +    uint64_t dl_handler;
>>
>> ... why can't this type be used here then? This would presumably avoid a
>> typecast later.
> 
> It's not an internal header in my understanding of the phrase, Xen
> parses what a bootloader has passed to it.  In principle, pointers could
> be 32-bit here.

"Internal" as opposed to "public", i.e. what's exposed to guests.

Jan

