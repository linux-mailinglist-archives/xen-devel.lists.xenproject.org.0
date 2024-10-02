Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A7498D387
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 14:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808770.1220786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svyhZ-0000U5-Qy; Wed, 02 Oct 2024 12:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808770.1220786; Wed, 02 Oct 2024 12:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svyhZ-0000Rs-OK; Wed, 02 Oct 2024 12:43:33 +0000
Received: by outflank-mailman (input) for mailman id 808770;
 Wed, 02 Oct 2024 12:43:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lMz=Q6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1svyhY-0007os-Os
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 12:43:32 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed9a28da-80bb-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 14:43:31 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5E2DF114011C;
 Wed,  2 Oct 2024 08:43:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 02 Oct 2024 08:43:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 08:43:29 -0400 (EDT)
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
X-Inumbo-ID: ed9a28da-80bb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727873010;
	 x=1727959410; bh=7/0UCJCwm6rA/xWNes7/Pozgf1OPFzbyYIgmccNS0Po=; b=
	I7trwh/DcATFYaHTbFxvB+D96Rftfw0iREnhTIHVv/+dGSQVODnNYanzA6xOygB1
	KYYlRLhGVKeBK6HMzCiNQ17vJCr/734FRAeHG90+YvNI7ogPgYF52DWe5SksQsZe
	1ZOS3IbcqUxruCwOmWm5wgThLE0DS8jgl6HqTKpHolR2060lVKNJQoxzNQI8YO/t
	PtopcYBcw1NI4t2Ftx0qi95inyCeRwZpRgV52Gplx3EZtXx00zlKA94JeGqEd3Xj
	VPRtugbSdZBGcXR8+Z2sCuakGIGUVCyTgOhCo9BR/MsHuJYbLghp2R9pqrHJw67p
	EFQXAzaz7Oter+IRK+SqxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727873010; x=1727959410; bh=7/0UCJCwm6rA/xWNes7/Pozgf1OP
	FzbyYIgmccNS0Po=; b=asCV7gU4rnJexzSLVgFVszDPfc3r5QSHTsIQjGxHqis6
	YLeJpJcUckiKf2eCcycIXde0vRxbKfYU0ogf7c16hBocwGX2ZyLSidKgY1NXUsnB
	UzOkvSUDSb/aoZyh2ASzXkYJLR1I//2eAfWEU5eO/Gu69dOli5LBxwt3NqKvVxwR
	l24J9UitJp867LG3HLs0xglvjaI9w+Np9KwzGZmWU5uXnTWalVmeLVo2yE27khTZ
	p8X5AMX+k3HftYtZu+0ZY0FLSXf6GJX5cAywtRsh8rQxt5tTIOkYmD2m/Tt76VGm
	ZS2CCsbFjAyw/Qa2YJvPBb9YbhSBU2qtGvppu6a9WQ==
X-ME-Sender: <xms:8j_9ZjipaOhoTtqjoRh6peq2IC-MsZ3Q2FFrc8h7fz8EDM78FQ1Tig>
    <xme:8j_9ZgB5LtS3zsm5s9bLrYudazaeWYeTA_CI3Kv5BsjebN0SyKQm9aDtgQpCptffR
    sHJ_2ytarYGrg>
X-ME-Received: <xmr:8j_9ZjHd35vNUcgIqIKM1pHriALZmIxOv7M4INeUTgdu3wUrId6cItxRwvPdVpP_HnQqHNnUEbtJ8ySATtQbz6K_XMXoEFfpDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepuddtudeuffeggeejudeftedvueehudekueelleekgffgjeegveehhf
    evfeejheelnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpgigvnhdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthho
    peefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlih
    hsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegtrghrughovgestggr
    rhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:8j_9ZgSgGivOrdzYYnAtogLaM-OI1J66AZdBnbMjx1k-Yvk8T--C8Q>
    <xmx:8j_9Zgx-DX4_DYz69uGVhBrOYAlEMDdjOFe0ERlWCUbp1yQbgYaaWw>
    <xmx:8j_9Zm4P9OZfqq02dXj8OGpq-ei1WbJyQh97SYeU9muWaQWwjZdeHQ>
    <xmx:8j_9Zlz3zKtpIjy0kzkOvzehL_UDV8CwESHpGj59s1dQAFBvI4h23A>
    <xmx:8j_9Zr_AjQlQnh--11q7kIO0sYs9XZNWouPmSMqngvpxd3BDInsDebkF>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 2 Oct 2024 14:43:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: add a smoke test for xen.efi on X86
Message-ID: <Zv0_7636eK87pQqd@mail-itl>
References: <20241002124159.716270-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gydAsc5+2+Zddl6P"
Content-Disposition: inline
In-Reply-To: <20241002124159.716270-1-marmarek@invisiblethingslab.com>


--gydAsc5+2+Zddl6P
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Oct 2024 14:43:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: add a smoke test for xen.efi on X86

On Wed, Oct 02, 2024 at 02:41:55PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Check if xen.efi is bootable with an XTF dom0.
>=20
> The TEST_TIMEOUT is set in the script to override project-global value.
> Setting it in the gitlab yaml file doesn't work, as it's too low
> priority
> (https://docs.gitlab.com/ee/ci/variables/#cicd-variable-precedence).
>=20
> The multiboot2+EFI path is tested on hardware tests already.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Sorry, forgot a prerequisite patch - resent now as 2 patch series.

> ---
> This requires rebuilding debian:bookworm container.
>=20
> The TEST_TIMEOUT issue mentioned above applies to xilix-* jobs too. It's
> not clear to me why the default TEST_TIMEOUT is set at the group level
> instead of in the yaml file, so I'm not adjusting the other places.
> ---
>  automation/build/debian/bookworm.dockerfile |  1 +
>  automation/gitlab-ci/test.yaml              |  7 ++++
>  automation/scripts/qemu-smoke-x86-64-efi.sh | 44 +++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
>=20
> diff --git a/automation/build/debian/bookworm.dockerfile b/automation/bui=
ld/debian/bookworm.dockerfile
> index 3dd70cb6b2e3..061114ba522d 100644
> --- a/automation/build/debian/bookworm.dockerfile
> +++ b/automation/build/debian/bookworm.dockerfile
> @@ -46,6 +46,7 @@ RUN apt-get update && \
>          # for test phase, qemu-smoke-* jobs
>          qemu-system-x86 \
>          expect \
> +        ovmf \
>          # for test phase, qemu-alpine-* jobs
>          cpio \
>          busybox-static \
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 8675016b6a37..74fd3f3109ae 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -463,6 +463,13 @@ qemu-smoke-x86-64-clang-pvh:
>    needs:
>      - debian-bookworm-clang-debug
> =20
> +qemu-smoke-x86-64-gcc-efi:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGF=
ILE}
> +  needs:
> +    - debian-bookworm-gcc-debug
> +
>  qemu-smoke-riscv64-gcc:
>    extends: .qemu-riscv64
>    script:
> diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scr=
ipts/qemu-smoke-x86-64-efi.sh
> new file mode 100755
> index 000000000000..e053cfa995ba
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
> @@ -0,0 +1,44 @@
> +#!/bin/bash
> +
> +set -ex -o pipefail
> +
> +# variant should be either pv or pvh
> +variant=3D$1
> +
> +# Clone and build XTF
> +git clone https://xenbits.xen.org/git-http/xtf.git
> +cd xtf && make -j$(nproc) && cd -
> +
> +case $variant in
> +    pvh) k=3Dtest-hvm64-example    extra=3D"dom0-iommu=3Dnone dom0=3Dpvh=
" ;;
> +    *)   k=3Dtest-pv64-example     extra=3D ;;
> +esac
> +
> +mkdir -p boot-esp/EFI/BOOT
> +cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
> +cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
> +
> +cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
> +[global]
> +default=3Dtest
> +
> +[test]
> +options=3Dloglvl=3Dall console=3Dcom1 noreboot console_timestamps=3Dboot=
 $extra
> +kernel=3Dkernel
> +EOF
> +
> +cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
> +cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
> +
> +rm -f smoke.serial
> +export TEST_CMD=3D"qemu-system-x86_64 -nographic -M q35,kernel-irqchip=
=3Dsplit \
> +        -drive if=3Dpflash,format=3Draw,readonly=3Don,file=3DOVMF_CODE.f=
d \
> +        -drive if=3Dpflash,format=3Draw,file=3DOVMF_VARS.fd \
> +        -drive file=3Dfat:rw:boot-esp,media=3Ddisk,index=3D0,format=3Dra=
w \
> +        -m 512 -monitor none -serial stdio"
> +
> +export TEST_LOG=3D"smoke.serial"
> +export PASSED=3D"Test result: SUCCESS"
> +export TEST_TIMEOUT=3D120
> +
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> --=20
> 2.46.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gydAsc5+2+Zddl6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb9P+8ACgkQ24/THMrX
1ywMOAf/QfekrM0rpsAUDKZONFDBNhhI11Zs1LDCgAwOPCq2QdWU7Q5QPv6nawl2
NnIgdvfpq9fRV4ogCh/KpO6bpsij1Uxls+bi8grPi63X6Uv2fZ3+2PfYvZaYqSED
AdeqsS2owrCTbazSinimAMvVEn85ev6TrTtwk9TJMk2ADVkoFgCfyX0nE5uVaBzg
BiFTpNubhEGoKr4OGX+jsdOUP5zX7sbplGBy3F6R4ZJ6nKqIyTAnZB/62lZOhKT4
m3LedikJpSLQJCpj2Lz2XCVxNJyP9qIQ885mWu1NMrDxpb/NgFFZO/+D63DgDmHh
UW31TSQaL+ly+IzUN1nRE/a3KZ8ETw==
=hhu+
-----END PGP SIGNATURE-----

--gydAsc5+2+Zddl6P--

