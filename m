Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87309C57829
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161359.1489325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWvI-00063h-8S; Thu, 13 Nov 2025 12:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161359.1489325; Thu, 13 Nov 2025 12:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWvI-00061i-4x; Thu, 13 Nov 2025 12:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1161359;
 Thu, 13 Nov 2025 12:59:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJWvF-00061b-T5
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:59:34 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981963fd-c090-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:59:31 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 7C081EC0189;
 Thu, 13 Nov 2025 07:59:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 13 Nov 2025 07:59:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 07:59:28 -0500 (EST)
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
X-Inumbo-ID: 981963fd-c090-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763038770;
	 x=1763125170; bh=hHoYAsexxBgsBMwsQsAOsE84fAyostQb5ACfW3mxrLU=; b=
	eJ8p12p0rBz4VoEW2iYrtEWDMxOyPoAm+tL2PaXUk8DwnUU1OUcIsUBd0L5jm3i8
	Uhlx8yu5JEOG4N6knxzoMq2c0ueUiDgRPeHWvN6z3qPJJEFbg5dHp5X1hcHPpsEQ
	dhRh3+cjysmHTz9Rrj5wCwluLcWEPk6uAjEWj2SsHLKfH5N7Wy7CzPGGIe3DcJ6w
	qAADYbKlDy978OlvqE2PgXh6F5eHhmelwSTbW2oI59YxCE6xDHPhNrpfAnCTOZRk
	LfspNpTdHIKKHRORV03mno2RmKdbTeihHf77Gu/GKrNYppiPZFkdOpgtxr94QHuu
	gxAV4sFqMUTIHw3X6BfNSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763038770; x=1763125170; bh=hHoYAsexxBgsBMwsQsAOsE84fAyostQb5AC
	fW3mxrLU=; b=hq2eDrOQzyESxqnHwlD4zRKJeAe8P0aZRhl55YT+oudTTRqp0xP
	fXWc5bPcXsvHvxbcX34NVTLMTarV/hj8nEkghLNQuZMI96wso4DS6Zr1JpqFLgnz
	6rPcgzVzyq2ubAgQGFCyKDzTMUYsG+hgoQXXUl4lqSowl6VtvHKbhhq1l3kx8cN9
	ubOcOLwVDFZCYRqkaQIkCnvNFznCvruVZb8vmgNYzgPgMSI1jSExIvS9nDwXg4+O
	074Y9MB5X67iSVmgKeUnosZDiVsQ/dnxkzFzXSzCe2xGTImqKUUKDFF0UEwPNKK8
	2ZjvZt9SH/dSCVu8rJ+qVCdniM8zNQkuBTw==
X-ME-Sender: <xms:MdYVaYSkXGNT_hF9kKCWNzyyqmB_hB05q2BzN0GBfVA-6hZaukpSag>
    <xme:MdYVaYWEpN4aH-kotar4eWBMtATfca6Xu8GA62Va5Pb8mJalfkd9r7-4gGAAWv4Rc
    LGD_4FYXmqiNODtraLLlib0PnPwM2Glmlx-ngD8TaIbC-1hAqY>
X-ME-Received: <xmr:MdYVaZe_1aJyoARaIXk50Ln-2v6Gshhxx07QEQctJc_BcH0Pnsz2f7-RInm0CPEPbldPikllunAZ7PraXshhqaJbqMNPOe5gplw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejtddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffelteevudevteeukeeggedt
    jeffheehvdeftedtvdehuddvveeuheeftedvfeejnecuffhomhgrihhnpegsrhhkrdhprg
    hgvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprh
    gtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgt
    hhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhu
    shhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdp
    rhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohep
    mhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:MdYVacLy5P3pEL-sBkod5JRI2joj0ksba5btwqYcReYdEE6Eul3chw>
    <xmx:MdYVaWzY7VRqmfHizcYJ6baGOHkf4LR8ei9npNtySWldhxTi3aGQqA>
    <xmx:MdYVaSvk5xb32PprjPDD0xGK_aY8tsMZOQKNpJS9-lX4Nxd6-qcEFg>
    <xmx:MdYVaZDEZYL3xNdtAA7NQELetXj62dfbkkZuzI_JppusbsCoKZXgIg>
    <xmx:MtYVaUkMspTSbS_2sjsY3hm4XjR3Hd0IBqB4EcH0arE7XvBt1bE8-SKs>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 13:59:26 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()
Message-ID: <aRXWLrEGbSRdqDA7@mail-itl>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com>
 <aRXRtY10cFN38d02@mail-itl>
 <4391d560-870e-4010-b3bb-dee2935f9732@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LdgHJWPD6TaL8UTc"
Content-Disposition: inline
In-Reply-To: <4391d560-870e-4010-b3bb-dee2935f9732@suse.com>


--LdgHJWPD6TaL8UTc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 13:59:26 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()

On Thu, Nov 13, 2025 at 01:46:20PM +0100, Jan Beulich wrote:
> On 13.11.2025 13:40, Marek Marczykowski wrote:
> > On Thu, Nov 13, 2025 at 12:09:37PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/include/asm/brk.h
> >> +++ b/xen/arch/x86/include/asm/brk.h
> >> @@ -2,6 +2,10 @@
> >> =20
> >>  #include <xen/types.h>
> >> =20
> >> +#define DEFINE_BRK(var, size) \
> >> +    static char __section(".bss..brk.page_aligned") __aligned(PAGE_SI=
ZE) \
> >> +        __used var ## _brk_[size]
> >=20
> > This chunk belongs to the previous patch I think.
>=20
> It could, but it's not used there yet (i.e. would count as dead code).

But in the current shape the linker script change in the first patch is
unused. IOW, I think adding .bss..brk.page_aligned to the linker script
should go together with DEFINE_BRK.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--LdgHJWPD6TaL8UTc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkV1i4ACgkQ24/THMrX
1yyFqwf+Kh372q/KfYXGkzUZ8yM4LrARjhaX3vcyk7ZY+p6YmvXo4HXs4mqClfVp
SkN7s2mx6Vx94ErvU+Rzu4uejuxcfePNiazQiYQzeeFrH/WJw8Jtz7sPLMVdS1tz
PpMFW8ZVEwGubj5ImhNoXTW4eCWLM+hH8KuJWjehtvDwN5vKe5ErTJff/t9pA5AV
7yDtrUJUgULfhWlhE/sWiskQwmdOSsZx2VkvzI/Gsn7B8sFo80eo+SViSjOPKCWJ
Q73u3ls8zO5/AgymZHu4tq+fn4glIFFlWSmU8iKiTv0yatIvAlOBJOaKQy7XkP/K
hoME354nDqPC4W6HiFup/nqbUTjPhg==
=M7Ny
-----END PGP SIGNATURE-----

--LdgHJWPD6TaL8UTc--

