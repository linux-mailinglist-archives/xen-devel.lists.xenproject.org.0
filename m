Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79BAE0615
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 14:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020110.1396533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSEXO-0000Wv-0i; Thu, 19 Jun 2025 12:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020110.1396533; Thu, 19 Jun 2025 12:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSEXN-0000VL-U7; Thu, 19 Jun 2025 12:38:37 +0000
Received: by outflank-mailman (input) for mailman id 1020110;
 Thu, 19 Jun 2025 12:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVDA=ZC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uSEXM-0000VF-1b
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 12:38:36 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f428b65-4d0a-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 14:38:33 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id DCBB0138063D;
 Thu, 19 Jun 2025 08:38:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 19 Jun 2025 08:38:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 08:38:30 -0400 (EDT)
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
X-Inumbo-ID: 4f428b65-4d0a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750336711;
	 x=1750423111; bh=i3dDU16VH1qm9YunVKeGTu3VLu9ufqqZNJtqnl6S8UE=; b=
	O0ZOEtl1Ivmo8TodqrL+2tzqnCsPtVexPaRmdGN7um4LbLt54etU/QovBINMdhfy
	JwuRXdd+ZqLKJ1BmRLYDu/vATOGXUu1qoQS6j/G7qMC979eHDh8hMsQ/ZUbosFms
	zDTl6pta+sBukJUOF1yJWak47TgkqANp21axKlhrTLPGu4WRyjsskuUevRFN6ZYw
	7WZK3WLSZCz8HrRGO1IcTYBsDzix0+qgXw43SitHkbyE2M+tWEtkLLpXuMqyTEfe
	BoZBxaSvonaYs8KcKkHmjSX6njKrcDtthZKafUoYj9wmOtHai5YRCeTG+hYRJF1g
	Ga6uL/0zMtPCD1dqYyppfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750336711; x=1750423111; bh=i3dDU16VH1qm9YunVKeGTu3VLu9ufqqZNJt
	qnl6S8UE=; b=qCGuxXGcnht5xFxWXyUdq4XZFVMZfL7xYFh02Y+FvdoFThGFmBQ
	CXB9bXvv78IlGInhTSQhjtleCASf/KdCY3NPAUzkLiGN/rlBauKsuxDhxJf9BRAz
	Z22VXQyLMvrVvsUWabs55iqzLbnqCpSMxesq0jIxBnRchU2vQHnQ5oqR8M7uNVmD
	rMtZmFQCg9JYI4SWwGyWmcmXRR3e5OXYoCj8lf3JIqxkjHB6EzSws5eL4JH/CMOT
	nNE4i91ADfjXSrh92nQqE6ubBARY0iHKFVmG3b8vPdc+4/fIgdWiBr+/sjeflf/4
	+3YyHbX+ZIOMwVNCvMJov/p6Lyqplriklgg==
X-ME-Sender: <xms:xwRUaJCz30N5ZHsvfKGaHkO4A4CPsqcM4t0AupJegkhjT04_9BOyiw>
    <xme:xwRUaHjwSJJcc8lIKgQlYeyPVWKcRMN6hJmRhVYFN1szJa07I_C8jmeKaGs9lHjJr
    e7kznVxh1FLxQ>
X-ME-Received: <xmr:xwRUaEmLGocRYCn42jskwK89WAVZzxFhCWScgVZufpKGGFA-kxd0LZvOBv-EKTDxwZP8qfNV_dX-DrTqjTPO1v8qoRNJm7vKoZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghl
    ohhuugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnph
    hrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshho
    lhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtoh
    hm
X-ME-Proxy: <xmx:xwRUaDxQoFn4nKgZuQihAEDHhknL_MfpXEXg7VkjfWboAEWemzzoeg>
    <xmx:xwRUaOTV62y3X_8CnUe-oVghswJgmDLCqFCEczKz2jRnpW-alMSSSg>
    <xmx:xwRUaGaGq6nk78PVBWEl52f2RRxYsL1RFbGT54x7imQTLa5QmwKSsQ>
    <xmx:xwRUaPRubSUnPDHgytXh1gVCwrtQ3_t_pBj_D9QsjYf2tWyTG2HdKA>
    <xmx:xwRUaO_FcqInHw6kKu8yawgvjaO8QQLcaG3kWKF9ZrqxG-jBDZO9ZxgQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 19 Jun 2025 14:38:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not check kernel signature if it was embedded
Message-ID: <aFQExX5bk7auXr21@mail-itl>
References: <20250618184631.15489-1-frediano.ziglio@cloud.com>
 <aFP_xmsKsSK_y0tA@mail-itl>
 <CACHz=ZjNOxcADbyfoSodt+ef=gtbE+vKDE0kNbOU2Pd+oOtSgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lRmNHmQVmNrYtUO8"
Content-Disposition: inline
In-Reply-To: <CACHz=ZjNOxcADbyfoSodt+ef=gtbE+vKDE0kNbOU2Pd+oOtSgA@mail.gmail.com>


--lRmNHmQVmNrYtUO8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Jun 2025 14:38:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not check kernel signature if it was embedded

On Thu, Jun 19, 2025 at 01:33:20PM +0100, Frediano Ziglio wrote:
> On Thu, Jun 19, 2025 at 1:17=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Wed, Jun 18, 2025 at 07:46:28PM +0100, Frediano Ziglio wrote:
> > > Using UKI it's possible to embed Linux kernel into xen.efi file.
> > > In this case the signature for Secure Boot is applied to the
> > > whole xen.efi, including the kernel.
> > > So checking for specific signature for the kernel is not
> > > needed.
> > > In case Secure Boot is not enabled there's no reason to check
> > > kernel signature.
> >
> > The last sentence (here and in the comment below) seem to be unrelated
> > to this change - it's more about shim lock protocol being available,
> > which this patch doesn't change.
> >
>=20
> Should I just remove the sentence?

Yes, and reword the code comment a bit.

> Beside that sentence, any issue with this change?

Other than that it looks fine for me.

> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > ---
> > >  xen/common/efi/boot.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > > index e39fbc3529..7077af3f5d 100644
> > > --- a/xen/common/efi/boot.c
> > > +++ b/xen/common/efi/boot.c
> > > @@ -1291,6 +1291,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDL=
E ImageHandle,
> > >      bool base_video =3D false;
> > >      const char *option_str;
> > >      bool use_cfg_file;
> > > +    bool kernel_was_verified =3D false;
> > >      int dt_modules_found;
> > >
> > >      __set_bit(EFI_BOOT, &efi_flags);
> > > @@ -1461,6 +1462,14 @@ void EFIAPI __init noreturn efi_start(EFI_HAND=
LE ImageHandle,
> > >              read_file(dir_handle, s2w(&name), &kernel, option_str);
> > >              efi_bs->FreePool(name.w);
> > >          }
> > > +        else
> > > +        {
> > > +            /*
> > > +             * As kernel was embedded it was either verified for Sec=
ure Boot
> > > +             * or Secure Boot is not enabled.
> > > +             */
> > > +            kernel_was_verified =3D true;
> > > +        }
> > >
> > >          if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL)=
 )
> > >          {
> > > @@ -1534,6 +1543,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDL=
E ImageHandle,
> > >       * verify it.
> > >       */
> > >      if ( kernel.ptr &&
> > > +         !kernel_was_verified &&
> > >           !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> > >                                             (void **)&shim_lock)) &&
> > >           (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=
=3D EFI_SUCCESS )
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Best Regards,
> > Marek Marczykowski-G=C3=B3recki
> > Invisible Things Lab

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lRmNHmQVmNrYtUO8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhUBMUACgkQ24/THMrX
1yyNGwf+O2tiuQ608dfnmha85GyWda/iwN227Opa3/QnWfUyyjAPPbgyrtvCVM1O
Ivk1AqrSj0vwUXHR4+AarWf31pcrsPoPHp5FwVbwDPKcO7tfBfAccBcY+8Px+kIN
wE/dyY1g817tAtvbRO+nCvgVqi93UwB6QW1k2EiRVgiDfjU/PxZFxTRpGCPm2vMw
Rehv11+NDKqO2dZPBEf5idPFNW8/2r6b13R3tQXeFSsBvCg83ITQPgYXd9fUQ5O9
s29VZzJV4WgD7+vNjrUN9w7/ZmU2+avbHeFtC2h+LZ4r8JX1tY+SQWhqqzRENo9F
DuFudQhNH4Aq5u9jbntagnENdD+p/w==
=c8jp
-----END PGP SIGNATURE-----

--lRmNHmQVmNrYtUO8--

