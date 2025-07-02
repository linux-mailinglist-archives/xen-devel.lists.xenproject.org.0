Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC3AF5B3F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:36:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031256.1405024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyZj-00064p-Tk; Wed, 02 Jul 2025 14:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031256.1405024; Wed, 02 Jul 2025 14:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyZj-00062f-Qz; Wed, 02 Jul 2025 14:36:39 +0000
Received: by outflank-mailman (input) for mailman id 1031256;
 Wed, 02 Jul 2025 14:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWyZi-00062Z-GC
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:36:38 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5136f69-5751-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:36:36 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso3848391f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:36:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bb7dsm131630905ad.90.2025.07.02.07.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:36:35 -0700 (PDT)
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
X-Inumbo-ID: f5136f69-5751-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751466996; x=1752071796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr4rqRw/YerH3cWx5Vt5IeNCIsuoej3nko3Q/bH1rfA=;
        b=dNKAZm7EOVAFQTSGyEjDn7uG995cApTbctgq9iZqoZBDuu+XK8sKR7f3lNX+wF6DNq
         9eL/ybT/17w0ulKahTuiPKCZ6qfVTQKXkeJZloeMeenhxgmFGk9sezGR23FHYPTqBbs+
         JxsYBORGevFNwtlcnCROZ2Hl8DTUrIzgeo7lLfP15FfI9hLRPnoProclR9z+CHGrwv/9
         rB0DP7g4p8jaDxDMskrO/Pqkj71pzxkTr0lDea+Ae/QYHdvRuaQMDnOVnTciLff8ZxP5
         6VI337gesOiNt/QvRF8XVjAbK/kBfL/GsHiOyQNnSVN2I43cdqQ3pNF8OffrXk5D4WNm
         7jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466996; x=1752071796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr4rqRw/YerH3cWx5Vt5IeNCIsuoej3nko3Q/bH1rfA=;
        b=lQXtgCOdIZX2KJBa3ikInTutrSQ+LPV+yKMkQw+ilRQH3cjq6bfaw0VyDJ/BPFSBa8
         bZqb+FnxeyPtLf4i4JdtlDWTlcl0Csb1GHOV2/bfqbpLD9hkiHPHPrkEkB75GHnjuqAS
         wZq2dLQNx9PFt/68bwddKS9+GUWxMr56Fb+tQ/WExo6F3rHfcDq/nA1A3r/svJBilVg9
         oGhF9cdLOK9WumXCsik6l0CwcQsTbcKk7xVcS8CGCNYDAomEGHq2k8XY7RgX+nmxeLJs
         NApZsyCQSnjDHb48PTTu0Tm2vxRVJ2pUo0+nWdVxPPy0feaB7IenQ2wmgEBZ2JDLwnXL
         IXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmLytgMuaJ32MIur218HWU2LaiEAHcmXYRG72kzLKabCf+gBouJmmcm6g5PWTwgWavyOM7UfWU/c0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzquy/20Rcqwhzq73sBNSrEf1nofezkIsHMaYQJVOVLbF3+pc04
	LVzq34+m1s3P5ffOKyC0YcP8uFgcEhcdiRQUTJtT5LGS7S/l4Y5RVdIlZu/KCQq44S6bv6jLhVZ
	06uk=
X-Gm-Gg: ASbGncsfYGXv31LZpolEuU6wMhKp94mzD3gXvQ3o+PU6pZjf6uAFcywPcGDy/+a5LYM
	c8xo76zgms/8OLRcOF8UcWWWfUI64feVyTjPLtf0bJXHx5+uQeW8Wdv1Lut/j7iq4iq1lF1Niy/
	az6eO9YHOnZO2klaidcelP2Kt+cq3jnXqR2ZkvNEsxCXmTe4jL7zXdkVPaxyvicAzZ/ViuBY/ec
	WEQqQeWE8lA7THwAkyTzApWM47Gs3JBfimhGW7D1Idbvzo5AsuYO+5wkig8WYCzBldpwEXhc1cO
	n87V+Blrlpp3EnmbFpgrSVxzaDMvYEc20SWDP9y+CZ+sqDaebWSEpn32f391harYIepFtTcZyLt
	Ie3pGMPDug83e/m7kr+MI8ozLDfE1yBf+m1QpDxXLdIggZjQ=
X-Google-Smtp-Source: AGHT+IEJgntLdHTJM8/cjbNgGtJ4gSWoe2YtyZE8WDTecykMAf+7D0OhjdqqmWw/uBSpuEx2+zXWtQ==
X-Received: by 2002:a05:6000:250c:b0:3a6:f2c1:5191 with SMTP id ffacd0b85a97d-3b1fdc2222emr2917304f8f.4.1751466995801;
        Wed, 02 Jul 2025 07:36:35 -0700 (PDT)
Message-ID: <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com>
Date: Wed, 2 Jul 2025 16:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> The file provides constants, structures and several helper functions for
> parsing SLRT.
> 
> The data described by the structures is passed to Xen by a bootloader
> which initiated DRTM.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>  xen/include/xen/slr-table.h | 276 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 276 insertions(+)
>  create mode 100644 xen/include/xen/slr-table.h

Btw, please don't forget to Cc maintainers of code you're changing / adding.

> +/*
> + * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
> + */
> +typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);

I keep wondering why this ...

> +/*
> + * DRTM Dynamic Launch Configuration
> + */
> +struct slr_entry_dl_info
> +{
> +    struct slr_entry_hdr hdr;
> +    uint64_t dce_size;
> +    uint64_t dce_base;
> +    uint64_t dlme_size;
> +    uint64_t dlme_base;
> +    uint64_t dlme_entry;
> +    struct slr_bl_context bl_context;
> +    uint64_t dl_handler;

... then isn't used right here, instead requiring a cast somewhere (presumably,
as code using this isn't visible in this patch).

> +} __packed;

I similarly keep wondering why there are all these packed attributes here, when
(afaics) all of the structures are defined in a way that any padding is explicit
anyway.

> +static inline const struct slr_entry_hdr *
> +slr_next_entry(const struct slr_table *table, const struct slr_entry_hdr *curr)
> +{
> +    const struct slr_entry_hdr *next = (void *)curr + curr->size;
> +
> +    if ( (void *)next + sizeof(*next) > slr_end_of_entries(table) )
> +        return NULL;
> +    if ( next->tag == SLR_ENTRY_END )
> +        return NULL;
> +    if ( (void *)next + next->size > slr_end_of_entries(table) )
> +        return NULL;
> +
> +    return next;
> +}
> +
> +static inline const struct slr_entry_hdr *
> +slr_next_entry_by_tag(const struct slr_table *table,
> +                      const struct slr_entry_hdr *entry,
> +                      uint16_t tag)
> +{
> +    if ( !entry ) /* Start from the beginning */
> +        entry = (void *)table + sizeof(*table);
> +
> +    for ( ; ; )
> +    {
> +        if ( entry->tag == tag )
> +            return entry;
> +
> +        entry = slr_next_entry(table, entry);
> +        if ( !entry )
> +            return NULL;
> +    }
> +
> +    return NULL;
> +}

For both of the functions, again: Please don't cast away const-ness.

Jan

