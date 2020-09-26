Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE32279744
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 08:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kM3ie-00036x-Rn; Sat, 26 Sep 2020 06:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N180=DD=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kM3id-00036s-T7
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 06:30:03 +0000
X-Inumbo-ID: 70d3de85-1e59-4184-aad8-a672db791a00
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70d3de85-1e59-4184-aad8-a672db791a00;
 Sat, 26 Sep 2020 06:30:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 60DF068AFE; Sat, 26 Sep 2020 08:29:59 +0200 (CEST)
Date: Sat, 26 Sep 2020 08:29:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: Re: remove alloc_vm_area v2
Message-ID: <20200926062959.GA3427@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
 <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
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

On Fri, Sep 25, 2020 at 07:43:49PM -0700, Andrew Morton wrote:
> On Thu, 24 Sep 2020 15:58:42 +0200 Christoph Hellwig <hch@lst.de> wrote:
> 
> > this series removes alloc_vm_area, which was left over from the big
> > vmalloc interface rework.  It is a rather arkane interface, basicaly
> > the equivalent of get_vm_area + actually faulting in all PTEs in
> > the allocated area.  It was originally addeds for Xen (which isn't
> > modular to start with), and then grew users in zsmalloc and i915
> > which seems to mostly qualify as abuses of the interface, especially
> > for i915 as a random driver should not set up PTE bits directly.
> > 
> > Note that the i915 patches apply to the drm-tip branch of the drm-tip
> > tree, as that tree has recent conflicting commits in the same area.
> 
> Is the drm-tip material in linux-next yet?  I'm still seeing a non-trivial
> reject in there at present.

I assumed it was, but the reject imply that they aren't.  Tvrtko, do you
know the details?

