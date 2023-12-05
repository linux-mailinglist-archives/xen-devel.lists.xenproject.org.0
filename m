Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED5805757
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:33:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647966.1011792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWTK-0004Sg-Dm; Tue, 05 Dec 2023 14:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647966.1011792; Tue, 05 Dec 2023 14:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWTK-0004QT-Ao; Tue, 05 Dec 2023 14:32:26 +0000
Received: by outflank-mailman (input) for mailman id 647966;
 Tue, 05 Dec 2023 14:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAWTI-0004OY-BH
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:32:24 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19f24e8c-937b-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:32:22 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso32991275e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:32:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fs16-20020a05600c3f9000b0040b48690c49sm18755684wmb.6.2023.12.05.06.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:32:21 -0800 (PST)
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
X-Inumbo-ID: 19f24e8c-937b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701786741; x=1702391541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHiMdy4DcrJJeUBwh3/rr8HVIg98TVae8pErAvC54dg=;
        b=UfmhQjPG7KCDHQBFWkRYPDCGWMaR8Ibjk5ZfcjJaxIhNwtFdbeiAIN5Nmu6arZclQK
         jeEqYFqNZIMGCqw4lsaGOAUgcVTSrFKsDLaF1PNgxkf3ARMnlADCik0VrPEdHsRWrlmM
         9YVOWBrmYhNY7bshR8pSQIeL0P/2rRIkFGeYCo2vFkXUesxeur8amgYm/LS5hYEtt+rf
         Ruch1g4CErjjrenXOro5iblvA6SXn4pgLOQ5WsyS1p3U9OvDu7hMDi0w9izk/PfK8q+h
         clhxWLIUPaJxMJ0wquV/WTeFxuTQIiVEWsssR9oX05hTkf6tSdXm0y0SVAN6qhPf7Q1u
         rTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786741; x=1702391541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHiMdy4DcrJJeUBwh3/rr8HVIg98TVae8pErAvC54dg=;
        b=D5ssrrInJamKbPjBIC9LeugxTHY8AbrsaMhF9N1Tg5j0963sEJWrtMZ3KF9vSixrgd
         m3aqKLgJFR0OpbdtHZp0mU+sexUcyol1aFF3DYmmgo68qE8yAKZmnIRqBEZ2n3gNaHXW
         uH3xzqsZ88QUP35awQTzne1SaCBWuPcJ7bRppklTtXuj2QdTBN8moTa/JZjD7FXGnj56
         Y5vwlg5+1wA8Wln00xT8niJGPaSsOr8vxWF02fx1jXO7JR+BITqgTpgzEsHHY/m0ebIY
         qx2LhRlaaHObZZAiaeWXySAKCb9GiVNnyGpeAeGSDRPe93CM7SzqFmTxjfKNa57E8iRQ
         8NQQ==
X-Gm-Message-State: AOJu0Yx2F3kgJj5xTmZkVHIcdEZiYbzDOcslpwBNmBymq24PHRfkEsz9
	Li9+TsbCi/3VsEQEnBTAfBe0
X-Google-Smtp-Source: AGHT+IHFIYD9UYy9TTUZh2nIbQFodeoBDcug+4VoP/FdWbPzkJOnYMkWosg/C7gxsVakQ4rJf7jDSw==
X-Received: by 2002:a05:600c:2d4c:b0:40b:5e21:dd31 with SMTP id a12-20020a05600c2d4c00b0040b5e21dd31mr617919wmg.95.1701786741666;
        Tue, 05 Dec 2023 06:32:21 -0800 (PST)
Message-ID: <17de355f-623f-4310-ac55-df028235c240@suse.com>
Date: Tue, 5 Dec 2023 15:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] amd-vi: set IOMMU page table levels based on guest
 reported paddr width
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-3-roger.pau@citrix.com>
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
In-Reply-To: <20231204094305.59267-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 10:43, Roger Pau Monne wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
>  static int cf_check amd_iommu_domain_init(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> +    int pglvl = amd_iommu_get_paging_mode(
> +                PFN_DOWN(1UL << paging_max_paddr_bits(d)));

This is a function in the paging subsystem, i.e. generally inapplicable
to system domains (specifically DomIO). If this is to remain this way,
the function would imo need to gain a warning. Yet better would imo be
if the function was avoided for system domains.

Jan

