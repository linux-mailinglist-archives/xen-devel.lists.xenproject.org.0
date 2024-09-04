Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996E896B211
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789812.1199471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljlj-0002hZ-T6; Wed, 04 Sep 2024 06:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789812.1199471; Wed, 04 Sep 2024 06:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljlj-0002en-QO; Wed, 04 Sep 2024 06:45:31 +0000
Received: by outflank-mailman (input) for mailman id 789812;
 Wed, 04 Sep 2024 06:45:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljli-0002ee-AG
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:45:30 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 457336c7-6a89-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 08:45:28 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c09fd20eddso5827234a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:45:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c2419dd5a4sm5243096a12.97.2024.09.03.23.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:45:27 -0700 (PDT)
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
X-Inumbo-ID: 457336c7-6a89-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725432327; x=1726037127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m8MRt3rVHuk2G1p4DsHV66w5iWiSE48yCBotlxy1Nzo=;
        b=TooPtXFzES2J8SVQ7Ih82dljDaAOJ0g4gfs3xDOzfSTX8j/LK8a6hXDMg6D8WW/vx5
         LBu2fbergJt98DwF9IGcl9h/lSvyBU8bpc02w6TNuQUMihAsuGMkGpWg019ut5K7pC46
         qV2/V+2u5LXkevHZVvd6MJb4GzwmCLL3B57yK2wLM7K2zXzX1nBjY8doNfmvB1G2TyBa
         /gMVEbNg4+Ghd1oyVUlIr/VyWPJGSyTa/gN2GdaTELrqLB82YTGFUSFEqBPjUkhFlX4Z
         FvOfzy3kRwtneAR+K6so/2YV9XHWg1j5uY2Id2/jRRmsZeTPS9BgriZKyCAY73aCRN+8
         eFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432327; x=1726037127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8MRt3rVHuk2G1p4DsHV66w5iWiSE48yCBotlxy1Nzo=;
        b=qhcPWgDveXfzkGHggTgC6lL00cU36NXmOxutF36Lemyy/443imDlFvsnh4JT2JGkNl
         5zk2RnlnwpVBYuArD17T3mfGlpP8o/IDR77DJ9runccaAEvfDE0GERUYWo1Lk55zfvUz
         Yy6/OKX4HPZhGe1T2BqjMBEO0DZ4gD/qD4KDbliAhQkhyVh5GX6lalG6nBPwnVsPfR8D
         UurVfXH2qHxDVxUp5+6zmI6smxs2tIp9X00vyFzlayoEqNTWmhr2xxU5RPF8yoQ4Vzp0
         kZBzBzqU9vgtKPywX5wVh8p4MbXeCvUbdNY8ZkeiQOwT+ZAieoHt4uGWJ8hDZSm/7bGG
         sO3w==
X-Forwarded-Encrypted: i=1; AJvYcCXT/UHCg1cbBcpGQPHyDWNhBx7jjgzFnj4Be3+rUnfbp/EuWHmIIPk7CswmQOHpHJHJUhDkaTC8c8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNGVnrzofXHAervrVA+4wWwMksHvXe6yIt73EGKsCHLSOLfEO2
	nV2QrkjWRgdEsn+fL6crCvBDnfrJ4MnpvAV908Paabie7l3CrTSIi8/yLA/qfg==
X-Google-Smtp-Source: AGHT+IHCLuM3halKb1+wIkqGDAhQeaVSArqLQUdoeuyQctKHlA3Gsy+c5qnBJGcTeNN3umtDWT2r9g==
X-Received: by 2002:a05:6402:528e:b0:5c2:6ff0:52b3 with SMTP id 4fb4d7f45d1cf-5c26ff053a7mr3027916a12.18.1725432327362;
        Tue, 03 Sep 2024 23:45:27 -0700 (PDT)
Message-ID: <564c11d1-4e06-4af0-bbdb-c4cbcf3df26a@suse.com>
Date: Wed, 4 Sep 2024 08:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/44] x86/boot: move headroom to boot modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-8-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240830214730.1621-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 23:46, Daniel P. Smith wrote:
> The purpose of struct boot_module is to encapsulate the state of boot modules.
> Doing locates boot module state with its respective boot module, reduces

I'm struggling with the start of this sentence.

> @@ -1390,7 +1390,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
>      }
>  
> -    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
> +    boot_info->mods[0].headroom = bzimage_headroom(
> +                        bootstrap_map(boot_info->mods[0].early_mod),
> +                        boot_info->mods[0].early_mod->mod_end);

Nit: This is badly indented. Either

    boot_info->mods[0].headroom = bzimage_headroom(
        bootstrap_map(boot_info->mods[0].early_mod),
        boot_info->mods[0].early_mod->mod_end);

or

    boot_info->mods[0].headroom =
        bzimage_headroom(
            bootstrap_map(boot_info->mods[0].early_mod),
            boot_info->mods[0].early_mod->mod_end);

or

    boot_info->mods[0].headroom =
        bzimage_headroom(bootstrap_map(boot_info->mods[0].early_mod),
                         boot_info->mods[0].early_mod->mod_end);

Even shortening "boot_info" will not avoid some line wrapping here, as it
looks.

Jan

