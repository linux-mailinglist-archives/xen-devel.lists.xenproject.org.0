Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4058B1ABB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 08:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711804.1112042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsL8-0004aN-62; Thu, 25 Apr 2024 06:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711804.1112042; Thu, 25 Apr 2024 06:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsL8-0004XV-2P; Thu, 25 Apr 2024 06:12:14 +0000
Received: by outflank-mailman (input) for mailman id 711804;
 Thu, 25 Apr 2024 06:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzsL6-0004XP-OD
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 06:12:12 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0e4abd0-02ca-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 08:12:11 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41b5aed246dso180515e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 23:12:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0041a0f3d92c7sm16469538wmq.2.2024.04.24.23.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 23:12:10 -0700 (PDT)
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
X-Inumbo-ID: c0e4abd0-02ca-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714025531; x=1714630331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ojANX69DqSW63oVwF5VtsM9NBIEDODm59jY064YE/w=;
        b=K9GeoK4QSFvCyPcajAT7mu67KqlFSR40lcx2v++/pRLXZSnKk7Nt+VlQvK84XCopGV
         j0a/sMRT+dRddsPk5XDPUArijHHv8MAa4KkSEA00A41PHV8FR6OipWkaFTtW1emJK4co
         D0oUZJJ52/Su5mG7lycWKhtRxOnD2NyBjJjVIh97trl50ok8arVDvAwKFNqfLqI9GXig
         FhBvkcCorBBGuHwj7hwdgusPiYwFQRZZw17pt0pbRcFM+2p7S7vyG1JMqijMlFAlGhfr
         9VN86yGBmKvs0pGxPzFvNMcXY149252GYKbFWvHA+UDiYepUEGvXMMWfwFJqs7f6OKYd
         637g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714025531; x=1714630331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ojANX69DqSW63oVwF5VtsM9NBIEDODm59jY064YE/w=;
        b=wgYwUax4nQ4jTP8iHxDUuq4GqR09H+5rJY/aVCjq3GOQdd701Chw2j3PrZlC330Xed
         JTg/fgBTpMmPkbLaNXY+R9tIzbQM4B5BRNuy5vALATvWox+Q2Do2dGpnlrtASscnjo4F
         6hfkil+VE+WORX+WpOTsdvZIZRibaFaagwGMKprkx3j3YOu72eJGSJkJD1pY443LGt+s
         3HQiCqwOh65H6iVOvCarlVynhAu9uaW/mUOPodxaYDC9EgNadrWHsWN7ZXmwh/xT/Ocw
         rCHOhZhR03o0/ptgxUmMeN582P60Xpy4VaxIe8GIPO//YdhQSkv8zBh7EKlbuKHtjQbr
         1+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV96ao4NmRcdW+0MtpFOeyDppnfTt0KHAczXvbZBKN+Ekik1lGLep4Gjdz0YJ/75a+VndTKSWYtSp65rwa5Zav3dsDFrmFSy1i0dbWTBA8=
X-Gm-Message-State: AOJu0YzHvhV2lWs/pwFZfmfptMjZpxDmi/op/EhVL42u4+DRPUVx/Bwt
	oID/4ZssGAcNFDfvzZYXSQ/WjqsL970KBvIPAACRHrLU5XC/MEmkkGw8S0Aiug==
X-Google-Smtp-Source: AGHT+IGeCKoaI2xJ22QSJAgXKsBcsnYOD5HGoqgtBXiHMsijpcZzdTXDR6reIJA0ngOerZixhrI5hQ==
X-Received: by 2002:a05:600c:4f03:b0:418:ed13:315e with SMTP id l3-20020a05600c4f0300b00418ed13315emr3210977wmq.2.1714025530631;
        Wed, 24 Apr 2024 23:12:10 -0700 (PDT)
Message-ID: <9861a2f8-4a16-40f1-ab10-583101f922f1@suse.com>
Date: Thu, 25 Apr 2024 08:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240424191826.23656-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240424191826.23656-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 21:18, Daniel P. Smith wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Xen always generates as XSDT table even if the firmware provided an RSDT table.
> Copy the RSDT header from the firmware table, adjusting the signature, for the
> XSDT table when not provided by the firmware.
> 
> Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')

Especially with this tag the description really wants to say what the problem
is that is being solved here. XSDT having superseded RSDT for ages, it seems
unlikely that there might be systems around that are new enough to run PVH
Dom0, yet come without an XSDT. I can only guess ...

> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> 
> This patch is used for development and testing of hyperlaunch using the QEMU
> emulator.

... that for whatever reason qemu doesn't surface an XSDT (at which point a
follow-on question would be why this wouldn't want dealing with in qemu
instead).

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1077,7 +1077,16 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>          rc = -EINVAL;
>          goto out;
>      }
> -    xsdt_paddr = rsdp->xsdt_physical_address;
> +    /*
> +     * Note the header is the same for both RSDT and XSDT, so it's fine to
> +     * copy the native RSDT header to the Xen crafted XSDT if no native
> +     * XSDT is available.
> +     */
> +    if ( rsdp->revision > 1 && rsdp->xsdt_physical_address )
> +        xsdt_paddr = rsdp->xsdt_physical_address;
> +    else
> +        xsdt_paddr = rsdp->rsdt_physical_address;
> +
>      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
>      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
>      if ( !table )
> @@ -1089,6 +1098,9 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>      xsdt->header = *table;
>      acpi_os_unmap_memory(table, sizeof(*table));
>  
> +    /* In case the header is an RSDT copy, blindly ensure it has an XSDT sig */
> +    xsdt->header.signature[0] = 'X';

This is in no way "blindly". The size of the table elements being different
between RSDT and XSDT makes it mandatory to have the correct signature. Else
the consumer of the struct is going to be misled.

Jan

