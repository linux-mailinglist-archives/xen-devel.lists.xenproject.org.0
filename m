Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2C439B49
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 18:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215942.375382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf2br-0003QW-Dg; Mon, 25 Oct 2021 16:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215942.375382; Mon, 25 Oct 2021 16:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf2br-0003NU-AT; Mon, 25 Oct 2021 16:14:03 +0000
Received: by outflank-mailman (input) for mailman id 215942;
 Mon, 25 Oct 2021 16:14:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMnB=PN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mf2bq-0003NN-2s
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 16:14:02 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9e43068-bf46-4968-946a-1e8a7695314a;
 Mon, 25 Oct 2021 16:14:00 +0000 (UTC)
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
X-Inumbo-ID: d9e43068-bf46-4968-946a-1e8a7695314a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635178440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V2kGQNJ+EgiKLdOSySfJEKe1S6HLNkdjC8ouhL6tH68=;
  b=Fd6RuJOJy+TSR9QOfExu8WQbfMlonH89Url5z7ASd+UXDJWrgE5fkqKK
   awY3bvTKrwiztzqr9rSMLSUONIb8bw0ZipbRoc4DNvYm1m1gm2NmSx/V9
   Dnn8vNq2kPLnJMV1KpRS9IcRk3sYm81DPMZv1rqam+yoJ+6/4d29XIDj4
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Q9y5wuZAzSZBvlcvOXLUh3SHtH3jJs2Geg+9gnapqfKciEFBffEXoz+B2/UUKQp5nRI5hsu61u
 Bv5escSqeqkgcAyW8TuQIqSAqz9vCfspW4wRwSFz+DgEZPb7L5j8IDcHo8zTZ4xjkArAtdNI1o
 aEx4pmIWZ4lnVQ5R+3O5imo0CFLf89iHlqb7iHYA3mgi7yxGo4e+IBjMq1nAq152ChMS818xaZ
 32mfPngg70xOzT5jsHPYXRwYv3HoFGLcwJcCjkk7GWl1Dvsta7n3Ew2dwRP7ksrboJBixgW4UG
 Xar6ATZSTQ3dkTpNl5l87j47
X-SBRS: 5.1
X-MesageID: 56395701
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vkIvra8P6CWymq+Vb0d/DrUDF3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 GAbCDuBbK2IZDPzc95xPonjpB4DuJSAyNcxQVZtpC08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrZj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhD7
 4ho75C/cT4YJ6j3v+sWbEVWQh5haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0QRqeDO
 JJAAdZpRDbhfQ1WGgYHMq0/ht2DomvAS2JfiV3A8MLb5ECMlVcsgdABKuH9cdWQScJYtk2Rv
 G7B8iLyBRRyHMOb4SqI9DSrnOCntTjnVYwbErr+7eJjilCXwm0VCTUGVF+6p+n/gUm7M/pEM
 FAd8Ccqqak09WSoQ8P7Uhn+p2SL1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 l6Wnfv5CDp3qrqXRHmBsLCOoluP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLIonoq4f5FgnJ8
 imPlw8xjIpPg580yPDulbzYuA6Eqp/MRw8zwwzYWGO58w90DLKYi5yUBUvztqkYct7IJrWVl
 D1dwZLGtbFRZX2YvHXVGL1lIV2/2xqS3NQwa3ZUFJ496y/lxXeneY1BiN2VDBY0aphaEdMFj
 Um6hO+w2HOxFCbyBUOUS9joYyjP8UQHPY+9Ps04lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EUvk+lGLsFr9Fi+9DKsUCKYX7H8CTI/OPiuL2WZJoYe1dbAvmgh4RtfvsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBgba0aX/d/L7bZSiI/QTlJI6aIndsJJtw094wIx7yg1
 izsBSdlJK/X2CSvxfOiMSs4NtsCnP9X8BoGAMDbFQ/5iyZ4Od30svZ3mlleVeBPydGPBMVcF
 5EtE/hsyNwUItge0zhCP5T7sqJ4cxGn2VCHMya/OWBtdJ98XQ3ZvNTje1K3piUJCyO2s+o4o
 qGhiVyHEcZSGVw6AZaEcu+rwnOwoWMZxLB4UXzXL4QBY07r6oVrdXD816dlP8EWJBzf7TKGz
 ALKUwwArOzArtZtotnEjKyJtamzFO56EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64clSuRl16Mz4dfrtoR29AU8ESWZdUmvB5NhPmKCgZtFuJpSy+ILogCxQ
 E+OpIVXYO3bJMP/HVcNDwM5deDfh+oMkzzf4PlpckX34Ch7oOiOXUlIZkTejSVcKP1+MZ8/w
 Pdns8kTslTthh0vO9eAryZV62XTcSBQD/R57skXUN3xlw4m6lBeepiNWCb57aaGZ8hILkR3c
 CSfg7DPhugEy0fPG5bp+aMhAQaJaUwyhS13
IronPort-HdrOrdr: A9a23:pYC1yqHMfK/iPi4FpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.87,181,1631592000"; 
   d="scan'208";a="56395701"
Date: Mon, 25 Oct 2021 17:13:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<cardoe@cardoe.com>, <wl@xen.org>, <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
Message-ID: <YXbXwjxHPNjSAKrG@perard>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-3-sstabellini@kernel.org>
 <YXK2lTWZHiTXIBtJ@perard>
 <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s>

On Fri, Oct 22, 2021 at 01:05:35PM -0700, Stefano Stabellini wrote:
> On Fri, 22 Oct 2021, Anthony PERARD wrote:
> > On Thu, Oct 21, 2021 at 04:08:39PM -0700, Stefano Stabellini wrote:
> > > diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> > > new file mode 100644
> > > index 0000000000..41b05210d6
> > > --- /dev/null
> > > +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > > @@ -0,0 +1,92 @@
> > > +#!/bin/bash
> > > +
> > > +set -ex
> > > +
> > > +apt-get -qy update
> > > +apt-get -qy install --no-install-recommends qemu-system-x86 \
> > > +                                            cpio \
> > > +                                            curl \
> > > +                                            busybox-static
> > 
> > Please, don't install packages during the CI job. If you need new
> > packages, update the container.
> 
> The container used to run this script is the one used for the Xen build:
> automation/build/debian/unstable.dockerfile, AKA
> registry.gitlab.com/xen-project/xen/debian:unstable. We don't have a
> specific container for the sole purpose of running tests.

I've added qemu to our debian:stretch container recently, in order to
run the "qemu-smoke-*" tests without running apt commands. Unless more
recent software are needed, you could base the "qemu-alpine-x86*" test
on debian:stretch which might only then missing cpio and busybox. Update
of the stretch container should go smoothly as it has been done
recently.

> Thus, I could add qemu-system-x86 to
> automation/build/debian/unstable.dockerfile, but then we increase the
> size of the debian unstable build container needlessly for all related
> build jobs.

There is something I'm missing, how is it a problem to have a container
that is a bit bigger? What sort of problem could we have to deal with?
On the other hand, doing more task, installing software, downloading
anything from the internet, makes the job much less reliable. It
increase the risk of a failure do to external factors and it takes more
time to run the test.

> Or we could add one more special container just for running tests, but
> then it is one more container to maintain and keep up-to-date.
> 
> This is why I chose as a compromise to keep the underlying container as
> is, and just apt-get the extra 3-4 packages here. It is the same thing
> we do on ARM: automation/scripts/qemu-alpine-arm64.sh. Also keep in mind
> that this job is run in the "test" step where we have far fewer jobs at
> the moment and the runners are not busy. (It would be different in the
> "build" step where we have many jobs.)

I don't really see any difference between a "test" job and a "build"
jobs, both kind use the same resource/runner.

On that note, they're is something I've learned recently: "test" job
don't even have to wait for all "build" job to complete, they can run in
parallel. We would just need to replace "dependencies" by "needs":
    https://docs.gitlab.com/ee/ci/yaml/index.html#needs
But that could be an improvement for an other time and only a side note
for the patch.

> I am not entirely sure what is the best solution overall, but for this
> series at this stage I would prefer to keep the same strategy used for
> the ARM tests (i.e. reuse the debian unstable build container and
> apt-get the few missing packages.) If we do change the way we do it, I
> would rather change both x86 and ARM at the same time.

I'm pretty sure the best strategy would be to do as little as possible
during a job, download as little as possible and possibly cache as much
as possible and do as much as possible ahead of time. Feel free to
change the Arm test, but I don't think it is necessary to change the Arm
test at the same time as introducing an x86 test.

Cheers,

-- 
Anthony PERARD

