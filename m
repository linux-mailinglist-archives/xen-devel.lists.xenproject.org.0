Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D895D8A1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 23:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782688.1192207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shc5B-0003yv-On; Fri, 23 Aug 2024 21:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782688.1192207; Fri, 23 Aug 2024 21:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shc5B-0003wd-LZ; Fri, 23 Aug 2024 21:44:33 +0000
Received: by outflank-mailman (input) for mailman id 782688;
 Fri, 23 Aug 2024 21:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzBQ=PW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1shc5A-0003wX-7J
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 21:44:32 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00591e3-6198-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 23:44:30 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal
 [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id EE32313904D2;
 Fri, 23 Aug 2024 17:44:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 23 Aug 2024 17:44:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Aug 2024 17:44:27 -0400 (EDT)
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
X-Inumbo-ID: e00591e3-6198-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724449468;
	 x=1724535868; bh=5MvIkWacA+5RskFt1p7wzNLDOka+r7Vl5YB6xvScNKU=; b=
	eV1yqT4yRtfBsTfZxaYa3+/vAC/9yhx6xfafY+JrGyEDaQRR6XXiQn77A5tEopvA
	ygJVdDIfC+lF4HP+Ch/l5KIGqbEnr+ZNpG13TfccnTzgCedgp4p93yGlYeHQtw7O
	Mk9hEf+0HbeKNrAHI68dLyu963CSlki1DHLjQ2PXKytKH1MUYImUGMZFcDgiolgR
	FbDyIcecnlJ7OSgsY2KwKedBsR41YSxcZHeEjOuNp8IgFDBmTP1CFcFI0ch7hqa1
	pV/Ie0grtP1DOdi6s/CR+jG4mtAkSgKV/o3WUghGBgwFP5KuWIC8vJVZ2oMeEUo5
	OLbEUlCQpG+P+rDSGeZRVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1724449468; x=1724535868; bh=5MvIkWacA+5RskFt1p7wzNLDOka+
	r7Vl5YB6xvScNKU=; b=GDZQlxhZ+W05sBtdiv979n/Yd5FGpuCHKzRmT4rMjpJC
	P1f6+4eYWfm0CqP+ZRTO3z3Dpbt6o6JOG0MAQSi6YSYp1pSC4gLzSYUAN35vpVQx
	fbBs6txL/+Zn3acZPNWzSmBsd/tOZEiiGVohVQhzGeqBPy9/eQm59FpQ/cW1IVlo
	IlV56IIjYu0B0URWE0spFd4Ps7wh54ersAelS1ByZBNTcTE0ZHpMWFUJc5WvKcg1
	b5aHXOowaP2S2q4unR9n+tsUzCGpg+GJ5qw/nWjbysGKYUqpiEuuyn7fdK0Z1FFR
	NWfoHKocHcF6qdsffJr7zuCCtPO8gcYpsJDOT9H7mA==
X-ME-Sender: <xms:vALJZjbyXt0inHKNvfIju6FE1VwedxlqvXVNv4MDHUQtcP_2bHWf7g>
    <xme:vALJZibBx_TQ8LcZPpflFnm5GOlg6goGNnp_Xj1vf8-DlYRJJzwu7_kUgu8J96T7z
    MzR3vOOjFcyVg>
X-ME-Received: <xmr:vALJZl-5_aqJ-O6URMfUrnOWTMMKnx-SSvefKTyAXwkrmyeYEU2ntzgI5m3zX0bhyCqJlWrxpRCNYVB6Ac716kDFOzMkeyVhSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvfedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepieeluddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetud
    dvkeffudeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtg
    hpthhtohepmhhilhgrnhgujhhokhhitgduleelheesghhmrghilhdrtghomhdprhgtphht
    thhopeholhgvkhhsihhirdhkuhhrohgthhhkohesghhmrghilhdrtghomhdprhgtphhtth
    hopehnihhkohhlrgdrjhgvlhhitgesrhhtqdhrkhdrtghomhdprhgtphhtthhopeguphhs
    mhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmih
    hlrghnrdgujhhokhhitgesrhhtqdhrkhdrtghomhdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:vALJZpqzCk34Otlbcv5BhhNn1vt4dMMJS-HV3iIQMbmaJDHnoYytAg>
    <xmx:vALJZuqYJsVsN7xkUGjMMbQsOqC7hi6kR3ZSs6mQYW9TWp_EAlS97Q>
    <xmx:vALJZvTzbwMQUlb4sywEPTNvNA8221ZqtHDxlPUKdEiYeOapDaiWQw>
    <xmx:vALJZmqoZftSNVgFGfozHhG9GR-J8UjKvbAVhNrOS8umDtN4og0VfA>
    <xmx:vALJZvdQ5Z7S0K40PNkz2yYFHxXaYHJAOXfBAO_AiTEloBEd_nRaxv1a>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 23 Aug 2024 23:44:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Milan Djokic <milandjokic1995@gmail.com>, oleksii.kurochko@gmail.com,
	Nikola Jelic <nikola.jelic@rt-rk.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Milan Djokic <milan.djokic@rt-rk.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen: PE/COFF image header
Message-ID: <ZskCubBvCcmd0jJZ@mail-itl>
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
 <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
 <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n5lBKj+HjiXx2gJm"
Content-Disposition: inline
In-Reply-To: <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com>


--n5lBKj+HjiXx2gJm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Aug 2024 23:44:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Milan Djokic <milandjokic1995@gmail.com>, oleksii.kurochko@gmail.com,
	Nikola Jelic <nikola.jelic@rt-rk.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Milan Djokic <milan.djokic@rt-rk.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen: PE/COFF image header

On Mon, Jul 29, 2024 at 01:42:46PM +0200, Jan Beulich wrote:
> On 23.07.2024 20:22, Milan Djokic wrote:
> > From: Nikola Jelic <nikola.jelic@rt-rk.com>
> >=20
> > Added PE/COFF generic image header which shall be used for EFI
> > application format for x86/risc-v. x86 and risc-v source shall be adjus=
ted
> > to use this header in following commits. pe.h header is taken over from
> > linux kernel with minor changes in terms of formatting and structure me=
mber comments.
> > Also, COFF relocation and win cert structures are ommited, since these =
are not relevant for Xen.
> >=20
> > Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 36e4fc57fc16
> >=20
> > Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
> > Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> This looks okay to me now, but I can't ack it (or more precisely my ack
> wouldn't mean anything). There are a few style issues in comments, but
> leaving them as they are in Linux may be intentional. Just one question,
> more to other maintainers than to you:
>=20
> > +#define IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE         0x0040
> > +#define IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY      0x0080
> > +#define IMAGE_DLL_CHARACTERISTICS_NX_COMPAT            0x0100
> > +#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          0x0200
> > +#define IMAGE_DLLCHARACTERISTICS_NO_SEH                0x0400
> > +#define IMAGE_DLLCHARACTERISTICS_NO_BIND               0x0800
> > +#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            0x2000
> > +#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE 0x8000
> > +
> > +#define IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT         0x0001
> > +#define IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT 0x0040
>=20
> The naming inconsistency (underscore or not after DLL) is somewhat
> unhelpful. Do we maybe want to diverge from what Linux has here? Note
> that e.g. the GNU binutils header has at least a comment there.

Indeed it doesn't look great, but IMO leaving it consistent with Linux
is okay as it ease updating and porting/comparing other code if needed.

> What I'm puzzled by is IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT
> having the same value as IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE. Are
> these meant to apply to the same field? Or do these values rather
> relate to IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS? Some clarification
> may be needed here, or the two entries may simply want omitting for
> now.

One has _EX_ infix and the other doesn't so IMO together with visual
separation it's clear they apply to a different field.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--n5lBKj+HjiXx2gJm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmbJArkACgkQ24/THMrX
1yzUXQf/Wv9l/+FUwSIiXl68ig1X6Lv3HnF9gQdSAwh+nYY68rhvxpSgk6LPonzY
OZjbc0trsOLb+4GVnnGZVux6oGAoFOG+Y/G7xqIh9T2zNO+A3TNFO2t3nvKQmaIg
OKHxgcQyVTgi2tVGY8HtOG3AM4KPs34lZw7smIioe5LkjrOY16GZ2UvLwy8GRjwi
nI4tzkdOv6TC5IvfuT05Z4GvUQ3M66bn1/rZnhTVCXdP8qu0XtE85N9Y0ATFrZCc
u19PL4+B3FsF1/KZliN6AOzOifsxSagXwXBKKFIYIfdQhelVW1FOCfNG6nSz0d1Z
VXRJ48gv73gwlNusPjXrcyso3Xjfyg==
=UyB7
-----END PGP SIGNATURE-----

--n5lBKj+HjiXx2gJm--

