Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM+ICStsmGmHIQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:14:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B98816839D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237162.1539572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRGE-0002qK-Te; Fri, 20 Feb 2026 14:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237162.1539572; Fri, 20 Feb 2026 14:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRGE-0002nd-Qt; Fri, 20 Feb 2026 14:13:38 +0000
Received: by outflank-mailman (input) for mailman id 1237162;
 Fri, 20 Feb 2026 14:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OLq=AY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vtRGD-0002nX-Gg
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 14:13:37 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56ef56ed-0e66-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 15:13:34 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 6137F1D0013D;
 Fri, 20 Feb 2026 09:13:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 20 Feb 2026 09:13:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Feb 2026 09:13:31 -0500 (EST)
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
X-Inumbo-ID: 56ef56ed-0e66-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771596812;
	 x=1771683212; bh=E3VvZoRLK8xBv4CCs0D8Dbg85uRD7YE3FztxxPlhilI=; b=
	Jn5ryd9VYZGrBduMNIUSaRvv+gpeG5NQx8WTOqxnTmbLcfodoAdJzsn3wzzPBSeo
	LqPbw5ehkGSNeEllL0f3yqhcMebkOtCWJ2gptvkCd8SpbziMezb5MaiX4K+7Dszr
	Th7l2cz4w9ZZeeK7AYdWS/0zHlBW7K0WBt6y0M+zG6f63e+/6P32nkqM0bm5ua1k
	DNCa+RtsWcj80wm+NCfbCE+2AU0Gh4Jz+O5/BhbKAbXrmbUY3iZe3LOgQahcIRmv
	Ob5sjnzv/5QZkilLPc5EACdVlfsbvSPoxYn80OrF4mFAxfiHEPJabVRe+TlhTADi
	gBCpB+qUM9f15EIch9jlYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771596812; x=1771683212; bh=E3VvZoRLK8xBv4CCs0D8Dbg85uRD7YE3Fzt
	xxPlhilI=; b=tNIayS9ou4Fxlv5T3h4dUl/Xp7zrH1fLjSNon7V/L33WDcAYrYo
	FOwA1waIqVNGLLOEAHlwOiU1L3pLGMVv1FuLTTCaFbvbJhNr7UpI9HdseR4pZRBy
	CvqrvtnUl9qm9XQVgfun26Uth/diQ8Iv6Y/DcotQ42G+SiYFg/+ko++4XSnbxpfv
	2OJWXeaYgKpUnCQIVopLPBIac1vXJRZ9M3BbzqQARCjEIWM/E0rDw9yS+sRoNRi3
	HHAg65PLnfjaPERdJ27hCWfxT+kmf3Re9buZu/ekL6X/SpECzMdYhmFu1Ay2qglg
	hjfwFm3dULTtnr+KW0btfFdsmMJrY5+Z2zw==
X-ME-Sender: <xms:C2yYaakhXHBdE_31bFV50rutY3OQ6iEg5q5U9391EGC1Io9awhZgJg>
    <xme:C2yYaY3rcpaJULFKazAhPHDJJ4jdjWaZ12_5REnUc9Mfk0x3WNSeb70kEPqg-1ONZ
    NuAIs4dlk_nus7hSwxYEfKullUeV8LESb4BQKba-2rCpEQjkg>
X-ME-Received: <xmr:C2yYadoGdSjA7ZAGdJw7C6EM6o-P39ZXydnYMjvvpAA6kN_1YjGtn0knqj-Cxh2rrIPG5AYcCHM21HMovhQYVfWVi4hQ3F92IWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdekieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpd
    hrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:C2yYadfUE5SGgkadreaZ9iekg2INjoFZcRioMBwwzVe3E0HB9EZE4w>
    <xmx:C2yYaUr_HzNrinhO48FUyVR7ChWhY7pUnnxs57IsLcAnUIiblbAYiQ>
    <xmx:C2yYaWF8ylZFEjAtzmnJ_qib3EPeAzqaBFh-MIQogh9IfechkAfA3w>
    <xmx:C2yYacsuTS-O2EeHj8dwYNGn74syAZgo2sLs3NcrWHvUh1sABDdwQg>
    <xmx:DGyYaW9J3vH8zO7MvNWPMEDSe3QJhkbVEVIcEunxSJ7WzQHqE6q0pA_s>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 Feb 2026 15:13:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] libxl: constify some local variables for building
 with glibc 2.43
Message-ID: <aZhsCYjiZefMPv4L@mail-itl>
References: <20260220121220.52078-1-marmarek@invisiblethingslab.com>
 <5ccdcb99-eeeb-4037-a253-3314f57b3368@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HgpfyErtE/Hzg3e7"
Content-Disposition: inline
In-Reply-To: <5ccdcb99-eeeb-4037-a253-3314f57b3368@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1B98816839D
X-Rspamd-Action: no action


--HgpfyErtE/Hzg3e7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Feb 2026 15:13:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] libxl: constify some local variables for building
 with glibc 2.43

On Fri, Feb 20, 2026 at 03:06:56PM +0100, Jan Beulich wrote:
> On 20.02.2026 13:12, Marek Marczykowski-G=C3=B3recki wrote:
> > Archlinux just updated glibc to 2.43+r5+g856c426a7534-1 and that
> > causes libxl build failure:
> >=20
> >     libxl_cpuid.c: In function =E2=80=98libxl_cpuid_parse_config_xend=
=E2=80=99:
> >     libxl_cpuid.c:447:16: error: assignment discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
> >       447 |         endptr =3D strchr(str, '=3D');
> >           |                ^
> >     libxl_cpuid.c:452:16: error: assignment discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
> >       452 |         endptr =3D strchr(str, ',');
> >           |                ^
> >     libxl_cpuid.c:454:20: error: assignment discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
> >       454 |             endptr =3D strchr(str, 0);
> >           |                    ^
> >     cc1: all warnings being treated as errors
> >=20
> > Add missing consts. Note in libxl_cpuid_parse_config_xend() non-const
> > endptr still is needed, to be compatible with the second argument to
> > strtoul(). Add second variable for this reason.
> >=20
> > And while at it, move semicolon to its own line
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> I'd like to note though that this can't be all that's needed for tools/ to
> build fine in such an environment. xenstored/core.c has two problematic u=
ses
> of strrchr(), for example.

Hm, it builds fine for me, not sure why.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HgpfyErtE/Hzg3e7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmYbAkACgkQ24/THMrX
1yy+ZAf/TEAwadzTZ4NhpoNaF8CbYwtn2+W/1Ite/z681Jl9+ACuqtgEDyVAFQFo
NX9s6/1MuV2q4ZVkMGM0WUaHdBK2r7zFLbcQ9OsiAOoq28f5HlSvfeyl8Lf3oHgY
6cuwRMANEgofCPCsy0NDCl+JbZimmFWomUmzUbuhWpPFfrSd++KamRHr61L9HCtM
qzkS0zj0nVoyvwtm5x8j64zhN+hLpX9BC/Nk5U2RRxAatYUVGPC/mwM5dMl6TEeQ
wo4FnCLJrw8mXDN5OFDamQO+Fpodbq0Pj7CUMjcNV9zaLHTrzFY+G8ghduN4Jf7f
TUYpyiiidD/khoaGCX0IzhBMnGEC4w==
=lym6
-----END PGP SIGNATURE-----

--HgpfyErtE/Hzg3e7--

