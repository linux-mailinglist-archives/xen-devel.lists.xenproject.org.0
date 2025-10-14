Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B6BD9B72
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 15:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142815.1476735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8f5l-0001Te-Im; Tue, 14 Oct 2025 13:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142815.1476735; Tue, 14 Oct 2025 13:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8f5l-0001SD-Eg; Tue, 14 Oct 2025 13:29:29 +0000
Received: by outflank-mailman (input) for mailman id 1142815;
 Tue, 14 Oct 2025 13:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7Gn=4X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v8f5k-0001S7-C7
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 13:29:28 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccd149f7-a901-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 15:29:25 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id EA464EC0218;
 Tue, 14 Oct 2025 09:29:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Tue, 14 Oct 2025 09:29:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Oct 2025 09:29:21 -0400 (EDT)
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
X-Inumbo-ID: ccd149f7-a901-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1760448563;
	 x=1760534963; bh=S0UisJWKx31O02UEdK/ERm0rmgx+IS7J3ZsinuNzZp8=; b=
	j5bygdnoNt9UzxpX46qhfzFOWzxyYjFQVeqDE4CqJ2pjx7HDlIONyDuj+VzKDBn8
	2CbJ5E+huA3wn8puFk6iAvvjj73SykwWDC6ePq6pZc1KWvaaBWJEDcF37KZzKpOh
	OSecNXaezxXeG4EQv5r2C+2aKilG0ee0ioMqnxRQyvc11z7dm0EulPbSq3UaEM+a
	KrGRP4Kh2WUb7DIBFMWlPRGmr0pB3O4LpE90D6+N/tcK5lNbykvljLAvRjSZuqty
	5EjSUOHdGKcitUdlmPMEK/euD3mc/OtK/ckjTGl86PPHshFeGILli6v3kbBZ7EmQ
	LwJBhJgQWlrpgT2Oboz7xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760448563; x=1760534963; bh=S0UisJWKx31O02UEdK/ERm0rmgx+IS7J3Zs
	inuNzZp8=; b=IdG/PPm+q4WfQDgCJPfJQOMBm2h/5l092VPkZI1iUXSFd4w4YJt
	A0+dathr3Z/rQ6TVrmRQTeX3fLcWXP3Waa8qOiDMcLfYsrMVFAGnLLn9UdGMqsyr
	sK5NYIgpCH3WEhsw2RwjTHzbRaeB9AAyXdyaiZyUc2tIYMQkud1/EOYe8+mrEUPt
	ZfPM3yWSN3dGeJJlYh6da4sYCvu/VjpCh0f4DjqzUTjAIo423zEg6zVPosonADeC
	TmifKoZPo+DI+T8rn/YRaUYA1cWlV3LCvPleCQiAS0+5LLTfhYMT5LC/h3p3bIbb
	1jxJ8qdCG0Ykh5+puc6KZm4Whp7TlAJCBLQ==
X-ME-Sender: <xms:M1DuaAswB6F5kd9x-1bksy_SUw_eafzQbsVT1jeArZmRco2oKw2OCQ>
    <xme:M1DuaEU9ivQ7J2uWkXjPyRseblznpg_Tmbc7P0kQbTWi-ZYdyE2r3R-4nOZL3qU8l
    bYIgvgdGQCd5-B0KaGeDaK2iL9ravlv_OHM81dXpBSRbd8_>
X-ME-Received: <xmr:M1DuaEGnlkYivcQbjGaFFv1q2Pdx3CbI6Q8Si1zXYNYLOcG_S21WuRvE3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddtieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgr
    shhssegtlhhouhgurdgtohhmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhush
    hsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepohhlvghkshhiihdrkhhurhhotghh
    khhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:M1DuaO3G9ntrE9MQF69mWXnlWXhtE04GMZpRyII2eYek9HYlNPmvMw>
    <xmx:M1DuaONdXZyuE0BXW5GyC3PuVilRGRghK2CeV-j9i6p3z-I5ekuoCQ>
    <xmx:M1DuaF5FW-HRlvbRGVhoUbqitiFFvbpjIY8pyi3hi1afh_IeQo5Psw>
    <xmx:M1DuaA1FEMFcMSr3XgTuAhAc6HrVkWS_gxit0El3ex8Lmvkct0O2Hw>
    <xmx:M1DuaFrAKrhIOxseWSa-IjN3JKHxPIVqhv6tMSxygP8IgTjKxKp1AYMA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 14 Oct 2025 15:29:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 v2] efi: Protect against unnecessary image
 unloading
Message-ID: <aO5QMFtLpC819kbZ@mail-itl>
References: <20251014130648.2540082-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="37Ncevye+cVhnF8+"
Content-Disposition: inline
In-Reply-To: <20251014130648.2540082-1-andrew.cooper3@citrix.com>


--37Ncevye+cVhnF8+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Oct 2025 15:29:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 v2] efi: Protect against unnecessary image
 unloading

On Tue, Oct 14, 2025 at 02:06:48PM +0100, Andrew Cooper wrote:
> From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>=20
> Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
> image after loading it (for verification purposes) regardless of the
> returned status. The protocol API implies this is the correct behaviour
> but we should add a check to protect against the unlikely case this
> frees any memory in use.
>=20
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>
with one comment below (I'm okay with the patch either way)

> ---
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Gerald is OoO and time is tight on Xen 4.21, so I've picked the patch up.
>=20
> Oleksii: This addresses follow-on feedback for a new feature in Xen 4.21,=
 so
> really does want fixing before the release.  I forgot to put it on the
> tracking list, sorry.
>=20
> v2:
>  * Apply feedback as Marek wants it.
> ---
>  xen/common/efi/boot.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 5b84dbf26e5e..3a78e7571a5e 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1062,7 +1062,7 @@ static void __init efi_verify_kernel(EFI_HANDLE Ima=
geHandle)
>      static EFI_GUID __initdata shim_image_guid =3D SHIM_IMAGE_LOADER_GUI=
D;
>      static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
>      SHIM_IMAGE_LOADER *shim_loader;
> -    EFI_HANDLE loaded_kernel;
> +    EFI_HANDLE loaded_kernel =3D NULL;

While this isn't strictly necessary now (assuming correct firmware
implementation), it helps just a bit with buggy firmware (that would
leave loaded_kernel unset in case of EFI_SECURITY_VIOLATION, possibly
leaking some memory). It still assumes UnloadImage() verifies its
parameter in that case (spec suggests it should, but doesn't spell it
out explicitly).

>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_STATUS status;
>      bool verified =3D false;
> @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE I=
mageHandle)
>              verified =3D true;
> =20
>          /*
> -         * Always unload the image.  We only needed LoadImage() to perfo=
rm
> -         * verification anyway, and in the case of a failure there may s=
till
> -         * be cleanup needing to be performed.
> +         * If the kernel was loaded, unload it. We only needed LoadImage=
() to
> +         * perform verification anyway, and in the case of a failure the=
re may
> +         * still be cleanup needing to be performed.
>           */
> -        shim_loader->UnloadImage(loaded_kernel);
> +        if ( !EFI_ERROR(status) || (status =3D=3D EFI_SECURITY_VIOLATION=
) )

So, just in case of double-buggy firmware, check loaded_kernel here too?

> +            shim_loader->UnloadImage(loaded_kernel);
>      }
> =20
>      /* Otherwise, fall back to SHIM_LOCK. */
>=20
> base-commit: 53859596c0d34dbca776ec1e47bac8dd90552530
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--37Ncevye+cVhnF8+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjuUDAACgkQ24/THMrX
1ywAqgf/dr9m9Wwh/0asR1uc1cBeOWADFSTCo88Md2mzDMsq0/3UW/Nqrrlsjnw/
NB5QoALVuznRDwjhVn7Vw7GS3HGfdvqdWalqKINTzQ3/FOrFAYDudeuDdYzb8ny+
vN5PO4bigsUAMzNBfrvxR1IXI7SfwyS2bg4niJgvHluzGMOWYwRDe9R9xAx9RVzM
Rj4YGYmL/U1cP815pu71pMgX1qDgQWbKzO9HZwDPJCdTRH0ErFAI9r3gluj1Qocv
qTvZbR0khk6AKgC8eGI3p6/9RSvQ3+pyr1jL6TK57AbqOBmbAWHdj2DY6HR5hMRY
yyMInLzRjA50I/sScT3OGNLLMi63gw==
=6b4t
-----END PGP SIGNATURE-----

--37Ncevye+cVhnF8+--

