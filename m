Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB18983915E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 15:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670495.1043312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHmL-0007IJ-Dp; Tue, 23 Jan 2024 14:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670495.1043312; Tue, 23 Jan 2024 14:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHmL-0007FX-Am; Tue, 23 Jan 2024 14:29:29 +0000
Received: by outflank-mailman (input) for mailman id 670495;
 Tue, 23 Jan 2024 14:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSHmJ-0007FR-Ro
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 14:29:27 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce538e02-b9fb-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 15:29:24 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cdf69bb732so46208161fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 06:29:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 eq20-20020a0566384e3400b0046ee630f7e6sm1128876jab.68.2024.01.23.06.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 06:29:23 -0800 (PST)
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
X-Inumbo-ID: ce538e02-b9fb-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706020164; x=1706624964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/pVBQV0OnfutPDX+eXse7QjVivNya4UiKymNinMK3M=;
        b=ch0N74JVNtoNRR1/7KQCzVpEotihxjgfl+RggXf6QJV+kywzwbmRyILKknOFn7zKN5
         6YFZ9dGqwmX+JRmb/V4K62y9FM+ZxGd2xHrB+w+nruiO/JeJjy3iIW+52hHduN3CAcW5
         Trapp4xxnMQZmZz3pxjf5/jRW68yVTpoVc6sV5J37PoEhLkImiKfmlTT0Z8mLaaXDpPA
         JKhDv5X0Q75eD3INoP0fmNjN1Mj/RumtzzEzCZB5xYfnjK43D+rnCJHnWLUFp1czfwwz
         7YRF+KoLWxvIkRHo6/H5iBDbqceceYUMzPW4QKZ/5WrhhVmQbj9beAUdsy1iNTx1+is0
         xRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706020164; x=1706624964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/pVBQV0OnfutPDX+eXse7QjVivNya4UiKymNinMK3M=;
        b=RRd2lb95CY78QssUwuZJ+ElBiOS5eIofkGmh+azCzYLBR7XtwWE1rO2gibZILPvjvP
         XQ+WBLdy6ti93BK7nl1XyR+hv3R2k+DHpJsF53/i8IFtrTyyMf9KvNM0NvLQ1+yab2Ro
         vd8x59KNtDVtJ6pTsmttNzuO/a26p3d5W/LrdQm5DVQcCa54TIpMQkyD5YpJfrt2vTim
         /AR+yKtc1Nwm7wFhF2WXXmVV/DiKt62RDpQUA9xzcFjZeTdv6xSWxX5nqRXVII3IdpSt
         HuWs+C1Tunv+NLBQoA7A+BrjyL/x9Yja1S+0gLVKNAAWMAxPls2EQgek8jI2DOEZcFqH
         Ov3Q==
X-Gm-Message-State: AOJu0Ywbpnu2hu9kvgNEXWm/vWeo6+QutjFwm9WRVqEV2uan6O9cf7iZ
	wInUXzwsR8ziMuy93v8LqX/9WwdfCZbGOplJiKfyL5EItlMp50O6f0KbhQbM5g==
X-Google-Smtp-Source: AGHT+IFw7v0OoMTVWg72hL46SOuQp2O9cG7xPW67ymEWDERvSejqkVr0xP4G/7vn3PtKCSa/P56y/w==
X-Received: by 2002:a2e:b706:0:b0:2cd:4fd1:92d7 with SMTP id j6-20020a2eb706000000b002cd4fd192d7mr1240974ljo.178.1706020164164;
        Tue, 23 Jan 2024 06:29:24 -0800 (PST)
Message-ID: <7e936e6a-3218-4c4a-ac68-a58cd363a11d@suse.com>
Date: Tue, 23 Jan 2024 15:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240115194309.45683-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 20:43, Stewart Hildebrand wrote:
> @@ -1043,11 +1043,11 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
>  {
>      struct msi_desc *old_desc;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev || !pdev->msix )
>          return -ENODEV;
>  
> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
> +
>      if ( msi->entry_nr >= pdev->msix->nr_entries )
>          return -EINVAL;

Further looking at this - is dereferencing pdev actually safe without holding
the global lock?

Jan

