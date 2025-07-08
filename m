Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A327DAFCD07
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 16:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036642.1408895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ92O-0001Nt-Dq; Tue, 08 Jul 2025 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036642.1408895; Tue, 08 Jul 2025 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ92O-0001Lp-AW; Tue, 08 Jul 2025 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 1036642;
 Tue, 08 Jul 2025 14:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ92M-00015h-Dp
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 14:11:10 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60b76b8d-5c05-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 16:11:01 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2305681f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 07:11:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450dcfsm11681077a12.2.2025.07.08.07.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 07:11:00 -0700 (PDT)
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
X-Inumbo-ID: 60b76b8d-5c05-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751983861; x=1752588661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h2sO3vdZ+oCzCElKdUuyBYjK/9V9wsgCChcp8tfIxGo=;
        b=XKmBVPtltVhdd5RJBpKryH/C0Yp+oY0/fzBZmtaiVR37ci4V9Sow88vW2TRwQ1bA5i
         gtuelYM9qWY9KZJ4P4VVCOEgIOVPOZ+/2kZUnnckcAsvcJ7fz5RU6ftNgzTmYrDarTKR
         FnkcLuzaP4+BH7TP/bmIA7LpgSwydU4z2bywzmrIl3pQ4cSkE5mDx5idRtyhvhtgRjuZ
         3oI6A1niAN0xwWQcl5I1oM4+8LrZB9qOdkfeyIn/TLh6exTXptnQ9OzbkjyODSvtzsf0
         nnJ3miYcuFqlqE3g2NGzcy7E0gXdP88ONjr3iU/Qf2uZQJ1I6sPD4xwEIQUMAUYPTRCz
         qgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983861; x=1752588661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2sO3vdZ+oCzCElKdUuyBYjK/9V9wsgCChcp8tfIxGo=;
        b=HKt6A87zP5hRC4fW6B26M5hrirqucmHDkrrBB84NE4r1I0JOTqOn7qTwtHmXxDK3hn
         6XUmO9dEjiJu/FcDCCp6nK7ITud5T5TOQAakxmb2j/zImfkGLHYGNyAzgA+TOXjEGCsL
         Nm2P/o2MA7vFZeXxCGsNtfFEe2txoI07IAbnQ0nVbBAA+4NRlVH/L6riB3tQD4g3CAc1
         q44vq1j2qMcN/okKWjp3GHpYyMq9LNSgMoucgPmOL72sCAxeUVttjMSr6a3ogF0MlPJR
         6JdnMn572KNeJifTw1N6QCRhdhF4TKKAWgOXWnsWWxl6s+uHLcAn/xlfqZq96NvpmD2X
         vitQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPgDaOqOMTWf6xd5TBuFJMKVHCeNvpAN8rZK8jgDQRR/Y5uHCdtVgq3pL6GIPS/FPZ+yXyuOuYvzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrSMgWz0h3IoniOOKruvpaUDTlfc3OTHvr6d1p6mkYPMo/1TI7
	VORSbW9t/fj0CnCQ22PY9yBNSKugx5B41GJVE8BNzp0CvkOBIUdl4HExMjT9TMl89Q==
X-Gm-Gg: ASbGnctLO4dfNaV3bAjXhxQCcgCn1hKXpaagQ9TMUSzmDB5LIv6N6jtzwYTOTqb2cho
	UreSbTG16ux0dYTRDdB6E24xzW3p++tvBij5QmVAnp6Zq11txR6AkONjwJwHowAvfsKOPfKKEHC
	dq+cURhGjP+EXBemN3vaW7wD4xojS5D59bqWHwreTtOeeq9PuLUkhBn9p1s5QDrcVJSYmeZ3ORC
	UBQUvVuMgNQo4YEPT/y1SL+EZI3XQUijaAFosdlqw/vfZUKD8NdWUagrAH/2vYRhQ3uiv4vuND+
	LWnXeeVG1VXUDD+24W9rKUmL99YVEuO1ncDARHLSLFlKIQ8gjX3yNUXNrpDTxBMk6QbbXPGd74o
	ZaOxamKbEocRPpAVoNzGQr387/E+FVoKBIesd4Nd5Wc3rVX8=
X-Google-Smtp-Source: AGHT+IEUdwUby3S9iwnXv2MRIh0VC+sgMin8GqaFaH8t0E0WPvgI1M36NXbF47tfH03gUQBTh/PcQQ==
X-Received: by 2002:a05:6000:200b:b0:3a4:f7db:6ff7 with SMTP id ffacd0b85a97d-3b497042f05mr12879974f8f.52.1751983860938;
        Tue, 08 Jul 2025 07:11:00 -0700 (PDT)
Message-ID: <dd44b55a-eb9d-454a-836b-25dc7195a5ac@suse.com>
Date: Tue, 8 Jul 2025 16:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250704070803.314366-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 09:07, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -836,6 +836,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>                                    PCI_STATUS_RSVDZ_MASK);
>  }
>  
> +static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
> +{
> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +        /* Extended capabilities read as zero, write ignore for DomU */
> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                 pos, 4, (void *)0);
> +
> +    do
> +    {
> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
> +        int rc;
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
> +                               pos, 4, (void *)(uintptr_t)header);

If it wasn't for this use of vpci_hw_write32(), I'd be happy to provide my
R-b. But this continues to look bogus to me: What use is it to allow writes
when Dom0 then can't read back any possible effect of such a write (in the
unexpected event that some of the bits were indeed writable)?

Jan

