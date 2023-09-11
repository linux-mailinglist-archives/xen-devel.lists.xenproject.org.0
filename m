Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A2C79AAB2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 20:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599707.935244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qflIU-00025F-Pa; Mon, 11 Sep 2023 18:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599707.935244; Mon, 11 Sep 2023 18:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qflIU-00022R-M6; Mon, 11 Sep 2023 18:06:06 +0000
Received: by outflank-mailman (input) for mailman id 599707;
 Mon, 11 Sep 2023 18:06:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AVcC=E3=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qflIT-00022L-Jk
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 18:06:05 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def65325-50cd-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 20:06:04 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 103A05C0115;
 Mon, 11 Sep 2023 14:06:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Sep 2023 14:06:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Sep 2023 14:06:00 -0400 (EDT)
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
X-Inumbo-ID: def65325-50cd-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694455563; x=1694541963; bh=9SwcQiQAtnT2HbkkN+DibVreMXqZZH9zV7u
	lTaEttQA=; b=0rBYwAhOkc+zzhKCF7guEU1DTqAV49LyQqe9u7QvdawOKP0fdaI
	4b07bkuETRm1UTXFmNVmZntuU6Dt7sGbqcYwNmojx6sHxb/E0ua5AD1h9DZywVxC
	D8IEapZgqW/ajMQrI/C3KXcxssEEmmGG7U+zUa1JzOBhlYJty3ZJrG8WyBYIEe34
	S1XthHMR3x+kdbIKm0nxxj58mazC7M2t/KR0SZ29JQgqaGgo53IkqoHL8HlmlwRS
	KfXMt16qWm7TFHrEvWbzOO/wMrde9XFxrL3fEQz1peQ+z995IJyQ4oNxbJ6dVR1B
	vTWhq1bfpgFSfR75kh2Lagrq6TDJK+/3jvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694455563; x=1694541963; bh=9SwcQiQAtnT2H
	bkkN+DibVreMXqZZH9zV7ulTaEttQA=; b=QHIfxT5Qrai1iaLl1wn2wKN14TOEs
	B7ZzK/ijcHK4gsLumn7D2UfKeWpthR6gPnQzoeioZ8YI/oNDrOHvu7arqGBmdX7u
	7yDuPdmb59QI+kocRxWMa195ECZyfFRmXa8Byft0yaIAMUiZqBBfSEXdBkSuGNm6
	AvvVU2Vqkp8OfKLFENEqYPiHk8rYIBdqNclbnQdw+giQWXA5O2CxWgR17RQiB68z
	yfvqDevwWchPME9heeFJg3v8OFqIc5Zt1uuoy9WwMyBPyY7BVYtqYlHNocLFgt2e
	W2FhMwTpB1JtYgwHOel9qABIlYtkasl7OwcB8R/PhEQq3QW9P8hnght4g==
X-ME-Sender: <xms:Clf_ZI9dVtILN--eDUGooX4Vpa6j0tu31RX9cf4j0iYOAgbiSwE7wQ>
    <xme:Clf_ZAtsnrDJxEtywoWK6QCLCmnsfpo0X13b8SX9P7zKPahZkTmqJ2qNFVRzaC9A4
    4kufE06Tcucf-M>
X-ME-Received: <xmr:Clf_ZOA6CqTnPOFc9G3s7A9s6RLSApNOY_nZIZVnjzASD4LqIlJKkTb1SdWW-qQK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeigedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhho
    nhcuifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmqeenucggtffrrghtthgvrhhnpeeftdefudeltdevhfehkeefhfeutdfhffdugeet
    ffdvgfehfeekhfetgedvuefggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhimhhonhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Clf_ZIe9o9RNj8OIFv7gvzrS4LVk-QEjilzAn1FQ3kSGxZePUBTTGw>
    <xmx:Clf_ZNPAtqwiDxqtLIjetIKqBRMOmrEp67lcuQg1LQC7Bv72SoJ2lg>
    <xmx:Clf_ZClIePjxKtSpxpUfN_dvqykO1uoQGt8qxFvlWE0au7I7XVbe8A>
    <xmx:C1f_ZL1SrHSDl0OMKTc6s8Mn0XnSCCNCEW6oSYWBiIudl18k1_FZCQ>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <89f112fd-70c6-c191-ea52-e2caa6495ac6@invisiblethingslab.com>
Date: Mon, 11 Sep 2023 20:05:32 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------prctvZUwLxPDk8XzFkNtb0wu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------prctvZUwLxPDk8XzFkNtb0wu
Content-Type: multipart/mixed; boundary="------------p4po0NkY25BskihlcQGncZQi";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <89f112fd-70c6-c191-ea52-e2caa6495ac6@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
In-Reply-To: <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>

--------------p4po0NkY25BskihlcQGncZQi
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
>>
>> Note that on some older (2nd gen Core i) laptop of mine I also saw dum=
my
>> entries with a valid APIC ID. Linux would still ignore those because
>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>> this check is only active for madt_revision >=3D 5. But since this ver=
sion
>> check seems to be intentionally I leave that alone.
>>
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Df3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>=20
> This patch was committed with unaddressed review comments. The normal a=
ction
> in such a case would be to revert, expecting a v2 to arrive. One altern=
ative
> here would be a timely incremental patch submission. Another alternativ=
e,
> considering in particular Thomas's most recent reply, would be to prope=
rly
> downgrade CPU hotplug support in SUPPORT.md (with a corresponding entry=
 in
> CHANGELOG.md).
>=20
> I'll give it until the end of next week for either of the alternatives =
to be
> carried out. If nothing appears by then, I'll assume I may rightfully r=
evert.
> (This timeline also allows putting this topic on the Community Call age=
nda,
> should anyone think this is necessary.)

To avoid misunderstandings, since you mentioned the above in your
response to the related patch I submitted today [3]:

My understanding is that your main concern is that those entries with
invalid APIC IDs shouldn't be ignored, since some firmwares later update
them with valid IDs (on hotplug). This fully conflicts with the
intention of the patch. Resolving the disagreement that followed is
outside of my control, as being only the submitter of the patch.

You also commented about not logging the ignored entries. Until it's
clear if the change in general is accepted in the end, I considered it
pointless to address that detail. If you disagree and want a follow up
for that, just let me know.

Simon

[3]: https://lore.kernel.org/xen-devel/20230911101238.18005-1-simon@invis=
iblethingslab.com/

--------------p4po0NkY25BskihlcQGncZQi--

--------------prctvZUwLxPDk8XzFkNtb0wu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmT/Vu8ACgkQkO9xfO/x
ly+HzxAAuQWx4QZaI6nJt6ZwnqzkC9HrUMLxW0YEA5bVrRD19EmcKvoVH4Kwfz9B
r5Fx7kpya+3nqd+P9Ur4pH8I2/E78F/kLrqr3iCXZGs+hcGNydmOgf2xOPGvo/Hz
gC02W7yqFuWDoRHeQUHxaok8wIhxccnoQTcieQo9TRFp4XK4zmdZKT/avgWmcQOq
VJlmGk7uk4SK6tIPS53+QaNhRzvel8BLcP68YM1VAswVuJYcaGHRzWyzbqUy33Io
kv/6ldSki20uGc5GIe/KgRbEZklygUjiv8jgGc0AV5u2N3yTSIQIna4R9gwNpdhq
0skwlv/T28sBC2x+ChwoqOwtVIbXhd/HRl5SmTlxtqmn1U0gjLeKHdAvyrQEOl67
aYE63ywgp0+vtAUm87t40mDDDSpkhb/2/jo6qx6P7NlDT5SDm5rHCJ8rvFKqmq9M
UTFBPYDliefRNqc9TNhrQF8z4QLazz0FINnPJAbZcLiUJMgcaC6Gwnx3pO9uAxqp
QcHXFVmV+z9GkXe9EOnjBEVartoztd90fj+k66cLDO2aX78zMsaWbFg3Ju50647J
P4s6S6xPqLQG2GNMcSmBEO8SGnuqfo3ex40UeZjPNMdCJAmzRXEdDUuwiVnsTq/q
kKcQJG4PugvERUGEGCYC88t+iRlPmDkM+Z/jOeaO9/IkmzLDAzk=
=lXbk
-----END PGP SIGNATURE-----

--------------prctvZUwLxPDk8XzFkNtb0wu--

