Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DmlOBYwfTmqiDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:59:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C891723F4D
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:59:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=iR0d3zf7;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356801.1611347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whP3z-0004BM-2a; Wed, 08 Jul 2026 09:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356801.1611347; Wed, 08 Jul 2026 09:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whP3y-00049K-Vj; Wed, 08 Jul 2026 09:59:30 +0000
Received: by outflank-mailman (input) for mailman id 1356801;
 Wed, 08 Jul 2026 09:59:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f412b045b00080a8@swg.vates.tech>)
 id 1whP3x-00047y-Go
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:59:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whP3w-00AmJq-Lh
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:59:28 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f412b045b00080a8@swg.vates.tech>)
 id 6a4e1f80-e002-0a2a0a5209dd-0a2a4506ebf2-0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:59:28 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f412b045b00080a8@swg.vates.tech>)
 id 6a4e1f80-08de-0a2a45060019-b9ff1c23a8a5-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:59:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f412b045b00080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 09:59:26 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 80F1781087;
 Wed,  8 Jul 2026 11:59:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=zCxxnfjd6lp0hIlXLY2kMjGD1/kFYSuIEbrtKUkXNE8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iR0d3zf7TdhYlyx+bYr7pDpn4USf0zOg60XTgEFHY87ntCneLe2I9Bz+Jfy3j+Lw3SNBt2F1n
 Oq5ppi6Vfl7c8fivN0Kw8UkevZnLkD+fiWgDHYWT/+1utgstyIFFOMj9tIU9GRFGDqEM98J4QrD
 YWa0ecPB3mpEnBAejImrNRGi+czhOqOXhhatAi+pjOq9k3C+ecgpNlTBB1cs/bocoJBc/54GK7o
 ACg1TkI6ZZh+M+7wOBDquxXfl5a9NLLKNay3zkoUZZh+/wNn9AiaF31ljw8VDQDe/1K3VX4SHUe
 dzvLqku4pD0qVakCs2TxVMtf/ryytuxUpUY9zHnLGQcg==
X-Zone-Loop: 6a2e98f6a808e9913f61228d8902ece48201e8ea80ab
x-campaign-type: default
x-transaction-id: 85fc414e-1a64-41d6-b577-5582d1c1ea66
x-swg-uid: 01-045878af-f3eb-4b91-85e1-8f319e09aabb
X-Mailer: Sweego
Message-ID:
 <1783504766.8631fc262581453bbf619ec5b2062170.19f412b045b00080a8@vates.tech>
x-swg-bid: 1783504766.8631fc262581453bbf619ec5b2062170.19f412b045b00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 11:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
 <4d38fc9c-0d80-4632-98e8-7fb4682bc0b0@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <4d38fc9c-0d80-4632-98e8-7fb4682bc0b0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OmCq0iq1fK3yry9hFjH7o2As"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783504765626
X-purgate-ID: tlsNG-16d1c6/1783504768-C692368D-21CC5253/0/0
X-purgate-type: clean
X-purgate-size: 6991
X-Rspamd-Action: no action
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
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:from_mime,vates.tech:dkim,vates.tech:mid];
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
X-Rspamd-Queue-Id: 5C891723F4D

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OmCq0iq1fK3yry9hFjH7o2As
Content-Type: multipart/mixed; boundary="------------grNgvvd2qOkxF8rh04J82rwr";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <f2f6516a-7323-440c-9bd6-771fafc1e0bc@vates.tech>
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
 <4d38fc9c-0d80-4632-98e8-7fb4682bc0b0@suse.com>
In-Reply-To: <4d38fc9c-0d80-4632-98e8-7fb4682bc0b0@suse.com>

--------------grNgvvd2qOkxF8rh04J82rwr
Content-Type: multipart/mixed; boundary="------------3xLkroRGDN0jbu0h02VpteNv"

--------------3xLkroRGDN0jbu0h02VpteNv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDcvMjAyNiDDoCAxMTozNywgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MDguMDcuMjAyNiAxMToyOSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBMZSAwNy8wNy8yMDI2
IMOgIDIxOjQ5LCBBbmRyZXcgQ29vcGVyIGEgw6ljcml0wqA6DQo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3g4Nl9lbXVsYXRlL2RlY29kZS5jDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlL2RlY29kZS5jDQo+Pj4gQEAgLTc4MCwxMiArNzgwLDEyIEBAIGRlY29kZV90
d29ieXRlKHN0cnVjdCB4ODZfZW11bGF0ZV9zdGF0ZSAqcywNCj4+PiAgICAgICAgICAgIGJy
ZWFrOw0KPj4+ICAgIA0KPj4+ICAgICAgICBjYXNlIDB4MjA6IGNhc2UgMHgyMjogLyogbW92
IHRvL2Zyb20gY3IgKi8NCj4+PiAtICAgICAgICBpZiAoIHMtPmxvY2tfcHJlZml4ICYmIHZj
cHVfaGFzX2NyOF9sZWdhY3koKSApDQo+Pj4gKyAgICAgICAgaWYgKCBzLT5sb2NrX3ByZWZp
eCAmJiB2Y3B1X2hhc19jcjhfbGVnYWN5KCkgJiYgcy0+bW9kcm1fcmVnID09IDAgKQ0KPj4+
ICAgICAgICAgICAgew0KPj4+IC0gICAgICAgICAgICBzLT5tb2RybV9yZWcgKz0gODsNCj4+
PiArICAgICAgICAgICAgcy0+bW9kcm1fcmVnID0gODsNCj4+PiAgICAgICAgICAgICAgICBz
LT5sb2NrX3ByZWZpeCA9IGZhbHNlOw0KPj4+ICAgICAgICAgICAgfQ0KPj4+IC0gICAgICAg
IC8qIGZhbGwgdGhyb3VnaCAqLw0KPj4+ICsgICAgICAgIGZhbGx0aHJvdWdoOw0KPj4+ICAg
ICAgICBjYXNlIDB4MjE6IGNhc2UgMHgyMzogLyogbW92IHRvL2Zyb20gZHIgKi8NCj4+PiAg
ICAgICAgICAgIEFTU0VSVChzLT5lYS50eXBlID09IE9QX1JFRyk7IC8qIEVhcmx5IG9wZXJh
bmQgYWRqdXN0bWVudCBlbnN1cmVzIHRoaXMuICovDQo+Pj4gICAgICAgICAgICBnZW5lcmF0
ZV9leGNlcHRpb25faWYocy0+bG9ja19wcmVmaXgsIFg4Nl9FWENfVUQpOw0KPj4NCj4+IEkn
bSBmaW5lIHdpdGggaXQ7IHRob3VnaCB3ZSBwcm9iYWJseSB3YW50IHRvIG1ha2Ugc3VyZSB3
ZSBhbHdheXMNCj4+IGFkdmVydGlzZSB0aGUgQWx0TW92Q3I4IGZlYXR1cmUgYml0IGFzIEFQ
TSBzdWdnZXN0IHVzZXJzIHRvIGFsd2F5cyBjaGVjaw0KPj4gZm9yIHRoaXMgYmVmb3JlIHJl
bHlpbmcgb24gdGhpcyBiZWhhdmlvci4NCj4gDQo+IFdoeSB3b3VsZCB3ZSBzZXQgdGhlIGZs
YWcgd2hlbiBoYXJkd2FyZSBkb2Vzbid0IGhhdmUgaXQ/IE5vdGUgdGhlDQo+IHZjcHVfaGFz
X2NyOF9sZWdhY3koKSBjaGVjayB0aGVyZSAtIHdlIG9ubHkgZW5nYWdlIHRoaXMgYmVoYXZp
b3IgaWYNCj4gdGhlIGd1ZXN0IHNlZXMgdGhlIGZlYXR1cmUgYXMgYXZhaWxhYmxlLg0KPiAN
Cg0KSG1tLCBvaywgdGhvdWdoIHRoaXMgYml0IGlzIG5hbWVkIGFzICJBbHRNb3ZDcjgiIGlu
IEp1bHkgMjAyNSBBUE07IGJ1dCANCndlIG5hbWUgaXQgImNyOF9sZWdhY3kiLiBIYXMgdGhl
IG5hbWUgb2YgdGhlIGZlYXR1cmUgYml0IGNoYW5nZWQgaW4gQVBNIA0Kb3ZlciB0aW1lID8N
Cg0KPiBKYW4NCg0KVGVkZHkNCg==
--------------3xLkroRGDN0jbu0h02VpteNv
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------3xLkroRGDN0jbu0h02VpteNv--

--------------grNgvvd2qOkxF8rh04J82rwr--

--------------OmCq0iq1fK3yry9hFjH7o2As
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpOH30FAwAAAAAACgkQZg+p0QLLz9Dl
4Qv/bKMkMap14ezoaDiNSOQiyRh31dMn0/VLclG6XEDtC7mgZyPoUOrhZb4bTLqQeqPNqqtD/y1S
ke416mAFNyWs++yig75MH1mbE79Kcasl6XPkq1SpnVPvGCdFuDKxXlyxExVvHnw4X6QM5QSp7w5t
Juavyjz+VJlWlzywWHXhUEw2PWw1nQ8UVue9YDpqoDwb6NQWysfNYKtRzGrPAQZxq/hbJkbzUnk7
skN3MFOv94X0DOEbC7ca72DnK9RRB1nQtJD7wkQUP5b39dBoGsaNWqcZnpcf5P/EQ2t3ncB6Okr/
Lmq3D8d8dLZ1Yq74VLAlqm3TM9Z7LsvpvbuCkcMaDYRxf++nlizTAitYsz00ZplAGwEkEEzSYcYK
FJ4Mjz5SjC7ZuIzcO0Zl0JS1qNRJv35pb9pJE79Tq5HIZAW6DJYwVHgHtfLcTKo15OCaUxSaQO8/
uL9LNRJq9a8erahsQS0uSF1f08gWGFr5xSdkIXL0T8bi9gLeXD7dKgtYiHu2
=mLTs
-----END PGP SIGNATURE-----

--------------OmCq0iq1fK3yry9hFjH7o2As--

