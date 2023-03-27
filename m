Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943156CA768
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 16:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515297.798018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgniV-0001Dg-G1; Mon, 27 Mar 2023 14:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515297.798018; Mon, 27 Mar 2023 14:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgniV-0001AG-D4; Mon, 27 Mar 2023 14:20:59 +0000
Received: by outflank-mailman (input) for mailman id 515297;
 Mon, 27 Mar 2023 14:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSZI=7T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgniT-0001A8-J1
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 14:20:57 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 945dbe8b-ccaa-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 16:20:54 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B4D5E3200934;
 Mon, 27 Mar 2023 10:20:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 27 Mar 2023 10:20:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 10:20:48 -0400 (EDT)
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
X-Inumbo-ID: 945dbe8b-ccaa-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679926850; x=1680013250; bh=klLp4VrtdBfnXQ21jdqKG/3aERI4nkuWbXB
	cQaTD080=; b=A1tzHhXCA3pUXbRJ2XdnSVzc1Urc0ARbmn4jLVPeTf6N5zEhxFx
	Ufpg1H9wXl6mr0tpcx4IygT2xFB6aDxQDbkL/iDcMf35lrSPqIYzeuXaJ4RwhBkI
	NuDr4S9kRWu2JxI651crB5unDYnhfs8JV4f6wcYGELw6+eWlTq+iO4Nv6JSDc4gm
	qZXBtOqSQrNqB8FAHnDjPqgRgi0GHE6h71wbBq5CWuWUV+DVlzYItWoAsmd2HOds
	o/yKi1PYrsoj1uNVbKHoHAfkoxlkGkv80R/0ZKJ60XOC7CdJl9rtKirkxaoA2G7q
	kyvJIBWf6mWAV1Hm/vxKxq32EHRN1kCy5Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679926850; x=1680013250; bh=klLp4VrtdBfnX
	Q21jdqKG/3aERI4nkuWbXBcQaTD080=; b=Hcwkup2txfPOXBgEw/atc+mx2jUry
	j+S1ztz9wVOs8JhfJY+LWXzCKsBtzQWVOOwGhteF+c4bNHL3zoPm3Oy2ovwjLeWn
	eeG+MYWpgnkvM8+6MiQbfxkfWhsUD2ttqFPH98EfIJM3D+jFnQ3EfyfHvuq6mdI1
	Rlk0wFfIFLX7TC/NgFEOhE9IQDtFNrzLLTXdQwrYAbiaQ5f5+D3fb8qhkDUnPEMS
	7aAr8JXiYq/2biPZU/5vrba30Duxb2dazH5Lwmn5VydXtgz7JYrKdNN3oXeRdL/1
	5nOhDo7TEzwWhVfFOUwhg6rx3vjQh0Yz0/AaBQz8nh6mevcfdKa/MiIYA==
X-ME-Sender: <xms:QaYhZIN_a0cXP_MQkdMRpEENaFvGeFcFMK0_eyWmk2ugUfWpwiR96w>
    <xme:QaYhZO8YD2wakU8-Di7srE-FBihi_BBO-Pg63vRQwn_uohy5vCnANGB0y28T8mfB7
    coJgNO-Givs4A>
X-ME-Received: <xmr:QaYhZPSviMgXZo-8qqYQvdo34elpkVWOd2fPpig7m2l3QDpuqhhrs5SYNhEtsEfW_VrPZJfAvU0Vu-KPDAuYvpr64IqgVZgn87E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:QaYhZAuPG0L_GcU1SUXiC-Ztvvctoe6aAM-xidimoMDQkR9S2LCjcA>
    <xmx:QaYhZAeOp4ypacLgubih-1jOKWIUtjxWdHfIMkhKRz3wtyWpgDL4KA>
    <xmx:QaYhZE1fTO5c54hPh1eXP-k0SmIHzaZ-s7w5IFa4E4wroLrzc4Xe7Q>
    <xmx:QqYhZI6B0qW4wqwn9B8em1yXoLgXMxGS6ceHltVx3Fvm5Z0DL0IGyQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 27 Mar 2023 16:20:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCGmPZcyWE2za+rw@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
 <ZCFvPTpOixe582JU@mail-itl>
 <ZCF1HX6Dp7mrm65l@Air-de-Roger>
 <ZCF/P22HaeZs4+To@mail-itl>
 <ZCGaU1sM/z3wJzJF@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8O6l5slQpBbB/nyb"
Content-Disposition: inline
In-Reply-To: <ZCGaU1sM/z3wJzJF@Air-de-Roger>


--8O6l5slQpBbB/nyb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Mar 2023 16:20:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model

On Mon, Mar 27, 2023 at 03:29:55PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 27, 2023 at 01:34:23PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Mar 27, 2023 at 12:51:09PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, Mar 27, 2023 at 12:26:05PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Mon, Mar 27, 2023 at 12:12:29PM +0200, Roger Pau Monn=C3=A9 wrot=
e:
> > > > > On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > QEMU needs to know whether clearing maskbit of a vector is real=
ly
> > > > > > clearing, or was already cleared before. Currently Xen sends on=
ly
> > > > > > clearing that bit to the device model, but not setting it, so Q=
EMU
> > > > > > cannot detect it. Because of that, QEMU is working this around =
by
> > > > > > checking via /dev/mem, but that isn't the proper approach.
> > > > > >=20
> > > > > > Give all necessary information to QEMU by passing all ctrl writ=
es,
> > > > > > including masking a vector. This does include forwarding also w=
rites
> > > > > > that did not change the value, but as tested on both Linux (6.1=
=2E12) and
> > > > > > Windows (10 pro), they don't do excessive writes of unchanged v=
alues
> > > > > > (Windows seems to clear maskbit in some cases twice, but not mo=
re).
> > > > >=20
> > > > > Since we passthrough all the accesses to the device model, is the
> > > > > handling in Xen still required?  It might be worth to also expose=
 any
> > > > > interfaces needed to the device model so all the functionality do=
ne by
> > > > > the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
> > > > > passing the accesses anyway.
> > > >=20
> > > > This was discussed on v1 already. Such QEMU would need to be able t=
o do
> > > > the actual write. If it's running in stubdomain, it would hit the e=
xact
> > > > issue again (page mapped R/O to it). In fact, that might be an issu=
e for
> > > > dom0 too (I haven't checked).
> > >=20
> > > Oh, sorry, likely missed that discussion, as I don't recall this.
> > >=20
> > > Maybe we need an hypercall for QEMU to notify the masking/unmasking to
> > > Xen?  As any change on the other fields is already handled by QEMU.
> > >=20
> > > > I guess that could use my subpage RO feature I just posted then, bu=
t it
> > > > would still mean intercepting the write twice (not a performance is=
sue
> > > > really here, but rather convoluted handling in total).
> > >=20
> > > Yes, that does seem way too convoluted.
> > >=20
> > > > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisi=
blethingslab.com>
> > > > > > ---
> > > > > > v2:
> > > > > >  - passthrough quad writes to emulator too (Jan)
> > > > > >  - (ab)use len=3D=3D0 for write len=3D4 completion (Jan), but a=
dd descriptive
> > > > > >    #define for this magic value
> > > > > >=20
> > > > > > This behavior change needs to be surfaced to the device model s=
omehow,
> > > > > > so it knows whether it can rely on it. I'm open for suggestions.
> > > > >=20
> > > > > Maybe exposed in XEN_DMOP_get_ioreq_server_info?
> >=20
> > Make flags IN/OUT parameter (and not reuse the same bits)? Or introduce
> > new field?
>=20
> I think it would be fine to make it IN/OUT, but see below.
>=20
> > > > >=20
> > > > > But I wonder whether it shouldn't be the other way arround, the d=
evice
> > > > > model tells Xen it doesn't need to handle any MSI-X accesses beca=
use
> > > > > QEMU will take care of it, likely using a new flag in
> > > > > XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
> > > > > part of the gflags, but then we would need to assert that the fla=
g is
> > > > > passed for all MSI-X interrupts bound from that device to the same
> > > > > domain.
> > > >=20
> > > > Is is safe thing to do? I mean, doesn't Xen need to guard access to
> > > > MSI-X configuration to assure its safety, especially if no interrupt
> > > > remapping is there? It probably doesn't matter for qemu in dom0 cas=
e,
> > > > but both with deprivileged qemu and stubdom, it might matter.
> > >=20
> > > Right - QEMU shouldn't write directly to the MSI-X table using
> > > /dev/mem, but instead use an hypercall to notify Xen of the
> > > {un,}masking of the MSI-X table entry.  I think that would allow us to
> > > safely get rid of the extra logic in Xen to deal with MSI-X table
> > > accesses.
> >=20
> > But the purpose of this series is to give guest (or QEMU) more write
> > access to the MSI-X page, not less.
>=20
> Right, but there are two independent issues here: one is the
> propagation of the MSIX entry mask state to the device model, the
> other is allowing guest accesses to MMIO regions adjacent to the MSIX
> table.
>=20
> > If it wouldn't be this Intel AX
> > wifi, indeed we could translate everything to hypercalls in QEMU and not
> > worry about special handlers in Xen at all. But unfortunately, we do
> > need to handle writes to the same page outside of the MSI-X structures
> > and QEMU can't be trusted with properly filtering them (and otherwise
> > given full write access to the page).
>=20
> Indeed, but IMO it would be helpful if we could avoid this split
> handling of MSIX entries, where Xen handles entry mask/unmask, and
> QEMU handles entry setup.  It makes the handling logic very
> complicated, and more likely to be buggy (as you have probably
> discovered).
>=20
> Having QEMU always handle accesses to the MSI-X table would make
> things simpler, and we could get rid of a huge amount of logic and
> entry tracking in msixtbl_mmio_ops.
>=20
> Then, we would only need to detect where an access falls into the same
> page as the MSI-X (or PBA() tables, but outside of those, and forward
> it to the underlying hardware, but that's a fairly simple piece of
> logic, and completely detached from all the MSI-X entry tracking that
> Xen currently does.
>=20
> > So, while I agree translating {un,}masking individual vectors to
> > hypercalls could simplify MSI-X handling in general, I don't think it
> > helps in this particular case. That said, such simplification would
> > involve:
> > 1. Exposing the capability in Xen to the qemu
> > (XEN_DMOP_get_ioreq_server_info sounds reasonable).
> > 2. QEMU notifying Xen it will handle masking too, somehow.
>=20
> I think it's possible we could get away with adding a new flag bit to
> xen_domctl_bind_pt_irq, like: XEN_DOMCTL_VMSI_X86_MASK_HANDLING that
> would tell Xen that QEMU will handle the mask bit for this entry.

Technically, for Xen to not care about those writes, it would need to
observe this flag on all vectors, including those not mapped yet. In
practice though, I think it might be okay to say device model should set
XEN_DOMCTL_VMSI_X86_MASK_HANDLING flag consistently (either on none of
them, or all of them), and Xen can rely on it (if one vector has
XEN_DOMCTL_VMSI_X86_MASK_HANDLING, then assume all of them will have
it).

> QEMU using this flag should be prepared to handle the mask bit, but if
> Xen doesn't know the flag it will keep processing the mask bit.
>=20
> > 3. QEMU using xc_domain_update_msi_irq and XEN_DOMCTL_VMSI_X86_UNMASKED
> > to update Xen about the mask state too.
> > 4. Xen no longer interpreting writes to mask bit, but still intercepting
> > them to passthorugh those outside of MSI-X structures (the other patch
> > in the series). But the handler would still need to stay, to keep
> > working with older QEMU versions.
>=20
> Xen would need to intercept writes to the page(s) containing the MSI-X
> table in any case, but the logic is much simpler if it just needs to
> decide whether the accesses fall inside of the table region, and thus
> needs to be forwarded to the device model, or fails outside of it and
> needs to be propagated to the real address.
>=20
> While true that we won't be able to remove the code that partially
> handles MSIX entries for guests in Xen, it would be unused for newer
> versions of QEMU, hopefully making the handling far more consistent as
> the logic will be entirely in QEMU rather than split between Xen and
> QEMU.

In fact, it was easier for me to register a separate ioreq server for
writes outside of the MSI-X table. But I'm afraid the current one would
need to stay registered (just not accepting writes).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8O6l5slQpBbB/nyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQhpj4ACgkQ24/THMrX
1yy/Uwf9FDFZkg2EAG98xV0Sh4oEFRywc8b1F9/++Fc8MJ/o0QAjAcMKhMiIg4Zf
74CvPUh0XaA9kWYNkaIpYt8AXrJjwVP5ObE4GEwLNSI8ibuLpT9NvIeX/XWZSgAZ
nXXG3v4Ju9Hu6A7lCUUA1e+YnzPsGfU0xzSA/15t7VoYOX7/6E0NCkkwIQywywU+
yMkzC4BzDp8pCbfFAty9dQLiJ6zMy0x6atiuaf88GiYdghJt/jgoOBggznosFhuP
8qDTRfUJtyL4Ma/mihh5qVhGe4eOstAwIZKqpUVMsaoeUUUBJReA6dSnZqAqCnFV
Iy3oVgNJPnR2QtmoR3DoB+LH4jG03A==
=Oaj9
-----END PGP SIGNATURE-----

--8O6l5slQpBbB/nyb--

