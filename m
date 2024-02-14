Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDB8548C1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680655.1058716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDnh-0002Ut-0M; Wed, 14 Feb 2024 11:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680655.1058716; Wed, 14 Feb 2024 11:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDng-0002SM-T9; Wed, 14 Feb 2024 11:51:40 +0000
Received: by outflank-mailman (input) for mailman id 680655;
 Wed, 14 Feb 2024 11:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raDnf-0002SG-7D
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:51:39 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68d69a21-cb2f-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:51:38 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-411f439fb93so2318265e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:51:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t9-20020a7bc3c9000000b004107dfa6aebsm1693947wmj.28.2024.02.14.03.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 03:51:37 -0800 (PST)
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
X-Inumbo-ID: 68d69a21-cb2f-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707911497; x=1708516297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNUAQ+mMR1wBg/kRyeaLtF6OpyXmqNra9TWwqKRTVJI=;
        b=e9Xy29ufvnl2Ro8Me2Yrb8DqM//uzvzQrujA1XO2kaatVoicg6VFUM5eEQF2flTJH0
         JvKfRUsU6O+2nHU3WTjbUJhAmZ+yd1dA57nLJwdeTcJvL42i0YVTPURI7OzX768oPtzA
         hcRauZzZe0tJC7aUzzFN723ae45/6r8/tDEpPF00ovfxoYDRO0vTW5IBFUX81VwtvI2m
         owKr30jctx5bISLHwUxKpxmfvUiKHSaLNG7nWuh9OCPD9Kjm1y0xFNxeJES/WPaJxizX
         +xWGjQeZaR2vElgOCdCGp+QnsnDZNNCpkilj0GFTxtTHSn2iyLYeQGUu0AZ9H9G7uqpP
         YOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707911497; x=1708516297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNUAQ+mMR1wBg/kRyeaLtF6OpyXmqNra9TWwqKRTVJI=;
        b=JpkoTvmkgW20BE2cJ2uAF5X0locE4lvDYFqlohZK/HyNxcaQfZoZ4IdxkPcRXSHcrM
         gqe2iLmKfUPRfhlH3cIaFdQawSzDaBY8DUmZDhbZDvdnEJjr1sdh0qwZ6n6d97QIlrW7
         lhtHGQRmKhY3fHkax/YRk+b/VGFFw8Qnc4eKRpzGNMa8cgnGRRxzZ+Dtp1fZSGUyAQHG
         PQV5srx4iTuWXyYgd0Fz+6nkF3YXiUJykLfWuoH9tbgjHKQxiiW6c1twG7sWmIgalgEM
         9QQBhXWaoVeD7+dk0+qrzePmY3lg29HW4g4K5aKnMiEy8dZa7XQUj2mZWr/N+qsrUsYJ
         GNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCzJiqhNKE5RYEzD6x4gtt2oTLb1ao0me4hsgexNJll+RSHGRfcrsmz24htaC3zENJQIlOpqRi+6to6CUxqzAM/ojDbPrKtWYWlNoQuq0=
X-Gm-Message-State: AOJu0YxW5T28EoEi9H5CfGKhOLXjmWBTyg8Mkkoe1prHzHffSfgxQDWQ
	kBieX1G9wOUJd/HTXjvzs2oySzIx2BawiMpHP/TeGx4ZU9FxUioseTTsU2RJlw==
X-Google-Smtp-Source: AGHT+IGqj1X5ZifK2e592AURiNdU0gNycxGKhQ7W/Kety7J2/a2zIcH5Hn7464nYugMpurUB4cN2Qg==
X-Received: by 2002:a05:600c:1911:b0:410:cf70:c537 with SMTP id j17-20020a05600c191100b00410cf70c537mr2178143wmq.4.1707911497435;
        Wed, 14 Feb 2024 03:51:37 -0800 (PST)
Message-ID: <b2433393-1a04-4570-abe6-0356db9976f8@suse.com>
Date: Wed, 14 Feb 2024 12:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] iommu/x86: fix IVMD/RMRR range checker loop increment
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-2-roger.pau@citrix.com>
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
In-Reply-To: <20240214103741.16189-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 11:37, Roger Pau Monne wrote:
> mfn_add() doesn't store the incremented value in the parameter, and instead
> returns it to the caller.  As a result, the loop in iommu_unity_region_ok()
> didn't make progress.  Fix it by storing the incremented value.
> 
> Fixes: e45801dea17b ('iommu/x86: introduce a generic IVMD/RMRR range validity helper')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Should Andrew get a Reported-by here? And surely we want to list the
Coverity ID as well? (Happy to take of both while committing, so long
as you agree.)

Jan

