Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C11AFB377
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 14:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035558.1407885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlCK-0000hu-QO; Mon, 07 Jul 2025 12:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035558.1407885; Mon, 07 Jul 2025 12:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlCK-0000gA-MO; Mon, 07 Jul 2025 12:43:52 +0000
Received: by outflank-mailman (input) for mailman id 1035558;
 Mon, 07 Jul 2025 12:43:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYlCJ-0000PO-7X
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 12:43:51 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081dd410-5b30-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 14:43:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-453647147c6so28591575e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 05:43:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31aaaf5ae08sm9589801a91.41.2025.07.07.05.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 05:43:48 -0700 (PDT)
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
X-Inumbo-ID: 081dd410-5b30-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751892230; x=1752497030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fqUYKynQ1h9t4XKdDQNkIklI62DvegkHafm20K+JbnA=;
        b=OaHEmJjtXHN0dFFSTsdqf7N+JI3pDy0lWGdm30v1Gq/lIg3jgFHb93fUV824jI8hDz
         2mhbamHvFn5lUnVuS0DRgicjyIfT6x8omXzQ0fOT3/bNAcMaNiRyKJVh80NTfduEseuJ
         /m+PikwOaTZJu1pLDa7AbGqOkMC9KuydpEf+6juo0RspSZMpFQT0jeNyDL9U686A7pdd
         aWDlsynHBbB/3fK9AgMnObwOXQYHvFWi3QqOl0H7iZpXiCBO+4tXahYHu2HSxOxq6H2T
         MvdbVEkLSW4+ohPPDmmIXowZ7XX+w9AzNh/W2KKHzpYp6ewUvo54EENMas2EnMpY3vZo
         pgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892230; x=1752497030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqUYKynQ1h9t4XKdDQNkIklI62DvegkHafm20K+JbnA=;
        b=JNWqdU+8ef5zrfhTKfzESN6m2zKuVdLoAIh409YmfZyoHdW7UiOFNJECwJ8VwOfGnf
         TsqCID6ugKtEWPN+z1IBC2zToMFQJYTDR7vyLbWRNaDh1iSp46EceZgh2Q6Ht9T6b92u
         oY5eZSV/iTMIeOjuJUIM5kDVc/s+6bEH4rygoprOzvGHGtTibkljcneW+VXCZB5tHX34
         Et2s8vWWhfHCpMJxetIOFlULjkDwm66dyRSI0hGcHKpCZJIlgpjzTLwhHdrjgr8Y5Xqz
         TWaqMBOmtfkQKfgvegvfxCYb6oPqHRhdKz3x89geXhiV1v2Oj5w+3Z892piabpvmRqaj
         pAEA==
X-Forwarded-Encrypted: i=1; AJvYcCUWPRsAdg1scQGuClXdCqgPfP9GefY5F0oZ17omqTsG+vdhSUSIMk/ZSuW9PWxQNJzFlrGPsD5gcC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUirrOW6kereek3oGXxMNKxmvoy0Ydc5F6/CgOjhG3n1JS4mKO
	WoAe3P/vTqKO/UdnT9fEmiUsZN6kL2s+k6dTlouP+kSGqCcBmlUuWZz6+Qyyy91rGw==
X-Gm-Gg: ASbGncsPEXFpAfZL2OS6V62LsXs2+HLD1eYV6Y2dT/Z7ex/zyttC8mg3q339Gn4xoKE
	e7bTuZU4kyiB1WlfJ46LyjdPvLthmgxLSqCJgCNgqmbpvVSjcsCUgXV23/7cFk7AkkesZQVgYBo
	vJZ5eXTIrO8epNwo3c5ZpS9Ubkc4ATnxayKB+i3A7S4marxvfKSXWs9SJZ9qI5EQNXZyrV4XVIG
	AdzY/Yncswa3NOKR0D/O8RiXz7pdlsVuXubxmV3kJVQQUMoYx6HJi6Cq1UxZyccdqTnKIvEKQ0A
	GJgGKEbiX+rgP+FWWcRoJB3yktLIsdNrdZtM/bEl4LaLgw35M2Rnv8mlQMqOD5DvesKxA0q1aey
	aOauGELhFgLGQKUYLQuNu1gebCagGW8QEtpqdHnjHnWKgY1rqfjlx6w4kaA==
X-Google-Smtp-Source: AGHT+IF9feJrbfRVI9sDoIXYLBDZVPb4SaE/gLmkZiIR3ez5iPg/7Vru9ceLwYVfb9e8zHf0K5vnJg==
X-Received: by 2002:a05:6000:2f8a:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b49aa74223mr6346299f8f.34.1751892229473;
        Mon, 07 Jul 2025 05:43:49 -0700 (PDT)
Message-ID: <014dcbdf-ffd5-4ed6-90fc-9d6a5c472fd8@suse.com>
Date: Mon, 7 Jul 2025 14:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] tools/xl: Add altp2m_count parameter
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <cover.1751397919.git.w1benny@gmail.com>
 <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
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
In-Reply-To: <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 21:54, Petr Beneš wrote:
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -421,6 +421,15 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          return -ERROR_INVAL;
>      }
>  
> +    if (b_info->altp2m_count == LIBXL_ALTP2M_COUNT_DEFAULT) {
> +        if ((libxl_defbool_val(b_info->u.hvm.altp2m) ||

Is it possible that this is what causes

Assertion failed: !libxl_defbool_is_default(db) (libxl.c: libxl_defbool_val: 337)

observable in CI? Unless we can get a fix pretty quickly, I expect at least two
of the three patches that were committed from this series will need reverting.

Jan

> +            b_info->altp2m != LIBXL_ALTP2M_MODE_DISABLED))
> +            /* Reflect the default legacy count */
> +            b_info->altp2m_count = 10;
> +        else
> +            b_info->altp2m_count = 0;
> +    }
> +
>      /* Assume that providing a bootloader user implies enabling restrict. */
>      libxl_defbool_setdefault(&b_info->bootloader_restrict,
>                               !!b_info->bootloader_user);

