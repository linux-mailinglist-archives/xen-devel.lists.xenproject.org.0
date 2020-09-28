Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C727ADF8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:37:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsPc-0008Tr-Nh; Mon, 28 Sep 2020 12:37:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liDW=DF=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kMsPb-0008Te-HU
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:37:47 +0000
X-Inumbo-ID: da147c3e-f1ba-451e-bc4b-ee8c4f50e73c
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da147c3e-f1ba-451e-bc4b-ee8c4f50e73c;
 Mon, 28 Sep 2020 12:37:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0954568AFE; Mon, 28 Sep 2020 14:37:41 +0200 (CEST)
Date: Mon, 28 Sep 2020 14:37:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
Message-ID: <20200928123741.GA4999@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
 <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
 <20200926062959.GA3427@lst.de>
 <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
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

On Mon, Sep 28, 2020 at 01:13:38PM +0300, Joonas Lahtinen wrote:
> I think we have a gap that after splitting the drm-intel-next pull requests into
> two the drm-intel/for-linux-next branch is now missing material from
> drm-intel/drm-intel-gt-next.
> 
> I think a simple course of action might be to start including drm-intel-gt-next
> in linux-next, which would mean that we should update DIM tooling to add
> extra branch "drm-intel/gt-for-linux-next" or so.
> 
> Which specific patches are missing in this case?

The two dependencies required by my series not in mainline are:

    drm/i915/gem: Avoid implicit vmap for highmem on x86-32
    drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported

so it has to be one or both of those.

