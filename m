Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B7C6F8AC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 16:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166098.1492726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLjm5-0000c1-Oc; Wed, 19 Nov 2025 15:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166098.1492726; Wed, 19 Nov 2025 15:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLjm5-0000Zc-Lf; Wed, 19 Nov 2025 15:07:13 +0000
Received: by outflank-mailman (input) for mailman id 1166098;
 Wed, 19 Nov 2025 15:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5Pp=53=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vLjm4-0000ZW-KN
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 15:07:12 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68fb7431-c559-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 16:07:06 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 63DB87A00F7;
 Wed, 19 Nov 2025 10:07:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 19 Nov 2025 10:07:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Nov 2025 10:07:01 -0500 (EST)
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
X-Inumbo-ID: 68fb7431-c559-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763564824;
	 x=1763651224; bh=1aAjMxf6lY3tTY/5GBouk1D+THYn4Lckf9hl5t7pRUM=; b=
	KalmHQV0iOV0aCxxKyox4gFDmdW3EAPMC+dOfpWW5SHvOz4IvPMUpDX98eRWJB/Q
	UqP0mdgG525qmm2l2zLC1aYa6JuKy+7HLLxyW5Qq7MmSIWQ6xeQnxsFxKdZWJhVp
	AIIa3EwvPSyPs5jeTRDjJ7Z8WvPbDGdIC6drh6h+4Y1XnvEl1DUuAANWdQaygJij
	2JiGYadQQtJUtewJlkHKCycPsi4AUbA3pZZIABeoHBcGCEOHzmznhIoIyhbDdx3F
	Rb0GtKkvQbdIxIuHNiibZRJVXzlMf1i+mQoZZiM3KYBCgmiS6JjZIkfWZK6KDAPL
	hkoEUPUi2/Mvl4AO2Ov2wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763564824; x=1763651224; bh=1aAjMxf6lY3tTY/5GBouk1D+THYn4Lckf9h
	l5t7pRUM=; b=135QgpmGQS3W5vsBFTXVohtJFCZuzAtcgMuEvNzt28IZJEFuRpn
	S21sWaIwYYaoewzOEYGWM23KTUhB9whqWSVmPJFYOS9a+NYtDCE95ypcWOzoGkSh
	vmVrz5H1AfwIh3fzC4LKPHMkIjOG5cuFuPpnl7G91Y1+AhM15YUyf5kELe4v0+x8
	NgU3X+Kn3mxb2LEP3gwE+ohfU9Xah8NpFqbF14jV2lGYrBcNIgGuYMXE2ZU6XmHI
	Q1qSi4Fs/mgb3051S3TS2HxPUE+dScSprDJW/F7Df7HobD/oqz9DZTfxBcwzmui1
	wGEBvM4zWYgUEq2m6m9PGD5/idiRgPRRPlg==
X-ME-Sender: <xms:F90daSxdxfqd6TUA60MtCjQPVONWb8I8D16U6zUrMhHR9faSQ3e-_Q>
    <xme:F90daR8nFMKgv3A6ZeyrJr3-D8Airtet334cV1R2r19naL4qhDuaILRVoB7jCKDay
    oy-4OrDMj2NVocFy7E4dWgcWFaWER_XcE6YrEZz0L2y3vJfkQ>
X-ME-Received: <xmr:F90dac_PxXe5aCKFnJk3jdin7P0tBrdCtM89d24wpfKeNFGuXw90L4QjtPs3_ogHQ5rF7bko_3stwxtXD2MLZKbWhXxmj2tZFQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffduvdfg
    veeghffgvdejheekteefjedvieehteetkeevheefteduffejhfeihedunecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhtrhhmmhdrnhgvthdpghhi
    thhhuhgsrdgtohhmpdhlughsrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepfhhrvgguugihjeejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeholhgvkh
    hsihhirdhkuhhrohgthhhkohesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgvughi
    rghnohdriihighhlihhosegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvg
    hvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehfrhgv
    ughirghnohdriihighhlihhosegtlhhouhgurdgtohhmpdhrtghpthhtoheprghnthhhoh
    hnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdr
    ohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrd
    gtohhm
X-ME-Proxy: <xmx:F90daZ68Qf2BXFy6SHw5EvKFcczlK0Yt9lqo3SFsQ24iFvAWP1LGhw>
    <xmx:F90daVbLhemS8EmX-reY-bpQFbGcKgOqeTz463Tas2hRHlfGgq6U4A>
    <xmx:F90dab8WDUhc5kMzPL6gAVNsUHDJKcUvj3y2252Hp-0XNVc78Y7qDQ>
    <xmx:F90dacTckexE1ov4Bdh-sq7RUyfWK21f6B0cFtU1qNTu4qYS6JCTVA>
    <xmx:GN0daVX9Dmcqsv_sx9qCjQP-QQy04Upykdtpwjk-VnMs1KXP8kiPBMLo>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 19 Nov 2025 16:06:59 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
Message-ID: <aR3dFPTeH4Wegodd@mail-itl>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
 <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8V+dyZVEzhjP7r7u"
Content-Disposition: inline
In-Reply-To: <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>


--8V+dyZVEzhjP7r7u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Nov 2025 16:06:59 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default

On Sat, Nov 15, 2025 at 06:23:08AM +0000, Frediano Ziglio wrote:
> On Fri, 14 Nov 2025 at 19:18, Andrew Cooper <andrew.cooper3@citrix.com> w=
rote:
> >
> > On 14/11/2025 3:40 pm, Oleksii Kurochko wrote:
> > >
> > >
> > > On 11/13/25 4:43 PM, Frediano Ziglio wrote:
> > >> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >>
> > >> For xen.gz file we strip all symbols and have an additional
> > >> xen-syms.efi file version with all symbols.
> > >> Make xen.efi more coherent stripping all symbols too.
> > >> xen-syms.efi can be used for debugging.
> > >>
> > >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > >
> > > Thanks.
> >
> > Thanks.  Unfortunately CI says no.
> >
> > Ubuntu's 20.04, 18.04 and 16.04 all fail:
> > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2159622=
869
> >
> > From 16.04:
> >
> > 2025-11-14T18:01:51.192964Z 01O strip xen-syms.efi -o xen.efi
> > 2025-11-14T18:01:51.198151Z 01O strip:xen-syms.efi[.init]: relocation c=
ount is negative: File truncated
> > 2025-11-14T18:01:51.198166Z 01O strip: xen.efi: Failed to read debug da=
ta section
> > 2025-11-14T18:01:51.198169Z 01O strip:xen.efi: error copying private BF=
D data: File truncated
> > 2025-11-14T18:01:51.198932Z 01O arch/x86/Makefile:207: recipe for targe=
t 'xen.efi' failed
> > 2025-11-14T18:01:51.198937Z 01O make[3]: *** [xen.efi] Error 1
> > 2025-11-14T18:01:51.199616Z 01O build.mk:90: recipe for target 'xen' fa=
iled
> > 2025-11-14T18:01:51.199619Z 01O make[2]: *** [xen] Error 2
> > 2025-11-14T18:01:51.200402Z 01O Makefile:600: recipe for target 'xen' f=
ailed
> > 2025-11-14T18:01:51.200409Z 01O make[1]: *** [xen] Error 2
> >
> >
> > I find it hard to believe that the relocation count is really negative,
> > and given that newer binuitls works, I expect this is a binutils bug.
> >
>=20
> Unless the message is just misleading I find it hard to have a
> negative number of items in a container.
>=20
> > Nevertheless, we need some workaround.  Given that the previous
> > behaviour was not to strip, I think we can reuse that for broken toolch=
ains?
> >
>=20
> Something like that ?
>=20
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index a154ffe6b2..c465eb12e2 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -236,7 +236,9 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
>         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
>                 -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
>  endif
> -       $(STRIP) $(TARGET)-syms.efi -o $@
> +       $(STRIP) $(TARGET)-syms.efi -o $@ || { \
> +               LANG=3DC strip $(TARGET)-syms.efi -o $@ 2>&1 | grep -q \
> +               "relocation count is negative" && mv -f $(TARGET)-syms.ef=
i $@; }
>  ifneq ($(CONFIG_DEBUG_INFO),y)
>         rm -f $(TARGET)-syms.efi
>  endif

On Ubuntu 20.04 it fails different way:

    strip: xen.efi: Data Directory size (1c) exceeds space left in section =
(18)
    strip: xen.efi: error copying private BFD data: file in wrong format

Looks similar to:
https://lore.kernel.org/all/3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ=
43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=3D@trmm.net/

Qubes has this patch:
https://github.com/QubesOS/qubes-vmm-xen/blob/main/0608-Fix-buildid-alignme=
nt.patch

    diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
    index 9a1dfe1b340a..26a23a7b0651 100644
    --- a/xen/arch/x86/xen.lds.S
    +++ b/xen/arch/x86/xen.lds.S
    @@ -171,6 +171,7 @@ SECTIONS
            __note_gnu_build_id_end =3D .;
       } PHDR(note) PHDR(text)
     #elif defined(BUILD_ID_EFI)
    +  . =3D ALIGN(32);
       DECL_SECTION(.buildid) {
            __note_gnu_build_id_start =3D .;
            *(.buildid)

Lets see if that helps:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2167783980

And few lines earlier there is also:

    ld: xen-syms.efi: warning: section .init: alignment 2**15 not represent=
able

> It will fall back to not stripping in case that bug is detected. I
> don't know how to test it.
> (the LANG=3DC is to always force the English message).

If going this way, use LC_ALL=3DC (otherwise LC_ALL=3Dsomething present in
the env would override your LANG=3DC). But given there are different
messages, this may not be the best option.

And TBH, I don't like silent behavior change based on (unknown) version
of binutils. Lets see if the alignment adjustment helps. While it
shouldn't be necessary on newer binutils (thanks to Jan's fix there -
see thread linked above), IMO it isn't too bad to add it, to keep older
versions happy. And it can be dropped, once we raise toolchain base
version next time.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8V+dyZVEzhjP7r7u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkd3RMACgkQ24/THMrX
1yytqQf9GCOjZO8eg/0Md3rKTtGpo0Ze7JCf0Wsb9HtG50wlWY3lwpEr6poGtDjK
nTzUu1XDtYORf5FuJEbmta/1F8jf/IrmfcDhvBbIYEGdNVu4vcle/gXGsr1PJVda
b2biooGbNPzqJBewZuq4me7+Kn/Ri/0CE4n6ik10s8RFhXauyPUP/ar8jHazvj6l
iKKtJ48A+2kaHHez2Q1h6dWmk4bvoAwxPFtcfNYUwSGPszq3beMKquRa/6stz6Ey
C1TRPEVkFYI/T57oKiCTBduOauVyVawOlLjQDnt5MnuILBMRg3EzQ0lysERhEcRH
kp19ftScMMpawtjhDLRhLVQW3+zpFA==
=DOlS
-----END PGP SIGNATURE-----

--8V+dyZVEzhjP7r7u--

