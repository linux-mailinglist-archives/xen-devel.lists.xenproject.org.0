Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8FB46410
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 22:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112346.1460657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uucaS-00026W-NE; Fri, 05 Sep 2025 19:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112346.1460657; Fri, 05 Sep 2025 19:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uucaS-00024Z-KH; Fri, 05 Sep 2025 19:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1112346;
 Fri, 05 Sep 2025 19:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URqW=3Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uucaR-00024T-8p
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 19:59:07 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3324319-8a92-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 21:59:00 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D82F714000F2;
 Fri,  5 Sep 2025 15:58:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Fri, 05 Sep 2025 15:58:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 15:58:56 -0400 (EDT)
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
X-Inumbo-ID: c3324319-8a92-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757102338;
	 x=1757188738; bh=yqI0DkiqFignuWCWjqEs7djqwvdCihcKW6BCeRfMemY=; b=
	lVsT1dbQxPAmU0PnRd037Y7yEOIfwQUN2cyapOy016wlF2uTxawI4DKE3feQsz0P
	4yMaBXmzPsoLsRNjZBq9KaYPxUf+gDWsyoR4zBlsAJX/N7HWaT4/l0d0yEbsn5jz
	VWZglElSv27z8QsSuKLz1bjUGZ8gqtZdrDgtNo0/VdZuTmhKYtl9P0b8kzuNi+wO
	0GaRVGNnUMJYeDwsC4ocXRKVVMX7DbGDaiZZZx3ljFi8qYQz1a2KRydFbiutniaG
	saewg+3vzN1KxqysbR4dOQtevreYGuKUGoyT1wVXbzt0heT/6MEZxsDx9QGKEnxv
	NXLbzeoM2JurgaFXVYAlHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757102338; x=1757188738; bh=yqI0DkiqFignuWCWjqEs7djqwvdCihcKW6B
	CeRfMemY=; b=RrEYRdMr1eqf7PxQi3iJv8Icm5HtRKBHiGo4/7KQzxZQGjTKwSs
	roZE5f8djtv1X1l4GXElkpOUv53MscDrEYD4xC+33QqKIqOe6QPeDq/M5fHmt+6H
	59r47etlq9wgm1QUG6jF4ux/+KAKrx9PgBF71euwvpjp1hV6lIQ9mcANgTmnmKkm
	I9YgPGiqGbu29WSfAO4Q9nqY2MZvHS8ckxtOp7GDc6PiYts50wRSyMaqI7Hw1GBL
	b8Na6UCsd91gimibYSqfFcx0o37UYuQtJ5tSspNo+Y8SFCI3r1e4yUPrxU/Iac+l
	UZVcGBNRyiHxN1rjmesZ9rqemXa0AHiUpDw==
X-ME-Sender: <xms:AkG7aKvc0CSFMnmLrH4iq5_n0AYJXBjkX25Pd15PFJGEaIUOGoL7qg>
    <xme:AkG7aPJYTpTIVlYWoluoqDPxmCWiOQRvSW7leOofObrJs4LzM0m1PLHBR4-y8oYiF
    EFDs_9GJBsGsA>
X-ME-Received: <xmr:AkG7aBbR1cZWe5uuWUg-OWvgmcHD_sn7AvghsomGY4uuC_jUaCGGEeat_-yGV40kX01aVKsvw6zPDDjGOHNEv2kG9m-FQbAwJIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeljeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddupdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgrshhs
    segtlhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoshhsrdhlrghgvghrfigrlhhl
    segtihhtrhhigidrtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhssh
    holhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgt
    ohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomh
    dprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhr
    tghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjh
    hulhhivghnseigvghnrdhorhhg
X-ME-Proxy: <xmx:AkG7aBAOeo4DP24agYrzSm0Mo0VGZZZ6lRfV3qS9jcQ4p6FuDRiW3w>
    <xmx:AkG7aLYvPyAptt8mGBRv2_HcU3RxlSiATQTwJPv6FdfcR36AQCYQ-A>
    <xmx:AkG7aJnvVx8rue44j_2C6Vlfyiz70sE5B-j1mKCda4Sq9btyY4fqfQ>
    <xmx:AkG7aArl8aXUmPlCz020N4mq7HvZ_GCRigx4Okj5lmSLbxcHuihxqw>
    <xmx:AkG7aKZLmlLC3Qzhss8Az2EF0MnyruZrD33hiZlVjbtAwalleajP7-tS>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Sep 2025 21:58:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled
Message-ID: <aLtA_1qFNo4EoLdS@mail-itl>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A/iiYqqFR0gfBTD0"
Content-Disposition: inline
In-Reply-To: <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>


--A/iiYqqFR0gfBTD0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Sep 2025 21:58:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled

On Fri, Sep 05, 2025 at 12:10:17PM +0000, Gerald Elder-Vass wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>=20
> Also cache it to avoid needing to repeatedly ask the firmware.
>=20
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
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
>=20
> v4:
> - Fix MISRA warning regarding SecureBoot string
> v3:
> - Fix build on ARM
> ---
>  xen/common/efi/boot.c    | 24 ++++++++++++++++++++++++
>  xen/common/efi/runtime.c |  1 +
>  xen/include/xen/efi.h    |  2 ++
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e12fa1a7ec04..ccbfc401f7ba 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *file)
>                     " last line will be ignored.\r\n");
>  }
> =20
> +static void __init init_secure_boot_mode(void)
> +{
> +    static EFI_GUID __initdata gv_uuid =3D EFI_GLOBAL_VARIABLE;
> +    static CHAR16 __initdata str_SecureBoot[] =3D L"SecureBoot";
> +    EFI_STATUS status;
> +    uint8_t data =3D 0;
> +    UINTN size =3D sizeof(data);
> +    UINT32 attr =3D 0;
> +
> +    status =3D efi_rs->GetVariable(str_SecureBoot, &gv_uuid, &attr, &siz=
e, &data);
> +
> +    if ( status =3D=3D EFI_NOT_FOUND ||
> +         (status =3D=3D EFI_SUCCESS &&
> +          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RU=
NTIME_ACCESS) &&

FYI, I was unsure if checking this is a good idea, but UEFI spec does
define exactly those attributes for the "SecureBoot" variable, so it
sounds okay.

> +          size =3D=3D 1 && data =3D=3D 0) )
> +        /* Platform does not support Secure Boot or it's disabled. */
> +        efi_secure_boot =3D false;
> +    else
> +        /* Everything else play it safe and assume enabled. */
> +        efi_secure_boot =3D true;
> +}
> +
>  static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Sy=
stemTable)
>  {
>      efi_ih =3D ImageHandle;
> @@ -915,6 +937,8 @@ static void __init efi_init(EFI_HANDLE ImageHandle, E=
FI_SYSTEM_TABLE *SystemTabl
> =20
>      StdOut =3D SystemTable->ConOut;
>      StdErr =3D SystemTable->StdErr ?: StdOut;
> +
> +    init_secure_boot_mode();
>  }
> =20
>  static void __init efi_console_set_mode(void)
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 42386c6bde42..30d649ca5c1b 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -41,6 +41,7 @@ void efi_rs_leave(struct efi_rs_state *state);
>  unsigned int __read_mostly efi_num_ct;
>  const EFI_CONFIGURATION_TABLE *__read_mostly efi_ct;
> =20
> +bool __ro_after_init efi_secure_boot;
>  unsigned int __read_mostly efi_version;
>  unsigned int __read_mostly efi_fw_revision;
>  const CHAR16 *__read_mostly efi_fw_vendor;
> diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
> index 623ed2ccdf31..723cb8085270 100644
> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -36,6 +36,8 @@ static inline bool efi_enabled(unsigned int feature)
>  }
>  #endif
> =20
> +extern bool efi_secure_boot;
> +
>  void efi_init_memory(void);
>  bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
>  bool efi_rs_using_pgtables(void);
> --=20
> 2.47.3
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--A/iiYqqFR0gfBTD0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi7QP4ACgkQ24/THMrX
1ywnnAf/ctBMx4R4WhP9RCPd7wtaG8d6QE7/TzYXF/KL2C1p94RfhFiyD/kut9xD
PJd3R4DShlJljr44nURCdA0dBt4hUpV5Kt2dQ0M+VHT4oZkAH0D9b/hgRgWQDzJy
sQSzgi21MNAKkctGNIEKGDAoxCa9PJzaRMlry7stAEy5mH09pBj/2MUXewq4Fy5/
sCH+1c2/v2Kau7ecpPpM0VlU4yBzHKfRpNhz05VY9xp/QXzzcPxUrzw6Mte5qpiq
rSRBD5SKxNQ/EuGQ5gi8baaChtq5E/hM6JKTLgiA8UmtEdZu3nP266GPm2YjBofq
19farN4c+W7kQqwWiStMKHWrM/oHEA==
=b7bR
-----END PGP SIGNATURE-----

--A/iiYqqFR0gfBTD0--

