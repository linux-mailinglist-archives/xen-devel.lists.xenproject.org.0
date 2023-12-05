Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F610805742
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647952.1011763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWLz-0003zQ-5z; Tue, 05 Dec 2023 14:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647952.1011763; Tue, 05 Dec 2023 14:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWLz-0003xX-2t; Tue, 05 Dec 2023 14:24:51 +0000
Received: by outflank-mailman (input) for mailman id 647952;
 Tue, 05 Dec 2023 14:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAWLy-0003r1-3p
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:24:50 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b776713-937a-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:24:48 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3334d9b57adso1356304f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:24:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bl13-20020adfe24d000000b0033344666878sm6699905wrb.91.2023.12.05.06.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:24:47 -0800 (PST)
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
X-Inumbo-ID: 0b776713-937a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701786288; x=1702391088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQmLJOgkh6sIuGYdKUONLWoveERp17lqVvLgypNbpEg=;
        b=A8QG3r/AuZGZLiMlmV4CDwNaOjFPGBa5ivX4OWLjoY+xdZDqjWACQ0/zuImgfV9CAu
         mlleFjaCjbI0GS4EvDMZjVUz0g0/YaD1eylKEihgxTVJLY1eZ2zGD681rxRgj+yjIOpw
         C0dO/dVp0t5Qw0Wa8pieXnQRjfN3R4tz+y68cXLAX3kf75bdntpHLQk8qI2su8PoSeL8
         /EiE0mZDgyFNaO5bZnTiVJ85ngS6AThzOwC2jBr1AlMzKfFzXxJrtyFwAQ9feutEQ/3n
         leuXUuLdFpQ4/qW54y+DYn6qiFzNLtmBqRw0EuYatIur6ATunrL5Ib3RFqzYMkGnX9Ho
         azfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786288; x=1702391088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQmLJOgkh6sIuGYdKUONLWoveERp17lqVvLgypNbpEg=;
        b=E+2rYqmB3VIMhXU7iG7F9VgYltqAsh3LL7ChGUJKCPONE8BjDxjs9mNOhJil0sTkR/
         PqfJlZ/J3nEOhd4svCe499cz4cTIzWdnECmq7qPpVi3X5mQov1B8+OlFuUC2LoGrTR9U
         UnNgsF7ebB8kYyZHuJEj4hRsW6VXrTNCaYDBs5DtHYobWj7HcFXgpWszR61D8TN5Fvop
         AO7xrBMrOWNawY2gplIZbTYQ8Fh5FGfna1kdggepdQ32mtyNfYJ20xosL6rAt2OGneso
         kk5XZVE+77wgMCkSxMX4iwMtGXtWqy8cGnJNGTbocFO0g8WjdgEgIjJ/D+QG0Burky6J
         /Jjg==
X-Gm-Message-State: AOJu0YzQszYk3WZogZcUb62y6uMF7A+MLHADLNXyhPMmM3ikIkjm0cHj
	2y37Mf1gKknioWMHe8DWFeht
X-Google-Smtp-Source: AGHT+IFd6W6PHzFPjE0uO0X8UvS27/kbNHZUKLTJDzea1X2qyaPYF+9Xi7UjGDln23IzCILa94rj9Q==
X-Received: by 2002:adf:fa0c:0:b0:333:2fd2:8142 with SMTP id m12-20020adffa0c000000b003332fd28142mr5343424wrr.95.1701786287857;
        Tue, 05 Dec 2023 06:24:47 -0800 (PST)
Message-ID: <a9ca40d5-3546-46a4-ab56-3b190b1e4e93@suse.com>
Date: Tue, 5 Dec 2023 15:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] iommu/vt-d: do not assume page table levels for
 quarantine domain
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-2-roger.pau@citrix.com>
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
In-Reply-To: <20231204094305.59267-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.12.2023 10:43, Roger Pau Monne wrote:
> Like XSA-445, do not assume IOMMU page table levels on VT-d are always set
> based on DEFAULT_DOMAIN_ADDRESS_WIDTH and instead fetch the value set by
> intel_iommu_hwdom_init() from the domain iommu structure.  This prevents
> changes to intel_iommu_hwdom_init() possibly getting the levels out of sync

In both cases, don't you mean intel_iommu_domain_init() instead? Only if
so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
(and happy to adjust while committing).

Otherwise I must be missing something.

Jan

> with what intel_iommu_quarantine_init() expects.
> 
> No functional change, since on Intel domains are hardcoded to use
> DEFAULT_DOMAIN_ADDRESS_WIDTH.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.
> ---
>  xen/drivers/passthrough/vtd/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index e13b7d99db40..bc6181c9f911 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -3162,7 +3162,7 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
>  {
>      struct domain_iommu *hd = dom_iommu(dom_io);
>      struct page_info *pg;
> -    unsigned int agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
> +    unsigned int agaw = hd->arch.vtd.agaw;
>      unsigned int level = agaw_to_level(agaw);
>      const struct acpi_drhd_unit *drhd;
>      const struct acpi_rmrr_unit *rmrr;


