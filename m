Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCEF376DE9
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 02:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124182.234381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfB2c-0001Kf-NY; Sat, 08 May 2021 00:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124182.234381; Sat, 08 May 2021 00:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfB2c-0001HX-KO; Sat, 08 May 2021 00:41:58 +0000
Received: by outflank-mailman (input) for mailman id 124182;
 Sat, 08 May 2021 00:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j7fW=KD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lfB2a-0001HR-Qe
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 00:41:57 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d48dcfe6-3abd-48e4-93dc-30b2ad5e224f;
 Sat, 08 May 2021 00:41:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A3295C00E5;
 Fri,  7 May 2021 20:41:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 07 May 2021 20:41:55 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 20:41:53 -0400 (EDT)
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
X-Inumbo-ID: d48dcfe6-3abd-48e4-93dc-30b2ad5e224f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n2i9lb
	1cDFHBhzulZlCy85ItUbUjzY2Rm3nibICrJL4=; b=ZV1zjl5dyQ4KgK80tuv4bQ
	EtTPysRfSZV1CFCyBHVdde2W53NrWG/RvNK4ZDBMoc+Y4fadZYGedvWbzUnyID4w
	K0d/SKLz/dfDGquCfTxQXNFAiCucDoq1cTTkvYWHUnV0d3gnQte38vw+/F+VVapD
	v14uO58mYnIt93XmaT3h56IHwlN06L3OasSh9+X2Qwfo51pfINqmpt2PnyY266uP
	vfzM2ECuskTi1z5DlqXadHQF91hjK0wvQE+rpGwpjV46iVoGnvnPewWgbOSADmJe
	DbTVRkgt8NxGblffxjjy6YlvIpVF0cl14DChipEeTTb6mfy7m41nh6922gfga/oQ
	==
X-ME-Sender: <xms:Ut6VYOIF9YIDBea2xmpUCYx1-S79R0ko18othBZAN0OSrsFYExnFmw>
    <xme:Ut6VYGKp6pVQKy6FL2W_wKu5gIOQV-k_5IK90d6_hvnK0vko4qgchXtuIlyzCjcRR
    G0KH0rTm62vIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegfedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:Ut6VYOuC0MLd_wjegbgNyjG51mAad41yHZjtejvGz9kmCsrSMvy8jg>
    <xmx:Ut6VYDZM7gfRRYzAJ7_-lp3sPUfmCeQ4dxGLVyO6vrz_-0BbQpSawQ>
    <xmx:Ut6VYFa7-spspQxsXE3OVRkM4xxCyvzg7W3TS5F5eRLVJrsqZgBEfA>
    <xmx:U96VYJGXXs-hjuvZbv2sLSdlwzi3W37aBqMEujJrcnOUjyplAx0lrg>
Date: Sat, 8 May 2021 02:41:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] xen/gntdev: fix gntdev_mmap() error exit path
Message-ID: <YJXeTy0lNWvSMnZH@mail-itl>
References: <20210423054038.26696-1-jgross@suse.com>
 <467B8109-C829-4755-8398-196E50090898@arm.com>
 <9cb9bd6c-8185-9741-31b9-8f6baf3848a3@suse.com>
 <92E0F915-499C-4471-B0C9-336494C5E31D@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pOlv8fsOYh8hH7v+"
Content-Disposition: inline
In-Reply-To: <92E0F915-499C-4471-B0C9-336494C5E31D@arm.com>


--pOlv8fsOYh8hH7v+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 8 May 2021 02:41:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] xen/gntdev: fix gntdev_mmap() error exit path

On Fri, Apr 23, 2021 at 08:04:57AM +0100, Luca Fancellu wrote:
> > On 23 Apr 2021, at 08:00, Juergen Gross <jgross@suse.com> wrote:
> > On 23.04.21 08:55, Luca Fancellu wrote:
> >>> On 23 Apr 2021, at 06:40, Juergen Gross <jgross@suse.com> wrote:
> >>>=20
> >>> Commit d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert=
")
> >>> introduced an error in gntdev_mmap(): in case the call of
> >>> mmu_interval_notifier_insert_locked() fails the exit path should not
> >>> call mmu_interval_notifier_remove(), as this might result in NULL
> >>> dereferences.
> >>>=20
> >>> One reason for failure is e.g. a signal pending for the running
> >>> process.
> >>>=20
> >>> Fixes: d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert=
")
> >>> Cc: stable@vger.kernel.org
> >>> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> >>> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> >>> Signed-off-by: Juergen Gross <jgross@suse.com>

(...)

> Right, thanks, seems good to me.
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Can somebody ack this fix please?=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pOlv8fsOYh8hH7v+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCV3k4ACgkQ24/THMrX
1yxJTwf+MztgRk40NrBaqMG3/vvS/xaYpsHaX6aDvKJn6O+2s6bkhNejJURDM7QW
B048xcn16B4UTKoIr/6BuToivQKKaQyuX3Da8XstMYDJc6H70Eisf6o2YX33EvZS
k0F+R6dnCKHb9DVWltZs4onpAAUlnKeaYIpu+dgsCISX9UoOo7ogmNANyLtZEYz+
BvzFd5vWrF5I6KOjVBxMSF0ENGi9y+YYelKfCYYe0E6DM1059WmxAuzRlc+PJv6j
9qGS46t0JkbVlIgV7O36Lw7/m25OvoxLBBb/ImH5yBo+uNMmCBUavR75U/9gInE3
RN3X65Zqr8gCKtldPPUG5Ro2bF1AcQ==
=FcB0
-----END PGP SIGNATURE-----

--pOlv8fsOYh8hH7v+--

