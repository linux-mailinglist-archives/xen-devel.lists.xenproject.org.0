Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA2772821
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578568.906128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1UW-0001kg-8f; Mon, 07 Aug 2023 14:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578568.906128; Mon, 07 Aug 2023 14:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1UW-0001j3-5o; Mon, 07 Aug 2023 14:45:52 +0000
Received: by outflank-mailman (input) for mailman id 578568;
 Mon, 07 Aug 2023 14:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qT1UU-0001ix-Jq
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:45:50 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 164a6fc0-3531-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:45:44 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A3955C0163;
 Mon,  7 Aug 2023 10:45:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Aug 2023 10:45:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 10:45:41 -0400 (EDT)
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
X-Inumbo-ID: 164a6fc0-3531-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691419543; x=1691505943; bh=13KAJVRZS0lyDfttFufljOzKUjXfoyee0eD
	pd8LZa1s=; b=pxbUCzYsTJutG5RFN2n+HoWa4FaBDZ9Oc1j5ToNLWYMMDF9+M0Q
	9+EdD8Ry/lEpNKHbNFTG6G3sJE/Bg6n+7LMLW4tjubhXaiNGooXH3c0Dw0FbPl1c
	DQF+SXv03aBhAO2cRAsGpK/K1amhLcPn+7oNr2CCXMgkOFeqxElnn7Yse0Tr2yBt
	ZVnqDgNxlG0sfjEEntOsZTX7sfibFh1Mt38UDGnlrYvdcYDACNLA3iNOdAMc/r+z
	lTJi8dfZvyEtiTGMGsoK+RclnyoNIgeAbL3n6U/ft5vIIKAuKn0nQhfx//9KZiyK
	rsgr/4wnV9ZPA9gXOR/jbWBITS/Iedhh+Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691419543; x=1691505943; bh=13KAJVRZS0lyD
	fttFufljOzKUjXfoyee0eDpd8LZa1s=; b=DVQoH9FgnC25GO0AKlPE/qGe5pzAB
	6AarpfQGfFeol+e3fGIeePr0kaqdGvSwfw6OeKZqAgh67acG69Pnbyl+r2i/+GXl
	gi/UzoDCCuDZiF7mgT+N6lAONu0TCrA9MKx5v0URD0vQ172glmMnMkZhFRilfOtm
	vbuRu580nmUzeJhmeSYT/lOiMC0immZKqhsnByN54bDMBXVnHrnEbFE4nIlErhgi
	0Y7GrL6iX8XR2aGBRPo7ZEiF1VzneFn/FHxQVeEiRHg5jkWdEFGmDRVi3/DojLKE
	Y8LzsFTOV3dbbEQgWxLzJUHpzwD3aGMO+T5x8+//VsuA5QL+IqQ9RNoIQ==
X-ME-Sender: <xms:lwPRZHXhbmkwtCbSZaVDoa2MSONP-fFf8KykJvkzcQ5frVlFlrppBA>
    <xme:lwPRZPk4lxg8y0lANy67nzKQJa4nxA3iHBKPbSg1o2j8tW0qH2jFVnPq79zeTyHOZ
    QwBlwcfSHXuS4M>
X-ME-Received: <xmr:lwPRZDZQf8BMOLHa3KHXgBkrjNtFeG4n_EAqqed0cUHyuSYGiU6moVaazA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedvueekveegkeegtefftdfhgfehjeejgfetkeettddt
    jeegkeeivdelueevvdegkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhuvghfih
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:lwPRZCUX8WIgpIawzb8NHiyyDjggPVOya7tdvQXEeeVK10-mg6ssqA>
    <xmx:lwPRZBnd0WPknTjDB5FI_-yNalgSMExkCPSXm5NxTOdJZ_PGdqSc4g>
    <xmx:lwPRZPc18g6jbGWLOEebMaoFLXS0B7B69lv5it6SwljxjYHf1THnDw>
    <xmx:lwPRZHjDGHhvZ453Etb4FmiF3v4MQlklD8m3nxwFm0ORGPCPd5A1Yg>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 16:45:27 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dc4774u00hkvArK9z8mfi2to"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dc4774u00hkvArK9z8mfi2to
Content-Type: multipart/mixed; boundary="------------0aWoOdf9NvherbXim0P4ZODl";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
In-Reply-To: <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>

--------------0aWoOdf9NvherbXim0P4ZODl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 07/08/2023 10:38 am, Simon Gaiser wrote:
>> It seems some firmwares put dummy entries in the ACPI MADT table for n=
on
>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>> 0xff. Linux already has code to handle those cases both in
>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>> same check to Xen.
>>
>> Note that on some older (2nd gen Core i) laptop of mine I also saw dum=
my
>> entries with a valid APIC ID. Linux would still ignore those because
>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>> this check is only active for madt_revision >=3D 5. But since this ver=
sion
>> check seems to be intentionally I leave that alone.
>=20
> I recall there being a discussion over this, ultimately with the versio=
n
> check being removed.  IIRC it was a defacto standard used for a long
> time prior to actually getting written into the ACPI spec, so does exis=
t
> in practice in older MADTs.

So I noticed that the check in Linux is actually slightly different than
I thought. Since [3] it always considers the CPU usable if
ACPI_MADT_ENABLED is set. Otherwise it consider it only usable if
MADT revision >=3D 5 and ACPI_MADT_ONLINE_CAPABLE is set.

So I checked what the ACPI spec says:

Up to 6.2 Errata B [6] it only defines ACPI_MADT_ENABLE as:

    If zero, this processor is unusable, and the operating system
    support will not attempt to use it.

And the bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
"Must be zero".

6.3 [7] Then adds ACPI_MADT_ONLINE_CAPABLE and changes the meaning of
ACPI_MADT_ENABLE:

    Enabled
        If this bit is set the processor is ready for use. If this bit
        is clear and the Online Capable bit is set, system hardware
        supports enabling this processor during OS runtime. If this bit
        is clear and the Online Capable bit is also clear, this
        processor is unusable, and OSPM shall ignore the contents of the
        Processor Local APIC Structure.

    Online Capbable
        The information conveyed by this bit depends on the value of the
        Enabled bit. If the Enabled bit is set, this bit is reserved and
        must be zero. Otherwise, if this this bit is set, system
        hardware supports enabling this processor during OS runtime.

So with confirming firmwares it should be safe change the simply ignore
the entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE

We can also do it like Linux and ignore ACPI_MADT_ONLINE_CAPABLE
completely if revision < 5.

Note that the revision was already increased to 5 before 6.3.

ACPI spec version    MADT revision
                 =20
6.2 [4]              4
6.2 Errata A [5]     45 (typo I guess)
6.2 Errata B         5
6.3                  5

[3]: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2fe996=
44a01f
[4]: http://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
[5]: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_Sept2=
9.pdf
[6]: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_Jan3=
0.pdf
[7]: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf

> Otherwise LGTM.  I'd suggest dropping this paragraph as it's not relate=
d
> to the change.  It will also help if we do decide to follow up and drop=

> the MADT version check.
>=20
>>
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Df3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
>=20
> https://git.kernel.org/torvalds/c/$SHA
>=20
> Somewhat less verbose. https://korg.docs.kernel.org/git-url-shorteners.=
html
>=20
>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>> ---
>>  xen/arch/x86/acpi/boot.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
>> index 54b72d716b..4a62822fa9 100644
>> --- a/xen/arch/x86/acpi/boot.c
>> +++ b/xen/arch/x86/acpi/boot.c
>> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *hea=
der, const unsigned long end)
>>  	if (BAD_MADT_ENTRY(processor, end))
>>  		return -EINVAL;
>> =20
>> +	/* Ignore entries with invalid apicid */
>=20
> x2apic ID.
>=20
> ~Andrew

--------------0aWoOdf9NvherbXim0P4ZODl--

--------------dc4774u00hkvArK9z8mfi2to
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTRA4kACgkQkO9xfO/x
ly9ZEhAAjyDibkK4jOB0OTUur0ns+J0qOlmwEKrBvVfpJC3sEHHyUooeJcHxdEzu
QmRRNZmXHnTUOTq8Tc1Cm1jm2Hw/1F8QueZlo6S5DVOR6P0zTYtTxqb7bulpZ2f2
vJqidos91zFeofKBdFb99Qg4j2YOONlKEPWSB6b0V2LxNbWk69hMEBdAbapsnZFS
mKnwKYiQ//yyPuEMf6kSpJfXob+ZyInOH8UXn28WGyWV3tGgjfc8aXa2H6Qlghhb
R0UxXeUvwnp9f5HcZE/GA0euPS+yFtPDGc5i7HcBVn2cDVGXabfj99Fro1kq2faD
KmjCg7zxFkv5xVNfXf15LcSaItTn6+xse+xzfyMQwRaGuIbQrYjzeqPe3ZUzi55r
5iSlsADc+/y2H8K7i3KLkR5Hz/tIfmm2ABcmj/rCdbZ9m0EvhXSGXOjPv/Mg9tRy
2kKSElDrkE1jLexQHVBW9+da4sTglWZHAB6sj1Waq0b238zqCedI0SoUGT/3e5tc
0zQLfSv75x4mq/XDSpaPioZ/GCWl8mRdjMAb9vO70Ld/o7UuI14bGBQPj3a6prQ+
30MnRr0Co70BDc6luwB817yL8NcOFVSSKWwvrminbMCXhupsX60XpJM3I2icxFb4
YDsy6c9+SKL8Ob8kp5uLwiTmqMOhADoKRpu/RM2cMA335YbveIE=
=Ag0K
-----END PGP SIGNATURE-----

--------------dc4774u00hkvArK9z8mfi2to--

