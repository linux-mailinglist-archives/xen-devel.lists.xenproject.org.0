Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21C961F8B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 08:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784494.1193851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjC3V-0004lX-Hd; Wed, 28 Aug 2024 06:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784494.1193851; Wed, 28 Aug 2024 06:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjC3V-0004iY-DQ; Wed, 28 Aug 2024 06:21:21 +0000
Received: by outflank-mailman (input) for mailman id 784494;
 Wed, 28 Aug 2024 06:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIbb=P3=gaisler.com=andreas@srs-se1.protection.inumbo.net>)
 id 1sjC3T-0004iS-1j
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 06:21:19 +0000
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbaae71f-6505-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 08:21:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4WtvSD4CTtz1FXRy;
 Wed, 28 Aug 2024 08:21:16 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4WtvSC6CZ0z1DPkN;
 Wed, 28 Aug 2024 08:21:15 +0200 (CEST)
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
X-Inumbo-ID: bbaae71f-6505-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1724826076;
	bh=MZjaRsFFki5Bx5B5FHnglUd9d4H7fBDSxyu2jHiKATQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H9fF3GHsObx42DQlccYjWkCaI8H7IjrygcJqC6jNaK4z0Z18apld5cXSgQVOUCs01
	 KKScBf0M+KhxqxD5GBoovtvU90uovoSytFCOkAnhgzKqOSnS+qVrnNytVlHc49wNmn
	 MMSVwYK7ONDpeF3VHN8cIXWAeIenPfu7ecQ0hXO8=
Message-ID: <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
Date: Wed, 28 Aug 2024 08:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-mapping: clearly mark DMA ops as an architecture
 feature
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240828061104.1925127-3-hch@lst.de>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20240828061104.1925127-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-28 08:10, Christoph Hellwig wrote:
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -177,8 +177,8 @@ config XEN_GRANT_DMA_ALLOC
>  
>  config SWIOTLB_XEN
>  	def_bool y
> +	depends on ARCH_DMA_OPS

Rename to ARCH_HAS_DMA_OPS in v2 is missing here

>  	depends on XEN_PV || ARM || ARM64
> -	select DMA_OPS
>  	select SWIOTLB
>  
>  config XEN_PCI_STUB
> @@ -348,10 +348,10 @@ config XEN_GRANT_DMA_IOMMU
>  
>  config XEN_GRANT_DMA_OPS
>  	bool
> -	select DMA_OPS
>  
>  config XEN_VIRTIO
>  	bool "Xen virtio support"
> +	depends on ARCH_DMA_OPS

and here.

Cheers,
Andreas


