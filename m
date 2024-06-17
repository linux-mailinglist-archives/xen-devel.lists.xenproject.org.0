Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBA90B3CB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 17:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742478.1149282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJE7K-0001i9-DQ; Mon, 17 Jun 2024 15:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742478.1149282; Mon, 17 Jun 2024 15:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJE7K-0001g9-Ao; Mon, 17 Jun 2024 15:17:58 +0000
Received: by outflank-mailman (input) for mailman id 742478;
 Mon, 17 Jun 2024 15:17:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Jjg=NT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sJE7J-0001g3-HV
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 15:17:57 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c51b8eaa-2cbc-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 17:17:55 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id DD23913801AB;
 Mon, 17 Jun 2024 11:17:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2024 11:17:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 11:17:53 -0400 (EDT)
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
X-Inumbo-ID: c51b8eaa-2cbc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718637473;
	 x=1718723873; bh=yPlbPgNMJs03DT8I3W/lOWEJ4QxQTYZpqWFT0Vff8lg=; b=
	K0CQjke8hL+VmmXkVytThngyxi/pzWorvxQOlIVNTLPsD37S3/u0V5IM0BI+wzxE
	5u4jQRPIKgzHq3mbM6IlnsGwUgk+Td2XaYhoZ6Id5yKkhboU+tLi8SKRZULd3uBn
	FSH7Bm3CsrxYo+kvEy/H4wh6HlfllCerhOGEabisNUEK4ze0A0Gg4afNe+h9Uzet
	gne0oq4OgZBbG/Zts+wZtaRG5Kt3tN4jyJSsgy72wwHemFzeh5YovZtkS2fqi0H3
	WF+vplz9aE0/JSS1FYUuVaZOR9d5DjPkW+BpfyszkLe/SnO7yJIyX1dexoRR1zkU
	lCey3td/z/24uvdZrknHtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718637473; x=1718723873; bh=yPlbPgNMJs03DT8I3W/lOWEJ4QxQ
	TYZpqWFT0Vff8lg=; b=BnBsSCslUjTMPLI1bHo3jikXT/RLlwfx9En6bYx6Xgar
	Mtw7G12gmiYMinOWe7Cg2N5doG1GzZU/fpH9X70kWVns38YlzbYg60uLdLDX9ARt
	4dMaD9ieO3tF/rJFD49YTROSxFjCkzG0zDsUaglphdw/kZkIcatQAjwbr7cy0qWd
	dBcC5E9Qgt3TBGm74X0+GwLw+uZI1TpHxZd8EZNlcbjiaZFr4ZH4V7q0003otu67
	d8/SgJnX1ciQR7YonGbYbwvIIBqXwezBWGthZYYKM/xpLArMMTNKxtpvm4Kmwmbx
	rxl232h4IX1pKvvcpD2UqvM+reT0QyRm4WoTsItWTA==
X-ME-Sender: <xms:oVNwZl_TorcTZ-tQFsUv3KVVW4Vlx-iN05F7kOBJgSUBT7e3dZCNEg>
    <xme:oVNwZpt1xf_-9KbGyLrYTjcU6wCcq5L9ysj84KftimguU25Do_vWX6tJoALWz5ptI
    StbPEcSuRUYW7E>
X-ME-Received: <xmr:oVNwZjCtABt1FvZx2_bSSSS6ePotD3hoa6THHnerrdPGc-fTjAQeYqf56I4CT5PwVEgM1fGebTSB5u5NSJsSmJn-AXjTtT1lKwb1CXlEV-tXwtSn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:oVNwZpdJBqh_ueBbupbsSftJ5q5nNL_WU0nGdj19AdSI2v5mqKWgAg>
    <xmx:oVNwZqPDQjaQcq1uZlZ0lgZZW6bO-ey6St_ZGv-Y13b83_jTelQmaA>
    <xmx:oVNwZrlaXEu37l_NBKkzKMzcX6_EmEv23GItfjXytjHujCu1khujDw>
    <xmx:oVNwZkto_pJNovQFZvil9DXoaErdFC-2OOeJvnC11alaHOUB6bHkEw>
    <xmx:oVNwZmDOd_hbjiFHYr8ZMVM_8YvDCBI6tdvAQOD5E0z624NKaYiVa9pj>
Feedback-ID: iac594737:Fastmail
Date: Mon, 17 Jun 2024 11:17:49 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnBTn6FXXOpnBJCb@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <Zmxze4a0PZbwcLSb@itl-email>
 <10c2ab19-e2b7-4f5f-ae73-213e0194bb8e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EfeTc80EU04X+O6P"
Content-Disposition: inline
In-Reply-To: <10c2ab19-e2b7-4f5f-ae73-213e0194bb8e@suse.com>


--EfeTc80EU04X+O6P
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2024 11:17:49 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Mon, Jun 17, 2024 at 11:07:54AM +0200, Jan Beulich wrote:
> On 14.06.2024 18:44, Demi Marie Obenour wrote:
> > On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
> >> On 14.06.2024 09:21, Roger Pau Monn=C3=A9 wrote:
> >>> I'm not sure it's possible to ensure that when using system RAM such
> >>> memory comes from the guest rather than the host, as it would likely
> >>> require some very intrusive hooks into the kernel logic, and
> >>> negotiation with the guest to allocate the requested amount of
> >>> memory and hand it over to dom0.  If the maximum size of the buffer is
> >>> known in advance maybe dom0 can negotiate with the guest to allocate
> >>> such a region and grant it access to dom0 at driver attachment time.
> >>
> >> Besides the thought of transiently converting RAM to kind-of-MMIO, this
> >> makes me think of another possible option: Could Dom0 transfer ownersh=
ip
> >> of the RAM that wants mapping in the guest (remotely resembling
> >> grant-transfer)? Would require the guest to have ballooned down enough
> >> first, of course. (In both cases it would certainly need working out h=
ow
> >> the conversion / transfer back could be made work safely and reasonably
> >> cleanly.)
> >=20
> > The kernel driver needs to be able to reclaim the memory at any time.
> > My understanding is that this is used to migrate memory between VRAM and
> > system RAM.  It might also be used for other purposes.
>=20
> Except: How would the kernel driver reclaim the memory when it's mapped
> by a DomU?

The Xen driver in dom0 will register for MMU notifier callbacks.  When
the kernel driver reclaims the memory, the Xen driver will be notified,
and it will issue a hypercall that tells Xen to remove the memory from
the DomU's address space.  Subsequent accesses to the pages will trigger
a stage 2 translation fault that is handled by an IOREQ server.

For I/O memory, this is already possible via XEN_DOMCTL_memory_mapping.
The proposal in this thread is to make this possible for system RAM as
well.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--EfeTc80EU04X+O6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZwU58ACgkQsoi1X/+c
IsFyWw/+MVUOg5Pgcoj7IjWV75JBiahd5+5pydvIzMIYqjltliXGd5FfltJvTzOQ
gTMRFKkcaHWmthtxKpFHZNCV4VDfCytFTgunMDTpTZdd4iACs2o/SUwzn94axDsm
OKLFV0pVIvySD2+QTIe5SZz7rrIoU4VU4xmV9jIsyHERv0CnWXfbKoY7dkwrALqn
GAdmv9DazkEL4/o4r/eg0nDQHVefFW7Qrlbpd2Vf4jH0SGtRYgM2ib5Di1u80gJ/
jyiHl9YP7VnYj7HXKUHhSeNyPAFKZ+juMnFdmTXbRUusiG5lLYB/J8R9NFiNGZiZ
Tgq4WU4KJ0X39pj8ENdv32/7yYsuUNogn6CuTTTP/ZmYK7WCMhcSwAhBrOt/XlFU
8bMMaewxigQMPZTXx+y5Un2t52tJNDpo582zj6d0VhgARUfQh6IyWPgFq/sWbYiw
+VSnIM1bnckUZBxhpwkRokpnhl1B+mgwbwCZs8w5saTntVfkslyGGPlh+ui2oCzg
G4/nJe35XNLeD0ixr9PuST+x2C87Zddgf7Z0N899ROfVdYSKoLgz3DiR4SZPouYN
1YZPTguL2rP/nDRwoTLdeKAGC7P2XXQarcMqAMY9Xk4kEElhQyoMCZOJfv76Id4d
vgxDioN1YTOsiBLBaNosfbK33MYQdvmI1aS2ztrdePQwEJtE+LQ=
=B4uy
-----END PGP SIGNATURE-----

--EfeTc80EU04X+O6P--

