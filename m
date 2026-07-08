Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eQ98NZkYTmqDDAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:30:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40538723BD7
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:30:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=K16nvloC;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356737.1611284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOb5-00055x-E2; Wed, 08 Jul 2026 09:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356737.1611284; Wed, 08 Jul 2026 09:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOb5-00053r-B5; Wed, 08 Jul 2026 09:29:39 +0000
Received: by outflank-mailman (input) for mailman id 1356737;
 Wed, 08 Jul 2026 09:29:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@swg.vates.tech>)
 id 1whOb3-00053k-Es
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:29:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOb2-00AfMG-1m
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:29:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@swg.vates.tech>)
 id 6a4e1877-bab6-0a2a0a5309dd-0a2a4507b322-22
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:29:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@swg.vates.tech>)
 id 6a4e187f-9c8e-0a2a45070019-b9ff1c238579-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:29:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f410fad6d00080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 09:29:34 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 776228099B;
 Wed,  8 Jul 2026 11:29:33 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=dLiuaUSrUWrbcUr5JABYMgYkslhaRRjo8Xws1BmC0XI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=K16nvloC7a8DilJtLiHDtOng5iOq3FDI7ByJ51PuwqtoIU9YDleDtfhin3SXcGjVz9r2XT+sy
 QNcsl5b6yQ1vmrPPz/4lY3Gk33RSV1zcRq5umdPgLFjJYH552sMYrC6tPRz0zLLYXbGF6j+/hrq
 SvM3f3dvbJbOmtWd7l2Bav+Gc0KaJlKJ5MFVoouSW4wN+NmmZsDFslSkdYtJTzubr2qQxFNfPiw
 zZnN9ZqHqAaJKYM6fPmltf0Fpebovn3a/ORspUrjhfIdqAdYBjrTiDcWYtr1vg48CSX//IkQtY5
 CRTQC0BP1VwnITFGWkQTNtHnwO4jBFktbvUtXxcftzvA==
X-Zone-Loop: a6936bec9d7fa8370257da55b3bc909c1aad1aadd109
x-campaign-type: default
x-transaction-id: 0e9c4ffc-ae47-4751-8796-f059beee8a5d
x-swg-uid: 01-46ddb29f-4ac8-450b-ad1f-62f7862adac3
X-Mailer: Sweego
Message-ID:
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
x-swg-bid: 1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 11:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Q0iFHC5osYG5D7ahxiJRCAy7"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783502973596
X-purgate-ID: tlsNG-ef75cf/1783502975-FF73125E-BA4DB87B/0/0
X-purgate-type: clean
X-purgate-size: 7562
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:from_mime,vates.tech:email,vates.tech:mid,vates.tech:dkim,citrix.com:email,suse.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40538723BD7

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Q0iFHC5osYG5D7ahxiJRCAy7
Content-Type: multipart/mixed; boundary="------------zBfH6Q8drECReT0YBQL8B8bu";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <6775b332-5b72-48d4-b07d-3da0e6419647@vates.tech>
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260707194921.1425926-1-andrew.cooper3@citrix.com>

--------------zBfH6Q8drECReT0YBQL8B8bu
Content-Type: multipart/mixed; boundary="------------r4u0Jb9eE7fd0FzJlTKwpnZX"

--------------r4u0Jb9eE7fd0FzJlTKwpnZX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDcvMDcvMjAyNiDDoCAyMTo0OSwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBU
aGUgQVBNIGRlc2NyaXB0aW9uIG9mIHRoZSBBbHRNb3ZDUjggZmVhdHVyZSBiaXQgaXM6DQo+
IA0KPiAgICAiTE9DSyBNT1YgQ1IwIG1lYW5zIE1PViBDUjgiDQo+IA0KPiBBZGp1c3QgdGhl
IGRlY29kZSBsb2dpYyB0byBiZWhhdmUgbGlrZSB0aGlzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+
IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ0M6IFRlZGR5IEFzdGllIDx0ZWRk
eS5hc3RpZUB2YXRlcy50ZWNoPg0KPiANCj4gdjM6DQo+ICAgKiBDaGFuZ2UgeWV0IGFnYWlu
LiAgQSBjb250YWN0IHdpdGggaW5mb3JtYXRpb24gb24gdGhlIG1hdHRlciBjb25maXJtZWQg
dGhhdA0KPiAgICAgaXQgaXMgYSBzcGVjaWFsIGNhc2UgZm9yIFJlZyA9IDAsIGFuZCBub3Qg
YSBnZW5lcmFsIG1vZGlmaWVyIHRvIGFsbCBSZWcNCj4gICAgIHZhbHVlcy4NCj4gLS0tDQo+
ICAgeGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL2RlY29kZS5jIHwgNiArKystLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS9kZWNvZGUuYyBiL3hlbi9h
cmNoL3g4Ni94ODZfZW11bGF0ZS9kZWNvZGUuYw0KPiBpbmRleCAyYzEzMzU2YzRkMTcuLjU3
ZjZiYWZmYjA2NiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL2Rl
Y29kZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS9kZWNvZGUuYw0KPiBA
QCAtNzgwLDEyICs3ODAsMTIgQEAgZGVjb2RlX3R3b2J5dGUoc3RydWN0IHg4Nl9lbXVsYXRl
X3N0YXRlICpzLA0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgDQo+ICAgICAgIGNhc2UgMHgy
MDogY2FzZSAweDIyOiAvKiBtb3YgdG8vZnJvbSBjciAqLw0KPiAtICAgICAgICBpZiAoIHMt
PmxvY2tfcHJlZml4ICYmIHZjcHVfaGFzX2NyOF9sZWdhY3koKSApDQo+ICsgICAgICAgIGlm
ICggcy0+bG9ja19wcmVmaXggJiYgdmNwdV9oYXNfY3I4X2xlZ2FjeSgpICYmIHMtPm1vZHJt
X3JlZyA9PSAwICkNCj4gICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgIHMtPm1vZHJtX3Jl
ZyArPSA4Ow0KPiArICAgICAgICAgICAgcy0+bW9kcm1fcmVnID0gODsNCj4gICAgICAgICAg
ICAgICBzLT5sb2NrX3ByZWZpeCA9IGZhbHNlOw0KPiAgICAgICAgICAgfQ0KPiAtICAgICAg
ICAvKiBmYWxsIHRocm91Z2ggKi8NCj4gKyAgICAgICAgZmFsbHRocm91Z2g7DQo+ICAgICAg
IGNhc2UgMHgyMTogY2FzZSAweDIzOiAvKiBtb3YgdG8vZnJvbSBkciAqLw0KPiAgICAgICAg
ICAgQVNTRVJUKHMtPmVhLnR5cGUgPT0gT1BfUkVHKTsgLyogRWFybHkgb3BlcmFuZCBhZGp1
c3RtZW50IGVuc3VyZXMgdGhpcy4gKi8NCj4gICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlv
bl9pZihzLT5sb2NrX3ByZWZpeCwgWDg2X0VYQ19VRCk7DQoNCkknbSBmaW5lIHdpdGggaXQ7
IHRob3VnaCB3ZSBwcm9iYWJseSB3YW50IHRvIG1ha2Ugc3VyZSB3ZSBhbHdheXMgDQphZHZl
cnRpc2UgdGhlIEFsdE1vdkNyOCBmZWF0dXJlIGJpdCBhcyBBUE0gc3VnZ2VzdCB1c2VycyB0
byBhbHdheXMgY2hlY2sgDQpmb3IgdGhpcyBiZWZvcmUgcmVseWluZyBvbiB0aGlzIGJlaGF2
aW9yLg0KDQpJbnRlcmVzdGluZ2x5LCBJIHNlZSB0aGlzIGZlYXR1cmUgYml0IHNldCBvbiBJ
bnRlbCBoYXJkd2FyZS4NClRob3VnaCwgaXQncyBhIHJlc2VydmVkIGJpdCBpbiBTRE0sIGFu
ZCBsb2NrIG1vdiBjcjAgaXMgZGVmaW5lZCBhcyBiZWluZyANCiNVRC4NCg0KV2hpY2ggQ1BV
IG1vZGVsIGludHJvZHVjZWQgdGhpcyBmZWF0dXJlIGJpdCA/IEFuZCBkb2VzIEludGVsIGJl
aGF2aW9yIA0KbWF0Y2hlcyBBTUQncyBzcGVjID8NCg0KVGVkZHkNCg==
--------------r4u0Jb9eE7fd0FzJlTKwpnZX
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------r4u0Jb9eE7fd0FzJlTKwpnZX--

--------------zBfH6Q8drECReT0YBQL8B8bu--

--------------Q0iFHC5osYG5D7ahxiJRCAy7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpOGH0FAwAAAAAACgkQZg+p0QLLz9DB
gwv/b6lD6vhOZZQlrX5It2ppEw7KXkTdaGiEMiNjQ6esd6YF7XGyhvY0xdbQtA3rua4BmAvLASFR
ESczxNqte5SHAKSLA2r+Lj5sOwggVz0rkUfLEpoGNF8ULGudBvvI/8O8R6kIpziDHQhpviyUmZ3Y
J7bJS1TaAyhH0LBeDY8e1VHmGA5q1M10XJzy36R+/rHFFDXyzZUsY4zm7P7MavZ0nWbMZqjr0JR0
AMjH1boFTOtsUXLXC6r4tXrlICZCK9oR82iAKhQ3NfmSXWXAG1cAVup+N8H4GstuZ4R5FVKlNyYs
gQWsx5+OELsiBwbvwMc1+qs7NiOf7THfsDm7UE7YWHt3VureiwZFPdH25abXlYT4eNwkuxaIs7IK
sTJdECU70eGqTOfCcKqmUBI8a1CUwnzgxCF8cO/3ogqSVlAWjIMprMGG4hvsxYXv/q4k8sJybBcT
IxK+u+oPxjRqs9oo3H6NhuM5wbJM7R2sJSxauoZP84zd26GGG+eE2bSLGlWF
=XubR
-----END PGP SIGNATURE-----

--------------Q0iFHC5osYG5D7ahxiJRCAy7--

