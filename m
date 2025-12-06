Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEDCA9EEE
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 03:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179668.1503124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiE2-0006HN-1d; Sat, 06 Dec 2025 02:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179668.1503124; Sat, 06 Dec 2025 02:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiE1-0006F3-VG; Sat, 06 Dec 2025 02:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1179668;
 Sat, 06 Dec 2025 02:40:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSAj=6M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRiE0-0006Ev-A1
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 02:40:44 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f34ed597-d24c-11f0-9d1b-b5c5bf9af7f9;
 Sat, 06 Dec 2025 03:40:40 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5CEE57A006A;
 Fri,  5 Dec 2025 21:40:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Fri, 05 Dec 2025 21:40:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 21:40:36 -0500 (EST)
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
X-Inumbo-ID: f34ed597-d24c-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764988838;
	 x=1765075238; bh=zLpqZ0HkeT+emqS1VzvqlD3yS2YBk+DQOqM3XvSI6C8=; b=
	J+6THWQ6Ui1Q9yX2L2gdIP/ENqYPjKggSiKnFvldSh0cvCv2Bva51CON09a3HfKD
	YFV/IP+ka+RppxMyAfUNePTs3rjVzq3FJhUCxDc8Kqi6KD2cCVmj9Dd7eMSdHTes
	9Dc41Jrg4d618QZRIH7JejnIkrZza0YsXDWglMn55jpN5LGXNmbI0O3DRQ28+6uS
	+n8XZ/UHxApHXH2I2Q8p9yGWoaC+Va/wUxgOpAAVAChd4/zJHYKZuEd2VTgIfAaW
	3TXWV5ZPTL802OEE1MNxwxwdRcvWjurCscOx4iUB/v39q+wX64SlOsAFjsjBt3hT
	Qr5zyR2YONa4OkX3NRJXNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764988838; x=1765075238; bh=zLpqZ0HkeT+emqS1VzvqlD3yS2YBk+DQOqM
	3XvSI6C8=; b=dynM7ConqOzgpMrBxl5AsEhIjDgVGyEeDafO1ABY34KjVERgFw5
	1dHKBnpleppPgc7XJAUNK8ogzS2VmSKTFumAZUr4uuOSB3kNRhCjaGaeHLp/Rxz7
	+KXq/YQvA4T9rvKjoNO6GtNtx2lOpnSOyvH3KgyVt7EPfV/yyGzvyazVjs1rxq64
	ZWAcoEGin5xXLY1H+wqaS1msOJuZfgsJ8X+Vhq0ixW2IGT150HPNxXc9PlR8pGuL
	4AT8RU4z/1M736HrwuxZtpyozV+7fcSLuf/OBcSYqrZSXegI2cu783rUkSUxDVcz
	rERBxL6oCNdm87a8ROx4ES4pYCDQR+GcblA==
X-ME-Sender: <xms:pZczaRgayIm_iIMcYLX86TnWCeI5KEGvSVav7oKhJYOFduZdD43UPQ>
    <xme:pZczaVGnLd76gUjfIPZIklkTKhweydCO46O6D3-NA2oZqH7zxJjhHEIUglsXGps61
    thjEzLzzanjCcqllfp2WeMIzDWL490tx9WKsCng1bFkRATWnw>
X-ME-Received: <xmr:pZczaXTB-62ItmyAlyFbIryvaVyTaxtgRGagtkbPnFswxYuVM8F6qwZEr0KyknMuLx3hn2JJ4qyILvR5P66orJcPm95ggUDwp_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthht
    oheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhope
    hmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjsggvuhhlihgt
    hhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtg
    hpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhs
    thgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pZczaSy02Ke84yNoou6KcIIAilbYHPZwf41ZDracH_ts6i4rxG5GbQ>
    <xmx:pZczaTfN8pFAk5q12IFlVSL5eVF3qreBN6josPcXwPR7aB1DxovNqA>
    <xmx:pZczaVPILApHaufVCfBASABX13Bj0IOhQnM3VguUAT74-PwS1D22Sg>
    <xmx:pZczaestU7p6IH4eF746PAWyUm1_1GpWW-OQMD58j94FfzK0lUy5uA>
    <xmx:ppczaVsw8Z-YvFid7dVEmg7A7468TmKtluV0QjgToNxORgvKtIx3RmuE>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 6 Dec 2025 03:40:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools/sd-notify.h: Include string.h too
Message-ID: <aTOXogSld6LTStIn@mail-itl>
References: <20251205220012.1976435-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n1xnV+VkO4X9AxJo"
Content-Disposition: inline
In-Reply-To: <20251205220012.1976435-1-andrew.cooper3@citrix.com>


--n1xnV+VkO4X9AxJo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 6 Dec 2025 03:40:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools/sd-notify.h: Include string.h too

On Fri, Dec 05, 2025 at 10:00:12PM +0000, Andrew Cooper wrote:
> Alpine Linux, when using --enable-systemd to get the init files, fails wi=
th:
>=20
>   tools/include/xen-sd-notify.h:69:3: error: call to undeclared library
>   function 'memcpy' with type 'void *(void *, const void *, unsigned long=
)';
>   ISO C99 and later do not support implicit function declarations
>   [-Wimplicit-function-declaration]
>      69 |   memcpy(socket_addr.sun.sun_path, socket_path, path_length);
>         |   ^
>=20
> This will be down to using musl rather than glibc.  Include the appropria=
te
> header.
>=20
> Fixes: 78510f3a1522 ("tools: Import stand-alone sd_notify() implementatio=
n from systemd")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

And also, this works:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2199305972

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> Example failure:
>   https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/12336994239
> ---
>  tools/include/xen-sd-notify.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/include/xen-sd-notify.h b/tools/include/xen-sd-notify.h
> index 28c9b20f152d..20441d0ec9b8 100644
> --- a/tools/include/xen-sd-notify.h
> +++ b/tools/include/xen-sd-notify.h
> @@ -20,6 +20,7 @@
>  #include <errno.h>
>  #include <stddef.h>
>  #include <stdlib.h>
> +#include <string.h>
>  #include <sys/socket.h>
>  #include <sys/un.h>
>  #include <unistd.h>
>=20
> base-commit: d430c0a66e102fb12baeec6a178c20da7864d5b5
> prerequisite-patch-id: 3db642dd7c06f6988283444c764cd646982775bb
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--n1xnV+VkO4X9AxJo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkzl6IACgkQ24/THMrX
1yza+wf7B32wUhwLnUjKSCUfcbopgFFxd0JqvqB2B1SIMpqQZnkEIMxMglIX+0Ul
cqG6he6zO9/49gqjBbdUFvVZDIjcPzrX/EF2EXXxMmpKgboxo7F10MqDypIyGzbu
pa5e3PkYhbTKHGq6KXCvQFgpaQcUudVEp9fHWXquzip8rhoYLA0gq/eCQvzOSDno
dh7V5I0WP2PkL/DXfFz6HDWN8//7PozUcOAtWjsQrENmXi5bLk+UdJhZvrE4BFJu
/5NsXxdOC0sNc/WzgXb9d/8InlS4o9Xkzpw9RJxFbp4GhEWlYyQgXOVmUXMgQLi4
Z9tSwIr6phPRigqf7AnqwAqv0Igb6w==
=peoO
-----END PGP SIGNATURE-----

--n1xnV+VkO4X9AxJo--

