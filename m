Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0EAEB9A7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 16:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027685.1402225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV9wI-0007Mz-3V; Fri, 27 Jun 2025 14:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027685.1402225; Fri, 27 Jun 2025 14:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV9wH-0007LT-W9; Fri, 27 Jun 2025 14:20:25 +0000
Received: by outflank-mailman (input) for mailman id 1027685;
 Fri, 27 Jun 2025 14:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9k5L=ZK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uV9wG-0007LJ-EB
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 14:20:24 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9f997c5-5361-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 16:20:19 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B58AA140018B;
 Fri, 27 Jun 2025 10:20:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Fri, 27 Jun 2025 10:20:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 10:20:16 -0400 (EDT)
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
X-Inumbo-ID: d9f997c5-5361-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751034017;
	 x=1751120417; bh=dEqcBBehjo+Ag8AHZ3QYMxQ5bq0u4I+zI5hAXajTB78=; b=
	d9uc3EeWmc36oTHuiTJqWByrU/UB4pUAwBiYsN0MBIWF89yxyvjmX9Pkl+KfbaeT
	/JyDTQNUujFSgykmZG+TVoU/llMrGS0UHf22D6wW/nMRoYIgGbzD3D8hAO9sRitq
	TWYgNwY3m+CmLZZptU9LSJqW9vfY0hz5YPwfNp5VGYN4tv5mwdpYxog1H8yXd1zF
	z2NK6jetZthnLUEV7LNhOIiFKxPn/KO1Tp9qJfn8XsKTd3pl3Gz1YFsR3UPbMRjH
	xTEQUa7p+V9O6BXi1cGZPui5P1GvArKLZ8SzSSMqNMtthkfykHV5+OdIIR8mmKV0
	vpSxZmIZqhYxSQcAy3PYuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751034017; x=1751120417; bh=dEqcBBehjo+Ag8AHZ3QYMxQ5bq0u4I+zI5h
	AXajTB78=; b=X1nN6YoPZqwSBPo6pcZXVqVcNbEwY0oX12yfqFBU48tOXIV8zUm
	PKwU+QYYl4xR+TSrHPn8nP+sIlmfYZh3+QaqP6kYY62F3ctXOxpW1i/LJRZeNfVQ
	Iw++6Ya6vA71QFYxp8doR2lLtDB9YISo/LgSMh9sjDWMUxHKmzrtQDSTqEtMFaJ8
	4kaUry8kEr9zMHSjEu8olF8VhnFnoun547nCWq1lE1KKk6JacqTLU/hjabOiw9FA
	Ck+L21ODf/wvS0Wo9twyKbNvwjcp7ltoKBwOD+jla7Q+lXbSvmpW4W5WfW08PF03
	tALLAO8hTNPDfBFSXYs2zp1GKYFf7JoWEUw==
X-ME-Sender: <xms:oaheaL6oZsv1a_NoN9c47vOHjNQEQev5rSWaSIAfd13IMg1Zhkb9NA>
    <xme:oaheaA6pbnHl0LKGe9h7UHN69tOQVccjT8Mznf9gj3zSswzsAFlhz42a_VKH5zkOr
    I29yC0pZSmkGw>
X-ME-Received: <xmr:oaheaCfnSKzG0H-BoGM2OaITmNvS86GvlHGYYos8kYpbzTzdd-9K_opKsV2B1B7_m1jFV3vwHNyN9NNcfRUO3HgcnuKa3LnfV0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeluefgkefh
    geelveeuueeuhfevvdehtdevudevvdehieeiteffvdfhueduvdehnecuffhomhgrihhnpe
    hgnhhurdhorhhgpdhfvgguohhrrghprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghloh
    huugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholh
    huthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:oaheaMLhjgnhTRDmwuaukTn0tQC6I326BfJJzSuEHr0nt-mJqX1F4A>
    <xmx:oaheaPIvxgeNzl7OQ-SqVMDXxteNB3UE1LglS3-j7t6Pzwu_JOEadw>
    <xmx:oaheaFxydO4q3IjUSe_DkrdVMQvI2X5P1cButTTYeSD-VOAV5nW9QA>
    <xmx:oaheaLLqwM00k6tb7TumsQJBYJ8p41gHKN10kintGDoKHjYbdDmMow>
    <xmx:oaheaM12kzGIsZXQWBsLVE8EJLXzkxotEh8k4256Vogn9wy7yFbxUiYG>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 27 Jun 2025 16:20:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2
Message-ID: <aF6onqQMlms2svXT@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl>
 <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
 <aF1hIARPp6a0wWmi@mail-itl>
 <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N6yUUmzDxvx28B6F"
Content-Disposition: inline
In-Reply-To: <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>


--N6yUUmzDxvx28B6F
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Jun 2025 16:20:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2

On Fri, Jun 27, 2025 at 01:29:48PM +0100, Frediano Ziglio wrote:
> On Thu, Jun 26, 2025 at 4:03=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Thu, Jun 26, 2025 at 09:12:53AM +0100, Frediano Ziglio wrote:
> > > On Wed, Jun 25, 2025 at 9:26=E2=80=AFPM Marek Marczykowski-G=C3=B3rec=
ki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > On Tue, Jun 24, 2025 at 09:38:42AM +0100, Frediano Ziglio wrote:
> > > > > On Tue, Jun 24, 2025 at 9:32=E2=80=AFAM Frediano Ziglio
> > > > > <frediano.ziglio@cloud.com> wrote:
> > > > > >
> > > > > > The combination of GRUB2, EFI and UKI allows potentially more f=
lexibility.
> > > > > > For instance is possible to load xen.efi from a no ESP partitio=
n leaving
> > > > > > a boot loader like GRUB2 taking care of the file loading.
> > > > > > This however requires some changes in Xen to be less restrictiv=
e.
> > > > > > Specifically for GRUB2 these changes allows the usage of "chain=
loader"
> > > > > > command with UKI and reading xen.efi from no ESP (so no DeviceH=
andle
> > > > > > set) and usage of "linux" and "initrd" commands to load separat=
ely
> > > > > > the kernel (embedding using UKI) and initrd (using LoadFile2 pr=
otocol).
> > > > >
> > > > > I was forgetting. If somebody wants to test "linux" and "initrd"
> > > > > command with these changes be aware that GRUB currently has a pro=
blem
> > > > > passing arguments, I posted a patch, see
> > > > > https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00156.ht=
ml.
> > > > > I also have a workaround for this issue in xen but it would be be=
tter
> > > > > to have a fix in GRUB.
> > > >
> > > > Can you tell more how to test this, especially the second variant? =
When
> > > > trying to use GRUB linux or linuxefi commands on xen.efi, I get "in=
valid
> > > > magic number" error.
> > > >
> > >
> > > That's weird.
> > >
> > > Be the way. As usual I have a super complicated script that does ever=
ything.
> > >
> > > But to simplify:
> > > - I compile xen (plain upstream plus my patches) with "make -C
> > > ~/work/xen/xen -j O=3Dnormal MAP"
> >
> > Is there any that would be related to the "invalid magic" error? IIUC
> > without your patches options will be mangled, but I don't think I get
> > this far.
> >
>=20
> I tried to do some changes and check the CI with your branch. Not hard
> to reproduce and the test looks correct.
> Looking at GRUB code I can see various "linux" command implementations
> and it looks like yours is picking up i386-pc target and not
> x86_64-efi one which is really odd to me.

Indeed, very odd, I do pass -O x86_64-efi option explicitly...

But also, when I do the test locally with grub 2.12 from Fedora, I get the =
filename
prefix:

    error: ../../grub-core/loader/i386/efi/linux.c:387:invalid magic number.

which does look like the efi variant.

This is even more interesting, as this path does not exist in the
upstream repository. It appears as it's _yet another_ linux loader added
by Fedora package:
https://src.fedoraproject.org/rpms/grub2/blob/rawhide/f/0213-Add-support-fo=
r-Linux-EFI-stub-loading.patch
That code I think looks for some Linux-specific header with "EFI
handover" pointer?

I don't see exactly this patch in Debian package, but there are also
some messing with the 'linux' command, so I guess it may be similar
issue.

If I use upstream grub directly, then the "linux" command indeed doesn't
complain.

So, it looks like major distributions use a patched grub version that
changes behavior of "linux" command. IIUC many of those patches are
about hardening SecureBoot, and shim-review kinda suggest using patched
version (many of the submissions explicitly mention the at least patch
grub for NX). So, I think this needs figuring out how to make your
approach working with grub flavor that is actually used by SB-enabled
distributions...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--N6yUUmzDxvx28B6F
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmheqJ4ACgkQ24/THMrX
1yyVQQf9FLNcLfmZCSbPovI4nMC1h97V66jVsuV1pjqAwv7CzEIQtNDapkIcuyr1
o5yaTGsogl7wX9uctajK2Mo5hmholO1Lbx6F/TBLoTCMOdxsFPLYm+/QwYnVXWhi
Z/OqHoGwmonYIAcozDRGxHtBh184+cjHNU+ziCim13s3oria0pvMcG8u0JWRHsAx
pbiGsWbw0NSnhA5aejQBITmoU7TT/hQoXdOvFLWEtfsnf1tTGqA0B7tQbqJUcfjy
GXfD13A8KnYpu7LqMp3iKj8n7sosKirZTf2BCRmgZ95i0U9vxWFzg9WzGAAG9aVo
gDDGf9fBYWGkT87KQpPSdPGFfgAtkg==
=uDui
-----END PGP SIGNATURE-----

--N6yUUmzDxvx28B6F--

