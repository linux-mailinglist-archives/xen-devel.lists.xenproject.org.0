Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838E84CC87
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677683.1054436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXinJ-00047S-5q; Wed, 07 Feb 2024 14:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677683.1054436; Wed, 07 Feb 2024 14:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXinJ-00045Q-2q; Wed, 07 Feb 2024 14:20:57 +0000
Received: by outflank-mailman (input) for mailman id 677683;
 Wed, 07 Feb 2024 14:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXinI-00045K-22
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:20:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a344395-c5c4-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 15:20:54 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40fe2ed8746so5759395e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:20:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s5-20020a05600c384500b0040ff7e31749sm3510665wmr.22.2024.02.07.06.20.53
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:20:53 -0800 (PST)
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
X-Inumbo-ID: 1a344395-c5c4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707315653; x=1707920453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0engdDqSwk41ztqZ8R3j4EjvMcOaAEJGYhy9mKr3sFg=;
        b=QV2Ye6vpmfTNgpbiW8LvKNfufGnVOmoafJ8qvidhEcYKkxQvwF4IWYkJvFjnuocgMO
         8M+G8rhXgIBDYHlEIuILmi7Q8ARS1/02qv1VcegeUIIV2UHkB7Ii1UoV+ZmZjIEWqof4
         EIkJa0R7fv00Vi8R7dPK3GcD9m1qOgprFdMaarsHMV9Q1Zdzc6w5kMooMILMsFt9yvWY
         ikYRmePdyqSVWfiLOsKlQcFjjWCm4QNBpTakI81cbuDp1HvW8PEOO8S7obttF5q5r8gq
         AgeLPjKX0RpYoUeBERvX6gvkm4Qi+BnxYObf8IyVGobbeFLuDrX21dsILDNc3XDPwrcM
         DyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315653; x=1707920453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0engdDqSwk41ztqZ8R3j4EjvMcOaAEJGYhy9mKr3sFg=;
        b=UADq6bf4YkMCZMFNl+4d84QlnGcpfWkPZKWAtoZwCrqcZZKcklyAB7JaDAdrPjcNhh
         5WxbTn79P+VjjU0cg9uDkTTvPcJcDAQORhMkKETOQfEweXlqOccw4g7TMFIchkECepSF
         LQeM/MysF6EvahhTdeKGJvfOmyye66wDLOCx6f8zMrTAfGU7+Kg2N0k6yFTP25hIGXdi
         sFMOsjDNjCcmMrRDTTd56h0zduyUKg343UaPme58SN/W0h7OlaVAcwIdSC/EWS6ERVh2
         b3/Q0wMEjMofD/wqxiK0bahseIfaJcIhdmHtSo05f5y9DB4BD2bvfAkz23IMI+bW81uM
         Zfaw==
X-Gm-Message-State: AOJu0YwnS2+VRL6Cnawg1lYwSFUzvUV1RUT0VOKzuvENFiPO0cSiO1yC
	pVKKPG8fikyHWKCwua5nuaeoe0VLca+G982oQY3USs7LL9wmc1PS6u1uVxz1PFxs9xWuKq7/vfg
	=
X-Google-Smtp-Source: AGHT+IE9hiifi5FmaXPGOj4tZ1ru/1c55KZHiTFedqbJ3j2bqfrscms9CjRMVEm8zDqedlQV6ueteg==
X-Received: by 2002:a05:600c:3d8d:b0:410:1e83:bb5b with SMTP id bi13-20020a05600c3d8d00b004101e83bb5bmr580146wmb.14.1707315653491;
        Wed, 07 Feb 2024 06:20:53 -0800 (PST)
Message-ID: <115f10ac-a115-40d1-a444-50e960320557@suse.com>
Date: Wed, 7 Feb 2024 15:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | f4519ee8
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65c38d7a7ea07_2d1b5321c96792@gitlab-sidekiq-catchall-v2-779bdffdc8-kp98w.mail>
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
In-Reply-To: <65c38d7a7ea07_2d1b5321c96792@gitlab-sidekiq-catchall-v2-779bdffdc8-kp98w.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 15:02, GitLab wrote:
> 
> 
> Pipeline #1167820960 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: f4519ee8 ( https://gitlab.com/xen-project/hardware/xen/-/commit/f4519ee87ebfb74fe0451130d82c99453b75e2e1 )
> Commit Message: eclair: move function and macro properties outs...
> Commit Author: Maria Celeste Cesario
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1167820960 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1167820960 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 1 failed job.
> 
> Job #6116519549 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6116519549/raw )
> 
> Stage: test
> Name: qemu-smoke-riscv64-gcc

I have to admit that I can't connect what was pushed recently to this job
failing.

Jan

