Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64073A656B5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917273.1322243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCod-0001gJ-E2; Mon, 17 Mar 2025 15:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917273.1322243; Mon, 17 Mar 2025 15:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCod-0001er-AH; Mon, 17 Mar 2025 15:55:47 +0000
Received: by outflank-mailman (input) for mailman id 917273;
 Mon, 17 Mar 2025 15:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuCoc-0001ej-4x
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:55:46 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48a1d710-0348-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 16:55:44 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so2796316f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:55:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318aa1sm15793970f8f.64.2025.03.17.08.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:55:43 -0700 (PDT)
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
X-Inumbo-ID: 48a1d710-0348-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742226943; x=1742831743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JlzNWE3v0mQILIP8p/5YAa+OZsRJdvHjlrZEypFKFNQ=;
        b=FIgqTH/ZuFxlDboFeGTMo5tBiVW1b7YQ8GLZ7Wk93wPSakGrrywzJN7Ejg8uFCyiKm
         tKF/SxUNd9ZbMW74qRJ2EM3/vdnIoGS8bBs2D6sNI/89cU382pLuQBlQSnK0ZqdoJxMc
         ddADosQnkHtwY83jM+2Cfb5LG0Yla/XUw90tT9ydXYhfkp6luc1qmT7HnbN2JZnIELEs
         5yAPuze2vL05A3rG9HcMl8SyPZ31VaZNS/TZP/3ADoKS5UUku95suEXWBlAc/oWKId40
         4NqFdzqthGDcLWse16dx/ItyWi7lKvzVwEoi5JQz1VrBpxMxMaU3xhZyLRe2ouf/97XJ
         B/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226943; x=1742831743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlzNWE3v0mQILIP8p/5YAa+OZsRJdvHjlrZEypFKFNQ=;
        b=vorb1orVX19t0x+5djVcMmKbIgAMmezCIAO3KygpDqQeYvQ//z7gBHX0tv7817GCo9
         /+UxnbZbExnM4dXCv36Hk+6/eiLTURUL7RK72HHCLK40CVBtxn9ZcrDRZZgXhLuVGm/y
         8trJ+l/7gzdKyRt7KC+ceJ3KbQptCD5QLOiSgUMws6+RWmGDkq6uAZH3yBnBNtruhlc0
         tR/xi4iUHEUgbodAnMC1vmMnpjg5tJD/xoOmKYLU/SeI8z2Yax3+YBU2XNarLNC7UKvo
         PmSRRxF2Pzr6cUjd6zUx4GxGa8g6Hca3jMSDqJiifMpCkblL7KVY+CDZxCvS1Sa1zVvt
         lNXg==
X-Forwarded-Encrypted: i=1; AJvYcCUnnHvGs5YsJuSxSTgeZ+BZVCxJFe9GWF5wsX4ENNC6WCGRy3oV1W2NmCCwJnjBvKGNH8SDWkyTkqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkQXpXj6qmDVzF5bND9xIjveix/hUbm2doRjio/0ZbFpDIZ47P
	vU9xq2GZy37wpbHidXes0HwQFLKMjk/025DYhXw2AllsYYXi4Ae3yb68XEPYRw==
X-Gm-Gg: ASbGncs/HB4WH3gA6j4TZtpfPagzUrAyExApPLBpUdYT4GI73M9Ss9GJQVz/CpUTllm
	Xp2sSD0DNLXPWNDxasfi9+GTf7UHw4Bib1VsRO5UYF7IBBGZviwYGKyM+YAvv/FIILQMzX3aCFK
	bq1pQX07FW/jiZgtxNyObqaDI98CwytLTrBWCVeqy99jDlamR2EJuThvX9W0khrEyisbsxyYXTd
	x0PNmhgIS0meY90WoIl5tjhO2QuGqBHDIYOr2J4PcAnBmPKqvRgti+nSdTWo80lf822rHbMZ1A3
	r06xBQ/8lUJ1RjH7R05NgnkEoFnVspf+AkQ+5xFiy5rJ3DGuca6K/Ou9wnqJo3PTTddehjpQxIB
	FDxrb6m9ovD1x2yzwj3aDeQSn1Ie+MA==
X-Google-Smtp-Source: AGHT+IFK1Hcrpx8aLNjnPP391o2BF2UsxtKX09tF9DW9W5N16977HF3oFEfiyEszcJNZ1RwYUOIjwQ==
X-Received: by 2002:a5d:59ac:0:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-3971a58ba2fmr16745217f8f.0.1742226943495;
        Mon, 17 Mar 2025 08:55:43 -0700 (PDT)
Message-ID: <0fffaa65-f32e-4d8c-93c0-8799efb0c9c0@suse.com>
Date: Mon, 17 Mar 2025 16:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1742063500.git.sultanovandriy@gmail.com>
 <73295790a1df8f4f1406a8e86e7c81a98cb1d3e6.1742063500.git.sultanovandriy@gmail.com>
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
In-Reply-To: <73295790a1df8f4f1406a8e86e7c81a98cb1d3e6.1742063500.git.sultanovandriy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.03.2025 11:08, Andrii Sultanov wrote:
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -77,8 +77,14 @@ struct amd_iommu {
>      struct list_head list;
>      spinlock_t lock; /* protect iommu */
>  
> -    u16 seg;
> -    u16 bdf;
> +    union {
> +        struct {
> +            uint16_t bdf;
> +            uint16_t seg;
> +        };
> +        pci_sbdf_t sbdf;
> +    };

As before: I'm firmly opposed to this kind of secondary aliasing. It's bad
enough that we have something similar in struct pci_dev.

> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -730,7 +730,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
>               * the same alias ID.
>               */
>              if ( bdf != req && ivrs_mappings[req].iommu &&
> -                 func(0, 0, PCI_SBDF(seg, req).sbdf, ctxt) )
> +                 func(0, 0, sbdf.sbdf, ctxt) )
>                  continue;

This looks unrelated to the struct amd_iommu change here? And this is a
change I would ack right away, if sent in isolation or combined with
other, similar changes.

Jan

