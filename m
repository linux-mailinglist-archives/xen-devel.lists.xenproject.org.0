Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5B5EA669
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411768.654823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnSH-0006PS-PX; Mon, 26 Sep 2022 12:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411768.654823; Mon, 26 Sep 2022 12:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnSH-0006MX-MB; Mon, 26 Sep 2022 12:43:25 +0000
Received: by outflank-mailman (input) for mailman id 411768;
 Mon, 26 Sep 2022 12:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAtp=Z5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ocnSG-0006MR-OY
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:43:25 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdbc55b3-3d98-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 14:43:22 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 10D375C015E;
 Mon, 26 Sep 2022 08:43:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 08:43:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 08:43:19 -0400 (EDT)
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
X-Inumbo-ID: cdbc55b3-3d98-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664196201; x=
	1664282601; bh=KIR5QYmEwy2lMpE/E+p51faebZ9xP7wCKJJXb56V4n0=; b=j
	whfoUwcIlpgg5BPeu2tEd7tFzXwRnyvji8IAerC7nQOMQjOtmvMIW/xwIMt6JNlZ
	8HUstie9biBiBJxOoYBy4kuTFpaZRwVZ5fqNG/V2GAQZMcRSg0aHqjE72S3DAahn
	lrEHsA/YV1zI4sMikOOiI1Ce0p3FI3PDUmAQoC7BFQ2w6WEHhK28KnvufW0UxImE
	w+us0xLE77APDL7HTODvOcLqq33hXfH7G9KAI04pxdvDOCStyesI4fOEwA4b0VUa
	EEg5+u6rofGOhQVVijRpSOgrzlbV6YvIs0YbjHOf/L5TRzhz3OW63j5Wuj4+DhCk
	WoSSgZdTVLM2U6z26s2GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664196201; x=1664282601; bh=KIR5QYmEwy2lMpE/E+p51faebZ9x
	P7wCKJJXb56V4n0=; b=MtSZBYNvUP090PlxGQQJRrAhvr3YMAr8X0ahl7BKwL26
	Rmu2hTQatf/E75SiBK0cFfg3kXqwCeg6IHrwFF0u6JvjX2MVxcnpMsktL6xe7B3U
	rf5lYI8m7AjO/qOg3FK5nVkznzbGDgoqCvV26KJ4+T1kpAEceim7S+NjPRpfpWxj
	4Cv3yuRBcLUterxqU2jMJK/RENcOhVyFuMgYxm56qxHCrEWxhXl7SsLqDjduA4qa
	D2aWa9ccvVudD3555ksskwQm+JADHx4flkEYzKI416vga5OSQxDG0EWchHdQsIe1
	ABATKVIMxoaL60ZMWkOAJm+R7svI8m6XtQpvg1l+Zg==
X-ME-Sender: <xms:aJ4xY9ltKbPHHDrWJo9f3aDp72dkdgOOG2xm1JbZqSxT9h7sg5T0PQ>
    <xme:aJ4xY43XVjtW0QHvqsH6pFpWNCepAJ-KXY0bSZygnrsxfgLVDzoWVKX4TgD_k6qBK
    fBKQyWttvJL1Q>
X-ME-Received: <xmr:aJ4xYzrN_jyTH1u1sfJTYp9P3BYPfqRZrS_5OpuNCIrofo681A5O97fiNJEfx92S-SdLcbqgJ9QW3XI9aFhDTR0l3WQ2wmQfjgct>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:aJ4xY9npOqdV28UlMFuo_ZvmuEPY3CoyfWEp04ptvG96W0Tg6WzICA>
    <xmx:aJ4xY71LfiBAHxrHHEKPpzhs2q4JfIhHuRLGIWaG-lAItA4zH0OuqQ>
    <xmx:aJ4xY8up9IaQ1H21AGKxjnflazKmBkxDcfiVfybgjsHQnvXY3TxDTg>
    <xmx:aZ4xY5AzbrNAJYOmxsnnDK3XH3KZSG_P6SOWTzat3AY2JqftFlVK9w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 26 Sep 2022 14:43:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
Message-ID: <YzGeY8L6Op7n8pip@mail-itl>
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
 <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tblz3W1c0w5A16Ov"
Content-Disposition: inline
In-Reply-To: <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com>


--tblz3W1c0w5A16Ov
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Sep 2022 14:43:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes

On Thu, Sep 22, 2022 at 08:00:00PM +0200, Jan Beulich wrote:
> On 22.09.2022 18:05, Anthony PERARD wrote:
> > WARNING: Notes missing at the beginning of the meeting.
> >=20
> > session description:
> >> Currently a HVM with PCI passthrough and Qemu Linux stubdomain doesn=
=E2=80=99t
> >> support MSI-X. For the device to (partially) work, Qemu needs a patch =
masking
> >> MSI-X from the PCI config space. Some drivers are not happy about that=
, which
> >> is understandable (device natively supports MSI-X, so fallback path are
> >> rarely tested).
> >>
> >> This is mostly (?) about qemu accessing /dev/mem directly (here:
> >> https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579) - l=
ets
> >> discuss alternative interface that stubdomain could use.
> >=20
> >=20
> >=20
> > when qemu forward interrupt,
> >     for correct mask bit, it read physical mask bit.
> >     an hypercall would make sense.
> >     -> benefit, mask bit in hardware will be what hypervisor desire, an=
d device model desire.
> >     from guest point of view, interrupt should be unmask.
> >=20
> > interrupt request are first forwarded to qemu, so xen have to do some p=
ost processing once request comes back from qemu.
> >     it's weird..
> >=20
> > someone should have a look, and rationalize this weird path.
> >=20
> > Xen tries to not forward everything to qemu.
> >=20
> > why don't we do that in xen.
> >     there's already code in xen for that.
>=20
> So what I didn't pay enough attention to when talking was that the
> completion logic in Xen is for writes only. Maybe something similar
> can be had for reads as well, but that's to be checked ...

I spent some time trying to follow that part of qemu, and I think it
reads vector control only on the write path, to keep some bits
unchanged, and also detect whether Xen masked it behind qemu's back.
My understanding is, since 484d7c852e "x86/MSI-X: track host and guest
mask-all requests separately" it is unnecessary, because Xen will
remember guest's intention, so qemu can simply use its own internal
state and act on that (guest writes will go through qemu, so it should
have up to date view from guest's point of view).

As for PBA access, it is read by qemu only to pass it to the guest. I'm
not sure whether qemu should use hypercall to retrieve it, or maybe
Xen should fixup value itself on the read path.

I did some preliminary patch here:
https://github.com/marmarek/qubes-vmm-xen-stubdom-linux/commit/80cf769f3659=
aa0d7f2b5598bf862d83da28807e

but it does not work yet. It seems I haven't undo MSI-X hiding enough
(lspci inside the guest doesn't report MSI-X at all). This I will figure
out, but I'd appreciate comments about how to handle PBA best.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tblz3W1c0w5A16Ov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMxnmQACgkQ24/THMrX
1yzJJgf/a8eiO9zWA4rh/jv88D6INjYJb0prUTxlHbKyaxsw2iAE6YNkHNZE6atQ
wnVbW2r+PAPVH6DUC8NeIYPG1p0UpXHrayOddtqfd0GqPTxpMMFG9B3zLGgUnA6k
1h9aaC7mD1vg60t9V1nbNJUfklogEoR+TsI+O3xWafMiRQQDV2rgmtLq3HsFwkpX
zSEh1d5cIpdz7+gFojgNC9t7iTYuTmDrUfjGiH704boBN6Px6xh4LLooXY/YjOIy
UvscA2ymOdJdB/d8usiBIOxUIsys0olk/2yIPQc/EFiGuY6rISvf7PTD5zq0/sDj
nfWsMRIimtTPr+Q2s0735yo/uLASdg==
=fXUO
-----END PGP SIGNATURE-----

--tblz3W1c0w5A16Ov--

