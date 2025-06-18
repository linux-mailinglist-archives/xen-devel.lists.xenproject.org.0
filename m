Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C2ADEE78
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 15:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019163.1395972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtDo-0000cl-Fm; Wed, 18 Jun 2025 13:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019163.1395972; Wed, 18 Jun 2025 13:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtDo-0000b7-CU; Wed, 18 Jun 2025 13:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1019163;
 Wed, 18 Jun 2025 13:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRtDm-0000Yo-4H
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 13:52:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 895896d8-4c4b-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 15:52:56 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4530921461aso60294375e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 06:52:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1643e9esm10980563a12.25.2025.06.18.06.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 06:52:54 -0700 (PDT)
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
X-Inumbo-ID: 895896d8-4c4b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750254775; x=1750859575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uc5JZqp0KcBw5BZMhGtpho3x8L9wD59HzL+T1EuClLU=;
        b=D7HMieMwdwV1hHEE59kGLNbUCPraC0s0mF9LXtbf31/2fYYo6NQn3vTzOFOuVdIOHz
         2kTKtPfZliBNkmOmgtNjLmbEJ4IfEdTptPLYbnnSERn9s2YX05XO1VzIJ8EGFkZde0fC
         kbxfMM7kJaPxurX97966fD/Z7y+2psWS3NB1UFzashVgmSpsG5xTMTDgDAIlyucIo8zu
         ciIMWy2Pb4p3xja5IZl0NieXlvJkbSKxPm6ENxAfLYKD7wqmsE5nUQVFKFUsq/F4nNyN
         dF9JKvn3UFBmjhWWSCoE4RRBjjqBTgmXPmsFwjRH96G5e82hc+GbV+JkCLR05qVbXCHQ
         ID9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254775; x=1750859575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc5JZqp0KcBw5BZMhGtpho3x8L9wD59HzL+T1EuClLU=;
        b=lXz49UOxz9P/45b1C90LrGvak0Npiq4aypAGHBFDyn3XyMatB7aIkYn/RXaLEt+COU
         +PT2ZIlbbdvAm/+hpC3cPdScY59Y7tvpDsgcGo0Ik/3wZP1apeQ6WCEVGh5fsq81UFfd
         m96jz/qlPz8yCrhSPn0D77YqwiWrkKJ4zsL9P/Vy2hXntXKc4FYgrUbOQaRtbvvIp1Bk
         BirVXUWmdMM4nTaaf/9nF02PYWsQsdUbZJxpFGcy+1uq/GOaT4DkPAHlvgNpDaE8CBMu
         i3Ac77oGGb7IsafIGMBPKw1oX4ZYJhzXrkrBn1tAlDxklKa4xSbYuUWlcaAQZckHUmpe
         IKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5XU7rCdv3SCieGAm7NzF8BjV3asl4X4v4efItSb1EFFTTvBK0QVDrKlDBGpNQSlRFOl3Nq1c21Ko=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywul+q6epa8vjial5QovRDIAevceQEfbeGRQmFR4UccAwZiDHth
	qS7TqZ//Y8CKp+UnNMgU7y+Qsx/F1WIKLxieXlvRe99vUT2yaM9nLIH6ColJqUY01Q==
X-Gm-Gg: ASbGncsb3Tms7nnKExO0hYQg5o8Ts7iTXMG+f0Vz/mdQt93gyFvM3/f2s466BJ/8eoG
	1Jx9vRk4hprut2YEa4EDyMIoiiTp8cS3kIdFUHPtYOg/CkmyJ4YwBLCrqJZJISJv7YWuIgLIrmx
	UHafBQAlbAaWYafHcJN19c/7cwdXyYIOrObTjsNX0XN1bhq+RVK5bQdIbSd1aG617P3VeseAgyl
	FEbhwwZ3MSurppKk0tXH9axIj2WKVgjqc1Hs9w75X9LkDhukuyMrrdPSTIGvJpOKm2lEjGtGiZr
	NwTiliBZPSm/MTzUq1YGjuudGhmgK92Y5Nz4pUAlfwc1arwvo4eIf1rOpTrBs7HUj//oh+0JtZ6
	tE0QaD7Xo5uixsYWuYm3CfiIEK3+IR79tEpHDUBqMUbiyn/EUbD3NuXrZKg==
X-Google-Smtp-Source: AGHT+IGRYtbnGOvhggfbKkeWFzYfUjp9wqSSFxhrMYvveqq79veznrPNtMTGZGIFjxip74NZIrQ8Pw==
X-Received: by 2002:a05:6000:1887:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3a5723a22d6mr15087661f8f.34.1750254775356;
        Wed, 18 Jun 2025 06:52:55 -0700 (PDT)
Message-ID: <669877f5-ef34-4552-9cfc-e097d40d444a@suse.com>
Date: Wed, 18 Jun 2025 15:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250612092942.1450344-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 11:29, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -836,6 +836,42 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>                                    PCI_STATUS_RSVDZ_MASK);
>  }
>  
> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> +{
> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +        /* Extended capabilities read as zero, write ignore for guest */

s/guest/DomU/ ?

> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                 pos, 4, (void *)0);
> +
> +    while ( pos >= PCI_CFG_SPACE_SIZE )
> +    {
> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
> +        int rc;
> +
> +        if ( !header )
> +            return 0;

Is this a valid check to make for anything other than the first read? And even
if valid for the first one, shouldn't that also go through ...

> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
> +                               pos, 4, (void *)(uintptr_t)header);

... here?

> +        if ( rc == -EEXIST )
> +        {
> +            printk(XENLOG_WARNING
> +                   "%pd %pp: overlap in extended cap list, offset %#x\n",
> +                   pdev->domain, &pdev->sbdf, pos);
> +            return 0;
> +        }
> +
> +        if ( rc )
> +            return rc;
> +
> +        pos = PCI_EXT_CAP_NEXT(header);
> +    }

As a more general remark - this is imo the kind of situation where using
do ... while() would be better.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -267,6 +267,12 @@ void cf_check vpci_hw_write16(
>      pci_conf_write16(pdev->sbdf, reg, val);
>  }
>  
> +void cf_check vpci_hw_write32(
> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
> +{
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +}

Iirc we've been there before, yet I continue to wonder whether we're doing
ourselves any good in allowing writes to something that certainly better
wouldn't change. Even if we limit this to Dom0.

Jan

