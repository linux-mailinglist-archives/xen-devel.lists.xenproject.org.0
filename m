Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC8B1099A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055830.1424152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuUt-0006LM-TX; Thu, 24 Jul 2025 11:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055830.1424152; Thu, 24 Jul 2025 11:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuUt-0006Jq-Om; Thu, 24 Jul 2025 11:52:27 +0000
Received: by outflank-mailman (input) for mailman id 1055830;
 Thu, 24 Jul 2025 11:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueuUr-0006Ji-M6
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:52:25 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a949acd8-6884-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 13:52:23 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so534088f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:52:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870532c3csm17924975e9.3.2025.07.24.04.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 04:52:22 -0700 (PDT)
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
X-Inumbo-ID: a949acd8-6884-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753357943; x=1753962743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nybYTSKXl8Je1A/It63m19+v/xzyhsbl55YgVGhQoMA=;
        b=T4qtse0/Dm3fnLbjNVchx0iBRlr+97ZMLwM2UCIJFd0pAgJ2Q7KRPdvKxOxDagcNCL
         He4iQDoICArERTH24ctZvb7mkBTUxdbPoqVqj9PK1TitXA7iHkd7e/oecsz4pDXmW20c
         GmN2pSfPmz7EL0bhSu2KQ97/BvOJk/zTNj/Ti5nHthX1SbBn9gzrdwnO84ImLV44+kID
         bFlZRzBgHq6FtcSeiARF5C2B2A/zyF57tXdK0fxY/7O3WnqtpTgP3FA3JzIZECSBTO8/
         1mOAzDUUBnpnYoPEMPlLnGSPxNO3nOZut1ipvbJYPY9n4UXhpHE7DdWiXOIjrkfaLG+G
         kWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753357943; x=1753962743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nybYTSKXl8Je1A/It63m19+v/xzyhsbl55YgVGhQoMA=;
        b=gCKnkkBhHuhzKNq2qTHhXbx4UHaPAR+5QUkExGX2rD16k55PKpKGn/Qya42yFxt/HU
         NzWI3qiZu4KOuv91CdkHY+6UjoPSTVLJ393BOoKrHBI2NngeXZTD8BwBBj9fUS3WEivY
         UUFDNa3Nix4SsIDbIftWCHhzVc1YZYLVCPuQCj5z52jvlzZ20HGz//DASkozmXsDmTRK
         JXPFKVSpRjRjocLUJVeIY3tWZILq8Lb0oYOH7eCoiIopKx7L36dtOyN6cO2k0N0ZdhuB
         f+AVzAza/sajrWpPmyt698hZLCkkz1iKTbWDodQb/T7ck/tEdXZNoSiLDCkam6WaMCNh
         m9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlc+rMWwYBZn+g+WiHA1WXgR7Vwsp7CkUbFLqBoKzUg94z+ARuBssy1kICV8ia7EtQwnM5mLKNpzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0ORDpxw/ScPgnSNe+CwwMSHu0s32SxsZnzILbuStHD1MQzEgd
	1WC3fFKHwXPJVVa+fPWCwRhnMcb180u4peZ1vHwobA3fdIthCK73XHIDtr1c9Qb9Lg==
X-Gm-Gg: ASbGnctrTKZYB05iGqMeAuObVsbwkf45FRrB0qpirRvnmKT6N/JRG9EnoLkpofQXLit
	0xV0fz6a1I4GVkw0pZpG8DXzewT6do6kVqmYxTO3BgZsyDuKji9ETOmTZvAwcnxC5UoSpMyK07i
	YDo8PhsfIQK6BkHiggzAA2TohV6u3Ws/mnjKHy/AaQS7x0ilF74eJhdoQgCgCl+HS/ph4ghRvTQ
	aVf8TAgJfnDSZNdgpgQIQn8BwB189xRfuAfNEo6zel4hL7O7WuSs0uRnzsuqyyCHBgL6UvLvsep
	Ae4zxKBiGqy1hfziqABGVJW62Gxcnn4xiP+HOLQL8I9bxIdO65Vg2V0YfINUQevp8/sS5A/NHx3
	nQbB2DLScjceb+wn5/sHGBcpMD63kSwhgc7pEkXwF6fP48rRmPad+6nBQEwoFLsyOs1VwSHbA18
	WunIXPOuA=
X-Google-Smtp-Source: AGHT+IE20wfza+zH+g7l8Frm/j/Z/kcXC1vD/8S4RJrF5dTjfB+5DD4UEnlyEpo9UcfrD+PwyKkJEg==
X-Received: by 2002:a05:6000:1ac6:b0:3b6:1d3:f7e2 with SMTP id ffacd0b85a97d-3b768c9e908mr4426104f8f.8.1753357942894;
        Thu, 24 Jul 2025 04:52:22 -0700 (PDT)
Message-ID: <a0892208-84c5-4cd6-b246-869e38ecf73c@suse.com>
Date: Thu, 24 Jul 2025 13:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domain: Dump domain paging pool sizes with the rest
 of the pageframe info
To: Aidan Allen <aidan.allen1@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bernhard Kaindl <Bernhard.Kaindl@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <CANgacT8YrH66iUEPr60AVytXYMivPzxC0SO4_RPohjk1Vo2w8Q@mail.gmail.com>
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
In-Reply-To: <CANgacT8YrH66iUEPr60AVytXYMivPzxC0SO4_RPohjk1Vo2w8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 13:40, Aidan Allen wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -253,6 +253,10 @@ void dump_pageframe_info(struct domain *d)
>                 page->count_info, page->u.inuse.type_info);
>      }
> 
> +    printk("    Domain paging pool: total: %d, free: %d, p2m: %d\n",
> +           d->arch.paging.total_pages, d->arch.paging.free_pages,
> +           d->arch.paging.p2m_pages);

Should this perhaps be gated, to avoid printing all zeroes for domains not
using an paging mode? Whether to use paging_mode_enabled() to do so I'm not
sure, as a domain with no paging mode enabled could still have a paging
pool configured.

Jan

