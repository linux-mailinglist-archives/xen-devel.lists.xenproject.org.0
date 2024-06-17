Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C890AFC9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742305.1149080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCdp-0007FB-E6; Mon, 17 Jun 2024 13:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742305.1149080; Mon, 17 Jun 2024 13:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCdp-0007CF-BH; Mon, 17 Jun 2024 13:43:25 +0000
Received: by outflank-mailman (input) for mailman id 742305;
 Mon, 17 Jun 2024 13:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJCdn-0007By-S4
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:43:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9051e7a2-2caf-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 15:43:22 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57c7ec8f1fcso5100269a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 06:43:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e6c8sm6463910a12.77.2024.06.17.06.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:43:21 -0700 (PDT)
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
X-Inumbo-ID: 9051e7a2-2caf-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718631802; x=1719236602; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=APk91TXp5Ugv3ZDi4Fkr4LxFk9bAvdubbKJ1lckRAt4=;
        b=CCzrsXjtQABeew0tJwd8epPy+pYtOuwl3rzT0sFsOx42By5Mh2bRRm4DzzGram+nyt
         HJHIkxtQWWL3VsknWwTajZXoUo9F5sNXnRbDpRZ2tTJ6e4kSVhxRLmXuPDVhO1wsqrZF
         t5mpQDoon+YBFZijJ8b8TSmXAxKfFD0VhJv/AKMrd60C3vs1ItDyNtflsyraO6p1O/41
         sXEUcjQCyb3hHKlAuEBlDi0WGlZkygwmlO5JoaqfZKGDiox7ADEyuKgExo6k4yjqoSSi
         br0o5tu7wVSAK0PUSb9Z0uGfGiQMwnpADjDDPvNmOpkyYfJXMrkfvy8G5xeaarlZs6mL
         OJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631802; x=1719236602;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APk91TXp5Ugv3ZDi4Fkr4LxFk9bAvdubbKJ1lckRAt4=;
        b=SvUw9bHteMuxqJ/j9/if4YD3siSI423UuwbPERw7yZCD+pMQzJ9DYgl5NC2uC4Y49O
         lEhviPNk/r8ULnpLN2N2mLoeaUAHuxaM023YkldBhYUjObtOr6yxZ8PssbX2vUa11vEZ
         /Zslv2wOFz/Itd1sNlsEp5xkdzsunxuAoVkQgCXGWNFO9mcwNoXVex0YeAZijJn6Zfd9
         dnDEGrL2QBvGn3LbHt3sURCwr8kymhdxXvKloedJ6M47auYFvsJExUmEiYWp/JUukkS4
         pI7FqNDBwGy6bd/urmYobs+KmaNIofPd1FyLICJZpFvyPtJ3jZ8EPmb+CIR/5x0pNGpP
         hZAw==
X-Forwarded-Encrypted: i=1; AJvYcCV6o1SFV5/tlPLepikAVS0taIIZ6UJ6Pd035cTGIuk6pflESrS5/5G4KQLsbepQTKH0KhUFWhtuTURmvOeQRJm+cQRAP451OCRnCv8jRLs=
X-Gm-Message-State: AOJu0YwXXe8Wx4LU/lFKlNhdS1Rg2MVZeA4NGFZl2jDeBC/ddhSBjAEE
	6c/I/3kymQ6wU12iWL6mIWUNx8vwW+GAB/5/r4YQOi2sbhmFVTyoirHP33Ohu5VJ47lW61DDnGQ
	=
X-Google-Smtp-Source: AGHT+IGDT6FgU1fHBZu/3F+toBLz1JtLYQGomy3PSpECSQUUTJMxPHs+ZBmMyNrLpOhhhJMUu54eAA==
X-Received: by 2002:a50:9997:0:b0:57a:3273:e648 with SMTP id 4fb4d7f45d1cf-57cbd6767admr5570285a12.18.1718631801918;
        Mon, 17 Jun 2024 06:43:21 -0700 (PDT)
Message-ID: <af39bac8-bb0d-415b-8cb3-79f3d5369d9d@suse.com>
Date: Mon, 17 Jun 2024 15:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu/xen: Add Xen PV-IOMMU driver
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>
 <8b0151a8-2293-409a-8469-d9e73cf561a3@suse.com>
 <eceaa7e7-d07f-4a41-b39a-0b32be6724ae@vates.tech>
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
In-Reply-To: <eceaa7e7-d07f-4a41-b39a-0b32be6724ae@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.06.2024 15:36, Teddy Astie wrote:
> Le 13/06/2024 à 16:32, Jan Beulich a écrit :
>> On 13.06.2024 15:50, Teddy Astie wrote:
>>> @@ -214,6 +215,38 @@ struct xen_add_to_physmap_range {
>>>   };
>>>   DEFINE_GUEST_HANDLE_STRUCT(xen_add_to_physmap_range);
>>>   
>>> +/*
>>> + * With some legacy devices, certain guest-physical addresses cannot safely
>>> + * be used for other purposes, e.g. to map guest RAM.  This hypercall
>>> + * enumerates those regions so the toolstack can avoid using them.
>>> + */
>>> +#define XENMEM_reserved_device_memory_map   27
>>> +struct xen_reserved_device_memory {
>>> +    xen_pfn_t start_pfn;
>>> +    xen_ulong_t nr_pages;
>>> +};
>>> +DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory);
>>> +
>>> +struct xen_reserved_device_memory_map {
>>> +#define XENMEM_RDM_ALL 1 /* Request all regions (ignore dev union). */
>>> +    /* IN */
>>> +    uint32_t flags;
>>> +    /*
>>> +     * IN/OUT
>>> +     *
>>> +     * Gets set to the required number of entries when too low,
>>> +     * signaled by error code -ERANGE.
>>> +     */
>>> +    unsigned int nr_entries;
>>> +    /* OUT */
>>> +    GUEST_HANDLE(xen_reserved_device_memory) buffer;
>>> +    /* IN */
>>> +    union {
>>> +        struct physdev_pci_device pci;
>>> +    } dev;
>>> +};
>>> +DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory_map);
>>
>> This is a tools-only (i.e. unstable) sub-function in Xen; even the comment
>> at the top says "toolstack". It is therefore not suitable for use in a
>> kernel.
>>
> IMO this comment actually describes how the toolstack uses the 
> hypercall, but I don't think it is actually reserved for toolstack use.

Well, the canonical version of the header is quite explicit about this,
by having the definition in a __XEN__ || __XEN_TOOLS__ section.

> Or maybe we should allow the kernel to use this hypercall as well.

That's an option to consider.

Jan

