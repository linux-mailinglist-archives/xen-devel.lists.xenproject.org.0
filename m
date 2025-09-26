Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF61BA3902
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 14:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131533.1470591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v27Ae-0003p1-W4; Fri, 26 Sep 2025 12:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131533.1470591; Fri, 26 Sep 2025 12:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v27Ae-0003lt-Sy; Fri, 26 Sep 2025 12:03:28 +0000
Received: by outflank-mailman (input) for mailman id 1131533;
 Fri, 26 Sep 2025 12:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v27Ac-0003ld-PE
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 12:03:26 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdc3ec4f-9ad0-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 14:03:24 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b2e168f0a75so362379166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 05:03:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa4940sm352496766b.29.2025.09.26.05.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 05:03:23 -0700 (PDT)
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
X-Inumbo-ID: cdc3ec4f-9ad0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758888204; x=1759493004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ma1Hov2ctd8oI8wauKK5aOmCv+fPLEpAOmzRhdlE/1M=;
        b=O3+hq34SvIx4AzmcDj0NFfbvkt6hlBCr7X7SmTPHhhrxT7SxEQA9tnsiHMg4Hce2a1
         Ux2M2oTWI5WFHP1Pqxj5rLpX4Hp8ZuvctaL/sVeHQ83CaccTPDlU0aJbbw2ZTLcpWg84
         87EuOJhlyWki1W+EdkfYM0TbwnOTooDLLqxtpAc48+FBoM3yLJDE84cowW6Q1yx1WMx0
         hBVaer9HPjPD/8kK1RAlV361AgnWoFLpT2ef3qJKBzmE3gGOCe6OQLkvLVBVQn/KuuDK
         RKmu8IzYmccRG1bCUjAtE2ESQweXCFa5g9FG+i/cKynDtIbQ7R3r1cZifMdi5m569/FP
         OU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758888204; x=1759493004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ma1Hov2ctd8oI8wauKK5aOmCv+fPLEpAOmzRhdlE/1M=;
        b=rC8kS5qptwRfrsYq55W8a78EKzSISmoz9zoVA2NYbzb4RN/5+uQ9acTT2IlAWwRTJh
         8trZc95VWe45F7z59KisQPQLpPAWLLTU0mmH9JX3ScIGuYBbzYQ8q9NETsu888rr/qND
         T6y3+x7fYDVOrLtniSfiYyZBASmWKgOBdZZj7uJmlBh40lQIqz7U/VqRhBrJOCtmprXU
         g5Wk3BYE95o4zPEWVBLDPQQfLQuju3lEDS4f8UcKkz2zVBETLSPCE4mGg0HW9jWoNz4k
         cl4T9Tio0BwD0kUt59FvsQpxYR13rTfdm20gPxSVFSjZaeoQhzYUx2jaVKVDuuYMK1qf
         heRg==
X-Gm-Message-State: AOJu0Yzex31YjrtAaboQkuWC2OGvSRf4ILeYa41T1NDWVhbPGIYk0ttC
	J09ynASqARy6zdxV6nhnfO0lbiR8iAo3EJkwOI2qcJR9BZE/uSbtFyi2mo7GakynEA==
X-Gm-Gg: ASbGncsxq+wrf8o5qgVWcs9KfRMMB1wsOlkrt1TXNLfpU6uhTDC+hhELVtnwWizt5+T
	MF/9Nsjwh/JWWZPf62JJNe5R3rdZVZ4Qw4JtEBSfEDGnsxskjyLEk32s+Q6P4rOVSCKkVIsRkhY
	erDD6UQ+8aDqg7PgCDsPBUsAxNlQFehcUVuDnH2obJFaZ0nr0rNtWTN/QW5jI3Kzz6vg/xHy6+k
	mNZ7cND7DH7rxj4McOi+F3EeS54gk1onXyT/XjkZnpDHGDglQB7g+f9bu3NC2rtNd0q7ESKJkr/
	Qfwwcm/VdM9cyPoxGMozwaavq57mIBhqtSjp+WnUSm3Xr2r9nJedSqlh68VH5v5xLDBMrUR8lCg
	ih+5FYyS0VyxXonmWbWU5Im7DXm/ofV1+6QSF+xUkY4QwakDA7tx7f5aUjNq1GDDc5UJjR9VK9+
	knOpn8BxGKHW5P9q0poA==
X-Google-Smtp-Source: AGHT+IHl0ml7ZLO9YnSCgS3lGe7dKhTImPhdtrcY7y9ArqexLWHoeGTkxhk9wOtRWomXhs+RbFT0sQ==
X-Received: by 2002:a17:907:7b9e:b0:b04:6546:347e with SMTP id a640c23a62f3a-b34baf43cd6mr732608766b.51.1758888203970;
        Fri, 26 Sep 2025 05:03:23 -0700 (PDT)
Message-ID: <5bf0c59c-071d-47f1-b985-5e098f30c042@suse.com>
Date: Fri, 26 Sep 2025 14:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
References: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
 <8fd7c0f5d203aa0f13cd8efe5129b6f3@bugseng.com>
 <DD2OC4H9KI4C.1F2MA94EVW435@amd.com>
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
In-Reply-To: <DD2OC4H9KI4C.1F2MA94EVW435@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2025 12:53, Alejandro Vallejo wrote:
> On Wed Sep 24, 2025 at 6:06 PM CEST, Nicola Vetrini wrote:
>> On 2025-09-24 18:00, Oleksii Moisieiev wrote:
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -481,12 +481,18 @@ void asmlinkage __init noreturn 
>>> start_xen(unsigned long fdt_paddr)
>>>      enable_errata_workarounds();
>>>      enable_cpu_features();
>>>
>>> -    /* Create initial domain 0. */
>>> -    if ( !is_dom0less_mode() )
>>> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
> 
> This probably wants inlining in is_dom0less_mode() so every use gets to be
> resolved statically.
> 
>>> +    {
>>> +        /* Create initial domain 0. */
>>>          create_dom0();
>>> +    }
>>>      else
>>> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>> -
>>> +    {
>>> +        if ( is_dom0less_mode())
>>> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>> +        else
>>> +            panic("Neither dom0 nor dom0less mode was detected, 
> 
> I'd rather have a static check in common code.
> 
> BUILD_BUG_ON(!CONFIG_DOM0_BOOT && !CONFIG_DOM0LESS_BOOT);

I'd recommend against this, not the least because of the randconfig aspect
you mention later. We also allow building (x86) Xen with PV=n and HVM=n,
for example.

Jan

