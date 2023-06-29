Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67B7430A6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557183.870300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0GY-0004y6-4W; Thu, 29 Jun 2023 22:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557183.870300; Thu, 29 Jun 2023 22:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0GY-0004w5-1m; Thu, 29 Jun 2023 22:37:30 +0000
Received: by outflank-mailman (input) for mailman id 557183;
 Thu, 29 Jun 2023 22:37:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qF0GW-0004vz-DN
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:37:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF0GU-0001TD-LQ; Thu, 29 Jun 2023 22:37:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF0GU-0006c1-Fg; Thu, 29 Jun 2023 22:37:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=79RCoumuZ9qC8gDHhfpwS4X584AL+xmV8sGohL7Hbcs=; b=4uwyiTpdLEQaLIFajWycKqR4dP
	DLpavMN79WCzIcfvuVOiw2am7HIDo8cnJBvZngvxUfnTlCefBTv837fLQGEw+gf5MpLcO5SCAKJJ9
	/FEh+R/Sp6eVE3EFzdm00slhaxdCg107VGw01hz3lfo6t9veUEZR2XRwaPnUL4Zv6PtM=;
Message-ID: <ef2932b2-dfdb-23b4-c7f3-e924f1c4d09d@xen.org>
Date: Thu, 29 Jun 2023 23:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-5-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230607030220.22698-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

I haven't yet fully reviewed the code. However, I have one question...

On 07/06/2023 04:02, Stewart Hildebrand wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
>   #endif /* HAS_DEVICE_TREE */
>   
> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    int ret = 0;

Shouldn't this return NO_IOMMU when booting on ACPI platform?

> +#ifdef CONFIG_ACPI
> +    if ( acpi_disabled )
> +#endif
> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
> +    return ret;
> +}
> +
>   struct page_info;
>   
>   /*

Cheers,

-- 
Julien Grall

