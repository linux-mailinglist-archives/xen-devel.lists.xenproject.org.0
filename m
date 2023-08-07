Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9257771D5E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577942.905073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwpo-000322-32; Mon, 07 Aug 2023 09:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577942.905073; Mon, 07 Aug 2023 09:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwpo-0002zr-0I; Mon, 07 Aug 2023 09:47:32 +0000
Received: by outflank-mailman (input) for mailman id 577942;
 Mon, 07 Aug 2023 09:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSwpm-0002zc-EO
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:47:30 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bb0d336-3507-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:47:29 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A42DF320090F;
 Mon,  7 Aug 2023 05:47:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Aug 2023 05:47:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 05:47:24 -0400 (EDT)
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
X-Inumbo-ID: 6bb0d336-3507-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691401646; x=1691488046; bh=oyiuSl6ubAxDMpNDLfcH1Iyv9puo3tY1ocC
	wH/6+1ao=; b=awSgKozHJ8gpF9Ml+ivW1Gc6X9hJIUDhyG/pPTgN9nKuvgwNYdE
	EmHSolBZVYIa8NdYQuE1PEFsLrAdJVaywVYayNdgBt+GFRdpqM/xXi/cry/ts8LT
	dmEiuYz3z9zEm7oZ9PWnjppjqeNSHTBNMXiFEH/bI2mGtpKFFpCNJ4E2c5Ur/VU3
	ZcJTXLWTPmxb6OfTdS8P7LlDYnw5LficKbBX5Oi9+9DOf+x1VCI9RcriH/0t1lQx
	XYNA5zWSSZbfrPpystFaE9WRQKHu9OHttfQHArYtThRGDULtgjwbgY6MtUcsuoVf
	H0YYZ+T7XQ5SFQ7CXqhq4Gm88wC37q+ecBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691401646; x=1691488046; bh=oyiuSl6ubAxDM
	pNDLfcH1Iyv9puo3tY1ocCwH/6+1ao=; b=12Cw/hnCNLV0rCBbhAG9xsSnstNac
	KyChLLEDIQZu8q5ZL70Y0ebtHA4jeZd2ZvtBalDi4s0cqHmY4OE5fyFnCcvcWVfq
	6uWW+s3MA8mgP7Zmjp8BqSRcj7oPnS6tgUCdnGybaCw/fk/2EQjQ5SVfwAn+TATl
	mscQXWLFonCXE3IZIXtVraMnXhKp8pHaB3DXvA98VFbDRYTk7RGKQ2T7XzgdUCpT
	fKFr+Pbwmlh3wFkLb1LGDZ9UwXpbVci/ExjlmFP33scM9oS5kT28ODX+a3jF1zL2
	R8Hnbxa13nKFbNshSw9cx15YmcndL5BMa7GP+xS9sD/AedmniNxwLzHag==
X-ME-Sender: <xms:rb3QZPYRLCPUw13MPhWnNZVoQ11OB_66S0AMrdXJn0Vh85KMkVtHKQ>
    <xme:rb3QZObFpLzm9ulPm9ioJUctJf83fYDFGHw_RA8SoTKB2RfrY9hMN6D7lq1FktmDM
    OI2v-5Cacqjs2k>
X-ME-Received: <xmr:rb3QZB8_XTfXQWs5DTSbpqaG9r5HMQfe29rz0_0K7x_Fq8CVgCcNCCvq2AsymtY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:rr3QZFom4bBfjFteGv-EDtLvv_zgyu8LbbZrGo2GRGxDDQfhwDmoUQ>
    <xmx:rr3QZKr0jTupbCJHlpCMGbwpWBikdBgiRDw6E_PikZnhZnxR2TzM9w>
    <xmx:rr3QZLSE4F4u_O_ZPQXSCv5pZM55LzWFnxyYwPKT5h5ux-Z8KQvUCg>
    <xmx:rr3QZNVMCY01EqwXmAvoS4dYoolUraWsrx6S8M4MFPeGniCi-XieXw>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <16d5ea81-b12d-df4c-bbbb-0d9cdc2df8f0@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 11:47:12 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH v2] x86/hpet: Disable legacy replacement mode after
 IRQ test
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
 <8757d4b8-7765-e50f-73d2-34c7c34acaa5@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <8757d4b8-7765-e50f-73d2-34c7c34acaa5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FqNyTuaOB7wvgh5boHzi1Prp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FqNyTuaOB7wvgh5boHzi1Prp
Content-Type: multipart/mixed; boundary="------------bzYp4zvEK8XxHai1001cssK7";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <16d5ea81-b12d-df4c-bbbb-0d9cdc2df8f0@invisiblethingslab.com>
Subject: Re: [XEN PATCH v2] x86/hpet: Disable legacy replacement mode after
 IRQ test
References: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
 <8757d4b8-7765-e50f-73d2-34c7c34acaa5@suse.com>
In-Reply-To: <8757d4b8-7765-e50f-73d2-34c7c34acaa5@suse.com>

--------------bzYp4zvEK8XxHai1001cssK7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 31.07.2023 12:32, Simon Gaiser wrote:
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -1967,6 +1967,8 @@ static void __init check_timer(void)
>> =20
>>              if ( timer_irq_works() )
>>              {
>> +                printk(XENLOG_INFO "IRQ test with HPET Legacy Replace=
ment Mode worked. Disabling it again.\n");
>> +                hpet_disable_legacy_replacement_mode();
>>                  local_irq_restore(flags);
>>                  return;
>>              }
>=20
> I'm not sure of the value of the log message. Furthermore, considering
> plans to make XENLOG_INFO visible by default in release builds, when
> not purely a debugging message. I'm curious what other x86 maintainers
> think ...

As far as I can see nobody has so far voiced an opinion. How about you
tell me the level and message you would prefer and I send a new version
of the patch with it.

Simon

--------------bzYp4zvEK8XxHai1001cssK7--

--------------FqNyTuaOB7wvgh5boHzi1Prp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTQvaIACgkQkO9xfO/x
ly9Dxg//Tj8yrK7W8agNBrnli7aYzzXSQCczKzZwwSVAzl9Aszchm4zBwDuOil0H
LgnRkZSMr+4GtynGUANcentVO2CDymlChTmf72l2u39xlYuyP3SxUyJpo4BrD9Pt
ExEkGgz3ELJf0nnawInhomL6v6I/m8zDKVsNZllRL9UvOykPchB9VUNMzQlj2oi/
vdO2BOldbZ+OyUbeG3SWXgNNG9gQm1h0OT6oCpNwY/LxmUJ1fAiKEu+i6MDeF37R
mUsdlLX9pH+bXm16CVN8vJKXT06pwtBNh1gYizBl+9iHtN3b+FMPtpH4ecrxJiHB
yAnzfwPKbEbrFxD+76ENa0y6JtdqqaCJ5aC0m75nNzqBt/wec5pfJSpM+uDJod+P
qrNiFyhodp65DdttD2XHvoL6xLWKobquElyPtqZSzRtLkJKw/vHd3Al4/th5Ic0d
6o7/7ThRqxnPnHLX1muocg/vQVOBv1h+BI13HKUEapM5346W0h66o3RXz0MzJhHk
6/45d5t7WQ1wgtYrEGBsQa00Q8Wy4Ahqi91qk7U9NYKXBe9D+vGHVgsuOm9hvZEF
Ea7w/eiS1IoAO5YcBHO5oU42ilCF1nl6gIkvONpOoJVh594tQG6U06PGp+bgdvWs
H5KuAgYwcjGH0qja5RusdeN3ykFhBaseLc0KRUUj9IRV6TrlPqU=
=qSzw
-----END PGP SIGNATURE-----

--------------FqNyTuaOB7wvgh5boHzi1Prp--

