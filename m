Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207550CC4C
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 18:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311712.528960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niIgW-0006P6-Oo; Sat, 23 Apr 2022 16:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311712.528960; Sat, 23 Apr 2022 16:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niIgW-0006Mi-LG; Sat, 23 Apr 2022 16:32:36 +0000
Received: by outflank-mailman (input) for mailman id 311712;
 Sat, 23 Apr 2022 16:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nM19=VB=bombadil.srs.infradead.org=BATV+786c894e6a19374922de+6817+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1niIgS-0006Mc-W7
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 16:32:34 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6dc1c21-c322-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 18:32:30 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1niIgK-004dlm-8q; Sat, 23 Apr 2022 16:32:24 +0000
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
X-Inumbo-ID: f6dc1c21-c322-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tm0gSqV7/P9ncZVPB8LqYHR3Gz1xeU6baJ61OHE1BW8=; b=udvQngrutqjVgHNdHAkQtTYj4Z
	uj9eaEdm3fjU1uTVZOIo8pU0/Xxa1IKlKSUeYPCiWaC9FpsXAJEnJgqJz/yitw2wTHWU0tEc7LSB0
	X0fJM5ntfIPoWNdpv6L+CjuafNJPUUUUSwV8L4ktUqnMQ1hQBI8wsyqfk1dQwn/uh4gWv85fnhRh5
	/2X1dbCuYTh75gIu7ru2dCAx8PLj/duLjwK9+USlnlkZAl5R53zH9b1eckSJdfd8QiJmEOQ/WBdN7
	56vfH6cgCE6eS5U3OAlXcaMK1noDeWW7GbezDKIaRw7AZsWDTsNetOJKT90zCvQ8NQKBlrdbciioY
	HZy5IN0A==;
Date: Sat, 23 Apr 2022 09:32:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	David Hildenbrand <david@redhat.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Kees Cook <keescook@chromium.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 1/6] arm/xen: Introduce xen_setup_dma_ops()
Message-ID: <YmQqGOoNDwkKSbZr@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-2-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650646263-22047-2-git-send-email-olekstysh@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 22, 2022 at 07:50:58PM +0300, Oleksandr Tyshchenko wrote:
> +#ifndef _ASM_ARM_XEN_OPS_H
> +#define _ASM_ARM_XEN_OPS_H
> +
> +#include <xen/swiotlb-xen.h>
> +
> +static inline void xen_setup_dma_ops(struct device *dev)
> +{
> +#ifdef CONFIG_XEN
> +	if (xen_swiotlb_detect())
> +		dev->dma_ops = &xen_swiotlb_dma_ops;
> +#endif

Maybe create a proper !CONFIG_XEN stub for xen_swiotlb_detect instead
of the ifdef here, but otherwise this looks good to me.

