Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B405F2418
	for <lists+xen-devel@lfdr.de>; Sun,  2 Oct 2022 18:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414688.659036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of1pK-0004jx-CA; Sun, 02 Oct 2022 16:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414688.659036; Sun, 02 Oct 2022 16:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of1pK-0004da-8d; Sun, 02 Oct 2022 16:28:26 +0000
Received: by outflank-mailman (input) for mailman id 414688;
 Sun, 02 Oct 2022 16:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ZZD=2D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1of1pI-0004a7-VK
 for xen-devel@lists.xenproject.org; Sun, 02 Oct 2022 16:28:25 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a18ed84-426f-11ed-964a-05401a9f4f97;
 Sun, 02 Oct 2022 18:28:21 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DAA6932003F4;
 Sun,  2 Oct 2022 12:28:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 02 Oct 2022 12:28:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Oct 2022 12:28:17 -0400 (EDT)
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
X-Inumbo-ID: 3a18ed84-426f-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664728098; x=
	1664814498; bh=G0vV3Oa2ZZq1J9zBhSTJatfU2fwQHSYgySIi6UczSXI=; b=E
	h9naX8daSDPCN2bBf+ktQHwsOkwd6zMSTRgfCd8CwbInXFvpfKRwKQYQbwSLDtgX
	sv2hZzgiq/oBCrgccWLXTy/S34QrEt/O3ZyErr6WtGBW2u72yOjEbskFaKxSvvqs
	QzMPR9D7Sn8NOJRV8uBwGV48aKe5ezZCPlb5RlcFOdIvyFiW8NsR4pSnAkRsUuw2
	CRXKzz2Ze89Lk4wS4w7vaHfXn3AfSrctTlEPx6Tgu1JVEJMQ6WghYE66cCftdvAM
	FSFiYc3wYrCZmiB/pRraGXQR1Saz4Kz1pKznbATsY6ddiSNyv7oAChH7JYlwZzzA
	0Y9K5Hk0RtIPsi72LHwYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664728098; x=1664814498; bh=G0vV3Oa2ZZq1J9zBhSTJatfU2fwQ
	HSYgySIi6UczSXI=; b=0apj9EM8OTeJ0iftmlwc/NwcnlDsgsp9dfGuHy5Z05Ys
	kUdPs37l2y6km4wJjO1Tjk6U4UDxk7Xk3aGPYsJseBMc6g6AvM0cXWmmiy0EhT+y
	bilWUV5I55mnUVz9yL7tV9klq9JUxGEYstCe/blnV2uoKeDTFs8i31D7EKk+uVwv
	RERP8VtLEr84FSMe07MA3PfXXpJxFLhCseNkG7VyM+3jgVvc8JxDqgy+RsG3iKKW
	m7DxNK6KK9r84jL1wtWgqhjDWh7xhvtTtp2mhdaEEloxk2iil8vUSmnrXp5NNkhc
	eGabTJgxNkhaIgSVhhrvMGiECxk9AmaNluVbvtQxAw==
X-ME-Sender: <xms:Irw5Y4wxMc8m7vvTwVCO-LHpZ5FJiQxu58DzWuVy2tM4XMEkS3-iDQ>
    <xme:Irw5Y8T8e8fy45SSLM9XIwChS_RBLUrS8Ft0jeRK_1Fz0V-kbwDdmAg7U8k_RNDCG
    5x6nHmgHXUD_IQ>
X-ME-Received: <xmr:Irw5Y6UP80h-oFOIVjThpaGrmkRjcC9f_GmwjfNmqXdd32Yz-DCL4iV22vSO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehjedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedune
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:Irw5Y2hTizZVN9EkjLWYlUUVGL3OFx5XeQoQGS5lPwjJP8D_BKuhYw>
    <xmx:Irw5Y6C3Zbb69t_mfQAbSO5Nw5qh_qkgpASZPbtUmeFFwqaUvyXfcA>
    <xmx:Irw5Y3KLr5RmWCJNql17ZEnrZWvs1ymwDyM0N-3RV8Lp25WkaPtBvQ>
    <xmx:Irw5YysePNjv21Hz7XRJc12XZoq7CtCrWeTex6IolgvWfv4HEO6A3w>
Feedback-ID: iac594737:Fastmail
Date: Sun, 2 Oct 2022 12:27:57 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Peter Jones <pjones@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 4/5] efi: Apply allowlist to EFI configuration tables
 when running under Xen
Message-ID: <Yzm8H3iS7ziWsh7E@itl-email>
References: <20221002095626.484279-1-ardb@kernel.org>
 <20221002095626.484279-5-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JTIF6sEbcgRHIDwD"
Content-Disposition: inline
In-Reply-To: <20221002095626.484279-5-ardb@kernel.org>


--JTIF6sEbcgRHIDwD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 2 Oct 2022 12:27:57 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Peter Jones <pjones@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 4/5] efi: Apply allowlist to EFI configuration tables
 when running under Xen

On Sun, Oct 02, 2022 at 11:56:25AM +0200, Ard Biesheuvel wrote:
> As it turns out, Xen does not guarantee that EFI bootservices data
> regions in memory are preserved, which means that EFI configuration
> tables pointing into such memory regions may be corrupted before the
> dom0 OS has had a chance to inspect them.
>=20
> Demi Marie reports that this is causing problems for Qubes OS when it
> attempts to perform system firmware updates, which requires that the
> contents of the ESRT configuration table are valid when the fwupd user
> space program runs.
>=20
> However, other configuration tables such as the memory attributes
> table or the runtime properties table are equally affected, and so we
> need a comprehensive workaround that works for any table type.
>=20
> So let's first disregard all EFI configuration tables except the ones
> that are known (or can be expected) to reside in memory regions of a
> type that Xen preserves, i.e., ACPI tables (which are passed in
> EfiAcpiReclaimMemory regions) and SMBIOS tables (which are usually
> passed in EfiRuntimeServicesData regions, even though the UEFI spec only
> mentions this as a recommendation). Then, cross reference unknown tables
> against either the EFI memory map (if available) or do a Xen hypercall
> to determine the memory type, and allow the config table if the type is
> one that is guaranteed to be preserved.
>=20
> Future patches can augment the logic in this routine to allow other
> table types based on the size of the allocation, or based on a table
> specific header size field.
>=20
> Co-developed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/firmware/efi/efi.c |  7 ++
>  drivers/xen/efi.c          | 69 ++++++++++++++++++++
>  include/linux/efi.h        |  2 +
>  3 files changed, 78 insertions(+)
>=20
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index 11857af72859..e8c0747011d7 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -556,6 +556,13 @@ static __init int match_config_table(const efi_guid_=
t *guid,
> =20
>  	for (i =3D 0; efi_guidcmp(table_types[i].guid, NULL_GUID); i++) {
>  		if (!efi_guidcmp(*guid, table_types[i].guid)) {
> +			if (IS_ENABLED(CONFIG_XEN_EFI) &&
> +			    !xen_efi_config_table_is_usable(guid, table)) {
> +				if (table_types[i].name[0])
> +					pr_cont("(%s=3D0x%lx) ",
> +						table_types[i].name, table);
> +				return 1;
> +			}
>  			*(table_types[i].ptr) =3D table;
>  			if (table_types[i].name[0])
>  				pr_cont("%s=3D0x%lx ",
> diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
> index d1ff2186ebb4..3f1f365b37d0 100644
> --- a/drivers/xen/efi.c
> +++ b/drivers/xen/efi.c
> @@ -292,3 +292,72 @@ void __init xen_efi_runtime_setup(void)
>  	efi.get_next_high_mono_count	=3D xen_efi_get_next_high_mono_count;
>  	efi.reset_system		=3D xen_efi_reset_system;
>  }
> +
> +static const efi_guid_t cfg_table_allow_list[] __initconst =3D {
> +	ACPI_20_TABLE_GUID,
> +	ACPI_TABLE_GUID,
> +	SMBIOS_TABLE_GUID,
> +	SMBIOS3_TABLE_GUID,
> +};

This allowlist seems redundant.  Either the tables are already in memory
that Xen will preserve or they aren=E2=80=99t.  In both cases the subsequent
code will do the right thing.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--JTIF6sEbcgRHIDwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmM5vCAACgkQsoi1X/+c
IsFlDxAAqU0aemId9IrdaxQg73+mapJXMkGjC3ASXWfOTnPkkzgJfZKYpgPnatRQ
Rr5RX9xyMl/vm8KFYsiBZXh9x2b5CPzbZ/lrmtVdgVtSJxSIMQMayGtPeBTL/ZkW
Y4WouKbgn9uj5UTyWFSTlorn4xUHY1Sot1Xowek1pezMrG33qzdycCSW9Epi7bEo
JxXgpXN2Gq8Slns6s//DvxSSOYMFCafRN9HZjl4+oc1lElR/tYDGWWhmWNTrEy50
WxoJjH8NDzb0aNJPuGiADidlMI+pAQXAleHBNl4zCxc8PuUkCsHuNYubrmfHuo55
0X21DUMnsS4m96qAFcQoWFTLy2JEDNQuW7souGNtiPQcQW7uyrIUq1f/ZdXLJnlr
5ZXK9QDagePjlFIbYdLTb4zO0WcJEXOf7TKpG7GLHhwE4DrI1/GoMdTRQrzB+Kcd
ZlGR4theXCih9+19qCasrHZQc8Gic3w6jynjrWuEVz9qa8VNklUEvus6fOp5+Ah/
Q2UPD2vgP8F8RohrTtoxLPSU2aZpZYcDzxcaZlbptMI4BE63gLNaevsbLG+VTW2o
ITjtfMBpjfn5gixxIWJ7dlBu52sUtergum2hmrZD2QzrBGsdalrXE5sl2dmMw3CO
sFoCyfgsyPUxgQHidAWUTRoRynQYlul3cxT35sjrHaYyqoF8he0=
=IJcK
-----END PGP SIGNATURE-----

--JTIF6sEbcgRHIDwD--

