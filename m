Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81212998983
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816223.1230416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syu9q-0004RF-GF; Thu, 10 Oct 2024 14:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816223.1230416; Thu, 10 Oct 2024 14:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syu9q-0004PJ-De; Thu, 10 Oct 2024 14:28:50 +0000
Received: by outflank-mailman (input) for mailman id 816223;
 Thu, 10 Oct 2024 14:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syu9o-0004PD-Ab
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:28:48 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f56113c0-8713-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 16:28:46 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99422929c5so116425466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 07:28:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f29b3sm95104766b.221.2024.10.10.07.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 07:28:45 -0700 (PDT)
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
X-Inumbo-ID: f56113c0-8713-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728570526; x=1729175326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GEjYTwbF2lGZ2hkzxCWc3Gh+XHxdL7VdwDWO+WyaQ6o=;
        b=Ff9s/GjcJ4APwtm9M3RTY+CarNO4FTk6uiTQM9aTHOwWcaOQAR6Agr24pHG2R+v8RJ
         ltYhsvIouAZR7zQ/VmQhgBcDTFNDg9ILmTJ7fQUsmg/whAG8VeSprki/kEEp7rg+B1CF
         5jRZaEhG3apiU1oXsbqAfFFsw7XjUe34C/ZDjOeM7PGNHrQHxQZQrekMsMVXoACCBvvA
         vN2XSyg7FmReWNvWVrEG80J716d3pk5cUl6YelSmzR3lC/CZJWTy86WYOHqd7D/ktapi
         4coZLpeMJzUN+pwbDHzWAo9KL1raHVLqo70pGSvckGHxWWZtTT13vil1tTfvxUNazmsx
         APWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728570526; x=1729175326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEjYTwbF2lGZ2hkzxCWc3Gh+XHxdL7VdwDWO+WyaQ6o=;
        b=bmBNBvIeQgx9vXPppLN6gfIoZj5xbEYcjrGRZgbYVfu2/UlbRsAu/dna7AuCc0ujEs
         aXinAKTVsNB2ulyKMdJ6O/SGV0JDb61i2cCEK6ZRCJDLY/6BpTKs9Z/J4K1JrhTIijSO
         ZVEJ0OcLFmq3vFeLl2EtvLFgypgrHpK/N4AB2mVokkYoScMg/ruO0OsWI8NwgYnyPu1e
         SkzaIt5UbJvrP92m66hX7HCrdjEiVgQDkjODngZDgacoDLc23cST3emPTrfWDLGd19FW
         /R3cT04Uf2fNdTsYuYUjV4gkdI4+V7ZO/NSxRGJxUWKjSZ+5NJ9RNsCZmUlqseM9pDHi
         wrtA==
X-Forwarded-Encrypted: i=1; AJvYcCXJIqiwiFEd+7NkqhOBO3dfV+fKYA+vszVjahfVtDorEaa/ryfdAvej9DelPDuvKVJ9nhYADBmYOeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxO8/9fuAMmo8H4T4lgOxwvAKgxiAMBKYLciFDevvyy66y+DO+
	6y0T1tU8/W9kiy3oaIjcB7dLmRXtDEDrevsoKfm6eWLWMQQqRqvtTMJoXjlSog==
X-Google-Smtp-Source: AGHT+IFpKCrVNQ383gtQUfF3AuSIwi39Z1RNrltFaBm/3iYa9jSFWD3LNN4AgjAQeNmhnzSaCQi3zg==
X-Received: by 2002:a17:907:3f87:b0:a99:4f91:790 with SMTP id a640c23a62f3a-a998d208810mr584271466b.31.1728570525804;
        Thu, 10 Oct 2024 07:28:45 -0700 (PDT)
Message-ID: <9032c1bd-cfe5-48b8-83fe-f411791b2f5a@suse.com>
Date: Thu, 10 Oct 2024 16:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-7-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20241010140351.309922-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2024 16:03, Ayan Kumar Halder wrote:
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>  
>  config NR_CPUS
>  	int "Maximum number of CPUs"
> +	range 1 1 if MPU

I think this "if" and ...

>  	range 1 16383
>  	default "256" if X86
>  	default "8" if ARM && RCAR3
>  	default "4" if ARM && QEMU
>  	default "4" if ARM && MPSOC
> +	default "1" if ARM && MPU

... this one need to have the same condition.

Jan

