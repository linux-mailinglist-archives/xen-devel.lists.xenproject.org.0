Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96428C8EF7
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 02:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724532.1129789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s888D-0000y8-8t; Sat, 18 May 2024 00:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724532.1129789; Sat, 18 May 2024 00:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s888D-0000vh-6F; Sat, 18 May 2024 00:41:01 +0000
Received: by outflank-mailman (input) for mailman id 724532;
 Sat, 18 May 2024 00:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+vq=MV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s888B-0000vb-9K
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 00:40:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49218828-14af-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 02:40:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A163D61E1E;
 Sat, 18 May 2024 00:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D36BC2BD10;
 Sat, 18 May 2024 00:40:53 +0000 (UTC)
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
X-Inumbo-ID: 49218828-14af-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715992854;
	bh=Qkdx1sDq5eH4FJtNtg1vyUmnEccgj9muqvELlebJdiQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UjUeuYXaSYVg4mqdNIQrApjBsFxHWzLhzgQ/mqyBfYoTZlgp/mNpeuo0p86eP67yg
	 tcJT+jQt0DkJzpf/PAHRO8SaZot+6Lfh8800MIGhXrUel4j/DKIbnwHN326QrOrLXi
	 /iw70/+1gk3R4P+85hgV9e5N7NDJTu40QTrySN1Mlq513S6zTg9WJJOwpO1Rvt+Q31
	 EBxWhhmKeRPDHxFTnG/3M3h8BzHyG43+sb1O/zU3TB2ID/vOSNIIzNc68L46/SXGRS
	 fNgelOz55aoJBh7EbJRXcWqbUBBB6sme5yGRVeUWhWLu1vsZQir2yE4vg74dVYkDUY
	 GF5CBzEj+WfRw==
Date: Fri, 17 May 2024 17:40:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 06/12] RFC: automation: Add linux stubdom build and smoke
 test
In-Reply-To: <c11feff249928f7e06a91c9b60633e1f74bbd6fd.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171718580.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <c11feff249928f7e06a91c9b60633e1f74bbd6fd.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1214147340-1715992830=:1052252"
Content-ID: <alpine.DEB.2.22.394.2405171740320.1052252@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1214147340-1715992830=:1052252
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2405171740321.1052252@ubuntu-linux-20-04-desktop>

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> Add minimal linux-stubdom smoke test. It starts a simple HVM with
> linux-stubdom. The actual stubdom implementation is taken from Qubes OS
> and then stripped off Qubes-specific code. In particular, the remaining
> code does _not_ support:
>  - direct kernel boot (implemented by relaying on specific guest disk
>    laying in Qubes OS)
>  - graphical console (used Qubes GUI agent injected into
>    stubdomain's qemu)
>  - audio input/output (used Qubes audio agent inside stubdomain)
>  - USB passthrough (used qrexec <-> usbip proxy inside stubdomain)
>  - setting up DHCP server (assumes guest addressing used in Qubes OS)
> 
> For this smoke test, the relevant part is missing direct kernel boot, as
> that's used in other smoke tests. Solve this by preparing disk image
> with proper bootloader (grub) installed. Since the test script is
> running on arm64 to control x86_64 box, it cannot (easily) install grub
> directly. For this reason, prepare bootsector as part of the Xen build
> (which runs on x86_64) and then prepend do the disk image during the
> test (and adjust partitions table afterwards).

I am not an expert on this, but do you think it would be possible to use
network boot and tftp instead of grub on emulated disk? That would not
require us to build neither /grub-core.img nor build_domU_disk().

I am trying to avoid grub-core.img and disk.img because I think direct
kernel boot or network boot are easier to maintain and more similar to
the other tests. If you see the ARM tests, they all use tftp boot.


> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> The test is implemented using hardware runner, because some of the
> further tests will require it (for example PCI passthrough with
> stubdomain). But if there is strong desire to have stubdomain tested
> inside qemu tests (to be included in patchew runs), it is probably an
> option for this basic smoke test.

Thanks for this amazing work. This is a great start, we can see how to
create more tests after merging this one.


> For now I'm keeping stubdomain code (build and glue scripts) in separate
> repository on my github account. This is far from ideal. What would be
> preferred option? New repository on xenbits? Or add directly into
> xen.git (stubdom directory)? Honestly, I'd rather avoid the latter, as
> from packager point of view those are mostly separate beings (similar to
> qemu, where many use distribution-provide one instead of the one bundled
> with Xen) and it's convenient to not need to rebuild stubdomain on every
> hypervisor change (like a security patch).

My suggestion is to create repositories under gitlab.com/xen-project


> Another topic is QEMU version inside stubdomain. It needs to be a
> separate build due to vastly different configure options, so I cannot
> reuse the qemu binary built for dom0 (or distribution-provided one if
> Xen is configured to use it). But also, at this moment qemu for
> stubdomain needs few extra patches that are not upstream yet.
> What should be the proper solution here (after upstreaming all the
> patches)?

It is fine to use a different QEMU version. For now, I would suggest to
keep the QEMU patches as patches to be applied, in the new repositories
under gitlab.com/xen-project


> Generally, I try to add tests early, even though there is still some
> work to do for proper stubdomain integration into upstream Xen, so any
> cleanups and future changes (like the CDROM libxl patches by Jason
> Andryuk) can be made with more confidence and reduce risk of
> regressions.
> 
> The patch is RFC only because of the stubdom repository location.
> ---
>  automation/build/alpine/3.19-arm64v8.dockerfile   |  2 +-
>  automation/build/alpine/3.19.dockerfile           |  9 ++-
>  automation/gitlab-ci/build.yaml                   |  3 +-
>  automation/gitlab-ci/test.yaml                    |  8 +-
>  automation/scripts/build                          | 12 ++-
>  automation/scripts/qubes-x86-64.sh                | 87 +++++++++++++++-
>  automation/tests-artifacts/alpine/3.19.dockerfile |  6 +-
>  7 files changed, 123 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/build/alpine/3.19-arm64v8.dockerfile b/automation/build/alpine/3.19-arm64v8.dockerfile
> index 158cf465a9ff..12810f87ecc6 100644
> --- a/automation/build/alpine/3.19-arm64v8.dockerfile
> +++ b/automation/build/alpine/3.19-arm64v8.dockerfile
> @@ -47,3 +47,5 @@ RUN apk --no-cache add \
>    # qubes test deps
>    openssh-client \
>    fakeroot \
> +  sfdisk \
> +  e2fsprogs \
> diff --git a/automation/build/alpine/3.19.dockerfile b/automation/build/alpine/3.19.dockerfile
> index 0be6d7c85fe7..108284613987 100644
> --- a/automation/build/alpine/3.19.dockerfile
> +++ b/automation/build/alpine/3.19.dockerfile
> @@ -49,3 +49,12 @@ RUN apk --no-cache add \
>    pixman-dev \
>    # livepatch-tools deps
>    elfutils-dev \
> +  # stubdom deps
> +  dracut-core \
> +  quilt \
> +  gnupg \
> +  libseccomp-dev \
> +  glib-static \
> +  gmp-dev \
> +  mpc1-dev \
> +  mpfr-dev \
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index b186289bbd82..783a0687ba34 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -323,9 +323,11 @@ alpine-3.19-rootfs-export:
>    image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.19
>    script:
>      - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
> +    - cp /grub-core.img binaries/grub-core.img
>    artifacts:
>      paths:
>        - binaries/initrd.tar.gz
> +      - binaries/grub-core.img
>    tags:
>      - x86_64
>  
> @@ -353,6 +355,7 @@ alpine-3.19-gcc-debug:
>    extends: .gcc-x86-64-build-debug
>    variables:
>      CONTAINER: alpine:3.19
> +    STUBDOM_LINUX: y
>  
>  debian-stretch-gcc-debug:
>    extends: .gcc-x86-64-build-debug
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index f62d426a8d34..80d10eb7f476 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -199,6 +199,14 @@ adl-pci-hvm-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.19-gcc-debug
>  
> +adl-stubdom-hvm-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh stubdom-hvm 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.19-gcc-debug
> +
>  zen3p-smoke-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b3c71fb6fb60..f7c85b07a8d0 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -102,4 +102,16 @@ else
>      # build Xen
>      cp -r dist binaries/
>      if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
> +
> +    if [[ "${STUBDOM_LINUX}" == "y" ]]; then
> +        git clone https://github.com/marmarek/qubes-vmm-xen-stubdom-linux -b for-upstream2
> +        make -j$(nproc) -C qubes-vmm-xen-stubdom-linux get-sources
> +        CFLAGS="-I${PWD}/dist/install/usr/local/include" \
> +            LDFLAGS="-L${PWD}/dist/install/usr/local/lib" \
> +            LD_LIBRARY_PATH="${PWD}/dist/install/usr/local/lib" \
> +            PATH="${PWD}/dist/install/usr/local/bin:$PATH" \
> +            make -j$(nproc) -C qubes-vmm-xen-stubdom-linux -f Makefile.stubdom all
> +        cp qubes-vmm-xen-stubdom-linux/build/linux/arch/x86/boot/bzImage binaries/dist/install/usr/local/lib/xen/boot/qemu-stubdom-linux-kernel
> +        cp qubes-vmm-xen-stubdom-linux/build/rootfs/stubdom-linux-rootfs binaries/dist/install/usr/local/lib/xen/boot/qemu-stubdom-linux-rootfs
> +    fi

I think qemu-stubdom-linux-kernel and qemu-stubdom-linux-rootfs should
be built as test-artifacts if they are not strictly dependent on the Xen
version.

Otherwise, please create a separate new build job for linux stubdoms (do
not reuse alpine-3.19-gcc-debug). Also I would prefer if these build
instructions were on a separate file, separate from "build".


>  fi
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 77cb0d45815d..fc73403dbadf 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -18,6 +18,37 @@ memory = 512
>  vif = [ "bridge=xenbr0", ]
>  disk = [ ]
>  '
> +domU_disk_path=
> +
> +### helper functions
> +
> +build_domU_disk() {
> +    local kernel="$1"
> +    local initrd="$2"
> +    local rootfs="$3"
> +    local output="$4"
> +    local grubcfg="$rootfs/boot/grub2/grub.cfg"
> +    local kernel_cmdline="root=/dev/xvda1 console=hvc0 earlyprintk=xen"
> +
> +    mkdir -p "$rootfs/boot/grub2"
> +    cp "$kernel" "$rootfs/boot/vmlinuz"
> +    echo "linux /boot/vmlinuz $kernel_cmdline" >> "$grubcfg"
> +    if [ -n "$initrd" ]; then
> +        cp "$initrd" "$rootfs/boot/initrd.img"
> +        echo "initrd /boot/initrd.img" >> "$grubcfg"
> +    fi
> +    echo "boot" >> "$grubcfg"
> +    size=$(du -sm "$rootfs")
> +    size=${size%%	*}
> +    # add 5M margin
> +    size=$(( size + 5 ))
> +    mke2fs -d "$rootfs" "$output.part1" ${size}m
> +    cat "$rootfs/usr/lib/grub/i386-pc/boot_hybrid.img" binaries/grub-core.img > "$output"
> +    # align for the partition 1 start (2048 sectors)
> +    truncate -s $((2048 * 512)) "$output"
> +    cat "$output.part1" >> "$output"
> +    echo ",,linux,*" | sfdisk "$output"
> +}
>  
>  ### test: smoke test & smoke test PVH
>  if [ -z "${test_variant}" ] || [ "${test_variant}" = "dom0pvh" ]; then
> @@ -116,6 +147,41 @@ until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.
>      sleep 1
>  done
>  "
> +
> +### test: stubdom-hvm
> +elif [ "${test_variant}" = "stubdom-hvm" ]; then
> +    passed="ping test passed"
> +
> +    domU_config='
> +type = "hvm"
> +name = "domU"
> +memory = 512
> +vif = [ "bridge=xenbr0", ]
> +disk = [ "/srv/disk.img,format=raw,vdev=xvda" ]
> +device_model_version = "qemu-xen"
> +device_model_stubdomain_override = 1
> +on_reboot = "destroy"
> +# libxl configures vkb backend to be dom0 instead of the stubdomain, defer
> +# changing that until there is consensus what to do about VGA output (VNC)
> +vkb_device = 0
> +'
> +    domU_check="
> +ifconfig eth0 192.168.0.2
> +until ping -c 10 192.168.0.1; do
> +    sleep 1
> +done
> +echo \"${passed}\"
> +"
> +    dom0_check="
> +set +x
> +until grep -q \"${passed}\" /var/log/xen/console/guest-domU.log; do
> +    sleep 1
> +done
> +set -x
> +echo \"${passed}\"
> +"
> +
> +    domU_disk_path=/srv/disk.img
>  fi
>  
>  # DomU
> @@ -137,8 +203,17 @@ ${domU_check}
>  chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
>  sed -i -e 's/^Welcome/domU \0/' etc/issue
> -find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
>  cd ..
> +if [ -n "$domU_disk_path" ]; then
> +    build_domU_disk \
> +        "binaries/bzImage" \
> +        "" \
> +        "rootfs" \
> +        "binaries/disk.img"
> +else
> +    (cd rootfs; find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz)
> +fi
> +
>  rm -rf rootfs
>  
>  # DOM0 rootfs
> @@ -152,6 +227,9 @@ mkdir srv
>  mkdir sys
>  rm var/run
>  cp -ar ../binaries/dist/install/* .
> +if [ -n "$domU_disk_path" ]; then
> +    cp ../binaries/disk.img "./$domU_disk_path"
> +fi
>  
>  echo "#!/bin/bash
>  
> @@ -164,8 +242,9 @@ ifconfig eth0 up
>  ifconfig xenbr0 up
>  ifconfig xenbr0 192.168.0.1
>  
> -# get domU console content into test log
> +# get domU (and possibly its stubdom) console content into test log
>  tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
> +tail -F /var/log/xen/console/guest-domU-dm.log 2>/dev/null | sed -e \"s/^/(domU-dm) /\" &
>  tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu-dm) /\" &
>  xl -vvv create /etc/xen/domU.cfg
>  ${dom0_check}
> @@ -178,7 +257,9 @@ echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
>  cp ../binaries/bzImage boot/vmlinuz
> -cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +if [ -r ../binaries/domU-rootfs.cpio.gz ]; then
> +    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +fi
>  find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
>  cd ..
>  
> diff --git a/automation/tests-artifacts/alpine/3.19.dockerfile b/automation/tests-artifacts/alpine/3.19.dockerfile
> index 6d665daedfa4..cfb2cb30fb30 100644
> --- a/automation/tests-artifacts/alpine/3.19.dockerfile
> +++ b/automation/tests-artifacts/alpine/3.19.dockerfile
> @@ -35,6 +35,8 @@ RUN \
>    apk add pciutils && \
>    apk add libelf && \
>    apk add libdw && \
> +  apk add grub-bios && \
> +  apk add libseccomp && \
>    \
>    # Xen
>    cd / && \
> @@ -64,4 +66,6 @@ RUN \
>    \
>    # Create rootfs
>    cd / && \
> -  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
> +  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var && \
> +  # Prepare boot sector for HVM disk
> +  grub-mkimage -o /grub-core.img -O i386-pc -p '(hd0,msdos1)/boot/grub2' boot part_msdos ext2 linux biosdisk configfile normal
> -- 
> git-series 0.9.1
> 
--8323329-1214147340-1715992830=:1052252--

