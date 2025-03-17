Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA27A65B97
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 18:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917629.1322509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuEfH-0003qZ-0l; Mon, 17 Mar 2025 17:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917629.1322509; Mon, 17 Mar 2025 17:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuEfG-0003ov-UJ; Mon, 17 Mar 2025 17:54:14 +0000
Received: by outflank-mailman (input) for mailman id 917629;
 Mon, 17 Mar 2025 17:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tuEfG-0003op-3I
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 17:54:14 +0000
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e59536-0358-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 18:54:12 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id D309B1382D0B;
 Mon, 17 Mar 2025 13:54:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Mon, 17 Mar 2025 13:54:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 13:54:08 -0400 (EDT)
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
X-Inumbo-ID: d4e59536-0358-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742234050;
	 x=1742320450; bh=uCxLtV6bJMyPwGJxXetVHcNVvxPwSuJyVJ+25evTvzA=; b=
	n+fkrovhQksDRM+eqbEOheI0HMSv8+GgnrFyIaLzJuXUz2Z/g+lsDrG9zetYgG9T
	5MXUNnbmZeCBgzBh/r2aBXXog/10ISeHvegisobDz7ITn0nTsGy408NLlv/X274w
	13z9HNM8S7wcen+/rrgHuDbjGS9jOWb2HBV+ozjVKUQd0EUsiPmYeMEDG1zdEerG
	05Q3iFYIXdV7wBBs6yryMGNLiTx5ipR9saw7gdPhJCc4IsjjXIrI9kLowyTGU5Ae
	iG7E5gqhJ30a/JLp/7zs+xYxRphqTr3GKVPGVepE6QyCV9GgFP5PUfeUVZkj0RAx
	/+5UZAOdWEkAXPsKcJqz3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742234050; x=1742320450; bh=uCxLtV6bJMyPwGJxXetVHcNVvxPwSuJyVJ+
	25evTvzA=; b=O2QicdSPGJUGbAAfw8pK+Y2xj9/5W790lH3tT9l6ZnosRzwLTJ/
	YQDmwOwn8FBFOuDMOY6kt1xGK2b4lsk5wYZfLTXkR6B34R8Rdpx9OmkoMJ1+27Cw
	j1phABQdCcv2OTVExU+s6yxIPbcuwAe1uNEvoGbWyuQVRl7CMKTCjTa+iMUYbqjD
	7Js0GtLSvO40Eczq+CaBq4DDJbaBLBgWypQBzfrN8BJcAffrkgKXfrEiptX+ktK8
	wJDqCkL2daDzGN6T4sWsxduzudmtA/Y23lUiQv4FvhH33DlkOLF6kceA9jDVRbWC
	OkyrWDa0V7MBeUZ0yeCoU7ochdZ8S06qqrg==
X-ME-Sender: <xms:wmHYZ5THSdO41SgpxvJwN7yUrtwLzbdERsxv27Q6hLGFiyZ7-7-rPQ>
    <xme:wmHYZywOH9zXwt0PqmdMdQL4n4-N1vOXW0xOOYug7G3UXqkPtxepra54038XxZgLw
    gAKNAnCDyj-Lw>
X-ME-Received: <xmr:wmHYZ-3o5M8iTC8koqucmYkllusagloCfUcPFHZLmMBSWPYM-UIr8UFafP0yYzBSPJz2ln3rJgXdx6XFA3uvd70ifP0anh-6Zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
    pdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhr
    tghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegtrghrug
    hovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepohhlvghkshhiihdrkhhurhhotghh
    khhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigrkhgvphdrrghmrghtohhpsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhihkhihthgrpghpohhtuhhrrghisegvphgrmhdr
    tghomh
X-ME-Proxy: <xmx:wmHYZxCHG7O0X6PoO5SgHY08VQgl51k4OWwgZdgjDjIX1Z5F6iMxYQ>
    <xmx:wmHYZyimFJ2UYUJ9Vvdi-iz_zZ-zQHNI8YdrihloWhROckLTniFA8Q>
    <xmx:wmHYZ1pL2cyCHj22nn0WiH8HwwDUdbnF-IOPRkjJ3rf4c3WIm0b5Gw>
    <xmx:wmHYZ9iCzWfHbdHriNI0h03x12Mw5fGwwK-Cy9iZ9IZG5cU3gjFgOw>
    <xmx:wmHYZ9OLYAEHmmcUHa3e-gYfRKOS3sxkO6W1qoFK8jqx7K2zYlu_45Zn>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 17 Mar 2025 18:54:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20
Message-ID: <Z9hhvr7p13RGcNCY@mail-itl>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl>
 <Z9TBaEeUcVrjaACL@mail-itl>
 <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
 <Z9hGH0GLq-I1cKzt@macbook.local>
 <Z9hPaLVVhqAK5H0K@mail-itl>
 <Z9hdTCMKxF98wHJw@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/m/0VADQETNGl60o"
Content-Disposition: inline
In-Reply-To: <Z9hdTCMKxF98wHJw@macbook.local>


--/m/0VADQETNGl60o
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Mar 2025 18:54:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20

On Mon, Mar 17, 2025 at 06:35:08PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 17, 2025 at 05:35:51PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Mar 17, 2025 at 04:56:15PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
> > > > On 14/03/2025 11:53 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > >> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wro=
te:
> > > > >>> On Fri, 14 Mar 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > > > >>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook=
 445 G7.
> > > > >>>>
> > > > >>>> This one has working S3, so add a test for it here.
> > > > >>>>
> > > > >>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invis=
iblethingslab.com>
> > > > >>>> ---
> > > > >>>> Cc: Jan Beulich <jbeulich@suse.com>
> > > > >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > >>>>
> > > > >>>> The suspend test added here currently fails on staging[1], but=
 passes on
> > > > >>>> staging-4.19[2]. So the regression wants fixing before committ=
ing this
> > > > >>>> patch.
> > > > >>>>
> > > > >>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/=
9408437140
> > > > >>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/=
9408943441
> > > > >>> We could commit the patch now without the s3 test.
> > > > >>>
> > > > >>> I don't know what the x86 maintainers think about fixing the su=
spend
> > > > >>> bug, but one idea would be to run a bisection between 4.20 and =
4.19.
> > > > >> I'm on it already, but it's annoying. Lets convert this thread to
> > > > >> discussion about the issue:
> > > > >>
> > > > >> So, I bisected it between staging-4.19 and master. The breakage =
is
> > > > >> somewhere between (inclusive):
> > > > >> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
> > > > >> and
> > > > >> 47990ecef286 x86/boot: Improve MBI2 structure check
> > > > >>
> > > > >> But, the first one breaks booting on this system and it remains =
broken
> > > > >> until the second commit (or its parent) - at which point S3 is a=
lready
> > > > >> broken. So, there is a range of 71 commits that may be responsib=
le...
> > > > >>
> > > > >> But then, based on a matrix chat and Jan's observation I've tried
> > > > >> reverting f75780d26b2f "xen: move per-cpu area management into c=
ommon
> > > > >> code" just on top of 47990ecef286, and that fixed suspend.
> > > > >> Applying "xen/percpu: don't initialize percpu on resume" on top =
of
> > > > >> 47990ecef286 fixes suspend too.
> > > > >> But applying it on top of master
> > > > >> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not=
 fix it,
> > > > >> but the failure mode is different than without the patch - syste=
m resets
> > > > >> on S3 resume, with no crash message on the serial console (even =
with
> > > > >> sync_console), instead of hanging.
> > > > >> And one more data point: reverting f75780d26b2f on top of master=
 is the
> > > > >> same as applying "xen/percpu: don't initialize percpu on resume"=
 on
> > > > >> master - system reset on S3 resume.
> > > > >> So, it looks like there are more issues...
> > > > > Another bisection round and I have the second culprit:
> > > > >
> > > > >     8e60d47cf011 x86/iommu: avoid MSI address and data writes if =
IRT index hasn't changed
> > > > >
> > > > > With master+"xen/percpu: don't initialize percpu on resume"+rever=
t of
> > > > > 8e60d47cf011 suspend works again on this AMD system.
> > > >=20
> > > > That's not surprising in the slightest.
> > > >=20
> > > > Caching hardware values in Xen isn't safe across S3, which QubesOS =
has
> > > > found time and time again, and for which we still have outstanding =
bugs.
> > > >=20
> > > > S3 turns most of the system off.=C2=A0 RAM gets preserved, but devi=
ces and
> > > > plenty of internal registers don't.
> > >=20
> > > I think I've spotted the issue.  enable_iommu() called on resume
> > > (ab)uses set_msi_affinity() to force an MSI register write, as it's
> > > previous behavior was to unconditionally propagate the values.  With
> > > my change it would no longer perform such writes on resume.
> > >=20
> > > I think the patch below should help.
> >=20
> > It doesn't, I still got reboot on resume, with no crash message on
> > serial (even with sync_console).
>=20
> There was an error with the previous patch, and it's also a bug in the
> original patch.  Could you give a try to the updated patch below?
>=20
> Sorry for bothering you, but ATM I haven't found a way to trigger
> this myself.

This one does fix the issue :)


> Thanks, Roger.
> ---
> commit 70ea4301d5ca663ac6d850658b3fe832950ec363
> Author: Roger Pau Monne <roger.pau@citrix.com>
> Date:   Mon Mar 17 15:40:11 2025 +0100
>=20
>     x86/msi: always propagate MSI writes when not in active system mode
>    =20
>     Relax the limitation on MSI register writes, and only apply it when t=
he
>     system is in active state.  For example AMD IOMMU drivers rely on usi=
ng
>     set_msi_affinity() to force an MSI register write on resume from
>     suspension.
>    =20
>     The original patch intention was to reduce the number of MSI register
>     writes when the system is in active state.  Leave the other states to
>     always perform the writes, as it's safer given the existing code, and=
 it's
>     expected to not make a difference performance wise.
>    =20
>     For such propagation to work even when the IRT index is not updated t=
he MSI
>     message must be adjusted in all success cases for AMD IOMMU, not just=
 when
>     the index has been newly allocated.
>    =20
>     Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>     Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if=
 IRT index hasn't changed')
>     Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 163ccf874720..8bb3bb18af61 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, str=
uct msi_msg *msg,
>  {
>      entry->msg =3D *msg;
> =20
> +    if ( unlikely(system_state !=3D SYS_STATE_active) )
> +        /*
> +         * Always propagate writes when not in the 'active' state.  The
> +         * optimization to avoid the MSI address and data registers writ=
e is
> +         * only relevant for runtime state, and drivers on resume (at le=
ast)
> +         * rely on set_msi_affinity() to update the hardware state.
> +         */
> +        force =3D true;
> +
>      if ( iommu_intremap !=3D iommu_intremap_off )
>      {
>          int rc;
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passt=
hrough/amd/iommu_intr.c
> index 9abdc38053d7..08766122b421 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      rc =3D update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>                                              &msi_desc->remap_index,
>                                              msg, &data);
> -    if ( rc > 0 )
> +    if ( rc >=3D 0 )
>      {
>          for ( i =3D 1; i < nr; ++i )
>              msi_desc[i].remap_index =3D msi_desc->remap_index + i;
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/m/0VADQETNGl60o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfYYb4ACgkQ24/THMrX
1yz2fQf/bLQY+KCwcoNSjKa50QaAC1jBiMpe5XW5Ela97fIpl8pFY2CRGAqaGbZL
oQdfIOsHjYKzV05On8X0OyS7CczUDudnhTPIyAjOZ2ho07eN0klx2qbi7LmmzuiI
a87yzIX+/FpzVlTzSnRDZuDcUB3PFE/+WmP8pBR16B6KFgX5nRPoWgCKuJBOCY21
jHmKSgIglFCkiQt95NOCvz2MjAcHC8t3HqRGZnydnAXogTJHn3e2IwTsck+XjU+V
ym5akGo3W0oRFDpU7uKo+xgSp0IfOF9GnrYhZLpYXEJFzYnIO8wncBdFNsCCLrb5
FJkUnkveJexilZPsNsieqTL8t4i4Vg==
=0VSu
-----END PGP SIGNATURE-----

--/m/0VADQETNGl60o--

