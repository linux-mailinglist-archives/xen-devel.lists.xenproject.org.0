Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9A9965AF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814084.1227178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTBN-0007Fo-3J; Wed, 09 Oct 2024 09:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814084.1227178; Wed, 09 Oct 2024 09:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTBN-0007Di-0W; Wed, 09 Oct 2024 09:40:37 +0000
Received: by outflank-mailman (input) for mailman id 814084;
 Wed, 09 Oct 2024 09:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syTBM-0007Dc-Ea
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:40:36 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 883b2f9a-8622-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 11:40:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a993f6916daso554096466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:40:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993ac07465sm578142166b.20.2024.10.09.02.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 02:40:33 -0700 (PDT)
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
X-Inumbo-ID: 883b2f9a-8622-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728466834; x=1729071634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9akUImjw16tW3P4YhJvyW1Odrtupc/9I8xqG0RfqpzY=;
        b=flcfjcTMquksjycbMr2Sxk1yZ79eneFuVJ9kv9Ug2h2VIeNQR0R602/s7v0rNQxokv
         /GCx/2v5RmTqC0nrfyHHj10rrR3riB8vbmQZxuxdZZgeL/NPMeVaG/cTSERxyrDyfirg
         Wqx8J8/YbuyVmc6es3SOxWwuGz4f9K5x473PmXVvdhU8B9KMPgc5ZcrGTtFRWkRQlnb+
         oH9xL4UZ+mFj8yVPoimLVV4tsMCVgP9uns8CoSSECZ0rIV/ac8HvX14YZeCpwGkw9Aue
         t3htmvge/ycqLswAIkJRdG1VwE9hoV06K8gcUOn6WZ3aMaT54PPGEpCn6fHwa+08Agqb
         TrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728466834; x=1729071634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9akUImjw16tW3P4YhJvyW1Odrtupc/9I8xqG0RfqpzY=;
        b=tNKYJ1IkwgimDkmUMFvpyQzUyIH/sVDD9AyV0PUsB5Me5mUwgyDlbyOlpagEhRJShd
         9SGI5NGc208+EajKvVO1gAdJ2X/LDFECGbMc3E6iLpqXRDzZyChZfNdO0mrZaMkKsRAC
         xMWIdjjbAYQ53VpQiR8fkS12Ui1hVcj0zG8Oh742jOWp+9nEJn0fN+kZa+AUqwCqQlO7
         8f9RgBt583gmfKr/rCzx6NseQJi3QouSJqQJ/N56c6AZIty4dB3tzYyGkPPas/sQ01Ua
         YbRqDygPFg44J9iy+SP52TO69tbWGJBSD47yx7HPph3ZyVafwz/xGoi9g8TnOM2yWRWG
         OqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzrZeyF1wxcua7EoBmEZKkDuILO41rFGG+qWck8tfQ0tRSSnvOkxWv6OTwcj+gnrFxzbSsTVCPUcE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYvMi///wecuNk7Vjvr5lXc6926Nh4jHL1Afw5m5hI52cuHOm2
	BSDc5jvld8sKkXIvYJQuDiPxZGwBEa1dklg7Ahb/kcNwGlefiDhxhbqBvOVWMw==
X-Google-Smtp-Source: AGHT+IEbxTZPsZ2hCvB8WH3DejLIktB+l1NcyfFi4YKFLznu8XDwY+X6+YznM/gxOh+GRpAvfJVcGA==
X-Received: by 2002:a17:907:d2e5:b0:a99:53f5:3f33 with SMTP id a640c23a62f3a-a998d21a5a6mr156197966b.33.1728466833922;
        Wed, 09 Oct 2024 02:40:33 -0700 (PDT)
Message-ID: <1a57c4c9-baa9-44b4-8a3f-0f821d8c2484@suse.com>
Date: Wed, 9 Oct 2024 11:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] lib/x86: Relax checks about policy compatibility
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-2-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:37, Alejandro Vallejo wrote:
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -15,7 +15,16 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>  #define FAIL_MSR(m) \
>      do { e.msr = (m); goto out; } while ( 0 )
>  
> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
> +    /*
> +     * Old AMD hardware doesn't expose topology information in leaf 0xb. We
> +     * want to emulate that leaf with credible information because it must be
> +     * present on systems in which we emulate the x2APIC.
> +     *
> +     * For that reason, allow the max basic guest leaf to be larger than the
> +     * hosts' up until 0xb.
> +     */
> +    if ( guest->basic.max_leaf > 0xb &&
> +         guest->basic.max_leaf > host->basic.max_leaf )
>          FAIL_CPUID(0, NA);
>  
>      if ( guest->feat.max_subleaf > host->feat.max_subleaf )

I'm concerned by this in multiple ways:

1) It's pretty ad hoc, and hence doesn't make clear how to deal with similar
situations in the future.

2) Why would we permit going up to leaf 0xb when x2APIC is off in the respective
leaf?

3) We similarly force a higher extended leaf in order to accommodate the LFENCE-
is-dispatch-serializing bit. Yet there's no similar extra logic there in the
function here.

4) While there the guest vs host check won't matter, the situation with AMX and
AVX10 leaves imo still wants considering here right away. IOW (taken together
with at least 3) above) I think we need to first settle on a model for
collectively all max (sub)leaf handling. That in particular needs to properly
spell out who's responsible for what (tool stack vs Xen).

Jan

