Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2buZAUSAV2raTQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 14:42:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F9B75E494
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 14:42:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=EQFTWHK4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1363049.1614892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjywM-0006em-Nf; Wed, 15 Jul 2026 12:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363049.1614892; Wed, 15 Jul 2026 12:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjywM-0006c5-L6; Wed, 15 Jul 2026 12:42:18 +0000
Received: by outflank-mailman (input) for mailman id 1363049;
 Wed, 15 Jul 2026 12:42:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@swg.vates.tech>)
 id 1wjywK-0006bz-SF
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 12:42:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjywK-00B1LK-8s
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 14:42:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@swg.vates.tech>)
 id 6a57801d-2eae-0a2a0a5409dd-0a2a4507deba-44
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:42:16 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@swg.vates.tech>)
 id 6a578027-b4ea-0a2a45070019-b9ff1c1285f9-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:42:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f65cc9781000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 12:42:14 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2284382179;
 Wed, 15 Jul 2026 14:42:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=SptMH0IFGHx0gCqMFoLHFaWsbcSDqkPOQIAa7+bak94=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=EQFTWHK4QwqOmopEfUV0an94cWiqgKN26djNbLOWuuR/gbcrXSMV3WKYk8IhBfFDItluSMrM3
 1TcXyDVt06kVdb0pjxK5qb5J8JuDa24QYPmQSQ8FDnqdEyCYMRAOxJVsHbqGCHCvbYYJseYWSjL
 DasVn+ktasyDQJQv/miPNybfYUFk59bUv7h560pFvJw0fnE0VPAsnHn7PEj+keUwLLc7XT0jVHi
 qXdAQyudmNNCDxfC27M+hNR9pUkOKDjIwsb29pZ7tXTjghTsFiAcCN+YvmeRe6zkdaplZuaJCj2
 Koj1nBAqKbYq8osvc5pP6T4ngzFlOE37UsfBTNRCzweg==
X-Zone-Loop: 8dad1f93431aec0c2e729e8aae368ab226dc18802601
x-campaign-type: default
x-transaction-id: 1e403304-916f-4959-b371-e8711676a9cf
x-swg-uid: 01-ad3803bb-03df-4d95-8b02-724a49ba276c
X-Mailer: Sweego
Message-ID:
 <1784119334.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@vates.tech>
x-swg-bid: 1784119334.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 15 Jul 2026 14:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 1/2] x86emul: drop wrapper C file
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
 <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w6W60M9FgH4Yf4pgbHY0MrB6"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784119334259
X-purgate-ID: tlsNG-ef75cf/1784119336-A4CCFAE4-BFCDC77A/0/0
X-purgate-type: clean
X-purgate-size: 13854
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,xen.org:email,gitlab.com:url,citrix.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	HAS_XOIP(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21F9B75E494
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w6W60M9FgH4Yf4pgbHY0MrB6
Content-Type: multipart/mixed; boundary="------------dDBTcUZmDaI0sYD5TwCAjkAg";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <86319190-b600-4007-86d1-5f659d9f265c@vates.tech>
Subject: Re: [PATCH v1.1 1/2] x86emul: drop wrapper C file
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
 <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>
In-Reply-To: <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>

--------------dDBTcUZmDaI0sYD5TwCAjkAg
Content-Type: multipart/mixed; boundary="------------Ed0Q4h7hI2y9yDdvTPy5XXSi"

--------------Ed0Q4h7hI2y9yDdvTPy5XXSi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTQvMDcvMjAyNiDDoCAxNjowMCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gTW92
ZSB0aGUgbGl0dGxlIGJpdCB0aGF0J3Mgc3RpbGwgbGVmdCBpbiB4ODYveDg2X2VtdWxhdGUu
YyBpbnRvIGEgX19YRU5fXw0KPiBjb25kaXRpb25hbCBpbiB4ODYveDg2X2VtdWxhdGUveDg2
X2VtdWxhdGUuYy4gTW92ZSB3aGF0IGFyZSByb3VnaGx5IHRoZQ0KPiB0ZXN0L2Z1enppbmcg
aGFybmVzcyBjb3VudGVycGFydHMgZnJvbSB0aGVyZSBpbnRvIHRoZSBjb3JyZXNwb25kaW5n
ICNlbHNlLg0KPiANCj4gSW50ZXJlc3RpbmdseSBtb3JlIHJlY2VudCBnY2MgdGFrZXMgaXNz
dWUgd2l0aCB0aHJlZSBzdGF0aWMgY29uc3QgYXJyYXlzDQo+IHdoaWNoIGFyZSB1bnVzZWQg
d2hlbiBIVk09biAobm90aWNlYWJsZSBpbiBwYXJ0aWN1bGUgaW4gdGhlIHNoaW0gYnVpbGQp
Lg0KPiBBcHBhcmVudGx5IHN1Y2ggYXJlIGRpYWdub3NlZCBvbmx5IHdoZW4gcHJlc2VudCBp
biB0aGUgdG9wLWxldmVsIGZpbGUsIGJ1dA0KPiBub3Qgd2hlbiBsaXZpbmcgaW4gYW4gI2lu
Y2x1ZGUtZCBvbmUuDQo+IA0KPiBSZXF1ZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiB2MS4xOiBBZGRyZXNzIEhWTT1uIGJ1aWxk
IGlzc3Vlcy4gU2VlDQo+ICAgICAgICBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3Qv
aGFyZHdhcmUveGVuLXN0YWdpbmcvLS9waXBlbGluZXMvMjY3NDk4NTk5Mi4NCj4gDQo+IC0t
LSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5jDQo+ICsrKyBiL3Rv
b2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5jDQo+IEBAIC0zLDI3ICszLDYg
QEANCj4gICAjaW5jbHVkZSA8ZXJybm8uaD4NCj4gICAjaW5jbHVkZSA8c3lzL21tYW4uaD4N
Cj4gICANCj4gLS8qIFNlZSBnY2MgYnVnIDEwMDY4MCwgYnV0IGhlcmUgZG9uJ3QgYm90aGVy
IG1ha2luZyB0aGlzIHZlcnNpb24gZGVwZW5kZW50LiAqLw0KPiAtI2RlZmluZSBnY2MxMV93
cmFwKHgpICh7ICAgICAgICAgICAgICAgICAgXA0KPiAtICAgIHVuc2lnbmVkIGxvbmcgeF87
ICAgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgIF9fYXNtX18gKCAiIiA6ICI9ZyIgKHhf
KSA6ICIwIiAoeCkgKTsgXA0KPiAtICAgICh0eXBlb2YoeCkpeF87ICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPiAtfSkNCj4gLQ0KPiAtI2RlZmluZSBjcHVfaGFzX2FtZF9lcnJhdHVt
KG5yKSAwDQo+IC0jZGVmaW5lIGNwdV9oYXNfbXB4IGZhbHNlDQo+IC0jZGVmaW5lIHJlYWRf
Ym5kY2ZndSgpIDANCj4gLSNkZWZpbmUgeHN0YXRlX3NldF9pbml0KHdoYXQpDQo+IC0NCj4g
LS8qIEZvciBnZW5lcmljIGFzc2VtYmx5IGNvZGU6IHVzZSBtYWNyb3MgdG8gZGVmaW5lIG9w
ZXJhdGlvbi9vcGVyYW5kIHNpemVzLiAqLw0KPiAtI2lmZGVmIF9faTM4Nl9fDQo+IC0jIGRl
ZmluZSBfX09TICAgICAgICAgICJsIiAgLyogT3BlcmF0aW9uIFN1ZmZpeCAqLw0KPiAtIyBk
ZWZpbmUgX19PUCAgICAgICAgICAiZSIgIC8qIE9wZXJhbmQgUHJlZml4ICovDQo+IC0jZWxz
ZQ0KPiAtIyBkZWZpbmUgX19PUyAgICAgICAgICAicSIgIC8qIE9wZXJhdGlvbiBTdWZmaXgg
Ki8NCj4gLSMgZGVmaW5lIF9fT1AgICAgICAgICAgInIiICAvKiBPcGVyYW5kIFByZWZpeCAq
Lw0KPiAtI2VuZGlmDQo+IC0NCj4gICB1aW50MzJfdCBteGNzcl9tYXNrID0gMHgwMDAwZmZi
ZjsNCj4gICBzdHJ1Y3QgY3B1X3BvbGljeSBjcHVfcG9saWN5Ow0KPiAgIA0KPiAtLS0gYS94
ZW4vYXJjaC94ODYvTWFrZWZpbGUNCj4gKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlDQo+
IEBAIC02OSw3ICs2OSw2IEBAIG9iai15ICs9IHRyYXBzLXNldHVwLm8NCj4gICBvYmoteSAr
PSB0cmFwcy5vDQo+ICAgb2JqLSQoQ09ORklHX0lOVEVMKSArPSB0c3gubw0KPiAgIG9iai0k
KENPTkZJR19WTV9FVkVOVCkgKz0gdm1fZXZlbnQubw0KPiAtb2JqLXkgKz0geDg2X2VtdWxh
dGUubw0KPiAgIG9iai15ICs9IHhzdGF0ZS5vDQo+ICAgDQo+ICAgaWZuZXEgKCQoQ09ORklH
X1BWX1NISU1fRVhDTFVTSVZFKSx5KQ0KPiBAQCAtODYsMTMgKzg1LDYgQEAgaG9zdHByb2dz
LXkgKz0gZWZpL21rcmVsb2MNCj4gICANCj4gICAkKG9iaikvZWZpL21rcmVsb2M6IEhPU1RD
RkxBR1MgKz0gLUkkKHNyY3RyZWUpL2luY2x1ZGUNCj4gICANCj4gLWlmbmVxICgkKENPTkZJ
R19IVk0pLHkpDQo+IC0kKG9iaikveDg2X2VtdWxhdGUubzogQ0ZMQUdTLXkgKz0gLVduby11
bnVzZWQtbGFiZWwNCj4gLWVuZGlmDQo+IC1pZmVxICgkKENPTkZJR19DT05ESVRJT05fQ09W
RVJBR0UpJChDT05GSUdfQ0NfSVNfR0NDKSx5eSkNCj4gLSQob2JqKS94ODZfZW11bGF0ZS5v
OiBDRkxBR1MteSArPSAtV25vLWVycm9yPWNvdmVyYWdlLXRvby1tYW55LWNvbmRpdGlvbnMN
Cj4gLWVuZGlmDQo+IC0NCj4gICBlZmkteSA6PSAkKHNoZWxsIGlmIFsgISAtciAkKG9ianRy
ZWUpL2luY2x1ZGUveGVuL2NvbXBpbGUuaCAtbyBcDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIC1PICQob2JqdHJlZSkvaW5jbHVkZS94ZW4vY29tcGlsZS5oIF07IHRoZW4gXA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlY2hvICckKFRBUkdFVCkuZWZpJzsgZmkpIFwN
Cj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMNCj4gKysrIC9kZXYvbnVsbA0K
PiBAQCAtMSwzNyArMCwwIEBADQo+IC0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+IC0g
KiB4ODZfZW11bGF0ZS5jDQo+IC0gKg0KPiAtICogV3JhcHBlciBmb3IgZ2VuZXJpYyB4ODYg
aW5zdHJ1Y3Rpb24gZGVjb2RlciBhbmQgZW11bGF0b3IuDQo+IC0gKg0KPiAtICogQ29weXJp
Z2h0IChjKSAyMDA4LCBDaXRyaXggU3lzdGVtcywgSW5jLg0KPiAtICoNCj4gLSAqIEF1dGhv
cnM6DQo+IC0gKiAgICBLZWlyIEZyYXNlciA8a2VpckB4ZW4ub3JnPg0KPiAtICovDQo+IC0N
Cj4gLSNpbmNsdWRlIDx4ZW4vZXZlbnQuaD4NCj4gLQ0KPiAtI2luY2x1ZGUgPGFzbS94ODZf
ZW11bGF0ZS5oPg0KPiAtI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4gLyogY3VycmVudF9j
cHVfaW5mbyAqLw0KPiAtI2luY2x1ZGUgPGFzbS94c3RhdGUuaD4NCj4gLSNpbmNsdWRlIDxh
c20vYW1kLmg+IC8qIGNwdV9oYXNfYW1kX2VycmF0dW0oKSAqLw0KPiAtDQo+IC0vKiBBdm9p
ZCBuYW1lc3BhY2UgcG9sbHV0aW9uLiAqLw0KPiAtI3VuZGVmIGNtcHhjaGcNCj4gLSN1bmRl
ZiBjcHVpZA0KPiAtI3VuZGVmIHdiaW52ZA0KPiAtDQo+IC0jZGVmaW5lIGNwdV9oYXNfYW1k
X2VycmF0dW0obnIpIFwNCj4gLSAgICAgICAgY3B1X2hhc19hbWRfZXJyYXR1bSgmY3VycmVu
dF9jcHVfZGF0YSwgQU1EX0VSUkFUVU1fIyNucikNCj4gLQ0KPiAtI2luY2x1ZGUgIng4Nl9l
bXVsYXRlL3g4Nl9lbXVsYXRlLmMiDQo+IC0NCj4gLS8qDQo+IC0gKiBMb2NhbCB2YXJpYWJs
ZXM6DQo+IC0gKiBtb2RlOiBDDQo+IC0gKiBjLWZpbGUtc3R5bGU6ICJCU0QiDQo+IC0gKiBj
LWJhc2ljLW9mZnNldDogNA0KPiAtICogdGFiLXdpZHRoOiA0DQo+IC0gKiBpbmRlbnQtdGFi
cy1tb2RlOiBuaWwNCj4gLSAqIEVuZDoNCj4gLSAqLw0KPiAtLS0gYS94ZW4vYXJjaC94ODYv
eDg2X2VtdWxhdGUvTWFrZWZpbGUNCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRl
L01ha2VmaWxlDQo+IEBAIC0xLDMgKzEsMTQgQEANCj4gKyMgUHV0IHRoaXMgYWhlYWQgb2Yg
dGhlIHNvcnRlZCBsaXN0IGJlbG93LCBhcyBpdCB0YWtlcyBsb25nIHRvIGJ1aWxkIGFuZCBo
ZW5jZQ0KPiArIyB3ZSdkIGxpa2UgcGFyYWxsZWwgbWFrZSB0byBzY2hlZHVsZSBpdHMgYnVp
bGRpbmcgZWFybHkuDQo+ICtvYmoteSArPSB4ODZfZW11bGF0ZS5vDQo+ICsNCj4gK2lmbmVx
ICgkKENPTkZJR19IVk0pLHkpDQo+ICskKG9iaikveDg2X2VtdWxhdGUubzogQ0ZMQUdTLXkg
Kz0gLVduby11bnVzZWQtbGFiZWwNCj4gK2VuZGlmDQo+ICtpZmVxICgkKENPTkZJR19DT05E
SVRJT05fQ09WRVJBR0UpJChDT05GSUdfQ0NfSVNfR0NDKSx5eSkNCj4gKyQob2JqKS94ODZf
ZW11bGF0ZS5vOiBDRkxBR1MteSArPSAtV25vLWVycm9yPWNvdmVyYWdlLXRvby1tYW55LWNv
bmRpdGlvbnMNCj4gK2VuZGlmDQo+ICsNCj4gICBvYmoteSArPSAwZjAxLm8NCj4gICBvYmot
eSArPSAwZmFlLm8NCj4gICBvYmoteSArPSAwZmM3Lm8NCj4gLS0tIGEveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9l
bXVsYXRlL3g4Nl9lbXVsYXRlLmMNCj4gQEAgLTgsOCArOCw1MiBAQA0KPiAgICAqIENvcHly
aWdodCAoYykgMjAwNS0yMDA3IFhlblNvdXJjZSBJbmMuDQo+ICAgICovDQo+ICAgDQo+ICsj
aWZkZWYgX19YRU5fXw0KPiArDQo+ICsjIGluY2x1ZGUgPHhlbi9ldmVudC5oPg0KPiArDQo+
ICsjIGluY2x1ZGUgPGFzbS9hbWQuaD4gLyogY3B1X2hhc19hbWRfZXJyYXR1bSgpICovDQo+
ICsjIGluY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4gLyogY3VycmVudF9jcHVfaW5mbyAqLw0K
PiArIyBpbmNsdWRlIDxhc20veDg2X2VtdWxhdGUuaD4NCj4gKyMgaW5jbHVkZSA8YXNtL3hz
dGF0ZS5oPg0KPiArDQo+ICsvKiBBdm9pZCBuYW1lc3BhY2UgcG9sbHV0aW9uLiAqLw0KPiAr
IyB1bmRlZiBjbXB4Y2hnDQo+ICsjIHVuZGVmIGNwdWlkDQo+ICsjIHVuZGVmIHdiaW52ZA0K
PiArDQo+ICsjIGRlZmluZSBjcHVfaGFzX2FtZF9lcnJhdHVtKG5yKSBcDQo+ICsgICAgICAg
ICBjcHVfaGFzX2FtZF9lcnJhdHVtKCZjdXJyZW50X2NwdV9kYXRhLCBBTURfRVJSQVRVTV8j
I25yKQ0KPiArDQo+ICsjZWxzZSAvKiAhX19YRU5fXyAqLw0KPiArDQo+ICsvKiBTZWUgZ2Nj
IGJ1ZyAxMDA2ODAsIGJ1dCBoZXJlIGRvbid0IGJvdGhlciBtYWtpbmcgdGhpcyB2ZXJzaW9u
IGRlcGVuZGVudC4gKi8NCj4gKyMgZGVmaW5lIGdjYzExX3dyYXAoeCkgKHsgICAgICAgICAg
ICAgICAgICBcDQo+ICsgICAgIHVuc2lnbmVkIGxvbmcgeF87ICAgICAgICAgICAgICAgICAg
ICAgXA0KPiArICAgICBfX2FzbV9fICggIiIgOiAiPWciICh4XykgOiAiMCIgKHgpICk7IFwN
Cj4gKyAgICAgKHR5cGVvZih4KSl4XzsgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICt9
KQ0KPiArDQo+ICsjIGRlZmluZSBjcHVfaGFzX2FtZF9lcnJhdHVtKG5yKSAwDQo+ICsjIGRl
ZmluZSBjcHVfaGFzX21weCBmYWxzZQ0KPiArIyBkZWZpbmUgcmVhZF9ibmRjZmd1KCkgMA0K
PiArIyBkZWZpbmUgeHN0YXRlX3NldF9pbml0KHdoYXQpDQo+ICsNCj4gKy8qIEZvciBnZW5l
cmljIGFzc2VtYmx5IGNvZGU6IHVzZSBtYWNyb3MgdG8gZGVmaW5lIG9wZXJhdGlvbi9vcGVy
YW5kIHNpemVzLiAqLw0KPiArIyBpZmRlZiBfX2kzODZfXw0KPiArIyAgZGVmaW5lIF9fT1Mg
ICAgICAgICAgImwiICAvKiBPcGVyYXRpb24gU3VmZml4ICovDQo+ICsjICBkZWZpbmUgX19P
UCAgICAgICAgICAiZSIgIC8qIE9wZXJhbmQgUHJlZml4ICovDQo+ICsjIGVsc2UNCj4gKyMg
IGRlZmluZSBfX09TICAgICAgICAgICJxIiAgLyogT3BlcmF0aW9uIFN1ZmZpeCAqLw0KPiAr
IyAgZGVmaW5lIF9fT1AgICAgICAgICAgInIiICAvKiBPcGVyYW5kIFByZWZpeCAqLw0KPiAr
IyBlbmRpZg0KPiArDQo+ICsjZW5kaWYgLyogX19YRU5fXyAqLw0KPiArDQo+ICAgI2luY2x1
ZGUgInByaXZhdGUuaCINCj4gICANCj4gKyNpZm5kZWYgWDg2RU1VTF9OT19NTVgNCj4gKw0K
PiAgIC8qDQo+ICAgICogVGhlIG5leHQgdHdvIHRhYmxlcyBhcmUgaW5kZXhlZCBieSBoaWdo
IG9wY29kZSBleHRlbnNpb24gYnl0ZSAodGhlIG9uZQ0KPiAgICAqIHRoYXQncyBlbmNvZGVk
IGxpa2UgYW4gaW1tZWRpYXRlKSBuaWJibGUsIHdpdGggZWFjaCB0YWJsZSBlbGVtZW50IHRo
ZW4NCj4gQEAgLTQ1LDkgKzg5LDE1IEBAIHN0YXRpYyBjb25zdCB1aW50MTZfdCBfM2Rub3df
ZXh0X3RhYmxlWzENCj4gICAgICAgWzB4Yl0gPSAoMSA8PCAweGIpIC8qIHBzd2FwZCAqLywN
Cj4gICB9Ow0KPiAgIA0KPiArI2VuZGlmIC8qICFYODZFTVVMX05PX01NWCAqLw0KPiArDQo+
ICsjaWZuZGVmIFg4NkVNVUxfTk9fU0lNRA0KPiArDQo+ICAgLyogU2hpZnQgdmFsdWVzIGJl
dHdlZW4gc3JjIGFuZCBkc3Qgc2l6ZXMgb2YgcG1vdntzLHp9eHtiLHcsZH17dyxkLHF9LiAq
Lw0KPiAgIHN0YXRpYyBjb25zdCB1aW50OF90IHBtb3ZfY29udmVydF9kZWx0YVtdID0geyAx
LCAyLCAzLCAxLCAyLCAxIH07DQo+ICAgDQo+ICsjZW5kaWYgLyogIVg4NkVNVUxfTk9fU0lN
RCAqLw0KPiArDQo+ICAgc3RhdGljIGNvbnN0IHVpbnQ4X3Qgc3NlX3ByZWZpeFtdID0geyAw
eDY2LCAweGYzLCAweGYyIH07DQo+ICAgDQo+ICAgI2lmZGVmIF9feDg2XzY0X18NCj4gDQoN
ClJldmlld2VkLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCg==

--------------Ed0Q4h7hI2y9yDdvTPy5XXSi
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------Ed0Q4h7hI2y9yDdvTPy5XXSi--

--------------dDBTcUZmDaI0sYD5TwCAjkAg--

--------------w6W60M9FgH4Yf4pgbHY0MrB6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpXgCUFAwAAAAAACgkQZg+p0QLLz9CW
nwv6AqMVX0rpdRRlc6JJGvOD3aOLUph+ikxRpJhHodQvRC8Bs39vael2xeFT5WE0lAZwf1MnEZuE
J0sHh7pz0sHZ+jJSQArPEUowUAYhucExYcKwcUkAwCRAOtJR/mBL6Q3CDPPIKnLKO3Qgedwus/Hq
h3AnXu/mP6XUCzbel5xg1O+m2Iunuw4QlcGLtk4JDZuKkwd1UKzWG+xmu5VhJ6/bUAIdcXh/lnjh
GyMY5NY91gSd7JtuBlaHnjavLGBJ1zLkgGTJDZ0ppFmSLUxa6km2QQK3p3IjC5Vq55Gu9NrsQ/43
QzlI+Vp4R2xhI42ZfhzUd9r+Rzo4EyUNc93yRpwWJPmUY3d/j/wckGHC5gYHvzewbgtEvbj4EElv
ehtzgVJ7JfkNWeju2hqY+QtrorcGjv24DyFcslhWvhKbXK7cC5yNW0cLYbEHPGcr9QtjTWwahPTS
K8Gm+ybBFXR1XNYsxUFBrQGhnEnqvZ+WaepuS4ZAYZQcguYPhJi/ci5WXpOJ
=MNfZ
-----END PGP SIGNATURE-----

--------------w6W60M9FgH4Yf4pgbHY0MrB6--

