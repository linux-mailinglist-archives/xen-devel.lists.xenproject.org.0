Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118DA50CC5A
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 18:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311732.528981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niIq0-00005o-2m; Sat, 23 Apr 2022 16:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311732.528981; Sat, 23 Apr 2022 16:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niIpz-0008VF-Vt; Sat, 23 Apr 2022 16:42:23 +0000
Received: by outflank-mailman (input) for mailman id 311732;
 Sat, 23 Apr 2022 16:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nM19=VB=bombadil.srs.infradead.org=BATV+786c894e6a19374922de+6817+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1niIpx-0008V4-KE
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 16:42:21 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57924a14-c324-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 18:42:20 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1niIpu-004etX-T8; Sat, 23 Apr 2022 16:42:18 +0000
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
X-Inumbo-ID: 57924a14-c324-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BbU4qU1u+ib3z06jcjxtpWxewOhWeGRACT3SUClYfQU=; b=AhrDqdLN83fA5xLD4BM2GP2cPe
	ZPFamzRoBUWgZ6TueAJd/LnTpCkqpIraOwxxnFdhh10vSqfwomorASN5nrlTp8V9Dry0dnGRxjjEw
	v7JuhY6ox9FidKp5Hlp3HLTXDr3Vz4TBvr3dE48LvKPTfesNhxqNIb3L+LJJZDQI1E1E05OFk7nZJ
	fdgfnxdUNoQrEcTt1wwc5Cy5Dh82uK7C4oGDIf7aO2Wy+2OHkl7W87Jqi1aFlc6+I3039Se/GEDo3
	evKCQOC1ENaEsIIIjNzCQtGidYDx7645wDthEjcAzr29ZEXmNny8nn/OVrakWVtN9qIAf8TKvLahV
	rbi2qx6g==;
Date: Sat, 23 Apr 2022 09:42:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 6/6] arm/xen: Assign xen-grant DMA ops for xen-grant
 DMA devices
Message-ID: <YmQsagqMn56jidFZ@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-7-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650646263-22047-7-git-send-email-olekstysh@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 22, 2022 at 07:51:03PM +0300, Oleksandr Tyshchenko wrote:
>  static inline void xen_setup_dma_ops(struct device *dev)
>  {
>  #ifdef CONFIG_XEN
> -	if (xen_swiotlb_detect())
> +	if (arch_has_restricted_virtio_memory_access() &&
> +			xen_is_grant_dma_device(dev))
> +		xen_grant_setup_dma_ops(dev);
> +	else if (xen_swiotlb_detect())

I don't think that arch_has_restricted_virtio_memory_access
check should be there as it still is a bit of a layering violation.


