Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D3AA95FDA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 09:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961750.1353083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78NO-0006aA-3Z; Tue, 22 Apr 2025 07:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961750.1353083; Tue, 22 Apr 2025 07:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78NO-0006XS-10; Tue, 22 Apr 2025 07:49:06 +0000
Received: by outflank-mailman (input) for mailman id 961750;
 Tue, 22 Apr 2025 07:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u78NM-0006XM-1a
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 07:49:04 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cdcdae6-1f4e-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 09:48:53 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so43403875e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 00:48:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acd08sm164234765e9.12.2025.04.22.00.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:48:52 -0700 (PDT)
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
X-Inumbo-ID: 3cdcdae6-1f4e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745308133; x=1745912933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fc1WsV9CBrIkhgp9ADyKaekSoaAxJ5WKoDeI5lDbYE=;
        b=KZLa4S8xuyetm/PUArc5IVFA+qBVjMEsptHm5q9PVNvpadAAH8Vjia8A5iEkqnsiTQ
         a33MdZwyq6MhDsL9pFCmldDpICTE3jXpE+df9bk6hWjgV3rRIUX5KCVS+1B6hMhkRXAV
         m5emBaPmQ/MtDNHH2vzSzzXhcEsSjUuOHrEd9FwqwSaJkm91qKuRZ8K2AtefBztPLjRL
         c99NQEvMIDQPoVeUPUT2gbabmj7Ctkf1GkBYSlo+14Cf5cAPvB8P7BCpY5aBeipKB6HG
         7Fpq9VV2yyFLZGT8m+bH0Pf4z23zwWYplt80ubqK4k8//YxFM8TkkluKPfXe5zqdBOdQ
         WrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308133; x=1745912933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Fc1WsV9CBrIkhgp9ADyKaekSoaAxJ5WKoDeI5lDbYE=;
        b=ujyiW1zLuvZ5nbhFfTjimvpqHOWIWp68lb/fePSwY520JKiIZXw2RD/pFya7bO52Qk
         2pdGnbk5i7wp/IOZoCfnhlWXLnyEmmOWuGerv9NcmxqrJAaAaMwSBrqOAzoJXvWE53SR
         HgCS0QNx+I62wEZIWHqbXe/wtOUpPW5D2amSTbSA+cRvDoxneEGovpNJiwNPpry4iN2Y
         tf7kgJTheIRuelmPxB6+ldkdjPHkQ93wPvyEV4+UR5A4Wo8VaQ3AaYjQRCKeQf2CoFKW
         /9C+G0i+PB4gA0nhMDtFVnACqpdabRZ42l6u6WianIzMmLFTaeTlk3SXBHnEP0EtSwNL
         kySw==
X-Forwarded-Encrypted: i=1; AJvYcCUv8qDTYT1zwPoxsRfhfSZDrJV/fWxerdJbOMx7y0WpWLC9VZWyg8qWCpo1oAuHBB+2Ri0y4BUdKpU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5NYjJDWjblbXUWv9zvI5x5XifayV8RT6QV1jvQYUdKVIcGB4u
	rJ1GC+JVO5xNgXNktqkiYmNlmbBbE4R2elMJ+Q4OrcpW9qaBCtCAH5sxnIMW1w==
X-Gm-Gg: ASbGncuMtpo/zVIAVip0jN9Sg2GMlDBvM7fIRY2N3sJO2tzB3hXVfFWwXUFCNnhYcLb
	/0tvTDwKp8BcSuirLmD+IawcVLgHw7RoN/yve/pw4uRmtvyGGGkYrUVWhk3m1gil/YPooB1E4Jo
	99Xx2k+EFSiihc7GqgunGDQCK+zScFkGpAopxQ1sfUQ5Ra1uJDiO3I5h6XDgkYx+JtziR7/3fqH
	ztU1uyUv088Td7xwanh7aQ37+rEAOmD9rRtgAqX1YidHtq7YUWqiztUNR+esvfwV9WwP87SF956
	61HuYRn+w3DBZVm25op/GWWqwvhdsl8FFBqwHEzH8vvKFiM2IQhDDAo1Qi9E7SiR+IlnBgrrgse
	qW9cjz0B5kDgH2YMocjc4bOd1wg==
X-Google-Smtp-Source: AGHT+IG6+GXbNlVFXxE84ak8wV4rC3HD52rDJfYpkpoGP68i7Mm+mzQ548KefYr0eqLp43AXXmpcYQ==
X-Received: by 2002:a05:6000:188e:b0:39c:1258:7e1a with SMTP id ffacd0b85a97d-39efbb0c199mr10272367f8f.59.1745308133284;
        Tue, 22 Apr 2025 00:48:53 -0700 (PDT)
Message-ID: <40bdb025-f625-4494-9d0c-81003faaf8cb@suse.com>
Date: Tue, 22 Apr 2025 09:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250418185840.335816-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2025 20:58, Stewart Hildebrand wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -174,6 +174,41 @@ int vpci_assign_device(struct pci_dev *pdev)
>  }
>  #endif /* __XEN__ */
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +static const struct pci_dev *translate_virtual_device(const struct domain *d,
> +                                                      pci_sbdf_t *sbdf)
> +{
> +    const struct pci_dev *pdev;
> +
> +    ASSERT(!is_hardware_domain(d));
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
> +    for_each_pdev ( d, pdev )
> +    {
> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
> +        {
> +            /* Replace guest SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;
> +            return pdev;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +#else
> +static const struct pci_dev *translate_virtual_device(const struct domain *d,
> +                                                      pci_sbdf_t *sbdf)
> +{
> +    ASSERT_UNREACHABLE();
> +
> +    return NULL;
> +}
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */

I'm not a maintainer of this code, but if I was I'd strictly request that the
#ifdef move inside the function, to limit redundancy. Even the "return NULL"
is common between both forms.

Jan

