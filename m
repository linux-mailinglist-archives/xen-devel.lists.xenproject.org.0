Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD9A766AF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932486.1334594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzF0j-0002rO-6c; Mon, 31 Mar 2025 13:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932486.1334594; Mon, 31 Mar 2025 13:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzF0j-0002oj-44; Mon, 31 Mar 2025 13:17:05 +0000
Received: by outflank-mailman (input) for mailman id 932486;
 Mon, 31 Mar 2025 13:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpMN=WS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tzF0h-0002od-Sm
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:17:03 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd74ebc-0e32-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 15:17:01 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id CA80C11401F6;
 Mon, 31 Mar 2025 09:16:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 31 Mar 2025 09:16:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 09:16:58 -0400 (EDT)
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
X-Inumbo-ID: 6dd74ebc-0e32-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743427019;
	 x=1743513419; bh=f6QxzgWXGE671kPVnbp17JXWWheRBfFRLJSxZo/G/jc=; b=
	Nk1gc5uvV7zH3eUex/tGnMLVL3x1BX//vbuRG8IKxabWQr6fCym50f8u9tN+YWYS
	uI67bgTyx+CheoUtLNyPJ+gG12ckSQAnFqqrQCdqh3X13fL+G8Sixz4SzJrhzPkf
	b9afbrNZDPvuNWzhI9r5Ra4KGSiF0e57loHx8b3M2ZNa7YaLQah1oTb3LrgNmsuM
	8oXh+efSCU3VmbZ6Em46NeXctk+EaEANUBwoKBmQetoK/rHMI1hulUYUFOHF3Uhs
	FIBDS9oC7Qm2swQAV4QVIkgcILGryfk7igCn0KzNY8cS7ti5brJqJpcY6qB74MDU
	DYJyiB0Lwq6bu8Sh9szCcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743427019; x=1743513419; bh=f6QxzgWXGE671kPVnbp17JXWWheRBfFRLJS
	xZo/G/jc=; b=vTbJGNBwYEtAmvX1quS4UfS7zS5FHtUbG8yH2nPfVezJsZFASbo
	LJZ+OGwE8tv99ndquxzADC6osdjRGfFGyClTUw1NbV206wggh9fYc4UjsgZcV4gG
	UiH78opKJnFO98Tg/TeK8y2X1Y2MNC9DYyPtDxdywXjMAxGXxyOyxMZdesGQok0Y
	W5UxoBeF8whpv7poor5NvdCN/cHtavO1MNdVyS7Fe47YXIxz4ngMQUd+PNvHmGh6
	JRGBbTRWG57GP9QAC42C7y14VYoYpY0s8TDa9pNnJf32cZKNbxvgM89OLeoSjrFa
	3JF7lwVWOkwcpkmV/Jy+vxgV0ppuLs7Jp4Q==
X-ME-Sender: <xms:y5XqZ66qjUZqCm_O5oMXJI2xzJ5xX-MPoeueTazCxkgpMV1wwL9fjA>
    <xme:y5XqZz4cCNby5yl3HpljLxLIttpA-IZdHINKylF89lzfn9VEcZz06Oh79nq9l4vST
    7YRPA7NpFVLHg>
X-ME-Received: <xmr:y5XqZ5cSXC_Jm_IKgthORXhdnxCoO-e_itcFLfyVL5gpdZBaz1TyoVX8r00I6KEgdWDhkk8oeVF2R8V2iLqmKEMWy7C9wv9DAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedttdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:y5XqZ3IA_zyrAMwiQX2faArucViRXnnZYFQBa08E8OAcUPlLDZ1aoQ>
    <xmx:y5XqZ-JgVZS_F5ZkaxCx2_2ovoFCAcoLKNM78PPnCNn8ITljFtL26A>
    <xmx:y5XqZ4zoo6rfBrSMYIlzliFtK_kl_lJeaX8ZCFE756fcbLQ9IHAWRw>
    <xmx:y5XqZyJdZSYqu_gw2iYswEf2gXjjP4szkjIfQQYRs_uGRiFYuQjmgQ>
    <xmx:y5XqZ28Xk0fg0Qlark_TwXWZvoOnQx8wJ_TO4vgfNDPk-r4al6DAoM_Q>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 31 Mar 2025 15:16:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] ci: add yet another HW runner
Message-ID: <Z-qVyLPnEllLKR7B@mail-itl>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F2T20v1MgA2kN2/h"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>


--F2T20v1MgA2kN2/h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Mar 2025 15:16:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] ci: add yet another HW runner

On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> On Fri, 14 Mar 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> >=20
> > This one has working S3, so add a test for it here.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >=20
> > The suspend test added here currently fails on staging[1], but passes on
> > staging-4.19[2]. So the regression wants fixing before committing this
> > patch.
>=20
> We could commit the patch now without the s3 test.
>=20
> I don't know what the x86 maintainers think about fixing the suspend
> bug, but one idea would be to run a bisection between 4.20 and 4.19.

This passes on staging now:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1744682789

So, the patch is good to commit as is.

> > For this to work, the runner needs to be added to relevant repositories
> > (especially hardware/xen one). Somebody with appropriate access need to
> > go to Settings->CI/CD->Runners and click "enable for this project" on
> > hal9001 runner.
>=20
> I did that now
>=20
>=20
> > [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
> > [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
> > ---
> >  automation/gitlab-ci/test.yaml | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >=20
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index 9530e36e9aaa..6b8e1b830e3d 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -155,6 +155,16 @@
> >    tags:
> >      - qubes-hw2
> > =20
> > +.zen2-x86-64:
> > +  # it's really similar to the above
> > +  extends: .adl-x86-64
> > +  variables:
> > +    PCIDEV: "01:00.0"
> > +    PCIDEV_INTR: "MSI-X"
> > +    CONSOLE_OPTS: "console=3Dcom1 com1=3D115200,8n1,pci,msi,04:00.0"
> > +  tags:
> > +    - qubes-hw1
> > +
> >  .zen3p-x86-64:
> >    # it's really similar to the above
> >    extends: .adl-x86-64
> > @@ -301,6 +311,22 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
> >      - *x86-64-test-needs
> >      - alpine-3.18-gcc-debug
> > =20
> > +zen2-smoke-x86-64-gcc-debug:
> > +  extends: .zen2-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.18-gcc-debug
> > +
> > +zen2-suspend-x86-64-gcc-debug:
> > +  extends: .zen2-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.18-gcc-debug
> > +
> >  zen3p-smoke-x86-64-gcc-debug:
> >    extends: .zen3p-x86-64
> >    script:
> > --=20
> > 2.48.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--F2T20v1MgA2kN2/h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfqlcgACgkQ24/THMrX
1ywwZwf/aqG5xdxXERIlf915EHIfqSLqwSiYbPakqNm2FsYPWg97Y4uYz7L6XkZG
QhGDpjT9VT3ZuDduqoMMt4Gl9BDtBz4+KyRvY7i7r1dJpQX8XlGovRY4IWgq/A3W
UhiM0GfjNmGO6CscRDLhfavu2o4ijUaI5xwUx3GdkBHYXFy3X0X0FrUBIoHYD16H
u2uOikbCyGJYjD1d/6jLYM/RZnSSHpAJ3sdFVkw8gyzypx8ufHdpSWr+n203cnEh
C/w2uV7R2IA4Wh/kmwWLMaV237PVacLBBvRp58CVeeKR3XIxI2prPFrksHFAvNpM
lkPzpARoTve2xjgri3ws79B6ug3L5A==
=eCby
-----END PGP SIGNATURE-----

--F2T20v1MgA2kN2/h--

