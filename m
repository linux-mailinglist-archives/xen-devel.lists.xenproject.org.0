Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AEAAAFA4F
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 14:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979360.1365996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD0bV-0000G3-P2; Thu, 08 May 2025 12:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979360.1365996; Thu, 08 May 2025 12:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD0bV-0000DW-Lq; Thu, 08 May 2025 12:43:57 +0000
Received: by outflank-mailman (input) for mailman id 979360;
 Thu, 08 May 2025 12:43:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LuaF=XY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uD0bU-0000DA-3M
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 12:43:56 +0000
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1885c8eb-2c0a-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 14:43:53 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 7B3FC11400E9;
 Thu,  8 May 2025 08:43:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 08 May 2025 08:43:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 May 2025 08:43:49 -0400 (EDT)
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
X-Inumbo-ID: 1885c8eb-2c0a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746708231;
	 x=1746794631; bh=VjAzjMR97l41RykYlGvw8f0ThPA/qmCei8qGQl+8pio=; b=
	lX7SQr98W4Xx4E/2GUR/N02URW0jvy5TOPr4vG59Xzy0eYPIrRwj1Co3kXGe78y0
	rwzLJq5IKRSxJ12jP1miMl4XTy9y3NaSmbXqo1ChZdG1MDYFnRFkgqvW9oYM31sB
	/fvBSCHOguB2FxNaxXCw/Y0pk2S3vIiDn4m00PjdtD0+tfiVsU/dxksEaKuM0AiN
	nqwzewsq08koC5AsLR3I5C7IHjVKo6GYqtijSD88fa8Po2LBmYpqKBjxfD+R0Wq5
	3+cvJ3Uem2OkM+puW+mPIQR10jfW23HGwwVPhVY8+mNzjb61FmDtnUWWbFAgAEJ/
	ac2DBl+LAY2qhDWGhWkVnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746708231; x=1746794631; bh=VjAzjMR97l41RykYlGvw8f0ThPA/qmCei8q
	GQl+8pio=; b=FVlMEe6+x6f3rGrEen0UL95QqBwNYtbFVTYO6sON9mpRMiRBjQj
	PhjM5fqDM9PxR3QyQ/9Zu0o7MOflTZYwxCIhCR4429AteNoVaB2POEgl9/vlgHjh
	pIvpCOClv+ivGbvjDBscHAMYTTH0hqvo82RSoFB7rxbEXMmZnYyGdri5imnMkzNw
	UU4WB2J1dzqjQ6aLS49vbsEB3bUNaDCvr5tRmipopKk42VRBieZX2+kOWEZCIiBn
	uOr5P+Oz6EDaaKFUYQvLbq01sf/mUj89eWvauw6Fmc+UExL9sd9GrkGo/xFyauhM
	XNcsq+Y+wV4E1/A1IWLtw3qDTtYkSdBrUwg==
X-ME-Sender: <xms:B6ccaPTSBgKiygzd7OU638JWoOkkzn8OUIG-f0Q5_Js6OHDgCB99EA>
    <xme:B6ccaAwmVVcv6Q3vZRo8gcbUEMA5xQ9nnYo-u-WfIzcIJ5MWUp1_HX_ihDMjuf3em
    m-gZqzuQMMLCQ>
X-ME-Received: <xmr:B6ccaE1T4CGqqSKgg7kfWnQDo86fkV9VYUjB2NBvD2kj-yKD4U4a40GUtGsxXqqupRbj_PqSzupgYJr_dG2aWarDO_973BA0LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeljeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepieeluddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejhe
    etuddvkeffudeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegtlh
    houhgurdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhi
    gidrtghomhdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgrshhssegtlhhouh
    gurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluh
    htihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:B6ccaPAROs3eWbnJRQ_AFOukVeYVLHX8yCqg9LO4GSNRshnlXUjp1A>
    <xmx:B6ccaIgHW3P8u1xWdsD9UuGKE4ErSPBzeXEnJek4mc3c9lyXKRR8pg>
    <xmx:B6ccaDoBzUh86xWhAbEEG8gmBrrTj-RoBz8CkTvkhnGvgP17k6JBMg>
    <xmx:B6ccaDgzeQ4SBUvqoD9NeYQAvVO3KmKODYlhGXQsWPdFvY4AkL94tg>
    <xmx:B6ccaIRnJ-BssdIAo78Y0cAciKEWhw6cNggfkYFejobVvg9_N-TAPmCT>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 May 2025 14:43:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
Message-ID: <aBynA-TiQNwCAOkG@mail-itl>
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
 <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
 <aByIDP2iEHjmo99t@mail-itl>
 <fab47327-e885-4565-817b-16343f41f487@citrix.com>
 <CACHz=ZjtMSe8EzG-wTMCz=kecwzYGR14cu29JwQ0oozK6fr_MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yxgSmfUD35M1RgN/"
Content-Disposition: inline
In-Reply-To: <CACHz=ZjtMSe8EzG-wTMCz=kecwzYGR14cu29JwQ0oozK6fr_MQ@mail.gmail.com>


--yxgSmfUD35M1RgN/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 May 2025 14:43:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary

On Thu, May 08, 2025 at 01:28:21PM +0100, Frediano Ziglio wrote:
> On Thu, May 8, 2025 at 12:55=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > On 08/05/2025 11:31 am, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Thu, May 08, 2025 at 09:51:59AM +0100, Andrew Cooper wrote:
> > >> Also,
> > >>
> > >>> ld: warning: orphan section `.sbat' from `prelink.o' being placed i=
n section `.sbat'
> > >> This is because sbat.o is getting linked into the non-EFI build of X=
en too.
> > >>
> > >> I'm less sure how to go about fixing this.  There's no nice way I can
> > >> see of of getting sbat.o only in the EFI build.  The other option is=
 to
> > >> discard it for the ELF build.
> > > This is kinda related to my question on Matrix - is multiboot2 binary
> > > also supposed to (eventually) support UEFI SB?
> >
> > This is mixing two things.
> >
> > Xen is either an ELF binary (ultimately zipped, so xen.gz) or is an EFI
> > binary (xen.efi).
> >
> > Both of these binaries currently have an MB2 header.  This was by
> > accident, as xen.efi is a strict superset of the ELF build.
> >
>=20
> We are planning to use multiboot2 booting. The reason is the way we
> want some parameters (like command line) to be passed. We are going to
> use grub2.

Which means that multiboot2 binary needs to be signed somehow, and for
MS to be happy, needs to include SBAT too.

Relevant series:
https://lore.kernel.org/xen-devel/20240328151106.1451104-1-ross.lagerwall@c=
itrix.com/
I don't recall seeing v3 posted.

And relevant grub series:
https://lore.kernel.org/xen-devel/20240328151302.1451158-1-ross.lagerwall@c=
itrix.com/

> > AIUI, SBAT only makes sense to exist in the EFI binary.
> >
> > ~Andrew
>=20
> Frediano

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yxgSmfUD35M1RgN/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgcpwMACgkQ24/THMrX
1ywMNwf/dyVtXhaDhhtskdBux0HZK5GmacoEjGfekF9ePCu1+hho6blFtlOMcLGb
ojzq6w4rhOPFGlvMOqnzbBpwNJUZd3rczOApTFeG4xownH3QDjLmwoUofM/Cm/2q
QBstivZjrg2/6s6KRJRQO2cqXqg5UaTFLt6loDfMJG15TUsIYtDxR/nJ4R1OS7i2
Wl9QD+jg1HpH6hOa6o5aeYZ9xMJN/Ej5TesrIqB+WbyQ0Ojq4r6fENZVbprkP7TL
uKd5U0hUyaq+J7PecWYNZ5TwE5u3YLxqO0MNDfYFzHD4iciH5kgytwoPEkDnVZiH
Io0f/7o2ecK44mGHHyM/Ba0Q5BRPhA==
=Sdn9
-----END PGP SIGNATURE-----

--yxgSmfUD35M1RgN/--

