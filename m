Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jys1NIm5UGo14AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:21:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22544738FA0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:21:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=NezGSZK+;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358961.1612781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7Pe-0002a3-VG; Fri, 10 Jul 2026 09:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358961.1612781; Fri, 10 Jul 2026 09:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7Pe-0002XK-RN; Fri, 10 Jul 2026 09:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1358961;
 Fri, 10 Jul 2026 09:20:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4b54505c000edb5@swg.vates.tech>)
 id 1wi7Pd-0002XE-2v
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:20:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi7Pc-00EczG-8u
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:20:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4b54505c000edb5@swg.vates.tech>)
 id 6a50b96a-bab6-0a2a0a5309dd-0a2a45049d38-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:20:48 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4b54505c000edb5@swg.vates.tech>)
 id 6a50b96f-b1e5-0a2a45040019-b9ff1c12b2e9-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:20:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4b54505c000edb5.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Jul 2026 09:20:44 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id C899B8136F;
 Fri, 10 Jul 2026 11:20:43 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=oK01o/ZfPxLD4ougn4TyTn2bkrD5fetXzJisixGigWE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NezGSZK+MR0Cfsk2TIO1Y+Wt8aboddU4cnKyNENlURPnEfsURCzPt9ljG4s64kUptjhhmDFHM
 Ov9bI2deA2u12DVy4VqXVVDbCWXimVB013Zj0WwupScJDdVwH33XFlqpBKpl9piFzKmTwLY/HMm
 E66+skyZGFQ+pKofL9e9z0V00MnhYNirXyYfRQu6TOHFNix9QlpyMn0m2iqfPXIb5CCuGOQoP66
 7sA3uwHChIHHzoNMIZrKpIFxN9yA165zbAVNZ9+f3Miai1lE5jsKb0XYmkLzpLhnjamEenQubXD
 FBi2xE+4Ipt0v5WlJ972AFxqUJ803JKR3tf13Di7QS8g==
X-Zone-Loop: c4af6aebc701872bce2bd1cb32e92d935a58bb1906b6
x-campaign-type: default
x-transaction-id: f5bc3056-3c7a-445f-a59a-ec13bbac3f96
x-swg-uid: 01-e5d3868c-2261-4c62-977b-d06633475569
X-Mailer: Sweego
Message-ID:
 <1783675244.8631fc262581453bbf619ec5b2062170.19f4b54505c000edb5@vates.tech>
x-swg-bid: 1783675244.8631fc262581453bbf619ec5b2062170.19f4b54505c000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 10 Jul 2026 11:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/xentrace: decode RTDS priority in repl_budget
 records
To: Ryoji Okamoto <okamoto@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Ryo Takakura <takakura@valinux.co.jp>,
 Hirokazu Takahashi <taka@valinux.co.jp>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260710064352.343914-1-okamoto@valinux.co.jp>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260710064352.343914-1-okamoto@valinux.co.jp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PyfPccZKFAnULlQd4uZMoOC0"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783675243963
X-purgate-ID: tlsNG-ebf023/1783675248-7585EFE7-53600BEB/0/0
X-purgate-type: clean
X-purgate-size: 7559
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:okamoto@valinux.co.jp,m:xen-devel@lists.xenproject.org,m:takakura@valinux.co.jp,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_MUA_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22544738FA0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PyfPccZKFAnULlQd4uZMoOC0
Content-Type: multipart/mixed; boundary="------------b3VwCc30KZ0nR0ywd00I78v9";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Ryoji Okamoto <okamoto@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Ryo Takakura <takakura@valinux.co.jp>,
 Hirokazu Takahashi <taka@valinux.co.jp>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <0137ddf3-ee05-4754-b925-398cca43ee83@vates.tech>
Subject: Re: [PATCH v2] tools/xentrace: decode RTDS priority in repl_budget
 records
References: <20260710064352.343914-1-okamoto@valinux.co.jp>
In-Reply-To: <20260710064352.343914-1-okamoto@valinux.co.jp>

--------------b3VwCc30KZ0nR0ywd00I78v9
Content-Type: multipart/mixed; boundary="------------wmjbsc2kBEpe4ADqegPlI9sD"

--------------wmjbsc2kBEpe4ADqegPlI9sD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTAvMDcvMjAyNiDDoCAwODo0NywgUnlvamkgT2thbW90byBhIMOpY3JpdMKgOg0KPiBU
aGUgUlREUyByZXBsX2J1ZGdldCB0cmFjZSByZWNvcmQgbm93IGNvbnRhaW5zIHRoZSB2Q1BV
IHByaW9yaXR5DQo+IGxldmVsLiBVcGRhdGUgeGVuYWx5emUgdG8gYWNjb3VudCBmb3IgdGhl
IGFkZGl0aW9uYWwgZmllbGQgYW5kIHByaW50DQo+IGl0IHdoZW4gZHVtcGluZyB0aGUgdHJh
Y2UgZXZlbnQuDQo+IA0KPiBXaXRob3V0IHRoaXMgY2hhbmdlLCB4ZW5hbHl6ZSBpbnRlcnBy
ZXRzIHRoZSByZWNvcmQgdXNpbmcgdGhlIG9sZA0KPiBsYXlvdXQsIGNhdXNpbmcgdGhlIGRl
YWRsaW5lIGFuZCBidWRnZXQgZmllbGRzIHRvIGJlIGRlY29kZWQgZnJvbSB0aGUNCj4gd3Jv
bmcgb2Zmc2V0cy4NCj4gDQo+IEZpeGVzOiA0NjNiOTU4MzE3NzggKCJ4ZW46cnRkczogdG93
YXJkcyB3b3JrIGNvbnNlcnZpbmcgUlREUyIpDQo+IFNpZ25lZC1vZmYtYnk6IFJ5b2ppIE9r
YW1vdG8gPG9rYW1vdG9AdmFsaW51eC5jby5qcD4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6
DQo+IC0gQWRkICJGaXhlcyIgdG8gcG9pbnQgb3V0IHRoZSBjb21taXQgd2hpY2ggaW50cm9k
dWVkIHRoZSBwcmlvcml0eSBpbg0KPiAgICB0cmFjZSBpbiBjb21taXQgbWVzc2FnZQ0KPiAt
IE5vIGNvZGUgY2hhbmdlcy4NCj4gDQo+IEFuZCB0aGFua3MgdG8gSmFuIGZvciBraW5kbHkg
cG9pbnRpbmcgb3V0IHRoZSBmb3JtYXR0aW5nIGlzc3VlIGluIG15IHZlcnkgZmlyc3QgcGF0
Y2ggc3VibWlzc2lvbi4NCj4gDQo+ICAgdG9vbHMveGVudHJhY2UveGVuYWx5emUuYyB8IDUg
KysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnRyYWNlL3hlbmFseXplLmMgYi90
b29scy94ZW50cmFjZS94ZW5hbHl6ZS5jDQo+IGluZGV4IDQyZmVlYjI4MmUuLjQzOTA2NmUz
NTIgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnRyYWNlL3hlbmFseXplLmMNCj4gKysrIGIv
dG9vbHMveGVudHJhY2UveGVuYWx5emUuYw0KPiBAQCAtODAzOSwxMiArODAzOSwxMyBAQCB2
b2lkIHNjaGVkX3Byb2Nlc3Moc3RydWN0IHBjcHVfaW5mbyAqcCkNCj4gICAgICAgICAgICAg
ICBpZihvcHQuZHVtcF9hbGwpIHsNCj4gICAgICAgICAgICAgICAgICAgc3RydWN0IHsNCj4g
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB2Y3B1aWQ6MTYsIGRvbWlkOjE2
Ow0KPiArICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBwcmlvcml0eV9sZXZlbDsNCj4g
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGN1cl9kbCwgY3VyX2JnOw0KPiAgICAg
ICAgICAgICAgICAgICB9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpICpyID0gKHR5cGVvZihy
KSlyaS0+ZDsNCj4gICANCj4gICAgICAgICAgICAgICAgICAgcHJpbnRmKCIgJXMgcnRkczpy
ZXBsX2J1ZGdldCBkJXV2JXUsIGRlYWRsaW5lID0gJSJQUkl1NjQiLCAiDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICJidWRnZXQgPSAlIlBSSXU2NCJcbiIsIHJpLT5kdW1wX2hlYWRl
ciwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgci0+ZG9taWQsIHItPnZjcHVpZCwgci0+
Y3VyX2RsLCByLT5jdXJfYmcpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAiYnVkZ2V0
ID0gJSJQUkl1NjQiLCBwcmlvcml0eSA9ICV1XG4iLCByaS0+ZHVtcF9oZWFkZXIsDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHItPmRvbWlkLCByLT52Y3B1aWQsIHItPmN1cl9kbCwg
ci0+Y3VyX2JnLCByLT5wcmlvcml0eV9sZXZlbCk7DQo+ICAgICAgICAgICAgICAgfQ0KPiAg
ICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgICAgY2FzZSBUUkNfU0NIRURfQ0xBU1Nf
RVZUKFJURFMsIDUpOiAvKiBTQ0hFRF9UQVNLTEVUICAgICovDQoNClJldmlld2VkLWJ5OiBU
ZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCg0KVGVkZHkNCg==
--------------wmjbsc2kBEpe4ADqegPlI9sD
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------wmjbsc2kBEpe4ADqegPlI9sD--

--------------b3VwCc30KZ0nR0ywd00I78v9--

--------------PyfPccZKFAnULlQd4uZMoOC0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpQuWsFAwAAAAAACgkQZg+p0QLLz9CO
fQwAqILrcKjAXbEI0LMoaxGwjHy6rk+olWRolSYqFhVWFCRwaZlq4LZjT5PGdJsbg1/mL6V5VfOl
9YcjU31+k3ns646eiqHEcUEbO1IUz8iAFCIXcWIv22QC3uIOo9uznrCnuHfrTOI1pLzxxZll53tp
n7dUVtIewdkjJ5k8pgGsQbCy4B1QbEcWAFUEQA6qR8BWQ9kKuVXr222IYZR+cCu8rJNvvW+aIyOA
xjg5J4FdaBxyZtmyVkUHogDUh7EopWUIpmLbaV7S2CpM3PI9pVMaj9hFxeRNOa++elxVVAxFvqXR
Doxc0L1rHodD7CbfHOb3BsC/RSMPXSQXWHmDRT9pWRZ7+JCu5U/T73nquF9dARDkCpt0mN3mLpKu
6Vlg2tUdMnqCMkLk/G5vPFtC9N5bL/zYg89GNOM0Zm90fmq6g2OOQyo2myfUqCMHefZPSoiPKicK
0mE42JXAJRZxYiWdvueESAQbIwPnMx1OxIw1Se6/A2HetZP8SM1TjZGgkATU
=2lO+
-----END PGP SIGNATURE-----

--------------PyfPccZKFAnULlQd4uZMoOC0--

