Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892C757E0C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:46:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565278.883308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLl1x-0004ik-9r; Tue, 18 Jul 2023 13:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565278.883308; Tue, 18 Jul 2023 13:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLl1x-0004gz-6Q; Tue, 18 Jul 2023 13:46:21 +0000
Received: by outflank-mailman (input) for mailman id 565278;
 Tue, 18 Jul 2023 13:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLl1v-0004gt-J9
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:46:19 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77d33e74-2571-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 15:46:17 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6275B5C0189;
 Tue, 18 Jul 2023 09:46:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 18 Jul 2023 09:46:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 09:46:12 -0400 (EDT)
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
X-Inumbo-ID: 77d33e74-2571-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689687976; x=1689774376; bh=SlSV5WY5v+5I4D7noJMKg+pWrfdzOuPCv6p
	9EgurUGo=; b=tmxKk6Yx2o6wJr/itlsK2RrZ7+rF6VixdRL60z6nXOxw4UIYGpc
	NDTtT9DySRm5l0kT1MA/lJEinJuiV2/sVNKdcN+Yk200TEl3469xqu6TR3oTO/Mr
	U0u1n0pLGS7a2PA0jYojeWI+K1kuADrId9oQV10CkEudzXC3MVnKVp+KNJ/bGK7K
	JNNjEZ6nDrJEp1Y2zJNjf2VAxeAlzeCl4aaHRCVs8M1xkW+9i6GXIqb0+ARz15/o
	KJE1LsM/KSFcZDsBg53RM5yRnFqtsu+f5qo6QSxgZm+JW9pzjoreKlORLbNJtXxt
	JN9Nvokb+Xv+jRvNZDin7UQwAI5H3FN2MBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689687976; x=1689774376; bh=SlSV5WY5v+5I4
	D7noJMKg+pWrfdzOuPCv6p9EgurUGo=; b=q/jEEr6m3X/KxGTaCpLxQXiCWt5Sh
	QOo567IoSNiEs3t2L+pvzDJWNxqHDj/0fJlpWLH/kX+G9VhU4Ub58vPaKJUrgv4x
	jnQqvEtgZAdVMTHSoDVIKJnZVnhy0a42PsOVXDqQ97bF6OH2lyBZ6fpfVISJCWEJ
	zHg4dTAJY80GR2f2yxHCc+VIaA78hqDQbuqiDrxWmF3ZLro+iKFaGgh54iiZr4tA
	r68Li5jj+dl/UAElP9dfismGndyoaLR/Od7SslqTiA9ZoMDqJNZzVAEB0qLcgRuA
	lUZBk2EoDLq9Iij/mK97V9aQ5cWTR0o7b7Zu2478N8t0sqKn58qc/kZ6Q==
X-ME-Sender: <xms:qJe2ZIg5f5PeWQmIrs8DxJW6BJQSMB5WMvvgn9tOzCwa8kDRM-E7vg>
    <xme:qJe2ZBDLMVxo-1hEx4ITlGl6oS-VbiKNSpbxTKnvrDghS6gP_UB6FeutE7BFMfgQ6
    ACN5qOOfLsTT-Q>
X-ME-Received: <xmr:qJe2ZAEuxAe5Bfpain6Y8hTXGlq5jAwXa8xvltqwQFhC5tXU8dmAjcINcMo6TkhFNuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:qJe2ZJToqxua5-kzVXmYCpa4_QPnpn12rH3-OxbwbxL6vzcMD5jo1w>
    <xmx:qJe2ZFzD2jfhZPjHiUh70tae0YT-J9U9mhl1PnneDKkR2v9z4Kduhg>
    <xmx:qJe2ZH5yYLViCAfshlS0nmgP4EJwvfTwC51X0OFhCn4MBHhrr8JaSg>
    <xmx:qJe2ZN9pafxnY9FRh6f99FjAaJvC81_ICVJ3LeFwxr0vUyACOV3qPw>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <2be631d2-95f3-0d7f-ad84-eb9e16d1a39a@invisiblethingslab.com>
Date: Tue, 18 Jul 2023 15:46:05 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
 <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------31AD7960I2Um0Sv0REX5xkxH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------31AD7960I2Um0Sv0REX5xkxH
Content-Type: multipart/mixed; boundary="------------6VO490n7npcJWxgrn0QVV4Oo";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <2be631d2-95f3-0d7f-ad84-eb9e16d1a39a@invisiblethingslab.com>
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
 <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
In-Reply-To: <aa23a090-1883-008b-e395-2a3bca709258@suse.com>

--------------6VO490n7npcJWxgrn0QVV4Oo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 18.07.2023 15:23, Simon Gaiser wrote:
>> ---
>>  xen/arch/x86/acpi/cpu_idle.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> This lacks both S-o-b and a proper description. The latter in
> particular because you ...

Yeah, I also noticed in the meantime, sorry. Will be fixed in v2.

>> --- a/xen/arch/x86/acpi/cpu_idle.c
>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>> @@ -155,6 +155,12 @@ static void cf_check do_get_hw_residencies(void *=
arg)
>> =20
>>      switch ( c->x86_model )
>>      {
>> +    /* Tiger Lake */
>> +    case 0x8C:
>> +    case 0x8D:
>> +    /* Alder Lake */
>> +    case 0x97:
>> +    case 0x9A:
>>      /* 4th generation Intel Core (Haswell) */
>>      case 0x45:
>>          GET_PC8_RES(hw_res->pc8);
>> @@ -185,9 +191,6 @@ static void cf_check do_get_hw_residencies(void *a=
rg)
>>      case 0x6C:
>>      case 0x7D:
>>      case 0x7E:
>> -    /* Tiger Lake */
>> -    case 0x8C:
>> -    case 0x8D:
>>      /* Kaby Lake */
>>      case 0x8E:
>>      case 0x9E:
>=20
> ... don't just add new case labels, but you actually move two. It
> wants explaining whether this was outright wrong, or what else
> causes the movement.

Yes, as the commit message says it get those PC{8..10} counters for
Tiger and Alder Lake. The former already had a label, therefore the
move. I assume that when Tiger Lake was added it was an oversight to not
also read those package C-state counters. I can add that to the commit
messages.

--------------6VO490n7npcJWxgrn0QVV4Oo--

--------------31AD7960I2Um0Sv0REX5xkxH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmS2l58ACgkQkO9xfO/x
ly+IwRAAiz9ysj/AKsnDS6y+Vx42VnCY1LHSPTZTQ/rHLrwA8e/n/xlqquCIbccp
ctjoajqKhKlaW9tNru4aeWwGbxmhqM2Vura4XGb+BFBLSipeUPHsxBkop4mZjSWc
stKd4yiikWZOU6+HczeOU8oX90abNV0pAM1K+AuNW4RlBte9lJ8E3g7rcqtGzaak
4Fz/KUxzUa1d5wmP4OhdCIqrZG/OASOKzTQ/26N8JE0rsJW+YYPHxEd/Ous6Rbg3
YfYi1/Jp9oDE7glUv+UnFas5eBFXy4tDzA2qNuR5tP99RbzETGCC9S2XHtpncGiA
n6FinK+05p9bYzNIk6Lx0zuewqsconOa8YKHELJYVBm/B425FUVAWSrmpU2JSKtU
vedUB5MfMWSyo8N0C3XyLt56f3DX0DJwwaKoS3ZXVZ3wOMZx4vyv9qoO/IR5psxK
Y+p/ayy4gQ4k8+NMTeBohrjX9A5lgUUrIiGrxvanFWf86+G6ey9jdR7UstV1H6Oq
iO6jQIxgk4sj+U5BSHRX2KDPvT7VjKHTFAjKSXQW1GNfgykq3ihVl+h13JNRD5Bi
aL+VKJPfRt9fvJxq3D80imZ0vQyLQIPJovpATleGwr/ZLPGGut1lU0DYocHdyX6E
uAGVWla6l03ltcjo2bo3fhgFgGy55DB9yluqw+96m0pmTj+ZbYc=
=VdJV
-----END PGP SIGNATURE-----

--------------31AD7960I2Um0Sv0REX5xkxH--

