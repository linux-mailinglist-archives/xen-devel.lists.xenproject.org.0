Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F48C8F31
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 03:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724570.1129850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88sR-0001uO-PZ; Sat, 18 May 2024 01:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724570.1129850; Sat, 18 May 2024 01:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88sR-0001s9-MU; Sat, 18 May 2024 01:28:47 +0000
Received: by outflank-mailman (input) for mailman id 724570;
 Sat, 18 May 2024 01:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G4V=MV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s88sQ-0001s1-KF
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 01:28:46 +0000
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5864e5c-14b5-11ef-909e-e314d9c70b13;
 Sat, 18 May 2024 03:28:43 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id D45471C000C5;
 Fri, 17 May 2024 21:28:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 17 May 2024 21:28:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 May 2024 21:28:38 -0400 (EDT)
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
X-Inumbo-ID: f5864e5c-14b5-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1715995719;
	 x=1716082119; bh=zd22xuUubCFGRKxRtahgPrZdVvCDuTzfTyBsoeycvAk=; b=
	B0ixvmidpWNed+fJYIGwYeAGlJw2klLz6RXFHhToLu6bEBayv8saLYHogiIZqSGn
	NGCmUQUvR5hotBCyu5cAilFhoVuT/croNw7gyWun0aZwMFV7lAbmWupCCtAaKIOl
	61Kiy3vVjrgjau1/crWvkUNEjiTBdQqEbqWNhDPMaF+SZ+Ftkd5XAKY2zRSCEQQf
	UTTwcDNUiAspiN+N0s2NMLgxT+t1wroEhdgW5qNdUlvk4W4wEECyPE2/DENE8Yd0
	SE/cNhFfFCCcAW5sgq2daT71MR+pzuZAo3VfRszQsaGNDVCGOhw2B2uolzAKyIrN
	CrttZ//Yn+4DIZDurCmmyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715995719; x=1716082119; bh=zd22xuUubCFGRKxRtahgPrZdVvCD
	uTzfTyBsoeycvAk=; b=KBJKyJwlyftVL9jzFNiRYGdUXN57Ueq1RixPnt6ZL2jc
	HY8uWj27kUrTW11BYFwnsu9rFjRYfSoq6P9Qxneh+XQgGJeLnZGaApXfZzd4m2jt
	za+HargUjafECQXL0T7r4CGUVq8x7J1eQ1sTNnQsRSPLcVwzXJbd7R3+liaZuWAK
	X3dPJRWiK/7qdygnDKp7mXBWCyoAaKksd9vjX3+XtTRw2bhXGM+n8VIp60YcL7PW
	2tt9+5jBH8f8ZwHdNaEJ5Cs/nmW6wTuXJUn/RRZdeBUMoYPoKqx5ywCI+OKXNrm+
	oCS7ne2OamamUxnzWUkrFl8wX9oBIaLKgXL20yu4Pg==
X-ME-Sender: <xms:RwRIZgHfT7GjU9xvnxv1p5nqtG9hlRdVkK9emnMRxMjxygpncqMOaQ>
    <xme:RwRIZpX1PvzxW7XHzvBLrqjz-IyN3llQf-YFna42JtT1eX-fM0iT-JUj_zE0w4NHB
    d0P1I2Jdi8xOQ>
X-ME-Received: <xmr:RwRIZqLGLopJGr-EMgcs36LY_ROiknbX8qZqRKlfL-L0kDD_9f4PLVMeHIJJhId9GX3XKfYDXGQpJs_jMeStgUONln8w7nMN3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehhedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkefg
    vefhveekffeivedvgfelvddvhefhfeeukeefudfhheeuvddutdekleefkeejnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:RwRIZiGLm7ppr6GHGLv_VnyEDHiRGCEk307YiViRD7rUZRyIlosqng>
    <xmx:RwRIZmWn6U97eQUNHreeOBBKW_K8xaxeeHe8yvan-NAa3RWg0o4NkA>
    <xmx:RwRIZlOg41qb-7Fw5XJNgtzN6jkCnhvdBiORgcijIuRNwUcNWQ2nEw>
    <xmx:RwRIZt1mF25k526qH9-9sz8-chSGA1NoOWEZXejEZ1DNOTkGuXNT8w>
    <xmx:RwRIZjhcehU_ihHglc_PUktLr7KJmEbC9mXslmKLf9_AXXekE7zJI_WT>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 18 May 2024 03:28:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 06/12] RFC: automation: Add linux stubdom build and smoke
 test
Message-ID: <ZkgERD6pejvJs2gg@mail-itl>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
 <c11feff249928f7e06a91c9b60633e1f74bbd6fd.1715867907.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2405171718580.1052252@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/jbizhnpfyenlI1g"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2405171718580.1052252@ubuntu-linux-20-04-desktop>


--/jbizhnpfyenlI1g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 May 2024 03:28:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 06/12] RFC: automation: Add linux stubdom build and smoke
 test

On Fri, May 17, 2024 at 05:40:52PM -0700, Stefano Stabellini wrote:
> On Thu, 16 May 2024, Marek Marczykowski-G=C3=B3recki wrote:
> > Add minimal linux-stubdom smoke test. It starts a simple HVM with
> > linux-stubdom. The actual stubdom implementation is taken from Qubes OS
> > and then stripped off Qubes-specific code. In particular, the remaining
> > code does _not_ support:
> >  - direct kernel boot (implemented by relaying on specific guest disk
> >    laying in Qubes OS)
> >  - graphical console (used Qubes GUI agent injected into
> >    stubdomain's qemu)
> >  - audio input/output (used Qubes audio agent inside stubdomain)
> >  - USB passthrough (used qrexec <-> usbip proxy inside stubdomain)
> >  - setting up DHCP server (assumes guest addressing used in Qubes OS)
> >=20
> > For this smoke test, the relevant part is missing direct kernel boot, as
> > that's used in other smoke tests. Solve this by preparing disk image
> > with proper bootloader (grub) installed. Since the test script is
> > running on arm64 to control x86_64 box, it cannot (easily) install grub
> > directly. For this reason, prepare bootsector as part of the Xen build
> > (which runs on x86_64) and then prepend do the disk image during the
> > test (and adjust partitions table afterwards).
>=20
> I am not an expert on this, but do you think it would be possible to use
> network boot and tftp instead of grub on emulated disk? That would not
> require us to build neither /grub-core.img nor build_domU_disk().

Honestly, I don't know. I guess I'd need at least dnsmasq in dom0, and
also iPXE for the domU (if not built already?). I can try for this test.
But a later test (the PCI one) connects a network card and dom0 can't
really setup own DHCP on that network. Additionally combining this with
vif network for PXE might be confusing down the road.

> I am trying to avoid grub-core.img and disk.img because I think direct
> kernel boot or network boot are easier to maintain and more similar to
> the other tests. If you see the ARM tests, they all use tftp boot.

The ARM ones boot as dom0less, where there is only one boot mode for the
system to start in. Here, we have two: xen+dom0 (which already
does network boot), and then domU started by dom0. The latter would
need either a separate DHCP server on a separate network (vif interface
in dom0 should be fine), or some other way to separate dom0/domU boot
mode.

That said, the stubdom used in Qubes does support direct kernel boot. It
is removed from this version, because it relies on specific disk layout
(it reserves xvdd for this purpose). But I do want to bring this
capability to the upstream version too at some point.

> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > The test is implemented using hardware runner, because some of the
> > further tests will require it (for example PCI passthrough with
> > stubdomain). But if there is strong desire to have stubdomain tested
> > inside qemu tests (to be included in patchew runs), it is probably an
> > option for this basic smoke test.
>=20
> Thanks for this amazing work. This is a great start, we can see how to
> create more tests after merging this one.
>=20
>=20
> > For now I'm keeping stubdomain code (build and glue scripts) in separate
> > repository on my github account. This is far from ideal. What would be
> > preferred option? New repository on xenbits? Or add directly into
> > xen.git (stubdom directory)? Honestly, I'd rather avoid the latter, as
> > from packager point of view those are mostly separate beings (similar to
> > qemu, where many use distribution-provide one instead of the one bundled
> > with Xen) and it's convenient to not need to rebuild stubdomain on every
> > hypervisor change (like a security patch).
>=20
> My suggestion is to create repositories under gitlab.com/xen-project

gitlab.com/xen-project/stubdom-dm-linux ?
Initially I can create the repository under people/marmarek/.

Is there any preference regarding git history? I see two options:
1. Preserve the current history, where there is a lot of qubes-specific
work and on top a bunch of commits making it not qubes-specific (this is
what is there now).
2. Start with fresh history and reference original repository (and the
commit id) in the initial commit message.

> > Another topic is QEMU version inside stubdomain. It needs to be a
> > separate build due to vastly different configure options, so I cannot
> > reuse the qemu binary built for dom0 (or distribution-provided one if
> > Xen is configured to use it). But also, at this moment qemu for
> > stubdomain needs few extra patches that are not upstream yet.
> > What should be the proper solution here (after upstreaming all the
> > patches)?
>=20
> It is fine to use a different QEMU version. For now, I would suggest to
> keep the QEMU patches as patches to be applied, in the new repositories
> under gitlab.com/xen-project

Ok, makes sense.

> > Generally, I try to add tests early, even though there is still some
> > work to do for proper stubdomain integration into upstream Xen, so any
> > cleanups and future changes (like the CDROM libxl patches by Jason
> > Andryuk) can be made with more confidence and reduce risk of
> > regressions.
> >=20
> > The patch is RFC only because of the stubdom repository location.
> > ---
> >  automation/build/alpine/3.19-arm64v8.dockerfile   |  2 +-
> >  automation/build/alpine/3.19.dockerfile           |  9 ++-
> >  automation/gitlab-ci/build.yaml                   |  3 +-
> >  automation/gitlab-ci/test.yaml                    |  8 +-
> >  automation/scripts/build                          | 12 ++-
> >  automation/scripts/qubes-x86-64.sh                | 87 +++++++++++++++-
> >  automation/tests-artifacts/alpine/3.19.dockerfile |  6 +-
> >  7 files changed, 123 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/automation/build/alpine/3.19-arm64v8.dockerfile b/automati=
on/build/alpine/3.19-arm64v8.dockerfile
> > index 158cf465a9ff..12810f87ecc6 100644
> > --- a/automation/build/alpine/3.19-arm64v8.dockerfile
> > +++ b/automation/build/alpine/3.19-arm64v8.dockerfile
> > @@ -47,3 +47,5 @@ RUN apk --no-cache add \
> >    # qubes test deps
> >    openssh-client \
> >    fakeroot \
> > +  sfdisk \
> > +  e2fsprogs \
> > diff --git a/automation/build/alpine/3.19.dockerfile b/automation/build=
/alpine/3.19.dockerfile
> > index 0be6d7c85fe7..108284613987 100644
> > --- a/automation/build/alpine/3.19.dockerfile
> > +++ b/automation/build/alpine/3.19.dockerfile
> > @@ -49,3 +49,12 @@ RUN apk --no-cache add \
> >    pixman-dev \
> >    # livepatch-tools deps
> >    elfutils-dev \
> > +  # stubdom deps
> > +  dracut-core \
> > +  quilt \
> > +  gnupg \
> > +  libseccomp-dev \
> > +  glib-static \
> > +  gmp-dev \
> > +  mpc1-dev \
> > +  mpfr-dev \
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/bui=
ld.yaml
> > index b186289bbd82..783a0687ba34 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -323,9 +323,11 @@ alpine-3.19-rootfs-export:
> >    image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.=
19
> >    script:
> >      - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
> > +    - cp /grub-core.img binaries/grub-core.img
> >    artifacts:
> >      paths:
> >        - binaries/initrd.tar.gz
> > +      - binaries/grub-core.img
> >    tags:
> >      - x86_64
> > =20
> > @@ -353,6 +355,7 @@ alpine-3.19-gcc-debug:
> >    extends: .gcc-x86-64-build-debug
> >    variables:
> >      CONTAINER: alpine:3.19
> > +    STUBDOM_LINUX: y
> > =20
> >  debian-stretch-gcc-debug:
> >    extends: .gcc-x86-64-build-debug
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index f62d426a8d34..80d10eb7f476 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -199,6 +199,14 @@ adl-pci-hvm-x86-64-gcc-debug:
> >      - *x86-64-test-needs
> >      - alpine-3.19-gcc-debug
> > =20
> > +adl-stubdom-hvm-x86-64-gcc-debug:
> > +  extends: .adl-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64.sh stubdom-hvm 2>&1 | tee ${LO=
GFILE}
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.19-gcc-debug
> > +
> >  zen3p-smoke-x86-64-gcc-debug:
> >    extends: .zen3p-x86-64
> >    script:
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index b3c71fb6fb60..f7c85b07a8d0 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -102,4 +102,16 @@ else
> >      # build Xen
> >      cp -r dist binaries/
> >      if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
> > +
> > +    if [[ "${STUBDOM_LINUX}" =3D=3D "y" ]]; then
> > +        git clone https://github.com/marmarek/qubes-vmm-xen-stubdom-li=
nux -b for-upstream2
> > +        make -j$(nproc) -C qubes-vmm-xen-stubdom-linux get-sources
> > +        CFLAGS=3D"-I${PWD}/dist/install/usr/local/include" \
> > +            LDFLAGS=3D"-L${PWD}/dist/install/usr/local/lib" \
> > +            LD_LIBRARY_PATH=3D"${PWD}/dist/install/usr/local/lib" \
> > +            PATH=3D"${PWD}/dist/install/usr/local/bin:$PATH" \
> > +            make -j$(nproc) -C qubes-vmm-xen-stubdom-linux -f Makefile=
=2Estubdom all
> > +        cp qubes-vmm-xen-stubdom-linux/build/linux/arch/x86/boot/bzIma=
ge binaries/dist/install/usr/local/lib/xen/boot/qemu-stubdom-linux-kernel
> > +        cp qubes-vmm-xen-stubdom-linux/build/rootfs/stubdom-linux-root=
fs binaries/dist/install/usr/local/lib/xen/boot/qemu-stubdom-linux-rootfs
> > +    fi
>=20
> I think qemu-stubdom-linux-kernel and qemu-stubdom-linux-rootfs should
> be built as test-artifacts if they are not strictly dependent on the Xen
> version.

This is almost true - QEMU needs to be built for the specific Xen version,
since it still uses some of the unstable ABIs... In practice, it might
be possible to have test-artifact for each Xen version separately, but
it will be PITA about the time of bumping the interface version (like
XEN_DOMCTL_INTERFACE_VERSION).

> Otherwise, please create a separate new build job for linux stubdoms (do
> not reuse alpine-3.19-gcc-debug). Also I would prefer if these build
> instructions were on a separate file, separate from "build".

Ok.

> >  fi
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 77cb0d45815d..fc73403dbadf 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -18,6 +18,37 @@ memory =3D 512
> >  vif =3D [ "bridge=3Dxenbr0", ]
> >  disk =3D [ ]
> >  '
> > +domU_disk_path=3D
> > +
> > +### helper functions
> > +
> > +build_domU_disk() {
> > +    local kernel=3D"$1"
> > +    local initrd=3D"$2"
> > +    local rootfs=3D"$3"
> > +    local output=3D"$4"
> > +    local grubcfg=3D"$rootfs/boot/grub2/grub.cfg"
> > +    local kernel_cmdline=3D"root=3D/dev/xvda1 console=3Dhvc0 earlyprin=
tk=3Dxen"
> > +
> > +    mkdir -p "$rootfs/boot/grub2"
> > +    cp "$kernel" "$rootfs/boot/vmlinuz"
> > +    echo "linux /boot/vmlinuz $kernel_cmdline" >> "$grubcfg"
> > +    if [ -n "$initrd" ]; then
> > +        cp "$initrd" "$rootfs/boot/initrd.img"
> > +        echo "initrd /boot/initrd.img" >> "$grubcfg"
> > +    fi
> > +    echo "boot" >> "$grubcfg"
> > +    size=3D$(du -sm "$rootfs")
> > +    size=3D${size%%	*}
> > +    # add 5M margin
> > +    size=3D$(( size + 5 ))
> > +    mke2fs -d "$rootfs" "$output.part1" ${size}m
> > +    cat "$rootfs/usr/lib/grub/i386-pc/boot_hybrid.img" binaries/grub-c=
ore.img > "$output"
> > +    # align for the partition 1 start (2048 sectors)
> > +    truncate -s $((2048 * 512)) "$output"
> > +    cat "$output.part1" >> "$output"
> > +    echo ",,linux,*" | sfdisk "$output"
> > +}
> > =20
> >  ### test: smoke test & smoke test PVH
> >  if [ -z "${test_variant}" ] || [ "${test_variant}" =3D "dom0pvh" ]; th=
en
> > @@ -116,6 +147,41 @@ until grep -q \"^domU Welcome to Alpine Linux\" /v=
ar/log/xen/console/guest-domU.
> >      sleep 1
> >  done
> >  "
> > +
> > +### test: stubdom-hvm
> > +elif [ "${test_variant}" =3D "stubdom-hvm" ]; then
> > +    passed=3D"ping test passed"
> > +
> > +    domU_config=3D'
> > +type =3D "hvm"
> > +name =3D "domU"
> > +memory =3D 512
> > +vif =3D [ "bridge=3Dxenbr0", ]
> > +disk =3D [ "/srv/disk.img,format=3Draw,vdev=3Dxvda" ]
> > +device_model_version =3D "qemu-xen"
> > +device_model_stubdomain_override =3D 1
> > +on_reboot =3D "destroy"
> > +# libxl configures vkb backend to be dom0 instead of the stubdomain, d=
efer
> > +# changing that until there is consensus what to do about VGA output (=
VNC)
> > +vkb_device =3D 0
> > +'
> > +    domU_check=3D"
> > +ifconfig eth0 192.168.0.2
> > +until ping -c 10 192.168.0.1; do
> > +    sleep 1
> > +done
> > +echo \"${passed}\"
> > +"
> > +    dom0_check=3D"
> > +set +x
> > +until grep -q \"${passed}\" /var/log/xen/console/guest-domU.log; do
> > +    sleep 1
> > +done
> > +set -x
> > +echo \"${passed}\"
> > +"
> > +
> > +    domU_disk_path=3D/srv/disk.img
> >  fi
> > =20
> >  # DomU
> > @@ -137,8 +203,17 @@ ${domU_check}
> >  chmod +x etc/local.d/xen.start
> >  echo "rc_verbose=3Dyes" >> etc/rc.conf
> >  sed -i -e 's/^Welcome/domU \0/' etc/issue
> > -find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../bina=
ries/domU-rootfs.cpio.gz
> >  cd ..
> > +if [ -n "$domU_disk_path" ]; then
> > +    build_domU_disk \
> > +        "binaries/bzImage" \
> > +        "" \
> > +        "rootfs" \
> > +        "binaries/disk.img"
> > +else
> > +    (cd rootfs; find . | fakeroot -i ../fakeroot-save cpio -H newc -o =
| gzip > ../binaries/domU-rootfs.cpio.gz)
> > +fi
> > +
> >  rm -rf rootfs
> > =20
> >  # DOM0 rootfs
> > @@ -152,6 +227,9 @@ mkdir srv
> >  mkdir sys
> >  rm var/run
> >  cp -ar ../binaries/dist/install/* .
> > +if [ -n "$domU_disk_path" ]; then
> > +    cp ../binaries/disk.img "./$domU_disk_path"
> > +fi
> > =20
> >  echo "#!/bin/bash
> > =20
> > @@ -164,8 +242,9 @@ ifconfig eth0 up
> >  ifconfig xenbr0 up
> >  ifconfig xenbr0 192.168.0.1
> > =20
> > -# get domU console content into test log
> > +# get domU (and possibly its stubdom) console content into test log
> >  tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^=
/(domU) /\" &
> > +tail -F /var/log/xen/console/guest-domU-dm.log 2>/dev/null | sed -e \"=
s/^/(domU-dm) /\" &
> >  tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu=
-dm) /\" &
> >  xl -vvv create /etc/xen/domU.cfg
> >  ${dom0_check}
> > @@ -178,7 +257,9 @@ echo "XENCONSOLED_TRACE=3Dall" >> etc/default/xenco=
mmons
> >  echo "QEMU_XEN=3D/bin/false" >> etc/default/xencommons
> >  mkdir -p var/log/xen/console
> >  cp ../binaries/bzImage boot/vmlinuz
> > -cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> > +if [ -r ../binaries/domU-rootfs.cpio.gz ]; then
> > +    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> > +fi
> >  find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../bina=
ries/dom0-rootfs.cpio.gz
> >  cd ..
> > =20
> > diff --git a/automation/tests-artifacts/alpine/3.19.dockerfile b/automa=
tion/tests-artifacts/alpine/3.19.dockerfile
> > index 6d665daedfa4..cfb2cb30fb30 100644
> > --- a/automation/tests-artifacts/alpine/3.19.dockerfile
> > +++ b/automation/tests-artifacts/alpine/3.19.dockerfile
> > @@ -35,6 +35,8 @@ RUN \
> >    apk add pciutils && \
> >    apk add libelf && \
> >    apk add libdw && \
> > +  apk add grub-bios && \
> > +  apk add libseccomp && \
> >    \
> >    # Xen
> >    cd / && \
> > @@ -64,4 +66,6 @@ RUN \
> >    \
> >    # Create rootfs
> >    cd / && \
> > -  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin =
usr var
> > +  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin =
usr var && \
> > +  # Prepare boot sector for HVM disk
> > +  grub-mkimage -o /grub-core.img -O i386-pc -p '(hd0,msdos1)/boot/grub=
2' boot part_msdos ext2 linux biosdisk configfile normal
> > --=20
> > git-series 0.9.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/jbizhnpfyenlI1g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZIBEQACgkQ24/THMrX
1yzF9Qf9GeFsU+7R7GJrRSdePb6LtqorKVJBaoq+4MHw7odCNjkqNuGIdI08Wx/b
hfH+h4+6qV3xE8MrgRrUHMdLSafCAhyn3wG306iNtoXXqzy0klNLfvv04s189Bry
9tkA1iJ9IqGiuSbTICQ0MGGCa7hUZPDD5aN67XZPng8lNCGEtDYQUFTGFaQ/M80G
sqSf0QdL0u9tna+4rEwZs970h/YZuGQbj1SitHGF1K95HCQJLs1NYxSTHUxoMMHZ
76Z0+Gjgm1bdc1tjnE+KeH6y75fu7M88G27wD7kMonqd/HBt1loLSBsHTKWOTO0e
84vmi0MIiOyt2ejJ9VYcnVQPsljCYQ==
=5/El
-----END PGP SIGNATURE-----

--/jbizhnpfyenlI1g--

