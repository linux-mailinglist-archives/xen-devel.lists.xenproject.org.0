Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333A5A53F8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 20:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394662.634154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSjYt-00072J-E2; Mon, 29 Aug 2022 18:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394662.634154; Mon, 29 Aug 2022 18:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSjYt-0006yu-A7; Mon, 29 Aug 2022 18:32:39 +0000
Received: by outflank-mailman (input) for mailman id 394662;
 Mon, 29 Aug 2022 18:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7OGJ=ZB=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oSjYr-0006yj-5A
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 18:32:37 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2584cf8-27c8-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 20:32:35 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CCF5A5C00B2;
 Mon, 29 Aug 2022 14:32:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 14:32:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 14:32:32 -0400 (EDT)
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
X-Inumbo-ID: f2584cf8-27c8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661797952; x=
	1661884352; bh=BklNZirLPFlYcIbhhz4xnS4tvI4IZOcYh7kyAR8BrwU=; b=F
	MBirjyghYlWZK4dLt0hNA1geb02xaEuy4rl1+s4qPY7i+L4wfksyh7rjQ4+i1+/S
	Q0CMyUXUijmEKvaIwwB90mjqDf+YDeghZg4NivC8owTDxsEEuEYtcO/bFNt7H6W5
	S3Q4e5Tjqy7ckSFDIC/AL1WwptJOAQ8L+6Oo/KsvBFrEwKjaZMqBCox3jLeBctjU
	RwmaVdyQLSrhe+7p/a2C4PogiEMqKxNIAYS3U8vRzjhkfLZhcT8EYSjQFaCBTsAz
	kvWlFf2xA8/OWVLc0LDvOGHPwrl1aR8dsh3nxWMbDAn1OWbuhumld9wUP14eESi5
	Uo92Af7eAlxZH1QKPOloA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661797952; x=1661884352; bh=BklNZirLPFlYcIbhhz4xnS4tvI4I
	ZOcYh7kyAR8BrwU=; b=ARTaxy0SaI9q8iUMf6HWkvPca+/jwD0Ejr2Ild29J94t
	PxEgh5GMtBkl9loLgj1DjBWb4A9VzDhs01JaAm+vvkxlYcfSXyaXl91wsp13OxXG
	HnhOslsnGjmpzPU711IwqK+Vrx8WLteWGkUS0jiQMA5mbfF8wSbsNWUATHIEGPaG
	pyPy5P6AfJrYuH4skrn+kVKSN3M0gmTLaERXHauqiSw8nsRNWqhSC6gsuyNuGooF
	n4hVLX/QHvryvwfhKxn96dk6y7i4y1Eau/vHZ2byHOgIogKadE1Fq1LckhTJfD3E
	UTO0pzMFe7TVSl/i68efNlUR/6RJYyfjAP/Hf3VSxg==
X-ME-Sender: <xms:QAYNY_U84GMdY-6J7ybObjyqkh0AI21Pd0MERUySZJtWg_VGTJ3_kg>
    <xme:QAYNY3kuEO2Qb6tQh2D3ZgfN5na00aQ3wujwyVirAK944iKj5XWl_gQq3-hACJh2e
    L6gAmEt0E0UzME>
X-ME-Received: <xmr:QAYNY7bXkDZiQtdNgAzubAuhMgdAjcm1WkvqzmMjo0HehZRjPe4rJss_dxRu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:QAYNY6XIJFK2hBmRVZ6Rb2PdoqSlk5skmePdzKZK9q9Zxh3UsgJJTg>
    <xmx:QAYNY5lwTVAIAvge0defJqboTsdKLVwkFG-H3ITZznux2arcPynmyw>
    <xmx:QAYNY3cDFcA-EG1EbtyP2u1hsZIE-wbWpwDtacoxaIjzQtyCyrrboQ>
    <xmx:QAYNY4v1QF6CSxWr_fS5UMfX1DVTi1LVJEKAyoo2Xb7luVzuCg1d8A>
Feedback-ID: iac594737:Fastmail
Date: Mon, 29 Aug 2022 14:32:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors
Message-ID: <Yw0GPr7AB08mYiiu@itl-email>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>
 <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com>
 <Ywr6CfxUZs4zRPYR@itl-email>
 <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com>
 <YwzPotro68PP2u41@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RIkt5y6LjlWzhsbe"
Content-Disposition: inline
In-Reply-To: <YwzPotro68PP2u41@mail-itl>


--RIkt5y6LjlWzhsbe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Aug 2022 14:32:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors

On Mon, Aug 29, 2022 at 04:39:29PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Aug 29, 2022 at 02:55:55PM +0200, Juergen Gross wrote:
> > On 28.08.22 07:15, Demi Marie Obenour wrote:
> > > On Wed, Aug 24, 2022 at 08:11:56AM +0200, Juergen Gross wrote:
> > > > On 24.08.22 02:20, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > On Tue, Aug 23, 2022 at 09:48:57AM +0200, Juergen Gross wrote:
> > > > > > On 23.08.22 09:40, Demi Marie Obenour wrote:
> > > > > > > I recently had a VM=E2=80=99s /dev/xvdb stop working with a =
=E2=80=9Cbackend has not
> > > > > > > unmapped grant=E2=80=9D error.  Since /dev/xvdb was the VM=E2=
=80=99s private volume,
> > > > > > > that rendered the VM effectively useless.  I had to kill it w=
ith
> > > > > > > qvm-kill.
> > > > > > >=20
> > > > > > > The backend of /dev/xvdb is dom0, so a malicious backend is c=
learly not
> > > > > > > the cause of this.  I believe the actual cause is a race cond=
ition, such
> > > > > > > as the following:
> > > > > > >=20
> > > > > > > 1. GUI agent in VM allocates grant X.
> > > > > > > 2. GUI agent tells GUI daemon in dom0 to map X.
> > > > > > > 3. GUI agent frees grant X.
> > > > > > > 4. blkfront allocates grant X and passes it to dom0.
> > > > > > > 5. dom0=E2=80=99s blkback maps grant X.
> > > > > > > 6. blkback unmaps grant X.
> > > > > > > 7. GUI daemon maps grant X.
> > > > > > > 8. blkfront tries to revoke access to grant X and fails.  Dis=
aster
> > > > > > >       ensues.
> > > > > > >=20
> > > > > > > What could be done to prevent this race?  Right now all of the
> > > > > > > approaches I can think of are horribly backwards-incompatible=
=2E  They
> > > > > > > require replacing grant IDs with some sort of handle, and req=
uiring
> > > > > > > userspace to pass these handles to ioctls.  It is also possib=
le that
> > > > > > > netfront and blkfront could race against each other in a way =
that causes
> > > > > > > this, though I suspect that race would be much harder to trig=
ger.
> > > > > > >=20
> > > > > > > This has happened more than once so it is not a fluke due to =
e.g. cosmic
> > > > > > > rays or other random bit-flips.
> > > > > > >=20
> > > > > > > Marek, do you have any suggestions?
> > > > > >=20
> > > > > > To me that sounds like the interface of the GUI is the culprit.
> > > > > >=20
> > > > > > The GUI agent in the guest should only free a grant, if it got =
a message
> > > > > > from the backend that it can do so. Just assuming to be able to=
 free it
> > > > > > because it isn't in use currently is the broken assumption here.
> > > > >=20
> > > > > FWIW, I hit this issue twice already in this week CI run, while i=
t never
> > > > > happened before. The difference compared to previous run is Linux
> > > > > 5.15.57 vs 5.15.61. The latter reports persistent grants disabled.
> > > >=20
> > > > I think this additional bug is just triggering the race in the GUI
> > > > interface more easily, as blkfront will allocate new grants with a
> > >=20
> > > 1. Treat =E2=80=9Cbackend has not unmapped grant=E2=80=9D errors as n=
on-fatal.  The most
> > >     likely cause is buggy userspace software, not an attempt to explo=
it
> > >     XSA-396.  Instead of disabling the device, just log a warning mes=
sage
> > > > much higher frequency.
> > > >=20
> > > > So fixing the persistent grant issue will just paper over the real
> > > > issue.
> > >=20
> > > Indeed so, but making the bug happen much less frequently is still a
> > > significant win for users.
> >=20
> > Probably, yes.
> >=20
> > > In the long term, there is one situation I do not have a good solution
> > > for: recovery from GUI agent crashes.  If the GUI agent crashes, the
> > > kernel it is running under has two bad choices.  Either the kernel can
> > > reclaim the grants, risking them being mapped at a later time by the =
GUI
> > > daemon, or it can leak them, which is bad for obvious reasons.  I
> > > believe the current implementation makes the former choice.
> >=20
> > It does.
> >=20
> > I don't have enough information about the GUI architecture you are usin=
g.
> > Which components are involved on the backend side, and which on the
> > frontend side? Especially the responsibilities and communication regard=
ing
> > grants is important here.
>=20
> I'll limit the description to the relevant minimum here.
> The gui-agent(*) uses gntalloc to share framebuffers (they are allocated
> whenever an application within domU opens a window), then sends grant
> reference numbers over vchan to the gui-daemon (running in dom0 by
> default, but it can be also another domU).
> Then the gui-daemon(*) maps them.
> Later, when an application closes a window, the shared memory is
> unmapped, and gui-daemon is informed about it. Releasing grant refs is
> deferred by the kernel (until gui-daemon unmaps them). It may happen
> that unmapping on the gui-agent side will happen before gui-daemon maps
> them. We are modifying our GUI protocol to delay releasing grants on the
> user space side, to coordinate with gui-daemon (basically wait until
> gui-daemon confirms it unmapped them). This should fix the "normal"
> case.
> But if the gui-agent crashes just after sending grant refs, but before
> gui-daemon maps them, then the problem is still there. If they are
> immediately released by the kernel for others to use, we can hit the
> same issue again (for example blkfront using them, and then gui-daemon
> mapping them). I don't see race-free method for solving this with the
> current API. GUI daemon can notice when such situation happens (by
> checking if gui-agent is still alive after mapping grants), but that is
> too late already.
>=20
> The main difference compared to kernel drivers is the automatic release
> on crash (or other unclean exit). In case of kernel driver crash, either
> the whole VM goes down, or at least automatic release doesn't happen.
> Maybe gntalloc could have some flag (per open file? per allocated
> grant?) to _not_ release grant reference (aka leak it) in case of
> implicit unmap, instead of explicit release? Such explicit release
> would need to be added to the Linux gntshr API, as xengntshr_unshare()
> currently is just munmap()). I don't see many other options to avoid
> userspace crash (potentially) taking down PV device with it too...

That is still less than great, as it leads to a memory leak.  Another
approach would be some sort of unmap/revoke operation in the backend, so
that the backend revokes its own access to the grants before telling the
frontend it has unmapped them.  This would cause the userspace mmap()
call to fail.

> (*) gui-agent and gui-daemon here are both in fact two processes (qubes g=
ui
> process that handles vchan communication and Xorg that does the actual
> mapping). It complicates few things, but generally is irrelevant detail
> from the Xen point of view.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--RIkt5y6LjlWzhsbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMNBj4ACgkQsoi1X/+c
IsH/iRAAgSfcoT6caNtZPuat+VW8SIeQ7E5ZjaXOpsVy6j1J56Gn6oG4S6a+n8nY
Qdcsm2qPhE0VEOv8jTyoAv6knb2gdnVtb9Cl8Y80s8B/GvoFz7kbb4zj8Rsy6puy
yAT6hCX37xG4mEXgA4X4ZE+Xv0VeQHGYYYjn+tY4XxPFaWFwC3oZQbWWBvGvwMFX
+b43+Ddxn1rn+5/X1Haeo/7cfQLlfJKkGUaOOugvOtphffIu5nLKOOmpMq9zMxTg
SZpfWzAGLZJ6rbkQBxdr/uqRYPrfvPvt+5VyhEqgAJ21zTTfCFp4yhFcwzJVjfsh
MfKCCTmulj4SLkzcFPGl9OAOzB5QMErXyGKKhrJMvbYMxjLuRpPKDL1wmI7f/6FH
vQGzl4rFb8UaqtA6ngkHbSS72FZQCf+cY4zSTnT79cgZ3iCcLhqEEnVLwHxAK2f3
Tbx4409GV07z/z2yCxRWBLX9XuYD9/v6azSk4zJLn8FKdTLJPDaCdI/zegxl88bq
E65AzI66ZxSILmiqyvz2Mnh47EtQ/prT6cqnuaTMsJ6fIzRmQ3MNS3/SLx484oV0
ajUvXvrYl5daNihdatg/zoMxVCH5nPJNYQgTVb2HuIXBSn/FHDBfpSRjlIxO86Fi
r8mjDeUjh1R/Pvjd2xivTqNAvgDmwQEfRUtC98UtKJ7FPdEWBqE=
=BSYG
-----END PGP SIGNATURE-----

--RIkt5y6LjlWzhsbe--

