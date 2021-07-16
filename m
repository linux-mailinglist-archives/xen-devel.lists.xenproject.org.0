Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E223CB28E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 08:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156989.289713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4HLq-0004OP-JK; Fri, 16 Jul 2021 06:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156989.289713; Fri, 16 Jul 2021 06:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4HLq-0004La-Fs; Fri, 16 Jul 2021 06:29:34 +0000
Received: by outflank-mailman (input) for mailman id 156989;
 Fri, 16 Jul 2021 06:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=acOe=MI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m4HLo-0004LU-Jd
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 06:29:32 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85ee40c5-4813-486e-89f2-8921695f13ae;
 Fri, 16 Jul 2021 06:29:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DAEDE67373; Fri, 16 Jul 2021 08:29:28 +0200 (CEST)
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
X-Inumbo-ID: 85ee40c5-4813-486e-89f2-8921695f13ae
Date: Fri, 16 Jul 2021 08:29:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>
Subject: Re: [PATCH v1 01/16] dma-mapping: Allow map_sg() ops to return
 negative error codes
Message-ID: <20210716062928.GA13345@lst.de>
References: <20210715164544.6827-1-logang@deltatee.com> <20210715164544.6827-2-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-2-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 15, 2021 at 10:45:29AM -0600, Logan Gunthorpe wrote:
> +	 * dma_map_sgtable() will return the error code returned and convert
> +	 * a zero return (for legacy implementations) into -EINVAL.
> +	 *
> +	 * dma_map_sg() will always return zero on any negative or zero
> +	 * return to satisfy its own calling convention.
>  	 */

I don't think this belongs here.

> +EXPORT_SYMBOL(dma_map_sgtable);

EXPORT_SYMBOL_GPL, please.

