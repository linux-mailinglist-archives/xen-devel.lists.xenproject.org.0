Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EEC6B87D8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 02:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509413.785120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtkl-0001nk-FU; Tue, 14 Mar 2023 01:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509413.785120; Tue, 14 Mar 2023 01:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtkl-0001lX-Aw; Tue, 14 Mar 2023 01:47:03 +0000
Received: by outflank-mailman (input) for mailman id 509413;
 Tue, 14 Mar 2023 01:47:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bd48=7G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pbtkk-0001lR-Aj
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 01:47:02 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc1dd16-c20a-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 02:47:00 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7850132007BE;
 Mon, 13 Mar 2023 21:46:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Mar 2023 21:46:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Mar 2023 21:46:55 -0400 (EDT)
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
X-Inumbo-ID: 1bc1dd16-c20a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678758417; x=1678844817; bh=sdN3ubd8XXeoBvxHSr4ZKoOrKgatKvDPZDO
	Y1tA7E3Y=; b=UNcRtgKAvyb8Sf7nqfHXLkboJ0PnS3hn1aVZICG1hbgsiN9ZUYp
	JU5RGukKD6Tbct57qg8gBWPfUqR4FL6UyH3qa1dVG6T3iTDyoAYeZgK8ue/4vTLM
	Kr2SaqOHsIxtcHXGCff3XaNktUug54i3UPnAPJFJwxssRmnxvbMEen09blo0CBLX
	XvbPhcNQFOcO8jjIGuuq7IvReod5IZ5hR+4Kaw+f8a9biVfCM//38RcvsvL78lio
	66YJMPpMiVNMvvO6joF/haJceY1gObhLmyYSCGsjPOqlZACcvfIruu8ZfV5bIJBn
	f0CkeFdHHOKayhYkFMvz3E/e1f/QXZSyYmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678758417; x=1678844817; bh=sdN3ubd8XXeoB
	vxHSr4ZKoOrKgatKvDPZDOY1tA7E3Y=; b=ceOn9WlnNNeeJ1FGAjVqkAGip3rMc
	jqrWbAk2URgxeBRubU1+4MeJwnOaCjWwk/R9qlYGMTOXlu5JN1TzrFfOgMgpApJc
	sp7Pb18zM4m4G7L2BpWhCZmxY3a6fdX6O5HJrG4gwEQvoS2xQB5pYeFHo6UgH++1
	salGZYlGDVQjZqpA9Sn7YjMMp6OFh5B3LZx6U0jIkCeqbRNpEUBtUZ63X6qGeMb1
	oakAG83D2E0zVbaLqneoTaFlQQ0tiUOrggHRmvhYRQPVj3DdhZtcOZb0W+b53HC0
	dWmr4iKZ8ctLJB0k/oFRM0RKQ0xAeVnAePbarjpdpwnc0XUOq1MpQXKPQ==
X-ME-Sender: <xms:ENIPZGGwVNGO_x4JHrOlolupDloYhJOWfGnCXDkOS-T7UPnLOJvqtQ>
    <xme:ENIPZHVb6DaxlXc5rUzUCszmpbq2iGZqajXIus0zqqbfJcTZ9rWj5RYd-BsK82k97
    5guEe5k5X6WIA>
X-ME-Received: <xmr:ENIPZAJnVuDHZCB2eyc2vFbUnk0MlLkchJx2_Qb4Bhh9OPF8ztvP2lgQVEzcDJ_VNuWEfMG9n6z6JE6UvJ8DUjM2jADDR9TU7lI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvhedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeefgeeufeffhfdttdejueffjeelvdeuleduhfetieevvdekgf
    fgfeetveehuefgheenucffohhmrghinheplhgushdrshgsnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ENIPZAEUERxQMD4udSSbY3PZXapRjRnji2woh3U3eUkzv7AuZQBSxw>
    <xmx:ENIPZMUubtYnyl423yT6C4oBTs1aaY03ZGaPdPUeIskhlFjRidnvJQ>
    <xmx:ENIPZDOEcb-rP9CAGL8fWyGETAPU1VV-h2V34tI9U02Rn_XNBlsi_Q>
    <xmx:EdIPZJhvhO34dpALlJT2fYDKN7q9atRcabT1jRw558aryjnhuVap4w>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 14 Mar 2023 02:46:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Drop ELF notes from non-EFI binary too
Message-ID: <ZA/SDWh5NwrvBJeb@mail-itl>
References: <20230225235642.38880-1-marmarek@invisiblethingslab.com>
 <9fbbfa17-821f-8c9e-376e-911481a1988b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fgTykhQuGKieiR9q"
Content-Disposition: inline
In-Reply-To: <9fbbfa17-821f-8c9e-376e-911481a1988b@suse.com>


--fgTykhQuGKieiR9q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Mar 2023 02:46:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Drop ELF notes from non-EFI binary too

On Mon, Feb 27, 2023 at 11:28:28AM +0100, Jan Beulich wrote:
> On 26.02.2023 00:56, Marek Marczykowski-G=C3=B3recki wrote:
> > The ELF is repacked from from 64bit to 32bit. With CET-related notes,
> > which use 64bit fields, this results in 32bit binary with corrupted
> > notes. Drop them all (except build-id and PVH note retained
> > explicitly).
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>=20
> Perhaps a misunderstanding: Yes, I did suggest this as a possibility,
> but I didn't really mean we actually do so. At the very least not
> without further clarifying what the cons of doing so are. The notes,
> after all, are actually valid in xen-syms; they become bogus in the
> course of mkelf32's processing.
>=20
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -192,13 +192,6 @@ SECTIONS
> >  #endif
> >  #endif
> > =20
> > -#ifndef EFI
> > -  /* Retain these just for the purpose of possible analysis tools. */
> > -  DECL_SECTION(.note) {
> > -       *(.note.*)
> > -  } PHDR(note) PHDR(text)
> > -#endif
> > -
> >    _erodata =3D .;
> > =20
> >    . =3D ALIGN(SECTION_ALIGN);
>=20
> Is this sufficient? .note.* isn't part of DISCARD_SECTIONS except for
> xen.efi. I would expect it needs to move there from DISCARD_EFI_SECTIONS.
> Otherwise, aiui, the linker's orphan section placement will kick in.=20

What supposedly happens then? By looking at binary produced with this
patch, I don't see other .note sections included.

> Yet
> at that point you'd also affect Arm and RISC-V (which, interestingly,
> don't place .note.* anywhere at all right now, afaics).

That's interesting observation. For RISC-V, I'm not surprised given how
fresh it is in tree, but if Arm doesn't need it either, maybe adding to
DISCARD_SECTIONS isn't such a bad idea?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fgTykhQuGKieiR9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQP0g0ACgkQ24/THMrX
1yynBQgAizxvjFdEeaVGY8pwmLDpMnpIA5cfXaOt33s0X8/Fn0aJ4u5pwACNCJry
1nnyKSIShp4K98oEIGtIMKK+KtVZyapWPunyBspMAX+6QhGv2kEmTpDRY3diUbkw
pB7YWNQlnTcV7dKklPQDy9v2Nv3zkIT2xvAwa2x5sZhYDL8Mlres9t4nfyPOYLrI
T4MPUadQOU5yLYw6KAIKz7iXKEmLZxY6v9/4yh7z3qL0joU3TfIL/Adkp2oI//x2
eo9TpCe0dpH3efJO3VD4n9PSB0wOH/TaDOwH+E+weoGPq3OZY7l5A4Vkg+/cgL7Y
N6OF+5uaX3b04h1cjrA09XaQyu/UIw==
=LQmI
-----END PGP SIGNATURE-----

--fgTykhQuGKieiR9q--

