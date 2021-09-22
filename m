Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D14147B8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192509.342985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0J2-0002I9-Ak; Wed, 22 Sep 2021 11:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192509.342985; Wed, 22 Sep 2021 11:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0J2-0002FV-7T; Wed, 22 Sep 2021 11:20:52 +0000
Received: by outflank-mailman (input) for mailman id 192509;
 Wed, 22 Sep 2021 11:20:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT0J0-0002FP-Jj
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:20:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT0J0-0005h3-HX
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:20:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT0J0-0006Sn-GT
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:20:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mT0Iu-00039E-6C; Wed, 22 Sep 2021 12:20:44 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=zI12UCiAWcdhToVdwvm9v56wtLvDQCvSl/0SE7uChVY=; b=BAxII3mfogjFhELlIccXuFqrP7
	kraw14+2GiYxiuBh4Z0i83wEs2Bz04CAZpsdmzD1sbGLwjLgwbxv7Sf9Ng69H7sfedZ+Vn2+opxGd
	E0cbuIJVxpYGs3mww0ahzZRM1V523ynnxDDkDCcon9U8kPctb2KWWx0KHn6aCC4Be9w4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24907.4491.895219.37845@mariner.uk.xensource.com>
Date: Wed, 22 Sep 2021 12:20:43 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    Ian Jackson <iwj@xenproject.org>,
    xen-devel@lists.xenproject.org,
    dpsmith@apertussolutions.com
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
In-Reply-To: <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
References: <osstest-164996-mainreport@xen.org>
	<d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
	<24904.44119.940679.241639@mariner.uk.xensource.com>
	<alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
	<19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
> On 22.09.2021 01:38, Stefano Stabellini wrote:
> > On Mon, 20 Sep 2021, Ian Jackson wrote:
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

I looked for bisection results for this failure and

  http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-arm64-arm64-libvirt-xsm.guest-start--debian.repeat.html

it's a heisenbug.  Also, the tests got reorganised slightly as a
side-effect of dropping some i386 tests, so some of these tests are
"new" from osstest's pov, although their content isn't really new.

Unfortunately, with it being a heisenbug, we won't get any useful
bisection results, which would otherwise conclusively tell us which
tree the problem was in.

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

It could propagate fairly quickly.  But I'm loathe to make this change
because it seems to me that it would be simply masking the bug.

Notably, when this goes wrong, it seems to happen after the guest has
been started once successfully already.  So there *is* enough
memory...

Ian.

