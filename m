Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C35B43EBA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110336.1459607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAw5-0000J3-Nb; Thu, 04 Sep 2025 14:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110336.1459607; Thu, 04 Sep 2025 14:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAw5-0000GI-JU; Thu, 04 Sep 2025 14:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1110336;
 Thu, 04 Sep 2025 14:27:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vqu=3P=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uuAw3-0000GC-MZ
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:27:35 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a6ed29c-899b-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 16:27:32 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 6B31FEC0275;
 Thu,  4 Sep 2025 10:27:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 04 Sep 2025 10:27:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 10:27:28 -0400 (EDT)
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
X-Inumbo-ID: 4a6ed29c-899b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756996050;
	 x=1757082450; bh=0PF0/TWTKN6ReBqUEasJOa3agjL3JFjZ5ey/uYSth8Q=; b=
	CMtCrvoSVvyBVnKyRCtrjrjzDQpGP5T/lvkAXckgy9L9U5m9iyxS+4UD/k5xEYY+
	bCby0d/Xt0C1Gj5B4OJRHZi3H9hZA8OtVAaQlYEG468KYN4MuqkgAVpQxomUCmJx
	jlX2yybTNisvu7+xiWTDeRqUTAu/sE+TJ9O2TP23c7h+avNIGHOKOxqtI7yBnWjW
	cmaoIXfssgMl/NTraMht2VEtmITluf62Zk5VqNGmtTnHf881u6TCw43y3yADLRd+
	UOMKxyTO2y6A2HtKb11ASzcjpgTwVophNggC2ab/IT7gqYVyJyxg1v+b37gEdFEm
	2eX606CwIzL3iUrmmy29jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756996050; x=1757082450; bh=0PF0/TWTKN6ReBqUEasJOa3agjL3JFjZ5ey
	/uYSth8Q=; b=OV1aL/yEydyqWw761fUOdFqGZ6Ah5G7n6Yt8h5CohpJMpZOjCQA
	Qj1Pd/BWw21ppO8TU8xP7/EcbQa1NbNbtHfrtPedgaKD3rNcyEI65lYKLWbsu2PO
	i5e/IY8PHO6obhb+AtXL+1EF8nBMYJpO0oYaHzrcadVgZCopSJuKYVPVG11NOSqZ
	1WUwcnIZRIBjahwdh6RaNe/PwVgwSx+NkshtuJIsm2V+rivg0hgPG77stFcFThKb
	8eahz3U/UlrKihqXyunA9DIstemq+6kJCz9YEiKqaVehrmpgeoNJf+VcglmHq6/4
	EXC2veK9ACC3Dp71oxXmE2K+zy+FeRu7TkQ==
X-ME-Sender: <xms:0qG5aMFGC-KrCtLs_pqD4BtBheW5DOolyGTjNkd7AIRZeLU3EJbytA>
    <xme:0qG5aCRE14uBsrE6G9fPgRxU8HtEzO060T2LrLMI2QiMkk1B-5PeOW0mRgbKj9ELv
    pG_0r_me5lX6w>
X-ME-Received: <xmr:0qG5aBx5-W8uMnD5LxhNOmYQBlg-mJinPvtwKWiVypgL2dUxxsb_wi6_vIIu9r-4frILLqrcb9jExTFLN26rbXyGs6W1_IEm1xM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeivdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfekhfelgeeu
    tdduvddtveetheetudevudelffdvhfffffehjeegleevtdeffffgnecuffhomhgrihhnpe
    hkvghrnhgvlhdrohhrghdpghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprg
    hnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopegrnhgu
    rhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrg
    hlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdho
    rhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpth
    htohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:0qG5aGdHFub4NKeyl_xCeDP-uqDT_36YuMAv3UPMaKTLbJJnPgyE1Q>
    <xmx:0qG5aMPuTgGyB9EbwJV6BhTYPgzuYHdq9scs6UevSgKzRz_mm7pzkw>
    <xmx:0qG5aJsrpjFYlY_aZmYeiNh7FPS3ywGyVPU7SfEsckBazlMlP7hSHA>
    <xmx:0qG5aFCzhT71seQYJbsiJaSAqAGpSVuUR0YQ7FQYBN29W8xs-I1pBQ>
    <xmx:0qG5aPoMzzZTRoKal3WXeH2rFSYJk-ErISrP_9YKXgX7WqIKWLpnthcx>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Sep 2025 16:27:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor
Message-ID: <aLmhz9P1c9wYjdwp@mail-itl>
References: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
 <488408be-4728-4666-89a5-ac5b438bdbf5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/LOmJVvnW0+dvPYA"
Content-Disposition: inline
In-Reply-To: <488408be-4728-4666-89a5-ac5b438bdbf5@suse.com>


--/LOmJVvnW0+dvPYA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Sep 2025 16:27:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor

On Thu, Sep 04, 2025 at 02:58:20PM +0200, Jan Beulich wrote:
> On 04.09.2025 13:41, Marek Marczykowski-G=C3=B3recki wrote:
> > Use -fdebug-prefix-map in preference to -ffile-prefix-map, as it's
> > available in earlier toolchain versions. But use it together with
> > -fmacro-prefix-map (if available) for hypervisor build, otherwise it
> > still contains some paths in out-of-tree builds.
>=20
> I consider it wrong not to use -ffile-prefix-map when available. That
> already covers more than "debug" and "macro", and it may gain further
> functionality.

I asked about that on v1 and got ambiguous answer suggesting the opposite:
https://lore.kernel.org/xen-devel/0370c0eb1fd9ac00acab016792132fa0b943d384.=
1742317309.git-series.marmarek@invisiblethingslab.com/T/#m74a8883835e30fb74=
a85b07a7b14507ee52e7c65


> > The out of tree build requires -fdebug-prefix-map mapping for both sour=
ce
> > dir and object dir - otherwise the latter is included (2 occurrences) in
> > xen-syms.
>=20
> As indicated in a reply to Andrew on the thread hanging off of my
> patch - I think whether to remove those wants to be left to the user.
>=20
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -1,4 +1,4 @@
> > -XEN_ROOT =3D $(CURDIR)/..
> > +XEN_ROOT =3D $(realpath $(CURDIR)/..)
> > =20
> >  export PKG_CONFIG_DIR =3D $(CURDIR)/pkg-config
> > =20
> > diff --git a/tools/Rules.mk b/tools/Rules.mk
> > index 725c3c32e9a2..428fce094819 100644
> > --- a/tools/Rules.mk
> > +++ b/tools/Rules.mk
> > @@ -166,6 +166,8 @@ endif
> >  CFLAGS-$(CONFIG_X86_32) +=3D $(call cc-option,$(CC),-mno-tls-direct-se=
g-refs)
> >  CFLAGS +=3D $(CFLAGS-y)
> > =20
> > +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath $(XEN_R=
OOT))=3D.)
>=20
> Here and below - no need to use cc-option-add for -fdebug-prefix-map,
> which all permissible compilers support.

Ok.

> Further, again as per reply to Andrew on the thread hanging off of my
> patch - I don't view it as desirable to leave the tools/ prefix in
> place, or e.g. for libraries, the entire tools/libs/<subdir>/ part.
> Imo every binary should have only the path (if any) from its own source
> root left. (And yes, how to deal with e.g. shared include files isn't
> quite clear to me, yet. Maybe we actually need to pass two options.)

I don't think it's valid to strip arbitrary prefixes from debug symbols,
especially in tools. This will break some automated tools that try to match
coredumps (and similar) to source code and sometimes even debug symbols
too. But even for manual usage, having to jump between directories (I'm
not sure if gdb supports multiple source dirs at once?) just because you
happen to debug a binary that use more of libraries isn't exactly
desirable.
I think the paths in debug symbols and similar should match the layout
in the source repository, not a subset of it.

Theoretically this doesn't apply to the hypervisor yet, as I'm not aware
of any tool processing xen memory dumps automatically (and those for
manual usage are quite unstable, to say the least...). But I don't think
it's an excuse to have incomplete paths in there, just to save few
bytes?
The only case where I can see it would make some sense is out of tree
build, where indeed it's about just the hypervisor, not the toolstack
(IMO due to the build system limitation, but well...). But at the same
time, having different path variant depending on it-tree/out-of-tree
build feels weird.

> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -208,7 +208,7 @@ VPATH :=3D $(srctree)
> > =20
> >  export srctree objtree VPATH
> > =20
> > -export XEN_ROOT :=3D $(abs_srctree)/..
> > +export XEN_ROOT :=3D $(patsubst %/xen,%,$(abs_srctree))
>=20
> Unlike for tools/, is this still needed here? You don't use XEN_ROOT belo=
w.

Indeed in this revision not anymore.

> > @@ -412,6 +412,10 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
> >  CFLAGS +=3D -Wa,--strip-local-absolute
> >  endif
> > =20
> > +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(abs_objtree)=3D.=
/xen)
> > +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(abs_srctree)=3D.=
/xen)
> > +$(call cc-option-add,CFLAGS,CC,-fmacro-prefix-map=3D$(abs_srctree)=3D.=
/xen)
>=20
> I disagree with leaving any xen/ prefix there. That's not how in-tree bui=
lds
> name files; everything there is relative to xen/.
>=20
> I also don't really see a point in using . in the substitution (similarly
> for the toolstack, but there I have less to say).
>=20
> Finally, why pass two identical, possibly long options for in-tree builds
> (where $(abs_objtree) =3D=3D $(abs_srctree))?

That can be avoided, yes.

> Below I'll reproduce my own further re-worked patch. It's not quite ready
> for v2 submission yet, I expect though. For example, the actual Kconfig
> portion is still missing. Whether the @SRC@ and @BLD@ parts actually make
> sense (or what to replace them by) I'm also unsure about. If nothing else
> they may need replacing by plain .
>=20
> Jan
>=20
> build: avoid absolute paths in executables
>=20
> For in-tree builds relative paths are used in most cases, whereas for out-
> of-tree builds in various situations absolute ones come into play. The
> extra paths can be long, wasting space and e.g. serial line bandwidth.
> They would also get in the way of location-independent reproducible
> builds. Leverage newer gcc's (and Clang's) ability to "remap" file names.
> For older gcc fall back to using the option affecting debug info only.
>=20
> For the few absolute paths appearing in in-tree builds' debug info, use
> the generally available option, conditional upon a new Kconfig control
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course we may want to consider putting this in the top-level Config.mk,
> to also affect other sub-trees (presently mainly/only affecting debug
> info, for which even gcc5 already supports -fdebug-prefix-remap=3D).
>=20
> As to a Fixes: tag, I wasn't quite sure whether to "blame" the
> introduction of out-of-tree builds.
>=20
> Note that at least in the gcc5 I'm testing with the (limited) effect is
> further undermined by the compiler emitting the specified command line
> options into debug info, thus still leaving references to the absolute
> directories in place.
>=20
> For the mentioned gcc15 issue see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D121788.
> ---
> v2: Use $(abs_srctree). Introduce DEBUG_INFO_REL_PATHS.
>=20
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -461,7 +461,21 @@ CFLAGS +=3D -flto
>  LDFLAGS-$(CONFIG_CC_IS_CLANG) +=3D -plugin LLVMgold.so
>  endif
> =20
> +CFLAGS-$(CONFIG_DEBUG_INFO_REL_PATHS) +=3D -fdebug-prefix-map=3D$(abs_sr=
ctree)=3D@SRC@
> +
>  ifdef building_out_of_srctree
> +    # Need to add to CFLAGS-y here, as gcc checks later options before e=
arlier
> +    # ones, and we want in particular the latter one(s) here to be check=
ed
> +    # first.
> +    CFLAGS-$(CONFIG_DEBUG_INFO_REL_PATHS) +=3D -fdebug-prefix-map=3D$(ab=
s_objtree)=3D@BLD@
> +    CFLAGS-y +=3D $(call cc-option,$(CC),-ffile-prefix-map=3D$(abs_srctr=
ee)/=3D)
> +    # While -ffile-prefix-map=3D implies -fdebug-prefix-map=3D, we need =
to use the
> +    # latter explicitly: Up to at least gcc15 the compiler specs transla=
te all
> +    # -ffile-prefix-map=3D ahead of all -fdebug-prefix-map=3D when invok=
ing the
> +    # the assembler for *.S files, thus breaking our intended ordering.
> +    # (Otherwise the option below could be passed as 3rd [fallback] argu=
ment to
> +    # cc-option above.)
> +    CFLAGS-y +=3D -fdebug-prefix-map=3D$(abs_srctree)/=3D
>      CFLAGS +=3D -I$(objtree)/include
>      CFLAGS +=3D -I$(objtree)/arch/$(SRCARCH)/include
>  endif
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/LOmJVvnW0+dvPYA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi5oc8ACgkQ24/THMrX
1ywiXwf/dOuj3Ri32AYXFOP8bbsJJyHpJCvgNeCtbuJtOmKQTOjdenNzaU/rTTf+
7KCD69hXKoQAmBtOh6is1FcZXZmv+MGRPdBFgUvWi1yOaxDc/8o8/luCDE1HuveD
IGiYDPG72oLD3rfBW9LGgmLTPTm8rAvKcpdgU08RGN3dT2hhFYqI9SI6pAr4iqo6
tQGS8aqm0hZU47vGo4g/xpgs4wt9d8lvxl3ARQCt/qgXvSrdrlEESj8fjpHBtlir
+gCHTzydVtchwKFbTFh9KDTNYksv3PwtUctVgvAN8VDdVea8ds049GGSGs3KYwAI
alYd6Y6z/FMFDicPFlx+yxUar31j/A==
=oUbX
-----END PGP SIGNATURE-----

--/LOmJVvnW0+dvPYA--

