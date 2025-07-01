Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DFAEFDE1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 17:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029818.1403569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWcl9-0005Fz-Tq; Tue, 01 Jul 2025 15:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029818.1403569; Tue, 01 Jul 2025 15:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWcl9-0005DN-R1; Tue, 01 Jul 2025 15:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1029818;
 Tue, 01 Jul 2025 15:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhT5=ZO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uWcl8-0005DH-Df
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 15:18:58 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b35d29eb-568e-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 17:18:55 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 876B5EC0281;
 Tue,  1 Jul 2025 11:18:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 01 Jul 2025 11:18:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 11:18:52 -0400 (EDT)
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
X-Inumbo-ID: b35d29eb-568e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751383133;
	 x=1751469533; bh=FaHCfvUrUntakbh5Y+zp99I9oikOXC9/98ervB4zAwQ=; b=
	bMHADREZ0T8n/PV+1B8UbXacA2hetsTtKTGYNG+oz3YDX0VFWbhzrzaY28fIOfbH
	eB/LtBJKvKTr93YekXBo28j4EW4cDVP+9m6qldN7Jsq3KrKhbgM8GLzKvA3Mfq/J
	m2I499ap5lpyFDN/2yqbZ1XGI3hSxzK3YNov5bilWtKpIrrNY1I8RFwISd/nBEzv
	dFr1qUuvjrBeXVytVFXf7xQM9/MHpMmDNXKYEnfmjcgrIOKK8l35/Q/F7H5p2EOT
	hGCnyy5fPvjF7Iy/P2HTtrnGjSUVLfbue1vnHp+np5u9C1Mt7nEl4n2/9cQgDg6L
	Wxb1tA5HeJJcSgLOhnqs7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751383133; x=1751469533; bh=FaHCfvUrUntakbh5Y+zp99I9oikOXC9/98e
	rvB4zAwQ=; b=PKjP7Aib0EfpMZYckHIsYz4Nd94w5TxT0zQu8H9MVfKJO33K8YG
	tm54MIIpQ0lCC3Z5Q+PKCDCO3kQwzX/K552J9Bk7b46oibTciYUhf3avdXBPBNnp
	vrIBHxc70QUAN5qJpv0XTLvXJAM8Y98N4sxD/kT1uUMc4Te2iH7b2ffH9OEDKGpl
	ZufjPiUgi8Y58YBMd3GhuZzcgCMNb+vzROT2KzCUOMXO4qPjruGZyNXDxVbvpI+7
	mZQFzXFFXCpBoJV30q0benFRalosOfxyl0jlbYJkvzGK1eijOBwDNEbUd5gDJ46o
	C3zrXy31XtEH9eyqg9npaUpf7EHFjdp6w4g==
X-ME-Sender: <xms:XPxjaMkRa5XPa5GHo88w4vUw62_vppxGsCAdt03WfwOAf8V57H1LJQ>
    <xme:XPxjaL1E08sat-UJF7qq13QPSOdOlaXyACt51ds_ZTt1zWPyGDwaP--tlL7s-Wknf
    1UIrHVlgJ49ew>
X-ME-Received: <xmr:XPxjaKpqUtTEFJlYHAbmftilxh9bv4EBQPiyIY2kBEs5ZTZMg2QdF9NA4QzaR3iQTOnGIFpRBL686v9-jC6ooZ9gVkMNfbUHKg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhs
    ohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homh
X-ME-Proxy: <xmx:XPxjaImSh3igu6vQqrhhR7QqldwgPC_2j8it0h2oxhB1n67WISu_Lw>
    <xmx:XPxjaK0-8D8zb126R88IQIFLItmdJt5Fh1-Re2rygpEha1IljtIQMA>
    <xmx:XPxjaPu5_F__0Hrkl8dRqorSDuI9ns4Adq5vh4sar5mDipsCdliD5Q>
    <xmx:XPxjaGVDtH245dgYjuZZYNqBz6PETOh7uThU_OHrN7MaXJqbRS2c7g>
    <xmx:XfxjaNAyUKt_MQ4vbuCkD0y98NaMhax1vfI-Wg2T3vuJ58h950fugf3F>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 1 Jul 2025 17:18:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2
Message-ID: <aGP8WpJf6pKfTZbK@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl>
 <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
 <aF1hIARPp6a0wWmi@mail-itl>
 <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>
 <aF6onqQMlms2svXT@mail-itl>
 <CACHz=Zi3THWcucw6ioZhKaeeDxM+e+E1rb-NvczG=mkVjD5qzg@mail.gmail.com>
 <aF7EsHeJ1GAwvrDz@mail-itl>
 <CACHz=Zhqj2q2hqj4cees22OWmiNrXiGSkJPFJT96WWFpLY31Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fEXU32opfYRMPW1S"
Content-Disposition: inline
In-Reply-To: <CACHz=Zhqj2q2hqj4cees22OWmiNrXiGSkJPFJT96WWFpLY31Xw@mail.gmail.com>


--fEXU32opfYRMPW1S
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 1 Jul 2025 17:18:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2

On Tue, Jul 01, 2025 at 03:31:19PM +0100, Frediano Ziglio wrote:
> On Fri, Jun 27, 2025 at 5:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Fri, Jun 27, 2025 at 04:58:43PM +0100, Frediano Ziglio wrote:
> > > On Fri, Jun 27, 2025 at 3:20=E2=80=AFPM Marek Marczykowski-G=C3=B3rec=
ki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > > So, it looks like major distributions use a patched grub version th=
at
> > > > changes behavior of "linux" command. IIUC many of those patches are
> > > > about hardening SecureBoot, and shim-review kinda suggest using pat=
ched
> > > > version (many of the submissions explicitly mention the at least pa=
tch
> > > > grub for NX). So, I think this needs figuring out how to make your
> > > > approach working with grub flavor that is actually used by SB-enabl=
ed
> > > > distributions...
> > > >
> > >
> > > We (xenserver) would like to provide booting using separate
> > > hypervisor, kernel and initrd.
> > > Using "linux" was an old discussed option which had a nice usage.
> > > The merged patches allow to have a fully UKI file bundling kernel and
> > > initrd loaded from no-ESP partition which is nice to have.
> > > For the final solution I was thinking about using "xen_hypervisor" and
> > > "xen_module" already present for ARM. From the user perspective is
> > > surely less confusing than using "linux" to pass something which is
> > > not Linux.
> >
> > In which case, loading initrd using Linux-specific grub part doesn't
> > make sense, no? Or is that xen_module going to use similar mechanism?
> >
>=20
> Yes, the idea is to reuse this mechanism instead of reinventing the wheel.
>=20
> You can see the problem from 2 perspectives:
> - User usage;
> - Boot protocol.
>=20
> From the user usage the user (possibly human, but at least the
> configuration should be user understandable) the usage of "linux" to
> load something which is not Linux is confusing although in the past
> the "kernel" command was abused to load lot of things, and a lot of
> things presented themselves as Linux kernels to be loaded by different
> boot loaders (even Syslinux had this habits).
>=20
> From the boot protocol perspective. A boot loader loads some binaries
> and uses some boot protocol to pass the control and different
> information to the "next" binary. Information can include
> - command line
> - modules
> - memory information
> - video information
> - ...
> EFI supports by itself memory and video information, can carry a
> string (so the command line) but lacks module information. Here came
> all a set of way to pass modules, specifically:
> - multiboot 1 and 2
> - GRUB LoadFile2
> - device tree (ARM)
> Multiboot does not work very well with PE (the protocol is designed
> for ELF or binary/raw loading) so we are trying to move away from it.
> Device tree (used by xen_hypervisor and xen_module GRUB commands) is
> ARM specific.
> What is left (without adding a new method) is LoadFile2. So we are
> using this way to pass additional modules. Just added a new media GUID
> to pass also the kernel, not only initrd (at the moment the GRUB
> changes are very hacky but the protocol is the same).

Ok, so the plan is to use GRUB LoadFile2 as a mechanism to load initrd
(and maybe kernel too?) for EFI boot on x86. This in itself sounds fine
for me.
The part that is worrying for me is interaction of the context in which
this is introduced, with various downstream GRUB forks (IMO a
"distribution package" that applies 200+ patches should be called this
way, it isn't just a "package" anymore). A large part of those patches,
both in Fedora and in Debian is related to SecureBoot support. Using
patched GRUB is also kinda recommended as part of getting Microsoft to
sign the shim package (the shim-review process). Now, if the LoadFile2
approach is introduced as part of making Xen SecureBoot-ready, but it
does not work with a GRUB version that is supposed to be used with
SecureBoot I see a problem. I'm not sure exactly where the issue is
(could be something about how our xen.efi looks like, but could be also
a downstream GRUB issue), but IMO it's worth at least figuring out where
the issue is (and whether it's just a bug, or some intentional
behavior - possibly to comply with some SB requirements). To avoid
situation where the version that is made to be SecureBoot-ready won't
actually be bootable by any SecureBoot-ready bootloader...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fEXU32opfYRMPW1S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhj/FoACgkQ24/THMrX
1yzR2Qf/XX0dwyZeSG4fk1DP0uwdx6BeKLs6SmfXobnk7ysrtnRZrors9/8wO3qR
aDsiFl96cTxMgKNPndAJG54YSuWiv1c28dwT5mj4gnraDmRn6Fk/1aLuAjTLwAvf
Q8iWayiMdYiJffloGfmKVoKkBiHGkyiaMU2mivKVRUQRmnVQ0TDAt3gVJoMud98m
yjXB8Cu5yQB81dCHsONzpb0KHtqIEtM6h+z5Q3zcMJWe47I5H18MQCbIR/jVW2Vo
8D6CT//YxoVYG9TC+YG70NnQoIWQOXNUlJZXHuJUR8FLBDpCchtJYPy6hIkfxZSB
F/FT0sdyQnimvlzAFmll5014p4MI7w==
=xS6z
-----END PGP SIGNATURE-----

--fEXU32opfYRMPW1S--

