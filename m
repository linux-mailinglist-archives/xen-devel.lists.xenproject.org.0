Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5483276378
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 00:03:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLCqN-0007K2-6L; Wed, 23 Sep 2020 22:02:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDdr=DA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kLCqL-0007Jx-Ii
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 22:02:29 +0000
X-Inumbo-ID: 108b4f45-e1b2-4bbc-9c0c-c35ffe7c3e12
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 108b4f45-e1b2-4bbc-9c0c-c35ffe7c3e12;
 Wed, 23 Sep 2020 22:02:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 255B3206E5;
 Wed, 23 Sep 2020 22:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600898547;
 bh=0y5UUdkeqQhEQ44n/iwNwci3rk5jU+e17YMHDrtVo+o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WafoD/AiculVO6Ig0kae6MSOrnudkvfGV7t8MgucXx3oOaZaTsOfWRqHgrnLTMngQ
 VPoGwRYtnU1axTAsyK0EQSRtk4PbjK627sdh6aUr/YcyuH4xGxovdQFN7rtRlbRU5P
 I98hcLI+QftCC/9IXGKZRkA2A43w6TA9nFebBe+Y=
Date: Wed, 23 Sep 2020 15:02:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
 Julien Grall <julien.grall@arm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Jan Beulich <jbeulich@suse.com>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 3/4] xen: Remove mfn_to_gmfn macro
In-Reply-To: <e0783993-50b0-cdf4-895d-45ef8f40450b@citrix.com>
Message-ID: <alpine.DEB.2.21.2009231502000.1495@sstabellini-ThinkPad-T480s>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-4-julien@xen.org>
 <e0783993-50b0-cdf4-895d-45ef8f40450b@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 21 Sep 2020, Andrew Cooper wrote:
> On 21/09/2020 19:02, Julien Grall wrote:
> > From: Julien Grall <julien.grall@arm.com>
> >
> > On x86, mfn_to_gmfn can be replaced with mfn_to_gfn. On Arm, there are
> > no more call to mfn_to_gmfn, so the helper can be dropped.
> 
> The previous patch dropped the mfn_to_gmfn() call from the domain shared
> info path, but without a hunk adjusting the innards of
> memory_exchange(), this is going to break the x86 build.
> 
> > At the same time rework a comment in Arm code that does not make sense.
> >
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> 
> To save a round trip, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com> with the appropriate hunk to memory_exchange().

Same from me:
Acked-by: Stefano Stabellini <sstabellini@kernel.org>


