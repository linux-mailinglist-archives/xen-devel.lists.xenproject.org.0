Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192D40BD66
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 03:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187164.335936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQK4p-0000zg-Ra; Wed, 15 Sep 2021 01:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187164.335936; Wed, 15 Sep 2021 01:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQK4p-0000wJ-Le; Wed, 15 Sep 2021 01:51:07 +0000
Received: by outflank-mailman (input) for mailman id 187164;
 Wed, 15 Sep 2021 01:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQK4n-0000wD-SK
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 01:51:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d64c143-a73d-48cb-a750-c28fd2b12926;
 Wed, 15 Sep 2021 01:51:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF8061211;
 Wed, 15 Sep 2021 01:51:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8d64c143-a73d-48cb-a750-c28fd2b12926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631670662;
	bh=z0W70Z4JOetSa7g8CfvjNwgRWC4qCwo9bmhv6sh9Bxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DhJ6GOb1z9RF8MoKZiSnxeXdJKNkyxJ7YyiEn0qQubMzT9FZtSjTJUt/KUr+QwVKI
	 +frjDgFVeOdxWz9IZc7wervGNYWJ63gSfCERzcvLkSnA46r3ypahZL2U/4IHNXcntT
	 /DqRf5MOYuMRlQ77Uv0SNMsaDJzboDdlLxIhocqe0R7UgiEK7ZBy99L8v0w5K3bX72
	 sJ48QhBWhdiCuNKFPKWm/Qjfkv8EiwrcYFd4jtxEycZyiFEiLrwMg1PFndT/7dOiPM
	 zl0gJLYf7yi4Oohaksg8j8XTXXQSSgFUXRaPI/wIqRfum+bBu2e2ldXr9TpWz6n+3M
	 stAUSLvG5uH7w==
Date: Tue, 14 Sep 2021 18:51:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: rm.skakun@gmail.com
cc: Jan Beulich <jbeulich@suse.com>, Roman Skakun <rm.skakun@gmail.com>, 
    Andrii Anisov <andrii_anisov@epam.com>, 
    Roman Skakun <roman_skakun@epam.com>, Jonathan Corbet <corbet@lwn.net>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
    Paul Mackerras <paulus@samba.org>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Marek Szyprowski <m.szyprowski@samsung.com>, 
    Robin Murphy <robin.murphy@arm.com>, 
    "Paul E. McKenney" <paulmck@kernel.org>, 
    Randy Dunlap <rdunlap@infradead.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    "Maciej W. Rozycki" <macro@orcam.me.uk>, 
    Muchun Song <songmuchun@bytedance.com>, 
    Viresh Kumar <viresh.kumar@linaro.org>, 
    Peter Zijlstra <peterz@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
    Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, hch@lst.de
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
In-Reply-To: <20210914153046.GB815@lst.de>
Message-ID: <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com> <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com> <20210914153046.GB815@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Sep 2021, Christoph Hellwig wrote:
> On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> > I'm not convinced the swiotlb use describe there falls under "intended
> > use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside,
> > the bottom of this page is also confusing, as following "Then we can
> > confirm the modified swiotlb size in the boot log:" there is a log
> > fragment showing the same original size of 64Mb.
> 
> It doesn't.  We also do not add hacks to the kernel for whacky out
> of tree modules.

Also, Option 1 listed in the webpage seems to be a lot better. Any
reason you can't do that? Because that option both solves the problem
and increases performance.

