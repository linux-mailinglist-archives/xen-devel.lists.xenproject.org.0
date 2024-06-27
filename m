Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43640919F99
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 08:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749743.1157980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMizd-0001PV-52; Thu, 27 Jun 2024 06:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749743.1157980; Thu, 27 Jun 2024 06:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMizd-0001NG-1q; Thu, 27 Jun 2024 06:52:29 +0000
Received: by outflank-mailman (input) for mailman id 749743;
 Thu, 27 Jun 2024 06:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vG3Y=N5=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1sMiza-0001NA-Oa
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 06:52:27 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cde5c433-3451-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 08:52:22 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 7EB9F1D6A67;
 Thu, 27 Jun 2024 08:52:21 +0200 (CEST)
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
X-Inumbo-ID: cde5c433-3451-11ef-b4bb-af5377834399
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1719471141; bh=JqKNk6DK7c39as3qr7GxZRvQ/NXaR2TqXX/2BAiLjxo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p9rfRQ8t2qyHzmBjsliZOBTEO2ISxen4UX5Sxsfz8PgsUtI20CIfRJu0MK3VXZ2tm
	 uHCPZP9NV2nljjajcaLakFHetbrN/pnZeva2u6k4o1+a1EJmcbBYKNZGMEqBiWGaOp
	 WVpLkfsPIgV/OTuKoph7CFY2HUh9svE+P49yg84fZ5Y4mXWKeXMgeD+4Gw861dYuGb
	 9uD1JECTBxJoRLsbEK5hyAZzY/Z0MH2l7a4p96XSkbJ6z0JUkR5yuicOZoPOb8FbRT
	 Sxv5cwOeZTe38weQ/3M+A+xW3dfkOTM8kFKGKQ/i6ckA6KUb8+cY0Np+ry2pt/gJ8R
	 rAwtsJe8amWTQ==
Date: Thu, 27 Jun 2024 08:52:16 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: "hch@lst.de" <hch@lst.de>
Cc: Michael Kelley <mhklinux@outlook.com>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <20240627085216.556744c1@meshulam.tesarici.cz>
In-Reply-To: <20240627060251.GA15590@lst.de>
References: <20240607031421.182589-1-mhklinux@outlook.com>
	<SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240627060251.GA15590@lst.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Jun 2024 08:02:51 +0200
"hch@lst.de" <hch@lst.de> wrote:

> On Wed, Jun 26, 2024 at 11:58:13PM +0000, Michael Kelley wrote:
> > > This patch trades off making many of the core swiotlb APIs take
> > > an additional argument in order to avoid duplicating calls to
> > > swiotlb_find_pool(). The current code seems rather wasteful in
> > > making 6 calls per round-trip, but I'm happy to accept others'
> > > judgment as to whether getting rid of the waste is worth the
> > > additional code complexity.  
> > 
> > Quick ping on this RFC.  Is there any interest in moving forward?
> > Quite a few lines of code are affected because of adding the
> > additional "pool" argument to several functions, but the change
> > is conceptually pretty simple.  
> 
> Yes, this looks sensible to me.  I'm tempted to apply it.

Oh, right. The idea is good, but I was not able to reply immediately
and then forgot about it.

For the record, I considered an alternative: Call swiotlb_* functions
unconditionally and bail out early if the pool is NULL. But it's no
good, because is_swiotlb_buffer() can be inlined, so this approach
would replace a quick check with a function call. And then there's also
swiotlb_tbl_unmap_single()...

I have only a very minor suggestion: Could is_swiotlb_buffer() be
renamed now that it no longer returns a bool? OTOH I have no good
immediate idea myself.

Petr T

