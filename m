Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A619B5E78
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 10:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827934.1242701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64hF-00051c-RU; Wed, 30 Oct 2024 09:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827934.1242701; Wed, 30 Oct 2024 09:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64hF-0004zh-Op; Wed, 30 Oct 2024 09:08:57 +0000
Received: by outflank-mailman (input) for mailman id 827934;
 Wed, 30 Oct 2024 09:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t64hE-0004zb-N4
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 09:08:56 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9464aa4d-969e-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 10:08:51 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a26a5d6bfso981087266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 02:08:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e7f33sm15080595e9.6.2024.10.30.02.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 02:08:50 -0700 (PDT)
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
X-Inumbo-ID: 9464aa4d-969e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk0NjRhYTRkLTk2OWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjc5MzMxLjI0MjkzNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730279330; x=1730884130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o5YlwcfciRF4BQkRbH5q08j6Jyig2HIRg3S1KpAmIP8=;
        b=VHoHI1n8mJVuvgXPGo2cDHX6IvtO6IgUym3Og5hGhQ4I1tzwfgTqHi7ChSejmbOIrW
         zvSElvWravSe8YyUJu148BF3+PgPKsvRHW9q8r0argxxhlbgshiHxuxfrww4sMIWcJ3b
         IpYktiTzYF3YgG/5dFCl3p1AklNC5xKAP7eGN9+IPZB4rTvuxvYJETKT7isZ09Ueu9Ax
         n9jzC0Z1C5LesqljY3H6RD9T+gfMsfkQ1C1LKoSyzxF3FzOkpZppecxzXPB9quyssEef
         MYjJGqAbADOr/q4o34GJDl456MiRS8nSZ+oDj32xUWorqUVYWGBUuCtYIYd3CC3wvLkm
         oYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730279330; x=1730884130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5YlwcfciRF4BQkRbH5q08j6Jyig2HIRg3S1KpAmIP8=;
        b=BCGdP8Z7MhIR02Pm721qDfeJuueCVWVDkclTPm1X/k0yQzHDStZTqlsmgTur6AaFUO
         TF6Phll0tpJSwo69rgWsSccjin9M02ONUclfLIyVCfdB/ETPnUupEeUWSyT2eSPryhZo
         6uwPSC6esqWGbHZFfq/8A8Qyo6GdM6UqeejuB7nAWsGZWOqUHLZHww5ix5HO+bRlayHI
         YPvbkraKc/A9q0gTUnAGBSvabEszX1rU/EJe6HGY1JAbJ4RWx8yELD3r4PQOwJc+wMxs
         4A1n5pFEfEIilbn1vvFaQInZut4Pg2vOxxF1z+ID31scWSWpkKgo2P4yP7MieRVUd+7s
         VLHA==
X-Forwarded-Encrypted: i=1; AJvYcCUi4rHnuqHANbiQW463qvgPK62+fnG/8ofjz8Tz+Za+nQv//CYruNdsCdYuIkCJmg+kx6G/IOeAyR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuVjA5UQUn4GQnhMghY9cPzRc3C/KZJOCZxsyAfFdvYnGGwVxS
	D8CLFWpPquoppvNLJ75RZz3B56FfVCBjFMZKAHawUow+16tNqYDdIf/QUCGawQ==
X-Google-Smtp-Source: AGHT+IEhbZH2RLRRtuQAWS3zb/obT0e8ew/cNcfqOCcmcXycyahTCqCZ3hbTGjkWZST/IPexqG22wg==
X-Received: by 2002:a17:907:2cc3:b0:a99:ee42:1f38 with SMTP id a640c23a62f3a-a9de5d91e44mr1374333866b.31.1730279330529;
        Wed, 30 Oct 2024 02:08:50 -0700 (PDT)
Message-ID: <e89ec737-9405-4969-aca8-9a89c19c9e4c@suse.com>
Date: Wed, 30 Oct 2024 10:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] xen/domctl: Refine grant_opts into grant_version
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
 <20241029181632.69600-2-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241029181632.69600-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 19:16, Alejandro Vallejo wrote:
> grant_opts is overoptimizing for space packing in a hypercall that
> doesn't warrant the effort. Tweak the ABI without breaking it in order
> to remove the bitfield by extending it to 8 bits.
> 
> Xen only supports little-endian systems, so the transformation from
> uint32_t to uint8_t followed by 3 octets worth of padding is not an ABI
> breakage.
> 
> No functional change
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/include/public/domctl.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

This isn't a complete patch, is it? I expect it'll break the build without
users of the field also adjusted.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -90,11 +90,18 @@ struct xen_domctl_createdomain {
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
>  
> -/* Grant version, use low 4 bits. */
> -#define XEN_DOMCTL_GRANT_version_mask    0xf
> -#define XEN_DOMCTL_GRANT_version(v)      ((v) & XEN_DOMCTL_GRANT_version_mask)
> +    /*
> +     * Maximum grant table version the domain can be configured with.
> +     *
> +     * Domains always start with v1 (if CONFIG_GRANT_TABLE) and can be bumped
> +     * to use up to `max_grant_version` via GNTTABOP_set_version.
> +     *
> +     * Must be zero iff !CONFIG_GRANT_TABLE.
> +     */
> +    uint8_t max_grant_version;
>  
> -    uint32_t grant_opts;
> +    /* Unused */
> +    uint8_t rsvd0[3];
>  
>  /*
>   * Enable altp2m mixed mode.

Just to mention it: I think while binary compatible, this is still on the edge
of needing an interface version bump. We may get away without as users of the
removed identifiers will still notice by way of observing build failures.

Jan

