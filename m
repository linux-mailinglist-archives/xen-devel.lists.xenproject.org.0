Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNrKN9ViuWlsCwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 15:19:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470632ABA86
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 15:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256145.1550853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2VFm-0005Sy-D1; Tue, 17 Mar 2026 14:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256145.1550853; Tue, 17 Mar 2026 14:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2VFm-0005RX-AG; Tue, 17 Mar 2026 14:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1256145;
 Tue, 17 Mar 2026 14:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vPV1=BR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1w2VFk-0005RR-EX
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 14:18:36 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d540db5-220c-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Mar 2026 15:18:32 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 501C4EC052C;
 Tue, 17 Mar 2026 10:18:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 17 Mar 2026 10:18:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Mar 2026 10:18:29 -0400 (EDT)
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
X-Inumbo-ID: 2d540db5-220c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773757111;
	 x=1773843511; bh=H8ojiy+nUshNj92qbh6PJ54d8DQ9lgoMwsIQKTFLn1w=; b=
	UVUK5uOkT79Z9YnBrShKRfaePb9ziEarWcHeJ+TF6uQH8n3OE8xAtz0Sioetp8Ac
	K+WrkuyzYRiiTSx8yqLzsh1dvgjyMDA8nKIpvAsKP3Cq8S34f64DCGh7dywloLXK
	+rIWQINndOK6DisTQfWA1wjI4NCynFfG8F/DDdY6r9KdpKCzNchiuBycVhODqmxF
	o9YeaykjnIoMW5gxqjPoHT0SsUlcZ06D4fMwq0mTfIQnr6YdyS6ydZcIZ9l0+b2b
	OtVk4LdEn2fLtss05yT3Fdj/V1juOfOL6f7oPAWyPqzZBr2v4JNdbEyNDghohj+5
	VRV0O1ckAT4lHno8IhGA1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773757111; x=1773843511; bh=H8ojiy+nUshNj92qbh6PJ54d8DQ9lgoMwsI
	QKTFLn1w=; b=cshhVT/dd5H7xmShYmQIaHxarlyFTw/xsrHwzmqkcp1zncVlsM/
	7rYlA9GxtNPLtIgcgL0HlNDZlcyDhat+4MnfoKgQD6DVDhcPyjDjF3KpEXRAwnGz
	Sk6zhH17Dc3IlOGJ5HAnGrBUQXlSoXhSUfUzKidU17LhvfPh4GVdnQvjdjzbWA4p
	H6E3pYE4+tOdRaUC/04gi5ur3Cg4MlGkwYk57fwRMry4WV6ujgoELx3qXFC6YvL9
	j14q/i6EON4FYLSu4Ob0dM1VB+nh5v83tmKjihy1A0sls3m57MiTkRg3ObskBgSr
	0Hg6qrTSZIRL9+B74RcfgGbQDrZtV0myg1A==
X-ME-Sender: <xms:t2K5adHHoIPd5Ca_AvcED5hPRN5ngP8d---7VGw5JHUqXg6_W3B64g>
    <xme:t2K5af616txm-TuxP3z5xpO909QlPjBUPdvJtfn6HpDQQe16SwIkeuI477DTEKJqp
    7-yiBKy_4Z5ExBNA1Z4ZHdHieRRFlFpkhWLXeEh5O14E_nL4A>
X-ME-Received: <xmr:t2K5aVkfSYhHayUnNC7IN-NJzhfgu1rOoqehqyIutYf2XCroxhGwTCFskdZqiX_ggg6yzJv0MVGGAXQNIZb3_HljdiIKG6AU9Os>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddugeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepshhouhhmhigrjhihohhtihhsrghrkhgr
    rhdvfeesghhmrghilhdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsrghrkhgrrhhsohhumhih
    rghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtoh
    hophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgv
    rhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhessh
    hushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:t2K5aUojDRUXSz_huD4jCVE0qdbdrv2Hv3spJ3ndlDFQEPCCFi9pLg>
    <xmx:t2K5aUvi0coTy-ifkfLPF73KPNhdTur0ui7_90f9Okl67qKV9jzhaQ>
    <xmx:t2K5aZEXqwens2cAbncQ1SO8LtrljrceLnSFLxLiPgYLlip_k3E4nA>
    <xmx:t2K5adZJGgEVUjRgvn1cmhfawz7bESeQaYsRRmg-G_ow6-uh90wa6Q>
    <xmx:t2K5aZQsc32GQgGqqWulGyHzbGO7UnWS2obZB3EDoLjjhIwKbmgGfKFf>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 17 Mar 2026 15:18:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v3 1/3] x86/efi: Add BGRT image preservation
 infrastructure
Message-ID: <ablitN6qZAOOG2ZZ@mail-itl>
References: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
 <20260312111414.17808-2-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cDMhCax8aa77tv0c"
Content-Disposition: inline
In-Reply-To: <20260312111414.17808-2-soumyajyotisarkar23@gmail.com>
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,citrix.com,apertussolutions.com,suse.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 470632ABA86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--cDMhCax8aa77tv0c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Mar 2026 15:18:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v3 1/3] x86/efi: Add BGRT image preservation
 infrastructure

On Thu, Mar 12, 2026 at 04:44:12PM +0530, Soumyajyotii Ssarkar wrote:
> Add core EFI boot services code to preserve BGRT (Boot Graphics Resource
> Table) images during Xen boot. The BGRT contains a pointer to a boot logo
> stored in BootServicesData memory. Without preservation, this memory is
> reclaimed causing ACPI checksum errors in dom0.
>=20
> Implementation:
> - Walk XSDT to locate BGRT table (reusing efi.acpi20 from efi_tables())
> - Validate BMP image signature and size constraints (max 16MB)
> - Allocate EfiACPIReclaimMemory and copy image data
> - Update BGRT table with new address and recalculate checksum
>=20
> The preservation follows the ESRT pattern, running before
> ExitBootServices() to ensure image remains accessible.
>=20
> Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
> ---
>  xen/arch/x86/efi/efi-boot.h |   2 +
>  xen/common/efi/boot.c       | 133 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
>=20

=2E..

> +static void __init efi_preserve_bgrt_img(void)
> +{
> +    const struct acpi_table_bgrt *bgrt;
> +    const BMP_HEADER *bmp;
> +    const void *old_image;
> +    void *new_image;
> +    UINTN image_size;
> +    EFI_STATUS status;
> +    UINT8 checksum;
> +    unsigned int i;
> +
> +    bgrt_info.preserved =3D false;
> +
> +    bgrt =3D efi_get_bgrt();
> +    if ( !bgrt )
> +    {
> +        bgrt_info.failure_reason =3D "BGRT table not found";
> +        return;
> +    }
> +
> +    if ( !bgrt->image_address )
> +        return;
> +
> +    old_image =3D (const void *)bgrt->image_address;
> +    bmp =3D old_image;
> +
> +    if ( bmp->signature !=3D BMP_SIGNATURE )
> +    {
> +        bgrt_info.failure_reason =3D "Invalid BMP signature";
> +        return;
> +    }
> +
> +    image_size =3D bmp->file_size;
> +    if ( !image_size || image_size > MAX_BGRT_IMAGE_SIZE )
> +    {
> +        bgrt_info.failure_reason =3D "Image size exceeds limit";
> +        return;
> +    }
> +
> +    /*
> +     * Allocate memory of type EfiACPIReclaimMemory so that the image
> +     * will remain available for the OS after ExitBootServices().
> +     */
> +    status =3D efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &n=
ew_image);
> +    if ( EFI_ERROR(status) )
> +    {
> +        bgrt_info.failure_reason =3D "Memory allocation failed";
> +        return;
> +    }
> +    memcpy(new_image, old_image, image_size);
> +    ((struct acpi_table_bgrt *)bgrt)->image_address =3D (UINTN)new_image;
> +    ((struct acpi_table_bgrt *)bgrt)->header.checksum =3D 0;

Question to MISRA experts here - is this casting away of const okay
here? Or maybe better be done on the `bgrt` local variable? Or some
other way?

> +    checksum =3D 0;
> +
> +    for ( i =3D 0; i < bgrt->header.length; i++ )
> +        checksum +=3D ((const UINT8 *)bgrt)[i];
> +
> +    ((struct acpi_table_bgrt *)bgrt)->header.checksum =3D -checksum;
> +
> +    /* Filling the debug struct for printing later */
> +    bgrt_info.preserved =3D true;
> +    bgrt_info.old_addr =3D old_image;
> +    bgrt_info.new_addr =3D new_image;
> +    bgrt_info.size =3D image_size;
> +}
> +
>  /*
>   * Include architecture specific implementation here, which references t=
he
>   * static globals defined above.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cDMhCax8aa77tv0c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmm5YrQACgkQ24/THMrX
1yzN/AgAgS5jpNVn+rIN6L7pQu6+M5fmeTAi4+xZXjX9L2I1RveuY70e7+RYEL67
15+G1ef/Cv5RZHH4J9nMDsESmTHRIjNXNw6C/U4KTg9jX28Bcyg00RfxEGq+3wDn
j5UBogoDMJpIhZCvIuoZUbtbXXvfIIKZ7UqAodnv5t56iXlwMMsyCMoOHtMp3M7F
crkt0HCrrli48yuMbzQH/eT6WSOoQCB4CWLq5WSXNuu9Qq9m7+JYmEoy6g8YlNxe
MDvuPfC18ItPZo7Vci2aMM+mOdKeTlnHwDICNeQyCXIz18wIutAkaBATBVS0WT6G
hXVkOI1e+uGvjCQU7W9dn6L6s9pzuw==
=kJtp
-----END PGP SIGNATURE-----

--cDMhCax8aa77tv0c--

