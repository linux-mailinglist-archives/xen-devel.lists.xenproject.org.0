Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CFC8C60D2
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 08:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721923.1125619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78Bk-0000fi-Jc; Wed, 15 May 2024 06:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721923.1125619; Wed, 15 May 2024 06:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78Bk-0000dE-GP; Wed, 15 May 2024 06:32:32 +0000
Received: by outflank-mailman (input) for mailman id 721923;
 Wed, 15 May 2024 06:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s78Bi-0000d8-PX
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 06:32:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e66cd86f-1284-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 08:32:28 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59e4136010so121259366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 23:32:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17865sm805246766b.204.2024.05.14.23.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 23:32:27 -0700 (PDT)
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
X-Inumbo-ID: e66cd86f-1284-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715754748; x=1716359548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm16VyhRJj1s03ND3XgAo+uplnecyiMpJe/fxvBOSL8=;
        b=H8lMU3FwaGFTBzMEtQ1dYdS/WSENsVvKpoKmmjhSjtSRAW/qIQPeQpr/cNczQK6JcU
         zqlcHomS3YeAPvqBlTcJCl5ri1UpwiFEYito2iSx3beHTXGppy2Dd8cTiArO6rzuzcxe
         omkLyCwKoZ3wj6vAUm1qPn63L4/mE1wkeuGTP6huYPbKito4km0Q38VsgHTiTikYhK59
         +6x9EKTxlRS8nowZLU5UD44pXoc+noUQ6b9I4UcMoot75ml+TPLIxjW+VhyEOK44CBnM
         6dZvc3f3RQoRXxokaAE56OxvvE6aYMYYqsRVxoFNrrKR9DftVh9R9uAqCmTpWWsP6m9q
         mAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715754748; x=1716359548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dm16VyhRJj1s03ND3XgAo+uplnecyiMpJe/fxvBOSL8=;
        b=GQJ4cMhl3wzdDbPsua0me/n05I0walCmNr53R095bMmzdaydgPlnXwzVBPhf6VVF7W
         RQHNEF1UcLEmFFZwfpDnqIQ/CqvzX4s7JvkCi708EipUyCfnXKhVObAyxvz/3uJ70eey
         pXSMaoRYqcKoJ+puVj0W7E+0RkPMpfcp8xvjmcdpZPgJULSL24vTIB7r11CjDeeBdhwh
         foaezfcMQadZWGlJaK3kAsjT3qMu+XUIhQKOZewTuUJFps9mSBLeFsW8L3daDYibKW/v
         fjCpgjvcHsHskFBQMGGZ3k66oieN0iiERuskiN358idlDtC725Ay+wENjp5N2HAFhlwi
         EPSg==
X-Forwarded-Encrypted: i=1; AJvYcCVNakQHrf1b8UGSJk+O1YXAD1HAKz7vhKGlgCDfZJye0OWLQBogi6cPXq6PB+FkArDrwEPscTNKQxUTZHgYZ/5calVf0bjS802P0U6SeAo=
X-Gm-Message-State: AOJu0YxIzD9zRid9l9Dv21d6CfQP/pFYgcNH/7vbFfQDPJ45kWqvLt3r
	ko4OmxCXmktsEHplzU35h9uQ9DPkjM/ipKXu2zPKd06GpkC25Y0MDuh6UNciaw==
X-Google-Smtp-Source: AGHT+IHyoFDPCAbCNQM3NAjz/KUu2pFU8s7bTi1wyAatHP2L1dLOukNqDMHl0ha76IuUStLHDCaSiQ==
X-Received: by 2002:a17:906:e2c2:b0:a59:c3dd:db2a with SMTP id a640c23a62f3a-a5a2d53b04cmr973655466b.11.1715754748175;
        Tue, 14 May 2024 23:32:28 -0700 (PDT)
Message-ID: <20335f55-4b16-45e5-a8aa-868006b57ca5@suse.com>
Date: Wed, 15 May 2024 08:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/5] arm/vpci: honor access size when returning an
 error
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
 <20240514143400.152280-6-stewart.hildebrand@amd.com>
 <cf646df7-0e92-4138-8b54-471c72f44cb8@xen.org>
 <735c3e3c-d70a-40f5-aca7-f134bc5b98b1@amd.com>
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
In-Reply-To: <735c3e3c-d70a-40f5-aca7-f134bc5b98b1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 22:31, Stewart Hildebrand wrote:
> Here's what the patch ("arm/vpci: honor access size when returning an
> error") now looks like based on staging:
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 3bc4bb55082a..31e9e1d20751 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -29,6 +29,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>  {
>      struct pci_host_bridge *bridge = p;
>      pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    const uint8_t access_size = (1U << info->dabt.size) * 8;

And why exactly uint8_t here, rather than unsigned int? See ./CODING_STYLE.

> +    const uint64_t invalid = GENMASK_ULL(access_size - 1, 0);

I'm not entirely convinced of uint64_t here either, but I'd view this as
more borderline than the uint8_t above. As per ...

> @@ -39,7 +41,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>          return 1;
>      }
>  
> -    *r = ~0ul;
> +    *r = invalid;

... the original rhs here, unsigned long (or perhaps register_t) would seem
more appropriate, but I have no idea whether on Arm32 info->dabt.size can
end up being 3.

Jan

