Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6530962655
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784755.1194140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjHBm-0002UG-5k; Wed, 28 Aug 2024 11:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784755.1194140; Wed, 28 Aug 2024 11:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjHBm-0002Ra-39; Wed, 28 Aug 2024 11:50:14 +0000
Received: by outflank-mailman (input) for mailman id 784755;
 Wed, 28 Aug 2024 11:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjHBk-0002RU-P0
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:50:12 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad41b9be-6533-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 13:50:09 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f4f2868710so65947271fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 04:50:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2f53sm2161402a12.19.2024.08.28.04.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 04:50:08 -0700 (PDT)
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
X-Inumbo-ID: ad41b9be-6533-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724845809; x=1725450609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/4fXpOsfKB9LG9OCJy5yXlfw7MKLEuNLfonqWdlwlIg=;
        b=Eu/nZp5mCYbu2OrGCWOiZrrR7CWvZiM8CTDIvhDb6grzFqcty/ytOCE1ud/2zfrYwe
         E99lCKnA44SK2rZF16a7EQMDn7RiE1RlqLBihJulisbBsMMPxqTvz7pcu9wxGLVzOS6n
         fvGLsdax/U/ULVhKVtEJtJpPM80uSxXJDwoL2aDQUaYVULMRHVVw2OFzNaS3U6ZSPv1J
         IbhuJPwInoACkP43JXm4jnv2O3vIIwb2yG8YV4LC0U5PJLSI+ge2Rn4Fe5w8hHMxpu3P
         OpCA8w3DLQY4GPMxG8dwduoZTIbL7HBzDo88rxEHBKgyW98sEieupvj41i33oLaBeuMb
         A0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724845809; x=1725450609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4fXpOsfKB9LG9OCJy5yXlfw7MKLEuNLfonqWdlwlIg=;
        b=g/Icq6QZHLwUuMkUfunzoT1Ov0xMUlU+lqYSEqg1CY6kNJnaKbd6khPxdDJRQqSi2Q
         gn1x0j7C55otcQRHM1UHadVzQ2pjawtIyCu8rpuEvjCPeI4kKBlxFBgbF7gwhQs+Pahx
         fXzHvaSp+umTA+XcZW3XxAySmEp/KHNg+G/rpo0sjSHOI7HhG5uC0NW1tcqXLy1PDrtI
         ev2yG4umtULNFw0/pLF2QFwQlnIz0fdLNkJgrLiArF1ohiYThSeBx6zqsmyaxDmmir4g
         m8gU/uBhPh7ldNR44Bs7+1EVAQ72F/0C6s6rOohLpyM0je/IZBqIaKFRjhwFJu1uFeXv
         fguQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ921VN45WsGn9804F1uEcn4KnHwI59cH9JkiiWx6t4SkKWPJ5A0KJCoXKESmuehDdsmtPweZ32KY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvPh57Z2y4hxvM7cXIRiM/jUGBe1JResvJZ3zPbEFhYc5N6Vq7
	rg4euhrLXKZbbw0da5MVayGOOORQbwEtEQFxfI0smG9lhJD2USvtErNhHb9CGA==
X-Google-Smtp-Source: AGHT+IEkBWAHoLhOTd+Bp8LPszz/63ay02Pb8F//4nz0ZrWzdI0GvDeBVuEEu/Cr5GW4ZgP61WVCMw==
X-Received: by 2002:a2e:8812:0:b0:2f1:929b:aef6 with SMTP id 38308e7fff4ca-2f4f493f3a5mr99757811fa.36.1724845808959;
        Wed, 28 Aug 2024 04:50:08 -0700 (PDT)
Message-ID: <50658093-8463-4ee3-b308-31be2dd1fd42@suse.com>
Date: Wed, 28 Aug 2024 13:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] x86/dom0: disable SMAP for PV domain building only
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240828113044.35541-1-roger.pau@citrix.com>
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
In-Reply-To: <20240828113044.35541-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 13:30, Roger Pau Monne wrote:
> Move the logic that disables SMAP so it's only performed when building a PV
> dom0, PVH dom0 builder doesn't require disabling SMAP.
> 
> The fixes tag is to account for the wrong usage of cpu_has_smap in
> create_dom0(), it should instead have used
> boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
> only.
> 
> While there also make cr4_pv32_mask __ro_after_init.
> 
> Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> @@ -1051,6 +1051,34 @@ out:
>      return rc;
>  }
>  
> +int __init dom0_construct_pv(struct domain *d,
> +                             const module_t *image,
> +                             unsigned long image_headroom,
> +                             module_t *initrd,
> +                             const char *cmdline)
> +{
> +    int rc;
> +
> +    /*
> +     * Temporarily clear SMAP in CR4 to allow user-accesses in
> +     * construct_dom0().  This saves a large number of corner cases

... the final 's' dropped here and ...

> +     * interactions with copy_from_user().
> +     */
> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +    {
> +        cr4_pv32_mask &= ~X86_CR4_SMAP;
> +        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> +    }
> +    rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )

... blank lines added around the function call. Happy to adjust while
committing, so long as you agree.

Jan

