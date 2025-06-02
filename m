Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7970ACAAC8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 10:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002925.1382340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0nZ-0004Z7-LH; Mon, 02 Jun 2025 08:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002925.1382340; Mon, 02 Jun 2025 08:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0nZ-0004XA-Ic; Mon, 02 Jun 2025 08:45:37 +0000
Received: by outflank-mailman (input) for mailman id 1002925;
 Mon, 02 Jun 2025 08:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM0nX-0004X2-PK
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 08:45:35 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2507cb6-3f8d-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 10:45:33 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a366843fa6so2106596f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 01:45:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2d120esm5173123a91.14.2025.06.02.01.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 01:45:32 -0700 (PDT)
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
X-Inumbo-ID: f2507cb6-3f8d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748853933; x=1749458733; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kxChy2WxfDmfeUWMBhxsoVuB+hRqdSs3hVOzj1v8TQg=;
        b=ZgSU5yew1Zu3ZPCW3t8yVTb2qzjWSaELNct82AgQn/uOjLVSAIWm+H949QZInI/gwM
         DPkuGBxHmaTSi2R6MG318NtiqqQL8A0gOFeVUu1Z5zzHIV4V//COMKhdfTnHrBasEOCS
         MG0+fwN83i/THSg04wbOl+g+7f9uIE5TVnG/69Xr3B1WLHRYmDu7toKDu7Wac3eAs4hm
         tq993n4J3XozOvb4aohVdMXmh0O/6iWHfDdKdoLGhp6Lw4I/OmM0zkJzHryleZiqrfzZ
         BN4rDbWbehFIFVHXpfIl95EFqIzPsscAG86ZWBWZCv8naZmc9wYhS3RK3/SDupSISc0E
         IJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853933; x=1749458733;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxChy2WxfDmfeUWMBhxsoVuB+hRqdSs3hVOzj1v8TQg=;
        b=I67PgqLDJuCnRuTUZBXNk3zG20KWxBzRmO26T3S+Mv/sRKC9c+BXxVhubqOv2Ebr3l
         /55h8D7rKa4Z3yBJeGoM4ftDn4/SjjFDD3llHrcNy3cEEmd537A5APgcCQ5+BWUSMckJ
         HOmRyM/qD5nsZjx5ZMXrRYGK+xYsil6OTgAGPip2OP8Z1sHMiEhoS/+lLpFhWbAZ+m1F
         s4A+1nzJvB1jhY97ALMalXrg5Yl9J/ntP+7Gp5ob3k8LsC3OE8y/TsGFuF+X5rPJdKyK
         B7KAMiD7afDRJFLaiPCH84UZhutom8X0vrAKf9J7mK8H2ht0KYGNqoXliwmj0NArxn+6
         hKyw==
X-Forwarded-Encrypted: i=1; AJvYcCWBN/nPd1aW98qhk/bBWFLO689ykW9kT4P2TAyETLFRkzNofmhWuaBl5ZveCcrJiwThv6M3SOpz2e0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye8eKOg37bk0MinIiXQWiC10GBARLurXiMBswqbuD8B5Ndbykr
	oCYA3sn10gHvCGPgBJK6ZiRr6mcziHK1taAoXXtbflpKFEbFJmDgVAojJ/d+Map3DA==
X-Gm-Gg: ASbGncsakRjRUQfup7orv+YVFFxYtG0MNqjlGWdGfYa/YcExc199GArgHOonSL9BkPV
	HFsiWXXKa88SZpF2kxX7dz9X2rOIb38/NcyyBgLoGmTaRAsBmpT2bR/P/LWpxOcNucATtIbzpZz
	TFbUedMQl7Sfp1hMyLpbl1XzayBkwvI1X366USlMEUZdS9QwH57Z0isKjDtp7zAohTTx65Mgy8S
	c8QTQ/UXQm/kbjMGzaB3DDXNvFI7D4hhp6ZUNygd6cuxj4NR+8rqppjgorLblcMxf74KYk6eJup
	dlBOmPCVjNokO5FnrXRcCpCCqk+zyuCOOtWVEdiblOVrP7ZYh9w03X4uXFlfgZk8BXqtDD/Xf9n
	NYyHiTOU8ePCzQK1WJeAo9MQjwYVntnlL220u
X-Google-Smtp-Source: AGHT+IF5VHVCF8ZQU+ZrAV4CMubjEUmm8X2kg4jjAFRd3H6n2PCG2M2oX9kGE/eOci5hfiumtHNyiA==
X-Received: by 2002:adf:b301:0:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a4f8fa9ce5mr7317441f8f.13.1748853933193;
        Mon, 02 Jun 2025 01:45:33 -0700 (PDT)
Message-ID: <4cd82cbb-fc01-425d-b036-62f80a027a9b@suse.com>
Date: Mon, 2 Jun 2025 10:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-2-edgar.iglesias@gmail.com>
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
In-Reply-To: <20250530134559.1434255-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:45, Edgar E. Iglesias wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -721,7 +721,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> +           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>  /* Should we expose the vPMU to the guest? */
>  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> +/* Should we trap guest accesses to unmapped addresses? */
> +#define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)

Besides being pretty long an identifier (and that's already with "guest" not
even in the name), if this is to be arch-independent, would this perhaps fit
x86'es recently introduced "advanced" PVH handling of holes? See [1].

Jan

[1] 104591f5dd67 ("x86/dom0: attempt to fixup p2m page-faults for PVH dom0")

