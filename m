Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A202CBB425B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135926.1472850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4K1V-000601-Kq; Thu, 02 Oct 2025 14:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135926.1472850; Thu, 02 Oct 2025 14:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4K1V-0005xi-HO; Thu, 02 Oct 2025 14:11:09 +0000
Received: by outflank-mailman (input) for mailman id 1135926;
 Thu, 02 Oct 2025 14:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPIc=4L=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v4K1T-0005xX-TX
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:11:08 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0b7b249-9f99-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 16:11:03 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id CCAF6EC0266;
 Thu,  2 Oct 2025 10:11:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 02 Oct 2025 10:11:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Oct 2025 10:10:59 -0400 (EDT)
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
X-Inumbo-ID: a0b7b249-9f99-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759414261;
	 x=1759500661; bh=8gggb7QV4k0VUwi79B1tHWxROneixw+XlPbDObPlRgo=; b=
	WAWrPE9E5cXMcYG73cHFMXIFe7E/5fGU4SmiOmoJ42OrMDSSK1ou4ane/dlN7nK7
	EArqXCqAs9Ycf7SoXNPQn6VagKAhw5lLCA+VjrrT/fZJRuHv7yuKcyQl0FRhyxzl
	C9ehA5n6Qz8qOjRDPyOFkVlUzhBfCbk6nf+DrR0E3L4MUuXk6mlCvPWNO+YX+vWW
	XWPX1H0OL/92PVFtinTHM9OdBbIQY41Xv7hLvIMlxQtjGO+ikkChkR5Fvv6dn4Dc
	3oncuqDupGiTiQ7y2sEPhUOOhDyZ+1mJAOpzuzjbaOQwyrlCUzVV05Dp3x6JMUt7
	7NEcFMXmxugQiBGU/mITWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1759414261; x=1759500661; bh=8gggb7QV4k0VUwi79B1tHWxROneixw+XlPb
	DObPlRgo=; b=nwEd+6Nu6iNza0RuH/ov0rZckO2tLriHp4F90CeehU7Pk+XxzGl
	WxmljEcVQuLkUIGVprrLri4YSTrLWeTBrNHEpbYNiv78yOq27FM+EP+mp7L6o8t0
	PtWGZ0lCrHwiwlrhWD8cBiIIcxLJ4BrGIGaT28c5gbm2B21bGAz3J2Abx7AnFA8/
	+QU50ut4Q+e1u4dH8gSpemsdsxeJ1OEjqSEiGYlAGSkWN2LiLgskFhAz8EWdcAWA
	kahq3id65FPeQZOneXPS3LeLzDGML/ECzn9OWvYbgQgf6riXfEZK3JG2MQ6iICAm
	aTyf+xNeEnuv1ZHi+cRr2C15uPpTvm33k3Q==
X-ME-Sender: <xms:9IfeaK6gJUyuhr8ElJakY9_ajpoVA0Df1DPSmGD6oEoYNyvxR7CrtA>
    <xme:9IfeaPso-_sv-mbGulFeLxeRQSps5BOqydxc7EIGP25_3jzfc1Y2r6DvDwU_fF8Hz
    -K0lse8TFaT1Fvnd4rW8-bbIXL-xhgrf5rOgqq9E0DrL6Os>
X-ME-Received: <xmr:9IfeaE0udyrL8oYB-woDo65Gyofh24ADgE2tNFQT_d77nJAQItZ4juhDsvN3oukeooJIcwzFk--ncl8mjGkWWf3fISLFydLuAd4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekiedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeduvddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegtlh
    houhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrg
    htvghsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtgho
    mhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjh
    hulhhivghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhr
    ihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:9IfeaAoiAtB_oWVG-ZGRMQ7oWLZBO_yF7ElduwWQMhYFUUKqq38XUw>
    <xmx:9IfeaMIQQM-mBqEpbhzNGzyWH3P6iQCyyGr16bZhlp_y7HeAA-4SDw>
    <xmx:9IfeaERALKdom0Qqj_Q8LqxVh4bH91Uyv8W6vx17qcMaCgFIYhWdsw>
    <xmx:9IfeaMOC3e9UfQwJCsEhYynqnjktVDi37OQOSfg-nqQluOA0-6HicA>
    <xmx:9YfeaDeQhgbBSGGBgepO2SwcUJeOJ1IbIuW-BPBRECEwxgyw7j1C7nVf>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Oct 2025 16:10:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	"michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
Message-ID: <aN6H8dOlea2Um8y8@mail-itl>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rs9xhYCy+l9bNsTA"
Content-Disposition: inline
In-Reply-To: <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>


--Rs9xhYCy+l9bNsTA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Oct 2025 16:10:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	"michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default

On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
> > xen.efi.elf can be used for debugging.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Generally,
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

But this may want a line in CHANGELOG.md, just for a little more
visibility for people packaging Xen, as it may affect what should be
included in debuginfo sub-package.

> > ---
> > Changes since v1:
> > - avoid leaving target if some command fails
>=20
> CC-ing the EFI maintainers, as this is an EFI change.

Thanks. I did noticed the patch independently, but only a few minutes
earlier due to missing CC...

> At the recent QubesOS hackathon, Micha=C5=82 =C5=BBygowski (3mdeb) found =
that
> stripping Xen was the difference between the system booting and not.
>=20
> With debugging symbols, xen.efi was ~32M and is placed above the 4G
> boundary by the EFI loader, hitting Xen's sanity check that it's below 4G.
>=20
> Xen does still have a requirement to live below the 4G boundary.=C2=A0 At=
 a
> minimum, idle_pg_table needs to be addressable with a 32bit %cr3, but I
> bet that isn't the only restriction we have.
>=20
> So, either we find a way of telling the EFI loader (using PE+ headers
> only) that we require to be below 4G (I have no idea if this is
> possible), or we strip xen.efi by default.
>=20
> I don't think making Xen.efi safe to operate above the 4G boundary is a
> viable option at this point.
>=20
> As Xen's defaults are broken on modern systems, this is also a bugfix
> candidate for 4.21, so CC Oleksii.

I agree with this wanting to be considered for 4.21.

> ~Andrew
>=20
> (Retaining full patch for those CC'd into the thread)
>=20
> > ---
> >  docs/misc/efi.pandoc  |  8 +-------
> >  xen/Kconfig.debug     |  9 ++-------
> >  xen/Makefile          | 19 -------------------
> >  xen/arch/x86/Makefile |  8 +++++---
> >  4 files changed, 8 insertions(+), 36 deletions(-)
> >
> > diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> > index 11c1ac3346..c66b18a66b 100644
> > --- a/docs/misc/efi.pandoc
> > +++ b/docs/misc/efi.pandoc
> > @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot=
 modules are found.
> >  Once built, `make install-xen` will place the resulting binary directl=
y into
> >  the EFI boot partition, provided `EFI_VENDOR` is set in the environmen=
t (and
> >  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot=
/efi` not
> > -match your system). When built with debug info, the binary can be quit=
e large.
> > -Setting `INSTALL_EFI_STRIP=3D1` in the environment will cause it to be=
 stripped
> > -of debug info in the process of installing. `INSTALL_EFI_STRIP` can al=
so be set
> > -to any combination of options suitable to pass to `strip`, in case the=
 default
> > -ones don't do. The xen.efi binary will also be installed in `/usr/lib6=
4/efi/`,
> > -unless `EFI_DIR` is set in the environment to override this default. T=
his
> > -binary will not be stripped in the process.
> > +match your system).
> > =20
> >  The binary itself will require a configuration file (names with the `.=
efi`
> >  extension of the binary's name replaced by `.cfg`, and - until an exis=
ting
> > diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> > index d14093017e..cafbb1236c 100644
> > --- a/xen/Kconfig.debug
> > +++ b/xen/Kconfig.debug
> > @@ -147,12 +147,7 @@ config DEBUG_INFO
> >  	  Say Y here if you want to build Xen with debug information. This
> >  	  information is needed e.g. for doing crash dump analysis of the
> >  	  hypervisor via the "crash" tool.
> > -	  Saying Y will increase the size of the xen-syms and xen.efi
> > -	  binaries. In case the space on the EFI boot partition is rather
> > -	  limited, you may want to install a stripped variant of xen.efi in
> > -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> > -	  docs/misc/efi.pandoc for more information - when not using
> > -	  "make install-xen" for installing xen.efi, stripping needs to be
> > -	  done outside the Xen build environment).
> > +	  Saying Y will increase the size of the xen-syms and xen.efi.elf
> > +	  binaries.
> > =20
> >  endmenu
> > diff --git a/xen/Makefile b/xen/Makefile
> > index 8fc4e042ff..664c4ea7b8 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -488,22 +488,6 @@ endif
> >  .PHONY: _build
> >  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> > =20
> > -# Strip
> > -#
> > -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped bef=
ore it
> > -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s=
) below
> > -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> > -# option(s) to the strip command.
> > -ifdef INSTALL_EFI_STRIP
> > -
> > -ifeq ($(INSTALL_EFI_STRIP),1)
> > -efi-strip-opt :=3D --strip-debug --keep-file-symbols
> > -else
> > -efi-strip-opt :=3D $(INSTALL_EFI_STRIP)
> > -endif
> > -
> > -endif
> > -
> >  .PHONY: _install
> >  _install: D=3D$(DESTDIR)
> >  _install: T=3D$(notdir $(TARGET))
> > @@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> >  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION=
).efi; \
> >  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
> >  		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> > -			$(if $(efi-strip-opt), \
> > -			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGE=
T).efi && \
> > -			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/e=
fi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
> >  			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDO=
R)/$(T)-$(XEN_FULLVERSION).efi; \
> >  		elif [ "$(D)" =3D "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D=
))" ]; then \
> >  			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&=
2; \
> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index ce724a9daa..e0ebc8c73e 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -232,14 +232,16 @@ endif
> >  	$(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
> >  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> >  	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> > -	      $(note_file_option) -o $@
> > -	$(NM) -pa --format=3Dsysv $@ \
> > +	      $(note_file_option) -o $@.tmp
> > +	$(NM) -pa --format=3Dsysv $@.tmp \
> >  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> >  		> $@.map
> >  ifeq ($(CONFIG_DEBUG_INFO),y)
> > -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O e=
lf64-x86-64 $@ $@.elf
> > +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O e=
lf64-x86-64 $@.tmp $@.elf
> > +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
> >  endif
> >  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> > +	mv -f $@.tmp $@
> >  ifeq ($(CONFIG_XEN_IBT),y)
> >  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
> >  endif
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Rs9xhYCy+l9bNsTA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjeh/EACgkQ24/THMrX
1yySAwgAjoG/tbJBHiaJVpisgopJp5GkDI1fGtLIgDJijM6A8w9d3q4HFBDcR+YL
AKGXQrhhsQgsgLKQbJeHleDqAWx5Ccg2RUI76OiSoAAvLs2yteLy6jr9E+xOVw1n
kiAHHOeYCdroLjKKstmlyv3QU2arpkUVeKaQH9PMy0JhTiP5aAMbdiU7ErNb4dPV
PNDPpo1t+TZ5tQcLt4Pwl66tW1BMyZOycjn7x9zm39HjJp9mKmdBdyhwQx2/tRI9
Pjv1LJQyxhqGgViEMU0A/WPy5VWM23lRTMkz9PcoJB0FUF5tLhSlH68zCHscu9p9
ce1e6GAcUcq2hS2q3DBNpNNK/SCmcw==
=QjVL
-----END PGP SIGNATURE-----

--Rs9xhYCy+l9bNsTA--

