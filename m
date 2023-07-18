Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285A75889E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 00:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565524.883738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLtLO-0005yH-K8; Tue, 18 Jul 2023 22:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565524.883738; Tue, 18 Jul 2023 22:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLtLO-0005vA-H1; Tue, 18 Jul 2023 22:38:58 +0000
Received: by outflank-mailman (input) for mailman id 565524;
 Tue, 18 Jul 2023 22:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLtLM-0005v3-VG
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 22:38:56 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dec0ecd3-25bb-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 00:38:52 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C7C3F5C0134;
 Tue, 18 Jul 2023 18:38:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 18 Jul 2023 18:38:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 18:38:49 -0400 (EDT)
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
X-Inumbo-ID: dec0ecd3-25bb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689719931; x=1689806331; bh=nFyyEH9VlfXlBXqNzRUaguWL5sjGOdyy8v6
	voiXeH1g=; b=iJGbneTJS7cA7H/LQnxng1ItTLP0y36uLSqkPGKKc/bKdA1o/Yu
	72ybAWnXBzkIrioaLFSURlPwkuOSY8fSx2Pfz77FNAo1jz2jkWUIj8o7Cb7t9Luh
	7svFVP9xCixPLmEg/gC1JQTGSxIuy93XZs9vR1vLaYWybonZcCjC66fcMCTk11mh
	3e8bzgRPDM7Km76iwUysJLAxEBqzqBET0SSEZvpp3xcK6uAjYvtCi59BcH4pifZ3
	pyhxlH8WKvGnWOBmqBhwWQOf14BNDjB7d2PPPdxavyTddA/AWAMsdcwExxnoU5jj
	nJRxDSmaxacyl/4FKkt3FdVL+mBfo24DfWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689719931; x=1689806331; bh=nFyyEH9VlfXlB
	XqNzRUaguWL5sjGOdyy8v6voiXeH1g=; b=vEai8/PrauZavfg1gsb6n2w2kW3gy
	R+stiwdeFG0hvwb+hunDkUQe5sCHdM4iLa6plgWVK2O2aNLc6K70EVwOxnirlNbm
	O4q9w7OWQByxLmbX9gmVgkkbZk1wC5JG0zi7b1TxGl0VYb4ex+EGzuecfEVuQyQh
	TTCex8f0M1owmOP05KpAwaiP0VDjkPxYIx9qJUbLgH4MJZjqM/DPzuHD1RYOylUz
	Lcxk3pQASGQwG4tLsBYF3gtOOwSNFLIXt1iui8h8x6RXEr4R+TWDCz8e0qayBVRY
	ujgZZ2IqXyqLyiO/kwvmqxmuYLWdURgdwQo4zCpdJczL/rUpZ2Rpir7Jw==
X-ME-Sender: <xms:exS3ZLe-mBStGF2lb4VSlzu1wcLttvGfc75eZua1IUORWnIf30_gjg>
    <xme:exS3ZBO6C8vtwWbL_kEJKIw9U69yWMNiJvBW32mgfx6BtbBu6KU-GODYuNwWE-VF7
    mnYzEf8OtfghWo>
X-ME-Received: <xmr:exS3ZEikD_jGuLkV15jkeL7hzJOpG8g79BsBINIuAPUNamC0c-_xPOCOGZqavdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeehgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:exS3ZM8OhdNwPP50_C7qYemsjBpyit5oUYOqp1N5WeeJe-u3FghaIg>
    <xmx:exS3ZHsMDQBuPI-TXuxaACEpBN5v9RGvtn8-w5znNmO542iK2GKTmQ>
    <xmx:exS3ZLFuD2tO3HqYfCdV73AOwpT7ZBsXyo37ETilnjR3B-mXiiTnNA>
    <xmx:exS3ZHKZ-jYLZX-DyQvg247qEVIi9yfm37aNbvBLpzZrQx9IJut-ew>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <9b53ef8b-7911-ed45-2160-60e6d553fc69@invisiblethingslab.com>
Date: Wed, 19 Jul 2023 00:38:39 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
 <d512a592-24e7-2eca-16ce-7451dc110f64@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <d512a592-24e7-2eca-16ce-7451dc110f64@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0rxpIIXHNkyyVoM2hw1G9Mg2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0rxpIIXHNkyyVoM2hw1G9Mg2
Content-Type: multipart/mixed; boundary="------------2wrqahpHeSbi3sBPezDeCkd7";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <9b53ef8b-7911-ed45-2160-60e6d553fc69@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
 <d512a592-24e7-2eca-16ce-7451dc110f64@suse.com>
In-Reply-To: <d512a592-24e7-2eca-16ce-7451dc110f64@suse.com>

--------------2wrqahpHeSbi3sBPezDeCkd7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 18.07.2023 15:17, Simon Gaiser wrote:
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -965,6 +965,20 @@ static int cf_check read_msr(
>>          *val =3D 0;
>>          return X86EMUL_OKAY;
>> =20
>> +    case MSR_PKG_C2_RESIDENCY:
>> +    case MSR_PKG_C3_RESIDENCY:
>> +    case MSR_PKG_C6_RESIDENCY:
>> +    case MSR_PKG_C7_RESIDENCY:
>> +    case MSR_PKG_C8_RESIDENCY:
>> +    case MSR_PKG_C9_RESIDENCY:
>> +    case MSR_PKG_C10_RESIDENCY:
>> +        if ( boot_cpu_data.x86_vendor !=3D X86_VENDOR_INTEL )
>> +            break;
>> +        if ( is_hardware_domain(currd) )
>> +            goto normal;
>> +        *val =3D 0;
>> +        return X86EMUL_OKAY;
>=20
> In addition to what Andrew said: Why would we suddenly allow these
> reads to succeed for DomU-s?

That patch wouldn't actually allow those reads, but fake a 0 response,
or do I miss something. If you mean that behavior: I just mirrored what
is done there in some of the other cases. If you prefer something else,
for example treating it as unimplemented, I can change that.

Simon

--------------2wrqahpHeSbi3sBPezDeCkd7--

--------------0rxpIIXHNkyyVoM2hw1G9Mg2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmS3FHIACgkQkO9xfO/x
ly+yThAAntqMMZFp8JESAhHrcQWwJu2rVw6fedsPnHVREG4pMW3iZbwj948zFAns
ebgIxID/813do1K3HYNTDms0XpjsyKhAK+pDF7iqu26czh6mLTyNN3t9OGwYlZ12
O7xlfEpAZkecL1FjmCDNMHfSx4WXBKTtPBdzECZ/SIegQ84FabyRBbww0rT4vdx9
LChAESBcFiTwmPLiVla8Q5t+DKv0oenz0mUemF/IdFKweGBaxvD9Q45y2BfcbOCX
CyLXP7OqtqWHuAlR+BIELq3KjLEc9wbVQwDXRX1qthzZBGi1mf2HDuGphfIqLq1l
ad/9e7ZRs9ypGpVuNt9+k+vewVWu+QaGaDBgCv/MZ5KIDgafyUT4oEIpCv5YD3Uc
02+YzynDLpXl83TBExxTgWWemG0Qn4hAfth+J/m3o2SqInTqDHUVKficBFfszRRi
GCG5lbRm23b4XND6tOYQrrjvuj5hQGJ7otytYge1w9LbTgFIKKlRKq9fgy6KKWIk
FzXD7OOSkeoFaIkjI77QGg+bP5fYvNiYUy/4y4LA6QWYrDRUPmg/ywV6tfF8EEGO
7Fnm+bKs1TDxjVCYWqV80MLhrOyPgT/gOm3nq4eP6O3aQxtrGADGhZWV64yQx7M2
AEWvlIg6xIvlSKJ9N0MgJG/M2s9hW2iuXhQQbTw3XVpDZ6SI9og=
=rjKt
-----END PGP SIGNATURE-----

--------------0rxpIIXHNkyyVoM2hw1G9Mg2--

