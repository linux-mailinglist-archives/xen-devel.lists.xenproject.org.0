Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0E68CF66
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 07:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490870.759754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPHGK-0006hX-76; Tue, 07 Feb 2023 06:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490870.759754; Tue, 07 Feb 2023 06:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPHGK-0006eo-4S; Tue, 07 Feb 2023 06:15:28 +0000
Received: by outflank-mailman (input) for mailman id 490870;
 Tue, 07 Feb 2023 06:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaN9=6D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPHGI-0006ei-NS
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 06:15:27 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce17a60e-a6ae-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 07:15:23 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B6F645C0143;
 Tue,  7 Feb 2023 01:15:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 07 Feb 2023 01:15:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 01:15:20 -0500 (EST)
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
X-Inumbo-ID: ce17a60e-a6ae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675750522; x=
	1675836922; bh=3lcBQME6MxRrUUK7wACIPcbp0M8UXo7emK3UQbich5k=; b=W
	iMbmAWFclTpShDffpBOLo6MdlVXzsBNuvAq3SmV+9BXCowJzwgWHu5o0S5vnQRV0
	FULWE0oseBOYjoJAzukO2g/9zuywwxuEwijvOyUBWTSNeIyfygNjFyD5TGmhufol
	Yl0ld/RzcxvZTOmmY7Q3GMciRi5SHjyba5vFDLTI01ZZ185mWUTJWZ1wMZXWVKS9
	GBtdgdtZsiep+E6npEzY9L16Y0IzABCwo4nbkrLX6c+yckVPqRLyIZCw0t1KxCqr
	iA90f5PoyFeKLJFqoTL7lT3++YeMvkuHyjDOvMgNB/oj59bFVQ2gc847xGr5JI7K
	CrEK10k0VDgQQj49lAF2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675750522; x=1675836922; bh=3lcBQME6MxRrUUK7wACIPcbp0M8U
	Xo7emK3UQbich5k=; b=kjomZON+S4yDUOMakksa8Gft04CJl6wLq1ln1yFWDgdg
	bA4Sj/PCDpJP/rYI70p34qTOUxDJMepuVZWEpN9l4S3UglVtcm7FHgQTYuIlUivS
	thAct9z2jfz8ekA8krcfIxX3Ax0hlFldRDSCurPWDvO7icBJ21P14ftPYbqEo0zQ
	yhjlDxjcBYmjtTbvLuCYcrxNO38xL5rTLaygyi3VufvF0Bm5u4annmS/fPXl7H+Y
	KcbrY2IWZWiMzjXAlVrELQ9/sOPJ7sbrxzDnkXNwOb6ISzcpOErjB2NsXRhiQpDY
	bFhMUn9GD4UowJ4cOQDXMnocudJANs/+qmo8b98/Uw==
X-ME-Sender: <xms:euzhY7tCvyMnA8d_IuwWbdrxxeg7xlhI-JAxFBqVgch1sGEkno2pRA>
    <xme:euzhY8eHvQREcGEI74HHESzHhaolSWOlEkDddAMPsKGHyxY34PXtEySwt1RCXGy63
    ZksNSQW2g-Og3Y>
X-ME-Received: <xmr:euzhY-zxgwEk5FJ9HwuzDMUleXg3N4TcoaDrUEIDfkSNGVH9obp6hFh5rEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegjedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleeuueeihfehteeifffggeehtdeg
    ueelffetgeeggeekteffuefhfefhkeefvdehnecuffhomhgrihhnpeigvghnrdhorhhgpd
    hllhhvmhdrohhrghdpghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:euzhY6N1-yLA-lnD0zKbG8HcySO5wZZMaZAgdURmGQFrTxFWVzkb0w>
    <xmx:euzhY79MSdk4gGWU2XKnUay137XFMK1aXcGYMpnd8iWPpPOHdFVnqg>
    <xmx:euzhY6XjI0JkDt63BizHPV_MPsuKZ6yBv8rRoa5LGY4-B56H_0YrgQ>
    <xmx:euzhYyZFtWMszZN9B6BVCNTUm0VYyHOBOiz_7o5gHMnlClvVnHcmqA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 7 Feb 2023 01:15:14 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] Replace git:// and http:// with https://
Message-ID: <Y+Hsdvg8lv8z0LAY@itl-email>
References: <f10112b7fa66d0fda3c5fd523e6240cd72730b90.1675739352.git.demi@invisiblethingslab.com>
 <Y+HQlYeknWsd4vNk@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h0L6L6myaQYfPp28"
Content-Disposition: inline
In-Reply-To: <Y+HQlYeknWsd4vNk@mail-itl>


--h0L6L6myaQYfPp28
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Feb 2023 01:15:14 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] Replace git:// and http:// with https://

On Tue, Feb 07, 2023 at 05:16:21AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Feb 06, 2023 at 10:10:33PM -0500, Demi Marie Obenour wrote:
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >=20
> > This patch was created by doing a tree-wide search and replace with sed,
> > then reverting changes that were pointless or wrong.
> >=20
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> >  Config.mk                                    | 20 ++++++--------------
> >  README                                       |  4 ++--
> >  automation/build/centos/CentOS-7.2.repo      |  8 ++++----
> >  automation/build/debian/stretch-llvm-8.list  |  4 ++--
> >  automation/build/debian/unstable-llvm-8.list |  4 ++--
> >  automation/scripts/qemu-smoke-dom0-arm32.sh  |  2 +-
> >  docs/README.remus                            |  2 +-
> >  docs/conf.py                                 |  2 +-
> >  scripts/get_maintainer.pl                    |  2 +-
> >  stubdom/configure                            | 18 +++++++++---------
> >  stubdom/configure.ac                         | 18 +++++++++---------
> >  stubdom/grub.patches/10graphics.diff         |  2 +-
> >  tools/examples/xeninfo.pl                    |  2 +-
> >  tools/firmware/etherboot/Makefile            |  4 ++--
> >  tools/firmware/etherboot/README              |  2 +-
> >  tools/firmware/hvmloader/pci_regs.h          |  2 +-
> >  tools/firmware/hvmloader/pir.c               |  2 +-
> >  tools/firmware/hvmloader/pir_types.h         |  2 +-
> >  tools/firmware/hvmloader/smbios_types.h      |  2 +-
> >  19 files changed, 47 insertions(+), 55 deletions(-)
> >=20
> > diff --git a/Config.mk b/Config.mk
> > index 10eb443b17d85381b2d1e2282f8965c3e99767e0..fd0719e38be1c679946c4d6=
77c0f0dbdb2a85411 100644
> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -191,7 +191,7 @@ APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES),=
 -I$(i))
> >  EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector -fno-stack-pr=
otector-all
> >  EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-ta=
bles
> > =20
> > -XEN_EXTFILES_URL ?=3D http://xenbits.xen.org/xen-extfiles
> > +XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
> >  # All the files at that location were downloaded from elsewhere on
> >  # the internet.  The original download URL is preserved as a comment
> >  # near the place in the Xen Makefiles where the file is used.
> > @@ -215,19 +215,11 @@ ifneq (,$(QEMU_TAG))
> >  QEMU_TRADITIONAL_REVISION ?=3D $(QEMU_TAG)
> >  endif
> > =20
> > -ifeq ($(GIT_HTTP),y)
> > -OVMF_UPSTREAM_URL ?=3D http://xenbits.xen.org/git-http/ovmf.git
> > -QEMU_UPSTREAM_URL ?=3D http://xenbits.xen.org/git-http/qemu-xen.git
> > -QEMU_TRADITIONAL_URL ?=3D http://xenbits.xen.org/git-http/qemu-xen-tra=
ditional.git
> > -SEABIOS_UPSTREAM_URL ?=3D http://xenbits.xen.org/git-http/seabios.git
> > -MINIOS_UPSTREAM_URL ?=3D http://xenbits.xen.org/git-http/mini-os.git
> > -else
> > -OVMF_UPSTREAM_URL ?=3D git://xenbits.xen.org/ovmf.git
> > -QEMU_UPSTREAM_URL ?=3D git://xenbits.xen.org/qemu-xen.git
> > -QEMU_TRADITIONAL_URL ?=3D git://xenbits.xen.org/qemu-xen-traditional.g=
it
> > -SEABIOS_UPSTREAM_URL ?=3D git://xenbits.xen.org/seabios.git
> > -MINIOS_UPSTREAM_URL ?=3D git://xenbits.xen.org/mini-os.git
> > -endif
> > +OVMF_UPSTREAM_URL ?=3D https://xenbits.xen.org/ovmf.git
> > +QEMU_UPSTREAM_URL ?=3D https://xenbits.xen.org/qemu-xen.git
> > +QEMU_TRADITIONAL_URL ?=3D https://xenbits.xen.org/qemu-xen-traditional=
=2Egit
> > +SEABIOS_UPSTREAM_URL ?=3D https://xenbits.xen.org/seabios.git
> > +MINIOS_UPSTREAM_URL ?=3D https://xenbits.xen.org/mini-os.git
>=20
> xenbits http server has git under /git-http/, so you need to adjust URLs
> when changing the protocol. Verify if all other URLs in this patch
> actually work too.

New version coming with what I believe to be fixed URLs for everything
except the TPM emulator.  The TPM emulator was originally hosted on
BerliOS, which I believe no longer exists, so it only makes sense to
download it from Xen=E2=80=99s own servers.  I=E2=80=99ll fail the build if=
 an attempt
is made to download it from the original (now defunct) website.

> > diff --git a/automation/build/debian/stretch-llvm-8.list b/automation/b=
uild/debian/stretch-llvm-8.list
> > index 09fe843fb2a31ae38f752d7c8c71cf97f5b14513..590001ca81e826ab624ba91=
85423adf4b0c51a21 100644
> > --- a/automation/build/debian/stretch-llvm-8.list
> > +++ b/automation/build/debian/stretch-llvm-8.list
> > @@ -1,3 +1,3 @@
> >  # Strech LLVM 8 repos
> > -deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
> > -deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
> > +deb https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
> > +deb-src https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
>=20
> APT used to require extra package (apt-transport-https) to support
> HTTPS (I'm pretty sure it applies to stretch, but probably not to
> unstable). And also, it needs ca-certificates installed. So, this may
> require some more work before switching the protocol. You can observe
> https://gitlab.com/xen-project/patchew/xen/-/pipelines if/when gitlab
> picks it up, to see if everything still works.

Will do.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--h0L6L6myaQYfPp28
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPh7HcACgkQsoi1X/+c
IsHgsRAAuOdK+iEggOqRlVD4kNqUOQHTF0xTF4gaMjoXLFp5u2IjxFxkM8fPfeg3
bC9T1BdIvPtkPa9rWrsov83gloiKVfcgiFihxqMfUQJDHaFlSn44qcXqt2DEPTgH
EeWt8CU4ZXEKkBcC16qUHUWBNaxNAgjtbWTiXWRwAQ7r9AHugYjrWcMHH9U153fm
82QPge6keXn02y8sXG93Ai93g6bIqbuRoffDFM3XPZsGxZbnu+XfGTv+eImMuQA1
qOSdsdiK+vRmnuj0YY1PcWdtkbbABVhCFKVmpb9TP40zRHYX7mrnZI4cPH6K+BHm
/2I/6+cYEvwkTM263vXnQBwwD8xPjdvHBvh/USuXb7IpVZIyAyUcqnVLn/yi8Rgd
6iJaukw9renxVpA25sGEuBYhMgAvOTnPdmKFZ7b1b0BOJmYbGxqp3ll5RSVzs6qq
HKFa+lH9F08tXTtZYlr3eT+hkNI9yuuFByeSipNQtaYpvXDhtKMQ9q/tGo4Z/4QM
5us0LzOTeCFO5otJ9IRPj1lWHfvoCXB8uyrHdqUvu4GUSl0Ohpw8Ad8Db/W7T2At
8wSGs6sEHJ0zhkz2VlAAbwG91O/DTwG9SKdek9iad8zZMwqbfEl1er+jMK99ezzv
vwaSjzOIvbIoUQUrUQadTY3aP127oWSiwmQSDHwRBAQvzI/EkiQ=
=6vm5
-----END PGP SIGNATURE-----

--h0L6L6myaQYfPp28--

