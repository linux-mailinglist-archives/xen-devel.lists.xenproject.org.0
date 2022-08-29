Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9325A543B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 20:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394674.634165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSjtq-000151-Am; Mon, 29 Aug 2022 18:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394674.634165; Mon, 29 Aug 2022 18:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSjtq-00012R-7h; Mon, 29 Aug 2022 18:54:18 +0000
Received: by outflank-mailman (input) for mailman id 394674;
 Mon, 29 Aug 2022 18:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7OGJ=ZB=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oSjto-00012L-Oz
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 18:54:16 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9fbe2ca-27cb-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 20:54:15 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 223CF5C0120;
 Mon, 29 Aug 2022 14:54:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 14:54:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 14:54:13 -0400 (EDT)
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
X-Inumbo-ID: f9fbe2ca-27cb-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661799254; x=
	1661885654; bh=5HCiHl/1HPp+/Y49FQgwK4lJxPhiUAg2PqUYh4lnEBg=; b=h
	qoEaPZdWoZZLKT5Frt/hy1Hp1VxnztTE6bvueo1rdq4WWK+VBq7HWhSbU0iHxMbj
	nIpInraktdJoK+kG3bw8plpgPiRnAbXUWnNqCqZa4437KSAuLlFiXU62nzAnISt/
	fQ4t/W8qSsVGABMAEJgnQmugQNr2EEP/J/ieNu/nsV4UXpo8IDtV82RmsHUZ42dJ
	qyYGuNh0+8j5W7T4MizLLI+lzXwIxdv1pfLXjs8KusxuLI1It+4aelahO+X4LXRw
	1p+blhpcKX9/kiHyrImomocohO2qZ6ng2sEziLbFr9Uy+7lnsjd6th/Cwoe+HRzh
	ANGCfKZHOIsUDQiHzykqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661799254; x=1661885654; bh=5HCiHl/1HPp+/Y49FQgwK4lJxPhi
	UAg2PqUYh4lnEBg=; b=FWqUNHv3c5/QcPnXHAEMXahyWroid26QVzhYVCM4pGlz
	YBiPDYKTmFi1HxjLGzs/FOL8Ta5GVWlH5pyPBuETuTkEEgTsru5cWU/GpU+p9VKQ
	r/S67CGFXgbaHS4Pbwt0nVGgu/krF61odX2bDiV1GDuCGvScPN1ku2WeTQ2xDpmA
	bI87mlnrHrYrW2BWnG2DN3ydVX17j3PEGqxP0Gv3xNngXNuhOGdDZdgduE/xdMiF
	HLMTddTlVu3Y3DJMxUcyVe5a+Z+TbG2lNypcS+/6FaOHs4ItPPGbalM+7NmMIRde
	9z6nNE9j8sL+CKck1refmM+gfhRTehEPUVS3EjNF5A==
X-ME-Sender: <xms:VQsNYwhvhS1vsJXJRcnBnuFd3pCWZNy-RrnLT6gZxX1LmD2HlQwanw>
    <xme:VQsNY5CS59ZXSVBqXW2Lrk2C6QsCHAyGZIGM29jZqagfE9mKbzFM3QXYDOpRJVEQp
    qHTQ21Y_eVzTJc>
X-ME-Received: <xmr:VQsNY4EfZ4KzJDgaOepkBu8n_VBqhmX9cMT5BHXX77Dmn9xq4cUKQHMwUDHK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:VQsNYxS8BVo0VYN6lLKBfPxr2emPPqcZ84C5eXYSuDIPkzXscdpEtg>
    <xmx:VQsNY9zQHnKFzapqmA7IbUvHY4M5p9ElaYhp1ToExTLTOv_euSojjw>
    <xmx:VQsNY_4xexoCag_bvCbv8pPxKaYsvuGtIshfA5TsoF1pVzp6KjC71Q>
    <xmx:VgsNY7ZLzrAGYylXgGAgmZyc7G-QjtBCHI4gol2fqomcbSSx86zRnQ>
Feedback-ID: iac594737:Fastmail
Date: Mon, 29 Aug 2022 14:54:11 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors
Message-ID: <Yw0LVNwRmtYX/fYW@itl-email>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>
 <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com>
 <Ywr6CfxUZs4zRPYR@itl-email>
 <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oYom+NTuEeHiLbr0"
Content-Disposition: inline
In-Reply-To: <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com>


--oYom+NTuEeHiLbr0
Content-Type: text/plain; charset=utf-8; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Aug 2022 14:54:11 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
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

See Marek=E2=80=99s reply.

> > To fix this problem, I recommend the following changes:
> >=20
> > 1. Treat =E2=80=9Cbackend has not unmapped grant=E2=80=9D errors as non=
-fatal.  The most
> >     likely cause is buggy userspace software, not an attempt to exploit
> >     XSA-396.  Instead of disabling the device, just log a warning messa=
ge
> >     and put the grant on the deferred queue.  Even leaking the grant
> >     would be preferable to the current behavior, as disabling a block
> >     device typically leaves the VM unusable.
>=20
> Sorry, I don't agree. This is a major violation of the normal I/O
> architecture. Your reasoning with the disabled block device doesn't make
> much sense IMHO, as the mapped grant was due to a bad interface leading to
> another component using a grant it was not meant to use.
>=20
> Shutting down the block device is the right thing to do here, as data
> corruption might be happening.

In this case, the grants are being mapped read-only, so (unless I have
missed something) data corruption is not possible.

> > 3. Provide a means for a domain to be notified by Xen whenever one of
> >     its grants is unmapped.  Setting an event channel and writing to a
> >     shared ring would suffice.  This would allow eliminating the kludgy
> >     deferred freeing mechanism.
>=20
> Interesting idea.
>=20
> I believe such an interface would need to be activated per grant, as
> otherwise performance could suffer a lot. There are still some unused bits
> in the grant flags, one could be used for that purpose.

At least in the GUI case, large numbers of grants are typically unmapped
at once, and a notification is only necessary when the entire block has
been unmapped.  This should mitigate the performance concerns.

> I'm not sure how often this would be used. In case it is only for the rare
> case of unexpectedly long mapped grant pages, a simple event might do the
> job, with the event handler just skimming through the pending unmaps to
> find the grants being available again.

In Qubes OS, this happens so often that we had to patch the Linux kernel
to handle it better.  Prior to the patch, the background deferred
reclaim could not keep up, causing a memory leak.  Furthermore, the log
messages whenever an unmap had to be deferred were flooding the logs.
While we could change the GUI protocol to provide an unmap-time
notification, this is only because we use an LD_PRELOAD hack to hook
Xorg=E2=80=99s unmapping calls.  I would prefer to not continue to rely on =
this.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--oYom+NTuEeHiLbr0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMNC1MACgkQsoi1X/+c
IsGiBxAAlrK0nMu7do1znUxjos8JOO3T1klzWLsGAb4gExNv+krD7RibyUvUih+P
v9hKqtAxy+BO6oQI2R8PR9rhToKCqyUygDlr13tNp05DWjcWirVXYbIiMZLZVHQv
rYHX/7S9FVjNtnq/d3DUv0uwW7n6mpGlTk3tlOi/Se+CXIR1+gJrJ4CdqodOCAob
s6oDSv+aZFYCn6Nh8Tqc3Mw9JSXG1dyD5PJb5y8+OyYBuKaZhrnpRGni8p860jAT
Nv7UBE8QRm0Q0hLmYLwTVpabKcV27+f2tH4esUbiET2jKnWF94GUs8B2H/M8d8aV
tiMjbPS/KhewHWrS7UzHtPKGBWU6la6Ynq8IC1vaceQP8dI2xj/L+bUe/Kpt0OCB
YIUYbYVArU1dLtCSOPoZ1A9ZbzbaCvf7ZYduY9G70Q5mPD5nYDAYSIeHWNO7Vwwy
T2BBCNJzlFThzOkv0PhDUiK5USdOwXfTdbl53Z3EHXXHiW/JBrtdhHfCj7vZkTlX
kWsL71L9J45c0ufIbdWs9XB5rI9D0E7UX3P6yxCc9zmccca5r5zmbtvcnBmqIxi2
UCYQxlTD8QkPbN6Mkpym5f9Fz4Y+XwLkOb7DIkBXhEvjiAhjpgs1/7XXbfMxeOf+
scImumn9LuFGubvyscU6+G1yMBN9Kax7W9gPOGH02xcXU/ZOIhY=
=TQf3
-----END PGP SIGNATURE-----

--oYom+NTuEeHiLbr0--

