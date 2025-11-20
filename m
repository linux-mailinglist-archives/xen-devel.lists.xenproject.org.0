Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06437C746D9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167439.1493758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5Hb-0002rq-6t; Thu, 20 Nov 2025 14:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167439.1493758; Thu, 20 Nov 2025 14:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5Hb-0002pL-2n; Thu, 20 Nov 2025 14:05:11 +0000
Received: by outflank-mailman (input) for mailman id 1167439;
 Thu, 20 Nov 2025 14:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcKq=54=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vM5HZ-0002X1-H6
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:05:09 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb0dab89-c619-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 15:05:07 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 83607EC0099;
 Thu, 20 Nov 2025 09:05:06 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Thu, 20 Nov 2025 09:05:06 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Nov 2025 09:05:03 -0500 (EST)
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
X-Inumbo-ID: eb0dab89-c619-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763647506;
	 x=1763733906; bh=k/mWVpw3b9Ob1R7htJDw9+YdKsU9wk+ayb/TswsI7yg=; b=
	DhSlyQYI10KWQbW2cjgDWMQNEdcU8Q55Vu6piDwdQA64bWBosMA5wXtt8egjc3Fr
	+tIeTJBFo+05C5Vg1eTXRDdkGbeZx17WUgsS/p9HSpPccervSyU/oCZDn8l9i3aw
	yO4sx83gFnc/aBkoIkZXVZvG0jc/PA16KxeA0pwMkyqWSL0+6khhJdveWNMzozOR
	rIlxKHz/zG/jjul0oxiFLLllHsfSn5AyzoVPV3ugNh2HTce5jG+L8R2IDeeKLomU
	yCtz+Be8V33Dgg9zPM3AfdEB0SN9R9DF7BP3dQSEWK22V8e5T5LF6vgam1C0LCXi
	NzmzhM3Wj2u6++dbVjHsRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763647506; x=1763733906; bh=k/mWVpw3b9Ob1R7htJDw9+YdKsU9wk+ayb/
	TswsI7yg=; b=tObY/oeiDAm2CCjgS2YoALdk5KWg2U60d6JtSA9CHl1wksJx7Rt
	XPT7vcTVLGfFBuDz3i6u21lbQ162gAnlSAsOsBgLbiI2kqUDMJ3XyT95TmDReUG7
	XT+Yx2B45Ev26vLEuRpkUjac6McctQbd9gvelpU7czYZPhQgvPq0GcuSJu9dqxtU
	Cj0luPHAQ5NwoABliF1hyb6WL1Cq+fQ7/CpHSkO0Kg+9rK7IfyJP53h5Iq9dd2GY
	KWNOxYwixvROkuqxjT0yUUlIbU28msnB2ParoejasSQLrg6FSoihsHywKYs4eoCp
	UbTmfanEH20APjjAz0bWSH3aOto5vugwlEw==
X-ME-Sender: <xms:ESAfadecJ7dpskffzhSzMWGCM029hDO8o6QqeAUWXDzr8WKSxUH1yA>
    <xme:ESAfae7kwDiZOfYAYccY9I7xN6OhSVplwLTCLoQ61KlFHU5K_cVw83XlaHBQwDh4V
    im2uZb7n-plku5_pynWbRMrBAwp5KFQzR6MoWLwDQssci95dQ>
X-ME-Received: <xmr:ESAfafKarq6A4rZMkJ3YCacd3pBdKuxBjYGyRdb68IEkrzFdlXJBprS5sic0l9_gTP3VeHdSHo4mVrTTCZWcWj_Xxu83r0xsSmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdejvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeet
    geelleetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhrvgguugihjeejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrvg
    ifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeholhgvkhhsihhi
    rdhkuhhrohgthhhkohesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgvughirghnoh
    driihighhlihhosegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghl
    sehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehfrhgvughirg
    hnohdriihighhlihhosegtlhhouhgurdgtohhmpdhrtghpthhtoheprghnthhhohhnhidr
    phgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhrii
    gvlhesrghmugdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:ESAfaYWsJSNNlf8Qu45kjo62__vIeJA3KpZbL03nIuXaeDfzNcxW5A>
    <xmx:ESAfabF6EFANogXLwLcgIwoqNOU81v57yZ9VCBtQ9y8gxnA55lXlqw>
    <xmx:ESAfaX6CiRzISxfKC1iBJGSZVuJcpyW6o4uLTujTVxfvF5zcoDYoeQ>
    <xmx:ESAfaRdXbSR_87uaS6Ul7sjltZaaPH4SIDRY2yK-m9c_Tjz9rgwLjQ>
    <xmx:EiAfaXByFI-uCIfAM1DN8zB8IHMlO--M1pznogvz7jTnKXoJBaw8EChP>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Nov 2025 15:05:00 +0100
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
Message-ID: <aR8gDojcDEgrTSMa@mail-itl>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
 <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
 <CAHt6W4einkyNX9sV3Ns87fLRaAN+N1b9CM=KVo5kvb1Qk7y=qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LaGtoKxbxQWxZWD6"
Content-Disposition: inline
In-Reply-To: <CAHt6W4einkyNX9sV3Ns87fLRaAN+N1b9CM=KVo5kvb1Qk7y=qg@mail.gmail.com>


--LaGtoKxbxQWxZWD6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Nov 2025 15:05:00 +0100
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

On Thu, Nov 20, 2025 at 01:59:24PM +0000, Frediano Ziglio wrote:
> On Sat, 15 Nov 2025 at 06:23, Frediano Ziglio <freddy77@gmail.com> wrote:
> >
> > On Fri, 14 Nov 2025 at 19:18, Andrew Cooper <andrew.cooper3@citrix.com>=
 wrote:
> > >
> > > On 14/11/2025 3:40 pm, Oleksii Kurochko wrote:
> > > >
> > > >
> > > > On 11/13/25 4:43 PM, Frediano Ziglio wrote:
> > > >> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > >>
> > > >> For xen.gz file we strip all symbols and have an additional
> > > >> xen-syms.efi file version with all symbols.
> > > >> Make xen.efi more coherent stripping all symbols too.
> > > >> xen-syms.efi can be used for debugging.
> > > >>
> > > >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > > Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > >
> > > > Thanks.
> > >
> > > Thanks.  Unfortunately CI says no.
> > >
> > > Ubuntu's 20.04, 18.04 and 16.04 all fail:
> > > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/21596=
22869
> > >
> > > From 16.04:
> > >
> > > 2025-11-14T18:01:51.192964Z 01O strip xen-syms.efi -o xen.efi
> > > 2025-11-14T18:01:51.198151Z 01O strip:xen-syms.efi[.init]: relocation=
 count is negative: File truncated
> > > 2025-11-14T18:01:51.198166Z 01O strip: xen.efi: Failed to read debug =
data section
> > > 2025-11-14T18:01:51.198169Z 01O strip:xen.efi: error copying private =
BFD data: File truncated
> > > 2025-11-14T18:01:51.198932Z 01O arch/x86/Makefile:207: recipe for tar=
get 'xen.efi' failed
> > > 2025-11-14T18:01:51.198937Z 01O make[3]: *** [xen.efi] Error 1
> > > 2025-11-14T18:01:51.199616Z 01O build.mk:90: recipe for target 'xen' =
failed
> > > 2025-11-14T18:01:51.199619Z 01O make[2]: *** [xen] Error 2
> > > 2025-11-14T18:01:51.200402Z 01O Makefile:600: recipe for target 'xen'=
 failed
> > > 2025-11-14T18:01:51.200409Z 01O make[1]: *** [xen] Error 2
> > >
> > >
> > > I find it hard to believe that the relocation count is really negativ=
e,
> > > and given that newer binuitls works, I expect this is a binutils bug.
> > >
> >
> > Unless the message is just misleading I find it hard to have a
> > negative number of items in a container.
> >
> > > Nevertheless, we need some workaround.  Given that the previous
> > > behaviour was not to strip, I think we can reuse that for broken tool=
chains?
> > >
> >
> > Something like that ?
> >
> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index a154ffe6b2..c465eb12e2 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -236,7 +236,9 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
> >         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY=
) \
> >                 -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
> >  endif
> > -       $(STRIP) $(TARGET)-syms.efi -o $@
> > +       $(STRIP) $(TARGET)-syms.efi -o $@ || { \
> > +               LANG=3DC strip $(TARGET)-syms.efi -o $@ 2>&1 | grep -q \
> > +               "relocation count is negative" && mv -f $(TARGET)-syms.=
efi $@; }
> >  ifneq ($(CONFIG_DEBUG_INFO),y)
> >         rm -f $(TARGET)-syms.efi
> >  endif
> >
> > It will fall back to not stripping in case that bug is detected. I
> > don't know how to test it.
> > (the LANG=3DC is to always force the English message).
> >
>=20
> It looks like this change works better and CI is happy.
> It duplicates the linking with -s option if the strip fails.
> Yes, it's a hack and almost duplicates the one command above.
> What about it?

Is it guaranteed to match xen-syms.efi?

There is an alternative option: based on observation that Ubuntu 16.04
runs out of support in April 2026 - which is before Xen 4.22 release,
maybe we can drop that test from CI already?

> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index a154ffe6b2..5f5162841e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -236,7 +236,10 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
>         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
>                 -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
>  endif
> -       $(STRIP) $(TARGET)-syms.efi -o $@
> +       $(STRIP) $(TARGET)-syms.efi -o $@ || \
> +       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> +             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> +             $(note_file_option) -s -o $@
>  ifneq ($(CONFIG_DEBUG_INFO),y)
>         rm -f $(TARGET)-syms.efi
>  endif
>=20
> Frediano

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--LaGtoKxbxQWxZWD6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkfIA4ACgkQ24/THMrX
1yzb6gf/cBiaKevvHFFALj+UfnEL7QTTfW4f/3jOQJlJwKU7NZyx7xNaKMwkdIN0
FJUDWNwR+SzYueoG324VlLD3p/bAsxr8SgzQhkbCsWmYYzk6JuEOM4ex1VrpThjW
6xXvir+WTR0vdDQKdgz5D6xr4DbVjCh65z9E0pT/10F3dLVL+SKkBiUpXnkep5fj
7DQyvA/TnCVjgJc/EDjiTvuxsNBIGy6gm+cGiDhVr/Bglm+VhWcUWg0UoBQqh3Ql
xMAIBo8TGUbxTDkhHuP70nXjHExwxX2FEu7Ln/hoOgaYOxXmLS45Cf6ks8BNXPdA
3zcbngxmO5iNFBV+g/JTHWNfPa07Og==
=8eOE
-----END PGP SIGNATURE-----

--LaGtoKxbxQWxZWD6--

