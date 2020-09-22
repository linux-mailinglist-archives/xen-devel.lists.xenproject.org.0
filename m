Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35094274473
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:39:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjRo-0007Fn-L0; Tue, 22 Sep 2020 14:39:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dLPN=C7=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kKjRn-0007Fi-4Y
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:39:11 +0000
X-Inumbo-ID: ccab6472-0528-471c-bf43-d019570ac61a
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccab6472-0528-471c-bf43-d019570ac61a;
 Tue, 22 Sep 2020 14:39:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CD86767373; Tue, 22 Sep 2020 16:39:06 +0200 (CEST)
Date: Tue, 22 Sep 2020 16:39:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20200922143906.GB26664@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org> <20200922062249.GA30831@lst.de>
 <20200922112144.GB32101@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922112144.GB32101@casper.infradead.org>
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

On Tue, Sep 22, 2020 at 12:21:44PM +0100, Matthew Wilcox wrote:
> Actually, vfree() will work today; I cc'd you on a documentation update
> to make it clear that this is permitted.

vfree calls __free_pages, the i915 and a lot of other code calls
put_page.  They are mostly the same, but not quite and everytime I
look into that mess I'm more confused than before.

Can someone in the know write sensible documentation on when to use
__free_page(s) vs put_page?

