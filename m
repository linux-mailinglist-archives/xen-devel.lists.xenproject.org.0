Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0EA80692
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941871.1341261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u284P-0000M4-Vy; Tue, 08 Apr 2025 12:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941871.1341261; Tue, 08 Apr 2025 12:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u284P-0000KY-Sk; Tue, 08 Apr 2025 12:28:49 +0000
Received: by outflank-mailman (input) for mailman id 941871;
 Tue, 08 Apr 2025 12:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83+A=W2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u284N-0000KN-MS
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:28:47 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03546e33-1475-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 14:28:45 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 1B1741140174;
 Tue,  8 Apr 2025 08:28:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 08 Apr 2025 08:28:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Apr 2025 08:28:42 -0400 (EDT)
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
X-Inumbo-ID: 03546e33-1475-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744115323;
	 x=1744201723; bh=A59KF7piw/VwMYMnYrIG0UZhvm3iMNK9GHVvAL+gTXc=; b=
	oktU+xWniTHyiv7xjEKZL29ngPXJ5m5iXqP3CvHbkFgsRk834y62vpoU06NkEREN
	pOovBG0WnLJVxiw57rixJEcwOl3/xzVP2aaZ1f5ow5/8wQI3M0mGxDABiYaX1Gp7
	9aQMZf1hiirhKKS1MLP1Fayh1k6+Wt7myh9aNz5oCjg/GeWx5UNKmD/hUo2UCDE2
	LiiMdH4UIdd0rqiRfOO8pCULByBJtdglm/5oj7JUYKe75HDBshvDCXRDh2ObSGeL
	YjpD6xWdigqMCwXnvIDuKlzNXBbhotrZsp87em1FoSz+D/bdQpyVfptDyyVqLvzY
	m/3C6QNpF7jA2prKcN+h5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744115323; x=1744201723; bh=A59KF7piw/VwMYMnYrIG0UZhvm3iMNK9GHV
	vAL+gTXc=; b=HRnGjs+S0ZBe3rA+8Ml79NYMJHUSFDoVNC2IW4Q30oDyNLAPRYO
	tYmSNSlfzeuYZSF2aZfg2POISwFQrmDBPXxeHo5inOW1xG0c5YjEiUZuQicT+hhp
	YJSOBUelKv5AbrP01HIrmitbWBxIR9FH8sgy/khKR8zFp7jE4akfGssgEjDGUw28
	cg2TD6SeNo/wI/yBJrY3xtUArheRJlrfQ5dVC6TtVswJI80v/FOhXinpH/JzyI+w
	TKEy9+gNfRtDDZkQriudbeHXG6N3hW4QP0gjjf2wUMCKc4bnlgVka3Qk2HtrOEZK
	z8SAVQOQqSh1Qq89DRWXvdEJ4H6Vr9BxLjQ==
X-ME-Sender: <xms:exb1Z_HBKcAjzNC1bbVqalOOQ35IsLayRB5EgvSyn-oHvPQ6BI5tNA>
    <xme:exb1Z8U1KGaLcwknVXNnWvH-_ap0P78WE28BW3AqmoslzM33CEB9PEEz75NDTV5PG
    mr9_bNlamEXgw>
X-ME-Received: <xmr:exb1ZxI7av6d8apJqsdZumnEBRbEsDFb2jdatL7bjAhYsq72_GtnNMkMxkLf_nB9i2nZr5OsGsYTZBU2iHRV-AJOjFte0uTHjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    thhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopegrnhgurh
    gvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggv
    vhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhg
    vghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:exb1Z9G-yBkhSrcXWDLkOkYFuLSp2K-9KKpLkn18hA5cZiC5jfFvCw>
    <xmx:exb1Z1XJ2LhXLxtWwxuxqz7_9dDpyC54hjTmA6A4qHx0prp5lO9eKw>
    <xmx:exb1Z4OzckpIwusshfcPdvd912P4oXo1675WzTbZFRTAXDNZGuEPRQ>
    <xmx:exb1Z02yf0mRc9ZAbE2waUS7My--gPVvO0th8dB7XTi6C1VhIHdW7Q>
    <xmx:exb1Z7K6eLsYAw5bK4wVZmonT9Op3cu0qMDzqSWyHZL0mU3bc61ifqof>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 8 Apr 2025 14:28:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio
Message-ID: <Z_UWeDXoj3Z2c1Db@mail-itl>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
 <a2b01279-4e67-4ce9-9752-21c16c33fe32@citrix.com>
 <04ae4edc-8ea6-489d-8485-6e45aa750607@citrix.com>
 <Z_P9y8lxB_-kEcy6@mail-itl>
 <Z_URWuh2hrIWGBGV@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zEU1nonQ0q9tffLo"
Content-Disposition: inline
In-Reply-To: <Z_URWuh2hrIWGBGV@l14>


--zEU1nonQ0q9tffLo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Apr 2025 14:28:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio

On Tue, Apr 08, 2025 at 12:06:51PM +0000, Anthony PERARD wrote:
> On Mon, Apr 07, 2025 at 06:31:06PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > There is one more difference: the cpio.gz contains the whole thing
> > twice. Once as rootfs for dom0 and then another as boot/initrd-domU.
> > Dropping .tar.gz is probably a good idea at some point, so I'm okay with
> > such comment added. But I imagine some future tests may benefit from
> > just one layer, which may want introducing another cpio.gz without
> > boot/initrd-domU included. In fact, even right now that might be useful
> > - for example dom0less arm64 test uses just busybox for domU rootfs, not
> > the whole archive (so with my changes dom0 rootfs has unused
> > boot/initrd-domU included).
>=20
> In such case, would it make sense to prepare several initrd.cpio.gz? A
> common one, then having overlays of files we want to add or replace to
> the initrd of spefic test. I think osstest used to do something like
> that, with command that would be:
>     cat common.cpio.gz overlay.cpio.gz > initrd.cpio.gz
>=20
> If it matter, is seem that the "file.cpio" used to be made with
> `cpio -Hnewc -o`

This is already how final initrd is constructed with my changes.
Having said that, maybe test-artifacts should not include
boot/initrd-domU in initrd.cpio.gz initially, but have a separate cpio
that has just boot/initrd-domU there. Most tests do use this domU
initrd, but since they need to concatenate something anyway, maybe
starting with two files instead of one doesn't make much difference?

So, it would be:
- initrd.cpio.gz - plain rootfs, for dom0 (or domU in dom0less tests)
- initrd-in-boot.cpio.gz - the above initrd.cpio.gz packed again as
  boot/initrd-domU

What do you think?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zEU1nonQ0q9tffLo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf1FngACgkQ24/THMrX
1yxZKQf/d/Rq6DXP3PX4/Z0jB84sHjT3az49EhftqOx438Ijj5IWkZn+/sHXvvwO
tTXAQ00UEb/95PXP5nBUiFTOxlIRm62WUWG6QHH50NV0+AePmvY2CsupJ1m3YT7H
O9Q/5TdalMVYu6FgWuvGiOd+89fSsRdy9lB2vPqy2YqoafaEovQXVYhmOl9BYAHj
KhE2hE0MB33GAkYQ1/XvLi1j+Dlxy1JTEQLaJiTRpHqH3rKR5xyV8y3fV0MNExH+
A0usg8HLhmm3z7bgx1+VCuhIEdMPrJpwjX8IMuCwQ+JqUo1PVARTJUsJ0UEHtWw0
rJcU7UBXjF5iB/hhJrBxKYNH/28Ndg==
=X3/i
-----END PGP SIGNATURE-----

--zEU1nonQ0q9tffLo--

