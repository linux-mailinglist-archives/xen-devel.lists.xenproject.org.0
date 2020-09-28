Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CF127AB9F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqAK-0000HP-V9; Mon, 28 Sep 2020 10:13:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B83a=DF=linux.intel.com=joonas.lahtinen@srs-us1.protection.inumbo.net>)
 id 1kMqAJ-0000HH-78
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:13:51 +0000
X-Inumbo-ID: 4f22c3c1-b6d0-4429-98e7-8d52e92587a5
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f22c3c1-b6d0-4429-98e7-8d52e92587a5;
 Mon, 28 Sep 2020 10:13:49 +0000 (UTC)
IronPort-SDR: n3bDiMwaEmQk0IRfuEFaVKNMLhruMehtHa8GLh7GBG99HIqEEO7+L5DMhUvCfkCkse0/bKEx4n
 z8YVkzvUefNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="162854936"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="162854936"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 03:13:47 -0700
IronPort-SDR: oynyLpLaEo8E2hmYKjUK2eLejsF9h1nd7bvB1+8YkaeLPVcxKUTeXs7JzHnC+u3AXBq2RQNnIu
 AssYzP9UKYBw==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="456766108"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.31.240])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 03:13:41 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200926062959.GA3427@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
 <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
 <20200926062959.GA3427@lst.de>
Subject: Re: remove alloc_vm_area v2
To: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Rothwell <sfr@canb.auug.org.au>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Nitin Gupta <ngupta@vflare.org>,
 x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 28 Sep 2020 13:13:38 +0300
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

+ Dave and Daniel
+ Stephen

Quoting Christoph Hellwig (2020-09-26 09:29:59)
> On Fri, Sep 25, 2020 at 07:43:49PM -0700, Andrew Morton wrote:
> > On Thu, 24 Sep 2020 15:58:42 +0200 Christoph Hellwig <hch@lst.de> wrote:
> >=20
> > > this series removes alloc_vm_area, which was left over from the big
> > > vmalloc interface rework.  It is a rather arkane interface, basicaly
> > > the equivalent of get_vm_area + actually faulting in all PTEs in
> > > the allocated area.  It was originally addeds for Xen (which isn't
> > > modular to start with), and then grew users in zsmalloc and i915
> > > which seems to mostly qualify as abuses of the interface, especially
> > > for i915 as a random driver should not set up PTE bits directly.
> > >=20
> > > Note that the i915 patches apply to the drm-tip branch of the drm-tip
> > > tree, as that tree has recent conflicting commits in the same area.
> >=20
> > Is the drm-tip material in linux-next yet?  I'm still seeing a non-triv=
ial
> > reject in there at present.
>=20
> I assumed it was, but the reject imply that they aren't.  Tvrtko, do you
> know the details?

I think we have a gap that after splitting the drm-intel-next pull requests=
 into
two the drm-intel/for-linux-next branch is now missing material from
drm-intel/drm-intel-gt-next.

I think a simple course of action might be to start including drm-intel-gt-=
next
in linux-next, which would mean that we should update DIM tooling to add
extra branch "drm-intel/gt-for-linux-next" or so.

Which specific patches are missing in this case?

Regards, Joonas

