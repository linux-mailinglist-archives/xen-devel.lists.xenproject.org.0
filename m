Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43085F55D5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416255.660905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4oa-0000MP-2D; Wed, 05 Oct 2022 13:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416255.660905; Wed, 05 Oct 2022 13:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4oZ-0000KG-VA; Wed, 05 Oct 2022 13:51:59 +0000
Received: by outflank-mailman (input) for mailman id 416255;
 Wed, 05 Oct 2022 13:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xhym=2G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1og4oY-0000KA-Sc
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:51:59 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd3d467-44b4-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 15:51:57 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 45833320093E;
 Wed,  5 Oct 2022 09:51:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 05 Oct 2022 09:51:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 09:51:52 -0400 (EDT)
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
X-Inumbo-ID: dfd3d467-44b4-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664977913; x=
	1665064313; bh=7zNKsxib9beHGDHPELkCeUD0PEqHdjwG9OqgD/jvckY=; b=m
	0FEJumNrvbcjU9AYckbnihxE/qS0BPyx7w8GtqAB6VHhtE/K5zjwwPEDz42EVpWN
	J6icD0AfAV4oAb4VCM3jlPn+OdkHaF3KuDCNrUh6/7piz3f+71O3ayQ23mceWmIx
	+M0A5BYGX4uNw7v75ZP3xNVTFWQIDIizfhxyaIumxKdBQjRIW6r7IfNcKd2DxTAx
	Sx+FbqIcaMBoYRROpWE1wCIUdrFSEe9b/8oaMvSqHXey5HQGM7MypfAkYNSwlC6t
	k4mxTwzwior/eQFpBDOxJWumRlCzEaFW46YBB7dsR5tKmYFyb893sxT1Rd0GeEPt
	zYkrqvRAg/rVFm1KCRZwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664977913; x=1665064313; bh=7zNKsxib9beHGDHPELkCeUD0PEqH
	djwG9OqgD/jvckY=; b=dvUueFk+ud0dLI35Au5W4QsiyKcEOcZwxkFd2tRmiqWL
	C6WULuL6Vl3i0W/MY9NhNY1JL1LcGKLQFRDwUa2veaj51edhfwnEmFVtKxO279Nd
	lI03g945fGyGkq3NGlQ7l0iETW93R8iLyfvIFQE30acEvrKKEbYhkGyedUrol/Vx
	R4V96IugG0aSO4B0rTz4IzOYAg2fEzXWhEBQ4kvPOXRzs2ecYGO1Vk4jSK/s9tkG
	NCITyHYz1NxGQgDUIYf+LL51S0AR7TfQ4Q2z41Nj8L3szquFfDLXJSc9dCpXVxc2
	S2U2ZMZJj9V5QvhzSCfMOdnnnclGY/iUoshnIObkTg==
X-ME-Sender: <xms:-Ys9YxrFn0jlg2Ew49AUoQEiRLmVjo0PrhDg4vs263O61gaCqApwCw>
    <xme:-Ys9YzpkCv9RvrbkpeUNclMga1mLFNVS8H_5ajKoIONVI6GF5X1YffPx9EGYkpU_p
    hiGVDumNJbdcQ>
X-ME-Received: <xmr:-Ys9Y-MgUZbGry_oxOcEz0PaiVpS1ikXX8662HPakNqcsjPyQYFF84mQMd0bYk-I61z7q8JBX4eAnlHWEIc05XpGYqEh4EykeJ33>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:-Ys9Y85ePlRAfY6c2PnRxtLW92tJqPaEGrgUYWF9u-dBrmJAJNWSIg>
    <xmx:-Ys9Yw425y0p_F-afIdLo-KQyWpay9tkf32HPv-B4_VXEc-8xGbPQw>
    <xmx:-Ys9Y0g00b_z0lfDMeg9gGeBpBQ_4i2wmXfSe3uzZJPSF_36EPS0nw>
    <xmx:-Ys9Y1UkvUZ6QQ3WDhcVG_zAdVAeqCBfRPNHrvR121eDaatvBRE1Pg>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 5 Oct 2022 15:51:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
Message-ID: <Yz2L9eTdbA3vS43g@mail-itl>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com>
 <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HofWzEIQsP1FKqvm"
Content-Disposition: inline
In-Reply-To: <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com>


--HofWzEIQsP1FKqvm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Oct 2022 15:51:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt

On Wed, Oct 05, 2022 at 03:34:56PM +0200, Juergen Gross wrote:
> On 05.10.22 15:25, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Oct 05, 2022 at 02:57:01PM +0200, Juergen Gross wrote:
> > > On 05.10.22 14:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > When booting Xen with Linux dom0 nested under KVM,
> > > > CONFIG_XEN_VIRTIO_FORCE_GRANT=3Dy makes it unable to use virtio dev=
ices
> > > > provided by L0 hypervisor (KVM with qemu). With PV dom0, grants are
> > > > required for virtio even if just CONFIG_XEN_VIRTIO is enabled.
> > > >=20
> > > > This is probably uncommon corner case, but one that has bitten me i=
n my
> > > > CI setup... I think Xen should set smarter
> > > > virtio_require_restricted_mem_acc(), that enforces it only for devi=
ces
> > > > really provided by another Xen VM (not by the "outer host"), but I'=
m not
> > > > sure how that could be done. Any ideas?
> > > >=20
> > >=20
> > > It should be possible to add a boot parameter for that purpose. Using=
 it
> > > would open a security hole, though (basically like all PCI passthroug=
h to
> > > PV guests).
> >=20
> > What about excluding just dom0? At least currently, there is no way for
> > dom0 to see virtio devices provided by another Xen domU.
>=20
> Even not via hotplug?

That's why I said "currently", IIUC hotplug of virtio devices under Xen
doesn't work yet, no?
With hotplug working, it would need to be a proper detection where the
backend lives, and probably with some extra considerations re Xen on
Xen (based on below, pv-shim could use grants).

For me specifically, a command line option would work (because I don't
use Xen-based virtio devices when nested under KVM, or anywhere at all,
at least not yet), but I can see future cases where you have virtio
devices from both L0 and L1 in the same guest, and then it wouldn't be
that simple.

> > Something like this:
> > ---8<---
> > diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> > index 9b1a58dda935..6ac32b0b3720 100644
> > --- a/arch/x86/xen/enlighten_pv.c
> > +++ b/arch/x86/xen/enlighten_pv.c
> > @@ -111,7 +111,7 @@ static DEFINE_PER_CPU(struct tls_descs, shadow_tls_=
desc);
> >   static void __init xen_pv_init_platform(void)
> >   {
> >          /* PV guests can't operate virtio devices without grants. */
> > -       if (IS_ENABLED(CONFIG_XEN_VIRTIO))
> > +       if (IS_ENABLED(CONFIG_XEN_VIRTIO) && !xen_initial_domain())
> >                  virtio_set_mem_acc_cb(virtio_require_restricted_mem_ac=
c);
> >          populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));
> > ---8<---
> >=20
> > This BTW raises also a question what will happen on Xen nested inside
> > Xen, when L0 will provide virtio devices to L1. Grants set by L1 dom0
> > wouldn't work on L0, no? Or maybe this is solved already for pv-shim
> > case?
>=20
> This is a similar problem as with normal Xen PV devices.
>=20
> You will need either a simple grant passthrough like with pv-shim (enabli=
ng
> such devices for one guest in L1 only), or you need a grant multiplexer in
> L1 Xen in case you want to be able to have multiple guests in L1 being ab=
le
> to
> use L0 PV devices.

This will be tricky, at least with the current frontend drivers.
Frontend kernel is in charge of assigning grant refs, _and_
communicating them to the backend. Such multiplexer would need to
intercept one or the other (either translate, or ensure they are
allocated from distinct ranges to begin with). I don't see how that
could be done with the current domU kernels. That might be better with
your idea of multiple grant v3 trees, where the hypervisor might dictate
grant ranges.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HofWzEIQsP1FKqvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM9i/YACgkQ24/THMrX
1yzgVggAkBzHdP1F6YkUsHYjS9rMObic/RPHL61m5NrAc+/J8qsVlVCbkWdkk3OZ
f4uLe2m94gLrgfXW9E2MjB6SjW+SJrlgvQFb0F/0KSzNxJ4+jLvlcSzIX042xfc4
4BKp1mr4LPezQcis0o0VM5TqrJYziF6VcjCSnGYwSb/r3S94W+Ot1CTOmm1us1hN
u0v0U/9qYpH443B+6VKXQfz/cof4uxhE024SQeqLBf/iR70d0gWIJp6hSIm2k3Y4
loMHspmfoY/2Uk4jkvQB/enn+XMvhksHzr0Bpa6JL3+WN4whTrRyZAa9xgfuA/Zi
Qcx5JwHzSsIRDX56PKJjK62Au7RgbA==
=l5Cf
-----END PGP SIGNATURE-----

--HofWzEIQsP1FKqvm--

