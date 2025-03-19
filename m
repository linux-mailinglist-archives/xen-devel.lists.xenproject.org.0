Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F42A68BD4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920335.1324539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turjT-0005ch-3l; Wed, 19 Mar 2025 11:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920335.1324539; Wed, 19 Mar 2025 11:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turjT-0005ay-0x; Wed, 19 Mar 2025 11:37:11 +0000
Received: by outflank-mailman (input) for mailman id 920335;
 Wed, 19 Mar 2025 11:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMzd=WG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1turjQ-0005as-V2
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:37:09 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6ea45d-04b6-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 12:37:07 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id F287E1140125;
 Wed, 19 Mar 2025 07:37:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Wed, 19 Mar 2025 07:37:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Mar 2025 07:37:03 -0400 (EDT)
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
X-Inumbo-ID: 7c6ea45d-04b6-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742384225;
	 x=1742470625; bh=4XjR/awIjrCmPOUbTJnzCC2e1Oxrp1Uw7mt2U4dPdsM=; b=
	nQG7Gy6ggM6hQ75KMYWm2rWvvE7uNXQBT9aP+gghWwHIBJfkJaa18Y+MhPJN4ObO
	SoSo7Rrp70yf4d8bCboMApel+ZDx07DgB0kvlJxXkF49uqolG4rh0XFsi6YLrfHc
	R95axIeemVyh6dPGmQNnuoxC8ZGRDHsSzTqP3SJa4knzXmtsAWApxXDlvIpai68z
	TZpBM4/kE8+fSccB9xeVC+pfu20RkHov40Xb5+FGgiL7bL0hTPfjzVbKFj6F7JTY
	tuQ7RSOoRaOz0Z9KPtodKzR+3EDOUoCTlZXK/IqXKTBkXcGMHbyTgaJ0vPy5hh+J
	JtQ62qclvd4jYumMQTEOMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742384225; x=1742470625; bh=4XjR/awIjrCmPOUbTJnzCC2e1Oxrp1Uw7mt
	2U4dPdsM=; b=JED9zCRAmVhzNJm9c1HRq9eKPBqmr/m5yDfXq16SC2dlKCcMKtD
	QZWKge9F3+lO03MlSXKDDwE8QRE04fTOt8Jtbwj82WRAv5KabLq4vNERX1Je+SWV
	BG4lo4jxAqOcL4ZLLw1U+VGtHxwOEFVKF2B5bOd+RuPFMVhjQViVvnB0vVv3pXpy
	5ZlBK7/t9RwKXlvdDWBDdSCDP4akT90SkkUPFaZPcMQiwDdLQx43IEd8mVkqBIBj
	SayaEiY7A1MUAAxVU6PuuXEqihbqGpve6eRq3V9SfdJG1TFu83rUcjj43M8kAU0o
	+WnN84hrVax9KxVTtfdV5yOBForXrp7XT5w==
X-ME-Sender: <xms:YazaZw2cVWeEvUbzt_baRsechg-iWYag0EIAs89_exNtb5gC6CRh9g>
    <xme:YazaZ7E7mVNHkk3QTScxUIe_9LWXVjymhnJyFiPUZ7R8YSZzQEH13f0qMo6Tzn4ue
    gGIAAQ7a5BEJQ>
X-ME-Received: <xmr:YazaZ47Ia8D5nb5B7N66W8VMPy8i8dWlmMigKnkhPrRbmWMIRnHZSBvigk56DgKGtI_OJBNHnbhcjNoHrY3qoTTC3VQFmDnBzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    thhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehf
    rhgvuggvrhhitgdrphhivghrrhgvthesqhhusggvshdqohhsrdhorhhgpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehm
    ihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjsggvuhhlihgthh
    esshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghp
    thhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YazaZ51k3w_vUVWBStK2jdszW34UziBJzRoE8tNadax3ULWWjI3xMA>
    <xmx:YazaZzGpgpm0NBPCgF4xk2TqFHNH6QvrMVtcMBrw0dyLYkptD2Hbbw>
    <xmx:YazaZy-strjRcoZ3_h7y7B1gir9r7i25Z9cnpfc56-ivKHHSG3pjng>
    <xmx:YazaZ4kba7S6u879lXdVp8nTmOMjuex4s8H2K35mTDObCJSzH1RYbA>
    <xmx:YazaZ6Dmulp0uAnFA4CjmlT_93X8GlB3MwKsugNZxlQZZm3XQgAOHp09>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 19 Mar 2025 12:36:59 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/2] docs/xen-headers: use alphabetical sorting for
 @incontents
Message-ID: <Z9qsXYnPNPY_Xelo@mail-itl>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <09f34b27d576d1067cc38eaa202aebebb0478cff.1742317309.git-series.marmarek@invisiblethingslab.com>
 <Z9qoQ4wwfWZ7ID2T@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QcjF9klx31Auu4sN"
Content-Disposition: inline
In-Reply-To: <Z9qoQ4wwfWZ7ID2T@l14>


--QcjF9klx31Auu4sN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Mar 2025 12:36:59 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/2] docs/xen-headers: use alphabetical sorting for
 @incontents

On Wed, Mar 19, 2025 at 11:19:33AM +0000, Anthony PERARD wrote:
> On Tue, Mar 18, 2025 at 06:01:56PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > From: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qubes-os.o=
rg>
> >
> > It makes the build reproducible with fileordering flags
> >
> > Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@q=
ubes-os.org>
> > ---
> >  docs/xen-headers | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/docs/xen-headers b/docs/xen-headers
> > index 8c434d77e20e..98ffe814500b 100755
> > --- a/docs/xen-headers
> > +++ b/docs/xen-headers
> > @@ -331,7 +331,7 @@ sub output_index () {
> >  <h2>Starting points</h2>
> >  <ul>
> >  END
> > -    foreach my $ic (sort { $a->{Seq} <=3D> $b->{Seq} or $a->{Title} cm=
p $b->{Title} } @incontents) {
> > +    foreach my $ic (sort { $a->{Href} cmp $b->{Href} } @incontents) {
>=20
> Why is `Seq` been ignored? As I understand, the index is supposed to use
> it as first ordering key.
>=20
> Comment in that same file:
>     #  extra syntax:
>     #   `incontents <seq> <shortname> <anchor text html>...
>     #                              make a table of contents entry; they
>     #                              will be sorted by increasing seq, and
>     #                              shortname will be used as the anchor t=
arget
>=20
> Also, we already have a fix for reproducible build:
>     e18dadc5b709 ("docs: use predictable ordering in generated documentat=
ion")
>=20
> Would it be enough to replace `Title` by `Href` for the second sorting
> key instead?

Hmm, right. It looks like this may be not needed anymore, as long as
title is unique (it looks like it is right now).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QcjF9klx31Auu4sN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfarF0ACgkQ24/THMrX
1yw6UggAjDk07hF00s+dkNFEiysIIy8Ew8IUYmKB2loQWQ4qYE0s/N2mA0KCDRJY
Jvf9e5ywqtdOVdqiTtnFUtnBVAFjcjAEmQ0snQ0Ya2GZY97uM4lBGnb6lKCiusgr
34OtEkXKWpbw9Qqzr0YkC0VPtGglGMofAqWKGVkgE89AEr6fPUsfpm6P25U7OIem
VXMnCdOzNJrCwdGg6KyqjzyMkRt2MViDe+1siYC0gzUsuicb99w169dHpsDfQZH6
KfU5cb4eP3xWn6xo9HCsc+tvSjhgxNl40AOrVD3s5TRNTFd1BV5c0B6wrsnCNMpU
HW7JYDllVj7U8h1DyQ9eIKbid65GiQ==
=CCtw
-----END PGP SIGNATURE-----

--QcjF9klx31Auu4sN--

