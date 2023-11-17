Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D377EF228
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 12:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635087.990828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xRu-0008Ls-5U; Fri, 17 Nov 2023 11:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635087.990828; Fri, 17 Nov 2023 11:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xRu-0008Ij-2N; Fri, 17 Nov 2023 11:55:50 +0000
Received: by outflank-mailman (input) for mailman id 635087;
 Fri, 17 Nov 2023 11:55:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr9K=G6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r3xRt-0008Ic-KF
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 11:55:49 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ed18cec-8540-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 12:55:47 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40859c466efso14650435e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 03:55:47 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c211a00b0040775501256sm2394806wml.16.2023.11.17.03.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 03:55:46 -0800 (PST)
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
X-Inumbo-ID: 3ed18cec-8540-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700222147; x=1700826947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kbp8v6A7pV0vR1R65wiZQS25OaKzEZu/oKSKdpv/tOI=;
        b=SOyKqWtYQETyBDsW5n1kuaHBKObpVwA8axIgTzoN+giwAOplEmLo3Nw2cFYSXvrfGE
         VPz10/17F3heGkXl9S9iK7cmA4FxIdJsTa9Dr5INgbypcPyJZVNNFiZLgNlDt9yDYGGc
         yo7o2I/HQ/EhMoXYN9VihfLj6p7EtxnXdRsYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700222147; x=1700826947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbp8v6A7pV0vR1R65wiZQS25OaKzEZu/oKSKdpv/tOI=;
        b=aOTJ2xwCUZg0aj6ofvGc7NpqdQsAHxxD/chwW49xmVBMWqZx/fnuhMZxQlhqG746ov
         pCv+vYnoOJl9sSoykeVCT0nu+qbKRW2v4C8xvZS6o0RkZF0I7zJK1Cn/m4/JXvsiC8mD
         eQ/y1aJDDAI3pgIVwLiSwW/l0AeA4rC/LOsD5CQYhVi7XMcrC54OIhVB9Hd6q9Os0SsI
         0CLpXZ+uzX5jUtnl6t4VQG+eBPlL9AJ1GiW+5nIFFbpgxMVX7QNwXtAaU+DMooHqB3lR
         VklMPzsU3v8Y/H3kcKTFhVCcNrlFSG70EPB8P1CQJC0k3m6kl1gkDHUc3l13N6Lwho6I
         DL+A==
X-Gm-Message-State: AOJu0Yyn92iynO4FnY34VFk3Q0bTI37syXUTtIvGd/wCnt7aI/9x24tr
	v407sWM2M3UiymZ+KvDMFZJkdg==
X-Google-Smtp-Source: AGHT+IFjBikGSe/zUEq/Zamh2hQg7g2jOyVaX5Ro3P2j6x/xMzdY343b8VqCLakPi/whz8SGBLuwvQ==
X-Received: by 2002:a05:600c:c0c:b0:405:3a3b:2aa2 with SMTP id fm12-20020a05600c0c0c00b004053a3b2aa2mr14566272wmb.37.1700222146804;
        Fri, 17 Nov 2023 03:55:46 -0800 (PST)
Message-ID: <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
Date: Fri, 17 Nov 2023 11:55:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231117094749.81091-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/11/2023 9:47 am, Roger Pau Monne wrote:
> Using different page table levels for HVM or PV guest is not helpful, and is
> not inline with the IOMMU implementation used by the other architecture vendor
> (VT-d).
>
> Switch to uniformly use DEFAULT_DOMAIN_ADDRESS_WIDTH in order to set the AMD-Vi
> page table levels.
>
> Note using the max RAM address for PV was bogus anyway, as there's no guarantee
> there can't be device MMIO or reserved regions past the maximum RAM region.

Indeed - and the MMIO regions do matter for P2P DMA.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Variable-height IOMMU pagetables are not worth the security
vulnerabilities they're made of.  I regret not fighting hard enough to
kill them entirely several years ago...

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

> ---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 6bc73dc21052..f9e749d74da2 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
>  static int cf_check amd_iommu_domain_init(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> +    int pgmode = amd_iommu_get_paging_mode(
> +        1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT));

"paging mode" comes from the spec, but it's a very backwards way of
spelling height.

Can we at least start to improve the comprehensibility by renaming this
variable.

> +
> +    if ( pgmode < 0 )
> +        return pgmode;
>  
>      /*
> -     * Choose the number of levels for the IOMMU page tables.
> -     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
> -     *   RAM) above the 512G boundary.
> -     * - HVM could in principle use 3 or 4 depending on how much guest
> -     *   physical address space we give it, but this isn't known yet so use 4
> -     *   unilaterally.
> -     * - Unity maps may require an even higher number.
> +     * Choose the number of levels for the IOMMU page tables, taking into
> +     * account unity maps.
>       */
> -    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
> -            is_hvm_domain(d)
> -            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
> -            : get_upper_mfn_bound() + 1),
> -        amd_iommu_min_paging_mode);
> +    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);

I think these min/max variables can be dropped now we're not doing
variable height IOMMU pagetables, which further simplifies this expression.

Dunno if it's something better folded into this patch, or done at some
point in the future.

~Andrew

