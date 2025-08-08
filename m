Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8DB1E238
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 08:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074047.1436756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGUy-0001q1-1J; Fri, 08 Aug 2025 06:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074047.1436756; Fri, 08 Aug 2025 06:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGUx-0001oa-TZ; Fri, 08 Aug 2025 06:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1074047;
 Fri, 08 Aug 2025 06:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukGUw-0001oS-V7
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 06:22:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13d418d1-7420-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 08:22:37 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso2799137a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 23:22:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c081sm1423945766b.97.2025.08.07.23.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 23:22:36 -0700 (PDT)
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
X-Inumbo-ID: 13d418d1-7420-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754634156; x=1755238956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6aXxFV3eD5Lof/Z1Tv1rnOToxgqOe+zWIms9TM3lhUw=;
        b=Wcq9Zsj8lQcRVPYkEc95ux0lcj1FcVRulVi4rrSsEYiCprya7IA4BTDfeN8dY5h3td
         mEkITT3Z7TZt47aDu7gqX4eA2BvW4Ba0jV/XRULR0OW++D7+HOb6PkCVQgDNRVq5xOtw
         rzDdyzbTE4R1gOJ1nlVx1/lJUWAuzjxAX7O7/kylv2eiGVubKdI1+dMuoWZVRbnemeuk
         j/ZD64QVrXQGbNGCBbr0UjU2uaZrazytA88oTXpRqCuLmPiNAjGzS80vW1hhIf7mWdy2
         C2GiyjvCODN7gcUy6U662LMr756Y85CifNmxeymD3ci1XSAZ1/Lm+kowa6mDNzQ5gjS7
         VDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754634156; x=1755238956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aXxFV3eD5Lof/Z1Tv1rnOToxgqOe+zWIms9TM3lhUw=;
        b=XljEKVxq66G6uk6wz2GcyEPhCwkBSZzUUNcthf+5A6aXJmA7jqswuoKpYa7e8h9t5p
         FDniDThtGZmC/Ucfv34UkEHBR4STDumm9aamndnqVBPiv5oXvdSbZVtgUfPJC5qzpGkI
         +XChVf0TpaTq9OKxNOzIqYw7p0zv128unPXCSbxFTg5G0ikwvdnC0B9r0RO5TH5TqatV
         VPPsOw/UJChTJrEcmk7WksL6Ccpy+Cnu+ymIODTHOzdocg6kWqmsZAD60Z2+zFCfKB8r
         DF3ljyeSmPezeojnal94hrROxDnPPpCk2G6zinF/UCXW/ksIPYo6Cl6VvsbMxOwLQ2cw
         vxTg==
X-Forwarded-Encrypted: i=1; AJvYcCWALMqpiDw910PaDzQ6M4a2B5EFW5ZEHwQyR2cO+9ewKLGU2mqUmayJrxKW3JmFtPiiwzBfGeiJe/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3J/HxfqD/qOZGwqWWowf/x7nF5ui3dAeblxTHitB0YvBj8BZh
	I5fg07r3cPUFqf++H7rA00Zl0zSigtXVjNgrj3QzBXownRlwg6sDt10HPHV2sStOVw==
X-Gm-Gg: ASbGncvIFYEhUk17Dh/Nv1HvkFmx9B12pAS932WffwgKiOq9BDy0nvuu9x+Xw1k/gY7
	Ux6FcaUB22doMFIwmWTIyjfllt30krYRY735n8qhCxWEI6gMzpGcG/49HYUmdjpXHa/9jBoIj0h
	Ea0Yz5fixGgoY9ZC62u8U7DajF3neI7ZMe5/viejtdPitXh1FYa9ZU0bkextYodYoaKomSkzy0D
	9CriCb1NDcwh9QXa+nb55Gab76ZHbSwXCHXTHSkVPrHaV7aQt1Q4KdZ+KMqbbGkGHpi9v3KR+gi
	yPrkfD0lZ99rmbswb77r3WREOyu2Cu66QtnhbGhQBaLtrq9voSaSnN2hUmz+IRaTrlhfNS7A6dw
	NYUkBBpM8PDfma1hdE9n694+XNROYMqnbBG94/E0f0IHjcsc/N9RPVxUtW44e87FJuFZdm0zFgo
	WLEIdGugw=
X-Google-Smtp-Source: AGHT+IHhYW/igUCOdkMxzMzlRvljMTBoWejWsxcT15amTjq9FtYzCHcKEBz2ejAyJUGBf9Pz098L6g==
X-Received: by 2002:a17:906:fe45:b0:ae6:c555:8dcf with SMTP id a640c23a62f3a-af9c63b08f4mr169060066b.26.1754634156426;
        Thu, 07 Aug 2025 23:22:36 -0700 (PDT)
Message-ID: <563a59a7-07fa-46c5-b22e-0f0318fb1c48@suse.com>
Date: Fri, 8 Aug 2025 08:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] xen/arm: vsmmuv3: Attach Stage-1 configuration to
 SMMUv3 hardware
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <f90c81d800e040db7574906fdf2ee4d57e30f2e6.1754580688.git.milan_djokic@epam.com>
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
In-Reply-To: <f90c81d800e040db7574906fdf2ee4d57e30f2e6.1754580688.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 18:59, Milan Djokic wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -311,6 +311,15 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>  
>  #endif /* HAS_DEVICE_TREE_DISCOVERY */
>  
> +#ifdef CONFIG_ARM
> +struct iommu_guest_config {
> +    paddr_t     s1ctxptr;
> +    uint8_t     config;
> +    uint8_t     s1fmt;
> +    uint8_t     s1cdmax;
> +};
> +#endif /* CONFIG_ARM */

This looks like it should rather go into Arm's asm/iommu.h.

Jan

