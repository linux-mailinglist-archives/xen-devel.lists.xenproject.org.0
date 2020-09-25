Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F593278D8B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 18:03:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLqBP-0006Jg-H3; Fri, 25 Sep 2020 16:02:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G0Vx=DC=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kLqBO-0006Jb-HX
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 16:02:50 +0000
X-Inumbo-ID: 26fa0f34-fd53-4333-9db3-6b3034bd718d
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26fa0f34-fd53-4333-9db3-6b3034bd718d;
 Fri, 25 Sep 2020 16:02:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CB6F368B02; Fri, 25 Sep 2020 18:02:42 +0200 (CEST)
Date: Fri, 25 Sep 2020 18:02:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 x86@kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Minchan Kim <minchan@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nitin Gupta <ngupta@vflare.org>
Subject: Re: [Intel-gfx] [PATCH 08/11] drm/i915: use vmap in
 i915_gem_object_map
Message-ID: <20200925160242.GA18229@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-9-hch@lst.de>
 <CAM0jSHPaqpX2A5T4iybfLF+F=cBX05GW8u54cUe7AG0QKDJt2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHPaqpX2A5T4iybfLF+F=cBX05GW8u54cUe7AG0QKDJt2g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Fri, Sep 25, 2020 at 03:08:59PM +0100, Matthew Auld wrote:
> > +       i = 0;
> > +       for_each_sgt_page(page, iter, obj->mm.pages)
> > +               pages[i++] = page;
> > +       vaddr = vmap(pages, n_pages, 0, pgprot);
> > +       if (pages != stack)
> > +               kvfree(pages);
> > +       return vaddr;
> > +}

> > -       return area->addr;
> > +       for_each_sgt_daddr(addr, iter, obj->mm.pages)
> > +               pfns[i++] = (iomap + addr) >> PAGE_SHIFT;
> 
> Missing the i = 0 fix from Dan?

Yeah, looks like I only managed to apply the one in the page based
version above.

