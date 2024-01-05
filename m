Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96746824F3A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662023.1031935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLekr-0003gX-P3; Fri, 05 Jan 2024 07:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662023.1031935; Fri, 05 Jan 2024 07:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLekr-0003de-M6; Fri, 05 Jan 2024 07:36:33 +0000
Received: by outflank-mailman (input) for mailman id 662023;
 Fri, 05 Jan 2024 07:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nS5B=IP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLekq-0003dV-Hk
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:36:32 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2426c70b-ab9d-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 08:36:30 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ccbbb5eb77so15677931fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 23:36:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cx18-20020a056638491200b0046dbee1478csm291775jab.31.2024.01.04.23.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 23:36:29 -0800 (PST)
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
X-Inumbo-ID: 2426c70b-ab9d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704440190; x=1705044990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwFpg5TZAplEfnIVtLS/IoAFhBpQn7Byi+4swrnZL5w=;
        b=L0aSgWnFodKf2t2h59Hg+fsBT8dzZXa/jTNKQbte9XKKYV2vxrC4YBQdltOKwRXcyc
         Xn0YMe+oxDWYWcLHge5YHahjSQMg87UG/yzBHycsHLSquHRGymzrKRgGq/6l/y4HKhrP
         3qN/1FwDI6618fL+l5I+dmb1op5tiXowAUlmfQNoFLLZmygwwsFdqA5NIlBcpYJ/wKK0
         ChARsxmAgrwT/uh2Psw81+rSDPQYbEAfolQwtTO1yTbfq8D3sIsVcE20DIsKXAi/+KnB
         flsvICAyghGsMr/Yk67jlhoP/J0dHF68IapzTtQI05Y/9LltNHkSQZAUZEUTHMgWQXtN
         saeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704440190; x=1705044990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwFpg5TZAplEfnIVtLS/IoAFhBpQn7Byi+4swrnZL5w=;
        b=tLdhyc3kJ22oVimwA3QPeo9U1/l3AGTjjbSFbtLYVmUhI5Wgrax3/z2gc1safgPmOi
         dqnuvRFBfUvvej+90gnU7Zlny2tbRbHpkN28t5Xi6fG91Luuz3sg9kQFIEwSrckOOXiV
         49WodjYNobk8l6gXKDbLAqUTMbwJsDwBxdinG1fbtqLgopViaKMx4IFY87teBaVkb8pF
         9X013WOAwTuWeLv2oHaQSC5KkBvicjv8Iv/c3r5jtOxD4MqfUibdisdDm9yLadbvdeOy
         FlEXjwHK2Jk0OmxDZ6w8x/ubPf0viUffi3S9xpVHFIyOujjAi/0zQ/Ptyw3jVmr14MSY
         vtug==
X-Gm-Message-State: AOJu0YxAWMBQ9UkKmTmsCPi702zCl1VX5lNo/xD6Wpu6MuXgVZNZU6Ey
	urLI+ELTWelV2PncDHo8k8sAwdEU0YO94UCt3H/ht0L6mg==
X-Google-Smtp-Source: AGHT+IHZTKqnxAQhZQM2m+lfbj7XfXSO4SxUpsy4tlYQdcaC34XR/3JA5GJtEF3QYZ6nkfpF7YiWPQ==
X-Received: by 2002:a2e:b70f:0:b0:2cc:d030:1557 with SMTP id j15-20020a2eb70f000000b002ccd0301557mr948663ljo.107.1704440190164;
        Thu, 04 Jan 2024 23:36:30 -0800 (PST)
Message-ID: <7cea57a4-c3e6-4f50-be45-e71c50097d19@suse.com>
Date: Fri, 5 Jan 2024 08:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 5/5] libxl: Use gsi instead of irq for mapping
 pirq
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-6-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240105070920.350113-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.01.2024 08:09, Jiqian Chen wrote:
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1479,8 +1479,14 @@ static void pci_add_dm_done(libxl__egc *egc,
>      fclose(f);
>      if (!pci_supp_legacy_irq())
>          goto out_no_irq;
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
> +
> +    if (access(sysfs_path, F_OK) != 0) {

I suppose you want to also check errno, and fall back only when you got
back (I guess) ENOENT.

Jan

> +        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +                                pci->bus, pci->dev, pci->func);
> +    }
> +
>      f = fopen(sysfs_path, "r");
>      if (f == NULL) {
>          LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
> @@ -2231,9 +2237,14 @@ skip_bar:
>      if (!pci_supp_legacy_irq())
>          goto skip_legacy_irq;
>  
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
>                             pci->bus, pci->dev, pci->func);
>  
> +    if (access(sysfs_path, F_OK) != 0) {
> +        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +                           pci->bus, pci->dev, pci->func);
> +    }
> +
>      f = fopen(sysfs_path, "r");
>      if (f == NULL) {
>          LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);


