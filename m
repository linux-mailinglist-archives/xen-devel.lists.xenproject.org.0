Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E122CF650
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 22:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45083.80554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klIoo-0005ts-Tz; Fri, 04 Dec 2020 21:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45083.80554; Fri, 04 Dec 2020 21:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klIoo-0005tS-Qi; Fri, 04 Dec 2020 21:40:46 +0000
Received: by outflank-mailman (input) for mailman id 45083;
 Fri, 04 Dec 2020 21:40:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNFP=FI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klIon-0005mT-V0
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 21:40:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5530d3c-dab1-4a5a-bc96-6f0f942cccb7;
 Fri, 04 Dec 2020 21:40:44 +0000 (UTC)
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
X-Inumbo-ID: d5530d3c-dab1-4a5a-bc96-6f0f942cccb7
Date: Fri, 4 Dec 2020 13:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607118044;
	bh=+BjprIbHx8mxLbZVVC1kwi0qaPAi0CFltpmHTGpjwpU=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=NzRsMuaFH6TclnM/mK2Q4H6zZTQtK+G8Qrt2XkCns8qBqorpvH3VHkdI6XWDg1W7O
	 +Gn6t2ZI+E1nclJTaHmU/tAqxRsvfRwimzs32ujxRb8Vds+8yqon/itVSkb4AYo0bM
	 fbzHvKDWdCqaEDW+Ok1ATw8A1G7nSswliLtthx7b4XYsMOUL2TGO/5UfhIcn/AHc2e
	 fFEYyK/eceQnHr0yihN6WJdfCko7AVIEFJ13dDTVmaU0j5Ti80EwkWf6LfH5n3Fysu
	 rqaDW0gXiRskZj84tXK2Kpy2gMWBXvun/Bvp6lpHaHV0jg+0GQ/o4X8Fq66uBUA50J
	 XSYeS0pVtDs0w==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 01/12] automation: add a QEMU aarch64 smoke test
In-Reply-To: <20201204104039.44diltm2gg4twpxn@liuwe-devbox-debian-v2>
Message-ID: <alpine.DEB.2.21.2012041335110.32240@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s> <20201125042745.31986-1-sstabellini@kernel.org> <20201204104039.44diltm2gg4twpxn@liuwe-devbox-debian-v2>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Dec 2020, Wei Liu wrote:
> On Tue, Nov 24, 2020 at 08:27:34PM -0800, Stefano Stabellini wrote:
> > Use QEMU to start Xen (just the hypervisor) up until it stops because
> > there is no dom0 kernel to boot.
> > 
> > It is based on the existing build job unstable-arm64v8.
> > 
> > Also use make -j$(nproc) to build Xen.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > Changes in v2:
> > - fix x86_32 build
> > ---
> >  automation/gitlab-ci/test.yaml         | 22 ++++++++++++++++++
> >  automation/scripts/build               |  6 ++---
> >  automation/scripts/qemu-smoke-arm64.sh | 32 ++++++++++++++++++++++++++
> >  3 files changed, 57 insertions(+), 3 deletions(-)
> >  create mode 100755 automation/scripts/qemu-smoke-arm64.sh
> > 
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index 793feafe8b..35346e3f6e 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -22,6 +22,28 @@ build-each-commit-gcc:
> >      - /^coverity-tested\/.*/
> >      - /^stable-.*/
> >  
> > +qemu-smoke-arm64-gcc:
> > +  stage: test
> > +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > +  variables:
> > +    CONTAINER: debian:unstable-arm64v8
> > +  script:
> > +    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> > +  dependencies:
> > +    - debian-unstable-gcc-arm64
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
> >  qemu-smoke-x86-64-gcc:
> >    stage: test
> >    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index 0cd0f3971d..7038e5eb50 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -10,9 +10,9 @@ cc-ver()
> >  
> >  # random config or default config
> >  if [[ "${RANDCONFIG}" == "y" ]]; then
> > -    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> > +    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> >  else
> > -    make -C xen defconfig
> > +    make -j$(nproc) -C xen defconfig
> >  fi
> >  
> >  # build up our configure options
> > @@ -45,7 +45,7 @@ make -j$(nproc) dist
> >  # Extract artifacts to avoid getting rewritten by customised builds
> >  cp xen/.config xen-config
> >  mkdir binaries
> > -if [[ "${XEN_TARGET_ARCH}" == "x86_64" ]]; then
> > +if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
> >      cp xen/xen binaries/xen
> >  fi
> >  
> > diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> > new file mode 100755
> > index 0000000000..a7efbf8b6f
> > --- /dev/null
> > +++ b/automation/scripts/qemu-smoke-arm64.sh
> > @@ -0,0 +1,32 @@
> > +#!/bin/bash
> > +
> > +set -ex
> > +
> > +# Install QEMU
> > +export DEBIAN_FRONTENT=noninteractive
> > +apt-get -qy update
> > +apt-get -qy install --no-install-recommends qemu-system-aarch64 \
> > +                                            u-boot-qemu
> > +
> > +# XXX Silly workaround to get the following QEMU command to work
> > +cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom
> 
> Can you explain a bit more why this workaround works at all?
> 
> Not a blocking comment, but this will help other people who try to
> modify this script.

Yeah: the following QEMU command just after the copy is:

  qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 512 -display none \
     -machine dumpdtb=binaries/virt-gicv3.dtb

The purpose for this command is just to generate the dtb for the
platform, see the "dumpdtb" option.

This version of QEMU refuses to do that unless it can load
"efi-virtio.rom"; although it doesn't make any sense because:
- we are not running anything here, only generating a DTB, no ROMs
  should be needed
- below when we actualy start QEMU to do emulation with the same
  options, "efi-virtio.rom" is not actually needed


I can expand a bit more on the comment, maybe:

# XXX Silly workaround to get the following QEMU command to work
# QEMU looks for "efi-virtio.rom" even if it is unneeded


Thank you for the ack on the series by the way. If you are OK with it, I
am going to wait for a couple of days in case of further comments, and
if there aren't any I'll commit the series making this change on commit.

