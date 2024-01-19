Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD8F832B5C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 15:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669079.1041692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQpuI-0006A8-II; Fri, 19 Jan 2024 14:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669079.1041692; Fri, 19 Jan 2024 14:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQpuI-00068P-Eu; Fri, 19 Jan 2024 14:31:42 +0000
Received: by outflank-mailman (input) for mailman id 669079;
 Fri, 19 Jan 2024 14:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJ2q=I5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rQpuH-00068J-DV
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 14:31:41 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74625087-b6d7-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 15:31:39 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9DC3D3200A90;
 Fri, 19 Jan 2024 09:31:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 19 Jan 2024 09:31:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jan 2024 09:31:34 -0500 (EST)
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
X-Inumbo-ID: 74625087-b6d7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1705674696;
	 x=1705761096; bh=HzQff4VOgNm4g3uxtYYHlNnWQahaduPuU5y/81EYHEA=; b=
	Qk1VFoHPHWqrvaW4YV1xsvlFPftxAesGfeY0zQG3SQGzb6/HPeZcqRPDdScC85oQ
	OhVwHKnH0iJn3nayruUZLpW2w2m3Ob7kV8gFB4cm1tS7Np7vAVXbG6CC8NPlwOLY
	YKBX9j4LGTaVGhnvZao1yOkG3bPY9w1OIP7A6/jWhK+QWXI2H5mbg9pnI22ro2VV
	YYLFcVabLkycZKP0wjVQz4erSkllm3LYMlFNo6MlLQN0LdomScUZez1DFOMgV8Bs
	BEaGC5BXvCfdH0sloFQg8gprOnptSvGkwpj8VM7LLmmL6l4qC4yuoRCFeeDM7xqO
	+GXqAMcNMqho/tGkgIjy4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705674696; x=1705761096; bh=HzQff4VOgNm4g3uxtYYHlNnWQaha
	duPuU5y/81EYHEA=; b=aTrlnqnGYxfzCasqQquKLeHzjeLDykX32VZfe6NQvC2o
	kepviPKORovtfAAtpn0cd2+znyu7plM0TvCLbhCw7QsnP5Mb1jfdwdFpuxaocNNj
	OvFuh+FFfdnjLeoLQXUGpNCyXjNrh+ZpLvn7G4Cj6kppNrK7Yeu+9U0LTbPoNTGb
	S+Igg2e9L6JoJ945taalUBpSpNto02hhDjQSSmyhuzyvWW6qH9qJm9yxCT3riI6r
	ZjC0IsfOeuf0Hv2hLEWNnWOOaPrTxQ4+kKz/AxnRWAQhWCzJYtMbahHt9/wI3PZn
	U7vR19NNvcKOq3J9UbClPS7ywlFKyhgIe4Djz7VGNQ==
X-ME-Sender: <xms:x4eqZcXsm7bmxUsTgpo_iTUgaKzkcb08AVpoCF-_sb_2vUlDjX0NPQ>
    <xme:x4eqZQnqrjraGn3pCuLgyo6Xl2Zd6IjG0We6zJQh-U_JU4_rS58S5XkfdDgwqvGXM
    Cgo_0ZkpsXIHQ>
X-ME-Received: <xmr:x4eqZQYUaqitTJ9OiRMT1Izw3fJbAnX91hsWUlmUQMW6AmeZX55FBi8Fr4RyjA002MXsPrsn7vsrsLXVGolHoTH-drCLTbeBmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdektddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
    uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:x4eqZbVWk_FA1jaHfV_tX9MFJboD1Lzvw_uWvVaolbbaYcBGnM1IDw>
    <xmx:x4eqZWlNwlwBenn9ggVyQRS85NEjyP2h3fVuPXwPCp-kOxPi9HesJQ>
    <xmx:x4eqZQfo-ft9-0CGiTHB8gf_vJkSnK-ZfKwUPeu2FS0QQnuWzto6Cw>
    <xmx:yIeqZbw-GMdtrz3q7e-e75ZbczDLAdcKKMxEBPOJOsOTmR1-cRTMuw>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 19 Jan 2024 15:31:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZaqHxOGCDGJ2SDTJ@mail-itl>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zap7uX3k0kfoMOoF@mail-itl>
 <8e84f558-a4be-4410-a16a-230864f42a1a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qE89MEZuomnIOOaK"
Content-Disposition: inline
In-Reply-To: <8e84f558-a4be-4410-a16a-230864f42a1a@suse.com>


--qE89MEZuomnIOOaK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jan 2024 15:31:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms

On Fri, Jan 19, 2024 at 02:50:38PM +0100, Jan Beulich wrote:
> On 19.01.2024 14:40, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> >> On Wed, Jan 17, 2024 at 3:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>> On 17.01.2024 07:12, Patrick Plenefisch wrote:
> >>>> As someone who hasn't built a kernel in over a decade, should I figu=
re
> >>> out
> >>>> how to do a kernel build with CONFIG_PHYSICAL_START=3D0x2000000 and =
report
> >>>> back?
> >>>
> >>> That was largely a suggestion to perhaps allow you to gain some
> >>> workable setup. It would be of interest to us largely for completenes=
s.
> >>>
> >>
> >> Typo aside, setting the boot to 2MiB works! It works better for PV
> >=20
> > Are there any downsides of running kernel with
> > CONFIG_PHYSICAL_START=3D0x200000? I can confirm it fixes the issue on
> > another affected system, and if there aren't any practical downsides,
> > I'm tempted to change it the default kernel in Qubes OS.
>=20
> There must have been a reason to make the default 16Mb. You may want
> to fish out the commit doing so ...=20

https://git.kernel.org/torvalds/c/ceefccc93932b920

    Default CONFIG_PHYSICAL_START and CONFIG_PHYSICAL_ALIGN each to 16 MB,
    so that both non-relocatable and relocatable kernels are loaded at
    16 MB by a non-relocating bootloader.  This is somewhat hacky, but it
    appears to be the only way to do this that does not break some some
    set of existing bootloaders.

    We want to avoid the bottom 16 MB because of large page breakup,
    memory holes, and ZONE_DMA.  Embedded systems may need to reduce this,
    or update their bootloaders to be aware of the new min_alignment field.

Large pages (in practice) do not apply to PV dom0, but other points
could in theory. That said, I checked few other systems and I don't see
any reserved regions there (there is large usable region at 0x100000,
other reserved regions are near the 4GB boundary).
This isn't very representative sample, though...

> In Qubes, though, I understand
> you're always running with Xen underneath, so unless this same kernel
> is also needed to run in HVM guests, some of whatever the reasons may
> have been may go away.

The same kernel is used for PVH/HVM guests too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qE89MEZuomnIOOaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWqh8QACgkQ24/THMrX
1yywvQf/aP4oCph4GZC2yNfBzcEju5ZfZ9ofMOhDg5t/byFZQ7ZBS3ZCUwPo+aYy
KDvnidfszWbZYK+UPF6QE/Cikf1l3fRKpcJ3rMPF29U2GK63oz33+NicDA0+Vx4/
pQuGwKVTqoENRdCWMs84Z8IXXhrkgGcAxpAt0qykiIJf6KUCrh9BwfRvgJKyNSPE
zAPOogtIeD36gCUmTXokLBi43qoiM4LF1kpxDYYoGrV+Lu7Ao7ywRMoxJkdTkUxD
PsKuzFD5evS1r6CEVxSkEtZcbqFqUIG51qy+8TpjBe+VnXogazr82FK5X6/fH/DE
aiydzH1dzRp5PvBnQ75M3gtUcFhXsA==
=OYO+
-----END PGP SIGNATURE-----

--qE89MEZuomnIOOaK--

