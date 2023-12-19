Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD7818B66
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656997.1025573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcDD-0003f7-Px; Tue, 19 Dec 2023 15:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656997.1025573; Tue, 19 Dec 2023 15:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcDD-0003d6-NQ; Tue, 19 Dec 2023 15:40:51 +0000
Received: by outflank-mailman (input) for mailman id 656997;
 Tue, 19 Dec 2023 15:40:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFcDC-0003d0-Ey
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 15:40:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbca60fc-9e84-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 16:40:49 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c41b43e1eso59492195e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 07:40:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bh20-20020a05600c3d1400b0040d15dcb77asm3380700wmb.23.2023.12.19.07.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 07:40:48 -0800 (PST)
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
X-Inumbo-ID: fbca60fc-9e84-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703000449; x=1703605249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqtB18T4KE/8QXGng0/tODVYnlMMa4/tiATQTZ7APxE=;
        b=ROxi3mnGvYwVtnS24prC/UkBPtfEPf/c2E03WUgkUfSXqrek/WgkBspeGCpDtiuo6i
         V+fmrivi0E7K3stihxc/Ey/NLKNFWWxW3qfT4DGNboid0y302GMM6tVllea0N0IY6Kdz
         05iWcaldyfRRX4quiRHFiSoiyBeQI//Ki4dltRVi5j5H4Ds1q2H7WahZdNBwMlkxT23z
         j/9c9nKXieaPk06jGqWpxC/jg8JVY0GwgwziE6u2pqObs7eXBJ82KQEElZkl0Lak/CD7
         6QNiB0qJ2xDpSLniEQivcJ5FHNbMWhJnRffQQnaUzvLQozCqNcQLgWoK+3AfpwZQ2xXG
         SJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703000449; x=1703605249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqtB18T4KE/8QXGng0/tODVYnlMMa4/tiATQTZ7APxE=;
        b=SXUftrJSdroyq2MNN+ULRUZu8dgb5jIGiE5RkZLoqvH31VRFWYZPHLgmmjX3PmAggG
         jaQNYO94ARF9VPvkKH+jy7mGpf/1Kpk3PA7cM2WhXeIZ8ORW9vfSs89rhja1twN5uqcY
         1dHpPygp6WDe0hfKP5L0UvwKBYrc5Wzohv7+aSCDoZmenYp5MlVOBAITY/S6bxBtIwYy
         Qg1cKbuxxFe80O4AWmzPXDHq0xdODsyUqgiubYkSeyPj+jONYt8ndTMPQQgDF8wa6Dei
         XBc4ckBiihyDAtdINOYNX7wdWZdXTfVGE6QpChMwnr/AoTtXjw6ukPAIKg7M1xycbufl
         oymA==
X-Gm-Message-State: AOJu0YxVnc9DKDi6KyZXIA5j7T/bHoebuRWOxgGF+bz062PHC5sbKrA+
	Is7MkVtSE0YLJsnj5PLGX4xZ
X-Google-Smtp-Source: AGHT+IF3ZLbiop0DdkbdfU1hI59rYo3RlJfAiv65ioF7MLXzfhQDDvGKDrVckmoYSqmfmnU7I5FA4w==
X-Received: by 2002:a7b:c388:0:b0:40b:5e1f:6fd5 with SMTP id s8-20020a7bc388000000b0040b5e1f6fd5mr8205954wmj.42.1703000448847;
        Tue, 19 Dec 2023 07:40:48 -0800 (PST)
Message-ID: <79f986b3-9803-4ebd-a30c-ba10e6e88e85@suse.com>
Date: Tue, 19 Dec 2023 16:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] amd-vi: set IOMMU page table levels based on guest
 reported paddr width
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-4-roger.pau@citrix.com>
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
In-Reply-To: <20231215141832.9492-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 15:18, Roger Pau Monne wrote:
> However take into account the minimum number of levels required by unity maps
> when setting the page table levels.
> 
> The previous setting of the page table levels for PV guests based on the
> highest RAM address was bogus, as there can be other non-RAM regions past the
> highest RAM address that need to be mapped, for example device MMIO.
> 
> For HVM we also take amd_iommu_min_paging_mode into account, however if unity
> maps require more than 4 levels attempting to add those will currently fail at
> the p2m level, as 4 levels is the maximum supported.
> 
> Fixes: 0700c962ac2d ('Add AMD IOMMU support into hypervisor')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
>  static int cf_check amd_iommu_domain_init(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> +    int pglvl = amd_iommu_get_paging_mode(
> +                PFN_DOWN(1UL << domain_max_paddr_bits(d)));

This would feel safer as

1UL << (domain_max_paddr_bits(d) - PAGE_SHIFT)

as then not being prone to UB should the function ever become capable
of returning 64.

Jan

