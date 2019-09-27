Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9283C0E29
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 00:53:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDz4G-0008I1-Kj; Fri, 27 Sep 2019 22:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZXP=XW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDz4F-0008Hw-Im
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 22:50:27 +0000
X-Inumbo-ID: 3277c216-e179-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 3277c216-e179-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 22:50:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC9392082F;
 Fri, 27 Sep 2019 22:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569624626;
 bh=lChWrz9sxaWdz2fQgnnV7ffDcmDG443fqRM/kaplau4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zmS8miD2mQf2QcORA4YgjcazyYIkeYJDQyXnWVz8UaPjjirY5sCna3TiGgjyTwFNo
 AHyfyKYDS5Xf2YAV34yaYhdg7TD1x8oHV6FRKVWPYrNBfwYNZffe2fedEu2I5xqqQV
 pctPCDbwhiMbV3EuNAvLI7RM+BX7cC37TiFNzyO4=
Date: Fri, 27 Sep 2019 15:50:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <71f1a62c-551c-97e1-2e1a-94339ab6e7d9@gmail.com>
Message-ID: <alpine.DEB.2.21.1909271544030.2594@sstabellini-ThinkPad-T480s>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
 <71f1a62c-551c-97e1-2e1a-94339ab6e7d9@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1272937354-1569624626=:2594"
Subject: Re: [Xen-devel] [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: sstabellini@kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 volodymyr_babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1272937354-1569624626=:2594
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 26 Sep 2019, Oleksandr wrote:
> On 26.09.19 17:56, Julien Grall wrote:
> > Hi,
> 
> Hi Julien
> 
> 
> > 
> > On 9/26/19 12:20 PM, Oleksandr Tyshchenko wrote:
> > > Oleksandr Tyshchenko (8):
> > >    iommu/arm: Add iommu_helpers.c file to keep common for IOMMUs stuff
> > >    iommu/arm: Add ability to handle deferred probing request
> > >    xen/common: Introduce _xrealloc function
> > >    xen/common: Introduce xrealloc_flex_struct() helper macros
> > >    iommu/arm: Add lightweight iommu_fwspec support
> > >    iommu: Order the headers alphabetically in device_tree.c
> > >    iommu/arm: Introduce iommu_add_dt_device API
> > >    iommu/arm: Add Renesas IPMMU-VMSA support
> > 
> > This series is now merged.
> 
> Thank you!

I just wanted to provide early feedback that this series causes problems
with the legacy mmu-masters binding:

(XEN) Failed to add /amba/dma@fd500000 to the IOMMU
(XEN) Failed to add /amba/dma@fd510000 to the IOMMU
(XEN) Failed to add /amba/dma@fd520000 to the IOMMU
(XEN) Failed to add /amba/dma@fd530000 to the IOMMU
(XEN) Failed to add /amba/dma@fd540000 to the IOMMU
(XEN) Failed to add /amba/dma@fd550000 to the IOMMU
(XEN) Failed to add /amba/dma@fd560000 to the IOMMU
(XEN) Failed to add /amba/dma@fd570000 to the IOMMU
(XEN) Failed to add /amba/dma@ffa80000 to the IOMMU
(XEN) Failed to add /amba/dma@ffa90000 to the IOMMU
(XEN) Failed to add /amba/dma@ffaa0000 to the IOMMU
(XEN) Failed to add /amba/dma@ffab0000 to the IOMMU
(XEN) Failed to add /amba/dma@ffac0000 to the IOMMU
(XEN) Failed to add /amba/dma@ffad0000 to the IOMMU
(XEN) Failed to add /amba/dma@ffae0000 to the IOMMU
(XEN) Failed to add /amba/dma@ffaf0000 to the IOMMU
(XEN) Failed to add /amba/nand@ff100000 to the IOMMU
(XEN) Failed to add /amba/ethernet@ff0b0000 to the IOMMU
(XEN) Failed to add /amba/ethernet@ff0c0000 to the IOMMU
(XEN) Failed to add /amba/ethernet@ff0d0000 to the IOMMU
(XEN) Failed to add /amba/spi@ff0f0000 to the IOMMU
(XEN) Failed to add /amba/sdhci@ff160000 to the IOMMU
(XEN) Failed to add /amba/sdhci@ff170000 to the IOMMU
(XEN) Failed to add /amba/usb@fe200000 to the IOMMU
(XEN) Failed to add /amba/usb@fe300000 to the IOMMU

Booting fails and also even forcing to continue devices are unusable. I
haven't managed to investigate further.
--8323329-1272937354-1569624626=:2594
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1272937354-1569624626=:2594--

