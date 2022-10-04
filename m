Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FBD5F4615
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 17:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415602.660215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofjOi-0001hH-SL; Tue, 04 Oct 2022 14:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415602.660215; Tue, 04 Oct 2022 14:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofjOi-0001fS-Op; Tue, 04 Oct 2022 14:59:52 +0000
Received: by outflank-mailman (input) for mailman id 415602;
 Tue, 04 Oct 2022 14:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgJy=2F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ofjOg-0001fM-D7
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 14:59:50 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f16ce4f-43f5-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 16:59:47 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 19CAB5C0236;
 Tue,  4 Oct 2022 10:59:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 04 Oct 2022 10:59:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Oct 2022 10:59:44 -0400 (EDT)
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
X-Inumbo-ID: 2f16ce4f-43f5-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664895585; x=
	1664981985; bh=E1lsaIoPoHHZzWdFQKCG0AlCnJ1l1lFD4lk42NTTkGE=; b=N
	QQU4sx5lseJWZlp5c6iZbpApk0bFQr7zQ/ubJlamNn4goRA+Gr7uYT7p3fPVlQJU
	MXFEkmoDVqZv0wx/eT9KnRSk0FVVOHinqf5737Sa4OzQUWRtq1uqa/JsFb2jBvJ/
	LVEzaQHee7QA80hDdxfMDm38e5FqWuW0lpwK/qtqloemwTWKYZYZSATif7FolHr3
	uuIOa23tALIA0xn8mXV8TgSoUmuD4hn86YxdpyIbdeYxPLXfJH7A26pwalhNDPdJ
	i4O/apS6JH6clMeco8ft0U3MY/XnLa3T9/JqRSTE1qXwZNAW+adw4wc7y5HoSwAS
	Eo5EfZJGAjiyJds1tWFBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664895585; x=1664981985; bh=E1lsaIoPoHHZzWdFQKCG0AlCnJ1l
	1lFD4lk42NTTkGE=; b=ydRrVdOm79rPZwxySLcwRSIewN6kPWn67Ds0G5csSlZ2
	ffwHagOT7/y3/Uzo0CfeNLmnwrb0nxXFdqdSKTVQV6DaED79tg51yKpF5gpoWgL9
	wWAuRA/PejmSYCJy1lJOG9sOys+WMpycV05gmZIwpgF21mh+8pPHqEuJweVcym2h
	XB165c/opX513UTPP0fxsyiBuuBJI4U07QvYMk1htc+PWD1uq/+MC2GSqCQMUtc/
	rdvkYHYi+dMPjj0YtTtH7dXaYe2wFQSnH2odLkVy6GnYZeIkOCnH4Mj2KNxuR5gD
	lJTXw40A3yrkv942ON7qwFtaD2R/DzeedaiTTZ3aLg==
X-ME-Sender: <xms:YEo8Yy6JJuzRFWvg40e7FjD5w38Arp3BuVqVmMvAh7pnX-ylJ7M_qA>
    <xme:YEo8Y77YBc7D74-2rbKPwjP_KoMA-pYUEuV_sWjgKX9vReuV5K-2RueD8ks5SqMG9
    5D3HAUGB5EjNZ4>
X-ME-Received: <xmr:YEo8YxdVwINENChF8XYHhyKoplGQr4tw6EBcCH9AL-IZizU0QbEz400ggwyl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiuddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
    jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:YEo8Y_JQbo0wKh5TK76KfbR94zfw_jacq8HiucNY9Y1kp37z4jNd5A>
    <xmx:YEo8Y2KnDQwpvWuhv3sNATOU9nl13SXSW-NqU_ITpK-U5UEK2wU89Q>
    <xmx:YEo8YwztcDGEXAh6ip2iOggVz2X0BPLfqA3XQ0ZEiLvZn89CuYvZZw>
    <xmx:YUo8YwxeRC6MXkTm3_IgWKo1YawchgUZQSguyIAfEJ6G6vmzXHdgHA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 4 Oct 2022 10:59:13 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Use EfiACPIReclaimMemory for ESRT
Message-ID: <YzxKXi8vPHNHKTt/@itl-email>
References: <2561c7fc38d9b4d17cb0205fec49b941894cfcc0.1664570575.git.demi@invisiblethingslab.com>
 <e42a2312-10e8-87f3-10c4-bb8e0bd765b0@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SU0GZRwYuE+QVsWi"
Content-Disposition: inline
In-Reply-To: <e42a2312-10e8-87f3-10c4-bb8e0bd765b0@suse.com>


--SU0GZRwYuE+QVsWi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 4 Oct 2022 10:59:13 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Use EfiACPIReclaimMemory for ESRT

On Tue, Oct 04, 2022 at 10:31:25AM +0200, Jan Beulich wrote:
> On 30.09.2022 23:02, Demi Marie Obenour wrote:
> > As discussed on xen-devel, using EfiRuntimeServicesData for more than is
> > absolutely necessary is a bad idea.
> > ---
> >  xen/common/efi/boot.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index db0340c8e2628314226c618dda11ede4c62fdf3b..dba23439758d1e842d267dc=
d19448e0f9113b115 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -601,11 +601,13 @@ static size_t __init get_esrt_size(const EFI_MEMO=
RY_DESCRIPTOR *desc)
> >      if ( physical_start > esrt || esrt - physical_start >=3D len )
> >          return 0;
> >      /*
> > -     * The specification requires EfiBootServicesData, but accept
> > -     * EfiRuntimeServicesData, which is a more logical choice.
> > +     * The specification requires EfiBootServicesData, but also accept
> > +     * EfiRuntimeServicesData (for compatibility) and EfiACPIReclaimMe=
mory
> > +     * (which will contain the tables after successful kexec).
>=20
> What's the compatibility concern here? We haven't released any Xen
> version yet where the table would be moved to EfiRuntimeServicesData.

Old buggy firmware.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--SU0GZRwYuE+QVsWi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmM8Sl4ACgkQsoi1X/+c
IsEICw/9FOFQ44DJnzFY2RSCLvj28touruNMgQnD0DexQJhlr/OMfn7P+xdyz1iP
idLkv5nsSUcDBLnj4aaZknvs9cpsZHwNqhFlbf2AgZZBgS/U1g6Gt982u9yFN3Km
j4t2q+dQWN8rvkyvyOwnh/zmYzhnNzqqX2COwXlWQj3GT+a4AUMLLj/vGRGj/OIt
z3uBvS6z25qMW7v6iLNcWvWuFL0aFoFq6sS/juwoQiwIWG0bJcnKbNjtkt3RpbEQ
kq119JlBNusJlKXC/1O9og1bcVUt4dUtUaxbMhPrE8MmqGPy7Upfbqw9u1VzrKvh
8njYVf6EJaJmZwr4uaN2xOAllsj412zqZ9xYSa8rW3YQhTmUVEUUwJCNyRNckmy0
xqNhss9on84AapJfmdgf/4Jn6kRIUVhy5kbqT5YPcztNNtx1imm7o+uUEZ5PKOss
0DxTaymWBG0g/MgT391FpmkY/jCQSNL+OK0JK8vA2RQhfeX3yXYfXporAkND9SOQ
AV640EjK9zdkY8NVxci8zyUcqaiqvsXVFRMCYLKv5Y67Z/5AgbqXEzWar6NxFHgu
ldnH5w3b853OglDZK3G1F2Abi6rxenUZm7KKCK2D47EtiGwa73wsPLsQMuQHx/Wt
CZtx6/MHBCr+nQuqvIEu4J7S+hm6rm6lyUdsDQxdjO7cMVNSi34=
=XR3f
-----END PGP SIGNATURE-----

--SU0GZRwYuE+QVsWi--

