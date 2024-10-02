Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2398E6EB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 01:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809105.1221270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8nh-0001XS-4s; Wed, 02 Oct 2024 23:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809105.1221270; Wed, 02 Oct 2024 23:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8nh-0001UJ-28; Wed, 02 Oct 2024 23:30:33 +0000
Received: by outflank-mailman (input) for mailman id 809105;
 Wed, 02 Oct 2024 23:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6XJ=Q6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sw8nf-0001UD-PP
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 23:30:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f2cc0df-8116-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 01:30:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3312A4158A;
 Wed,  2 Oct 2024 23:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA2CC4CEC2;
 Wed,  2 Oct 2024 23:30:26 +0000 (UTC)
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
X-Inumbo-ID: 4f2cc0df-8116-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727911827;
	bh=asj1HUp9064MXj7WJDFv80bA/tzNRn2wRwlLIVnqIFQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uCCJ8YRn2lblA6g5c88Mgctg6dWANvn/SlY/RXvhLgKY5DBj8HlseiBcJr112i5kG
	 vujeRz48BQ7KQUFAc2KqE/6dSCSQhK4rYfsVZ8XENeU0RYztLiPkEdkSSak1IpgPuU
	 MPnsRYp8OTz0RYwnbKNP2D68Akr/dmk3aPqpAyfn0B6JL+FXP9BWq+iQeRygQpWt1E
	 Yw7R66vAqOz8lyubjcnbavB5XHP0xiwg4FH3gNfBr0F6TKFNIofwGcG1uBWJrt2tk3
	 qi35J5JiIuFPk7APtJ3YK+t+F98/7IY2TWkguL3CrIuM+VNQucW3HIkJSWqZjqMkeX
	 eL7j5COwuVlRA==
Date: Wed, 2 Oct 2024 16:30:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
In-Reply-To: <Zv3Pbx1gkeypGQem@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2410021618540.1138574@ubuntu-linux-20-04-desktop>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com> <20241002124245.716302-2-marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>
 <Zv3Pbx1gkeypGQem@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1969706452-1727911208=:1138574"
Content-ID: <alpine.DEB.2.22.394.2410021620110.1138574@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1969706452-1727911208=:1138574
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410021620111.1138574@ubuntu-linux-20-04-desktop>

On Thu, 3 Oct 2024, Marek Marczykowski-Górecki wrote:
> On Wed, Oct 02, 2024 at 03:22:59PM -0700, Stefano Stabellini wrote:
> > I forgot to reply to one important part below
> > 
> > 
> > On Wed, 2 Oct 2024, Stefano Stabellini wrote:
> > > On Wed, 2 Oct 2024, Marek Marczykowski-Górecki wrote:
> > > > Check if xen.efi is bootable with an XTF dom0.
> > > > 
> > > > The TEST_TIMEOUT is set in the script to override project-global value.
> > > > Setting it in the gitlab yaml file doesn't work, as it's too low
> > > > priority
> > > > (https://docs.gitlab.com/ee/ci/variables/#cicd-variable-precedence).
> > > > 
> > > > The multiboot2+EFI path is tested on hardware tests already.
> > > > 
> > > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > > ---
> > > > This requires rebuilding debian:bookworm container.
> > > > 
> > > > The TEST_TIMEOUT issue mentioned above applies to xilix-* jobs too. It's
> > > > not clear to me why the default TEST_TIMEOUT is set at the group level
> > > > instead of in the yaml file, so I'm not adjusting the other places.
> > > 
> > > Let me premise that now that we use "expect" all successful tests will
> > > terminate as soon as the success condition is met, without waiting for
> > > the test timeout to expire.
> > > 
> > > There is a CI/CD variable called TEST_TIMEOUT set at the
> > > gitlab.com/xen-project level. (There is also a check in console.exp in
> > > case TEST_TIMEOUT is not set so that we don't run into problems in case
> > > the CI/CD variable is removed accidentally.) The global TEST_TIMEOUT is
> > > meant to be a high value to account for slow QEMU tests running
> > > potentially on our slowest cloud runners.
> > > 
> > > However, for hardware-based tests such as the xilinx-* jobs, we know
> > > that the timeout is supposed to be less than that. The test is running
> > > on real hardware which is considerably faster than QEMU running on our
> > > slowest runners. Basically, the timeout depends on the runner more than
> > > the test. So we override the TEST_TIMEOUT variable for the xilinx-* jobs
> > > providing a lower timeout value.
> > > 
> > > The global TEST_TIMEOUT is set to 1500.
> > > The xilinx-* timeout is set to 120 for ARM and 1000 for x86.
> > > 
> > > You are welcome to override the TEST_TIMEOUT value for the
> > > hardware-based QubesOS tests. At the same time, given that on success
> > > the timeout is not really used, it is also OK to leave it like this.
> >  
> >  
> > > > ---
> > > >  automation/build/debian/bookworm.dockerfile |  1 +
> > > >  automation/gitlab-ci/test.yaml              |  7 ++++
> > > >  automation/scripts/qemu-smoke-x86-64-efi.sh | 44 +++++++++++++++++++++
> > > >  3 files changed, 52 insertions(+)
> > > >  create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
> > > > 
> > > > diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
> > > > index 3dd70cb6b2e3..061114ba522d 100644
> > > > --- a/automation/build/debian/bookworm.dockerfile
> > > > +++ b/automation/build/debian/bookworm.dockerfile
> > > > @@ -46,6 +46,7 @@ RUN apt-get update && \
> > > >          # for test phase, qemu-smoke-* jobs
> > > >          qemu-system-x86 \
> > > >          expect \
> > > > +        ovmf \
> > > >          # for test phase, qemu-alpine-* jobs
> > > >          cpio \
> > > >          busybox-static \
> > > > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > > > index 8675016b6a37..74fd3f3109ae 100644
> > > > --- a/automation/gitlab-ci/test.yaml
> > > > +++ b/automation/gitlab-ci/test.yaml
> > > > @@ -463,6 +463,13 @@ qemu-smoke-x86-64-clang-pvh:
> > > >    needs:
> > > >      - debian-bookworm-clang-debug
> > > >  
> > > > +qemu-smoke-x86-64-gcc-efi:
> > > > +  extends: .qemu-x86-64
> > > > +  script:
> > > > +    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
> > > > +  needs:
> > > > +    - debian-bookworm-gcc-debug
> > > 
> > > Given that the script you wrote (thank you!) can also handle pvh, can we
> > > directly add a pvh job to test.yaml too?
> 
> I guess we can, but is xen.efi + PVH dom0 actually different enough to
> worth testing given we already test MB2+EFI + PVH dom0?

As it looks like also Andy thinks this is not useful, I am happy not to
do this. Let's go with PV only as you did.


> > > >  qemu-smoke-riscv64-gcc:
> > > >    extends: .qemu-riscv64
> > > >    script:
> > > > diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scripts/qemu-smoke-x86-64-efi.sh
> > > > new file mode 100755
> > > > index 000000000000..e053cfa995ba
> > > > --- /dev/null
> > > > +++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
> > > > @@ -0,0 +1,44 @@
> > > > +#!/bin/bash
> > > > +
> > > > +set -ex -o pipefail
> > > > +
> > > > +# variant should be either pv or pvh
> > > > +variant=$1
> > > > +
> > > > +# Clone and build XTF
> > > > +git clone https://xenbits.xen.org/git-http/xtf.git
> > > > +cd xtf && make -j$(nproc) && cd -
> > > > +
> > > > +case $variant in
> > > > +    pvh) k=test-hvm64-example    extra="dom0-iommu=none dom0=pvh" ;;
> > > > +    *)   k=test-pv64-example     extra= ;;
> > > > +esac
> > > > +
> > > > +mkdir -p boot-esp/EFI/BOOT
> > > > +cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
> > > > +cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
> > > > +
> > > > +cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
> > > > +[global]
> > > > +default=test
> > > > +
> > > > +[test]
> > > > +options=loglvl=all console=com1 noreboot console_timestamps=boot $extra
> > > > +kernel=kernel
> > > > +EOF
> > > > +
> > > > +cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
> > > > +cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
> > > > +
> > > > +rm -f smoke.serial
> > > > +export TEST_CMD="qemu-system-x86_64 -nographic -M q35,kernel-irqchip=split \
> > > > +        -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
> > > > +        -drive if=pflash,format=raw,file=OVMF_VARS.fd \
> > > > +        -drive file=fat:rw:boot-esp,media=disk,index=0,format=raw \
> > > > +        -m 512 -monitor none -serial stdio"
> > > > +
> > > > +export TEST_LOG="smoke.serial"
> > > > +export PASSED="Test result: SUCCESS"
> > > > +export TEST_TIMEOUT=120
> > 
> > Although this works, I would prefer keeping the TEST_TIMEOUT overrides
> > in test.yaml for consistency. 
> 
> The problem is this doesn't work. The group-level variable overrides the
> one in yaml. See the commit message and the link there...

Now I understand the problem, well spotted, thanks!

The idea behind having TEST_TIMEOUT defined as a project CI/CD variable
is that it depends on the test infrastructure rather than the Xen code.
So if we suddenly had slower runners we could change TEST_TIMEOUT
without having to change the Xen code itself. So I think we should keep
TEST_TIMEOUT as a project CI/CD variable.

I am not a fan of overwriting the TEST_TIMEOUT variable in the test
scripts, because one test script can be used for multiple different
tests, possibly even with different runners. For instance
qubes-x86-64.sh works with a couple of different hardware runners that
could have different timeout values. But I think it would work OK for
now for our hardware-based tests (e.g. xilinx-smoke-dom0less-arm64.sh
and qubes-x86-64.sh could overwrite TEST_TIMEOUT).

For this specific XTF test, I am not sure it is worth optimizing the
timeout, maybe we should leave it as default. However if we wanted to
lower the timeout value, overwriting it the way you did is OKish as I
cannot think of another way.


> > However, it might be better not to
> > override it (or to override to a higher timeout value), as successful
> > tests will terminate immediately anyway. We need to be cautious about
> > setting TEST_TIMEOUT values too low, as using a slow runner (like a
> > small, busy cloud instance) can lead to false positive failures. This
> > issue occurred frequently with ARM tests when we temporarily moved from
> > a fast ARM server to slower ARM cloud instances a couple of months ago.
> > 
> > On the other hand, adjusting TEST_TIMEOUT for non-QEMU hardware-based
> > tests is acceptable since those tests rely on real hardware
> > availability, which is unlikely to become suddenly slower.
--8323329-1969706452-1727911208=:1138574--

