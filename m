Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A756D3C64
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 06:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517303.802436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjBhq-0004zp-7c; Mon, 03 Apr 2023 04:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517303.802436; Mon, 03 Apr 2023 04:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjBhq-0004wS-4e; Mon, 03 Apr 2023 04:22:10 +0000
Received: by outflank-mailman (input) for mailman id 517303;
 Mon, 03 Apr 2023 04:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhnu=72=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pjBho-0004wL-Vv
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 04:22:09 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14bb3ad6-d1d7-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 06:22:05 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 27AE95C0092;
 Mon,  3 Apr 2023 00:22:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 03 Apr 2023 00:22:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Apr 2023 00:21:59 -0400 (EDT)
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
X-Inumbo-ID: 14bb3ad6-d1d7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680495721; x=1680582121; bh=1gwzkrabqfP4SsGBsML6M961/r3JQJiJG2e
	NmXnX7VU=; b=nrtW0pt1TMXD9x28v4nCVj/tJTS5U0fl0q7fBuWrt/lvz/zXPHI
	2XkCaHMYhO0Wq7KPy67u8uTsOxiyFp9nO8WYsvx88ADhzAXQg5CahaEFaiP7M2Kd
	6Hc0gXsKSAwq2QKKiSm/AI+big7PYsnsMnpCh5ak0C92NqhtDhmZBve2MQ5l0XZ/
	pOFVvFw1z0/2hKXyABT9m2d73dFALCIdKwWkXmKVZhu9oPWghHJ3kUODuj74fG55
	fqY0UcuF5TI9wHhdNXi92SZA8EhkLKQiQOFjqshw8gjGCqFzyLEX/ufTJT+bGRC3
	ioyNkVbWu1VCaIAvOwjjM5XrAneAMaGWrhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680495721; x=1680582121; bh=1gwzkrabqfP4S
	sGBsML6M961/r3JQJiJG2eNmXnX7VU=; b=aV6O5NGj48VocE/YyaJ2CwDB8/bcr
	Wy6SkEaJXXiqCGWrcyANGHNPgh/ZQgTTqAGe1vC8Fwdu0aPOrcX5L5YYsDiafBRz
	rStVAdUMgAUxI4dRBU4DiQXkWhMT2pwYWcX8QPjuEAVuD4AcnxCXmIQ9S1YGQwKk
	gU5/PSioO4mmDN01CgX0hA8qqlY+aWWtrbe0P2mDtzKWt0JfN4XqoZyeH1LOUj5N
	4bCo9w7UUtgrg1rD5HkeKj+5mcjB92hDmZlZB+f5cFxqGFWvCKdujBWGIVpUrl/O
	VeiCv8YLAFpeXRLiUrBOuvFCP1wZqmjhuqHO5Kn2Nzo3RuvSD2rJACgJw==
X-ME-Sender: <xms:aFQqZPP7CdbjUKNyZMCUpJ3P39BryApmWK0yJi5XILeJFSISyyUtdg>
    <xme:aFQqZJ-0lmBCaJvgzlVjgIJFvYHb_Ipv5xF1cTO2yCwAYmPvw0bkfW-TdE52z3HuL
    IBIGhP1bxbULg>
X-ME-Received: <xmr:aFQqZOQZZuIcgcE6_8c4emub8xYpbbs2jPq8AauTklSPJohudewAP_-KbaVfwgqwaMAXBL4sbSBTNX8oo8rCbaOECojh9YRY4xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiiedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:aFQqZDtKz_vrM44o4LRie6U05VUnfMVJCoHLuhB3tO3IXTP2lzlqnw>
    <xmx:aFQqZHdhm0ihGetD5z3CMjcOg4Z-ly1N4VMdtDFuCk5ngqX3flDTyA>
    <xmx:aFQqZP0FVBDaSwtIUYtWH5-PPgZjysFPe0i2gIl2zNc8hDNwpnp5ow>
    <xmx:aVQqZD5OxjCeuoTl4mEczbpDKaWDMGn5gHWYj2ciJFkAuEK-1MVnYg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 3 Apr 2023 06:21:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Message-ID: <ZCpUZI6HmzYKDhAz@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger>
 <ZCLX1qD/FmbF5ulu@mail-itl>
 <540906f7-4543-9d01-2b2b-a3bd70eda74b@suse.com>
 <ZCLjGhbzGD2jykT9@mail-itl>
 <9eb7b538-4074-4b15-4ea2-67d9cc0bf85d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sx4KoBD4ntkktgRN"
Content-Disposition: inline
In-Reply-To: <9eb7b538-4074-4b15-4ea2-67d9cc0bf85d@suse.com>


--Sx4KoBD4ntkktgRN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 3 Apr 2023 06:21:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table

On Tue, Mar 28, 2023 at 03:03:17PM +0200, Jan Beulich wrote:
> On 28.03.2023 14:52, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Mar 28, 2023 at 02:34:23PM +0200, Jan Beulich wrote:
> >> On 28.03.2023 14:05, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Tue, Mar 28, 2023 at 01:28:44PM +0200, Roger Pau Monn=C3=A9 wrote:
> >>>> On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-G=C3=B3=
recki wrote:
> >>>>> +static bool cf_check msixtbl_page_accept(
> >>>>> +        const struct hvm_io_handler *handler, const ioreq_t *r)
> >>>>> +{
> >>>>> +    ASSERT(r->type =3D=3D IOREQ_TYPE_COPY);
> >>>>> +
> >>>>> +    return msixtbl_page_handler_get_hwaddr(
> >>>>> +            current->domain, r->addr, r->dir =3D=3D IOREQ_WRITE);
> >>>>
> >>>> I think you want to accept it also if it's a write to the PBA, and
> >>>> just drop it.  You should always pass write=3Dfalse and then drop it=
 in
> >>>> msixtbl_page_write() if it falls in the PBA region (but still return
> >>>> X86EMUL_OKAY).
> >>>
> >>> I don't want to interfere with msixtbl_mmio_page_ops, this handler is
> >>> only about accesses not hitting actual MSI-X structures.
> >>
> >> In his functionally similar vPCI change I did ask Roger to handle the
> >> "extra" space right from the same handlers. Maybe that's going to be
> >> best here, too.
> >=20
> > I have considered this option, but msixtbl_range() is already quite
> > complex, adding yet another case there won't make it easier to follow.
>=20
> Do you care about the case of msixtbl_addr_to_desc() returning NULL at
> all for the purpose you have?=20

IIUC I care specifically about this case.

> Like in Roger's patch I'd assume
> msixtbl_find_entry() needs extending what ranges it accepts; if need
> be another parameter may be added to cover cases where the extended
> coverage isn't wanted.
>
> > I mean, technically I can probably merge those two handlers together,
> > but I don't think it will result in nicer code. Especially since the
> > general direction is to abandon split of MSI-X table access handling
> > between Xen and QEMU and go with just QEMU doing it, hopefully at some
> > point not needing msixtbl_mmio_ops anymore (but still needing the one
> > for adjacent accesses).
>=20
> Hmm, at this point I'm not convinced of this plan. Instead I was hoping
> that once vPCI properly supports PVH DomU-s, we may also be able to make
> use of it for HVM, delegating less to qemu rather than more.

In that case, this code won't be needed anymore, which will also make
this handler unnecessary.

Anyway, I tried to merge this handling into existing handlers and the
resulting patch is slightly bigger, so it doesn't seem to avoid any
duplication. The only benefit I can think of is avoiding iterating
msixtbl_list twice (for respective accept callbacks) on each access. Is
it worth a bit more complicated handlers?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Sx4KoBD4ntkktgRN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQqVGQACgkQ24/THMrX
1ywJRAf/XIkiO20k0CXZsGxJ23AOQC91NVznTfOfXKg0aH+JjhwdUVKFQ2MCPQPF
sC2oziwPlxHDDGg6i/dY3Il63mRNYTiDZ9t/i1UF1lwWp3IVRv90fTUyeNnjtjYP
VCeYi5Ht1TE0wYN19MHb7A+6rvG33ZRFGiWxMF/IKMYR+uA3FwH6UYhTTRk5RflA
hujDod7MiRgRCrD3YDBH8bffDxj+Atq/eFaySaQ+WbbaRD0HegT0h83nHfWkvvTz
xjlr7lK38vTwr+6zVuRur0EE0IEl+dJO67UogTo0H1uf8DWJeY7QelHh2swV5YvX
OQVbWBoerAdPBoBA5ILi/SWWEfozKw==
=IgLb
-----END PGP SIGNATURE-----

--Sx4KoBD4ntkktgRN--

