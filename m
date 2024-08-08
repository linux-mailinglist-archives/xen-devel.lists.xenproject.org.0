Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FB794BDF8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774059.1184558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2cM-0005J2-JY; Thu, 08 Aug 2024 12:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774059.1184558; Thu, 08 Aug 2024 12:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2cM-0005HY-Gr; Thu, 08 Aug 2024 12:51:46 +0000
Received: by outflank-mailman (input) for mailman id 774059;
 Thu, 08 Aug 2024 12:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc2cK-0005HS-Hg
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:51:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6ab043f-5584-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 14:51:43 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so91871266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 05:51:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec8ddfsm739930966b.210.2024.08.08.05.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 05:51:42 -0700 (PDT)
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
X-Inumbo-ID: f6ab043f-5584-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723121503; x=1723726303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4etNt+XYZyYIyTNnvshoJKz3i1ju18tV/SxZxWvfW2A=;
        b=CNRtLWosA067wwW4NnvNRcVCUGjjHS1+jSw71Mi5rDv81vXMrBajsxTUo3fBuOXDMB
         WqtDvTlkYssnVA6YI/vRXe1xAesJWjsGkySgeC5lKcsWA4wlDiW482MvCJPzeXLE74K+
         CsaRcXYMBPWavOeC4wz9IgKI7I+gg8EzEtVn7hzvjsolW6XAR9vOVW2KFfcJSnjeguMa
         4j48jNW5M3bCRueapwFaLcKzuz/+nz+hPkJ/v72W/ZINjGPKKBgDlmmqWTSkGBfsP8oX
         0/NT5WibUNtSBj/Mxoi4ExJTDwmFKJ/ZFPiMoP5p4P7keib1zGN4UMAyERPQx/e+jE/y
         VVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723121503; x=1723726303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4etNt+XYZyYIyTNnvshoJKz3i1ju18tV/SxZxWvfW2A=;
        b=nRAAS+sWYq+wdO66jVb/qH3fsDm/VW0DA+jswhxIp6IYTNjcMh28F5mPC+LLoMnVbd
         0VVL3gSq0yobt++4bhjkGD9A+ru2mkn1/lFZiRjwyrZxrp8ZmlFCInQpJCDJuoNcqxSw
         1khuqLKKAG8i6KxfRinyoxBPXXp6gUZbnjqWHGE/AFshM4zsAEQmLPJPsQoTdoGXnBpk
         Y8CoBRjvCzXxzuRkHEXNWiKGei21rZ9h+YEzsr850Ovy9WR+W+feblFiZcpLg8vwUXF0
         JHEj+ElbYRQr6meo3X3B0vetagf/148iCipULH1rvHjLhIZGUtYH7Q+Kv8sJOsZqwpGn
         /DJA==
X-Gm-Message-State: AOJu0YynfsUfNhPOC2SG0o9S5rzBubyvXJUej9Lx6zMOFFMTcmVQaI9z
	fM161obK0jq2HoKhlo4GFFbCafxbLT2GTvmWp1uj+g/mTr7cXeyVlLKspPYvvg==
X-Google-Smtp-Source: AGHT+IFwhj/xJjO3kstTp4YM5nSflKGtgaKETGqxcOcCO6N0+XfIT/uKH+uoyV6DCrPf4AEZrtiNuw==
X-Received: by 2002:a17:907:7f17:b0:a7a:a2b7:93fe with SMTP id a640c23a62f3a-a8090e44042mr112946966b.47.1723121502888;
        Thu, 08 Aug 2024 05:51:42 -0700 (PDT)
Message-ID: <b4094b23-0762-429d-b067-f41e5d86481f@suse.com>
Date: Thu, 8 Aug 2024 14:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen: arm: Moved domain_page.c to MMU specific
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-4-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240808120936.3299937-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 14:09, Ayan Kumar Halder wrote:
> domain_page.c has been moved to mmu/domain_page.c. The reason
> being this file implements MMU specific logic for mapping,
> unmapping, etc domain page.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  xen/arch/arm/mmu/Makefile            | 1 +
>  xen/arch/arm/{ => mmu}/domain_page.c | 0
>  2 files changed, 1 insertion(+)
>  rename xen/arch/arm/{ => mmu}/domain_page.c (100%)
> 
> diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
> index 67475fcd80..2cb44b857d 100644
> --- a/xen/arch/arm/mmu/Makefile
> +++ b/xen/arch/arm/mmu/Makefile
> @@ -2,3 +2,4 @@ obj-y += p2m.o
>  obj-y += pt.o
>  obj-y += setup.o
>  obj-y += smpboot.o
> +obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o

Don't you then also need to remove the respective line from arm/Makefile?

Jan

