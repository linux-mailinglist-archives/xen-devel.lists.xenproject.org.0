Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68957AB4CAF
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 09:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982565.1368921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEk3D-00055r-JF; Tue, 13 May 2025 07:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982565.1368921; Tue, 13 May 2025 07:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEk3D-00054B-Gb; Tue, 13 May 2025 07:27:43 +0000
Received: by outflank-mailman (input) for mailman id 982565;
 Tue, 13 May 2025 07:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEk3C-000545-FJ
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 07:27:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0c2d5ee-2fcb-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 09:27:40 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad24b7e0331so359217966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 00:27:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21988d6bdsm729136366b.180.2025.05.13.00.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 00:27:40 -0700 (PDT)
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
X-Inumbo-ID: c0c2d5ee-2fcb-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747121260; x=1747726060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MSzCmzilu7/zkEIRhC3YM2VZUgiSq/7mSAbdIC4GE6Q=;
        b=bpiRHyGncA+PGF+5ZoioIvKAr8jhNCt1k8x9lMGiuS6quZ1k2sxkmKM7hCJ7kZYZtE
         by50VG0Myy890aWfMwf0JaYnGkKliQu9YTwhp/y3xhcIiS12W3xindsgbayr9UoNkgDI
         w/jP88kHLB4hu6pTDGssmSInqrjK4skDCXPh+JYIy5UXTfb1gE2Z3/6gF5JQRaL2EOyA
         Swmyv38YyBcIPvnK17rIuUBj+RxSzxBW2in7RgKeLxbsSAJbsrkMLtLFFgNbC5tJWqj6
         w3gLk4FbRQxUQh2sAp1swimuUdr6zFZtq96JqtV+wSpnQKplRxsZgLc16tSQU719ZFXJ
         x4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747121260; x=1747726060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSzCmzilu7/zkEIRhC3YM2VZUgiSq/7mSAbdIC4GE6Q=;
        b=kkbR9JR1L4J3EdM+dGMv5sNtM11MyGCrjDDc1dZ627e8E94kz0VWZ7ro66q7I3XuRC
         DtcYq2RZzmQiPtJYQpdMn/O6LeE9PqliHPHWA8qF5On8fXQSv3cB5nANvHrPI3OG3RfH
         ZNdROoZcOW57bpnNdMo6xcsaNh6XzRuKP/2oBax3Gd9PmLtTiRD3zh9fxnMg2pu5u5US
         x5lJLuXsLu71BTeNRMSeEw58OsXzSH+tSXvcJ4Aw+f1nW9ZCmDiPTswLbcxu3cGZO1Ki
         JytmW3wg+oSXYFIKJRRXJv2Rp+FM2yMfHVQKj0pKVq5t2LpOVEIFIuW+A3DQR2PgrslV
         Vfaw==
X-Forwarded-Encrypted: i=1; AJvYcCWm+OyeNhtFirB4Gf9N0fopuYdwY0sZ3ziK17uZm4SZjw8YN37GKF/wSKF4foeJJmhK2Fozz7dtBQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXTPS4n7RCF5J4/hZNx6vsQnKGepnZf/nnrCn8ZHQz21f8ivjc
	v7/QpGCNKDJhPbdhO9JI5ZrHoPmekeoucPtjMObk7rbgut76YRu0ZYqmX/zDdg==
X-Gm-Gg: ASbGncuom8tEjX2mH3QVPXUmhCgQYP7SgRRPwOq0gn8MXQY0M6/fvneytMhBbwZrXxi
	/RZCznAeZu8daWYY9oh9YJJ+tW1QUgW83UEEhuqvJx4s59YXhmPSswhcW1Dmj/iUZ7aXeNNNGzD
	17OTjNXQL7v3BTN1hZeE6/HhtQjnRsJhNVJhiKDkO5ZiDAZNEUopRQ7cZH5OR3RS/ABQg284l22
	SX21hgQCAdSsEHZZIjU7nxekkk5SG3QUn/sy4j223PMrDrRHe2MULi5dAR0X/2SVwt5MTHzw1tl
	u3OB9r+QO3nUI2y8HzAANlUu0xh49Kg6iIo/MsqQGfZuTODnRQFsoScKmZ0kYunAGAw3J+ECp9M
	ra5QoHmJB8ipYiTPpaVcn1Lq43u/qAzzm1/pI
X-Google-Smtp-Source: AGHT+IEFqvB1gs0Yf5YXXEYMeelmtixAOQOKGzBBiecrww3fZouJPsUqwuVuviRDPnXRRrb2L/vK/Q==
X-Received: by 2002:a17:907:7f21:b0:ac2:a50a:51ad with SMTP id a640c23a62f3a-ad218fc869emr1405766966b.14.1747121260322;
        Tue, 13 May 2025 00:27:40 -0700 (PDT)
Message-ID: <d7fae914-392c-4f5f-a769-194673515901@suse.com>
Date: Tue, 13 May 2025 09:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Only access legacy altp2m on HVM
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250512235409.18545-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250512235409.18545-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 01:54, Jason Andryuk wrote:
> Only access the HVM union b_info->u.hvm on HVM guests.  The union
> access is not guarded, so this reads and sets the default even on
> non-HVM guests.  Usually this doesn't matter as PV and PVH unions are
> smaller and zero-initialized, but the zero default will be re-written as
> a -1 boolean.  Generally, it it could incorrectly set b_info->altp2m
> through aliased data.
> 
> Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Change-Id: Ifaca3533dcce3f409c2efa292c7e96fba6371d9d
> ---
>  tools/libs/light/libxl_x86.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 0b1c2d3a96..b8f6663829 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -821,10 +821,12 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>       * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
>       * Otherwise set altp2m based on the field info->altp2m.
>       */
> -    libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
> -    if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
> -        libxl_defbool_val(b_info->u.hvm.altp2m))
> -        b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
> +    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
> +        libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
> +        if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
> +            libxl_defbool_val(b_info->u.hvm.altp2m))
> +            b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
> +    }

I think at least the latter half of the comment wants to move inside the
if() then.

Jan

