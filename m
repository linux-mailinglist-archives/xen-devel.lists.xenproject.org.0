Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136737E347E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 05:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628554.980138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DY6-0006gD-5U; Tue, 07 Nov 2023 04:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628554.980138; Tue, 07 Nov 2023 04:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DY6-0006dQ-21; Tue, 07 Nov 2023 04:18:46 +0000
Received: by outflank-mailman (input) for mailman id 628554;
 Tue, 07 Nov 2023 04:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGpL=GU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r0DY4-0006dK-1s
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 04:18:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba5a176d-7d24-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 05:18:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EBFF461118;
 Tue,  7 Nov 2023 04:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD399C433C7;
 Tue,  7 Nov 2023 04:18:35 +0000 (UTC)
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
X-Inumbo-ID: ba5a176d-7d24-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699330718;
	bh=5PvihFHBU7SqgdRwrtVBo1+6I/pEiB/RH5ISX/VMPpA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bp79TRjy24dSDD/qE6n8ck8XIFc1iINY8FONEu+yGlfyIKf7sAGTIkE76bM888oZi
	 t/diEaICWenT4mb89FLqqlQdr/kMR8ohF/pvt10vL2t3MlUQZ7W5Ej0iBA4Ey2oOkN
	 piKy8MQFGWSR8jbtWOGfriFcQA+cCu5jAMkoeQ0AKDSBphqAXqQgoJX2EBGq7AUs9m
	 ioOn9opMSHLLz4obHlrt6gDID/c0CNS2W8XpnuwKZL3U7uIcedn3ZGSugjsSZyBJeb
	 8rD6UJHi0B64OlMSCYXWFRgCRWeUB583TG1QBgNuSaaCB5p2ZG8ANgU7du4WCoaekW
	 pOdtrknRPGb8A==
Date: Mon, 6 Nov 2023 20:18:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mikulas Patocka <mpatocka@redhat.com>
cc: Mike Snitzer <snitzer@kernel.org>, Keith Busch <kbusch@kernel.org>, 
    Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iommu@lists.linux.dev, 
    Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>, 
    Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>, 
    Jan Kara <jack@suse.cz>, Vlastimil Babka <vbabka@suse.cz>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
    stable@vger.kernel.org, regressions@lists.linux.dev, 
    Alasdair Kergon <agk@redhat.com>, dm-devel@lists.linux.dev, 
    linux-mm@kvack.org
Subject: Re: [PATCH v2] swiotlb-xen: provide the "max_mapping_size" method
In-Reply-To: <151bef41-e817-aea9-675-a35fdac4ed@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2311061211080.3478774@ubuntu-linux-20-04-desktop>
References: <3cb4133c-b6db-9187-a678-11ed8c9456e@redhat.com> <ZUUctamEFtAlSnSV@mail-itl> <ZUUlqJoS6_1IznzT@kbusch-mbp.dhcp.thefacebook.com> <ZUVYT1Xp4+hFT27W@mail-itl> <ZUV3TApYYoh_oiRR@kbusch-mbp.dhcp.thefacebook.com> <11a9886d-316c-edcd-d6da-24ad0b9a2b4@redhat.com>
 <ZUZOKitOAqqKiJ4n@kbusch-mbp.dhcp.thefacebook.com> <20231106071008.GB17022@lst.de> <928b5df7-fada-cf2f-6f6a-257a84547c3@redhat.com> <ZUkDUXDF6g4P86F3@kbusch-mbp.dhcp.thefacebook.com> <ZUkGpblDX637QV9y@redhat.com>
 <151bef41-e817-aea9-675-a35fdac4ed@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-46487316-1699301481=:3478774"
Content-ID: <alpine.DEB.2.22.394.2311062018170.3478774@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-46487316-1699301481=:3478774
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311062018171.3478774@ubuntu-linux-20-04-desktop>

On Mon, 6 Nov 2023, Mikulas Patocka wrote:
> From: Keith Busch <kbusch@kernel.org>
> 
> There's a bug that when using the XEN hypervisor with bios with large
> multi-page bio vectors on NVMe, the kernel deadlocks [1].
> 
> The deadlocks are caused by inability to map a large bio vector -
> dma_map_sgtable always returns an error, this gets propagated to the block
> layer as BLK_STS_RESOURCE and the block layer retries the request
> indefinitely.
> 
> XEN uses the swiotlb framework to map discontiguous pages into contiguous
> runs that are submitted to the PCIe device. The swiotlb framework has a
> limitation on the length of a mapping - this needs to be announced with
> the max_mapping_size method to make sure that the hardware drivers do not
> create larger mappings.
> 
> Without max_mapping_size, the NVMe block driver would create large
> mappings that overrun the maximum mapping size.
> 
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Link: https://lore.kernel.org/stable/ZTNH0qtmint%2FzLJZ@mail-itl/ [1]
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Keith Busch <kbusch@kernel.org>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/swiotlb-xen.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux-stable/drivers/xen/swiotlb-xen.c
> ===================================================================
> --- linux-stable.orig/drivers/xen/swiotlb-xen.c	2023-11-03 17:57:18.000000000 +0100
> +++ linux-stable/drivers/xen/swiotlb-xen.c	2023-11-06 15:30:59.000000000 +0100
> @@ -405,4 +405,5 @@ const struct dma_map_ops xen_swiotlb_dma
>  	.get_sgtable = dma_common_get_sgtable,
>  	.alloc_pages = dma_common_alloc_pages,
>  	.free_pages = dma_common_free_pages,
> +	.max_mapping_size = swiotlb_max_mapping_size,
>  };
--8323329-46487316-1699301481=:3478774--

