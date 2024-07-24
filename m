Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C16093B17B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764201.1174550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbtQ-0007iE-DL; Wed, 24 Jul 2024 13:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764201.1174550; Wed, 24 Jul 2024 13:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbtQ-0007fs-A3; Wed, 24 Jul 2024 13:18:56 +0000
Received: by outflank-mailman (input) for mailman id 764201;
 Wed, 24 Jul 2024 13:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWbtO-0007fm-Mb
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 13:18:54 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45bff40c-49bf-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 15:18:53 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so215222666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 06:18:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c94d241sm642171966b.190.2024.07.24.06.18.51
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 06:18:52 -0700 (PDT)
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
X-Inumbo-ID: 45bff40c-49bf-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721827132; x=1722431932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ/h9b0DpU4vM0n6HUsGZE40olDj6TbTfS1TErEmxL0=;
        b=VFg8dY63xK3v6yTkS4xGFRI4UVuA98R49CxJOx5aOFhKTRDDPPA0ycvX5WvwLapz2f
         weykAAngfLNhWcKs9+Nf4VsrRh028SQF4uQv3d9OYr1Oupt2sDHt0JyRr58X/Q3/b1TF
         jdr8h38xB36YqK2d/BbIWaEBkcCjphUr4uMDrMd8hIoOej6cP0zRu96F4FYARY7QfSjl
         NrPr6/x92Yo1B2xlpVvPcVzvk6vnA59k9BN8UNObjPi7KdBGzUDmjMmPzxoPKJmcOzd9
         3kRipAro9XB/Lz7sq2eIgvEYN+YPLGVAFJ8wO1qY/bZUU52W2FztaVyBbHh7gC2L998Y
         Ts9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721827132; x=1722431932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQ/h9b0DpU4vM0n6HUsGZE40olDj6TbTfS1TErEmxL0=;
        b=CzZXl8h72nSUPAbsMq93VduTNLFCRJDSzMmupHtfFTRiTCYEKrPQ4ir06Gk1UXQqz2
         nmeyxNubjHbOgDGO3McdY5yorH/5TaH4iHbATmD8doza+qeYujZmF8V1SJXOewyneugB
         FkkHLf8iAFrHHHjS8ttdxObB3mieqnawdROr9/8dUbQDv1qthnvVNTm1P5MCloaprPfL
         1PhcdaTqMaOhN0VWFv0UNeE61yzx5njQoHY8axYSURfy5+wXkoiUPoayxGCtAKH7p/2h
         a95VFvLne0VRkJMfT5nbygOdoO79mcnJ2/90w6Eom/eEjGr3iS6FYPjmXB4FyHgZNQjJ
         iFug==
X-Gm-Message-State: AOJu0YzTzgr394cWyX5Osvy9yrCUZpVcjJuOtSRMnKg/aKzYDzuEE7iM
	fOT7agZmpdGmP29CUeCUQlf7QPCpr7ucscXfksGXOrHqHMI1vbz54daI6FTw7iEtiQ8meZUDB5s
	=
X-Google-Smtp-Source: AGHT+IE0YNnwf7yTjFdd+WOwfrV1rVAGc+CfZR8Pr0wB5L+tGrA3E872ngjI8cSuQxCTGtpDmlr3ww==
X-Received: by 2002:a17:906:c148:b0:a7a:9f0f:ab14 with SMTP id a640c23a62f3a-a7ab0eeb50emr152951166b.33.1721827132306;
        Wed, 24 Jul 2024 06:18:52 -0700 (PDT)
Message-ID: <24be503c-7c8a-4db9-aee4-04b0c872c0dc@suse.com>
Date: Wed, 24 Jul 2024 15:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging-4.19 | 2d7b6170
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <66a0fe638f16a_33beeb0103995@gitlab-sidekiq-catchall-v2-96b77f447-9jjmp.mail>
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
In-Reply-To: <66a0fe638f16a_33beeb0103995@gitlab-sidekiq-catchall-v2-96b77f447-9jjmp.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 15:15, GitLab wrote:
> 
> 
> Pipeline #1385987377 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging-4.19 ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging-4.19 )
> 
> Commit: 2d7b6170 ( https://gitlab.com/xen-project/hardware/xen/-/commit/2d7b6170cc69f8a1a60c52d87ba61f6b1f180132 )
> Commit Message: hotplug: Restore block-tap phy compatibility (a...
> Commit Author: Jason Andryuk ( https://gitlab.com/jandryuk-amd )
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1385987377 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1385987377 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 3 failed jobs.
> 
> Job #7415912260 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7415912260/raw )
> 
> Stage: test
> Name: qemu-alpine-x86_64-gcc

This is the one known to fail more often than not, I think, but ...

> Job #7415912175 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7415912175/raw )
> 
> Stage: build
> Name: ubuntu-24.04-x86_64-clang
> Job #7415912173 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7415912173/raw )
> 
> Stage: build
> Name: ubuntu-22.04-x86_64-gcc

... for these two I can't spot any failure in the referenced logs. What's going on
there?

Jan

