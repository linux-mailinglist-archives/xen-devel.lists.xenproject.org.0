Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E17ABE514
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 22:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991123.1375028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTrR-0004tp-R8; Tue, 20 May 2025 20:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991123.1375028; Tue, 20 May 2025 20:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTrR-0004r4-NX; Tue, 20 May 2025 20:46:53 +0000
Received: by outflank-mailman (input) for mailman id 991123;
 Tue, 20 May 2025 20:46:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hinX=YE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uHTrP-0004qy-VN
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 20:46:52 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ca2a499-35bb-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 22:46:49 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B91D31140060;
 Tue, 20 May 2025 16:46:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 20 May 2025 16:46:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 16:46:46 -0400 (EDT)
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
X-Inumbo-ID: 8ca2a499-35bb-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747774007;
	 x=1747860407; bh=Wsl69X9Bv89yOHaTQc6LOxJYelF+125GBx7fr7AmOug=; b=
	RG3hJl2DVeYeZl7reIMsIrMmLwefrODfbk6Gm8hge3WBn2w2dtcr0U1f5zi39g6V
	TpYHxwU1g7y5wLILrt67HCRLCGHaW8G0Orha9CgQYe86dR/8gHT/eudmTWpLtTjf
	Z2H5GQGJ5HBY1Ulv5yXmuN8LeGMEoUcIVsKMdVhTOXH4YWDerS6MThY7M3mDtbCr
	NxjmuTAmeZgNIUIqhWzgP0m4KnaRc+Ai2DkfSd97WynqmcxGfMzPrbQ6zW7UuxRZ
	/tbjmYNKOlXpmjhmE0pHLt2xdTz/CL7uJp2uJBqHY7F2Ufcz0dWE6wcKa+ig0Zj8
	M0aiwXhQV58uZUj0Jx09zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747774007; x=1747860407; bh=Wsl69X9Bv89yOHaTQc6LOxJYelF+125GBx7
	fr7AmOug=; b=CJzDsugYCqcZNkxazNxpI4SZgs5h38oAGcmqpN6eWwFi3FcEsBN
	fLmWPTYeEbNW9QG6gHDy2/YTJoBPHSKr7Q6cCX4mhGV4/LAYAGLpmPyohD6Rtw7R
	ZR2AaNGGWQmaI2XGql8itgbJWUcMRdEa3zI7r9jSSJtiuqeyGzi47IsPmUnzpAZU
	AJOKHNVpa/Rq8wlHBLv81GJ0XVIxvZflOLlPTkkD+fwwLXvK8Nv+ozvpgH6snet1
	U4x8LtEqMIR64uSwjd698zSWhTAaWaAEI8WUAziHaNowOVA/Jj1dyDinLHOCoH+p
	MjbOk6LI1eFxbyl/KJfGzTtbUmPUCrpWypw==
X-ME-Sender: <xms:N-osaGdU0ggACLjuacjZ_FzAaE5sUd-Qg9jG4JEsB1Wji6CUV4Z3_g>
    <xme:N-osaAOWTCLi-3WJvh3wBjhlVmISl7EaYuEdrsuFdHhurekQM-qLquld7-2KOVQ2g
    tlaB4izvu-cDA>
X-ME-Received: <xmr:N-osaHjphkUnN4DcGA64OG9h712BCwDzMBcCLoZmSuPhNNVqo2h_UEvzg3PH6f9qB1ezLQI4bpQimbuSR2O9LJILo6j-N7voVh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdduucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhgg
    tggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskh
    hiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhje
    fhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprh
    gtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhr
    gh
X-ME-Proxy: <xmx:N-osaD-ktl_RZqv4a4FTmOMYLB3pBZbu9iozOSfXuvgLLHhkesYnrw>
    <xmx:N-osaCtNrCAcstv4nHenwEIdsnTgU6pYSVz6cdwv9llIzTkMgHu71w>
    <xmx:N-osaKEZPKX5JXGu_Ty7F9mVjJtcmRxa6UPHyDxMva9ZNaSpRB6PQg>
    <xmx:N-osaBMhpwoZ6t6fqun8UsJ29Mx_wyrqEQn2xmpTUJBOnG34DYIoBg>
    <xmx:N-osaHInpIx8iqomxoRub4m-I5Nfknu7W6RdSKi_TQASgSe8Xcppl-ms>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 20 May 2025 22:46:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] CI: Rename qubes-x86-64 parameter "" to "dom0pv"
Message-ID: <aCzqNLnqImHG0eMy@mail-itl>
References: <20250520173719.139233-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HtE9IzP5Iy9WnAye"
Content-Disposition: inline
In-Reply-To: <20250520173719.139233-1-andrew.cooper3@citrix.com>


--HtE9IzP5Iy9WnAye
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 May 2025 22:46:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] CI: Rename qubes-x86-64 parameter "" to "dom0pv"

On Tue, May 20, 2025 at 06:37:19PM +0100, Andrew Cooper wrote:
> This really is a legacy of not having parameters to start with.  Give PV =
dom0
> with a PVH domU a real name.
>=20
> Reformat the table to fix alignment.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ---
>  automation/gitlab-ci/test.yaml     |  8 ++++----
>  automation/scripts/qubes-x86-64.sh | 22 +++++++++++-----------
>  2 files changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index a603d4039aef..842cecf71382 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -257,7 +257,7 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
>  adl-smoke-x86-64-gcc-debug:
>    extends: .adl-x86-64
>    script:
> -    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
>    needs:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
> @@ -335,7 +335,7 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
>  kbl-smoke-x86-64-gcc-debug:
>    extends: .kbl-x86-64
>    script:
> -    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
>    needs:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
> @@ -413,7 +413,7 @@ kbl-tools-tests-pvh-x86-64-gcc-debug:
>  zen2-smoke-x86-64-gcc-debug:
>    extends: .zen2-x86-64
>    script:
> -    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
>    needs:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
> @@ -429,7 +429,7 @@ zen2-suspend-x86-64-gcc-debug:
>  zen3p-smoke-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> -    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
>    needs:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index bfdd2ceb99ba..aa47ba6bf5c0 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -2,16 +2,16 @@
> =20
>  set -ex -o pipefail
> =20
> -# One of:
> -#  - ""             PV dom0,  PVH domU
> -#  - dom0pvh        PVH dom0, PVH domU
> -#  - dom0pvh-hvm    PVH dom0, HVM domU
> -#  - pci-hvm        PV dom0,  HVM domU + PCI Passthrough
> -#  - pci-pv         PV dom0,  PV domU + PCI Passthrough
> -#  - pvshim         PV dom0,  PVSHIM domU
> -#  - s3             PV dom0,  S3 suspend/resume
> -#  - tools-tests-pv PV dom0, run tests from tools/tests/*
> -#  - tools-tests-pvh PVH dom0, run tests from tools/tests/*
> +# One of:              dom0:   Testing:
> +#  - dom0pv              PV      PVH domU
> +#  - dom0pvh             PVH     PVH domU
> +#  - dom0pvh-hvm         PVH     HVM domU
> +#  - pci-hvm             PV      HVM domU + PCI Passthrough
> +#  - pci-pv              PV      PV domU + PCI Passthrough
> +#  - pvshim              PV      PVSHIM domU
> +#  - s3                  PV      S3 suspend/resume
> +#  - tools-tests-pv      PV      Run tests from tools/tests/*
> +#  - tools-tests-pvh     PVH     Run tests from tools/tests/*
>  test_variant=3D$1
> =20
>  ### defaults
> @@ -25,7 +25,7 @@ retrieve_xml=3D
> =20
>  case "${test_variant}" in
>      ### test: smoke test & smoke test PVH & smoke test HVM & smoke test =
PVSHIM
> -    ""|"dom0pvh"|"dom0pvh-hvm"|"pvshim")
> +    "dom0pv"|"dom0pvh"|"dom0pvh-hvm"|"pvshim")
>          passed=3D"ping test passed"
>          domU_check=3D"
>  ifconfig eth0 192.168.0.2
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HtE9IzP5Iy9WnAye
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgs6jQACgkQ24/THMrX
1yxURgf7BmI13VWyvKkt2O/j4VFlieQrlzPG0XeG+DaNHrCDK7L3ElBLPhNSP7WK
niM/4AkYKioEQWAs6551n8WESkIXezYvt4pm2C/46tFBEvwJBXTG06W9+qdDSvur
duURHpIednShJCgDvCnE6W2rGNIGSeHedGvXvPcm5H1CKK4XWDLmKbYRN7+r4Yzx
GRTXBo0yUVOfaVNw7KGHASJHJ2ShP5UR+/siG0Xplh+Fj1W+bDV5lVWevV0sr/UQ
qTi7bzSraeP3+xtDw9gvNOxuClp3J0/ZI3Davd8Vx/3lxdjozJz6y11XgCNGkQd+
iOsUw4l8YIxj0kPgTam6NSQM26yp6g==
=V047
-----END PGP SIGNATURE-----

--HtE9IzP5Iy9WnAye--

