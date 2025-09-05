Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8543B45560
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111733.1460328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuU66-00038S-CR; Fri, 05 Sep 2025 10:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111733.1460328; Fri, 05 Sep 2025 10:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuU66-00036T-9F; Fri, 05 Sep 2025 10:55:14 +0000
Received: by outflank-mailman (input) for mailman id 1111733;
 Fri, 05 Sep 2025 10:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URqW=3Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uuU64-00036N-H8
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:55:12 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca9bb988-8a46-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 12:55:11 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 52D041D00481;
 Fri,  5 Sep 2025 06:55:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 05 Sep 2025 06:55:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 06:55:07 -0400 (EDT)
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
X-Inumbo-ID: ca9bb988-8a46-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757069709;
	 x=1757156109; bh=hKIFy0OKwxWfXQIowWpFuRO3eTQrakoMYWSH+0AcxNU=; b=
	WtY4XCaAQolLukdvMMvVdjDqFQ461w2Jz3BImDWkG1y8G1eoWmTm1afXoEXeFGfQ
	3BzoYClekrHdYeyF+gMAoNqVbD+++70i/9pvdL4h557z1fBGEUvkG3ZZiO5hMFpj
	91oHEWJamx2qAeEVrW/SVXn3u1GpfTVrNSkh+E4P4drOIU9+HC7bUr4URkUiOwtB
	P24d1QEWCuu2uiWgOHrgTzIRaazwOM5/XGLvu188MqagvPbK5ElweecJ7D4PZKWs
	eWVFElI/zfUGdh5IupbEPC5Z0wMuCOg1EbbveOA+izl7wUejQOugPQ8eAELlC8we
	DGrJuWxOPrWPIR5CeQ0ZwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757069709; x=1757156109; bh=hKIFy0OKwxWfXQIowWpFuRO3eTQrakoMYWS
	H+0AcxNU=; b=XPLZz7r8b8K66emBC+mX9I9UtiPditzifV48nWLMX6iA9/GalnY
	a3T3xsdaIu4Eu9yXccT/RTBcZiLOMLXmpbgomAvzNNGi/jU6NsWPTO/WM6vhAprn
	7aUpCjdSo6IfdOTUVwFrp6eWH2hAz72cXzbHk8EWWu+ikglIFenGZgyaXrkQ87z8
	9Vyh7YIGQzVD8VG8qQql0SHwXiW4h/PLqR068duS69tWm24XkXwq26caXbMnnE37
	/9ozEhboiyw6Nv/aVrkTU4cG0CkIRDh+UHX3iNMJ2xPeeO92vplT4nvxhrrFB2OO
	sx5fMhrGZ1q7YOrAap0vhng+u3D8Ci4RMyA==
X-ME-Sender: <xms:jMG6aP2F1sLNcin-33afiG4ojKs6cjmy5IIdnbM-5Ayv4k4EiCyFdQ>
    <xme:jMG6aLAYgTA14ghbaKG7V0SBUQL-Y1lg__ZWAeLW1jcMhUzKRmssX8lkX7C31QrNL
    -Ap8dw2nuovWg>
X-ME-Received: <xmr:jMG6aLjATnof1mO9Mtaty5-icR-fdtfk_rSjlXgkhR4Ijpf-bavr8uc1FeQBRzQEMkxkat4cTqLg9Ixei-RM8_N145i29fq4oXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeluddvkeej
    ueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomhgrihhnpe
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrph
    gvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopegrnhgurhgvfidrtghoohhp
    vghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlse
    grmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthht
    oheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlhes
    lhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:jMG6aNPsizZczGAS9xqzM9ox3IZ2iRKAnGWdDg7j-yI_FAdtsYqeJw>
    <xmx:jMG6aL9llR2NxeEISRG36hgBwxwhN1mYOaC7_VcmFTeWi6d5yCwNBw>
    <xmx:jMG6aOc83cK_r8kceBPygdisv22hKyFZnbjoXUckArVjYJs_KpgRQQ>
    <xmx:jMG6aKxYkmbMWMtXVWG_y05lWJHXHizsOXeSsTOElf63po6dMq4P_Q>
    <xmx:jcG6aHmAuvKXuTmtVz0aKMqyI3GVT855T930hPFTyMqyJTbh7kRbO1sF>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Sep 2025 12:55:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor
Message-ID: <aLrBiVToB43D4klf@mail-itl>
References: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
 <488408be-4728-4666-89a5-ac5b438bdbf5@suse.com>
 <aLmhz9P1c9wYjdwp@mail-itl>
 <d8d57a91-eaca-4896-ab59-72136c54a5e4@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TqfnIgzKmzVj48kq"
Content-Disposition: inline
In-Reply-To: <d8d57a91-eaca-4896-ab59-72136c54a5e4@suse.com>


--TqfnIgzKmzVj48kq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Sep 2025 12:55:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor

On Fri, Sep 05, 2025 at 10:15:12AM +0200, Jan Beulich wrote:
> On 04.09.2025 16:27, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Sep 04, 2025 at 02:58:20PM +0200, Jan Beulich wrote:
> >> On 04.09.2025 13:41, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Use -fdebug-prefix-map in preference to -ffile-prefix-map, as it's
> >>> available in earlier toolchain versions. But use it together with
> >>> -fmacro-prefix-map (if available) for hypervisor build, otherwise it
> >>> still contains some paths in out-of-tree builds.
> >>
> >> I consider it wrong not to use -ffile-prefix-map when available. That
> >> already covers more than "debug" and "macro", and it may gain further
> >> functionality.
> >=20
> > I asked about that on v1 and got ambiguous answer suggesting the opposi=
te:
> > https://lore.kernel.org/xen-devel/0370c0eb1fd9ac00acab016792132fa0b943d=
384.1742317309.git-series.marmarek@invisiblethingslab.com/T/#m74a8883835e30=
fb74a85b07a7b14507ee52e7c65
>=20
> Ambiguous answer(s)? There's no reply to that mail of yours,

I mean your email to which I responded.

> and I don't
> see how the conclusion drawn fits my earlier comment. That was more
> towards what I did in v1 of my patch - fall back to the more widely
> supported option when the less widely available one can't be used.
>=20
> >>> --- a/tools/Makefile
> >>> +++ b/tools/Makefile
> >>> @@ -1,4 +1,4 @@
> >>> -XEN_ROOT =3D $(CURDIR)/..
> >>> +XEN_ROOT =3D $(realpath $(CURDIR)/..)
> >>> =20
> >>>  export PKG_CONFIG_DIR =3D $(CURDIR)/pkg-config
> >>> =20
> >>> diff --git a/tools/Rules.mk b/tools/Rules.mk
> >>> index 725c3c32e9a2..428fce094819 100644
> >>> --- a/tools/Rules.mk
> >>> +++ b/tools/Rules.mk
> >>> @@ -166,6 +166,8 @@ endif
> >>>  CFLAGS-$(CONFIG_X86_32) +=3D $(call cc-option,$(CC),-mno-tls-direct-=
seg-refs)
> >>>  CFLAGS +=3D $(CFLAGS-y)
> >>> =20
> >>> +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath $(XEN=
_ROOT))=3D.)
> >>
> >> Here and below - no need to use cc-option-add for -fdebug-prefix-map,
> >> which all permissible compilers support.
> >=20
> > Ok.
> >=20
> >> Further, again as per reply to Andrew on the thread hanging off of my
> >> patch - I don't view it as desirable to leave the tools/ prefix in
> >> place, or e.g. for libraries, the entire tools/libs/<subdir>/ part.
> >> Imo every binary should have only the path (if any) from its own source
> >> root left. (And yes, how to deal with e.g. shared include files isn't
> >> quite clear to me, yet. Maybe we actually need to pass two options.)
> >=20
> > I don't think it's valid to strip arbitrary prefixes from debug symbols,
> > especially in tools. This will break some automated tools that try to m=
atch
> > coredumps (and similar) to source code and sometimes even debug symbols
> > too. But even for manual usage, having to jump between directories (I'm
> > not sure if gdb supports multiple source dirs at once?)
>=20
> Pretty necessarily: When debugging you might easily cross project boundar=
ies.
>=20
> > just because you
> > happen to debug a binary that use more of libraries isn't exactly
> > desirable.
> > I think the paths in debug symbols and similar should match the layout
> > in the source repository, not a subset of it.
>=20
> Well, okay, we disagree here. To me, xen.git really is an agglomeration of
> too many things in a single repo. If things were properly split, you'd end
> up with what I'm asking for anyway.

To give specific example: Fedora installs source files in
/usr/src/debug/(package name) and then does debuginfo postprocessing to
point at that path. Debian does pretty much the same, and I'm sure many
other distributions too. Now, if you strip part of the path from debug
symbols, they will not point at the correct source location.
Of course Fedora/Debian/etc package can apply a patch to adjust it (as
it's currently supplying -fdebug-prefix-map via CFLAGS), but IMO forcing
every distribution to basically undo upstream change is a wrong move.

> > Theoretically this doesn't apply to the hypervisor yet, as I'm not aware
> > of any tool processing xen memory dumps automatically (and those for
> > manual usage are quite unstable, to say the least...). But I don't think
> > it's an excuse to have incomplete paths in there, just to save few
> > bytes?
> > The only case where I can see it would make some sense is out of tree
> > build, where indeed it's about just the hypervisor, not the toolstack
> > (IMO due to the build system limitation, but well...). But at the same
> > time, having different path variant depending on it-tree/out-of-tree
> > build feels weird.
>=20
> Which is why I'm arguing for the dropping of the xen/ prefixes, as that's
> how things come out in in-tree builds.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TqfnIgzKmzVj48kq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi6wYkACgkQ24/THMrX
1yzzNgf9GP2zBm7of9MCMIXNHy7gMPxlcVV/PCQxudG+RPi6gtjdTeKW5QSlHtbI
hb50Kkrqa20oN5AIN6seeTgLpxtlXYj1sa9Ht8uTyDd40i9DBi72vjATSwTemhoz
B9E2NTShQ7PG9Ow/jrYQ97LKAntDCOScEhDOr16i2FX5C6R4++ejBSbmt6gY3q+o
7lxiuyMUaSCn/53nT1yKuYA1oGYMU5hdBDtrunEYQS0PYdhVrTxrn29YZWaSlnM0
jYea+iMyah9XG6IbmuY67HWyKtVRNRVTMbu1alizcVleukgHsQpGvpEA5EWLF3xl
QpkEo1lNPQrtDw+SUVsRfha+XjaX+A==
=A/Mn
-----END PGP SIGNATURE-----

--TqfnIgzKmzVj48kq--

