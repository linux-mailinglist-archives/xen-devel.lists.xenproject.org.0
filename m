Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A7453D06
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 01:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226586.391587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn8VE-0005rX-Qr; Wed, 17 Nov 2021 00:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226586.391587; Wed, 17 Nov 2021 00:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn8VE-0005o7-N1; Wed, 17 Nov 2021 00:08:40 +0000
Received: by outflank-mailman (input) for mailman id 226586;
 Wed, 17 Nov 2021 00:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4lz=QE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mn8VC-0005o1-HS
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 00:08:38 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 815d2658-473a-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 01:08:36 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2FA9613A7;
 Wed, 17 Nov 2021 00:08:33 +0000 (UTC)
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
X-Inumbo-ID: 815d2658-473a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637107714;
	bh=ViAGOyVm8Tq61FZIJJwIJ74Z+YlW1ALXCAxCAqiirqk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bz5JziWHPoKNEVHvj2nEAmUYWoSfBvxx+swpBle5mB7OysaDOLAYEe9NIhcISyff+
	 pUkBG3AW4K2sYClBgK9/j8qhqT+2NlLmHcB17vmjBothhaVvuoSV95/co1juk4Q4Z0
	 A9wj0JSIlYBkSAn3IvwClO0HcuzMn3xM44TY82lhUTP+MRYvIbJ/xTzAAWuKPjznUy
	 pJb0LPXW+6PZm7ZB6u1f5UYJPESLsaghYE7avBhJ2rEy3wASDmkAvRmK0j/OL169sP
	 n7wRX0Wp2bnd0W0tRF8T+2wMW2pVUKXUIsg4esUI5kyLIuqNV7bbhZdGcWcLjlO44q
	 q8BqtUDwpB+VA==
Date: Tue, 16 Nov 2021 16:08:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH v3 00/10] direct-map memory map
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2111161607360.1412361@ubuntu-linux-20-04-desktop>
References: <20211116063155.901183-1-penny.zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Nov 2021, Penny Zheng wrote:
> Cases where domU needs direct-map memory map:
>   * IOMMU not present in the system.
>   * IOMMU disabled if it doesn't cover a specific device and all the guests
> are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
> a few without, then guest DMA security still could not be totally guaranteed.
> So users may want to disable the IOMMU, to at least gain some performance
> improvement from IOMMU disabled.
>   * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
> To be specific, in a few extreme situation, when multiple devices do DMA
> concurrently, these requests may exceed IOMMU's transmission capacity.
>   * IOMMU disabled when it adds too much latency on DMA. For example,
> TLB may be missing in some IOMMU hardware, which may bring latency in DMA
> progress, so users may want to disable it in some realtime scenario.
>   * Guest OS relies on the host memory layout
> 
> "direct-map" property shall be added under the appropriate domain node,
> when users requesting direct-map memory mapping for the domain.
> 
> Right now, direct-map is only supported when domain on Static Allocation,
> that is, "xen,static-mem" is also necessary in the domain configuration.
> 
> Looking into related [design link](
> https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
> for more details.
> 
> The whole design is about Static Allocation and direct-map, and this
> Patch Serie only covers parts of it, which are direct-map memory map.
> Other features will be delievered through different patch series.
> 
> See https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00855.html
> for Domain on Static Allocation.
> 
> This patch serie is based on
> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00822.html

I haven't had a chance to review the series but I wanted to say that I
tested it successfully both with and without direct-map, so:

Tested-by: Stefano Stabellini <sstabellini@kernel.org>

