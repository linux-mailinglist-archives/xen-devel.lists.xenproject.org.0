Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EEA77288C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578600.906179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1nd-0006i0-Tk; Mon, 07 Aug 2023 15:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578600.906179; Mon, 07 Aug 2023 15:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1nd-0006fA-Qe; Mon, 07 Aug 2023 15:05:37 +0000
Received: by outflank-mailman (input) for mailman id 578600;
 Mon, 07 Aug 2023 15:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qT1nc-0006f2-9X
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:05:36 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db4a478d-3533-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 17:05:34 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 132BB5C00BB;
 Mon,  7 Aug 2023 11:05:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Aug 2023 11:05:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 11:05:30 -0400 (EDT)
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
X-Inumbo-ID: db4a478d-3533-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691420733; x=1691507133; bh=x1PjOXBZ8MeWIkWCLhH5M7yKNK3YPDONkXO
	9+vqVpf0=; b=ylRidWyz6T2jUDsFyBKPXdIyYldsjMVInGMaBuM77HLj0RxoPxF
	NQqVxemL2fX2xwbzdZbnXY5scTXwlF7NEOBa5+P/n3GmWyTvt5aUmrVB1jNwCDRo
	NLFE7/cj1fXgDGcKsALQjTcKSrtqYLCHXJF7/f6ot0gMjrZyRS7/0DopSVElv6sN
	KXk3kWDL5zlW+DfqcNYXCns36RIvn3CLiRO+nXPKuUnSTv7iNRQhT+edfoAbfylE
	vHsf3PKvua1C1QJ5uzeW+RAc7RCTh3EQMfq+TJW2Afk7rSEsJrxPlmqgOb5XG8sV
	hGe10UVXtzN0klarDGwG1hdEJG+feuoOK4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691420733; x=1691507133; bh=x1PjOXBZ8MeWI
	kWCLhH5M7yKNK3YPDONkXO9+vqVpf0=; b=Ejjl3VU6aM+QEvXRsdGBk6atbuUzh
	V6p4PWJNzqagtK2F/Yl9ToA1zpuxHReBE+dtLnQXHmqqNO4Jc52pme+Fm/b6dYpz
	+9SsvdqL31U8BOltlBY7UiNRg2JhYRUxiOk1/fgmAMusUipEtosVgHb+FIGLwyR6
	5InWjiCPQEcUFI/SnNbXYVvaOTob64Rir/mg6qypu3gfLRKUL5gY5FbOQTmb/3Cq
	t/xTD0DVF+y+wLZqr/BiDm2ojBd+/0POxx+XJhuvYZqkdprQmeSUqAZH5bkEFMLV
	Y0Xm5aXaSgNtE/PQsybxYwux7yovHQEsxRpA4vV9mynrnr2KoSMpQ6pbQ==
X-ME-Sender: <xms:PAjRZFa-CMF9mc4gqqOL6iDHe16fIUSy7R6Dsb9M580oXezstI-riw>
    <xme:PAjRZMZq-F7NRgK0woUZQ62faq-ntEwKSWXVv4-D1-UbAB_fTEQVx9Ug-9p0_scm7
    KEIiNOKMqYiE2E>
X-ME-Received: <xmr:PAjRZH-ym7lvj2zcu6xME-8DGDesftVmTF2LGSuae1F0DIWXKeI9r8BicLMSTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeftdefudeltdevhfehkeefhfeutdfhffdugeetffdv
    gfehfeekhfetgedvuefggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhimhhonhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PAjRZDqGoN1guq6vSsrKKhQ2lAxWE49OK8iJhOcZ2J0bOrtz4h4DiA>
    <xmx:PAjRZAoHrdv51rtcotdor-_hnm4Mmb22z7wCtLDKNt3rUw6z1xIQyw>
    <xmx:PAjRZJSXHae_bw9i_VaCr5kMI-7ko3OKcLq0blfGA6sbefS9m_F-5g>
    <xmx:PQjRZLXbAaaT9gB3-CXF7MhEL-iogFWsypIjX_j_OJBk_TRnKdMcDg>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <3951c6fe-9912-634f-203c-6ba730cdc047@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 17:05:18 +0200
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
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1XX4WipUR17ddjVy1wur38SO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1XX4WipUR17ddjVy1wur38SO
Content-Type: multipart/mixed; boundary="------------8PpbNFGZn32ploxgMhDxTmoH";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <3951c6fe-9912-634f-203c-6ba730cdc047@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
In-Reply-To: <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>

--------------8PpbNFGZn32ploxgMhDxTmoH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 07.08.2023 14:55, Simon Gaiser wrote:
>> Jan Beulich:
>>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>>> It seems some firmwares put dummy entries in the ACPI MADT table for=
 non
>>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID=

>>>> 0xff. Linux already has code to handle those cases both in
>>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the=

>>>> same check to Xen.
>>>
>>> I'm afraid it doesn't become clear to me what problem you're trying t=
o
>>> solve.
>>
>> I want Xen to not think there are possible CPUs that actually never ca=
n
>> be there.
>=20
> Did you try using "maxcpus=3D" on the command line? If that doesn't wor=
k
> well enough

Yes. Then Xen says, as expected "SMP: Allowing 8 CPUs (0 hotplug CPUs)",
but disabled_cpus is still 8 and nr_sockets therefore calculated as 2.

> (perhaps because of causing undesirable log messages),

I don't mind some verbose log messages.

> maybe we need some way to say "no CPU hotplug" on the command line.

That indeed might make sense, but I'm not sure this is what I want here,
see below.

>> Without ignoring those dummy entries Xen thinks my NUC has 2 sockets a=
nd
>> that there are 8 logical CPUs that are currently disabled but could be=

>> hotplugged.
>=20
> Yet it's exactly this which ACPI is telling us here (with some vaguenes=
s,
> which isn't easy to get around; see below).
>=20
>> I'm moderately sure that soldering in another CPU is not supported, ev=
en
>> less so at runtime ;]
>=20
> On your system. What about others, which are hotplug-capable?

Would those be listed with an invalid APIC ID in their entries? Then I
understand your complaint.

PS: based on your reply to Andrew, you think that this might be the case.=


>>>> --- a/xen/arch/x86/acpi/boot.c
>>>> +++ b/xen/arch/x86/acpi/boot.c
>>>> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *h=
eader, const unsigned long end)
>>>>  	if (BAD_MADT_ENTRY(processor, end))
>>>>  		return -EINVAL;
>>>> =20
>>>> +	/* Ignore entries with invalid apicid */
>>>> +	if (processor->local_apic_id =3D=3D 0xffffffff)
>>>> +		return 0;
>>>> +
>>>>  	/* Don't register processors that cannot be onlined. */
>>>>  	if (madt_revision >=3D 5 &&
>>>>  	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
>>>>  	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
>>>>  		return 0;
>>>> =20
>>>> -	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
>>>> -	    processor->local_apic_id !=3D 0xffffffff || opt_cpu_info) {
>>>> +	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info) =
{
>>>>  		acpi_table_print_madt_entry(header);
>>>>  		log =3D true;
>>>>  	}
>>>
>>> In particular you're now suppressing log messages which may be releva=
nt.
>>
>> I intentionally mirrored the behavior of the check directly below.
>> Unlike the the version in Linux the existing code didn't log ignored
>> entries. So I did the same for the entries with an invalid ID.
>=20
> I'm afraid I can't bring in line the check you add early in the functio=
n
> with what is "directly below" [here]. I'm only inferring the "here" fro=
m
> the placement of your reply. Maybe instead you meant the rev >=3D 5 one=
,

Yes exactly. "directly below" was meant relative to the if I added.

> in which case I'm afraid the two are too different to compare: That
> rev >=3D 5 one tells us that the entry isn't going to be hotpluggable. =
The
> APIC ID check you add makes no such guarantees.

As mentioned above, if that's the case I see the problem.

> That's why the new flag was actually added in v5.

See other branch of this thread:
https://lore.kernel.org/xen-devel/80bae614-052e-0f90-cf13-0e5e4ed1a5cd@in=
visiblethingslab.com/
So we might cover at least my case regardless how invalid APIC IDs
should be interpreted.

--------------8PpbNFGZn32ploxgMhDxTmoH--

--------------1XX4WipUR17ddjVy1wur38SO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTRCDAACgkQkO9xfO/x
ly9F/A//V1HnvexE/g4/sZcg7CAIVQJ8XTAHbxqmv7rAhLmuLKSZcGeOYriEYVg/
zZMaL82Ja3bYD7DlVUm5Pxan7McNdPIpldpW+ffbkS1SOCQzFpVhA5wbkDV4Z4jh
ulxxO5DQWrOgTrmjqK0jL24SPHgqcsFFvHoQPW5fAMJXEU13Hk7kvOlG9PdiXbst
2/9icgzzN5ANcxGZDFbEY7KOt1VvP7lPqMkZ9As1kdfW7vpeMZD7U2gDGMqyPhxz
yIoH/k9s+S2IyTO4J75Dku2kQa3PfnNIcksq/0b0W/LpnQnJhlRocBLTro/frl2R
WrA+HLhb54qkMKgQD9AhIvr2GAlmFCBLGN4KjoRYqGDemDr2BxRp6Iq0dnRWIhvu
HOcMCjObZfyQOyz8sddof3HTUFX7gh/HyBmhWMUoMXde8INX/UGzcysp9KB1Ieb6
oRcCy2lkb/Ly6AfGU8s7mc6x4DQ4KhR5FbIXfxtdiGX6GDH+xfst95DUYoBO1www
aMa4TggRLFcagKBftUJZjqZnZEEqkBEc8U8ac9AWdSsdreE0rS7or3k1bqv63pXN
BbgxtQTm03rlxsLp1TqzAEuogrkAj5g90plmA7TCdTTQpVJbAhxahgyxXRgVKYih
nKDpqukFZoA59EDiixqr7rINM8ylSgeNp4pFNJii3aHnNOXKIVU=
=86/z
-----END PGP SIGNATURE-----

--------------1XX4WipUR17ddjVy1wur38SO--

