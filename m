Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2F43A9C2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216139.375626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBLi-0007vz-KJ; Tue, 26 Oct 2021 01:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216139.375626; Tue, 26 Oct 2021 01:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBLi-0007tn-Gz; Tue, 26 Oct 2021 01:33:58 +0000
Received: by outflank-mailman (input) for mailman id 216139;
 Tue, 26 Oct 2021 01:33:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfBLg-0007th-Mk
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:33:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c845f46e-35fc-11ec-8420-12813bfff9fa;
 Tue, 26 Oct 2021 01:33:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 608416103C;
 Tue, 26 Oct 2021 01:33:54 +0000 (UTC)
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
X-Inumbo-ID: c845f46e-35fc-11ec-8420-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635212034;
	bh=3VfJPdoKXuUDd/jg96xCLhfqd8anajSYo53uu9mkuco=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JwZcIYso3ZbZIjcBnkKAmzLR/756iC2KPbdEvXP/rFjiJRtVp5CQ1F/5+E8joNmlf
	 rGxXRbX30PtLGpZfslqbTaPrIfMo5qprmbevNP6DruyUQQam6FJK+0K9ttZlJFlKhe
	 e4e9TXhcJ5jEsj5s3Sw0apkjrHaNVGPIPwEiEfPu1ejNIsCJ0yQ9VFeXLGjxGsUFkd
	 GYW14GsxIhMnvVtZQ5K0kEl+Pkjb+S44wvPaie3+ins60cHiNnQha9CuHGO4XRuvT6
	 rPzRbC2/ERLW6DpLSbm+Ij23f1mYzzOkYpClt0XV04LX/aWG01nWbWDmgX0+xeqRQI
	 Xjcn40Ifwsj7w==
Date: Mon, 25 Oct 2021 18:33:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com, 
    wl@xen.org, andrew.cooper3@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
In-Reply-To: <YXbXwjxHPNjSAKrG@perard>
Message-ID: <alpine.DEB.2.21.2110251754210.4586@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-3-sstabellini@kernel.org> <YXK2lTWZHiTXIBtJ@perard> <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s> <YXbXwjxHPNjSAKrG@perard>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Oct 2021, Anthony PERARD wrote:
> On Fri, Oct 22, 2021 at 01:05:35PM -0700, Stefano Stabellini wrote:
> > On Fri, 22 Oct 2021, Anthony PERARD wrote:
> > > On Thu, Oct 21, 2021 at 04:08:39PM -0700, Stefano Stabellini wrote:
> > > > diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> > > > new file mode 100644
> > > > index 0000000000..41b05210d6
> > > > --- /dev/null
> > > > +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > > > @@ -0,0 +1,92 @@
> > > > +#!/bin/bash
> > > > +
> > > > +set -ex
> > > > +
> > > > +apt-get -qy update
> > > > +apt-get -qy install --no-install-recommends qemu-system-x86 \
> > > > +                                            cpio \
> > > > +                                            curl \
> > > > +                                            busybox-static
> > > 
> > > Please, don't install packages during the CI job. If you need new
> > > packages, update the container.
> > 
> > The container used to run this script is the one used for the Xen build:
> > automation/build/debian/unstable.dockerfile, AKA
> > registry.gitlab.com/xen-project/xen/debian:unstable. We don't have a
> > specific container for the sole purpose of running tests.
> 
> I've added qemu to our debian:stretch container recently, in order to
> run the "qemu-smoke-*" tests without running apt commands. Unless more
> recent software are needed, you could base the "qemu-alpine-x86*" test
> on debian:stretch which might only then missing cpio and busybox. Update
> of the stretch container should go smoothly as it has been done
> recently.

I am happy to use debian:stretch in this patch series. I'll make the
change. That only leaves cpio and busybox-static to apt-get which are
small. In general, I am not too happy about increasing the size of build
containers with testing binaries so I would rather not increase it any
further, see below.


> > Thus, I could add qemu-system-x86 to
> > automation/build/debian/unstable.dockerfile, but then we increase the
> > size of the debian unstable build container needlessly for all related
> > build jobs.
> 
> There is something I'm missing, how is it a problem to have a container
> that is a bit bigger? What sort of problem could we have to deal with?

It takes time to clone the container in the gitlab-ci, the bigger the
container the more time it takes. It is fetched over the network. Now we
are fetching qemu (as part of the container) 10 times during the build
although it is not needed.

There is a compromise to be made. Let's say the QEMU package is 100MB.
If we add QEMU to debian:stretch we are going to increase the overall
data usage by about 1GB, which means we are waiting to fetch 1GB of
additional data during the pipeline.

If we needed QEMU only once, then we could just apt-get it and we would
only fetch 100MB once. Although using apt-get will be a bit slower
because the deb needs to be unpacked, etc. I think that if we used QEMU
only in one test then it would be faster to apt-get it.

However in our case we are using QEMU 4 times during the tests, so
adding QEMU to debian:stretch probably made things a bit faster or at
least not slower.

Does it make sense?

This is why we should have specialized containers for the tests instead
of adding test packages to the build containers. However, today all
containers are updated manually so it would be best to make containers
automatically updatable first.  Until then I think it is OK to apt-get
stuff.


> On the other hand, doing more task, installing software, downloading
> anything from the internet, makes the job much less reliable. It
> increase the risk of a failure do to external factors and it takes more
> time to run the test.

That is fair but it is more a theoretical problem than a real issue at
the moment. In reality I haven't seen Debian's apt-get failing even a
single time in our gitlab-ci (it failed because our debian:unstable
container went out of date but that's our fault).

But we do have a severe problem at the moment with external sources: our
"git clones" keep failing during the build on x86. That is definitely
something worth improving (see my other email thread on the subject) and
it is the main problem affecting gitlab-ci at the moment, I keep having
to restart jobs almost daily to get the overall pipeline to "pass".

If you have any ideas on how to stop fetching things using "git" from
external repositories in gitlab-ci that would be fantastic :-)
The only thing I could think of to "fix it" is moving all external repos
to gitlab repositories mirrors.


> > Or we could add one more special container just for running tests, but
> > then it is one more container to maintain and keep up-to-date.
> > 
> > This is why I chose as a compromise to keep the underlying container as
> > is, and just apt-get the extra 3-4 packages here. It is the same thing
> > we do on ARM: automation/scripts/qemu-alpine-arm64.sh. Also keep in mind
> > that this job is run in the "test" step where we have far fewer jobs at
> > the moment and the runners are not busy. (It would be different in the
> > "build" step where we have many jobs.)
> 
> I don't really see any difference between a "test" job and a "build"
> jobs, both kind use the same resource/runner.
> 
> On that note, they're is something I've learned recently: "test" job
> don't even have to wait for all "build" job to complete, they can run in
> parallel. We would just need to replace "dependencies" by "needs":
>     https://docs.gitlab.com/ee/ci/yaml/index.html#needs
> But that could be an improvement for an other time and only a side note
> for the patch.

That is really cool! I didn't know about it. Yes, currently there is a
big distinction between build and test jobs because build jobs are the
bottleneck and test jobs don't start before all the build jobs finish.


> > I am not entirely sure what is the best solution overall, but for this
> > series at this stage I would prefer to keep the same strategy used for
> > the ARM tests (i.e. reuse the debian unstable build container and
> > apt-get the few missing packages.) If we do change the way we do it, I
> > would rather change both x86 and ARM at the same time.
> 
> I'm pretty sure the best strategy would be to do as little as possible
> during a job, download as little as possible and possibly cache as much
> as possible and do as much as possible ahead of time. Feel free to
> change the Arm test, but I don't think it is necessary to change the Arm
> test at the same time as introducing an x86 test.

I agree.

At the same time it would be nice to follow the same strategy between
x86 and ARM going forward: if one optimization is made for one, it is
also made for the other.

