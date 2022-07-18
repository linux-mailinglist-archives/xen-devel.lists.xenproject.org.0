Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90665782B1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 14:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369761.601251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQAh-00087I-Ua; Mon, 18 Jul 2022 12:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369761.601251; Mon, 18 Jul 2022 12:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQAh-00083o-Ra; Mon, 18 Jul 2022 12:48:23 +0000
Received: by outflank-mailman (input) for mailman id 369761;
 Mon, 18 Jul 2022 12:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oDQAf-00083f-RD
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 12:48:22 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e602080e-0697-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 14:48:19 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B7295C00BE;
 Mon, 18 Jul 2022 08:48:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 18 Jul 2022 08:48:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 08:48:16 -0400 (EDT)
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
X-Inumbo-ID: e602080e-0697-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658148498; x=
	1658234898; bh=DBFwPKoZxjSozrATGHwXwmbzF+uzjtHJ3thc9bRxCR8=; b=a
	JiqYfxjKiJz0I9bh9zUTTUYUk1+GN+U3TiS/na2QDIt4XugTLo+W7hTJlMfXCp3Q
	nzKh0bCqTj1ozUzjTwUj0GozBgXSV2Jla9nQQQcSC8ixLC7aMUatXr9DjNgDbJKm
	Gref9f7gGm2SMvzjxekK0EKEXX8OjHw+LKCdGovNxv0jrCnqbOlo57pohcKV0Xrb
	cP7gzbAjKrOgIO831fmG1hSYxtXdLMBkzg01cZOxRX9PFYpdThsm+BQQr1w2UjTE
	ux7sYFvgkKYQF1YBboTwDq9Fv567eVv7sl42BeGu5V86YWY2INFrm1KyjCoBP1XE
	CEMJjJruY8CGnfLsggFzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658148498; x=1658234898; bh=DBFwPKoZxjSozrATGHwXwmbzF+uz
	jtHJ3thc9bRxCR8=; b=X8Z7X+PTdlzev2O/YTj1862oJDgBG/vjFMMLeZHq5lhs
	tozMRZJAcAE5knEHPcM2gu8crYUevn6qkeQ1jvnaw5YiGfOB+H5DL7TKL8sLYACa
	SbkG3JGf7Dwb/NpAyS6dkaUpZSxgTXjCVtj8T4/1fyL9n5FGEvRDNj23AuHsOWOP
	sA4nfCAyEExbF1ZeIEPyMRRdwA51KpehoaPiIhlSL2eHfdDGCK/SWNTOps100tba
	v/1+Wpycmy5zx3qcsM35Sb7zNxJUB2pCFbCGdzS3qkZCoFtrLy7OY8bPWym9tdvI
	1nx6eeYej+HV18fhmI3kZxfQ9RWSDRCH9kmHU5R1rg==
X-ME-Sender: <xms:klbVYm0hYVhHC-1KLEKrtrudo4XHDYoSBIewstNBtPhjfOITytUgJQ>
    <xme:klbVYpFF1YP9xpYjksPqCv724WMzf_UfyVYtJKS-Upt_FfuTLgPz-kzlJnybkY87R
    aAY8hav43kpgg>
X-ME-Received: <xmr:klbVYu48W5XmNGHP1Wm35ki_fW3bOSAEy_Ro5SlECpA6qyjp_3cmd_2Yg-l3Nu0pl3KHNDfxK8IGrerS2R-1cvNKk_KNgNuFiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:klbVYn0x4mRsMw3RuAVxR1n6IVHPDHTATGv8ilfFf2N2vxfvHx4v4A>
    <xmx:klbVYpEkRW4X_nmJiBMBLYMA5aOCFaKx5NML8PGoA3oIfvsoyBuzhA>
    <xmx:klbVYg903QZ9Yj2cB1LS5_ib4ee8GS8PKcTU9PzmPXs3zBFwDRY2mQ>
    <xmx:klbVYth4CvRweWsdO-Xuv4idWgbnTGWSYvgV14yrHCuRrkm9XTH-2g>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 18 Jul 2022 14:48:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/9] console: support multiple serial console
 simultaneously
Message-ID: <YtVWjta6GJwts+bp@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <e40a6de7f032c776e889e4ca6d68579fbb3ad57a.1657121519.git-series.marmarek@invisiblethingslab.com>
 <ea93063e-1b18-0d3d-586b-3b1ce048d017@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kjm/POFnaL4sr9zY"
Content-Disposition: inline
In-Reply-To: <ea93063e-1b18-0d3d-586b-3b1ce048d017@suse.com>


--Kjm/POFnaL4sr9zY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jul 2022 14:48:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/9] console: support multiple serial console
 simultaneously

On Wed, Jul 13, 2022 at 11:39:07AM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > Previously only one serial console was supported at the same time. Using
> > console=3Dcom1,dbgp,vga silently ignored all but last serial console (in
> > this case: only dbgp and vga were active).
> >=20
> > Fix this by storing not a single sercon_handle, but an array of them, up
> > to MAX_SERCONS entries. The value of MAX_SERCONS (4) is arbitrary,
> > inspired by the number of SERHND_IDX values.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  xen/drivers/char/console.c | 58 ++++++++++++++++++++++++++++++---------
> >  1 file changed, 45 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index f9937c5134c0..44b703296487 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -113,7 +113,9 @@ static char *__read_mostly conring =3D _conring;
> >  static uint32_t __read_mostly conring_size =3D _CONRING_SIZE;
> >  static uint32_t conringc, conringp;
> > =20
> > -static int __read_mostly sercon_handle =3D -1;
> > +#define MAX_SERCONS 4
>=20
> Might this want to be a Kconfig setting?

Is that going to be useful for anybody (who isn't modifying the code
anyway, for example to add yet another console driver)?

> > +static int __read_mostly sercon_handle[MAX_SERCONS];
> > +static int __read_mostly nr_sercon_handle =3D 0;
>=20
> I would have wanted to ask for __ro_after_init here, but Arm still
> hasn't enabled support for it.
>=20
> > @@ -395,9 +397,17 @@ static unsigned int serial_rx_cons, serial_rx_prod;
> > =20
> >  static void (*serial_steal_fn)(const char *, size_t nr) =3D early_puts;
> > =20
> > +/* Redirect any console output to *fn*, if *handle* is configured as a=
 console. */
> >  int console_steal(int handle, void (*fn)(const char *, size_t nr))
> >  {
> > -    if ( (handle =3D=3D -1) || (handle !=3D sercon_handle) )
> > +    int i;
>=20
> unsigned int please (also elsewhere).
>=20
> > +    if ( handle =3D=3D -1 )
> > +        return 0;
> > +    for ( i =3D 0; i < nr_sercon_handle; i++ )
> > +        if ( handle =3D=3D sercon_handle[i] )
> > +            break;
> > +    if ( nr_sercon_handle && i =3D=3D nr_sercon_handle )
> >          return 0;
>=20
> No need for the left side of the &&, I think. I guess it's actively
> wrong to be there.
>=20
> >      if ( serial_steal_fn !=3D NULL )
>=20
> I guess you then also want to make serial_steal_fn an array, and no
> longer return constant 1 from the function.
>=20
> > @@ -977,7 +990,8 @@ void __init console_init_preirq(void)
> >              continue;
> >          else if ( (sh =3D serial_parse_handle(p)) >=3D 0 )
> >          {
> > -            sercon_handle =3D sh;
> > +            if ( nr_sercon_handle < MAX_SERCONS )
> > +                sercon_handle[nr_sercon_handle++] =3D sh;
>=20
> else <log a message>
>=20
> > @@ -1291,7 +1322,8 @@ static int suspend_steal_id;
> > =20
> >  int console_suspend(void)
> >  {
> > -    suspend_steal_id =3D console_steal(sercon_handle, suspend_steal_fn=
);
> > +    if ( nr_sercon_handle )
> > +        suspend_steal_id =3D console_steal(sercon_handle[0], suspend_s=
teal_fn);
> >      serial_suspend();
> >      return 0;
> >  }
>=20
> The commit message gives no explanation why only the first handle
> would want/need dealing with here.

Sure, I can add an explanation. I'm adding this comment to console_steal():
/* Redirect any console output to *fn*, if *handle* is configured as a cons=
ole. */

So, calling console_steal() is about all serial consoles, not just a
specific one. The use case for this "if" part is gdbstub, which wants
to redirect serial output only if that serial was configured as both
console and gdb. Having proper per-console stealing is doable, but IMO
not worth it (it would require also avoiding duplicated output in case
of multiple serial consoles, and probably few more corner cases).

> One overall remark: Especially with sync_console latency is going to
> be yet worse with all output being done sequentially. The help text
> for "console=3D" will want to mention this, up and until this would be
> parallelized.

I don't think it was parallelized anywhere. All the relevant functions
(__putstr especially) write to various console types sequentially. The
difference is that previously only the last "serial" console was used,
all the other were silently ignored. So, it was "parallel" with all
_zero other_ serial consoles, but not other console types.
Anyway, both help text and boot warning for sync_console already warn
about it. Do you want me to include relation to number of configured
console explicitly?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Kjm/POFnaL4sr9zY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLVVo4ACgkQ24/THMrX
1yzdkwf+M9qM1IZ+SftjkcBjnIc+gJ+po49eCCo1Njcln9S6z+/t9aUHzWDS1NIo
/WGStxVK3TEKz9pr5YgmjyIm6uLcnbRTwaAmCMDlrsJ2hlTuq6r7wm3MPkI1sXeF
eQUinkYz2JH+lYfb3dN4ssP0RNNg4HvQ0MLBtJCWw9Nw7MmGZboSTHZIs82bh7cU
t3LesRRLkYGY/CnJ8Hhx0IUZaAeJVW8nYGuJ/nFftc/GiA7lbxgAnNLkerrfl4UG
NmLM55mdHg/H/p4kTjzuNEgX5QBeeJtTBmnNc3gsBrkQH/j84oJsEYkrMleV7mAw
fXdSNT7mOoOKm4R/1iF7xjWGHhSiYw==
=+wER
-----END PGP SIGNATURE-----

--Kjm/POFnaL4sr9zY--

