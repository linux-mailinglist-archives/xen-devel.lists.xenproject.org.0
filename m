Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D52445D6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 09:30:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6U9m-0007gT-R4; Fri, 14 Aug 2020 07:29:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oiW5=BY=casper.srs.infradead.org=batv+5626d0999dc7e381dd57+6200+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1k6U9k-0007gO-GG
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 07:29:41 +0000
X-Inumbo-ID: ef56681e-4833-4a39-9639-40c520018e59
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef56681e-4833-4a39-9639-40c520018e59;
 Fri, 14 Aug 2020 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AfrMrkrA2HZxTkg5Cv0NWjTzaYh5Z28RiUGGto0tVJU=; b=R3lBnAZpajlKS+ZYCmzCTpzXZE
 WGskKYnrQlnWOI08brF1QFByRNy9vewCqurBe8Sf7S6fS7hkYLfKSbxupKlE9RPQT9NbuzcWIwtfe
 +5b6TguaGGXn5Lcg34eWFhwMbYdHtbmQAHk8+UgjKsuOR5zYxZthbEqKTZgd7Q+IXKUIaTDTTy6hi
 EKm9u0BgGFiEAtjVzo/4P5mO2SjqiAw7Pb8SEMSUEqUKekpbo6VERpfF1Eai1/PwpiNTcC7tdq8M2
 5DDK5kk5wuflH/Kkdc/b25Aln3IQ3Kt2ErsOFEzjpFNp7ioD/PZIfZc2H1Ob+lJhV/YbogoRFnlP0
 SXuEMMGw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k6U9Q-0001lh-7m; Fri, 14 Aug 2020 07:29:20 +0000
Date: Fri, 14 Aug 2020 08:29:20 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Roger Pau Monn?? <roger.pau@citrix.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
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
Message-ID: <20200814072920.GA6126@infradead.org>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813075420.GC975@Air-de-Roger>
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

On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monn?? wrote:
> On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> > On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > > functionality untangles Xen balloon and RAM hotplug from the usage of
> > > unpopulated physical memory ranges to map foreign pages, which is the
> > > correct thing to do in order to avoid mappings of foreign pages depend
> > > on memory hotplug.
> > 
> > So please just select ZONE_DEVICE if this is so much better rather
> > than maintaining two variants.
> 
> We still need to other variant for Arm at least, so both need to be
> maintained anyway, even if we force ZONE_DEVICE on x86.

Well, it still really helps reproducability if you stick to one
implementation of x86.

The alternative would be an explicit config option to opt into it,
but just getting a different implementation based on a random
kernel option is strange.

