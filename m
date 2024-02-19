Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7685A1E9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 12:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682778.1061934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1mx-00022Y-GC; Mon, 19 Feb 2024 11:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682778.1061934; Mon, 19 Feb 2024 11:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1mx-0001zT-DC; Mon, 19 Feb 2024 11:26:23 +0000
Received: by outflank-mailman (input) for mailman id 682778;
 Mon, 19 Feb 2024 11:26:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc1mv-0001zN-Av
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 11:26:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3b26fc7-cf19-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 12:26:19 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41264195d5cso8134765e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 03:26:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i13-20020a5d55cd000000b0033b198efbedsm10022628wrw.15.2024.02.19.03.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 03:26:18 -0800 (PST)
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
X-Inumbo-ID: b3b26fc7-cf19-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708341979; x=1708946779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afWW+G268VY4M/2GXCAHh58cIFj4BYx0rMtuKRAIJTE=;
        b=EBOdzrTjKf7HrFVNnzNp0GeYmM8R9ZrY6ycBUxKaWl1gG4f2eU8AfI4AHKsVMF5sSJ
         +QREBCT7NTzYUxR3Lb0EyeGpyiyxWhmBuPk7ZaOIC9KB/ij/b/sJdm/8aV55FORxmMEa
         Lc5L22C20wT+rXExLrQo7CrajqegZW+aFY/RxuqnG924aKwAOdtqECK8b4LXoRneOjqv
         MtEAVw2QP22aDD31YppZcyNNeqgBuVHRpRiyygruWzg2DnpECodCC+J0cXiOd2ncYDH3
         0yjrD/culpMr1U8G7YDMtNmRNR/qqPuMcsomDFqKa29+SN95hUbYza38eE4bShjCmVUN
         wgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708341979; x=1708946779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afWW+G268VY4M/2GXCAHh58cIFj4BYx0rMtuKRAIJTE=;
        b=qmSQBAd1wBPly7/ZSGnmTYYCGRn5aNOAFBEIzbOLGL9Q4qhZVUc/fi9Ip2onfgDTFK
         KLe4FnaepFSZEeHb5udfY0wMaeKZ0/na83Indxy6UWt+lL9uGsgVIXlY3PirW+MoXhV0
         c/OSwD6MoVm8k+OBhdOJeyQCfU5OqwO38zeVAqz0n+cE9DF2AtfD2r7Kxg0v39/h1+4C
         1yfpdEKUevaMqJnESmLumcHsY3RS6cdRG2bfjKOqXZbq+YsZXgsThEWxbOA6EuPCLoCI
         fOAVESsWC1hrJG755tZFpk744CZLY4kQMGLKrXfRfhARRihaQ0pEsDgAtorRYcnGpt0M
         ZNfA==
X-Forwarded-Encrypted: i=1; AJvYcCX0ypyYhdauMfAOSUlLzV/YkBCgbYn1tD4KpEBOT5vsFKRMhMKTDbnV+n4TpvfOoepXCZYJDZlcOix9HZHNRS4SS7XWXByGPNk+BnePlmA=
X-Gm-Message-State: AOJu0YyTogZS4rhFNC1U56axajOQJpTTqTfye12iX+vvHNFwmEmBHj3m
	gUAF4F93ecyBowo9nn+H325b6L7Kf7TJJcJYAlEfATkSO+/OHAZ80RXPmXxztQ==
X-Google-Smtp-Source: AGHT+IGmbzwBQSm2AobfSUWydgb5CevYYiTMc1MHKJwTsR4fTmgldtEitVyXlXKc65FuR05e+Bv48A==
X-Received: by 2002:a5d:6e65:0:b0:33d:30af:4623 with SMTP id j37-20020a5d6e65000000b0033d30af4623mr3475850wrz.51.1708341978713;
        Mon, 19 Feb 2024 03:26:18 -0800 (PST)
Message-ID: <92e7c679-fbf5-4f2e-9b0d-ba61a198832c@suse.com>
Date: Mon, 19 Feb 2024 12:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] xen/asm-generic: fold struct devarch into struct
 dev
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2024 13:39, Oleksii Kurochko wrote:
> The current patch is a follow-up to the patch titled:
>     xen/asm-generic: introduce generic device.h
> Also, a prerequisite for this patch is, without which a compilation
> error will occur:
>     xen/arm: switch Arm to use asm-generic/device.h
> 
> The 'struct dev_archdata' is exclusively used within 'struct device',
> so it could be merged into 'struct device.'
> 
> After the merger, it is necessary to update the 'dev_archdata()'
> macros and the comments above 'struct arm_smmu_xen_device' in
> drivers/passthrough/arm/smmu.c.
> Additionally, it is required to update instances of
> "dev->archdata->iommu" to "dev->iommu".
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   This patch can be merged with patches 4 and 5 of this patch series.
> ---
> Changes in V9:
>  - newly introduced patch.
> ---
>  xen/drivers/passthrough/arm/smmu.c | 12 ++++++------
>  xen/include/asm-generic/device.h   |  8 +-------
>  2 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 32e2ff279b..4a272c8779 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -227,9 +227,9 @@ struct arm_smmu_xen_domain {
>  };
>  
>  /*
> - * Xen: Information about each device stored in dev->archdata.iommu
> + * Xen: Information about each device stored in dev->iommu
>   *
> - * Initially dev->archdata.iommu only stores the iommu_domain (runtime
> + * Initially dev->iommu only stores the iommu_domain (runtime
>   * configuration of the SMMU) but, on Xen, we also have to store the
>   * iommu_group (list of streamIDs associated to the device).
>   *
> @@ -242,7 +242,7 @@ struct arm_smmu_xen_device {
>  	struct iommu_group *group;
>  };
>  
> -#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->archdata.iommu)
> +#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->iommu)

I find in particular the naming here odd. But I'll let Julien judge whether
this really is along the lines of what he suggested.

Jan

