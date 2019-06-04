Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4DB34E08
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:53:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCez-0004NO-Cj; Tue, 04 Jun 2019 16:51:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYCex-0004NA-Us
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:51:39 +0000
X-Inumbo-ID: 05b71820-86e9-11e9-bf07-bf227ddd872a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05b71820-86e9-11e9-bf07-bf227ddd872a;
 Tue, 04 Jun 2019 16:51:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D179223CF3;
 Tue,  4 Jun 2019 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559667099;
 bh=D1c+a98BsRBWK924tbZS+5XZwBCQb4N5j/4F2zC0M98=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=u4nheHIw5jmOjTpCAh1sU6VzEK6pYcDt6rliGG73wW62D4f/CizFXcLRFg6TMmP1z
 yCyP9kd9rA4FMH2I0wp3n5CkqEiiH5JwvKtpr/X32BjywChSkFdWidrmNmqV6pD0T+
 etuMVGsQBS6158xGQloetGwmbh2tFfOjkTFSU4UY=
Date: Tue, 4 Jun 2019 09:51:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
Message-ID: <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2103696393-1559666952=:14041"
Content-ID: <alpine.DEB.2.21.1906040951350.14041@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Julien.Grall@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2103696393-1559666952=:14041
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1906040951351.14041@sstabellini-ThinkPad-T480s>

On Mon, 3 Jun 2019, Boris Ostrovsky wrote:
> On 6/3/19 2:25 PM, Stefano Stabellini wrote:
> > On Tue, 28 May 2019, Boris Ostrovsky wrote:
> >> On 5/28/19 6:48 PM, Stefano Stabellini wrote:
> >>> From: Stefano Stabellini <stefanos@xilinx.com>
> >>>
> >>> On arm64 swiotlb is often (not always) already initialized by mem_init.
> >>> We don't want to initialize it twice, which would trigger a second
> >>> memory allocation. Moreover, the second memory pool is typically made of
> >>> high pages and ends up replacing the original memory pool of low pages.
> >>> As a side effect of this change, it is possible to have low pages in
> >>> swiotlb-xen on arm64.
> >>>
> >>> Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> >> Has this been tested on x86?
> > Yes, I managed to test it using QEMU. There are no effects on x86, as
> > the check io_tlb_start != 0 returns false.
> 
> I wonder though whether this is always the case.  When we are called
> from pci_xen_swiotlb_init_late() for example.

In that case, pci_xen_swiotlb_init_late() is called by
pcifront_connect_and_init_dma, which does:

	if (!err && !swiotlb_nr_tbl()) {
		err = pci_xen_swiotlb_init_late();
		if (err)
			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
	}

pci_xen_swiotlb_init_late() is only called when swiotlb_nr_tbl() returns
0. If swiotlb_nr_tbl() returns 0, certainly the swiotlb has not been
allocated yet, and the io_tlb_start != 0 check at the beginning of
xen_swiotlb_init will also fail. The code will take the normal
route, same as today. In short, there should be no effects on x86.
--8323329-2103696393-1559666952=:14041
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2103696393-1559666952=:14041--

