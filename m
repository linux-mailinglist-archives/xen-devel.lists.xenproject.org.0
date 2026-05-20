Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHqrHPziDWpN4gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:36:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B2D5921FD
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314180.1584173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjtq-00085q-Rt; Wed, 20 May 2026 16:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314180.1584173; Wed, 20 May 2026 16:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjtq-00082V-P9; Wed, 20 May 2026 16:36:02 +0000
Received: by outflank-mailman (input) for mailman id 1314180;
 Wed, 20 May 2026 16:36:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e463e7052000f373@swg.vates.tech>)
 id 1wPjtp-00082N-5W
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:36:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPjto-007ABp-Hn
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:36:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e463e7052000f373@swg.vates.tech>)
 id 6a0de2cb-e002-0a2a0a5209dd-0a2a4505a91c-46
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:36:00 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e463e7052000f373@swg.vates.tech>)
 id 6a0de2f0-aaa8-0a2a45050019-b9ff1c22a5fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:36:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e463e7052000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 16:35:57 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 119EB863EA;
 Wed, 20 May 2026 18:35:57 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=7OsXOt1ZtVwGuaBqf2QY0vMR1N9YWSAj+bSzWlfXDuk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GnHCwiv8/fTFscFJI9ko75iTeL+4bt+7BisBST/QUq0wohbEXZ8zuRh5KHLSRs2Wcj6eMsDp1
 mmnpbamKAt6sPIuNmnLvhsvcf9appeaaBec6eG8Yk6bHw2kg7M8MMFq4gBMRoE4vHEtM4tWdCfp
 N52maNPceUd05zqhhxC/XN4LpTomdG60qwLsYgI4JPFKEdffi0KNI70i/9FyklCbKuXWeU12vZE
 Nv72apnGRRHpe6eSQFKzne3GsIgNLTtdHgUM2CwVRSzqnBVjn2NUMjiTPSG863AHXp2CiGGAsTH
 TO/A+42uag2ij6sAbtRFpW+8fqV2ulNtnC6c1uT+QoHQ==
X-Zone-Loop: e24540465fab2ad8f4c1250338a67266dd678727b73b
x-campaign-type: default
x-transaction-id: 8133f623-a63a-4128-b8b9-a908ead6de0f
x-swg-uid: 01-2190edb2-1feb-440e-97bb-7bd07a545ad9
X-Mailer: Sweego
Message-ID:
 <1779294957.8631fc262581453bbf619ec5b2062170.19e463e7052000f373@vates.tech>
x-swg-bid: 1779294957.8631fc262581453bbf619ec5b2062170.19e463e7052000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 20 May 2026 18:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <93cbe99f-a75b-4837-be6b-d6621d9f4d6d@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <93cbe99f-a75b-4837-be6b-d6621d9f4d6d@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4w7Goen218LlNNbUXxqrJvbN"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779294957153
X-purgate-ID: tlsNG-c201ff/1779294960-DB36C443-A5A53228/0/0
X-purgate-type: clean
X-purgate-size: 6634
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D7B2D5921FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4w7Goen218LlNNbUXxqrJvbN
Content-Type: multipart/mixed; boundary="------------cMeW7KPLeUdDfCaVwf2deibA";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <7b911ff5-d5f6-44a7-a1c9-a04fd991f4a7@vates.tech>
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <93cbe99f-a75b-4837-be6b-d6621d9f4d6d@citrix.com>
In-Reply-To: <93cbe99f-a75b-4837-be6b-d6621d9f4d6d@citrix.com>

--------------cMeW7KPLeUdDfCaVwf2deibA
Content-Type: multipart/mixed; boundary="------------QA4pDIpOrMN7w4WN8J0o9Nj8"

--------------QA4pDIpOrMN7w4WN8J0o9Nj8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDUvMjAyNiDDoCAxODoyNywgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBP
biAyMC8wNS8yMDI2IDQ6NTEgcG0sIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4gX197cHV0LGdl
dH1fZ3Vlc3QgcmV0dXJucyAtRUZBVUxUIG9uIGFjY2VzcyBmYXVsdHMgd2hpY2ggY2F1c2Vz
DQo+PiB0aGUgaW5qZWN0ZWQgY3IyIHRvIGJlIG9mZiBieSAxNCBieXRlcyAoYXMgRUZBVUxU
IGlzIDE0KSB3aGljaCBpcw0KPj4gaW5jb3JyZWN0Lg0KPj4NCj4+IEZpeCB0aGUgY29tcHV0
YXRpb24gYnkgcmVseWluZyBvbiBjb3B5X3tmcm9tLHRvfV9ndWVzdF9wdiB3aGljaA0KPj4g
cmVwb3J0cyB0aGUgbnVtYmVyIG9mIHJlbWFpbmluZyBieXRlcyBpbnN0ZWFkIG9mIGEgbmVn
YXRpdmUgZXJybm8sDQo+PiBzdWNoIHRoYXQgd2UgY2FuIGNvbXB1dGUgdGhlIG9mZnNldCBw
cm9wZXJseS4NCj4+DQo+PiBGaXhlczogNzBhZDU3MGIyNzk5ICgieDg2LzY0OiBwYXJhdmly
dCAzMi1vbi02NCBjYWxsIGdhdGUgc3VwcG9ydCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBUZWRk
eSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCj4gDQo+IEdpdmVuIGl0IHdhcyBf
XypfZ3Vlc3QoKSBiZWZvcmUsIEkgdGhpbmsgd2UgY2FuIHVzZSB0aGUNCj4gX19jb3B5Xypf
Z3Vlc3RfcHYoKSB2YXJpYW50cy4NCj4gDQo+IEkgY2FuIGZpeCBvbiBjb21taXQgaWYgeW91
J3JlIGhhcHB5P8KgIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPiANCg0KTG9va3MgZ29vZCB0byBtZS4NCg0KPiBKYW4sIHRo
aXMgd2FudHMgY29tbWl0dGluZyBhaGVhZCBvZiB5b3VyIE1JU1JBIGNoYW5nZSwgYXMgaXQg
bmVlZHMNCj4gYmFja3BvcnRpbmcuDQo+IA0KPiBTdHJpY3RseSBzcGVha2luZywgZ2F0ZSBl
bXVsYXRpb24gaXMgYWxsIFBWIHJpZ2h0IG5vdy7CoCBJdCBkb2VzIHdhbnQNCj4gbW92aW5n
IGJlaGluZCBDT05GSUdfUFYzMi4NCj4gDQoNClRoaXMgZmlsZSBpcyBhbHJlYWR5IGdhdGVk
IGJlaGluZCBDT05GSUdfUFYzMiwgc28gSSB0aGluayBpdCdzIGFscmVhZHkgDQp0aGUgY2Fz
ZS4NCg0KPiBBbHNvLCB3aXRoIHRoZXNlIHR3byBjYWxsZXJzIGRyb3BwZWQsIGFsbCByZW1h
aW5pbmcgdXNlcnMgb2YNCj4gX197Z2V0LHB1dH1fZ3Vlc3QoKSBvbmx5IGNhcmUgYWJvdXQg
c3VjY2Vzcy9mYWlsdXJlIHJhdGhlciB0aGFuIHRoZQ0KPiBwcmVjaXNlIHZhbHVlLCBzbyB0
aGVyZSBpcyBwcm9iYWJseSBzb21lIGNsZWFudXAgd2hpY2ggY2FuIGJlIGRvbmUuDQo+IA0K
PiB+QW5kcmV3DQoNClRlZGR5DQo=
--------------QA4pDIpOrMN7w4WN8J0o9Nj8
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------QA4pDIpOrMN7w4WN8J0o9Nj8--

--------------cMeW7KPLeUdDfCaVwf2deibA--

--------------4w7Goen218LlNNbUXxqrJvbN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoN4uwFAwAAAAAACgkQZg+p0QLLz9D8
WAv/SUrqJo8Ovj0YUEmNc/JN4qacpwCEL0RCWRcWf8u8S/OSF4UY+U8WqKX8VwAyNavnypLN1bUq
Rtx/53nm1XUEahMKcvnkshrfJebMWLhZx1ubPXu5FP71x3YmFj6zCLoiaRVbZSdeC+AmRsPoJxIv
ffgzCq77CSc8Eh3147HyiSIE1miza5xZgl69qfIymu9pGPpDvUtc0yzfl14EiLkpzlBynvlEnwCQ
lWnuI3rYzBt6Dm7Ax7Jtc6Fbwu34V3EbDljy9Y2bxzqyvaOqApsAW03WoctyjVAl5esXk9kN08ee
IYqHdxQ6bk/1Z9lgv/BEwIficp/r5/bkI2zW2MNfMyBVS4B2LIWSTqqLE1BULhc/rayh4ClkRaQP
R2uEKByVI86NpdCUstvfQuLvRexp51x91DIS77T0irKw/bDbOcKGzPDAsqTVuj0m7Xst1nslxh7G
j6vNudNR0HixcpgKcvwWNU47bqxOqx5DsTGVSRx9r0rDV8zmxa2l01apaNf1
=0IeH
-----END PGP SIGNATURE-----

--------------4w7Goen218LlNNbUXxqrJvbN--

