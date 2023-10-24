Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1647D5AC2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 20:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622559.969521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvMJn-0000FV-H8; Tue, 24 Oct 2023 18:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622559.969521; Tue, 24 Oct 2023 18:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvMJn-0000Bj-EY; Tue, 24 Oct 2023 18:39:55 +0000
Received: by outflank-mailman (input) for mailman id 622559;
 Tue, 24 Oct 2023 18:39:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvMJl-0000Bb-Rz
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 18:39:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvMJk-0000ZJ-Sx; Tue, 24 Oct 2023 18:39:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvMJk-00010M-Mb; Tue, 24 Oct 2023 18:39:52 +0000
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
	bh=bVdwjw2QooWUK0Hmv0HxnXWrBanbRx3nRmwEHQ26Y7w=; b=s+zkwGnT9lgbrst3kRlgUfaIM4
	DyvwD2c9IP3Jc1txq2wQxposmLG5Fh8iRexLWlC/SkVRdVU2pviGVrfT14aqueUehKZh4UKkR1kfJ
	vFBL9gH589yZ3IhJ0iqIz28GnnzaKaU/tIBCqkBI7EL5ukpj5U+FAJD/kFIkk4tR1p5c=;
Message-ID: <31be8fc3-f156-4fd1-9700-2cadbcbec392@xen.org>
Date: Tue, 24 Oct 2023 19:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] iommu/arm: Add iommu_dt_xlate()
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-3-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231004145604.1085358-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 04/10/2023 15:55, Stewart Hildebrand wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Move code for processing DT IOMMU specifier to a separate helper.
> This helper will be re-used for adding PCI devices by the subsequent
> patches as we will need exact the same actions for processing
> DT PCI-IOMMU specifier.
> 
> While at it introduce NO_IOMMU to avoid magic "1".
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v4->v5:
> * rebase on top of "dynamic node programming using overlay dtbo" series
> * move #define NO_IOMMU 1 to header
> * s/these/this/ inside comment
> 
> v3->v4:
> * make dt_phandle_args *iommu_spec const
> * move !ops->add_device check to helper
> 
> v2->v3:
> * no change
> 
> v1->v2:
> * no change
> 
> downstream->v1:
> * trivial rebase
> * s/dt_iommu_xlate/iommu_dt_xlate/
> 
> (cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
>   the downstream branch poc/pci-passthrough from
>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>   xen/drivers/passthrough/device_tree.c | 48 +++++++++++++++++----------
>   xen/include/xen/iommu.h               |  2 ++
>   2 files changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 075fb25a3706..159ace9856c9 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -137,6 +137,30 @@ int iommu_release_dt_devices(struct domain *d)
>       return 0;
>   }
>   
> +static int iommu_dt_xlate(struct device *dev,
> +                          const struct dt_phandle_args *iommu_spec)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();

NIT: Rather than calling iommu_get_ops(), how about passing the ops as a 
parameter of iommu_dt_xlate()?

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

