Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9426437F19
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 22:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215268.374352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0nM-00021q-EI; Fri, 22 Oct 2021 20:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215268.374352; Fri, 22 Oct 2021 20:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0nM-000203-BL; Fri, 22 Oct 2021 20:05:40 +0000
Received: by outflank-mailman (input) for mailman id 215268;
 Fri, 22 Oct 2021 20:05:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWKL=PK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1me0nL-0001zx-1j
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 20:05:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36f9dc27-aaf4-43c9-afaf-43505ab11751;
 Fri, 22 Oct 2021 20:05:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06C2560FC3;
 Fri, 22 Oct 2021 20:05:36 +0000 (UTC)
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
X-Inumbo-ID: 36f9dc27-aaf4-43c9-afaf-43505ab11751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634933137;
	bh=0ed5ashgq+RseZh1jCmDafDm8/pPUbEikonwZ4eyYa0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AXdsShtmhvmcmsfi2njMm3YNnvcY6FrQKL+hensDdVJdPL76C43eXteXWhIzqFjUe
	 48stFAK68dqMuPGWjFh9VzQoC/NQ8mNEgPUFx0CS5eSjFAwUXkgD3/CkDqewpzXHzL
	 yQolq7fU2DE/NifMi2GYJkxfupwF2PP7GhWn5tCrXcFCI4ia70Zcoj2fxgX1kQC9CY
	 f5NzOcmnaAJZlP3YrfANyVj3QbLT4cnxL96O/wiU0LhKiRjs6BBCDVUElh49AyuS71
	 z4QKJ0tax+r9PfmBpqm3ANoDgvltX1MwTHKEfaPK7sDN82/2QY0efojrCT2a9SUZkv
	 IxJlFwkPrLzdw==
Date: Fri, 22 Oct 2021 13:05:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com, 
    wl@xen.org, andrew.cooper3@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
In-Reply-To: <YXK2lTWZHiTXIBtJ@perard>
Message-ID: <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-3-sstabellini@kernel.org> <YXK2lTWZHiTXIBtJ@perard>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Oct 2021, Anthony PERARD wrote:
> On Thu, Oct 21, 2021 at 04:08:39PM -0700, Stefano Stabellini wrote:
> > diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> > new file mode 100644
> > index 0000000000..41b05210d6
> > --- /dev/null
> > +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > @@ -0,0 +1,92 @@
> > +#!/bin/bash
> > +
> > +set -ex
> > +
> > +apt-get -qy update
> > +apt-get -qy install --no-install-recommends qemu-system-x86 \
> > +                                            cpio \
> > +                                            curl \
> > +                                            busybox-static
> 
> Please, don't install packages during the CI job. If you need new
> packages, update the container.

The container used to run this script is the one used for the Xen build:
automation/build/debian/unstable.dockerfile, AKA
registry.gitlab.com/xen-project/xen/debian:unstable. We don't have a
specific container for the sole purpose of running tests.

Thus, I could add qemu-system-x86 to
automation/build/debian/unstable.dockerfile, but then we increase the
size of the debian unstable build container needlessly for all related
build jobs.

Or we could add one more special container just for running tests, but
then it is one more container to maintain and keep up-to-date.

This is why I chose as a compromise to keep the underlying container as
is, and just apt-get the extra 3-4 packages here. It is the same thing
we do on ARM: automation/scripts/qemu-alpine-arm64.sh. Also keep in mind
that this job is run in the "test" step where we have far fewer jobs at
the moment and the runners are not busy. (It would be different in the
"build" step where we have many jobs.)

I am not entirely sure what is the best solution overall, but for this
series at this stage I would prefer to keep the same strategy used for
the ARM tests (i.e. reuse the debian unstable build container and
apt-get the few missing packages.) If we do change the way we do it, I
would rather change both x86 and ARM at the same time.


> That said, "curl" doesn't seems to be needed.

Yeah I'll take away curl.


> > +# DomU Busybox
> > +cd binaries
> > +mkdir -p initrd
> > +mkdir -p initrd/bin
> > +mkdir -p initrd/sbin
> > +mkdir -p initrd/etc
> > +mkdir -p initrd/dev
> > +mkdir -p initrd/proc
> > +mkdir -p initrd/sys
> > +mkdir -p initrd/lib
> > +mkdir -p initrd/var
> > +mkdir -p initrd/mnt
> > +cp /bin/busybox initrd/bin/busybox
> > +initrd/bin/busybox --install initrd/bin
> > +echo "#!/bin/sh
> > +
> > +mount -t proc proc /proc
> > +mount -t sysfs sysfs /sys
> > +mount -t devtmpfs devtmpfs /dev
> > +/bin/sh" > initrd/init
> > +chmod +x initrd/init
> > +cd initrd
> > +find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
> 
> This isn't confusing at all, depending on the tool used to make an
> archive, the resulting initrd has a different purpose :-).
>     initrd.tar.gz -> dom0
>     initrd.cpio.gz -> domU
> 
> > +cd ..
> 
> Maybe add a comment here saying that we are now preparing dom0 root
> filesystem? (as there is one for domu)

Sure I can add a comment


> > +mkdir -p rootfs
> > +cd rootfs
> > +tar xvzf ../initrd.tar.gz
> > +mkdir proc
> > +mkdir run
> > +mkdir srv
> > +mkdir sys
> > +rm var/run
> > +cp -ar ../dist/install/* .
> > +mv ../initrd.cpio.gz ./root
> > +cp ../bzImage ./root
> > +echo "name=\"test\"
> > +memory=512
> > +vcpus=1
> > +kernel=\"/root/bzImage\"
> > +ramdisk=\"/root/initrd.cpio.gz\"
> > +extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
> > +" > root/test.cfg
> > +echo "#!/bin/bash
> > +
> 
> Maybe add `set -x` ?

OK


> > +export LD_LIBRARY_PATH=/usr/local/lib
> > +bash /etc/init.d/xencommons start
> > +
> > +xl list
> > +
> > +xl create -c /root/test.cfg
> > +
> > +" > etc/local.d/xen.start
> > +chmod +x etc/local.d/xen.start
> > +echo "rc_verbose=yes" >> etc/rc.conf
> > +find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
> > +cd ../..
> > +
> > +cat >> binaries/pxelinux.0 <<- EOF
> 
> So, I've look at <<- meaning as I never used that before and it seems to
> remove all leading tab chr from the input, yet they are no tab in the
> input. So maybe use just <<EOF instead, without the dash -.

OK


> > +#!ipxe
> > +
> > +kernel xen console=com1
> > +module bzImage console=hvc0
> > +module xen-rootfs.cpio.gz
> > +boot
> > +EOF


