Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC649A2E9FD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884697.1294435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thROW-0000RJ-P8; Mon, 10 Feb 2025 10:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884697.1294435; Mon, 10 Feb 2025 10:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thROW-0000P2-MT; Mon, 10 Feb 2025 10:52:04 +0000
Received: by outflank-mailman (input) for mailman id 884697;
 Mon, 10 Feb 2025 10:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thROV-00087K-3D
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:52:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f50b45f-e79d-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:52:02 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5de5bf41652so3449239a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:52:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7cd4c34e4sm86292466b.14.2025.02.10.02.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:52:01 -0800 (PST)
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
X-Inumbo-ID: 0f50b45f-e79d-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739184722; x=1739789522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RM3SnGDTPPnteAG6neTDJo2s8eMK7KSDUGKuyIBcGck=;
        b=Sn3hdf/yXKbrHjmPf+igfan/Quda9Z0Go4dhGI6bvO2Jf2qwkdxJcDfWv/CKiB8E0o
         Y/LYw4Orp7BbibJ65ZBxVsT/RaAbAoIp0S7knDqGU+RHiGCj983IcGyOPLHWEFjLfB0T
         eHtk+jvckpfKG1DcueGEW7mC8oi/ntQ6KWkEbnba6qY7MK/O3YNOrtJ1IP/28+65lt0D
         VXYYuKkNsPBOB964x/YKJ4LrloI03iF+9BVl4V/SBfNB6Gkpur/Q3jwrzXQmR1CINKgK
         sU9qkX5vuvWJSwJmh938oG1t9fjsSKBKlxiNHVX9cL4JuHXX7EvxhmVgRz9l/XcJB7L8
         LGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184722; x=1739789522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM3SnGDTPPnteAG6neTDJo2s8eMK7KSDUGKuyIBcGck=;
        b=EtKuB29kVx/IdkGaVoglv7nd9sCx0TuWKnbsNXgToX0Q1opCbKRhNPW7m0W+vQIp4g
         TmZ3dEt0CEaSkF/uxsvPNrUKoNCMxUvYfG5ZjhG16vzBY2LbBdbI3znnc4As5cGFNMZI
         lS3qHSg5F7YqjkBtBKC3M9kbE+rTulT9JzUQmIgu4Ccg0QPATpsazGgTrwoaTllW9IZv
         Vlis0V4C3n1yGmVaTfcgDpH0Q3h9SlPOreBK4ce9xWTI1fFp9a7CFTW0jVAxyW7OS3La
         CCuVRVQV24/uyvhxMqW/xsM1q+cLjgpDpgv+iAyQc9svsrtGjpZt/72WN93O15Fcb2Fd
         9jwg==
X-Forwarded-Encrypted: i=1; AJvYcCXDvKCmBg8W6WdK2KtIJ4Sxh4AWIk9RszugynibtU8h0tt9sJ0e+QGLAwRkSCNLyz1hWbEHXno284M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytTZyaNjgCzTCHmEe7dHKD8KNYuCeZjV6y7SvXt6zWReN1XMq0
	UmQfLTsuL4RqO6UOyFITpP+gSbBHmTMWVcl8PxJRFWJ3CMrE/gcF1bek+u2H5Q==
X-Gm-Gg: ASbGncuVscVz/KWdGpBTJIfSgQ4eu0j39mf0Q4pCBBI3XooUbNGgga+x1pZQFL0KmJY
	2iiFosyaJoElO9U43WPxRecCNm9OGZMXzG5lRijE9L3dDnlDN7F+ZrEZXKlImIQlDOyGODZldqd
	D3PREBjg23ikkKWA9U4ySpXYjCi2HNYnKN62ghA4Qy0JDXFukdnvYzXhC04hhpYqpm1GA1NznlU
	rcZ2ZpDViolusSGUQYER8P4AIfVHKxhBrTBPX9H3IcZmXdvw3dKb66p8CnAzUNBaBJn1FY26PaZ
	+vQpVKLzPme46XQ4/rCAj3bGJ1pjt8pBl44Fz7Ep3nE90l+ao+ch+NLuMngjmuu6WVbvLLFh+Dz
	t
X-Google-Smtp-Source: AGHT+IEXLjNX0oSxnTYc9WiZoqMujNLFiJi2KLIl8AwdVaDpgXEUINyrf0rkFExiildI3lfih6TZiQ==
X-Received: by 2002:a17:907:7216:b0:ab7:c6a5:454b with SMTP id a640c23a62f3a-ab7c6a54814mr284908766b.2.1739184722010;
        Mon, 10 Feb 2025 02:52:02 -0800 (PST)
Message-ID: <67c8ce1e-5559-4567-9eed-970d97c29bda@suse.com>
Date: Mon, 10 Feb 2025 11:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <67b9bd138c12c0df35e5c4b3137c30ad345097d5.1739182214.git.mykyta_poturai@epam.com>
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
In-Reply-To: <67b9bd138c12c0df35e5c4b3137c30ad345097d5.1739182214.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2025 11:30, Mykyta Poturai wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -20,6 +20,7 @@
>  #include <xen/param.h>
>  #include <xen/softirq.h>
>  #include <xen/keyhandler.h>
> +#include <xen/acpi.h>
>  #include <xsm/xsm.h>
>  
>  #ifdef CONFIG_X86
> @@ -744,6 +745,18 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>      return 0;
>  }
>  
> +int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    int ret = -EOPNOTSUPP;
> +
> +#ifdef CONFIG_HAS_PCI
> +    if ( acpi_disabled )
> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
> +#endif
> +
> +    return ret;
> +}

This function has no caller, which violates a Misra rule iirc. Considering
all information given here it's also unclear why it would gain a caller on
x86 (at least as long as DT isn't used there).

Jan

