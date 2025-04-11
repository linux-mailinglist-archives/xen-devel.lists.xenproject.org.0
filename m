Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2466A868FA
	for <lists+xen-devel@lfdr.de>; Sat, 12 Apr 2025 00:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948040.1345574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3NES-000742-1B; Fri, 11 Apr 2025 22:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948040.1345574; Fri, 11 Apr 2025 22:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3NER-00071U-Uh; Fri, 11 Apr 2025 22:52:19 +0000
Received: by outflank-mailman (input) for mailman id 948040;
 Fri, 11 Apr 2025 22:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3NEP-00071O-V2
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 22:52:18 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c853723-1727-11f0-9ffb-bf95429c2676;
 Sat, 12 Apr 2025 00:52:15 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 172541140196;
 Fri, 11 Apr 2025 18:52:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 11 Apr 2025 18:52:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 18:52:12 -0400 (EDT)
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
X-Inumbo-ID: 9c853723-1727-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744411934;
	 x=1744498334; bh=wqozk/RFam4IjYxYRXTsUpMx51UJpKLSjj8qd0C5t0c=; b=
	TTE+Tlj3r2pWXkXkhgXTgWgx1oeYhaY/PKpa4PfqllSQrKE4vulfIjyMvn02ye5W
	oeE5h897or/yo1IFtEtdw97yAlv0PO7PTgD/MG/6gJ+qen0fBgf+6GSgrTPmXdTH
	UKR59nGMayjCbKEzhmw3X0k4GSYVtsaKQtAXZQzEmU3igb7Ho8lpQIN3Hyf2hrp3
	n2G/x0GNcb+XBAQkEk9rB/Z8wPscjJInKQ93/J+p//TpDxf5lZXWlnXUJxZ6acUz
	Jlf1Q8ZUlTsUYaWjUZBRVQiqrT/7dyF3MbDpvgJ8+OkCWMU8+H7gbZU+4d/W5dLQ
	dg2PtquZDMIHIiWyQsnzeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744411934; x=1744498334; bh=wqozk/RFam4IjYxYRXTsUpMx51UJpKLSjj8
	qd0C5t0c=; b=gLG5tJrNTXZZfrdr2liHveJAFnPXC+3cffWiBk+QHkT8ee89EID
	jBCj8DqghRCEV54Na6EWrh+ZIDi7S/TAjF7XlegwfNe4ggUiAnt/+qJcorXmjjY/
	yq50XM9fBwuqrMkY1k/w2Y9kcTf9LACtEkpBBAm5fkwnbytvrSgYTNFfx8Cny/CG
	9G/TCoI+HoC9173eJPk4Tl1w4w+XRcxvjRPuP8FCms9mkqXSEQq+2uDi+O/+pxNB
	5tgQZ3JOrId/5/9LaGSnxu7A6I+uMrYUO6E+wZ9+h5Z4V951JM8ZI4nWmKXA+FAJ
	44KvWqPBKUsWiQYJSI35kLzqWDNlERpua0g==
X-ME-Sender: <xms:HZ35Z2mtdhBuFjl0KLZ1nEMNYLvbYN7UJGJ_ZDHy9f_RKAW8DWRq9Q>
    <xme:HZ35Z91HFtWEnywI4k6SwFlnAgfVIGcu1jdqh2NkDxxabALpFEURJgFDQgDotQOzX
    BPcNBVxymyKuA>
X-ME-Received: <xmr:HZ35Z0p_KZxWCO29lRnh58ujLajX1IaCFZAB9n5H4I2AvS9t51AWZHadVpHtTiizlXblY5LNjve-6NgVj0hotmzfQ8vN-ZIAYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudeftdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepueekteetgefggfekudehteegieeljeejieeihfejgeevhfetgf
    fgteeuteetueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
    dprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HZ35Z6kaI4-ZeM5cSAUXQnY26saKru_I5ArehYEK6WjBufqZX0m2iQ>
    <xmx:HZ35Z0309dnqd4I2dplvGDX7-8p0xslM6lXmhTpOfpPuHsJHUEmxyA>
    <xmx:HZ35ZxvPGEU2cs3DhxO5GH5dYWgD4wl2OiLdkazTKrb5TS_Pqzgo1w>
    <xmx:HZ35ZwUCJH9tpnHPRSWATuHEsSBaE8yZtUHUFLia3mRsyD3CF8RyVg>
    <xmx:Hp35ZxFIU84JLT6EtoRErhHvXHR5CqZweQCdsXzv_4m0uyQpVNWVQPEJ>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 12 Apr 2025 00:52:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/7] CI: write whole etc/issue for domU initrd
Message-ID: <Z_mdGunBR9LZfGyU@mail-itl>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <526ec153b1cabc1d5b111be27ded8d0d4da5178a.1744403499.git-series.marmarek@invisiblethingslab.com>
 <107fe18c-e72c-49b4-8b48-e11817f2cf9b@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3pUXHbnBmlYgbiql"
Content-Disposition: inline
In-Reply-To: <107fe18c-e72c-49b4-8b48-e11817f2cf9b@citrix.com>


--3pUXHbnBmlYgbiql
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Apr 2025 00:52:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/7] CI: write whole etc/issue for domU initrd

On Fri, Apr 11, 2025 at 10:07:28PM +0100, Andrew Cooper wrote:
> On 11/04/2025 9:32 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 861e302d845b..dd88a1398f2b 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -182,7 +182,10 @@ ${domU_check}
> >  " > etc/local.d/xen.start
> >      chmod +x etc/local.d/xen.start
> >      echo "rc_verbose=3Dyes" >> etc/rc.conf
> > -    sed -i -e 's/^Welcome/domU \0/' etc/issue
> > +    echo "domU Welcome to Alpine Linux 3.18
>=20
> This 3.18 is going to go stale shortly.
>=20
> Because of LOG_MSG=3D"Welcome to Alpine Linux", the version doesn't matte=
r.
>=20
> Alpine does have /etc/os-release, but busybox's getty doesn't translate
> \S.=C2=A0
> https://github.com/brgl/busybox/blob/abbf17abccbf832365d9acf1c280369ba7d5=
f8b2/libbb/login.c#L84-L86
>=20
> I'd suggest just dropping the 3.18.

Fine with me.

> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3pUXHbnBmlYgbiql
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf5nRoACgkQ24/THMrX
1yz4SQf/U+0PmzwfEUdzSPaQwv4F3/Dr2wujWLmv0ryISpY48NhIuepzbLy3sZ26
6k6JPMzbYQgoF2mopyK4zCJ7Q0zh08kY8jMTvUdb7jKirNaXYl2eGn4PbHSb6KUA
kuV15+QnuYAbLvs+AYXMsTKx6kd4YNd0RH8GeF6RiPvRZRYwlkiUC1GhpR4dhGI1
qlP5p15d8eqziwye+HJsNZoIUdKvwotbB4hhpfvDkA/w5tIfACEwQwZhSU1eALM2
SgJ65H1REAQJQDthM2MtbuQKWDDzLQHP4ifBAyNItkZNi7OX3NkgQXnO+ZV5Gsq/
2z/ac212s6EkFHxnZHTLwr8RrzE2Iw==
=TfXA
-----END PGP SIGNATURE-----

--3pUXHbnBmlYgbiql--

