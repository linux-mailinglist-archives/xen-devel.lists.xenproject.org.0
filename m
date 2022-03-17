Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981854DBC8F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 02:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291302.494348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUf6S-0001gV-Ia; Thu, 17 Mar 2022 01:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291302.494348; Thu, 17 Mar 2022 01:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUf6S-0001dv-BK; Thu, 17 Mar 2022 01:39:00 +0000
Received: by outflank-mailman (input) for mailman id 291302;
 Thu, 17 Mar 2022 01:38:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nUf6Q-0001dp-Vw
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 01:38:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02d83079-a593-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 02:38:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1353DB80E52;
 Thu, 17 Mar 2022 01:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD0AC340E9;
 Thu, 17 Mar 2022 01:38:54 +0000 (UTC)
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
X-Inumbo-ID: 02d83079-a593-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647481134;
	bh=H0F6Wz1va9oERxHgLC57PfEnviO0kHl6ZVBPWhaWBCY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RdnPTiBpzZPFxysKrWBg6u8SdbmIxKuN+N2/YLmsEBBYNZ2Xil7u9UXrXf4HLtFaK
	 sCSkXpY9gUqBEipitkOw7C+C4pPyQLP1MwvhQKq835W0rHCaaueBUqzVuhKzILknfS
	 ZGqRx/Ut0xAPOnFh3/5SeemdaBOxadRuY46c5Yhpz5/2ahvKYck8i3HMtzQa7RB9ps
	 U5S6A5TwZZGtw//6qG6GH/clpK+Va+HqBD4uDatsd8M2S0e+1I5YCzGDaq9teEXpv6
	 /acPtFLd6321MAPq4Dvy+4X48X2T1Namt1/i55TSTBWRMl2mtfBXz4OnwU0VhMmf2I
	 qJlqE4CwjgpUA==
Date: Wed, 16 Mar 2022 18:38:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    anthony.perard@citrix.com, bertrand.marquis@arm.com
Subject: Re: [PATCH RESEND 2/2] gitlab-ci: add an ARM32 qemu-based smoke
 test
In-Reply-To: <2aaddfc5-0502-fd0a-6393-63a17c7f6778@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203161508200.3497@ubuntu-linux-20-04-desktop>
References: <20210714004854.31135-2-sstabellini@kernel.org> <2aaddfc5-0502-fd0a-6393-63a17c7f6778@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Anthony, Bertrand


Apologies, this feel through the cracks!

Also considering the recent arm32 xen breakage, which could have been
caught by gitlab-ci before commit, I am keen on getting this short
series in.  Better late than never :-)

I forward-ported the series to staging with minimal changes and it still
works! I'll send out an update shortly to xen-devel. I am also replying
here because there is an interesting open question about Debian Jessie
below.

One note: in case you didn't notice, we already have a couple of arm64
and one x86 test in gitlab-ci using QEMU and they all follow the same
pattern, with similar scripts to the one added here, see for instance
automation/scripts/qemu-smoke-arm64.sh.


On Wed, 21 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 14/07/2021 01:48, Stefano Stabellini wrote:
> > Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> > the test-artifacts qemu container. The minimal test simply boots Xen
> > (built from previous build stages) and Dom0. The test is fetching the
> > Dom0 kernel and initrd from Debian Jessie: they work just fine and this
> > way we don't have to maintain a build for them too.
> 
> Debian Jessie is not in LTS anymore. I am entirely sure how long this will
> still be available (older release seems to have disappeared). I would suggest
> to use Bullseye or at least Buster.

This is a good point and unfortunately I don't have a good answer. I
tried to use Bullseye and Buster kernels but neither of them work. I
don't know why. I tried to use a couple of kernels from Alpine Linux,
but they also don't work.

Curious I started bisecting kernels using "make multi_v7_defconfig +
CONFIG_XEN" and discovered that something broke with the 4.9 release.
Up until 4.8 they work fine in the default config. I have not
investigated further yet.

We still have a few months of support in Debian Jessie. My suggestion is
to go with Debian Jessie for now in this series. Then depending on the
result of the kernel investigation we can decide what to do.

I could also move the fetching of the kernel and initrd from
qemu-smoke-arm32.sh to the containiner build so that if Debian Jessie
goes offline it wouldn't affect us immediately. Not required as of now,
but could be good to do.

 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >   automation/gitlab-ci/test.yaml         | 23 ++++++++
> >   automation/scripts/qemu-smoke-arm32.sh | 72 ++++++++++++++++++++++++++
> >   2 files changed, 95 insertions(+)
> >   create mode 100755 automation/scripts/qemu-smoke-arm32.sh
> > 
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index d3b670b156..7f942dd64b 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -71,6 +71,29 @@ qemu-smoke-arm64-gcc:
> >       - /^coverity-tested\/.*/
> >       - /^stable-.*/
> >   +qemu-smoke-arm32-gcc:
> > +  stage: test
> > +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > +  variables:
> > +    CONTAINER: debian:unstable-arm64v8
> > +  script:
> > +    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee
> > qemu-smoke-arm32.log
> > +  dependencies:
> > +    - debian-unstable-gcc-arm32
> > +    - qemu-system-aarch64-6.0.0-arm32-export
> > +  artifacts:
> > +    paths:
> > +      - smoke.serial
> > +      - '*.log'
> > +    when: always
> > +  tags:
> > +    - arm64
> > +  except:
> > +    - master
> > +    - smoke
> > +    - /^coverity-tested\/.*/
> > +    - /^stable-.*/
> > +
> >   qemu-smoke-x86-64-gcc:
> >     stage: test
> >     image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > diff --git a/automation/scripts/qemu-smoke-arm32.sh
> > b/automation/scripts/qemu-smoke-arm32.sh
> > new file mode 100755
> > index 0000000000..4126be2042
> > --- /dev/null
> > +++ b/automation/scripts/qemu-smoke-arm32.sh
> > @@ -0,0 +1,72 @@
> > +#!/bin/bash
> > +
> > +set -ex
> > +
> > +# Install QEMU
> 
> The bits below doesn't seem to install QEMU. Do you mean "prepare the image"?

I updated the comment


> > +export DEBIAN_FRONTENT=noninteractive
> > +apt-get -qy update
> > +apt-get -qy install --no-install-recommends device-tree-compiler \
> > +                                            curl
> > +
> > +cd binaries
> > +curl -fsSLO
> > http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
> > +curl -fsSLO
> > http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz
> 
> OOI, does this mean all our instances are running in the US?

Yes. However, I wanted to replace this link with one of those links that
serves you the best mirror available at the moment. But I couldn't find
any. So I left it as is.

 
> > +
> > +kernel=`stat -L --printf="%s" vmlinuz`
> > +initrd=`stat -L --printf="%s" initrd.gz`
> > +
> 
> NIT: I would suggest to add a comment similar to:
> 
> # For Xen, we need a couple of more node. Dump the DT from QEMU and add them

I updated the comment


> > +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> 
> Is this a problem with the package?

Yes it is a problem with both QEMU (which shouldn't be looking for
efi-virtio.rom when calling dumpdtb) and also the package (that doesn't
provide it).

We have the same workaround in all the qemu scripts under automation.


> > +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> > +./qemu-system-arm \
> > +   -machine virt-6.0 \
> > +   -machine virtualization=true \
> > +   -smp 4 \
> > +   -m 2048 \
> > +   -serial stdio \
> > +   -monitor none \
> > +   -display none \
> > +   -machine dumpdtb=virt.dtb
> > +
> > +dtc -I dtb -O dts virt.dtb > virt.dts
> 
> IIRC, Alex was working on add multiboot support in QEMU. Do you know what's
> the state?

I don't know the latest


> > +
> > +cat >> virt.dts << EOF
> > +/ {
> > +	chosen {
> > +		#address-cells = <0x2>;
> > +		#size-cells = <0x2>;
> > +		stdout-path = "/pl011@9000000";
> > +        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000
> > dom0_mem=1G dom0_max_vcpus=1 bootscrub=0";
> 
> Given that QEMU will expose 4 CPUs, any reason to limit dom0 to 1?

Good idea, I did that


> > +		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk
> > clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh init=/bin/sh";
> > +		dom0 {
> > +			compatible = "xen,linux-zimage",
> > "xen,multiboot-module";
> > +			reg = <0x0 0x1000000 0x0 $kernel>;
> > +		};
> > +        dom0-ramdisk {
> > +			compatible = "xen,linux-initrd",
> > "xen,multiboot-module";
> > +			reg = <0x0 0x3200000 0x0 $initrd>;
> > +		};
> > +	};
> > +};
> > +EOF
> > +dtc -I dts -O dtb virt.dts > virt.dtb
> > +
> > +rm -f smoke.serial
> > +set +e
> > +timeout -k 1 240 \
> > +./qemu-system-arm \
> > +   -machine virt-6.0 \
> > +   -machine virtualization=true \
> > +   -smp 4 \
> > +   -m 2048 \
> 
> Given seem to be a bit wasteful (and will definitely slow down Xen boot). As
> this is a smoke, can we consider to drop to 512?

Yes, also good idea. I dropped dom0_mem to 512 and here -m 1024. Less
than that, it leads to a boot error (I haven't investigated).


> > +   -serial stdio \
> > +   -monitor none \
> > +   -display none \
> > +   -dtb virt.dtb \
> > +   -no-reboot \
> > +   -kernel ./xen \
> > +   -device loader,file=./vmlinuz,addr=0x1000000 \
> > +   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
> > +
> > +set -e
> > +(grep -q "^BusyBox" smoke.serial) || exit 1
> 
> So this look for "BusyBox" anywhere in the log. What if there is a crash just
> after "BusyBox"? Is there something different we can grep?

I am not sure, there isn't much after "BusyBox" because the initrd is
basically empty (appended below the last few lines for your reference).
Also keeping in mind that all the QEMU tests today check for "BusyBox",
I would leave it as is.

---
BusyBox v1.22.1 (Debian 1:1.22.0-9+deb8u1) built-in shell (ash)
Enter 'help' for a list of built-in commands.
/bin/sh: can't access tty; job control turned off
~ #

