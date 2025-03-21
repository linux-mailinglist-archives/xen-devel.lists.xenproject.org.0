Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F1A6BC48
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 15:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924050.1327396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcuz-000105-Lj; Fri, 21 Mar 2025 14:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924050.1327396; Fri, 21 Mar 2025 14:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcuz-0000yc-Ik; Fri, 21 Mar 2025 14:00:13 +0000
Received: by outflank-mailman (input) for mailman id 924050;
 Fri, 21 Mar 2025 14:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvcuy-0000yW-3A
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 14:00:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd3e765e-065c-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 15:00:10 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abf3d64849dso353516566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 07:00:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd8f2bdsm157130866b.176.2025.03.21.07.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 07:00:08 -0700 (PDT)
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
X-Inumbo-ID: cd3e765e-065c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742565609; x=1743170409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLvYNPQA9azFT/6Vo3mW7SBCkS4bIANKdIYsnSATkGo=;
        b=DpbZFpKQc5ldgHTsulbfDUfOs0j5+9QrpyWCrHLvvBoyXwMxOtVbQk50VM3kHgrhiR
         d1+Ay1Ia+ZB8DwRamrhFqVIe2WzC5LX5OS6+ZO6B80jv5PH2FZL/zwY8AFMdMQ1S4Vwm
         AKzrZgAGnUFt3vagTKyk7LAVj7Ow34VR73opK0JfFY2+9uzDS/+yV5hLdLHFGCQWj7Mw
         SoGBgy0hBmk96JqQCP9e6lRCo8bjVhF3jRVgwBsiT4mnKvYilpxZ1qmsF2imv4RM06rP
         uDL6JaiJFWffvlIaQ5kCnCw5kKPk1lKJ9YkEFm85nTxeWGMYMHAH2gpwmE+df5cDluWl
         DNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565609; x=1743170409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLvYNPQA9azFT/6Vo3mW7SBCkS4bIANKdIYsnSATkGo=;
        b=TKNBDdPeBQtLyKFCRnSUu3UniSl7qQsVI3a9v2MgUrXY45277IWHWlfOLYFKE3l9t0
         TvSx3ltP2uK6szJ9mTonlZbeZ+i53taZjxU54m3hRHWMF7kimmekA7w3GPw+m7X7BE34
         1MrWm4ou/1LhOuLQ+BXBgj0gzAHPGawqVz2WdGBmA0VUdkZKzjbEHs6puuPOH+xgqax4
         nLYQQQQFF9xbOkn6kuh/uhfBIjNfCWTnaRAS/g3Sbjwrn3rZ7MKUHGMbA4ASAhiWRvBD
         qVtEJe12Pe4lQN/+X+dbm8mUr54kHzrwiDWgo3MdD0CfZVBk4eswhccBpSNmwVj2op+P
         xzWA==
X-Forwarded-Encrypted: i=1; AJvYcCXDCxjAYw6UY73r9o5lT8TKb0pxCMiYeb4QbMXWosZ1JpZwOXAcj28FTSAecVw9hJ1gGDxfCEFHYFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIJYv1FTONep0q61Rg/zt7G+Fuc+HONQmsUAK+WLnm1Dk0HkR1
	+aao4Rvn4VnPhzeuFt7Gs8IEvmkWAw8atzH0+YhS621tyJwwAa1xpXBmAa97LQ==
X-Gm-Gg: ASbGncu/dxZruOGrjnFDK9jzTY4WWpYAsCA7Su041HrAODxu+vO4JXWQe9xsbA/w7i/
	Nl+gk3q9/KPmO+hZS52Ye3mtxGQybHCJ0CEVswN57OdmwHmPQYtDVNaKfPIPJ+rgTsfIie/VK7/
	XhK4uUE8KXf0wywJ+JeecGjYdnyTHK8AvE8okESK1Vxter+MDkfDute9lPyPaGgguFuXQ/BKiVS
	yT7C7wq6wvNIea8Zq4Uq3MWknifFK96VXGZ4cnmHfum0TYVkGJ0bXtsMoZUjXmX+a27UwF3V5PX
	N9QMjPeU/AbBEo8qSo9HcHWN19JxFNI/1loflNXEna6LnPBRQtt2e8A7hw1hVxwqtdi0a/r9GeY
	Y9Tfx+42KM8mLomHJOtuJvdNPswNTqw==
X-Google-Smtp-Source: AGHT+IER8Ab8A9rZogN5my0VmUvWks7kuzX9W47aIIvi3E81ZKSZY4a5l0QhoH7BBx8/GhCcvV2tgw==
X-Received: by 2002:a17:907:7f8c:b0:ac3:cad2:9e53 with SMTP id a640c23a62f3a-ac3f28053b3mr387428166b.55.1742565609295;
        Fri, 21 Mar 2025 07:00:09 -0700 (PDT)
Message-ID: <f214bbcc-6cac-4623-9027-ab77351dc2a9@suse.com>
Date: Fri, 21 Mar 2025 15:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
 <6eddbd26-88ca-4d0c-b56a-4e7abcc3933b@suse.com>
 <CAGeoDV_AU+UhkH6Pb4UhM-j+Z-VSbaoGDAg6gZqVjSAUSGURUQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_AU+UhkH6Pb4UhM-j+Z-VSbaoGDAg6gZqVjSAUSGURUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2025 10:49, Mykola Kvach wrote:
> Hi,
> 
> On Thu, Mar 13, 2025 at 5:37 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.03.2025 10:11, Mykola Kvach wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>>>  config ARM32_HARDEN_BRANCH_PREDICTOR
>>>      def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>>>
>>> +config SYSTEM_SUSPEND
>>> +     bool "System suspend support"
>>> +     default y
>>> +     depends on ARM_64
>>> +     help
>>> +       This option enables the system suspend support. This is the
>>> +       mechanism that allows the system to be suspended to RAM and
>>> +       later resumed.
>>> +
>>> +       If unsure, say Y.
>>
>> I wonder if something like this makes sense to place in an arch-specific
> 
> Maybe it makes sense, but only if we are not planning to cover
> suspend/resume related code for x86 as well.
> 
>> Kconfig. It's also not becoming clear here why only Arm64 would permit it.
> 
> If I understand your comment correctly, you’re suggesting that we
> could use this for x86 as well.

Or PPC / RISC-V once they progress enough.

> However, in that case, we would need
> to make a lot of changes in other places that are not related to this
> patch series, which is specifically focused on adding suspend/resume
> support for Arm64. I believe that is outside the scope of this patch
> series.

Considering that - give or take bugs - S3 is working on x86, I'm not
sure what lots of changes you're thinking of. In fact ...

> However, this config was requested in one of the previous
> patch series. The primary reason for adding this config was to reduce
> the binary size for platforms where it isn’t used. I also think it can
> be useful for debugging purposes, such as for identifying regressions.

... that's what I'd see as a (future) option on x86 as well. 

> As for Arm32, it’s not supported at the moment, but I hope support
> will be added in the future.

Which is another data point towards this wanting to move to common
code, with a per-arch-selected HAVE_* as dependency. To cover that it's
always-on for x86, an ..._ALWAYS_ON setting may want introducing as
well (or some shorthand approach to limit [future] churn).

Jan

