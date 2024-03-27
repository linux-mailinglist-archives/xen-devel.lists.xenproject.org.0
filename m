Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FC88DB61
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 11:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698422.1090030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpQhr-0006z5-5R; Wed, 27 Mar 2024 10:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698422.1090030; Wed, 27 Mar 2024 10:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpQhr-0006wg-2q; Wed, 27 Mar 2024 10:40:31 +0000
Received: by outflank-mailman (input) for mailman id 698422;
 Wed, 27 Mar 2024 10:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpQhp-0006wV-5e
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 10:40:29 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cb8313f-ec26-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 11:40:27 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so6273374a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 03:40:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ef7-20020a17090697c700b00a474df4cda5sm4242694ejb.167.2024.03.27.03.40.26
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 03:40:26 -0700 (PDT)
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
X-Inumbo-ID: 6cb8313f-ec26-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711536027; x=1712140827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=if6iQd/kKBoB2STDWh3Tss0Hn/p9pyD81u4TyzonMO8=;
        b=NYdMjDQZHx397tvDPJfGVjUNvjmZYKPMEJZL8NxhCvk1sonHDtJfFpR71+auzdG8bV
         KnmMbMY64x0QxOn1T1pyO207lYlKVG8/e/NMLoMIKLdooCuLNWAHjB+69JToE5zUJyGU
         W5e1+j/YXT0UBNw1fMxLQ32GgPtRgLkoxEWIY+Ymb6jE6+UEOE2pd/2VUBI/WZ85EHTI
         5c+Qt5fjhP6+zZoiZQ5cFoJO/BWAyyh9Or0buqxNeurrvt/BgytobJ0VUKYVZ8l4eKkE
         11VQF3ed9MB1nds/hDbDj/Qaqw/MigLVib0gtq6+sOPXqCWayM3oKt69KkuVZ9o07rFo
         GmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711536027; x=1712140827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=if6iQd/kKBoB2STDWh3Tss0Hn/p9pyD81u4TyzonMO8=;
        b=Yt6tWeG9Z6UINauyLYn6iHtvFXeYPoz2kS5t0GfYFJhxBMh1IijKkiXkajt49h2Nc1
         xA+R0/Yxqq2UbfODpsi7JPrSFDONN8gKxT+ZW3qQ2jWmxHOADLuyF9AhbMXQJ81fc7Uw
         IA5MCO13DzIALgANwjj066zxn718VAljnV+05uGJA/ltH+1LD0wiY4YK+nEwrB8VGLCa
         rY75AR3nE+tCCS7EJzBea4HJjjU42DZ4ctQtYvdi6YUsB+nrlyX0TcymeaFJDtpXjSPU
         WOkxPnOlpECpVl/aHGmEbXnXJ0i5B/DS92DRcYc+9bH6TKW7oG+EqrrSYPwd3t19r2nS
         YuQg==
X-Gm-Message-State: AOJu0Yw2M3TDJ7LXdPnvkDdiZgphf+SK32gZn9FXVjA4OYJVleHm5zCX
	4US8ZscfvMxEJpkYRds4xnOnumjirLGz+x5uH49KFLz3IO/TXxa2XrL8wjs4ye3Du3rHa4NlYLM
	=
X-Google-Smtp-Source: AGHT+IHoSJY5U0PsIBOpYk5UTmesCQXxL0URNDznJJdwPFEJMNpa0IA33NRLoMONSOp9j4sJ/VGjCg==
X-Received: by 2002:a17:906:5645:b0:a47:4a75:649 with SMTP id v5-20020a170906564500b00a474a750649mr2592490ejr.13.1711536026784;
        Wed, 27 Mar 2024 03:40:26 -0700 (PDT)
Message-ID: <24d80c55-1669-4eaa-a805-7e950205dc26@suse.com>
Date: Wed, 27 Mar 2024 11:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | e3883336
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6603edcb4d254_2c5c1671823573e@gitlab-sidekiq-catchall-v2-995bd4ccb-hkbtp.mail>
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
In-Reply-To: <6603edcb4d254_2c5c1671823573e@gitlab-sidekiq-catchall-v2-995bd4ccb-hkbtp.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 10:58, GitLab wrote:
> 
> 
> Pipeline #1229415063 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: e3883336 ( https://gitlab.com/xen-project/hardware/xen/-/commit/e3883336bb5abba2ec2231618f5b64f61b099b1e )
> Commit Message: xen/efi: efibind: address violations of MISRA C...
> Commit Author: Nicola Vetrini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1229415063 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1229415063 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 1 failed job.
> 
> Job #6487283739 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6487283739/raw )
> 
> Stage: test
> Name: qemu-alpine-x86_64-gcc

qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)

I have to admit I have no idea what this is supposed to be telling me.

Jan

