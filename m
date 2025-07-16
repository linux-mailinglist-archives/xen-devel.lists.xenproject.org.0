Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B515B07917
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045334.1415435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3jl-0004A5-H8; Wed, 16 Jul 2025 15:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045334.1415435; Wed, 16 Jul 2025 15:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3jl-000480-E9; Wed, 16 Jul 2025 15:08:01 +0000
Received: by outflank-mailman (input) for mailman id 1045334;
 Wed, 16 Jul 2025 15:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc3jj-00047u-Md
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:07:59 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87e75b6-6256-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 17:07:58 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so4381399f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:07:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4332b0csm126214005ad.149.2025.07.16.08.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:07:55 -0700 (PDT)
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
X-Inumbo-ID: a87e75b6-6256-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752678478; x=1753283278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wgEgxUvZyNZg/sREte1FikBKNJ3iR34od06sTy8q+HE=;
        b=cVnV2ChmbwUPmxT8u0X6gDFqX6VT27ytHYS+qFKNKR4kmXSjijlTfuJCEOmSELw98z
         ii99RTTCJhzD+H+XgWT5QL3kcjj+qcEjrJrAvOT1QKBN8PcEx9rM7L7qvaeveCWMPHI7
         GdzQzTDEYs063KDW5m6+RYvUbcOOoe2JvjxNsUB4PF/hD5G/1xhrgS5yw0ov7eu+6TN4
         uGUgTsaAgXDzZnbFwRAadssIBnQXRwY+tozWZRBzbn6XXLUOfBtLQqFqmVoTeb4LJyIs
         UyBsucCTByFiFJLmu4pW+aqfW0EtC4JKkDNopen8N4ZMIWg0UlTOCJvhUmw/EZQgkoDu
         u+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678478; x=1753283278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgEgxUvZyNZg/sREte1FikBKNJ3iR34od06sTy8q+HE=;
        b=t0kcUfLmGBBb9/WU5us20tA9TyZCKiUvTu8C1HNW++hy0+Ozk4S3ZFHEwSsblYBdBo
         gQ//1d+ebI42rz0NbzDDUYQUMa/PN4Tmz0tG2d/flyurgzvz5I72jbE9hxxoFGJYzHPc
         OGenOZphoN/Ung0EeG+TLmPg9LPa+Xa0/zPZRAaQXnFLVlbuhNoR8CmLXivVt2wkXXdF
         vTiTIi/8tq2HhwEpnJ7xVFxulL8A1vXnCGCEIlLRyCyUPFO7LxJxqRc72ghRLe0GP3MY
         AldWJNN3ZqihevPHax2Ny+tgvI8r9tsSx/NvOlY6pOPH1IYP8hQqiInez9wPcJnJcciC
         6C6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvCvPQp3cfi1Tc2wvLoee0+HCCBe/eFmlUq3pZTOF0nj8VAIksKa9C+dVO2M8+rm5ELMRNjjb5uhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+icJ7h7Blu9NadtKSwFoH+1fBfKPYAVh6yhTsPgk4DnsuqQs9
	82Bxuw/9v7HsVKUkZfE6OrsmlwrawKv6MCUlqqihXvzhKK7PrIr5PXBsIZyQTu5OVQ==
X-Gm-Gg: ASbGncuYss8XM3b+rHX+zhmkMFCgkHT1/W5Pmw/oPnI7Peacb0KLm7ZcVLgkzhP1DvF
	cDu88OSuUW3+ldp0rY3ur9d6p3LqnekMBFj/i7ChfRmLqUl1d4e4/Nsohn6iFIikXWS30m86pnl
	miVOFSP+rBX80Y5kcQVEZSzAQYNf9nbmGSQWlrsGM6yjypSwsgfThMrE3XDetC+NjG0d9QWvuZc
	5kmsfkkLfb4fvTDttZEsDOtIfpKSxSV23Dy2/IU9CcFPJFKOB0SUPxCxqj4A5FEguRP7S1Tu6BZ
	pc/aR9SOx2Bw+vJS4Hq58b/AKfCWJrEnOeM0vKl8EcAbj3+DEhJsc9BT1oVIO1SSRrd6X3mkn1F
	KMRmEgaDv6AfUfwJh+DYzAz9gDXMK7av4UM5W2bNubvOqpazmIX0WLP6jLxcSFBpHPHdRINdTkD
	AXRT/4Exg=
X-Google-Smtp-Source: AGHT+IGP1hyFZV1SKNgqT6yh/27l5zi4Tf+mWyT/ZiKYrXWu5r04E0xcEXE/GgsOLn6QwZL8u+vvRQ==
X-Received: by 2002:a5d:5d10:0:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3b60e53eae9mr3129730f8f.39.1752678477684;
        Wed, 16 Jul 2025 08:07:57 -0700 (PDT)
Message-ID: <b6572156-e0cb-409f-b6ff-c6f2ad85cb22@suse.com>
Date: Wed, 16 Jul 2025 17:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/19] xen/cpufreq: make _PSD info common
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> _PSD info, consisted of "shared_type" and "struct xen_psd_package", will not
> only be provided from px-specific "struct xen_processor_performance", but also
> in CPPC data.
> 
> Two new helper functions are introduced to deal with _PSD. They will later be
> re-used for handling the same data for CPPC.
> In the meantime, the following style corrections get applied at the same time:
> - add extra space before and after bracket of if()
> - remove redundant parenthesis
> - no need to put brace for printk() at a seperate line
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further remark:

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -226,9 +226,29 @@ int cpufreq_limit_change(unsigned int cpu)
>      return __cpufreq_set_policy(data, &policy);
>  }
>  
> -int cpufreq_add_cpu(unsigned int cpu)
> +static int get_psd_info(unsigned int cpu, uint32_t *shared_type,

Here any below I question the need to use a fixed-width type. "unsigned int"
will do fine here, I expect, and that's what ./CODING_STYLE also mandates in
such cases. I may take the liberty and change that while committing.

Jan

