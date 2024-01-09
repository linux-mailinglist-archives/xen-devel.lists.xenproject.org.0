Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE8828539
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 12:38:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664565.1034636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNAR4-0002PI-S0; Tue, 09 Jan 2024 11:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664565.1034636; Tue, 09 Jan 2024 11:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNAR4-0002KA-P9; Tue, 09 Jan 2024 11:38:22 +0000
Received: by outflank-mailman (input) for mailman id 664565;
 Tue, 09 Jan 2024 11:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNAR3-0002K4-6S
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 11:38:21 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95f86c5f-aee3-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 12:38:19 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cd1a1c5addso33032651fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 03:38:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc17-20020a0566023fd100b007bbab8c40d2sm454270iob.44.2024.01.09.03.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 03:38:18 -0800 (PST)
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
X-Inumbo-ID: 95f86c5f-aee3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704800299; x=1705405099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0NEhKQaHQAcnvQswzw8Cm4jgNXJTva5RD3N/moGfEc=;
        b=DtVwtGaK3FD1y3SFykoAwKwHubqA/22IPqqkSn7gVHyP/7J1Yad7NxATPEWRIY7uit
         dE3+eE/rQ+vFW39oyK6uEAuUbGkzjpxgNbMEmE6yag8Sor4g/q55RKK699jTUsAphRCI
         cuSAQFZCMv7ow7J2KFU/1rt5t4/1L0hfxUCYiooJrf3Hm3mQIvXsPhnqG2HA7ZgSBLt5
         ne5DkaeL7by+3mQSEjtDU7vGNGuF0cPi3zLmsTekBms7m2Jt9tDcXiQswhq8VTcQmnmT
         ATzONhUbI+cL2QFwiTDDvrRcT3Gxr+yefKU0Na5PfibCesQPE6YDADQSILcoRt1w2Of2
         W/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704800299; x=1705405099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0NEhKQaHQAcnvQswzw8Cm4jgNXJTva5RD3N/moGfEc=;
        b=MRhL3owdP24bGbaIczV4Ubgos9WYlaphd0VB9QcfnjOefriiOPl0rwlxvrhLq9KW+C
         nFUH46S7EgeWVE+Byly+UwpKpBehLyJpg0zrAHDAEzoJa6PLF1a3JR0xYkQtGIy+zto8
         uI9jDPuVb9vzdZFSmTis9PaTAojAq9LV1pmL48lUxF5XADhr19RxBSI3I6QH4Jp+n2lm
         o/9VjnxD7lo53GqNu7ee/sOR0KsoZCHxldgkUyc5IsROasjbY6kE1DatehPNP+vXbMD8
         fU0MpiXft4rBqiCY3m1LmatbJyHbMKKjEvfTT2WhK/2Ao0cU7VgXV8L7HSK6Hpz9wXe+
         4ypg==
X-Gm-Message-State: AOJu0YzfmV12HlZUky+DjL8Vv1e9XSa8G66Gc6pprIgbTy8s7+yaGSuI
	F8Z8BwZxIqp4yeR8arjS5USDZSIZ6lV/
X-Google-Smtp-Source: AGHT+IG88wcpR/v4ewPpT51EALkxA6ugbP/ky+lcVfROmkPf6UWNNiYP3CrkMabKVRmjISmiDgezUA==
X-Received: by 2002:a2e:a4ce:0:b0:2cd:6c8d:4c7 with SMTP id p14-20020a2ea4ce000000b002cd6c8d04c7mr240384ljm.38.1704800298757;
        Tue, 09 Jan 2024 03:38:18 -0800 (PST)
Message-ID: <cd2804ce-d846-46df-a1dd-2976e6198740@suse.com>
Date: Tue, 9 Jan 2024 12:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] x86/iommu: improve setup time of hwdom IOMMU
Content-Language: en-US
To: Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20231220134346.22430-1-roger.pau@citrix.com>
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
In-Reply-To: <20231220134346.22430-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 14:43, Roger Pau Monne wrote:
> Hello,
> 
> The aim of the series is to reduce boot time setup of IOMMU page tables
> for dom0.
> 
> First and second patches are a pre-req, as further patches can end up
> attempting to create maps above the max RAM address, and hence without
> properly setting the IOMMU page tables levels those attempts to map
> would fail.
> 
> Last 4 patches rework the hardware domain IOMMU setup to use a rangeset
> instead of iterating over all addresses up to the max RAM page.  See
> patch 5/6 for performance figures.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (6):
>   x86/p2m: move and rename paging_max_paddr_bits()
>   amd-vi: set IOMMU page table levels based on guest reported paddr
>     width
>   x86/iommu: introduce a rangeset to perform hwdom IOMMU setup
>   x86/iommu: remove regions not to be mapped
>   x86/iommu: switch hwdom IOMMU to use a rangeset
>   x86/iommu: cleanup unused functions
> 
>  xen/arch/x86/cpu-policy.c                   |   2 +-
>  xen/arch/x86/domain.c                       |  21 ++
>  xen/arch/x86/hvm/io.c                       |  15 +-

Paul,

for the changes to this file, any chance of an ack for patches 4 and 6?

Thanks, Jan

>  xen/arch/x86/include/asm/domain.h           |   3 +
>  xen/arch/x86/include/asm/hvm/io.h           |   4 +-
>  xen/arch/x86/include/asm/paging.h           |  22 --
>  xen/arch/x86/include/asm/setup.h            |   2 +-
>  xen/arch/x86/setup.c                        |  81 +++---
>  xen/arch/x86/tboot.c                        |   2 +-
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  20 +-
>  xen/drivers/passthrough/x86/iommu.c         | 271 +++++++++++++-------
>  11 files changed, 262 insertions(+), 181 deletions(-)
> 


