Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD639B10CB6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056127.1424280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewdD-0005cX-OF; Thu, 24 Jul 2025 14:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056127.1424280; Thu, 24 Jul 2025 14:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewdD-0005as-LB; Thu, 24 Jul 2025 14:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1056127;
 Thu, 24 Jul 2025 14:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uewdC-0005ZN-R8
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:09:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4bae077-6897-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:09:10 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so7041335e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:09:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b77078b335sm2053700f8f.6.2025.07.24.07.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:09:07 -0700 (PDT)
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
X-Inumbo-ID: c4bae077-6897-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753366149; x=1753970949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E3L7KOtqugqDO3AwNz/IVdcJv023OHALxjZbeVvKOV4=;
        b=b10z9M6jys2WxNClhjEVBTHn3IUiYuVNBrmoHhIuFkab/BR4GzOMquc32VGVbKD3ZJ
         bJs6/Y5eCDvPPHrVrlqhfBxihCDfNf98Fv1BlT7GgIP8m0qeBePigC+OXBV63wDf7qY/
         tVoR3pHFIA9SuvH/A17e/zq0tpXMeosmkWE3Ww0zJYS6oxRVZwKSVwkCkbyc2lkhCdt3
         fTFyginBsGEacGaYnihb09TUlDurdIH3ec5w4b5EwKvjJNW7ppJ+mYI9L6DELfw7zs15
         S6k4Su0g5GuidtwKaPqS07lxWUHJQ1w7zvBqahWzgeP/IhC3w6hGTJx0cPQpS7Nm0jss
         sXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366149; x=1753970949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3L7KOtqugqDO3AwNz/IVdcJv023OHALxjZbeVvKOV4=;
        b=O7OV5DQCrbe7Whn6ubFq/7J6hoKMl1uQtXBun0pE4yJ2qjLSNdtdKEBXTlJHAf4oRj
         ODeNgL8DzDC28Zw4gRfOKV6rZq8nKGLerapl20fNgoeENcC2aRNywxW8aTb9169JIQJm
         RV1TmxBpJpi4jW6ItMh7whZbSvU9XqNC6s1Ee0qFfUPYAYzEJejwSu5DoPBEVVGcGJUo
         gHSiTPf6cdsAvR1Jq4QJ3lsfxp6L9dnc+n1hYdNK92WmP3LpQrBaAQAIPZY9OzBPTf3v
         ywwtscRWP8R5vxR/hrXxdl2LoN+mJhJmunfuOXOBrYRxSCSX+2kLkg4Ax9baMOGL4xSS
         xxwg==
X-Forwarded-Encrypted: i=1; AJvYcCXDp8AXoemaUHi2EhJxKn3npRzSz4fb8QyadNMTuJGBSSFbU0OX0SmSDGFgsqkLTHWDt5yfckWrMyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyewCabc2lrbCVyZCBkSRIdsLRs4M+YBzWoZ8thR2lB0X8hUFf0
	b+dZ5KQ78yt0YZMXl/7kWUlpeD8n09hbt9uAGoDbcRKe/BqzseMTMCfWnBCWv6aD5g==
X-Gm-Gg: ASbGncvlGe888CWp+zdsZpPruJNCpu1CVh4mD89sYvksmDXp0sB+P0RpAmutp5ex/8W
	H253UnLm8CRphqMhZhgvBATkIKYk737WgEFXTy8Kkrp4meXSxtlSybFnvj4lS1Dm0e/LzKxnYj2
	3Yn5DoWuqVh5cIedZ8MZ4XnpMuycBNxDtmpmAvTtb2h7tL7luiBj0uipUaIEcwVfNiXEn8XuT4B
	9icTz5WIFPG8uJB9Bd0n9zi59fNtg932qDNdjdrkXAUQXVYualXJAzMQnoWduOHQpztHNkL3Pf5
	nOkL4b/rWTGxYCjfI0LAGOs94Ffm7NfYsfHOvQ0ZtiOYCwmzQ8wMm/qo9sTMlaSadWf+BvzUuDS
	5PqZlE8pDEcGEkrpQvdPxHlq45V4mcr1YM2u6UTkOoCB+Fhiv/akv7uNXPeEwL5HClxJk73P+BG
	pgHZJa8nU=
X-Google-Smtp-Source: AGHT+IHalTRE8HCSqwH+dIAINBrNqZjcw6DFm+w/xd9OJz54L8aodZTbYq87VFW6HrO5p959/7djrg==
X-Received: by 2002:a05:600c:8b30:b0:458:6733:fb69 with SMTP id 5b1f17b1804b1-45868c9dbb1mr72263915e9.14.1753366147594;
        Thu, 24 Jul 2025 07:09:07 -0700 (PDT)
Message-ID: <e28d711a-d83d-44a1-9d2e-8b5e694fbaf1@suse.com>
Date: Thu, 24 Jul 2025 16:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/19] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-19-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-19-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:51, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -968,3 +968,9 @@ bool cpufreq_in_cppc_passive_mode(unsigned int cpuid)
>      return processor_pminfo[cpuid]->init & XEN_CPPC_INIT &&
>             cpufreq_driver.target;
>  }
> +
> +bool cpufreq_is_governorless(unsigned int cpuid)
> +{
> +    return processor_pminfo[cpuid]->init && (hwp_active() ||
> +                                             cpufreq_driver.setpolicy);
> +}

The function, by its name, is seemingly generic, yet its implementation
is tailored to the HWP and CPPC drivers. I think such needs calling out
in a comment.

Seeing the XEN_CPPC_INIT check in context, I also wonder why here you
check for ->init just being non-zero.

Jan

