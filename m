Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560B90920B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 19:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740851.1147953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIB96-00078L-Lt; Fri, 14 Jun 2024 17:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740851.1147953; Fri, 14 Jun 2024 17:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIB96-00075q-In; Fri, 14 Jun 2024 17:55:28 +0000
Received: by outflank-mailman (input) for mailman id 740851;
 Fri, 14 Jun 2024 17:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuT0=NQ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sIB95-00075k-L6
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 17:55:27 +0000
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 462b4e70-2a77-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 19:55:24 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 405F9114010A;
 Fri, 14 Jun 2024 13:55:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 14 Jun 2024 13:55:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 13:55:22 -0400 (EDT)
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
X-Inumbo-ID: 462b4e70-2a77-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718387723;
	 x=1718474123; bh=9L2NVQxYD5hYWwvVR+Bo+TDhcY3MpXNKTx8JCGqHKlA=; b=
	eVbLuIuT/ZecNUm89mQxxpsbkWtZCH7z+la/zQ8tCsACE7/Wsbumt1udJqFyqM0k
	OkV9hmoytnDEt/cCYL60XJac9kAF2aSl7zYXc3ZCqP304fzaYtY6cd1MT7zFKPRR
	f+p4JeIRAjgk3hY0cWP2UYysZUSHVBRkvK8+cNhccNeZSWf0bNyRo9WLJZvFuSrA
	q34LKzHZB2HgX1KvQcF/AEYk4FLjD0wFKwXp7ZvKydcNGDyYSIa0bV8cATopUMKs
	cZv9pwBx3IeQ084sPHuWI+wZfNlFCwVlraF4f7C5C2ywISTDJu3xyO6vSwHeIiiP
	RyF8ym8+BMDGHHeAcY807w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718387723; x=1718474123; bh=9L2NVQxYD5hYWwvVR+Bo+TDhcY3M
	pXNKTx8JCGqHKlA=; b=S1IGOjHzzWZ+o5FrXoJ5v1wVeHZdGyNHoISFhlSKQCGV
	Xchgk5vc3PS5iD03rMdCPJdo7/lcVmylEWMSB8B4P1f8nwc1iqG2CCxjmD+bfnPr
	PPxaaGjS5pPSqD1vi2UR4WEPhM9Ihw+m7gLZCE2T4qT7XKFzjzMHmj3hNh6vMRyP
	9uG5BO2+bR5rgsLrP0CesLhN8Yw4gPEOX0OXssgrWQPQLh4W0YraJsB45pp44Sv+
	U7JXjDlBB3enLKPN6dch55FLj5jbyXlWsY3GGjoz92/4dzAIRK2wCU2UN69wwnQQ
	oEGfEGNvH0/jokU28c1C8uFa8UMdq3CBPl6HnALrdg==
X-ME-Sender: <xms:CoRsZo5MkbmpcaDn-A3DH9pjx7gup2aF5C4yeQ7rdAdOpGiJzA1Wpw>
    <xme:CoRsZp5Ig4wcM4QBQdxtZBBP2QkJe4adr_-sxTnK-Nh9-3rcO_3ALwai4lrRpyXZz
    o1VY8T2RB68tl4>
X-ME-Received: <xmr:CoRsZnc3LLTtFq3b-J6LzZ67Ebe0-9U2DtFx59xGZ6rHkIBtFtB54JKJS6cp9x13tsPlNqeTVAjjF5I6D64jrNvW5JwVzewy62RIljNOBkCXt_rI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:CoRsZtLzPwliKxfjQOoeX3pqvEHQ74p9SDVtw6cSGOBt0zB5LF1vRA>
    <xmx:CoRsZsJAJYPWP2ZF0mNNRk-xNhU-3y9RN2tN7aL16z_-pFCV8ccrHQ>
    <xmx:CoRsZux6yb7qKW-lXW0_lhOj7k84bUhckw0YcFayN0sxY1_nrjHd-g>
    <xmx:CoRsZgLwZqzImE2teHViE7JCGPhavd4Oai8DCemU8gmthK8SKLwHqg>
    <xmx:C4RsZk_xQtxZecSN_36VA5hgylEufkRpXI20-awZVlPK7F7ZZ0sMW9Qc>
Feedback-ID: iac594737:Fastmail
Date: Fri, 14 Jun 2024 13:55:19 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZmyECbWrPxU-rUVv@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xsnp8/rOO0bVMLnv"
Content-Disposition: inline
In-Reply-To: <ZmvvlF0gpqFB7UC9@macbook>


--Xsnp8/rOO0bVMLnv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jun 2024 13:55:19 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Fri, Jun 14, 2024 at 09:21:56AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> > On 13.06.2024 20:43, Demi Marie Obenour wrote:
> > > GPU acceleration requires that pageable host memory be able to be map=
ped
> > > into a guest.
> >=20
> > I'm sure it was explained in the session, which sadly I couldn't attend.
> > I've been asking Ray and Xenia the same before, but I'm afraid it still
> > hasn't become clear to me why this is a _requirement_. After all that's
> > against what we're doing elsewhere (i.e. so far it has always been
> > guest memory that's mapped in the host). I can appreciate that it might
> > be more difficult to implement, but avoiding to violate this fundamental
> > (kind of) rule might be worth the price (and would avoid other
> > complexities, of which there may be lurking more than what you enumerate
> > below).
>=20
> My limited understanding (please someone correct me if wrong) is that
> the GPU buffer (or context I think it's also called?) is always
> allocated from dom0 (the owner of the GPU).

A GPU context is a GPU address space.  It's the GPU equivalent of a CPU
process.  I don't believe that the same context can be used by more than
one userspace process (though I could be wrong), but the same userspace
process can create and use as many contexts as it wants.

> The underling memory
> addresses of such buffer needs to be mapped into the guest.  The
> buffer backing memory might be GPU MMIO from the device BAR(s) or
> system RAM, and such buffer can be paged by the dom0 kernel at any
> time (iow: changing the backing memory from MMIO to RAM or vice
> versa).  Also, the buffer must be contiguous in physical address
> space.
>=20
> I'm not sure it's possible to ensure that when using system RAM such
> memory comes from the guest rather than the host, as it would likely
> require some very intrusive hooks into the kernel logic, and
> negotiation with the guest to allocate the requested amount of
> memory and hand it over to dom0.  If the maximum size of the buffer is
> known in advance maybe dom0 can negotiate with the guest to allocate
> such a region and grant it access to dom0 at driver attachment time.

I don't think there is a useful maximum size known.  There may be a
limit, but it would be around 4GiB or more, which is far too high to
reserve physical memory for up front.

> One aspect that I'm lacking clarity is better understanding of how the
> process of allocating and assigning a GPU buffer to a guest is
> performed (I think this is the key to how GPU VirtIO native contexts
> work?).

The buffer is allocated by the GPU driver in response to an ioctl() made
by the userspace server process.  If the buffer needs to be accessed by
the guest CPU (not all do), it is mapped into part of an emulated PCI
BAR for access by the guest.  This mailing list thread is about making
that possible.

> Another question I have, are guest expected to have a single GPU
> buffer, or they can have multiple GPU buffers simultaneously
> allocated?

I believe there is only one emulated BAR, but this is very large (GiBs)
and sparsely populated.  There can be many GPU buffers mapped into the
BAR.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Xsnp8/rOO0bVMLnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZshAgACgkQsoi1X/+c
IsHPYA/+MEmp9PkinbHFL3NMuwl19VvxMGbayIsrz/jYo350GAAXbTkH3KfZgBue
H2HeB7uTrmsB/hd0Y1Vzf2DEV9hPmUsRBOgT6ymxahpUIDvkkx+ewPLxDxy3rLjr
qchWMDcNvFHFPJf45b9CAdmYsMetmpPQiZOJ6FEPJP0/xdB9Ntu6UUEQ2IRZe2z0
sKjSB+sfHXBIaQv9sFcv0r2K/jvfFPmp8AbTtBnmfPCZ9BrTyL82XTHLwNP9nqk3
4LfQwg2VrXLhf6+E8hSRpbyRAMakd1X3UTkYatIGcjZc6Ji5g29Xs5qJhwZvy3yS
UzxsDfFXaduYTWFVkfybLg+X/0GiUBuRcKeAnVgxO7+HIyUUgkKqYSaIYyH2yWNG
yz/5Cmzc5FQ6pznPk3TAyFYUcZyl2Jxmx4c79B0HqWA21e91mMVX7O4uxHReXP+S
BTYVSgUAgcCBmx46gDlZUWlqTIqQ0tY5baZJRqDbbuBcvCKlehZUhfVOCtPdxIlP
iRFPeM1NFb5Jun6G5Pk/knfuw8VJoPIbiJxPFCxlUTqBL4aepqVfV3rsZlVM/RIv
7Eut6UlkqwUKtAXtRD6q6XpkPg2Rx2iPoLfmT8gDkIWUKLeyXR1DDI67OEzXgZfy
h2FGQkrzaZB5f1scNTzPIdKvOwgQiZoUmNnSARX11j9WuGGKwkM=
=3lLp
-----END PGP SIGNATURE-----

--Xsnp8/rOO0bVMLnv--

