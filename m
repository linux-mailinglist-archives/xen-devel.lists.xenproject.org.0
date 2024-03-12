Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A64F879DFC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 23:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692199.1079060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAAX-00080F-GR; Tue, 12 Mar 2024 22:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692199.1079060; Tue, 12 Mar 2024 22:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAAX-0007yO-Dh; Tue, 12 Mar 2024 22:00:21 +0000
Received: by outflank-mailman (input) for mailman id 692199;
 Tue, 12 Mar 2024 22:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkAAW-0007yI-J3
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 22:00:20 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e816584a-e0bb-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 23:00:18 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.nyi.internal (Postfix) with ESMTP id B05C15C0086;
 Tue, 12 Mar 2024 18:00:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 12 Mar 2024 18:00:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 18:00:12 -0400 (EDT)
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
X-Inumbo-ID: e816584a-e0bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710280814;
	 x=1710367214; bh=6D5/LLqXdsYWMYX8yW9HXHbC3p01jO2T7c0aof4XfOM=; b=
	AUECVd+xGNQEQXoFII1I4vPF3ajvgDOEk436r9wcTFYs6Glil7zKePJpyLIU5aUT
	dVQmWHSIwUrQdrL+/FUM0fbX91qEUgqIcNrW+S9PswMIxfqdeumfZb1+XUo+tst8
	ilbyi999u9Xxm5oYTHxfYmU0cGj+tpFZBQ8jhm1KU7GfV1qMLixYxjITYYMA7PHx
	dIb4WVq3qjaetmviN9ultWIvMCahuS0y5Z810X7mwgyUxsxYyHUWlk+dAfeeojRf
	7835Sx8EqbEiCVALOM419n47h0F2ycNJn6rxcElnApk59m/kXZApMcrsM7GPbh0v
	C5VWWtB3RHYKXvkEqnEVbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710280814; x=1710367214; bh=6D5/LLqXdsYWMYX8yW9HXHbC3p01
	jO2T7c0aof4XfOM=; b=KaM4Nf4PhoWL4F6PYj11ahyRwaZuPWtBQ18XxW+ip6Wz
	s2X1OBieOqMOEgsrXkVyonMPWS1A1g0LbA2YdSFXTsECChoBmlIfIhJ65NMhauWX
	uJ66ZWVDj7QvCWQZEc9lltt4UlrI9E6u089F7OPWix2nke6YFf43C34wOfYNcdMH
	741fJZML4bhNoowsljfhM3xqjH0eyMUCEyNy0rL8bf/STyhilN4TI0JrD2lweF6R
	IErnfjXCr4rxKd8RpWU7Y9qATaGCq2JiZ+677ZoWpglpTr6UYbhQENYAOu944k6T
	ZYptUu01t57jS+L3Uxq5FahgJeN1fhM5ROl904GOPQ==
X-ME-Sender: <xms:bdDwZdHgzewu95am36ovETe-I2wX-YAcxLukrybSjnepBVFXGTfh4w>
    <xme:bdDwZSWbRpKeXNi5D_7bZJB5AXmG7up_Yo5xMra99Cqp_HEY1QXOFSEkwJeEUtzb7
    t2JUFEdCu9whQ>
X-ME-Received: <xmr:bdDwZfKk78rgYK9XKgW28QPjxQ3_yyn59-5UhTm2s5E2Fr1YgGWU_HeB0IWBdwC-9-SvFr7KUG1khNDQFvxJo-MNNFQungbuag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:bdDwZTETNublYWpjR0bb8OGX0OeaxcdfZGYau4cijeB8ycTKoKOaeA>
    <xmx:bdDwZTX2swXEpswXoJNGVfbp6ezCKGyxBhRvAo2KWeiiuq3V2PsaXg>
    <xmx:bdDwZeMOlozZRQl-Rvl8gyz9rMsTP2jLHnFCzJkVmBkNtUHZAN8Uqw>
    <xmx:bdDwZS3aJbOGv3BIwOcK76FgLxGViCE8He_l8dgDDbWSomlH8L3tGw>
    <xmx:btDwZVIcKaY8Dd9kBcsEm8pP0FDooIfkgg1IsMNdrAU8W7PD62SIFw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 23:00:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZfDQaq8DWh1Mz2KW@mail-itl>
References: <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zap7uX3k0kfoMOoF@mail-itl>
 <Ze2-dkQkn41WJ60v@mail-itl>
 <9207a620-2998-49dc-992f-5d756d3f6524@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TOyaDT5Pyb2A8YcA"
Content-Disposition: inline
In-Reply-To: <9207a620-2998-49dc-992f-5d756d3f6524@amd.com>


--TOyaDT5Pyb2A8YcA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 23:00:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms

On Tue, Mar 12, 2024 at 05:07:12PM -0400, Jason Andryuk wrote:
> On 2024-03-10 10:06, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jan 19, 2024 at 02:40:06PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> > > > On Wed, Jan 17, 2024 at 3:46=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com> wrote:
> > > > > On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > > > > > As someone who hasn't built a kernel in over a decade, should I=
 figure
> > > > > out
> > > > > > how to do a kernel build with CONFIG_PHYSICAL_START=3D0x2000000=
 and report
> > > > > > back?
> > > > >=20
> > > > > That was largely a suggestion to perhaps allow you to gain some
> > > > > workable setup. It would be of interest to us largely for complet=
eness.
> > > > >=20
> > > >=20
> > > > Typo aside, setting the boot to 2MiB works! It works better for PV
> > >=20
> > > Are there any downsides of running kernel with
> > > CONFIG_PHYSICAL_START=3D0x200000? I can confirm it fixes the issue on
> > > another affected system, and if there aren't any practical downsides,
> > > I'm tempted to change it the default kernel in Qubes OS.
> >=20
> > I have the answer here: CONFIG_PHYSICAL_START=3D0x200000 breaks booting
> > Xen in KVM with OVMF. There, the memory map has:
> > (XEN)  0000000100000-00000007fffff type=3D7 attr=3D000000000000000f
> > (XEN)  0000000800000-0000000807fff type=3D10 attr=3D000000000000000f
> > (XEN)  0000000808000-000000080afff type=3D7 attr=3D000000000000000f
> > (XEN)  000000080b000-000000080bfff type=3D10 attr=3D000000000000000f
> > (XEN)  000000080c000-000000080ffff type=3D7 attr=3D000000000000000f
> > (XEN)  0000000810000-00000008fffff type=3D10 attr=3D000000000000000f
> > (XEN)  0000000900000-00000015fffff type=3D4 attr=3D000000000000000f
> >=20
> > So, starting at 0x1000000 worked since type=3D4 (boot service data) is
> > available at that time already, but with 0x200000 it conflicts with
> > those AcpiNvs areas around 0x800000.
> >=20
> > I'm cc-ing Jason since I see he claimed relevant gitlab issue. This
> > conflict at least gives easy test environment with console logged to a
> > file.
>=20
> Thanks.  I actually hacked Xen to reserve memory ranges in the e820 to
> repro.
>=20
> I claimed the *PVH* Dom0 gitlab issue.  PV is outside of my scope :(

That's not bad either, it means we're getting closer to usable PVH dom0
:)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TOyaDT5Pyb2A8YcA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXw0GoACgkQ24/THMrX
1yypLgf5AZRwhRFiM87Nuk24tv2H3Xhdxk2BfkcZ1NF4tqqXiileISW9XtYW241D
OQJb7Wd802Ynh/zX84QbJ9BF/FmaQ6pmHN5X2EJzdWkBWzdQ1PJqbBgpyMijpBvw
FufBj8BFFna+TwI2fiumMNlUdd6aLIKUevB9Gpyy+8w6na1EIDBbt+GdE86eTL/a
oRihxPahjQjNJqnmHoBuqgzByRmR46tL6lAtjVQKoEfNfgOUnpF7vlY8uBdJ2+aU
u31KOznD7AJ5rSrt7S2qShM0jlTJcm+S2e6Mx2aqhG9qTa/9SpOpztfzRCU2+DBi
biuY561P6xylxImiJUhs2ZonDeReEQ==
=Nrvi
-----END PGP SIGNATURE-----

--TOyaDT5Pyb2A8YcA--

