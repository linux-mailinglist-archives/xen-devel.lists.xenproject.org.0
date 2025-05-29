Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82659AC79F9
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 09:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999843.1380392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKY7D-00025d-KJ; Thu, 29 May 2025 07:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999843.1380392; Thu, 29 May 2025 07:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKY7D-00022X-HN; Thu, 29 May 2025 07:55:51 +0000
Received: by outflank-mailman (input) for mailman id 999843;
 Thu, 29 May 2025 07:55:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uKY7C-00022R-0H
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 07:55:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKY7B-008FYH-25;
 Thu, 29 May 2025 07:55:49 +0000
Received: from [2a02:8012:3a1:0:d557:39f4:e427:823c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKY7B-00Ca1m-30;
 Thu, 29 May 2025 07:55:49 +0000
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
	bh=odKWaFvbxRa79gD5yB/W95dlKYKe5DlqFo+KR29Hd6Q=; b=u2H4l3q/metZ5lJ/1NDd/41BF2
	FzHlhWlHiOAJiVo69N6OksI5k9P5/ICutSIkFG/3iiKnwRjEotg/WqjEM41xZ1ch7CuSsJC3gDV8Q
	aTPokAe/obVuSepFLP10EfovbmAXJ6D8+xginVtlZgJEv/bitMs72Acvy8m3VTM86xJE=;
Message-ID: <a01fc8d9-29e2-40c7-b7cd-fcaafcd0ad41@xen.org>
Date: Thu, 29 May 2025 08:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <71741747bdc0cfcacbe86e66ddd6239ea2f5a3af.1748422217.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <71741747bdc0cfcacbe86e66ddd6239ea2f5a3af.1748422217.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

I have only skimmed through the patch. But there is something that
caught my eye in both this patch and the one for the SMMUv2.

On 28/05/2025 10:12, Mykyta Poturai wrote:
> +		/* dom_io is used as a sentinel for quarantined devices */
> +		if ( d == dom_io )
> +		{
> +			struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +			if ( !iommu_quarantine )
> +				return 0;
> +
> +			if ( master && master->domain )
> +				arm_smmu_deassign_dev(master->domain->d, devfn, dev);

arm_smmu_deassign_dev() can return an error. Can you explain why this is 
fine to ignore it?

> +
> +			return 0;
> +		}
> +	}
> +#endif
> +

Cheers,

-- 
Julien Grall


