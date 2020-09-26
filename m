Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB73279648
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 04:45:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kM0Bn-0000bG-84; Sat, 26 Sep 2020 02:43:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQPe=DD=linux-foundation.org=akpm@srs-us1.protection.inumbo.net>)
 id 1kM0Bl-0000bB-Kl
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 02:43:53 +0000
X-Inumbo-ID: 269c32b3-779f-4457-8c7a-10a325c51ea9
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 269c32b3-779f-4457-8c7a-10a325c51ea9;
 Sat, 26 Sep 2020 02:43:52 +0000 (UTC)
Received: from X1 (unknown [104.245.68.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3885820878;
 Sat, 26 Sep 2020 02:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601088231;
 bh=1nkZCA5YPl8bVzihcrG7vvM8b//lqkJ5TQeIuSIoqCQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dCRAn6cZQrrJb2Wh/R/Zwk22edLD5gfhWGDqwTYHfDhwL8p9lj1q3nd20NicS+n6l
 q5ujK20g/b5JixrtLCZ8ysCD9kfVgSPlWmXQyL1yASDHU+i0PynwItHvs0xxsLQqqI
 YCTc9mEz0rJ75n3w690uhG5J+1mzUwI54ugn3gJs=
Date: Fri, 25 Sep 2020 19:43:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>, Matthew Wilcox
 <willy@infradead.org>, Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: Re: remove alloc_vm_area v2
Message-Id: <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
In-Reply-To: <20200924135853.875294-1-hch@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 24 Sep 2020 15:58:42 +0200 Christoph Hellwig <hch@lst.de> wrote:

> this series removes alloc_vm_area, which was left over from the big
> vmalloc interface rework.  It is a rather arkane interface, basicaly
> the equivalent of get_vm_area + actually faulting in all PTEs in
> the allocated area.  It was originally addeds for Xen (which isn't
> modular to start with), and then grew users in zsmalloc and i915
> which seems to mostly qualify as abuses of the interface, especially
> for i915 as a random driver should not set up PTE bits directly.
> 
> Note that the i915 patches apply to the drm-tip branch of the drm-tip
> tree, as that tree has recent conflicting commits in the same area.

Is the drm-tip material in linux-next yet?  I'm still seeing a non-trivial
reject in there at present.


