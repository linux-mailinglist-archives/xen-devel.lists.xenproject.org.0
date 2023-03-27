Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E396CA156
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515137.797717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgk3L-0000wT-Av; Mon, 27 Mar 2023 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515137.797717; Mon, 27 Mar 2023 10:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgk3L-0000uC-77; Mon, 27 Mar 2023 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 515137;
 Mon, 27 Mar 2023 10:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSZI=7T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgk3J-0000u4-ER
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:26:13 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca585ec3-cc89-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 12:26:10 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AC545C0150;
 Mon, 27 Mar 2023 06:26:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 27 Mar 2023 06:26:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 06:26:07 -0400 (EDT)
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
X-Inumbo-ID: ca585ec3-cc89-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679912769; x=1679999169; bh=dCq3bd7ay+CmXuX/X23yMNYhA8xOyi5CwWG
	OHjp0xGE=; b=djiTLeU0EKlVomoVkiKwqQCc8fdaw+A7UbqcHQCWq3rPxpZMDzO
	1iZkVgo3jhhEMbu1Ahw2o6Eg2a6lmER3g1S+hvMc761sJKlmD3OWYijLGYOK+/k0
	ZluZrqalqDjGpajs7nTjLtDWfM/eltWFqMX9r9QlxgetJxd3dZERDSUmD/bP62tN
	lQTqNKRA1p9ZQJQ8tvGj9ORTGtbQ1zilRDRuU10I3rs/K/By7iT9x5lPaof2B3Bf
	9va1oDsrb85AGHnFJDhfyVwKZ05nnJGl/xW8nbo2aU9owW0v5fGflnquNpr0isC4
	tFOByrH6zilfMiQEh1HJ+tE6dxZY8+59P+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679912769; x=1679999169; bh=dCq3bd7ay+CmX
	uX/X23yMNYhA8xOyi5CwWGOHjp0xGE=; b=nqfsi+Mangv4i77JLXKiBHXNfmPy2
	Yv1nNZmtYJbQfC7PiyvT0eMJy273pRT1f83kQ5Fd9v+DnFIZyUVGQUqhES1hOhx5
	J0hKE5CcCNkrS47Wz9VQEQfMzBS8iSGwI/JsqNdZQvk6ZsrPlwT3Vx4gUAU5WWPU
	+2TDhRFm824pyahOjr2H2V0+ET+Xd4p7tAVGvgMKuYr7KCIYYULSVM7VaOU5Ug4r
	pWDXll7IFaxA7U+ls29jq3nKwwjzo9TZs4SAgTlpN9+ixbDWbnnAPsvbmrsYmz8Z
	ctgtRUsl8OPsFQrqKr0fXO2A+JsrMOkSs8TipZyou5PflCf4MxiU4IgSQ==
X-ME-Sender: <xms:QW8hZNnCj5QnNKY7lCVtSXj00ufSQd2OuJJouiQ1mFh_0f8gPayG_w>
    <xme:QW8hZI0IR4CfzLUeAEpY_tNP0GmogsLEwcsKM3fknDEakhXk0JD8_fimKTOtrMy24
    o7eQV_YOQls7g>
X-ME-Received: <xmr:QW8hZDqqSY-9_mOYC9WmjW056RP3rKoQUQI77Rd0kDl7BkT_cmtgiwgpMkm9yArqHyKf5k17pqGPjeKOQttdiyKbs2XaP6a1vwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:QW8hZNkCqa9W53nFsNTI7W3n1AK8E1ILHJZb-qLNKqsldSi7fpqk1g>
    <xmx:QW8hZL3w1K1DfB9_1sLfM-QbowZWRoCZ9XH1ShlcdicnszWT5ztIsQ>
    <xmx:QW8hZMvqFqms02zwNZBBnSVntKuvu7LxGM59oTMGQgc3xhUFYrrTOw>
    <xmx:QW8hZMy-x_HmDAOMeQeR0QsVFQ8AzEq9nnmg03-iDFR7uvjfBj7l1Q>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 27 Mar 2023 12:26:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCFvPTpOixe582JU@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CQVVwtIR+/YKQkBt"
Content-Disposition: inline
In-Reply-To: <ZCFsDbKfGvn7giN+@Air-de-Roger>


--CQVVwtIR+/YKQkBt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Mar 2023 12:26:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model

On Mon, Mar 27, 2023 at 12:12:29PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > QEMU needs to know whether clearing maskbit of a vector is really
> > clearing, or was already cleared before. Currently Xen sends only
> > clearing that bit to the device model, but not setting it, so QEMU
> > cannot detect it. Because of that, QEMU is working this around by
> > checking via /dev/mem, but that isn't the proper approach.
> >=20
> > Give all necessary information to QEMU by passing all ctrl writes,
> > including masking a vector. This does include forwarding also writes
> > that did not change the value, but as tested on both Linux (6.1.12) and
> > Windows (10 pro), they don't do excessive writes of unchanged values
> > (Windows seems to clear maskbit in some cases twice, but not more).
>=20
> Since we passthrough all the accesses to the device model, is the
> handling in Xen still required?  It might be worth to also expose any
> interfaces needed to the device model so all the functionality done by
> the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
> passing the accesses anyway.

This was discussed on v1 already. Such QEMU would need to be able to do
the actual write. If it's running in stubdomain, it would hit the exact
issue again (page mapped R/O to it). In fact, that might be an issue for
dom0 too (I haven't checked).
I guess that could use my subpage RO feature I just posted then, but it
would still mean intercepting the write twice (not a performance issue
really here, but rather convoluted handling in total).

> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > v2:
> >  - passthrough quad writes to emulator too (Jan)
> >  - (ab)use len=3D=3D0 for write len=3D4 completion (Jan), but add descr=
iptive
> >    #define for this magic value
> >=20
> > This behavior change needs to be surfaced to the device model somehow,
> > so it knows whether it can rely on it. I'm open for suggestions.
>=20
> Maybe exposed in XEN_DMOP_get_ioreq_server_info?
>=20
> But I wonder whether it shouldn't be the other way arround, the device
> model tells Xen it doesn't need to handle any MSI-X accesses because
> QEMU will take care of it, likely using a new flag in
> XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
> part of the gflags, but then we would need to assert that the flag is
> passed for all MSI-X interrupts bound from that device to the same
> domain.

Is is safe thing to do? I mean, doesn't Xen need to guard access to
MSI-X configuration to assure its safety, especially if no interrupt
remapping is there? It probably doesn't matter for qemu in dom0 case,
but both with deprivileged qemu and stubdom, it might matter.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CQVVwtIR+/YKQkBt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQhbz0ACgkQ24/THMrX
1yyMDwf/Vr2UQInQC08UT4ySnYuyR7BC2Z+qD6nI5cmM+h5c4vvBlnYvhPGOl5Lt
dqSTdPZ4chC93zsGeJaiRRLJqg1gGsO3UbR5VOaCIgTnmCK6C7l8mHWlB2L3uftu
7KfMvDsifBB+MtAFjEagSxd+rZExoJEM7/mn4PGmmr4qjW9xQF24x3+aQzyeLSBO
AR4TAuK/1Kw+G37SCwER8eO3i25cHh0/iO/ZrUYGwpHOMCVk5k+zmhOMVtq0pNw/
wFNUGVgqrkq9qIQ5GTL9+MjPyCHEC39jk4xY8BVd23o7s5THrh5abuhh94yWbP1z
hzkd6Fppy3Mb2qUaMvLOsTK9g5PCUA==
=HNIl
-----END PGP SIGNATURE-----

--CQVVwtIR+/YKQkBt--

