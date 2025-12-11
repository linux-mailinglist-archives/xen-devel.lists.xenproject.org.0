Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5ECB653A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184251.1506746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiWk-0007BX-Sg; Thu, 11 Dec 2025 15:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184251.1506746; Thu, 11 Dec 2025 15:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiWk-0007A9-Pr; Thu, 11 Dec 2025 15:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1184251;
 Thu, 11 Dec 2025 15:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTiWi-0007A2-Rk
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:24:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76756e41-d6a5-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 16:24:19 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso1179535e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 07:24:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f0e42asm39734945e9.14.2025.12.11.07.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:24:18 -0800 (PST)
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
X-Inumbo-ID: 76756e41-d6a5-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765466659; x=1766071459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YtZdzmzE9OpILgU3kkeKLX69OOmX8jNr4z0EvH/+k1U=;
        b=F3uxS4NOKQX+O/YiEPa+O0Jo0Sgkf8azhfnCk/pobAudlg7bcHvZ9dBJgnG7Cwz7go
         7Thxeme9w1IuDyvf6zEb8htDf0gxLhJF5S795lk3npyrgQNmA8KTgtKsAL3X0wEL84fF
         63UW/KdKKnUkDBMFiAwNZ3lgrSQYE+7/grmR57XfRfNM77b8krppLPfb+9WGPT4L07e3
         Tnkznqm876/ear6vl1qqDt3P2rGbqK66bump3VIgRTecDFCLffKuFWWbObMAmsknJ+eK
         RQHl0GvAeYgW2LeWkZdkeCxsigVgdumhY9rCTodFdezF1vmjoLax7vcVZnGu0gUxTJMz
         U1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765466659; x=1766071459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtZdzmzE9OpILgU3kkeKLX69OOmX8jNr4z0EvH/+k1U=;
        b=iLaF8dtXmJIa3L9ZIcnz6c1gz5OGsA9/Qgz6VwpgwNOAQ715pykSmWbjp7S6sEQ0YT
         NczwBvOPvaTINYk3CU90DaRflKY8j75kmZNbvbii3knoyUSJRU7np4YJxiRGE9mh2ODr
         Wns2YkHFKu91VER4YPvXzEyNjXG2UR7Z9gglIG8Sj3QTamGOUmu4tffLE4w5cbMxPHbn
         /2Lfb0va7bz3cb85ccWwC2j3Ebg+v/RL2XLmcr7sflSLFq2QqBqL9yJvoleVXPhwtAST
         dp4a9vEBnMo5NlMUzEjFYTeaJvWDxtsgXl4zs3hQN2nVdAwg36RmYMMePn7SDCUTsV3T
         qecw==
X-Gm-Message-State: AOJu0YyPiNDCE7UrgXxm/bQCOGyamrR12Fk5I5TJCLIZPkheYZKJFJ4W
	iezMYNh2J1ms/deZrB+Pqqh8ad1DDikd14UF3qD/v5yq+71TYbf1JI68Brf3cUBWAg==
X-Gm-Gg: AY/fxX4fnyAU7mLQeFmFXluxnCr2IYppItHY6b2FPOSfoHYxGRG3mPQvkSUCQAA2lXr
	nLCyIJo93+/2wHE7MRinpjjj3ibeR9i9iDTKqcTMzCMG8d9ll5JRKruXOujY19IRokRLBNsjUa7
	zZ7LBU8SlZpnC2LBXl1NICBoYmxJiuZaEM+VVw/S2jgXoF8pZ9mP+Ga61fHz7zqVNWl2c8sW5tN
	S72Eb2Fc2l8Mfpj5epoVK5f8ap99dwwlOPC8VUpg1yZ2KZBX2YPeOb92LWawSEzKhrAIdPHRDAi
	gYwxjDfdYcXYwmaEP6CcesnilJk0UggqV8bp66xrWt+ZXWWs3IMOCZ15delibOPmc2BSasEIm9u
	CzQ46e72Ow0DdqxTjey5BLIl3XRRrQGpUVork0fAiD55LOoVW88MMwAx0v6y6q4a9nUBIEUnJWU
	8ElkslRfo2l0VyZlbV+Yw7Bk5Fq1kg3VE5mK0E/vdloTkiJwhn/UewyZNlVvV2g7E2NpLYGpFZ7
	Ec=
X-Google-Smtp-Source: AGHT+IHubwD3X4RAJGz4e4Qtb3GuZAQUy2zU/qJjkr4Ylzrq5CpRSXlyzkvX3xC4Jr9hL0V1pqMrQQ==
X-Received: by 2002:a05:600c:630c:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47a83790ca0mr66474955e9.18.1765466658772;
        Thu, 11 Dec 2025 07:24:18 -0800 (PST)
Message-ID: <0f61c337-a359-44eb-a232-b166d82e7178@suse.com>
Date: Thu, 11 Dec 2025 16:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 12:44, Mykola Kvach wrote:
> On Thu, Dec 11, 2025 at 1:15 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.12.2025 11:29, Mykola Kvach wrote:
>>> While working on an arm64 s2ram series for Xen I have hit what looks
>>> like very strange behaviour in symbols_lookup() as exercised by test-symbols.
>>>
>>> The series is in the branch referenced at [1]. All patches there except
>>> the last one build and pass CI; adding only the last patch makes the CI
>>> job referenced at [2] start failing.
>>>
>>> Note that the tests in that job are built without CONFIG_SYSTEM_SUSPEND
>>> enabled, so most of the code introduced by the s2ram branch is not
>>> compiled at all for that configuration. That is why I initially did not
>>> expect my series to affect this job.
>>>
>>> To investigate, I tried to reproduce the issue locally. I downloaded the
>>> xen-config artifact from the failing job [3] and used it to build Xen
>>> with my local aarch64 cross compiler. With this local toolchain
>>> I could not reproduce the failure, and the resulting .config changed slightly
>>> compared to the job's config. The relevant part of the diff looks like this:
>>>
>>>     diff --git a/xen/.config b/xen-config
>>>     index 057553f510..44dcf6bacc 100644
>>>     --- a/xen/.config
>>>     +++ b/xen-config
>>>     @@ -3,11 +3,11 @@
>>>      # Xen/arm 4.22-unstable Configuration
>>>      #
>>>      CONFIG_CC_IS_GCC=y
>>>     -CONFIG_GCC_VERSION=130300
>>>     +CONFIG_GCC_VERSION=120201
>>>      CONFIG_CLANG_VERSION=0
>>>      CONFIG_LD_IS_GNU=y
>>>      CONFIG_CC_HAS_ASM_INLINE=y
>>>     -CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
>>>     +CONFIG_GCC_ASM_GOTO_OUTPUT_BROKEN=y
>>>      CONFIG_FUNCTION_ALIGNMENT_4B=y
>>>      CONFIG_FUNCTION_ALIGNMENT=4
>>>      CONFIG_ARM_64=y
>>>
>>> So there is at least a difference in GCC version and asm-goto related
>>> Kconfig options between the CI environment and my local one.
>>>
>>> After that I tried rebuilding inside the same Docker image that GitLab
>>> CI uses:
>>>
>>>     registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8
>>>
>>> When I build Xen in that container, using the same branch, the problem
>>> reproduces in the same way as in the CI job.
>>>
>>> Even more confusingly, adding extra prints in test_symbols just before
>>> the calls to test_lookup() makes the problem disappear. This made me
>>> suspect some undefined behaviour or logic issue that is very sensitive
>>> to optimisation or layout changes.
>>
>> All symptoms described make me suspect you're hitting a problem we're
>> already in the process of hunting down. Can you please take [1], make
>> the small adjustment necessary to Arm's linking rule, and see whether
>> you get a build failure in the case where right now you get a boot time
>> crash? Of course no other changes to code or data layout should be done,
>> or else you may observe false negatives.
> 
> I tested the issue with the provided patch, and it is still reproducible.
> 
> This is my working branch:
> 
> e8d5baab50 (HEAD -> reg) symbols: check table sizes don't change
> between linking passes 2 and 3
> e53439fdfc (xen_gitlab/reg) xen/arm: Add support for system suspend
> triggered by hardware domain
> eaa461f3b5 xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
> 4236fff9a4 xen/arm: Save/restore context on suspend/resume
> a150f3d4bb xen/arm: Resume memory management on Xen resume
> 
> You can find the following line in the attached Xen boot log:
> 
> (XEN) [ 0.010785] Latest ChangeSet: Tue Dec 9 11:11:40 2025 +0100 git:e8d5baab50

But this means the build succeeded. Which in turn suggests you're observing
a different issue.

Jan

