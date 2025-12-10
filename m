Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C508CB19A1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 02:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182481.1505352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT95i-0003uc-Oq; Wed, 10 Dec 2025 01:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182481.1505352; Wed, 10 Dec 2025 01:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT95i-0003rV-LP; Wed, 10 Dec 2025 01:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1182481;
 Wed, 10 Dec 2025 01:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTTf=6Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vT95h-0003rP-TY
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 01:34:06 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e50ceee-d568-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 02:34:02 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 193317A017D;
 Tue,  9 Dec 2025 20:34:01 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 09 Dec 2025 20:34:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Dec 2025 20:33:59 -0500 (EST)
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
X-Inumbo-ID: 4e50ceee-d568-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765330440;
	 x=1765416840; bh=aN0KpIR5v/Qg+yp50S0vqMKUunNz1HiVh8xXAQ5ebcE=; b=
	z2kmxwBds/CZ3eOl93zme+Npn40J6//b0OBiLf8MRh/uF9ne8qZ2armCD96Kd2BL
	PhokxW/N5laPOB93ivIAn7C5vgWPUB1r8WedWcCay362E4WftWhsPHEmToyz7oFK
	sxYnuUllbGoleK9r5zPWcvYPELFI4/fYwAm04qqzglOVZd0lPMf6EFwBVT8p4fTt
	3zR7WXaf2/qq5Rmc3ABy9kaS7ZfNYfyr1S//L731dPUPTXWZPfXpn87aBVklKtTU
	J5ZqcCiEniVY5tlOgcoHJKqAPJHFUSEcLs2D2g4PQOp1NaxJESeo58+6ALqfO7+N
	Jwv50WsqfNry2ujVwrvu0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765330440; x=1765416840; bh=aN0KpIR5v/Qg+yp50S0vqMKUunNz1HiVh8x
	XAQ5ebcE=; b=VvJvBGit6IOx7Efy1Y6j85tHftmvGFkD+VqNf+TChsJ7TAs17DW
	JGPuNipyYOfChHf4xpj7fmWc9+yc/FgOPDhrxTFjbIHUO3IQcbU2k2AazlKnupIS
	WmNmhA7o12Z9/H0j4j7O2YKRRFK/RkAhUv7/Wse/opM+vaYqblB7t8/LYgHTS3Ng
	7+chXyBNzxr9KudMmQ/5jb23gKB7uxQme5cS+elzhK6KmZjlAWjB/48T6ss9gyYZ
	GgRSGonBLAvlLYl8cZ9XH1XA8eVZFNdxC2jIncC91mZXUmttjUUAbqS4PftRSfUi
	gMiYj9zBNdjgbIgylCwshQj1m1Kk7hrhdxw==
X-ME-Sender: <xms:CM44aVGCvCaa9mGfLEGSLJvssSj4FCvMGJ9Q8trL6iUS1yYQnpd5lg>
    <xme:CM44aRUDM58j64mW2Y9P-IM_TBh-ge_pZPHmSlf9chr5EkfJaioRKU4rUO0TY-6xZ
    um84qmo2oHAsunQ2fLoux2A1m4T67YfaRGKxjgL2cR7TmFXlg>
X-ME-Received: <xmr:CM44acI7wxh2dHH1o10vR3l985z3P5Dg5LGEDVMbQpf4uoiaarFHPVzIsuDcJchpHQg6ro02kK06qY8cchx7C0kUfhmrorEvloI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvuddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhroh
    hjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:CM44aZ_LyB4AUYCHVZRaCSr8Zt8JD-nMNxGhDrHlYVDQ08hxsvbbLg>
    <xmx:CM44aXLCRMjLQ0Ccq-yX2to92v3mYDls2hn9cL30SosHWrWuk7bfbw>
    <xmx:CM44aWmEp3foicr8M-8_WdskN_bRDaJcv0KAxjUj9EZRYgYdhIy-mw>
    <xmx:CM44aTPKABoX0kxH1gaT2JiLWt7VzI7THzAyLj8DsBi_sTMW96hZDA>
    <xmx:CM44aXroW_ix7TnVCXlfhQn6aZTN2R9pMIrAnU1oFTA-hixRxRzC0Kn0>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 10 Dec 2025 02:33:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests
Message-ID: <aTjOBpuKMSO4LzzN@mail-itl>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
 <cf2a2544fe27fedca5129b61912c064f4be08236.1764989098.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2512091534060.19429@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RcdN1YP0Qc0lK4Ck"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2512091534060.19429@ubuntu-linux-20-04-desktop>


--RcdN1YP0Qc0lK4Ck
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Dec 2025 02:33:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests

On Tue, Dec 09, 2025 at 04:02:06PM -0800, Stefano Stabellini wrote:
> On Sat, 6 Dec 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > Setup a simple two domU system. One with network backend, running
> > xendriverdomain service, and one with frontend, trying to ping the
> > backend.
> >=20
> > Contrary to other similar tests, use disk image instead of initrd, to
> > allow bigger rootfs without adding more RAM (for both dom0 and domU).
> > But keep using pxelinux as a bootloader as it's easier to setup than
> > installing grub on the disk. Theoretically, it could be started via dir=
ect
> > kernel boot in QEMU, but pxelinux is slightly closer to real-world
> > deployment.
> >=20
> > Use fakeroot to preserve file owners/permissions. This is especially
> > important for suid binaries like /bin/mount - without fakeroot, they
> > will end up as suid into non-root user.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v3:
> > - add fakeroot
> > - run ldconfig at the disk image creation time, to avoid running it at
> >   dom0/domU boot time (which is much slower)
> > Changes in v2:
> > - use heredoc
> > - limit ping loop iterations
> > - use full "backend" / "frontend" in disk image names
> > - print domU consoles directly to /dev/console, to avoid systemd-added
> >   messages prefix
> > - terminate test on failure, don't wait for timeout
> > ---
> >  automation/build/debian/13-x86_64.dockerfile    |   2 +-
> >  automation/gitlab-ci/test.yaml                  |   8 +-
> >  automation/scripts/qemu-driverdomains-x86_64.sh | 138 ++++++++++++++++=
+-
> >  3 files changed, 148 insertions(+)
> >  create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh
> >=20
> > diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/=
build/debian/13-x86_64.dockerfile
> > index 2c6c9d4a5098..6382bafbd5bd 100644
> > --- a/automation/build/debian/13-x86_64.dockerfile
> > +++ b/automation/build/debian/13-x86_64.dockerfile
> > @@ -55,7 +55,9 @@ RUN <<EOF
> > =20
> >          # for test phase, qemu-* jobs
> >          busybox-static
> > +        e2fsprogs
> >          expect
> > +        fakeroot
> >          ovmf
> >          qemu-system-x86
> > =20
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index 7b36f1e126ca..abc5339a74ab 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -656,6 +656,14 @@ qemu-alpine-x86_64-gcc:
> >      - *x86-64-test-needs
> >      - alpine-3.22-gcc
> > =20
> > +qemu-alpine-driverdomains-x86_64-gcc:
> > +  extends: .qemu-x86-64
> > +  script:
> > +    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${L=
OGFILE}
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.22-gcc
> > +
> >  qemu-smoke-x86-64-gcc:
> >    extends: .qemu-smoke-x86-64
> >    script:
> > diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automati=
on/scripts/qemu-driverdomains-x86_64.sh
> > new file mode 100755
> > index 000000000000..c0241da54168
> > --- /dev/null
> > +++ b/automation/scripts/qemu-driverdomains-x86_64.sh
> > @@ -0,0 +1,138 @@
> > +#!/bin/bash
> > +
> > +set -ex -o pipefail
> > +
> > +dom0_rootfs_extra_comp=3D()
> > +dom0_rootfs_extra_uncomp=3D()
> > +
> > +cd binaries
> > +
> > +# DomU rootfs
> > +
> > +mkdir -p rootfs
> > +cd rootfs
> > +mkdir -p etc/local.d
> > +passed=3D"ping test passed"
> > +failed=3D"TEST FAILED"
> > +cat > etc/local.d/xen.start << EOF
> > +#!/bin/bash
> > +
> > +set -x
> > +
> > +if grep -q test=3Dbackend /proc/cmdline; then
> > +    brctl addbr xenbr0
> > +    ip link set xenbr0 up
> > +    ip addr add 192.168.0.1/24 dev xenbr0
> > +    bash /etc/init.d/xendriverdomain start
> > +    # log backend-related logs to the console
> > +    tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/de=
v/console 2>/dev/null &
> > +else
> > +    ip link set eth0 up
> > +    ip addr add 192.168.0.2/24 dev eth0
> > +    timeout=3D6 # 6*10s
> > +    until ping -c 10 192.168.0.1; do
> > +        sleep 1
> > +        if [ \$timeout -le 0 ]; then
> > +            echo "${failed}"
> > +            exit 1
> > +        fi
> > +        ((timeout--))
> > +    done
> > +    echo "${passed}"
> > +fi
> > +EOF
> > +chmod +x etc/local.d/xen.start
> > +fakeroot sh -c "
> > +    zcat ../rootfs.cpio.gz | cpio -imd
> > +    zcat ../xen-tools.cpio.gz | cpio -imd
> > +    ldconfig -r .
> > +    touch etc/.updated
> > +    mkfs.ext4 -d . ../domU-rootfs.img 1024M
>=20
> Do we really need 1GB? I would rather use a smaller size if possible.
> I would rather use as little resources as possible on the build server
> as we might run a few of these jobs in parallel one day soon.

This will be a sparse file, so it won't use really all the space. But
this size is the upper bound of what can be put inside.
That said, it's worth checking if sparse files do work properly on all
runners in /build. AFAIR some older docker versions had issues with that
(was it aufs not supporting sparse files?).

> Moreover this script will be run inside a container which means this
> data is probably in RAM.

Are runners configured to use tmpfs for /build? I don't think it's the
default.

> The underlying rootfs is 25M on both ARM and x86. This should be at most
> 50M.

Rootfs itself is small, but for driver domains it needs to include
toolstack too, and xen-tools.cpio is over 600MB (for debug build).
I might be able to pick just the parts needed for the driver domain (xl
with its deps, maybe some startup scripts, probably few more files), but
it's rather fragile.

> > +"
> > +cd ..
> > +rm -rf rootfs
> > +
> > +# Dom0 rootfs
> > +mkdir -p rootfs
> > +cd rootfs
> > +fakeroot -s ../fakeroot-save sh -c "
> > +    zcat ../rootfs.cpio.gz | cpio -imd
> > +    zcat ../xen-tools.cpio.gz | cpio -imd
> > +    ldconfig -r .
> > +    touch etc/.updated
> > +"
> > +mkdir -p root etc/local.d
> > +cat > root/backend.cfg << EOF
> > +name=3D"backend"
> > +memory=3D512
> > +vcpus=3D1
> > +kernel=3D"/root/bzImage"
> > +extra=3D"console=3Dhvc0 root=3D/dev/xvda net.ifnames=3D0 test=3Dbacken=
d"
> > +disk=3D[ '/root/domU-rootfs-backend.img,raw,xvda,rw' ]
> > +EOF
> > +cat > root/frontend.cfg << EOF
> > +name=3D"frontend"
> > +memory=3D512
> > +vcpus=3D1
> > +kernel=3D"/root/bzImage"
> > +extra=3D"console=3Dhvc0 root=3D/dev/xvda net.ifnames=3D0 test=3Dfronte=
nd"
> > +disk=3D[ '/root/domU-rootfs-frontend.img,raw,xvda,rw' ]
> > +vif=3D[ 'bridge=3Dxenbr0,backend=3Dbackend' ]
> > +EOF
> > +
> > +cat > etc/local.d/xen.start << EOF
> > +#!/bin/bash
> > +
> > +set -x
> > +
> > +bash /etc/init.d/xencommons start
> > +
> > +xl list
> > +
> > +tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e "s=
/^/(backend) /" >>/dev/console &
> > +tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e "=
s/^/(frontend) /" >>/dev/console &
> > +xl -vvv create /root/backend.cfg
> > +xl -vvv create /root/frontend.cfg
> > +EOF
> > +chmod +x etc/local.d/xen.start
> > +
> > +cp ../domU-rootfs.img ./root/domU-rootfs-backend.img
> > +cp ../domU-rootfs.img ./root/domU-rootfs-frontend.img
> > +cp ../bzImage ./root/
> > +mkdir -p etc/default
> > +echo 'XENCONSOLED_TRACE=3Dall' >> etc/default/xencommons
> > +mkdir -p var/log/xen/console
> > +fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M
>=20
> Same here. Also 2GB might not be sufficient to contain 2 copies of
> domU-rootfs.img, given that domU-rootfs.img is 1GB.

See the note about sparse files.

> If we bring down domU-rootfs.img to 50M, then this could be 150M.
>=20
>=20
> > +cd ..
> > +rm -rf rootfs
> > +
> > +cd ..
> > +
> > +cat >> binaries/pxelinux.0 << EOF
> > +#!ipxe
> > +
> > +kernel xen console=3Dcom1 console_timestamps=3Dboot
> > +module bzImage console=3Dhvc0 root=3D/dev/sda net.ifnames=3D0
> > +boot
> > +EOF
> > +
> > +# Run the test
> > +rm -f smoke.serial
> > +export TEST_CMD=3D"qemu-system-x86_64 \
> > +    -cpu qemu64,+svm \
> > +    -m 2G -smp 2 \
> > +    -monitor none -serial stdio \
> > +    -nographic \
> > +    -device virtio-net-pci,netdev=3Dn0 \
> > +    -netdev user,id=3Dn0,tftp=3Dbinaries,bootfile=3D/pxelinux.0 \
> > +    -drive file=3Dbinaries/dom0-rootfs.img,format=3Draw"
> > +
> > +export TEST_LOG=3D"smoke.serial"
> > +export BOOT_MSG=3D"Latest ChangeSet: "
> > +export LOG_MSG=3D"Domain-0"
> > +# exit early on test failure too, check if it was success below
> > +export PASSED=3D"$passed|$failed"
> > +
> > +./automation/scripts/console.exp | sed 's/\r\+$//'
> > +
> > +grep "$passed" smoke.serial
> > --=20
> > git-series 0.9.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RcdN1YP0Qc0lK4Ck
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk4zgYACgkQ24/THMrX
1yzH+wf/RcYM3ruMXW/OmAR8bHUp8A6IrnQs8PPevuqR1ZyQegRvMXvFlOESSBKu
CuD9DJynGf8cHNn+ECDta3buoLlKGnHSdusfiEwCnusa5/MNBIu5k391O75hZNnp
yBhSsb9iP92tzCmceR9E6P/X5Q2L8N78DRvpdbPgh8IaDu0VKX/4s7TPsToyBSle
uvGPUUressz38TKym1t700bVTEeLf+PXBjvWHye3Lmd9JM9Pcp1+eh4/geTljitn
R9LCNzVZ7YuWYBEEOYR+ZX2vYIU7Zqry6ou+CwWmR5V9utrnhtcp3RrCYoBT72Dg
p75t4wuCPDhy7i6CIdA+xg8QVSpL6w==
=4aw/
-----END PGP SIGNATURE-----

--RcdN1YP0Qc0lK4Ck--

