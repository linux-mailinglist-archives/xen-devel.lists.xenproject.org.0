Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97DD417E76
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195718.348548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv1K-0007Dq-25; Fri, 24 Sep 2021 23:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195718.348548; Fri, 24 Sep 2021 23:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv1J-0007C2-UO; Fri, 24 Sep 2021 23:54:21 +0000
Received: by outflank-mailman (input) for mailman id 195718;
 Fri, 24 Sep 2021 23:54:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTv1I-0007Bw-8E
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:54:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb9708de-1d92-11ec-bb29-12813bfff9fa;
 Fri, 24 Sep 2021 23:54:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66C0160E75;
 Fri, 24 Sep 2021 23:54:18 +0000 (UTC)
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
X-Inumbo-ID: bb9708de-1d92-11ec-bb29-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632527658;
	bh=TRAlP3p69GeUfeKyiaMW8KGao8NRc+06mZvJs8GApSo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EtWc/wN8cYfZL2s1zzsy0R5YUguLdcySb5a4xXHSZPSzCGOYcg6SI3M/UVtJkAr+w
	 1OJmUwjuC3UKkWtasHjC7w+aBzEOShiyE/gym66pRvGCeWnK79ZuLWai4UOzfOVDRv
	 6uMUyvX+1L1qyk0U7Igc6LiCjzN6ej/icljIP25oKB7Axmr9MHZnhh8y27liOQ3d6v
	 H8X0NFam3at4jgOnyV+xRkl0XU4i+mSJ1PF0fIDm+KPemG+EayNWPlAVYaf3cP2C+A
	 P4Wxp93q8ZcKgF9LpbdZFwmFiJOklJTW5piHDyGosYn+rkeCBhzKqTejtKdrschRTv
	 EUOEr4jk69nRg==
Date: Fri, 24 Sep 2021 16:54:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating
 one
In-Reply-To: <20210923125438.234162-6-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241653510.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-6-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> While adding a PCI device mark it as such, so other frameworks
> can distinguish it form DT devices.
                     ^ from

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Since v1:
>  - Moved the assignment from iommu_add_device to alloc_pdev
> ---
>  xen/drivers/passthrough/pci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 633e89ac1311..fc3469bc12dc 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->bus) = bus;
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
> +#ifdef CONFIG_ARM
> +    pci_to_dev(pdev)->type = DEV_PCI;
> +#endif
>  
>      rc = pdev_msi_init(pdev);
>      if ( rc )
> -- 
> 2.25.1
> 

