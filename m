Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9AE98E67E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 00:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809087.1221239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8G9-0002k3-1g; Wed, 02 Oct 2024 22:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809087.1221239; Wed, 02 Oct 2024 22:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8G8-0002hm-Tq; Wed, 02 Oct 2024 22:55:52 +0000
Received: by outflank-mailman (input) for mailman id 809087;
 Wed, 02 Oct 2024 22:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lMz=Q6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sw8G8-0002hg-0T
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 22:55:52 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76f1b1db-8111-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 00:55:49 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 9590413805F2;
 Wed,  2 Oct 2024 18:55:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 02 Oct 2024 18:55:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 18:55:46 -0400 (EDT)
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
X-Inumbo-ID: 76f1b1db-8111-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727909747;
	 x=1727996147; bh=BG6tgjBGck/KEqonHzE2D5DHtxMihfwXRm1A0A7uRVI=; b=
	Q4ncyDu4o2HZqx+YhAIBlIXAWRkdWWBAlja7AvNjQDcvW7wEzwHvvMY7p75WNflW
	UHRRa04SnyUF7oTwbFFozSHdj5WI0dXre25sx0EGI4CcsT+x/qQeChS9KQZAl4yi
	+DDkI271QoFnK0IBZ4tsettWtcRH952d/CrJl+9elxtuR8Ua5gb+g1wZrteqRYPE
	CviFymMs2MCewRqPHlirtre2L8piQdnBYvyS3Xb8pYvVtG9KXFI7UZEsj8cA1jzO
	gvLRFY7Vk5FEzp5GVBE8elK9O7nqii/2Pp4N7W04Y401SlxdXrpjuPuZxyDIm2rW
	Yks89PQOpSUxRQvRZ1GNRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727909747; x=1727996147; bh=BG6tgjBGck/KEqonHzE2D5DHtxMi
	hfwXRm1A0A7uRVI=; b=A0q3idATqLXOBOVfeCaLkaaFiE6b9A8se5sR8WRY5qkb
	qOa2YYeqewt+zEQPiHoiuxvBt2PzrAYg5mXedDfIeQW2ZWr3OmYNeVuMUzfNiE66
	ZG8lzsqNgmYnRS+/L1FWHKQNYv0OKxx7ijW8M4tFTztWdGW/T9ZEborK65ZnGMUj
	ctJC/33ruZshggWHG76P4PJMLODn266KbCEeSfr5TyjaaAtFWYgh0PQFIbPHctym
	n+JwoZcClhAGazNo+Wr+bSvTmlnK4ELeplcF8usHvDihHy0cryx2S1Mczg8NReHy
	hSoHB+GaaDFa1+f47mt2wUl2hVgcruV6KcZ10VdEOA==
X-ME-Sender: <xms:c8_9ZpQCLNF_KHyenAddyDuOAVEaK4ettrr4wvCbU1SdPOu40sg5gA>
    <xme:c8_9ZiwtdJpNJCT43CrObR6p7b1isdhwRU5MXjmVauqXbyFM9hiTMqeCrAQYSO2KW
    Udf1x2eSwjcig>
X-ME-Received: <xmr:c8_9Zu0b_eeWVs03F9QWZVmaShEvxMA0K7ZUTsJ2eLgSL39j8nzunrvW8SgJGerAMjHZsccGajnmKDYvRPdpKWjq2ZF2UU48VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvtddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepuddtudeuffeggeejudeftedvueehudekueelleekgffgjeegveehhf
    evfeejheelnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpgigvnhdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthho
    peefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhise
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegtrghrughovgestggrrhguohgvrd
    gtohhm
X-ME-Proxy: <xmx:c8_9ZhA-O7cXyiEMzycN-P8xul6IPOTJMSKjidmSP-LZ-PDpLzlaEg>
    <xmx:c8_9ZiiR_5CJ_AK3u-iIxlHwlCWKlyRN6bEsxbhoFDZdgdpObIsflw>
    <xmx:c8_9ZlpaAVt05R1X3t6tUcILpyYRsZpG1HN_QjH0MB8FGuw06Te1ZA>
    <xmx:c8_9ZtjlVcBcOPbJmWyqWK_XqsmdnbeiV-PT64JQuZcCGSNSAvILTg>
    <xmx:c8_9ZlubrPtoQliJPSbx7r-wZB09kXgBNicS0kiPxO03GsXZfKciV_kj>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Oct 2024 00:55:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
Message-ID: <Zv3Pbx1gkeypGQem@mail-itl>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
 <20241002124245.716302-2-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OwC4est8ADlO57mr"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>


--OwC4est8ADlO57mr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Oct 2024 00:55:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86

On Wed, Oct 02, 2024 at 03:22:59PM -0700, Stefano Stabellini wrote:
> I forgot to reply to one important part below
>=20
>=20
> On Wed, 2 Oct 2024, Stefano Stabellini wrote:
> > On Wed, 2 Oct 2024, Marek Marczykowski-G=C3=B3recki wrote:
> > > Check if xen.efi is bootable with an XTF dom0.
> > >=20
> > > The TEST_TIMEOUT is set in the script to override project-global valu=
e.
> > > Setting it in the gitlab yaml file doesn't work, as it's too low
> > > priority
> > > (https://docs.gitlab.com/ee/ci/variables/#cicd-variable-precedence).
> > >=20
> > > The multiboot2+EFI path is tested on hardware tests already.
> > >=20
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > ---
> > > This requires rebuilding debian:bookworm container.
> > >=20
> > > The TEST_TIMEOUT issue mentioned above applies to xilix-* jobs too. I=
t's
> > > not clear to me why the default TEST_TIMEOUT is set at the group level
> > > instead of in the yaml file, so I'm not adjusting the other places.
> >=20
> > Let me premise that now that we use "expect" all successful tests will
> > terminate as soon as the success condition is met, without waiting for
> > the test timeout to expire.
> >=20
> > There is a CI/CD variable called TEST_TIMEOUT set at the
> > gitlab.com/xen-project level. (There is also a check in console.exp in
> > case TEST_TIMEOUT is not set so that we don't run into problems in case
> > the CI/CD variable is removed accidentally.) The global TEST_TIMEOUT is
> > meant to be a high value to account for slow QEMU tests running
> > potentially on our slowest cloud runners.
> >=20
> > However, for hardware-based tests such as the xilinx-* jobs, we know
> > that the timeout is supposed to be less than that. The test is running
> > on real hardware which is considerably faster than QEMU running on our
> > slowest runners. Basically, the timeout depends on the runner more than
> > the test. So we override the TEST_TIMEOUT variable for the xilinx-* jobs
> > providing a lower timeout value.
> >=20
> > The global TEST_TIMEOUT is set to 1500.
> > The xilinx-* timeout is set to 120 for ARM and 1000 for x86.
> >=20
> > You are welcome to override the TEST_TIMEOUT value for the
> > hardware-based QubesOS tests. At the same time, given that on success
> > the timeout is not really used, it is also OK to leave it like this.
> =20
> =20
> > > ---
> > >  automation/build/debian/bookworm.dockerfile |  1 +
> > >  automation/gitlab-ci/test.yaml              |  7 ++++
> > >  automation/scripts/qemu-smoke-x86-64-efi.sh | 44 +++++++++++++++++++=
++
> > >  3 files changed, 52 insertions(+)
> > >  create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
> > >=20
> > > diff --git a/automation/build/debian/bookworm.dockerfile b/automation=
/build/debian/bookworm.dockerfile
> > > index 3dd70cb6b2e3..061114ba522d 100644
> > > --- a/automation/build/debian/bookworm.dockerfile
> > > +++ b/automation/build/debian/bookworm.dockerfile
> > > @@ -46,6 +46,7 @@ RUN apt-get update && \
> > >          # for test phase, qemu-smoke-* jobs
> > >          qemu-system-x86 \
> > >          expect \
> > > +        ovmf \
> > >          # for test phase, qemu-alpine-* jobs
> > >          cpio \
> > >          busybox-static \
> > > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/te=
st.yaml
> > > index 8675016b6a37..74fd3f3109ae 100644
> > > --- a/automation/gitlab-ci/test.yaml
> > > +++ b/automation/gitlab-ci/test.yaml
> > > @@ -463,6 +463,13 @@ qemu-smoke-x86-64-clang-pvh:
> > >    needs:
> > >      - debian-bookworm-clang-debug
> > > =20
> > > +qemu-smoke-x86-64-gcc-efi:
> > > +  extends: .qemu-x86-64
> > > +  script:
> > > +    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${=
LOGFILE}
> > > +  needs:
> > > +    - debian-bookworm-gcc-debug
> >=20
> > Given that the script you wrote (thank you!) can also handle pvh, can we
> > directly add a pvh job to test.yaml too?

I guess we can, but is xen.efi + PVH dom0 actually different enough to
worth testing given we already test MB2+EFI + PVH dom0?

> > >  qemu-smoke-riscv64-gcc:
> > >    extends: .qemu-riscv64
> > >    script:
> > > diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation=
/scripts/qemu-smoke-x86-64-efi.sh
> > > new file mode 100755
> > > index 000000000000..e053cfa995ba
> > > --- /dev/null
> > > +++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
> > > @@ -0,0 +1,44 @@
> > > +#!/bin/bash
> > > +
> > > +set -ex -o pipefail
> > > +
> > > +# variant should be either pv or pvh
> > > +variant=3D$1
> > > +
> > > +# Clone and build XTF
> > > +git clone https://xenbits.xen.org/git-http/xtf.git
> > > +cd xtf && make -j$(nproc) && cd -
> > > +
> > > +case $variant in
> > > +    pvh) k=3Dtest-hvm64-example    extra=3D"dom0-iommu=3Dnone dom0=
=3Dpvh" ;;
> > > +    *)   k=3Dtest-pv64-example     extra=3D ;;
> > > +esac
> > > +
> > > +mkdir -p boot-esp/EFI/BOOT
> > > +cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
> > > +cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
> > > +
> > > +cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
> > > +[global]
> > > +default=3Dtest
> > > +
> > > +[test]
> > > +options=3Dloglvl=3Dall console=3Dcom1 noreboot console_timestamps=3D=
boot $extra
> > > +kernel=3Dkernel
> > > +EOF
> > > +
> > > +cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
> > > +cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
> > > +
> > > +rm -f smoke.serial
> > > +export TEST_CMD=3D"qemu-system-x86_64 -nographic -M q35,kernel-irqch=
ip=3Dsplit \
> > > +        -drive if=3Dpflash,format=3Draw,readonly=3Don,file=3DOVMF_CO=
DE.fd \
> > > +        -drive if=3Dpflash,format=3Draw,file=3DOVMF_VARS.fd \
> > > +        -drive file=3Dfat:rw:boot-esp,media=3Ddisk,index=3D0,format=
=3Draw \
> > > +        -m 512 -monitor none -serial stdio"
> > > +
> > > +export TEST_LOG=3D"smoke.serial"
> > > +export PASSED=3D"Test result: SUCCESS"
> > > +export TEST_TIMEOUT=3D120
>=20
> Although this works, I would prefer keeping the TEST_TIMEOUT overrides
> in test.yaml for consistency.=20

The problem is this doesn't work. The group-level variable overrides the
one in yaml. See the commit message and the link there...

> However, it might be better not to
> override it (or to override to a higher timeout value), as successful
> tests will terminate immediately anyway. We need to be cautious about
> setting TEST_TIMEOUT values too low, as using a slow runner (like a
> small, busy cloud instance) can lead to false positive failures. This
> issue occurred frequently with ARM tests when we temporarily moved from
> a fast ARM server to slower ARM cloud instances a couple of months ago.
>=20
> On the other hand, adjusting TEST_TIMEOUT for non-QEMU hardware-based
> tests is acceptable since those tests rely on real hardware
> availability, which is unlikely to become suddenly slower.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--OwC4est8ADlO57mr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb9z28ACgkQ24/THMrX
1yyGqAgAggmCunGY7f6KJUKq5qeGdQ6eHUPXH4VGuI6LYP1X2V/h3+ynop4qCsoH
77qFAlA0BJ/yx83iLfit24t2Sv3ReZdUR2Rczi+XDdZV9UQixdblAWW895T4K3DN
p1rTxMSSEWdR3amzhEEh3ImO6ZPIAzKiug/lA6jLeMaXogl/sbEGj07QGlcCC0tA
fPyhpZn6x7buYmnnkj7opG+T/XrLedYTemG5yeX2/b3+kbHmnT812s6/JLzNABKM
0zXEBFKtT/TGpARA7O1idECVMNWtnvawNR1YPySVyEpvk0gsNqTipxU7f7N+BJ9D
6boil4s95sAW0optHwXyTRd2J/RnXg==
=eeg/
-----END PGP SIGNATURE-----

--OwC4est8ADlO57mr--

