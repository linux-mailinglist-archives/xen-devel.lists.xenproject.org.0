Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B082CB4043
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 21:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183336.1506071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTRG2-0003Yf-IV; Wed, 10 Dec 2025 20:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183336.1506071; Wed, 10 Dec 2025 20:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTRG2-0003WC-Fi; Wed, 10 Dec 2025 20:57:58 +0000
Received: by outflank-mailman (input) for mailman id 1183336;
 Wed, 10 Dec 2025 20:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTTf=6Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vTRG1-0003W6-2B
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 20:57:57 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e52c09a6-d60a-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 21:57:54 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id B07D0EC04B8;
 Wed, 10 Dec 2025 15:57:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Wed, 10 Dec 2025 15:57:52 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Dec 2025 15:57:51 -0500 (EST)
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
X-Inumbo-ID: e52c09a6-d60a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765400272;
	 x=1765486672; bh=14/kWMkIUVhB0X0jzvXh5YDdzZKS/Fx19hNDc2RZ6+k=; b=
	Pfeqw+r9ccTUJ9hoedInbLCUXG2/wP06haiam+WOSvWHYwwvDuXLSRKQbLCfnD/U
	USnkMMi4zZbnLeT4FPOtUqNleHJWi3Q5q2f8Ajf/5sD9vKPFaM4Mo/FxLTh/GjXj
	fwqbEwsWiQDXx73OdcwuZ/fvEEesbYZJIodeCdSXbwEXRCakVvdG1zF4ih4UAHMp
	zN02l1rk3TUW+oCKLe6/HWXrUB9td3iPa5TSsDbwnD94/hv0Wo9KtjrInGfXHNSJ
	q0kLWwcARW1TjIcyJteF42+HFdkX1XHH4JjyhjycuPlY6pnz5GHYc5p6HFWT9dxc
	KGTbBpfuPhjO1+wi+JCcbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765400272; x=1765486672; bh=14/kWMkIUVhB0X0jzvXh5YDdzZKS/Fx19hN
	Dc2RZ6+k=; b=PUx98JFaeKKRoIhD8ddG0o1WZk+ehUzzDEqGlI3DZ/iY+JDGvaF
	Fo+cXGP0ZmyQVsAvEsg9GzzsQhcpWXQsIWzAR7vZhl3mr2vSpnJ9AoIqhpvEor43
	AtsP1kZwYOUFp/PumgnYZQpRtXCl9MtJZ+Rux7y2ekOES7VJJxKBw58GRzuhIqIW
	r3MmBDWv9UVnGxl5/BQvX0qmGnYgNa5NLaMUjUO92c7WZabWflJ66LSAB7wh+9YP
	NcDuMlB5DBiwQ40RnA178rwPbXkFCy7cJru7f0yCshUFkvPaTK58oRjFK3EHloqB
	PxwpZSmKmzybgZ4uOfyGnq/YO3KPStNLaug==
X-ME-Sender: <xms:0N45aax2OPnqRp7ofBRW1d01PEiB_jntujvkI4s_6dB8MvkcAyKSew>
    <xme:0N45adTPZ8kbR99oQTqDPwAkj6D6d3lO6tOVCREsEaSUbG64Sc6gu2wcIxxh8Zfiy
    _OQIbC-URTMmbLrxUnRc6nl2-OXynukVtgPGoVXcxRCdcyAEA>
X-ME-Received: <xmr:0N45aRUDRuNAQZSI9v5qiL6azZhyJsRwAKnrN7gBXuYGG6ZefqF7HqfM52TcFBJmSrQoXjBPpEhNE3gmUpBwQqYapMVNsCXwSYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeeggecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:0N45afY7EJI9a4U6gP_qrlS_LjZE29iwTdrwmaW0ZOOmOXkaKa36ig>
    <xmx:0N45aX3B0Q6q1HPv-TpQ1No8GGBtIW_t5dhp-CVAOe_9KMibtQPChQ>
    <xmx:0N45aRj-99agYpjAow3GJda0Yjl7zU-IllskNACUGbyVyUU1o3JT4A>
    <xmx:0N45abbT6-u8vNc_zO5bQPe6RyDd2dMM_Vbkvtu224d50ld_gA9DfA>
    <xmx:0N45aY31LtbtpXuFdmDKeFY9o9Y27at0Pzb4WnH9mT_nERl5m0mVmFUy>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 10 Dec 2025 21:57:48 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests
Message-ID: <aTnezVY1NoE-vZRF@mail-itl>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
 <cf2a2544fe27fedca5129b61912c064f4be08236.1764989098.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2512091534060.19429@ubuntu-linux-20-04-desktop>
 <aTjOBpuKMSO4LzzN@mail-itl>
 <alpine.DEB.2.22.394.2512101219460.19429@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QWoZckLLoHKI7985"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2512101219460.19429@ubuntu-linux-20-04-desktop>


--QWoZckLLoHKI7985
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Dec 2025 21:57:48 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests

On Wed, Dec 10, 2025 at 12:28:19PM -0800, Stefano Stabellini wrote:
> On Wed, 10 Dec 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Dec 09, 2025 at 04:02:06PM -0800, Stefano Stabellini wrote:
> > > On Sat, 6 Dec 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Setup a simple two domU system. One with network backend, running
> > > > xendriverdomain service, and one with frontend, trying to ping the
> > > > backend.
> > > >=20
> > > > Contrary to other similar tests, use disk image instead of initrd, =
to
> > > > allow bigger rootfs without adding more RAM (for both dom0 and domU=
).
> > > > But keep using pxelinux as a bootloader as it's easier to setup than
> > > > installing grub on the disk. Theoretically, it could be started via=
 direct
> > > > kernel boot in QEMU, but pxelinux is slightly closer to real-world
> > > > deployment.
> > > >=20
> > > > Use fakeroot to preserve file owners/permissions. This is especially
> > > > important for suid binaries like /bin/mount - without fakeroot, they
> > > > will end up as suid into non-root user.
> > > >=20
> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > > > ---
> > > > Changes in v3:
> > > > - add fakeroot
> > > > - run ldconfig at the disk image creation time, to avoid running it=
 at
> > > >   dom0/domU boot time (which is much slower)
> > > > Changes in v2:
> > > > - use heredoc
> > > > - limit ping loop iterations
> > > > - use full "backend" / "frontend" in disk image names
> > > > - print domU consoles directly to /dev/console, to avoid systemd-ad=
ded
> > > >   messages prefix
> > > > - terminate test on failure, don't wait for timeout
> > > > ---
> > > >  automation/build/debian/13-x86_64.dockerfile    |   2 +-
> > > >  automation/gitlab-ci/test.yaml                  |   8 +-
> > > >  automation/scripts/qemu-driverdomains-x86_64.sh | 138 ++++++++++++=
+++++-
> > > >  3 files changed, 148 insertions(+)
> > > >  create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh
> > > >=20
> > > > diff --git a/automation/build/debian/13-x86_64.dockerfile b/automat=
ion/build/debian/13-x86_64.dockerfile
> > > > index 2c6c9d4a5098..6382bafbd5bd 100644
> > > > --- a/automation/build/debian/13-x86_64.dockerfile
> > > > +++ b/automation/build/debian/13-x86_64.dockerfile
> > > > @@ -55,7 +55,9 @@ RUN <<EOF
> > > > =20
> > > >          # for test phase, qemu-* jobs
> > > >          busybox-static
> > > > +        e2fsprogs
> > > >          expect
> > > > +        fakeroot
> > > >          ovmf
> > > >          qemu-system-x86
> > > > =20
> > > > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/=
test.yaml
> > > > index 7b36f1e126ca..abc5339a74ab 100644
> > > > --- a/automation/gitlab-ci/test.yaml
> > > > +++ b/automation/gitlab-ci/test.yaml
> > > > @@ -656,6 +656,14 @@ qemu-alpine-x86_64-gcc:
> > > >      - *x86-64-test-needs
> > > >      - alpine-3.22-gcc
> > > > =20
> > > > +qemu-alpine-driverdomains-x86_64-gcc:
> > > > +  extends: .qemu-x86-64
> > > > +  script:
> > > > +    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee=
 ${LOGFILE}
> > > > +  needs:
> > > > +    - *x86-64-test-needs
> > > > +    - alpine-3.22-gcc
> > > > +
> > > >  qemu-smoke-x86-64-gcc:
> > > >    extends: .qemu-smoke-x86-64
> > > >    script:
> > > > diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/auto=
mation/scripts/qemu-driverdomains-x86_64.sh
> > > > new file mode 100755
> > > > index 000000000000..c0241da54168
> > > > --- /dev/null
> > > > +++ b/automation/scripts/qemu-driverdomains-x86_64.sh
> > > > @@ -0,0 +1,138 @@
> > > > +#!/bin/bash
> > > > +
> > > > +set -ex -o pipefail
> > > > +
> > > > +dom0_rootfs_extra_comp=3D()
> > > > +dom0_rootfs_extra_uncomp=3D()
> > > > +
> > > > +cd binaries
> > > > +
> > > > +# DomU rootfs
> > > > +
> > > > +mkdir -p rootfs
> > > > +cd rootfs
> > > > +mkdir -p etc/local.d
> > > > +passed=3D"ping test passed"
> > > > +failed=3D"TEST FAILED"
> > > > +cat > etc/local.d/xen.start << EOF
> > > > +#!/bin/bash
> > > > +
> > > > +set -x
> > > > +
> > > > +if grep -q test=3Dbackend /proc/cmdline; then
> > > > +    brctl addbr xenbr0
> > > > +    ip link set xenbr0 up
> > > > +    ip addr add 192.168.0.1/24 dev xenbr0
> > > > +    bash /etc/init.d/xendriverdomain start
> > > > +    # log backend-related logs to the console
> > > > +    tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >=
>/dev/console 2>/dev/null &
> > > > +else
> > > > +    ip link set eth0 up
> > > > +    ip addr add 192.168.0.2/24 dev eth0
> > > > +    timeout=3D6 # 6*10s
> > > > +    until ping -c 10 192.168.0.1; do
> > > > +        sleep 1
> > > > +        if [ \$timeout -le 0 ]; then
> > > > +            echo "${failed}"
> > > > +            exit 1
> > > > +        fi
> > > > +        ((timeout--))
> > > > +    done
> > > > +    echo "${passed}"
> > > > +fi
> > > > +EOF
> > > > +chmod +x etc/local.d/xen.start
> > > > +fakeroot sh -c "
> > > > +    zcat ../rootfs.cpio.gz | cpio -imd
> > > > +    zcat ../xen-tools.cpio.gz | cpio -imd
> > > > +    ldconfig -r .
> > > > +    touch etc/.updated
> > > > +    mkfs.ext4 -d . ../domU-rootfs.img 1024M
> > >=20
> > > Do we really need 1GB? I would rather use a smaller size if possible.
> > > I would rather use as little resources as possible on the build server
> > > as we might run a few of these jobs in parallel one day soon.
> >=20
> > This will be a sparse file, so it won't use really all the space. But
> > this size is the upper bound of what can be put inside.
> > That said, it's worth checking if sparse files do work properly on all
> > runners in /build. AFAIR some older docker versions had issues with that
> > (was it aufs not supporting sparse files?).
>=20
> I ran the same command on my local baremetal Ubuntu dev environment
> (arm64) and it created a new file of the size passed on the command
> line (1GB in this case). It looks like they are not sparse on my end. If
> the result depends on versions and configurations, I would rather err on
> the side of caution and use the smallest possible number that works.

Hm, interesting. What filesystem is that on?

On my side it's definitely sparse (ext4):

    [user@disp8129 Downloads]$ du -sch
    12K	.
    12K	total
    [user@disp8129 Downloads]$ mkfs.ext4 -d . ../domU-rootfs.img 1024M
    mke2fs 1.47.2 (1-Jan-2025)
    Creating regular file ../domU-rootfs.img
    Creating filesystem with 262144 4k blocks and 65536 inodes
    Filesystem UUID: f50a5dfe-4dcf-4f3e-82d0-3dc54a788ab0
    Superblock backups stored on blocks:=20
        32768, 98304, 163840, 229376

    Allocating group tables: done                           =20
    Writing inode tables: done                           =20
    Creating journal (8192 blocks): done
    Copying files into the device: done
    Writing superblocks and filesystem accounting information: done

    [user@disp8129 Downloads]$ ls -lhs ../domU-rootfs.img=20
    33M -rw-r--r--. 1 user user 1.0G Dec 10 21:45 ../domU-rootfs.img

> > > Moreover this script will be run inside a container which means this
> > > data is probably in RAM.
> >=20
> > Are runners configured to use tmpfs for /build? I don't think it's the
> > default.
>=20
> I don't know for sure, they are just using the default. My goal was to
> make our solution more reliable as defaults and configurations might
> change.
>=20
>=20
> > > The underlying rootfs is 25M on both ARM and x86. This should be at m=
ost
> > > 50M.
> >=20
> > Rootfs itself is small, but for driver domains it needs to include
> > toolstack too, and xen-tools.cpio is over 600MB (for debug build).
> > I might be able to pick just the parts needed for the driver domain (xl
> > with its deps, maybe some startup scripts, probably few more files), but
> > it's rather fragile.
>=20
> My first thought is to avoid creating a 1GB file in all cases when it
> might only be needed for certain individual tests. Now, I realize that
> this script might end up only used in driver domains tests but if not,=20

Indeed this script is specifically about driverdomains test.

> I
> would say to use the smallest number depending on the tests, especially
> as there seems to be use a huge difference, e.g. 25MB versus 600MB.
>=20
> My second thought is that 600MB for just the Xen tools is way too large.
> I have alpine linux rootfs'es with just the Xen tools installed that are
> below 50MB total. I am confused on how we get to 600MB. It might be due
> to QEMU and its dependencies but still going from 25MB to 600MB is
> incredible!

Indeed it's mostly about QEMU (its main binary itself takes 55MB),
including all bundled firmwares etc (various flavors of edk2 alone take
270MB). There is also usr/lib/debug which takes 85MB.
But then, usr/lib/libxen* combined takes almost 50MB.

OTOH, non-debug xen-tools.cpio takes "just" 130MB.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QWoZckLLoHKI7985
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk53s0ACgkQ24/THMrX
1ywtywf8Cs7vQtVL6mhgo2MRT7u7AYIoE2or0T4OyHnjoLQExcLbDYF6LUAksqB6
3g7Xdu5uyRbWn0RQxRnTcUuQsGwzybCN5v2uKjJPdxdanLCOyHCGz050fJEYvvQA
pEVVMXriZFjEIlvjvm4K9wvTVVHrnySssev+CGMnJFZW1NJ4tsYIEvp6nAYgxUpo
Aqah8YNZwjPgMkjzZ7PXycUtTZOXqnjW/+pn6hyhVIWUjEbjDq4YuXqhdGbo6Xpd
a6ppE6jd8PRlhlvcr0bxLankZiNy7lPRgk4yAWLxdzQkrgggPrEZBMZ65G0zwm9d
G/amoMaGmVlBun6N6MTBUExVjY3c2A==
=XRld
-----END PGP SIGNATURE-----

--QWoZckLLoHKI7985--

