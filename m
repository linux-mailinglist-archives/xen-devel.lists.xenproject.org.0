Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B4415508
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 03:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193234.344180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTDFd-0000TN-Mp; Thu, 23 Sep 2021 01:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193234.344180; Thu, 23 Sep 2021 01:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTDFd-0000Ra-Jm; Thu, 23 Sep 2021 01:10:13 +0000
Received: by outflank-mailman (input) for mailman id 193234;
 Thu, 23 Sep 2021 01:10:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTDFc-0000RU-3C
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 01:10:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff9a8972-1c0a-11ec-b9fc-12813bfff9fa;
 Thu, 23 Sep 2021 01:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A9786109E;
 Thu, 23 Sep 2021 01:10:10 +0000 (UTC)
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
X-Inumbo-ID: ff9a8972-1c0a-11ec-b9fc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632359410;
	bh=2mcxG55qKaKMA20YKNot3P1eLyODJ/0MAZ99tHgpG5s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lyexlZ4lBUwrFW3Vk4IwygVIaPjezGV33BVlzg07ifZdrh64pBdnyw8eXB0DVRMrq
	 91287bNVrTt1Y5DGQI7IG+UMgIA1m8QyvQDyD6n8Hm3y74voh3WIgHH4CySqDCVoOx
	 Yfnw8XrPRRWiYm9VK5LrInMvvf/G2551X9CLA+piz0j2eoHPiaFg/7GEcroqHx7+KJ
	 3q+3okObUkKY64YZI8sMaNxjoiaLCPSy0GjWfU3V+PB2pI7B1AHrYErWuZJGSdpyHu
	 +e+iYou6dD/ZLTrff3xdzix2YH316rK9LBTG5qt/j3hy6xDybZOc1BDqc4xxwp94C/
	 X/V6nP1M8E2AA==
Date: Wed, 22 Sep 2021 18:10:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org, 
    dpsmith@apertussolutions.com
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
In-Reply-To: <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
Message-ID: <alpine.DEB.2.21.2109221807131.17979@sstabellini-ThinkPad-T480s>
References: <osstest-164996-mainreport@xen.org> <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com> <24904.44119.940679.241639@mariner.uk.xensource.com> <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
 <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Jan Beulich wrote:
> On 22.09.2021 01:38, Stefano Stabellini wrote:
> > On Mon, 20 Sep 2021, Ian Jackson wrote:
> >> Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
> >>> As per
> >>>
> >>> Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
> >>> Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 inactive_anon:15857 isolated_anon:0
> >>> Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286 inactive_file:11182 isolated_file:0
> >>> Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30 writeback:0 unstable:0
> >>> Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922 slab_unreclaimable:30234
> >>> Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975 pagetables:401 bounce:0
> >>> Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100 free_cma:1650
> >>>
> >>> the system doesn't look to really be out of memory; as per
> >>>
> >>> Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
> >>>
> >>> there even look to be a number of higher order pages available (albeit
> >>> without digging I can't tell what "(C)" means). Nevertheless order-4
> >>> allocations aren't really nice.
> >>
> >> The host history suggests this may possibly be related to a qemu update.
> >>
> >> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html
> 
> Stefano - as per some of your investigation detailed further down I
> wonder whether you had seen this part of Ian's reply. (Question of
> course then is how that qemu update had managed to get pushed.)
> 
> >> The grub cfg has this:
> >>
> >>  multiboot /xen placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  ${xen_rm_opts}
> >>
> >> It's not clear to me whether xen_rm_opts is "" or "no-real-mode edd=off".
> > 
> > I definitely recommend to increase dom0 memory, especially as I guess
> > the box is going to have a significant amount, far more than 4GB. I
> > would set it to 2GB. Also the syntax on ARM is simpler, so it should be
> > just: dom0_mem=2G
> 
> Ian - I guess that's an adjustment relatively easy to make? I wonder
> though whether we wouldn't want to address the underlying issue first.
> Presumably not, because the fix would likely take quite some time to
> propagate suitably. Yet if not, we will want to have some way of
> verifying that an eventual fix there would have helped here.
> 
> > In addition, I also did some investigation just in case there is
> > actually a bug in the code and it is not a simple OOM problem.
> 
> I think the actual issue is quite clear; what I'm struggling with is
> why we weren't hit by it earlier.
> 
> As imo always, non-order-0 allocations (perhaps excluding the bringing
> up of the kernel or whichever entity) are to be avoided it at possible.
> The offender in this case looks to be privcmd's alloc_empty_pages().
> For it to request through kcalloc() what ends up being an order-4
> allocation, the original IOCTL_PRIVCMD_MMAPBATCH must specify a pretty
> large chunk of guest memory to get mapped. Which may in turn be
> questionable, but I'm afraid I don't have the time to try to drill
> down where that request is coming from and whether that also wouldn't
> better be split up.
> 
> The solution looks simple enough - convert from kcalloc() to kvcalloc().
> I can certainly spin up a patch to Linux to this effect. Yet that still
> won't answer the question of why this issue has popped up all of the
> sudden (and hence whether there are things wanting changing elsewhere
> as well).

Also, I saw your patches for Linux. Let's say that the patches are
reviewed and enqueued immediately to be sent to Linus at the next
opportunity. It is going to take a while for them to take effect in
OSSTest, unless we import them somehow in the Linux tree used by OSSTest
straight away, right?

Should we arrange for one test OSSTest flight now with the patches
applied to see if they actually fix the issue? Otherwise we might end up
waiting for nothing...

