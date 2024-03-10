Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8D87773C
	for <lists+xen-devel@lfdr.de>; Sun, 10 Mar 2024 15:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691136.1076828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjJpI-0004O5-Cq; Sun, 10 Mar 2024 14:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691136.1076828; Sun, 10 Mar 2024 14:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjJpI-0004LS-9d; Sun, 10 Mar 2024 14:06:56 +0000
Received: by outflank-mailman (input) for mailman id 691136;
 Sun, 10 Mar 2024 14:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8sL1=KQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rjJpG-0004LE-5I
 for xen-devel@lists.xenproject.org; Sun, 10 Mar 2024 14:06:54 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70836c24-dee7-11ee-a1ee-f123f15fe8a2;
 Sun, 10 Mar 2024 15:06:51 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.nyi.internal (Postfix) with ESMTP id AF9F613800D2;
 Sun, 10 Mar 2024 10:06:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 10 Mar 2024 10:06:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Mar 2024 10:06:48 -0400 (EDT)
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
X-Inumbo-ID: 70836c24-dee7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710079609;
	 x=1710166009; bh=YLuo/dAv41dl03TJqdFSAWwkWXjXj38XB6Sedj0IcS8=; b=
	SZbQOQdGgPxidLwbwsghN7sxRZGsvt6cDANEAB0A95hzJ133exY/G/87pVnz7+gi
	Vect1dGi8/BmZLPx+1AshrfyqRu4dWnmNiyimBRst4z2RJABHVhT13cVCMv6opkM
	RUaqmd/rdktBTMWhFSjC/FsdQL4D0rtvZGRx8DadSi9nrOTQ7zBQetLHIpxIm2gW
	DEeFibrcqwZIMuJ41PXqePLxJPYIAHPYCruThyfnvuHrCileg8a4bmj/BIzuGJ8R
	nx56roZ3CRfZhUqu2Jk5LzEgFsLKbIB9GlZadvPdnQFNksqOC67G/Mi9k08NahbR
	vfu1+pu3hur2jHq+ATgMkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710079609; x=1710166009; bh=YLuo/dAv41dl03TJqdFSAWwkWXjX
	j38XB6Sedj0IcS8=; b=Quy8sDR/TMav9F2SIITXzccHKPGc1AD/TUqSzJxmEl/q
	yKZxz0vGUOnFnCx7mUy+C+l+7Lvkjp3Rfc256dR+/QgKWGAPIJ26KFtoBOE0uh9o
	mlTyUtRGjbUC64x35n9ARkZu+sI2mAEIe9UG5YSFSua48Mafincjh2mlUXw0V2OP
	cQes8luK687gMKqH6+yj1HDDYZXoFtegBHJaii4lNX/aE4qFPXoUnt2gHESGH3Bw
	Xcr1hEH5tPLdJ8UHQqGKzZc4UUodFtmgAx4Yk04J+EglkyfoSxmIQpeRJGN0KZgD
	8sN3PDHkWZRDMMfU24mHj/f1hIBHZ1DflynMJ2nqTg==
X-ME-Sender: <xms:eb7tZfJ84OkzPm_u_hZTpW9keXp7fhZOGCU4wqXaP4zXyVum39xCBw>
    <xme:eb7tZTK75JfCa1ynxVcXJ-QIiM2zQ1Tq8iwCUjBzOSn7tiFbSon-2jqujNPuwqlSs
    fkSK98mrQKhbg>
X-ME-Received: <xmr:eb7tZXv4ChJsGonPVZiy5bVcGN5qG2CLvbRKI228aBCku97Nk-JEXKXaz5pq2c6A-ARo3ca9ISIuWWDC0kHGmPZ-M2zyYoWnvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieelgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:eb7tZYa6MYrNDUd4dvvPvIAboD6r2qE1VqosM8itxq6CEE2vEW-SmA>
    <xmx:eb7tZWaTjOiz9V0wxJIfHve_yVv55YVDCUFrYap31LjFz_J576B9sA>
    <xmx:eb7tZcACNycWv1RorALoPrSh0xgiHMKuWbyQoVKCmbWQ6o_HCZs_iw>
    <xmx:eb7tZdwE-fFrhIkeyp7fEpEv-sOh2rSh4W1gt6zWthA00Tp2SwzsOg>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 10 Mar 2024 15:06:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <Ze2-dkQkn41WJ60v@mail-itl>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zap7uX3k0kfoMOoF@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ObQU90+Tv37NxnH1"
Content-Disposition: inline
In-Reply-To: <Zap7uX3k0kfoMOoF@mail-itl>


--ObQU90+Tv37NxnH1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Mar 2024 15:06:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms

On Fri, Jan 19, 2024 at 02:40:06PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> > On Wed, Jan 17, 2024 at 3:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> > > On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > > > As someone who hasn't built a kernel in over a decade, should I fig=
ure
> > > out
> > > > how to do a kernel build with CONFIG_PHYSICAL_START=3D0x2000000 and=
 report
> > > > back?
> > >
> > > That was largely a suggestion to perhaps allow you to gain some
> > > workable setup. It would be of interest to us largely for completenes=
s.
> > >
> >=20
> > Typo aside, setting the boot to 2MiB works! It works better for PV
>=20
> Are there any downsides of running kernel with
> CONFIG_PHYSICAL_START=3D0x200000? I can confirm it fixes the issue on
> another affected system, and if there aren't any practical downsides,
> I'm tempted to change it the default kernel in Qubes OS.

I have the answer here: CONFIG_PHYSICAL_START=3D0x200000 breaks booting
Xen in KVM with OVMF. There, the memory map has:
(XEN)  0000000100000-00000007fffff type=3D7 attr=3D000000000000000f
(XEN)  0000000800000-0000000807fff type=3D10 attr=3D000000000000000f
(XEN)  0000000808000-000000080afff type=3D7 attr=3D000000000000000f
(XEN)  000000080b000-000000080bfff type=3D10 attr=3D000000000000000f
(XEN)  000000080c000-000000080ffff type=3D7 attr=3D000000000000000f
(XEN)  0000000810000-00000008fffff type=3D10 attr=3D000000000000000f
(XEN)  0000000900000-00000015fffff type=3D4 attr=3D000000000000000f

So, starting at 0x1000000 worked since type=3D4 (boot service data) is
available at that time already, but with 0x200000 it conflicts with
those AcpiNvs areas around 0x800000.

I'm cc-ing Jason since I see he claimed relevant gitlab issue. This
conflict at least gives easy test environment with console logged to a
file.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ObQU90+Tv37NxnH1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXtvnYACgkQ24/THMrX
1yxV0AgAgJxV5CkKwofT2ZkKEfOqP8twXWsnscmm/+x81sa/mWkVCxrG4Bn5MJGF
p20G+WtALnR64Gq7l5M0ktQSqvQHxb5Q+AUvg2wzGqxnG4NYySkO6sybSXr3r7UJ
KoB5Zop7UwUzZe4iWia0/Uzc6QZqxs//cKxLoUBK1bcZNgejEGJ+jFvSMFof8Wsk
8TUdDJoVcBjRnscYAqnjgb0fc8gcLZbeueE8pUfnDrfkO2CCehDjlSwGYzfWcUGZ
92FOglJ0WxQLjqxW8C+FpK2jPJZ8ev+p2jQIlyRWSv98DpqRdP7NRC0pDgZoPEwz
u4YPepY5LqyWjt/2OAxqgJp+/tQo8g==
=q6rT
-----END PGP SIGNATURE-----

--ObQU90+Tv37NxnH1--

