Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C631F771C25
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577820.904863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvRi-0007Ws-LM; Mon, 07 Aug 2023 08:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577820.904863; Mon, 07 Aug 2023 08:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvRi-0007VC-Id; Mon, 07 Aug 2023 08:18:34 +0000
Received: by outflank-mailman (input) for mailman id 577820;
 Mon, 07 Aug 2023 08:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSvRh-0007V6-Cv
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:18:33 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcd93e83-34fa-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 10:18:30 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 300E83200916;
 Mon,  7 Aug 2023 04:18:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Aug 2023 04:18:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 04:18:21 -0400 (EDT)
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
X-Inumbo-ID: fcd93e83-34fa-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691396305; x=1691482705; bh=5/hljCKSvUJ3VllZTNOb3/xNIGkRmB7g1+x
	qcia2/2w=; b=1rofZGUTVtqbSrxzKEX4Ajz3azTADUqzGZGOVkVYTn6rlffB/c+
	8FmLbxBqnqsGRJW5uWKTP/c08xcoRAB+3xkQ0mi32ymVqxo5EkXX//aC55/b6P2g
	+ymf9UkPh9nigVID5mTZa4EcoTubQ9vXepJpcLbpWcNtf+x3IVH2QIUBrVOzKk0z
	+TkcKGq/UGylyv4ZKUA+Wyec8LbgKhgn84tUPlBJxWkhUsYlAO0ZSfyOXaQ5OCMn
	wEgi+NYd+KFGGPvRRD5iZP4lDhjCil9ve5YhuExNgi37UQNYE+YD6OpLqSFW4CIW
	cyJutbXf5S4/2p/6B8wV0KR8Szh1KOSMohw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691396305; x=1691482705; bh=5/hljCKSvUJ3V
	llZTNOb3/xNIGkRmB7g1+xqcia2/2w=; b=OlDJZWmXWnO9mZfFfxJJSI1/lgTj6
	wnZn9b1xGXJ817na15D55C9HQs3qq8s5nA7N+L90j+i4IhvpfmuxhhhsqGl56uYz
	2F9kqHi3xtYiVzReFtDwwuKrohPw2A4eVgqT1R+SmoBadem49LL8kRY+T2+Rk1BN
	pDkEmtSQBDO7MoQYyOKBaAhkt9AtXN4MNRTsRLjbctSVnk6OI4y+0FNILgXceLq7
	rNMwNuKvE7fnJLkqD1mn8ExjGZ4kk+dahOG+gMDyjTblU9RZofE/S/d66OWOhD+k
	ad2BwjLqPn3Zm3f0UWpK4TxCZLwbLtvxWLhFzZmUaCBEExyYyFB8cQgUw==
X-ME-Sender: <xms:0ajQZAOLnVTPfI_-o4yxNkaYrrsqcnWd6As2GJy-QIBSn1GKxUvMrA>
    <xme:0ajQZG_-sppdD2DVgnSjpkgNYdfniAyoFG4ffTgs5mcXOJPY2czsgaIwUUsJLxceN
    hHYoqwq5xiMJsg>
X-ME-Received: <xmr:0ajQZHRngnbXDR8KRDtPL9qLrsr8Ahp-7JBSmlFQTDi6XPtxKTTcpFZA5Fod5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epkfffggfuvfevfhfhjggtsehgtderredttdejnecuhfhrohhmpefuihhmohhnucfirghi
    shgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepfedtfeduledtvefhheekfefhuedthfffudegteffvdfgheef
    kefhteegvdeugffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhvihhs
    ihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:0ajQZIuwS9r43VyipZZnPUBOaum2Cg-hTuSsrDtYLo-nW-Qacnqrjg>
    <xmx:0ajQZIfRPnlYBCbZjidpUCg7_USICkZ3prHk-jJR-rERzQIpuk34zw>
    <xmx:0ajQZM0cWct4rFV6GEkGPt3_41kVIjzjeXgWlegNYHgowtQTpO6NBg>
    <xmx:0ajQZAS333-ZdPtejNIMs78gCUVUnjNtjqXn7AfUhL2vNDTvpARg3w>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 10:18:07 +0200
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
To: Anthony Liguori <aliguori@amzn.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <1515356919-922-5-git-send-email-aliguori@amzn.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K60iXJNiRjuGkv39nsa0Jww3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K60iXJNiRjuGkv39nsa0Jww3
Content-Type: multipart/mixed; boundary="------------c6eAEZRrut7lNYqVrbtZtGs0";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Anthony Liguori <aliguori@amzn.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
In-Reply-To: <1515356919-922-5-git-send-email-aliguori@amzn.com>

--------------c6eAEZRrut7lNYqVrbtZtGs0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Anthony Liguori:
> From: Jan H. Sch=C3=B6nherr <jschoenh@amazon.de>
>=20
> Intel says for CPUID leaf 0Bh:
>=20
>   "Software must not use EBX[15:0] to enumerate processor
>    topology of the system. This value in this field
>    (EBX[15:0]) is only intended for display/diagnostic
>    purposes. The actual number of logical processors
>    available to BIOS/OS/Applications may be different from
>    the value of EBX[15:0], depending on software and platform
>    hardware configurations."
>=20
> And yet, we're using them to derive the number cores in a package
> and the number of siblings in a core.
>=20
> Derive the number of siblings and cores from EAX instead, which is
> intended for that.
>=20
> Signed-off-by: Jan H. Sch=C3=B6nherr <jschoenh@amazon.de>
> ---
>  xen/arch/x86/cpu/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index e9588b3..22f392f 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -479,8 +479,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c=
)
>  	initial_apicid =3D edx;
> =20
>  	/* Populate HT related information from sub-leaf level 0 */
> -	core_level_siblings =3D c->x86_num_siblings =3D LEVEL_MAX_SIBLINGS(eb=
x);
>  	core_plus_mask_width =3D ht_mask_width =3D BITS_SHIFT_NEXT_LEVEL(eax)=
;
> +	core_level_siblings =3D c->x86_num_siblings =3D 1 << ht_mask_width;
> =20
>  	sub_index =3D 1;
>  	do {
> @@ -488,8 +488,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c=
)
> =20
>  		/* Check for the Core type in the implemented sub leaves */
>  		if ( LEAFB_SUBTYPE(ecx) =3D=3D CORE_TYPE ) {
> -			core_level_siblings =3D LEVEL_MAX_SIBLINGS(ebx);
>  			core_plus_mask_width =3D BITS_SHIFT_NEXT_LEVEL(eax);
> +			core_level_siblings =3D 1 << core_plus_mask_width;


On the i5-1135G7 (4 cores with each 2 threads) I'm currently testing on
I noticed that this changes leads to core_level_siblings =3D=3D 16 and
therefore x86_max_cores =3D=3D 8. If read from ebx like before this chang=
e
and what Linux is still doing [1] it reads core_level_siblings =3D=3D 8 (=
as
expected?).

What's the expected semantic here? If it's to derive the actual number
of siblings (and therefore cores) in a package as the commit message
suggest, the new code can't work even ignoring the example from my test
system. It will always produce powers of 2, so can't get it right on a
system with, say, 6 cores.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/arch/x86/kernel/cpu/topology.c?h=3Dv6.4#n126

>  			break;
>  		}
> =20

--------------c6eAEZRrut7lNYqVrbtZtGs0--

--------------K60iXJNiRjuGkv39nsa0Jww3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTQqMIACgkQkO9xfO/x
ly+ssw//ex0IWjfRJNtizzKhsjf9gNU1DunP8Yof5DAL9mXkqW4o/JXCuo9MgAu2
2R3WpobqxDbqrzAo+R6sDzGlCLxp1UdFL/UbdXkzULqAmWM1wlXSc6OBK4Kfgvv4
w02DnU0C5SAHLW07t/ygjrHykBs/r0/XwaMEFkSogD1ioHmW61GHoJMidRAicmFE
k/4FgJwQ9BOBt/Uk/IU+pLBvAoUBvOW3KUgJz1AXmPKo5js3sz/rUGDmhypmI6q0
V+MKUHio0wpCGUEN0ZgnjzUtu5TkLrL7Qc1ijFPDHYbtKyELexxfpL++hIMXHDMy
+YfuFygwLbk/1D5DeZNLZqyvD2LI2G8uGqh0CBc7HXdViu8aZbgUZLEx6Ql8HY3L
ms3Cjo1/wtrO/IPyey1tjKE2BQdpPeAfQX3lZ4IdRJhBMbSf8LvSJdYcuUXldt3/
WkK5Txh/BidNNdgYvIa2Mi2FyyufuCfeQzlY9pnyYq0JK0UAKcbb9uo2bUCNKoCl
S5iDFGgddlR402hBou4s5lhj5D/LV2ZpdVRL0dlv5DE5kGxDcmaSM7zjHoZ0+/Cd
anxRLXENFLq0bqrc2WFLxHZkfO5nRKCH/gSkuTB3IIonTy04I4HgxvKVbqWPts3t
sQ29tGR4P3PVemFKg8BkEZZtLTj3quGT0jX6w+lMzW7j9JAX4qs=
=TscL
-----END PGP SIGNATURE-----

--------------K60iXJNiRjuGkv39nsa0Jww3--

