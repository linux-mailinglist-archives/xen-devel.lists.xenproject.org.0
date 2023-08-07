Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0C7724C1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578375.905844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzlb-0007hm-SD; Mon, 07 Aug 2023 12:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578375.905844; Mon, 07 Aug 2023 12:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzlb-0007fw-P0; Mon, 07 Aug 2023 12:55:23 +0000
Received: by outflank-mailman (input) for mailman id 578375;
 Mon, 07 Aug 2023 12:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSzla-0007fq-O6
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:55:22 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a95b6fe6-3521-11ee-b27f-6b7b168915f2;
 Mon, 07 Aug 2023 14:55:20 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 470965C00FD;
 Mon,  7 Aug 2023 08:55:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Aug 2023 08:55:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 08:55:16 -0400 (EDT)
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
X-Inumbo-ID: a95b6fe6-3521-11ee-b27f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691412918; x=1691499318; bh=LgWoJWa6DXZKfZ0hLk5ZMf1RQyRN75OdScV
	RO3aOCTE=; b=aNtPYSb3yopTaCktF8VCYp8h/q8zZoGJ9iXpS+8uXBQTxI6Zbly
	1Jbw7DDOaIQSv/505drGiDyLhTZaDV7H4uXioLdTwTwP5ewe1AVTcAwfGnNBeFDP
	qjNeZRBVc144zZC307uhkBqXOBngqtC/IG+NLL/RxBG8SIMPaZDlkea0+QBh62do
	BsdTK354zL+zElrcd+sxQlxxth/cRU+N86Mlq1EI+d2FQynbAGbT/AJvHgdg43Nx
	ngzsuz9uAEPHgDFysKGwcwd0qPZMUHq1fyXmftR4d7Iw6LapIdA0ixmtIq7/MqTP
	mvwMLoTlqrSPpVxBwfH9m1X6wdi4FZjNd8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691412918; x=1691499318; bh=LgWoJWa6DXZKf
	Z0hLk5ZMf1RQyRN75OdScVRO3aOCTE=; b=eoHVU3elWaYsiRpQiyf+tBBcGFSuy
	035/KeyOKJ6VoNYygDwXvtZ9E38qwlm9JyE40Lyehnrln8FLOieh/oMKF76Lq0Fc
	mp0WiIrX7CDl+H8jhd4HAzegWFpRfz938M7gpmUtFCiV17xdr7da2vd8g/EEbhBL
	Fu6vuvESUypbEnjPJM1ePwwBV93Ej9J3QByRSaA3Up55VXiBnEe5SyxVOkGrqnhy
	yMKqbarihLw6pJKxNfxfFTnJEDmq9OS4avVaevBSu69u51uHwCwmtk6zl7KVO7mY
	qihOVaU6frPCSOfWr3pFs05tIUPvbCNyl+Ecy4K3ZD6wY9MPnhsjpTbuQ==
X-ME-Sender: <xms:tunQZMk-ovNnniymDB_0HpiMvtj1mYlcb4Oxe6i0wPL7RXBGtslOBQ>
    <xme:tunQZL1tv_cE1dUxwjIVeIvp3yReycQEpsl3rMGIU0oRo44l2SHqRSdunldUzoal_
    0CkSnB5Cuwtf1Q>
X-ME-Received: <xmr:tunQZKrftYB02avPFxCCtq2V6jYHaBm1EOyFMRFxyFKDN_ATWQUfeV5axfgLpOv-tBSFyiKYprlhTw17cmE8K50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:tunQZIlj_hUFNNFL_htnRNRj0WTjZXsF9WAi0lbDQY127VRVtuia2A>
    <xmx:tunQZK07Tbfgy8ZQ2BjcSAmUOmqgserpPW6voofO_pCjEllxXdwF1Q>
    <xmx:tunQZPty4vknxZTCBkOSGhJ2Br7pn6cK6eGV1o5cf3ILTVtavODkiw>
    <xmx:tunQZPwcikQjRLNL74-QYSQ7bIWNWIgyD8fprjMi7VA4PbCnmM6MMA>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 14:55:01 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BB4oHImKZJOc4Owo0BGCP5bb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BB4oHImKZJOc4Owo0BGCP5bb
Content-Type: multipart/mixed; boundary="------------rHN26FGsWBurFzrDYQkb1Gdw";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
In-Reply-To: <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>

--------------rHN26FGsWBurFzrDYQkb1Gdw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 07.08.2023 11:38, Simon Gaiser wrote:
>> It seems some firmwares put dummy entries in the ACPI MADT table for n=
on
>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>> 0xff. Linux already has code to handle those cases both in
>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>> same check to Xen.
>=20
> I'm afraid it doesn't become clear to me what problem you're trying to
> solve.

I want Xen to not think there are possible CPUs that actually never can
be there.

Without ignoring those dummy entries Xen thinks my NUC has 2 sockets and
that there are 8 logical CPUs that are currently disabled but could be
hotplugged.

I'm moderately sure that soldering in another CPU is not supported, even
less so at runtime ;]

>> --- a/xen/arch/x86/acpi/boot.c
>> +++ b/xen/arch/x86/acpi/boot.c
>> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *hea=
der, const unsigned long end)
>>  	if (BAD_MADT_ENTRY(processor, end))
>>  		return -EINVAL;
>> =20
>> +	/* Ignore entries with invalid apicid */
>> +	if (processor->local_apic_id =3D=3D 0xffffffff)
>> +		return 0;
>> +
>>  	/* Don't register processors that cannot be onlined. */
>>  	if (madt_revision >=3D 5 &&
>>  	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
>>  	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
>>  		return 0;
>> =20
>> -	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
>> -	    processor->local_apic_id !=3D 0xffffffff || opt_cpu_info) {
>> +	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info) {
>>  		acpi_table_print_madt_entry(header);
>>  		log =3D true;
>>  	}
>=20
> In particular you're now suppressing log messages which may be relevant=
=2E

I intentionally mirrored the behavior of the check directly below.
Unlike the the version in Linux the existing code didn't log ignored
entries. So I did the same for the entries with an invalid ID.

> The one issue that I'm aware of (and that I use a local hack to deal
> with; see bottom) is excess verbosity.
>=20
> Jan
>=20
> --- unstable.orig/xen/arch/x86/mpparse.c
> +++ unstable/xen/arch/x86/mpparse.c
> @@ -809,8 +809,13 @@ int mp_register_lapic(u32 id, bool enabl
>  	};
>  =09
>  	if (MAX_APICS <=3D id) {
> -		printk(KERN_WARNING "Processor #%d invalid (max %d)\n",
> -			id, MAX_APICS);
> +		static u32 max_warn =3D -1;
> +
> +		if (id <=3D max_warn) {
> +			printk(KERN_WARNING "Processor #%d invalid (max %d)\n",
> +			       id, MAX_APICS);
> +			max_warn =3D id - 1;
> +		}
>  		return -EINVAL;
>  	}
> =20

--------------rHN26FGsWBurFzrDYQkb1Gdw--

--------------BB4oHImKZJOc4Owo0BGCP5bb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTQ6acACgkQkO9xfO/x
ly9Q/RAAy3oKVGf3/ubS9NcmyzMrbssJ7eT2C9voXCECuVB+778CTwJc0eWKNnSb
BHzMVBtVtci0UsvYpSKW4Q9RrDiu+6YPzjQs073tN4XsczxIX+dfx+08W2bvLrTf
cz4auBtrCPKD9Y0b81JviMK+SzUDDH8WF1A0wfApWp3GFZP9D7SifJG6t+f8HaFP
F4zNo0JThdDxsGzB9VDlWR0L5qZDMKUV4xZhSg2ihOMBXiLgp4S3fwOv2JHkVjK+
E4Z6mEjqiAsDQg+FSg7I/CBf4SiYFET1TZoEjBEsmEVrmvP5fO80kyB6D+kO5i9X
i4416BraJ04zTsaPilnL7YA5lau3g/rvvQD+m2BBl50qOBbD89vNPOY5uSUv94G4
kgfQWLNn6dFIb27s4oH1kSGS6G/PxPUevaZXc+uQO+cPHVZWHQJcljsSnUUEgDDp
8+lRRsabHzVMohSkuJY570q6oW2VBH6edefnSYGCKHgUBsAKGQamVnVusQIDRj4v
5TH3NpcnKY+Y/m9c4JZ8OLJZjKzTpKARbQhWBwrAqnjnsBRKB3GigakLCvwA96Tr
balhrGHM2xJFhfbQJEqYj0DZqOEHckkr0QvbKcb/fmSFz7qyB8ZHnQe6rDtrTqxy
IIAGOpSvh+suYv9gcHe9FLR/Lb9XHv3p0pnHxjZAUNlznUpjPIQ=
=1Mke
-----END PGP SIGNATURE-----

--------------BB4oHImKZJOc4Owo0BGCP5bb--

