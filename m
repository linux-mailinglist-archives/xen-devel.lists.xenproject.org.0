Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC287C0BA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 16:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693345.1081303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknRE-0008G4-GH; Thu, 14 Mar 2024 15:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693345.1081303; Thu, 14 Mar 2024 15:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknRE-0008EC-Dc; Thu, 14 Mar 2024 15:56:12 +0000
Received: by outflank-mailman (input) for mailman id 693345;
 Thu, 14 Mar 2024 15:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rknRD-0007yo-18
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 15:56:11 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f995025-e21b-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 16:56:09 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a45ecef71deso128448766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 08:56:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cb4-20020a0564020b6400b005663b0d7243sm823552edb.83.2024.03.14.08.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:56:08 -0700 (PDT)
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
X-Inumbo-ID: 5f995025-e21b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710431769; x=1711036569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOCU3NWJniNyX6fc79VPzHP9+dGIk3tKzVJn2zsQ0i8=;
        b=clcmQ9RJejav5ZJv5blLPG0p6h//6h4OtyUStyMAukM6kbUzCqTskkkkzjBR7gP50B
         m2o7iI37OH1U/HwI7WBRJGBDQFGUGI6JlVGaRVtLOjRS8S8/tSrOy+fEVxfYPM4GBbKi
         gprqvP3oGcsTLPFGoLJGvw31XEePfXbyVNNtc0DDQbiuCIgfB7yq5zZrLbw8G+gobE9e
         jsWg/9zjugZh1ss9Rj9VanLvL+dsMAvwWrSx4KK44UvInS+T1sIDLtldouIs6ExyJSn/
         tV6dj9VLbW/g7cR6xq7Y0Q8R36rhZlI8yHKBtrsR7R+F+LmVAzHl/3JzdLXFCnPu/Hx6
         26Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431769; x=1711036569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOCU3NWJniNyX6fc79VPzHP9+dGIk3tKzVJn2zsQ0i8=;
        b=TM5AUcUqejwYnIgWyZw6fgntTKlsG4fxFOAXCXfn+2c7gADSLddu6GztsG9QOAIt7b
         oUmCud9u3ccFiFhQkuAWWpis9S1N3LR4fhSypNcU2PZNa0mb29/roilXbapNxX5YcRbP
         k+K19fbVfiFv7mhoFFmoiRvkX1yfMYwWWJOV466sJgWQZuSTpt5EjzXkaESgngeqQBB4
         uyBUOpLMAIEG1mk/mm60zbxkhxmlFxKy5nUOnF1+M4wFk9G7C2wcYcp8yzO9aVfqZ75V
         EyNiFBFLS6B64U2rw+B02jgcu4aJs91eQQLeI3A4PAfpBb+RzOOpQ2BIqkBBv2yIqgeJ
         mRsA==
X-Forwarded-Encrypted: i=1; AJvYcCUQvIqcAhGv8um2N2k8g/I4FzQGrFMXqJWCkPuBZHttsFfSEkm/XvtcHKCnRWMm20JqkRXoJLuBv8mM8/9XaKSZbkzKKuAbELbqC2uK4ms=
X-Gm-Message-State: AOJu0Yw9SSYrfRm57uFKVCbrxGRweXSBCJ0RPaQQ0jAPudhezIklzyEE
	tkKKufKCLmjh1JkQS+CuEXpPkkg9ALm7Y7mpY2QnX0Ja853dCDWu4BEeXI5T1w==
X-Google-Smtp-Source: AGHT+IGEVsvslfT7/SAY3eNFXwst+hLJ9kwNj20DOtZxPSMdt9GSFlKzceHurGUfYH24AgzQtqqfXQ==
X-Received: by 2002:a17:907:a801:b0:a45:ca21:7694 with SMTP id vo1-20020a170907a80100b00a45ca217694mr1850235ejc.10.1710431768736;
        Thu, 14 Mar 2024 08:56:08 -0700 (PDT)
Message-ID: <a103a8cd-33f6-44db-acc0-eb105d86b073@suse.com>
Date: Thu, 14 Mar 2024 16:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] xen/bitops: Implement ffs64() in common logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240313172716.2325427-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 18:27, Andrew Cooper wrote:
> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -47,6 +47,18 @@ static void test_ffs(void)
>      CHECK(ffsl, 1UL << (BITS_PER_LONG - 1), BITS_PER_LONG);
>      if ( BITS_PER_LONG > 32 )
>          CHECK(ffsl, 1UL << 32, 33);
> +
> +    /*
> +     * unsigned int ffs64(uint64_t)
> +     *
> +     * 32-bit builds of Xen have to split this into two adjacent operations,
> +     * so test all interesting bit positions.
> +     */
> +    CHECK(ffs64, 0, 0);
> +    CHECK(ffs64, 1, 1);
> +    CHECK(ffs64, (uint64_t)0x0000000080000000, 32);
> +    CHECK(ffs64, (uint64_t)0x0000000100000000, 33);
> +    CHECK(ffs64, (uint64_t)0x8000000000000000, 64);

I'm pretty sure Misra will want ULL suffixes on the last two and at least an UL
one on the middle of the lines. The casts aren't going to help (and could then
be dropped).

Jan

