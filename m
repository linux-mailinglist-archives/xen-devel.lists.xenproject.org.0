Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F7B9F0B9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 13:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130436.1470003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kbI-0007s4-Th; Thu, 25 Sep 2025 11:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130436.1470003; Thu, 25 Sep 2025 11:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kbI-0007qa-R5; Thu, 25 Sep 2025 11:57:28 +0000
Received: by outflank-mailman (input) for mailman id 1130436;
 Thu, 25 Sep 2025 11:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhi9=4E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v1kbH-0007lR-MX
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 11:57:27 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf77aa4-9a06-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 13:57:27 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 4E4B2EC0203;
 Thu, 25 Sep 2025 07:57:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 25 Sep 2025 07:57:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 07:57:24 -0400 (EDT)
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
X-Inumbo-ID: cdf77aa4-9a06-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758801446;
	 x=1758887846; bh=NNjvJ9DFViRSIHc6zj2a3bLS1JHSQWbqqG7AXEFCrHs=; b=
	bF7gi29KxeYE8Z8gWTvBdEPcL/xOy77sQGgDk5oS+omMsgOkgDJSLhClmecj9Zml
	5fjODrTuR2IIAWYfsHOz/Z9yethLsBByPSSdTfYVHYaGfZysV8psYAsd494KTwJZ
	FPYyXUmFd/3ToFCQ5vSf4wTgiO1xRBh+Agj/5HZUxvYGI9JX/2hcy3FLZQstfBMO
	ZKmbv8Yz4Je2RA15rLlavXkIsE8ERI7glUMpsU7M/modLK/norZBUOaOUITaJJR/
	67IGkHDqVnY6M/zy7OTektqGOO2t92vcVozgZuw29t+NbtF3+0d0RckNBj0XpIa1
	uGsVI54UIjcH84CNTjT4Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758801446; x=1758887846; bh=NNjvJ9DFViRSIHc6zj2a3bLS1JHSQWbqqG7
	AXEFCrHs=; b=RfXMFSpeMr94an6JdmGeCZSRn4XOH/eLO9eH84KuvKabHw9yqzj
	W9jPuyuXz2IQr2rGjUOHLr2qCHZFVkItUOUKL+WGHOCIx5Aj9yBTCG8FnFTdl5de
	/tYPBvi2UWr+ykSRjOrZRvd4bHhtHZ1WcOVYQeKqza0PNT0jYDhvqSSveUiV/v3H
	skqW/CzKEEYifZieAapXIou6q9Ci3sSiPUlGQhqp+aFMmG+/UlfV4umggoANTQob
	9JBCDTGo5rU6SAPj8dFRP7XcBoEVyJ72Dxmp7uki66djQPxbQcTJxIf7/uNl9sv0
	atZ+iBtnUvP7ue4gslIb9kvQNHA/lQH3pwg==
X-ME-Sender: <xms:JS7VaAfo7zQUjylgOechjApmq1K7vu6AvsUha60Vpftm7GLRawhAUw>
    <xme:JS7VaOz724QxYh62SmgYQM79EuTgC4RWWLnn_mqemogL4vn7xXcpS4vnkzRW9E99C
    2N5Zbls_GBsMkjae6mFkXF4vUAUXAPKGAFVLPTuFIUmmA9M>
X-ME-Received: <xmr:JS7VaF-ENo84kqYZgwxC-7AIWbIcF1vnGUgoGtDws1qr3sXRFhUZfMXaViuiMslB2DR7ycS4p93FGY1E82bhTHHfGfFwStwZJIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiieegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedutddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvrhgrlhgurdgvlhguvghrqdhvrghs
    shestghlohhuugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrd
    igvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhht
    uhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhush
    gvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidr
    tghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtg
    hhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthht
    ohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestg
    hithhrihigrdgtohhm
X-ME-Proxy: <xmx:JS7VaMy3LI_QvditN7In1oBY9RIWEZF2Slm7yWBvuKH3B5oGTV8LIw>
    <xmx:JS7VaNphWddcFnaq0Ok0h1Scztzz-SvGObmdVFqcSem6o5MjEesSmQ>
    <xmx:JS7VaFr98hg9SFSyuFeeKVxduXwhPsLU5IRWTWHtaS7cZFTJIlosNQ>
    <xmx:JS7VaFAkzR3_0D96p35ZHOgD1AcI9csg3J_svizI6w_aEFrtCNOX7w>
    <xmx:Ji7VaOKGy7qQLyy-EZgfENaALI5lQtPdVQB7qK446C7uhKfeZnSforvk>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 25 Sep 2025 13:57:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] efi: Fix line length in init_secure_boot_mode
Message-ID: <aNUuIlYBBLZW43YQ@mail-itl>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
 <e891b84f4814c1feff7a6bca51c89dc9c8971b02.1757519202.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FGkb3Ncgfg56v8so"
Content-Disposition: inline
In-Reply-To: <e891b84f4814c1feff7a6bca51c89dc9c8971b02.1757519202.git.gerald.elder-vass@cloud.com>


--FGkb3Ncgfg56v8so
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Sep 2025 13:57:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] efi: Fix line length in init_secure_boot_mode

On Thu, Sep 11, 2025 at 08:24:27AM +0000, Gerald Elder-Vass wrote:
> Commit cb41b4ce14a9 introduced init_secure_boot_mode but one line was
> not wrapped appropriately.
>=20
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/common/efi/boot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index b86c83d3348c..69fc022c18ab 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -923,7 +923,8 @@ static void __init init_secure_boot_mode(void)
> =20
>      if ( status =3D=3D EFI_NOT_FOUND ||
>           (status =3D=3D EFI_SUCCESS &&
> -          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RU=
NTIME_ACCESS) &&
> +          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS |
> +                   EFI_VARIABLE_RUNTIME_ACCESS) &&
>            size =3D=3D 1 && data =3D=3D 0) )
>          /* Platform does not support Secure Boot or it's disabled. */
>          efi_secure_boot =3D false;
> --=20
> 2.47.3
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FGkb3Ncgfg56v8so
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjVLiIACgkQ24/THMrX
1yx0+Af+LVmJiLk3dA97mddOBx9AyE6OLb/ZubKU4YvfAYvgtDwBK8W6Uckotj8H
9HXMxEXSDkbg5Q/Ge7puL8YorDD5N33ShlzBRV/VLB1lJjyQIXKXkAyLy7C9X/d9
dwf8VS3VCIKct7u0/sM/c6ccsQRfRO0NGv5/4kPR+R5qgiKLqygFfjr2g9L1gIY2
lSoRujyuePypGdCb1rNG/Oihf5CFepj5+lwWIYczS093kNFs/W+VLTHi+PT9Qtm2
x46fyXeaeCa9h3cR2hpwtmr+vU9aveo1k3pwOZMmXcIB/QY3Jyxp+/OfgqaZGAkc
3KyIhNFcPhCv++9ZNLbebcuOJU57Bw==
=L83s
-----END PGP SIGNATURE-----

--FGkb3Ncgfg56v8so--

