Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D992744C4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:53:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjfx-0001Ei-DI; Tue, 22 Sep 2020 14:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z9V7=C7=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kKjfw-0001DN-2i
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:53:48 +0000
X-Inumbo-ID: b12d60e5-7208-4cfe-b475-ab0ea0decd82
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b12d60e5-7208-4cfe-b475-ab0ea0decd82;
 Tue, 22 Sep 2020 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PwB7PgSBMCf1i80JEZZeqaAM6Spcvmy9ewYyeFjPsVI=; b=uqlDPU6SPAe3x1DDKo8G1qtut1
 YwG3PA4mc8CLJ1oJyPiko0/UbU5ybdUeleXBeV8YHEyvVNYLAMBaj9YGVnr8/JyuAmcKGkiiTdejs
 bVQysHpa55j4+LiObyETCdlPouw9Nwil/VnTPyLQvh9hBrpeU/Wmc3llTMeW/vjL27ShndfDs1p17
 1HtwFHqpD+N1OhT15+cuZIdFzM2p+uhSCE063YoA7faH9tQzfuFItic4W+TEbWs9VLsTKgtP5hMCZ
 z1+P1JChn7/bURfHcxuqNO0QLmQHNZ4osoavXcBcFeMSltMsN9VNgTTTzxDcDVb8dMbZA2ChSspNL
 P4owvfJg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kKjfX-0001op-62; Tue, 22 Sep 2020 14:53:23 +0000
Date: Tue, 22 Sep 2020 15:53:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
Message-ID: <20200922145323.GG32101@casper.infradead.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org>
 <20200922062249.GA30831@lst.de>
 <20200922112144.GB32101@casper.infradead.org>
 <20200922143906.GB26664@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922143906.GB26664@lst.de>
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

On Tue, Sep 22, 2020 at 04:39:06PM +0200, Christoph Hellwig wrote:
> On Tue, Sep 22, 2020 at 12:21:44PM +0100, Matthew Wilcox wrote:
> > Actually, vfree() will work today; I cc'd you on a documentation update
> > to make it clear that this is permitted.
> 
> vfree calls __free_pages, the i915 and a lot of other code calls
> put_page.  They are mostly the same, but not quite and everytime I
> look into that mess I'm more confused than before.
> 
> Can someone in the know write sensible documentation on when to use
> __free_page(s) vs put_page?

I started on that, and then I found a bug that's been lurking for 12
years, so that delayed the documentation somewhat.  The short answer is
that __free_pages() lets you free non-compound high-order pages while
put_page() can only free order-0 and compound pages.

I would really like to overhaul our memory allocation APIs:

current			new
__get_free_page(s)	alloc_page(s)
free_page(s)		free_page(s)
alloc_page(s)		get_free_page(s)
__free_pages		put_page_order

Then put_page() and put_page_order() are more obviously friends.

But I cannot imagine a world in which Linus says yes to that upheaval.
He's previous expressed dislike of the get_free_page() family of APIs,
and thinks all those callers should just use kmalloc().  Maybe we can
make that transition happen, now that kmalloc() aligns larger allocations.

