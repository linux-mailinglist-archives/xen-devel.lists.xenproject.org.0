Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103F5A4F6F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 16:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394605.634074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSfvQ-00063s-Nh; Mon, 29 Aug 2022 14:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394605.634074; Mon, 29 Aug 2022 14:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSfvQ-000613-KB; Mon, 29 Aug 2022 14:39:40 +0000
Received: by outflank-mailman (input) for mailman id 394605;
 Mon, 29 Aug 2022 14:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jfEz=ZB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oSfvO-00060x-Dn
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 14:39:38 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6669879f-27a8-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 16:39:36 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C48F5C0172;
 Mon, 29 Aug 2022 10:39:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 10:39:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 10:39:32 -0400 (EDT)
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
X-Inumbo-ID: 6669879f-27a8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661783974; x=
	1661870374; bh=upkd5NFAQVj1W3/SIbJhOLV2G4DhXzIzQscx2aCEEow=; b=m
	famfGzyh9LwCllRDrdaXin2dQLFWwtFWCUMtTyiKDiBVVSm1LsiBys6ZmvvWTgf0
	jGAUrbQG7QAppYA22GFwsNiJBT3TtweCZ9D76YuN+X7E2gL5NVTFfxl4oaCkZa5t
	aZWs00Qac12kAXPJSbJPqGGnQH0wozjQKf43cAu8V3BIGwIBb+eO0I7J0Er7tvSG
	g2VlzhmzTYMNowYChrm5i29PT39ExwUqz5R10eqaf1uYyC4eA1TBCw/AsPjvkDdo
	oKUp4hQdfhYeLUl03UBD3Q+wtxUD8lYjH6NbT8/v1/CZ3g89fE79g80JZKw6Gvd8
	F5LO/x2S4kC2ROjvp8V/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661783974; x=1661870374; bh=upkd5NFAQVj1W3/SIbJhOLV2G4Dh
	XzIzQscx2aCEEow=; b=SACOWy/Rs3KCy0PN0i1Xvb+YmhF6bYRa2+NS0/zeH2ek
	ztywF+Wml8iwd+lLaim5U70jSELMgLwGT7oiy4GPYUkhv8ccqx9YQGw6Jr+opSbg
	47RnSMAWe0pUcX5FWH58r2/TLG8ALwEHfa21RkBCrKrHcvMalkCmao2jQQbemko9
	g9YAOqDNxRdDrP7y4yt9WdT8EamkeDNikMIOqkYyIgjz6u4mk9Bw4yszW5OR0V6a
	nTdq7SQxSuzzHZO5JhHIPWvOy9VYJiO4Jacuzd0Np7hTrYDTkNr3OiYDbmPutwKj
	fjXoo0mXeBUpAUCraNS70QCZaF+uNa1J7rmqqgoqxQ==
X-ME-Sender: <xms:pc8MYxBNyDJi2l9IkBno_0eKdD8pzAGYDbhkhln5rmxxNErQcGrYjQ>
    <xme:pc8MY_hLO8eAr6hbEPNyZrlt3gQla030iHCTdbA1huSmCwGjC0Go9nEQfR2oHIMJe
    B5m57Sk9l3dwA>
X-ME-Received: <xmr:pc8MY8mAgCpQ8m2sSMvZf28MpYZh4pjqbQwXdzl7RAXoAoTF6QzgZAjis1BxDYwYWhccAXwAHoSzmUYsa3_2BDcCntkRtZLBA2P_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:pc8MY7zXmtg6syysODf1jkkdF_W7xo6AISoUnYOcQsPRtP2fC-2MXQ>
    <xmx:pc8MY2SHVH3B41ZdmPozMgKGZW6p4FUDGAh9vvctrlMta44_Qc96Rw>
    <xmx:pc8MY-YZuFfE9HsUFpmglKekLUtZS4Solo8LUopVEgj7bq6cx20Bvw>
    <xmx:ps8MY_6N5-bf6fST4-S_1rOEdKbmor17EdBbytBtISplEdyIU2a9Rw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 29 Aug 2022 16:39:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors
Message-ID: <YwzPotro68PP2u41@mail-itl>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>
 <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com>
 <Ywr6CfxUZs4zRPYR@itl-email>
 <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yrMu9oU3G/ntPy/+"
Content-Disposition: inline
In-Reply-To: <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com>


--yrMu9oU3G/ntPy/+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Aug 2022 16:39:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors

On Mon, Aug 29, 2022 at 02:55:55PM +0200, Juergen Gross wrote:
> On 28.08.22 07:15, Demi Marie Obenour wrote:
> > On Wed, Aug 24, 2022 at 08:11:56AM +0200, Juergen Gross wrote:
> > > On 24.08.22 02:20, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Tue, Aug 23, 2022 at 09:48:57AM +0200, Juergen Gross wrote:
> > > > > On 23.08.22 09:40, Demi Marie Obenour wrote:
> > > > > > I recently had a VM=E2=80=99s /dev/xvdb stop working with a =E2=
=80=9Cbackend has not
> > > > > > unmapped grant=E2=80=9D error.  Since /dev/xvdb was the VM=E2=
=80=99s private volume,
> > > > > > that rendered the VM effectively useless.  I had to kill it with
> > > > > > qvm-kill.
> > > > > >=20
> > > > > > The backend of /dev/xvdb is dom0, so a malicious backend is cle=
arly not
> > > > > > the cause of this.  I believe the actual cause is a race condit=
ion, such
> > > > > > as the following:
> > > > > >=20
> > > > > > 1. GUI agent in VM allocates grant X.
> > > > > > 2. GUI agent tells GUI daemon in dom0 to map X.
> > > > > > 3. GUI agent frees grant X.
> > > > > > 4. blkfront allocates grant X and passes it to dom0.
> > > > > > 5. dom0=E2=80=99s blkback maps grant X.
> > > > > > 6. blkback unmaps grant X.
> > > > > > 7. GUI daemon maps grant X.
> > > > > > 8. blkfront tries to revoke access to grant X and fails.  Disas=
ter
> > > > > >       ensues.
> > > > > >=20
> > > > > > What could be done to prevent this race?  Right now all of the
> > > > > > approaches I can think of are horribly backwards-incompatible. =
 They
> > > > > > require replacing grant IDs with some sort of handle, and requi=
ring
> > > > > > userspace to pass these handles to ioctls.  It is also possible=
 that
> > > > > > netfront and blkfront could race against each other in a way th=
at causes
> > > > > > this, though I suspect that race would be much harder to trigge=
r.
> > > > > >=20
> > > > > > This has happened more than once so it is not a fluke due to e.=
g. cosmic
> > > > > > rays or other random bit-flips.
> > > > > >=20
> > > > > > Marek, do you have any suggestions?
> > > > >=20
> > > > > To me that sounds like the interface of the GUI is the culprit.
> > > > >=20
> > > > > The GUI agent in the guest should only free a grant, if it got a =
message
> > > > > from the backend that it can do so. Just assuming to be able to f=
ree it
> > > > > because it isn't in use currently is the broken assumption here.
> > > >=20
> > > > FWIW, I hit this issue twice already in this week CI run, while it =
never
> > > > happened before. The difference compared to previous run is Linux
> > > > 5.15.57 vs 5.15.61. The latter reports persistent grants disabled.
> > >=20
> > > I think this additional bug is just triggering the race in the GUI
> > > interface more easily, as blkfront will allocate new grants with a
> >=20
> > 1. Treat =E2=80=9Cbackend has not unmapped grant=E2=80=9D errors as non=
-fatal.  The most
> >     likely cause is buggy userspace software, not an attempt to exploit
> >     XSA-396.  Instead of disabling the device, just log a warning messa=
ge
> > > much higher frequency.
> > >=20
> > > So fixing the persistent grant issue will just paper over the real
> > > issue.
> >=20
> > Indeed so, but making the bug happen much less frequently is still a
> > significant win for users.
>=20
> Probably, yes.
>=20
> > In the long term, there is one situation I do not have a good solution
> > for: recovery from GUI agent crashes.  If the GUI agent crashes, the
> > kernel it is running under has two bad choices.  Either the kernel can
> > reclaim the grants, risking them being mapped at a later time by the GUI
> > daemon, or it can leak them, which is bad for obvious reasons.  I
> > believe the current implementation makes the former choice.
>=20
> It does.
>=20
> I don't have enough information about the GUI architecture you are using.
> Which components are involved on the backend side, and which on the
> frontend side? Especially the responsibilities and communication regarding
> grants is important here.

I'll limit the description to the relevant minimum here.
The gui-agent(*) uses gntalloc to share framebuffers (they are allocated
whenever an application within domU opens a window), then sends grant
reference numbers over vchan to the gui-daemon (running in dom0 by
default, but it can be also another domU).
Then the gui-daemon(*) maps them.
Later, when an application closes a window, the shared memory is
unmapped, and gui-daemon is informed about it. Releasing grant refs is
deferred by the kernel (until gui-daemon unmaps them). It may happen
that unmapping on the gui-agent side will happen before gui-daemon maps
them. We are modifying our GUI protocol to delay releasing grants on the
user space side, to coordinate with gui-daemon (basically wait until
gui-daemon confirms it unmapped them). This should fix the "normal"
case.
But if the gui-agent crashes just after sending grant refs, but before
gui-daemon maps them, then the problem is still there. If they are
immediately released by the kernel for others to use, we can hit the
same issue again (for example blkfront using them, and then gui-daemon
mapping them). I don't see race-free method for solving this with the
current API. GUI daemon can notice when such situation happens (by
checking if gui-agent is still alive after mapping grants), but that is
too late already.

The main difference compared to kernel drivers is the automatic release
on crash (or other unclean exit). In case of kernel driver crash, either
the whole VM goes down, or at least automatic release doesn't happen.
Maybe gntalloc could have some flag (per open file? per allocated
grant?) to _not_ release grant reference (aka leak it) in case of
implicit unmap, instead of explicit release? Such explicit release
would need to be added to the Linux gntshr API, as xengntshr_unshare()
currently is just munmap()). I don't see many other options to avoid
userspace crash (potentially) taking down PV device with it too...


(*) gui-agent and gui-daemon here are both in fact two processes (qubes gui
process that handles vchan communication and Xorg that does the actual
mapping). It complicates few things, but generally is irrelevant detail
=66rom the Xen point of view.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yrMu9oU3G/ntPy/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMMz6EACgkQ24/THMrX
1yzHXggAi8jwM9BkGtkCrQfi7kOuzR1YtIlPaQX9g5WZw1t6ls1tEw2tE079/F8S
yaLd2WynUVPnSnIbSjzAqQwFkcmWIWcTakhZuHqqGmEUllQm4XWHzMn8HbzkT3xF
suDR5cODsmciRyo/+X3w0lHSWSXEvot9li+eDLPrT2M+90MU/jKpAVjVaAYoMZp0
fsYlyNENbmkrwEh930zi5EyXfIlEYI/32XrFrWlcJRLy1eh9NPy0ZMygatAfOoiv
VOHNqM/M9OPd7OnO9O0Ag61AHvOnBnI2ejjc5bN0ltcwPtl5RSoWm1buhNxGDxCw
NU4cEZAmXpythTX86Ql634HbfFg0Lg==
=BwWb
-----END PGP SIGNATURE-----

--yrMu9oU3G/ntPy/+--

