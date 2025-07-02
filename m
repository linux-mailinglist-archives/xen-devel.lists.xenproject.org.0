Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3DEAF0C7E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030339.1403981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrnN-0007dM-KO; Wed, 02 Jul 2025 07:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030339.1403981; Wed, 02 Jul 2025 07:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrnN-0007aW-HJ; Wed, 02 Jul 2025 07:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1030339;
 Wed, 02 Jul 2025 07:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWrnM-0007aQ-5N
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:22:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 474cecdc-5715-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:22:15 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2224991f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 00:22:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f218esm129667985ad.78.2025.07.02.00.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 00:22:13 -0700 (PDT)
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
X-Inumbo-ID: 474cecdc-5715-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751440934; x=1752045734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sWRPtHqJFJuIJx/fKWcsIGUFeSxRpKkATCXEeuO6H5c=;
        b=gQUwIPJoRLE5xJ2AvP6Y+Uz7RwZ33wbj5gMJUG0RhbF+He76BiM0XfkxAwhXOsleCl
         xG9pTdMsqBjtSojVwVQCwf54AQCMiSMxr/aU7JTSeBQzaNxHM5SEZKclst8fLJa8ezQW
         vVYJ8u9h7WWE5+794d2HhoR6F3ajtBNw6zZTwJeYUEsUSGeXxXuxtoE5/fTqAc0wxWaF
         mSWAHTknuVpfacKcCK3QlDLVreGYoiQShyUt8zLzb3WeFs/OjkSCgOmTivwqmkfHlUPe
         bRb5pe9J0vkFhNOm/IiNSeGgDdrpSIGr6jq0yUK+xfV/Eahh5rUgJV78Ph62QkAn2Wr6
         9sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440934; x=1752045734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWRPtHqJFJuIJx/fKWcsIGUFeSxRpKkATCXEeuO6H5c=;
        b=EwES1BXEdWGw8l7ykQIuZuFeIfKda4GmjzXG6GABTeP89z8k2osj2IWrU50UZJvc0u
         jBHoRu8XEK1zwxkID3kqHa2qoBSI00ojrF92OCWAYM7dnq7wQtaeQa01FyxLQkPcyF0d
         r42d3+SfbAMFTvk3pwWnq821f/mioWV4Sqm48XZ7HQm0gVwcs1PSgDKE1ZUFWz9adRCR
         fBM/KgoBE9hyDKa7SYSk686qx22KNqBV4mN/PMtnxUGMBlgPdhxW0aGZ5XN8vQiehTwF
         WatsHgDoUjj6lZT8NF0L2pPKizQ6kzr10aGZRKAj+P9TC4aOnctL7eR4Ewe+IuuXVSHH
         em8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3fWBW+UOAz+tdLUIaFa8Fxi12/7dxHCx521iyaIFFI2xIMGV/fF7MrxQiTvf90R5UO/I4c6QsVB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvsbvjVoUu2UCdqD/AG1oHUkwtQ5bHlEL93b3/rxaA9oEuPGee
	ZvXf64rvJMviYLcNzy4ofJ0PGhLx3tQeND1vziixgXDgr2dJcYUUb2uKEhspDknXLA==
X-Gm-Gg: ASbGncuInyhc5eF1aI33rs+5RfSOAMG6AR+ISgt2ENxfPvBygeIaSZCvL6f4bigEp2U
	UfMsgbOoGUgjNXLB5tVKperMIRZ4HvFK9noN8IIPEUPOOZX5DA+Nni+jhasrvQJEvIQwHEOHbHB
	VAbMtjDknpKt08gUEya+3AgdadH/xDJ1mcF7sctUCF8+DVj0zVZUvjxB4nvPlvVzgEV0bnWvwYn
	TLc09LPdFqPm9BtBawCcj79jsXsbihGIRcIToo1UyFcOzZkYhR2hMTNte4mJ8H+jdwWP2ayg8Bk
	GSeVxAmKb4/L9B24nS/ixh/WnLbdHCm1jJ1ikbZO62CFfMCEp/uXXiRKcgOsWfsGEnGGUdJVHqF
	VNd/+Ul6IZwzrXS8kBuYt8PINAb2EQDn7B58mt79gYmkKkEI=
X-Google-Smtp-Source: AGHT+IE1yGlvEff/UeMjtwyYRncjWXq69zDdEXqHEQ6p2cqPuooEHKjMjJff6ZAyTwPK+zZZO2/gIA==
X-Received: by 2002:a05:6000:5ca:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3b1fdc221e6mr1029695f8f.10.1751440934457;
        Wed, 02 Jul 2025 00:22:14 -0700 (PDT)
Message-ID: <24bec42f-b23b-47e0-bbd0-c68eba1916df@suse.com>
Date: Wed, 2 Jul 2025 09:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
 <88a7dc50bdff2ce9cb0f10a66155ae558e11cf50.1751439885.git.mykyta_poturai@epam.com>
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
In-Reply-To: <88a7dc50bdff2ce9cb0f10a66155ae558e11cf50.1751439885.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 09:10, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes". Due to possible platform specific dependencies
> of the PCI host, we rely on dom0 to initialize it and perform
> a PHYSDEVOP_pci_device_add/remove call to add each device to SMMU.
> PHYSDEVOP_pci_device_reset is left untouched as it does not have the
> pci_passthrough_enabled check.

This last sentence looks to be stale, now that ...

> Because pci_passthrough is not always enabled on all architectures, add
> a new function arch_pci_device_physdevop that checks if we need to enable
> a subset of the PCI subsystem related to managing IOMMU configuration
> for PCI devices.
> 
> Enable pci_init() for initializing Xen's internal PCI subsystem, and
> allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> hmm. Since
>   dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
> Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/include/asm/pci.h ?
> Not sure if PPC/RISC-V will plan on using this check.
> 
> v11->v12:
> * add enabled checks to pci_device_reset

... you've done this. Which imo would better be a separate change (where
here you'd then consistently alter all three places. In no case can the
addition of that check go without justification, imo.

Jan

