Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F103781B016
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658570.1027789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEBb-0005WT-H5; Thu, 21 Dec 2023 08:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658570.1027789; Thu, 21 Dec 2023 08:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEBb-0005Te-DV; Thu, 21 Dec 2023 08:13:43 +0000
Received: by outflank-mailman (input) for mailman id 658570;
 Thu, 21 Dec 2023 08:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGEBZ-0005TY-Qc
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:13:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98dcadf-9fd8-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 09:13:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d2e5e8d1dso5788315e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 00:13:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c3b1400b0040b4c59f133sm2352194wms.1.2023.12.21.00.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 00:13:40 -0800 (PST)
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
X-Inumbo-ID: d98dcadf-9fd8-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703146420; x=1703751220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKYtMS3z9U2DUl7rdVVBE6C55RH0YYJvFZO0844Ex0M=;
        b=DEbVLuLHG76ZEIWnLnxE2swU9Rgazn2eS3eF5/iGhRVBDfCZibeI37mtnlgNezVxqq
         G24Xi+bjs4STfJyFU93bGldjAQiYi+sRUQSTyMKEQuuwvRmqKxYnymV4j5M1x19/0rzz
         7P/JvJ0rYi8V3/JoRgsdSB7Z3PmOiu3ol1ImWvjxhE6ErH7ll25NDCiRCdDK/TbJIQtM
         GM3cU7hokVYKo/zhpw08BuR99oQIgp/s7xTOC9nhfagd5x0QrtPvAt8eob7pe89cnqgy
         /eHmpi1+RwdZGxXhURzcReFvdGDNdg3iDFkzsRdJQI3HQXba61ZN6zjaP7f/i2Ae+JhK
         r5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703146420; x=1703751220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKYtMS3z9U2DUl7rdVVBE6C55RH0YYJvFZO0844Ex0M=;
        b=l8z0C4/dCsYxVLIAyDou/8EKKmTiFMKzMBaDbYZM+/Kmc//0ze9OCiLExTrJEZWF0i
         k0EEjk7xvf7c94Nj6c6KmOTt2cc5m0IObbJFrebJ6/xY5iReqf8EKLuVKMSCsXqRY0Ds
         5kfKnfU84tSx70H6Z4jzAuBZKCvXU3sNWyMRThTUMGUH3oaFu3IvBKkTcWGpROTrCJFs
         olASIhNXS5RROj2nYNFxbxRC1Eqz2ePi41FoGVSNmMbQmf05HlSXv/OuIGvZQFdonJ3H
         ShmFVTgSLZd0fQLGSM980nQFcco1sw0oAD3XZpsExyTjgDG3cgNIOO4XFQzzJnJUz6pS
         TMDQ==
X-Gm-Message-State: AOJu0Yxdm8fmF6Rka8efFvKKZuZoVq6WUMfFDaZyOnayOnQP3SZHdf5H
	Tt+LEKaKNGHUZSkfKOTYGQE6
X-Google-Smtp-Source: AGHT+IEQh9USuqJOp170FP99L+RALDUnQ+ZY1YCXLIAMHiPcYFwrbmen7fvpRqTNP/kZXxYNjUdidg==
X-Received: by 2002:a05:600c:3592:b0:40c:914:d2cf with SMTP id p18-20020a05600c359200b0040c0914d2cfmr271911wmq.134.1703146420351;
        Thu, 21 Dec 2023 00:13:40 -0800 (PST)
Message-ID: <3a580b22-7ff2-4a60-a3c0-0cb03deef6ac@suse.com>
Date: Thu, 21 Dec 2023 09:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] amd-vi: set IOMMU page table levels based on guest
 reported paddr width
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20231220134346.22430-1-roger.pau@citrix.com>
 <20231220134346.22430-3-roger.pau@citrix.com>
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
In-Reply-To: <20231220134346.22430-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 14:43, Roger Pau Monne wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
>  static int cf_check amd_iommu_domain_init(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> +    int pglvl = amd_iommu_get_paging_mode(
> +                1UL << (domain_max_paddr_bits(d) - PAGE_SHIFT));

Nit: Considering the "pending" open parenthesis, I think this line
needs indenting one level further. I'll make the adjustment while
committing, unless I hear objections pretty soon.

Jan

