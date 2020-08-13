Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A7243508
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 09:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k67kN-0000HZ-Uo; Thu, 13 Aug 2020 07:33:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ccX4=BX=casper.srs.infradead.org=batv+f680953178fe677ce029+6199+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1k67kM-0000HU-OG
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 07:33:59 +0000
X-Inumbo-ID: 25567889-5515-40f9-bb85-013ec6f67839
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25567889-5515-40f9-bb85-013ec6f67839;
 Thu, 13 Aug 2020 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=n009f/kUZMBxeE9pa5fT61XhvAWtOw5mBgdxS83PReo=; b=ewJyWfwnC0ik8H5uYBiEUgc8qw
 K63WWJCeQW4URaGKnP3bJMPhOeNmCl2r9HBvMuBF5dnPSDi8IguASNmb9WnUMfX35v7tUdKgFGFCW
 Dtj3+9pGtaUNV1A0c9hR3AuKvEvmwPsTGz7CdUiiK72F1NKLNVYLne0AFgg3IxB84iFmDaBPPqdCN
 98A2cAaqK05f0BcTc/VKFvGqXMkJDnpSnL0u8/j7l7/KKtWqcE/WeKXf9jtab+8IXs8AoM2QX86Rw
 M7XZhcIHa7215LpMf+9bwNqMSJV4NC2heYZc0INb8N2zFJgS3OXmU9ZX71SIlSr+dz2hYCatmYO7x
 NvJ0/4jQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k67k1-0004FT-VS; Thu, 13 Aug 2020 07:33:38 +0000
Date: Thu, 13 Aug 2020 08:33:37 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200813073337.GA16160@infradead.org>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811094447.31208-3-roger.pau@citrix.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> If enabled (because ZONE_DEVICE is supported) the usage of the new
> functionality untangles Xen balloon and RAM hotplug from the usage of
> unpopulated physical memory ranges to map foreign pages, which is the
> correct thing to do in order to avoid mappings of foreign pages depend
> on memory hotplug.

So please just select ZONE_DEVICE if this is so much better rather
than maintaining two variants.

