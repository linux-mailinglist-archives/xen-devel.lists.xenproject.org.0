Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GM0bBYVFK2oI5gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 01:32:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A02675D0E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 01:32:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=iCTFns3z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336254.1598102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXoro-0002rF-Ra; Thu, 11 Jun 2026 23:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336254.1598102; Thu, 11 Jun 2026 23:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXoro-0002oT-OP; Thu, 11 Jun 2026 23:31:20 +0000
Received: by outflank-mailman (input) for mailman id 1336254;
 Thu, 11 Jun 2026 23:31:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb906840c000701b@swg.vates.tech>)
 id 1wXorm-0002oN-0N
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 23:31:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXork-003qqR-UI
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 01:31:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb906840c000701b@swg.vates.tech>)
 id 6a2b44df-bab6-0a2a0a5309dd-0a2a4508d570-30
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 01:31:16 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb906840c000701b@swg.vates.tech>)
 id 6a2b4544-63b5-0a2a45080019-b9ff1c1295c1-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 01:31:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eb906840c000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Jun 2026 23:31:12 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id B67A3861D9;
 Fri, 12 Jun 2026 01:31:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=5174LbockiKMQhbPclevjqaG6U0/r5hLgXa2SgNToko=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iCTFns3zTYuy14R02fTP9KY9dbnrKoWm2KD8TZdlQx3hwl5pWEamKz/VnNohV/6WNyqDfSKM5
 qkei/fu6u14HlPiwjxRljeo5msOyZAkCeEiHebo5iEI4gkgL6A1kBf+j8uYtQxp3kk5SyRypM0h
 mjOBfiLCJm6Zy7YWIW2Wzk394mEBmS5XnNig5iM0IzW2V5FxIAahqJt085oeRvthf2GvcUze8zq
 gJhrF86W8jZD2q5I9EDwEfXmtUInxlYmY2IayQMHy/lLaQyf9HemwZja93wlrxcjz91WRoFyhyO
 GKeplW2TPDgp17HVqwZWUuhlzuhUA5Y2hM4Lf0AySGJA==
X-Zone-Loop: 2a39dd22df1076ec97fd95b1b7dddb35b8de9de7bfb7
x-campaign-type: default
x-transaction-id: e8bea119-38d7-4e91-8884-d2baa2d570d0
x-swg-uid: 01-e9fdf6e3-0605-4b34-bf38-95dd5f099de8
X-Mailer: Sweego
Message-ID:
 <1781220672.8631fc262581453bbf619ec5b2062170.19eb906840c000701b@vates.tech>
x-swg-bid: 1781220672.8631fc262581453bbf619ec5b2062170.19eb906840c000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 01:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/efi: discard multiboot support for PE binary
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
 <20260611153257.650054-3-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260611153257.650054-3-frediano.ziglio@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jDHGfCErTntTRWBLYB1CqgKm"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781220671917
X-purgate-ID: tlsNG-c1860d/1781220676-BD161DB1-327AA0C1/0/0
X-purgate-type: clean
X-purgate-size: 9978
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
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53A02675D0E

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jDHGfCErTntTRWBLYB1CqgKm
Content-Type: multipart/mixed; boundary="------------g0aGJ7s8Vvl3b9gZ8C0otnp9";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Message-ID: <89ac0da0-c1f4-4635-b50b-cbef8c3feb7a@vates.tech>
Subject: Re: [PATCH v2 2/4] x86/efi: discard multiboot support for PE binary
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
 <20260611153257.650054-3-frediano.ziglio@cloud.com>
In-Reply-To: <20260611153257.650054-3-frediano.ziglio@cloud.com>

--------------g0aGJ7s8Vvl3b9gZ8C0otnp9
Content-Type: multipart/mixed; boundary="------------1kVAH0WbrZgiV0npv6extKwE"

--------------1kVAH0WbrZgiV0npv6extKwE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTEvMDYvMjAyNiDDoCAxNzozMywgRnJlZGlhbm8gWmlnbGlvIGEgw6ljcml0wqA6DQo+
IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiANCj4g
VGhlIG11bHRpYm9vdCBoZWFkZXJzICgudGV4dC5oZWFkZXIgc2VjdGlvbikgYXJlIG5vdCBj
b25zdW1lZCBpbiB0aGUgUEUNCj4gYmluYXJ5LCBoZW5jZSBkaXNjYXJkIHRoZW0gaW4gdGhl
IGxpbmtlciBzY3JpcHQgd2hlbiBkb2luZyBhIFBFIGJ1aWxkLg0KPiANCj4gVGhlIG11bHRp
Ym9vdCBhbmQgUFZIIGVudHJ5IHBvaW50cyBhcmUgbm90IHVzZWQgaW4gdGhlIFBFIGJpbmFy
eSwgaGVuY2UNCj4gZGlzY2FyZCB0aGVtIGluIHRoZSBsaW5rZXIgc2NyaXB0IHdoZW4gZG9p
bmcgYSBQRSBidWlsZC4NCj4gDQoNCm5pdDogaXQgbG9va3MgbGlrZSBib3RoIHBhcmFncmFw
aCBzdGF0ZSB0aGUgc2FtZSB0aGluZw0KDQo+IFRoYXQgcmVtb3ZlcyBzb21lIHJlbG9jYXRp
b25zIHRoYXQgb3RoZXJ3aXNlIGFwcGVhciBkdWUgdG8gdGhlIHVzYWdlIG9mIHRoZQ0KPiBz
dGFydCBhbmQgX19lZmk2NF9tYjJfc3RhcnQgc3ltYm9scyBpbiB0aGUgbXVsdGlib290MiBo
ZWFkZXIuDQo+IA0KPiBTZWN0aW9uIGRpc2NhcmRpbmcgaXMgbm90IGRvbmUgdXBkYXRpbmcg
RElTQ0FSRF9TRUNUSU9OUyBkZWZpbml0aW9uIGFzIHRoZQ0KPiBjaGFuZ2UgaXMgc3BlY2lm
aWMgZm9yIHg4Ni4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPiAN
Cg0KR2l2ZW4gdGhhdCB0aGlzIG5vdyBwcmV2ZW50cyBib290aW5nIHVzaW5nIG11bHRpYm9v
dDIgd2hlbiB1c2luZyB0aGUgUEUgDQpidWlsZCwgdGhpcyBpcyBhIGZ1bmN0aW9uYWwgY2hh
bmdlLCBldmVuIHRob3VnaCBpdCdzIHN0cm9uZ2x5IA0KZGlzY291cmFnZWQgKG5vdCBvZmZp
Y2lhbGx5IHN1cHBvcnRlZCkuDQoNCkkgd291bGQgYWRkIGEgY2hhbmdlbG9nIGVudHJ5IHRv
IGFjdHVhbGx5IHN0YXRlIHRoaXMgY2hhbmdlIChldmVudHVhbGx5IA0KcmVtaW5kaW5nIHRo
YXQgdGhpcyB3YXMgbm90IGFjdHVhbGx5IHN1cHBvcnRlZCBhbnl3YXkpLg0KDQo+IFNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGcmVkaWFubyBaaWdsaW8gPGZyZWRpYW5vLnppZ2xpb0BjaXRyaXgu
Y29tPg0KPiAtLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAtIGltcHJvdmUgY29tbWl0IG1l
c3NhZ2U7DQo+IC0gY2hhbmdlIHNlY3Rpb24gb3JkZXJzIHRvIGF2b2lkIGNoYW5naW5nIGNv
ZGUgb3JkZXIgaW4gZmluYWwgZXhlY3V0YWJsZTsNCj4gLSBtZXJnZSAyIGNvbW1pdHM7DQo+
IC0gcmVtb3ZlZCBkZXByZWNhdGVkIGRvY3VtZW50YXRpb24gc2VjdGlvbi4NCj4gLS0tDQo+
ICAgZG9jcy9oeXBlcnZpc29yLWd1aWRlL3g4Ni9ob3cteGVuLWJvb3RzLnJzdCB8IDYgLS0t
LS0tDQo+ICAgeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgICAgICAgICAgICAgICAgICB8
IDMgKystDQo+ICAgeGVuL2FyY2gveDg2L3hlbi5sZHMuUyAgICAgICAgICAgICAgICAgICAg
ICB8IDUgKysrKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kb2NzL2h5cGVydmlzb3ItZ3VpZGUv
eDg2L2hvdy14ZW4tYm9vdHMucnN0IGIvZG9jcy9oeXBlcnZpc29yLWd1aWRlL3g4Ni9ob3ct
eGVuLWJvb3RzLnJzdA0KPiBpbmRleCA4YjMyMjkwMDVjLi5iNmQ4NTIwNTBhIDEwMDY0NA0K
PiAtLS0gYS9kb2NzL2h5cGVydmlzb3ItZ3VpZGUveDg2L2hvdy14ZW4tYm9vdHMucnN0DQo+
ICsrKyBiL2RvY3MvaHlwZXJ2aXNvci1ndWlkZS94ODYvaG93LXhlbi1ib290cy5yc3QNCj4g
QEAgLTgyLDEyICs4Miw2IEBAIFdoZW4gYSBQRUktY2FwYWJsZSB0b29sY2hhaW4gaXMgZm91
bmQsIHRoZSBvYmplY3RzIGFyZSBsaW5rZWQgdG9nZXRoZXIgYW5kIGENCj4gICBQRTMyKyBi
aW5hcnkgaXMgY3JlYXRlZC4gIEl0IGNhbiBiZSBydW4gZGlyZWN0bHkgZnJvbSB0aGUgRUZJ
IHNoZWxsLCBhbmQgaGFzDQo+ICAgYGBlZmlfc3RhcnRgYCBhcyBpdHMgZW50cnkgc3ltYm9s
Lg0KPiAgIA0KPiAtLi4gbm90ZTo6DQo+IC0NCj4gLSAgIHhlbi5lZmkgZG9lcyBjb250YWlu
IGFsbCBNQjEvTUIyL1BWSCB0YWdzIGluY2x1ZGVkIGluIHRoZSByZXN0IG9mIHRoZQ0KPiAt
ICAgYnVpbGQuICBIb3dldmVyLCBlbnRyeSB2aWEgYW55dGhpbmcgb3RoZXIgdGhhbiB0aGUg
RUZJNjQgcHJvdG9jb2wgaXMNCj4gLSAgIHVuc3VwcG9ydGVkLCBhbmQgd29uJ3Qgd29yay4N
Cj4gLQ0KPiAgIA0KPiAgIEJvb3QNCj4gICAtLS0tDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMNCj4gaW5kZXgg
NzdiYjdhOWUyMS4uOTBmYWY0MTFiOSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2Jv
b3QvaGVhZC5TDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUw0KPiBAQCAtMTUy
LDcgKzE1Miw3IEBAIHZnYV90ZXh0X2J1ZmZlcjoNCj4gICBlZmlfcGxhdGZvcm06DQo+ICAg
ICAgICAgICAuYnl0ZSAgIDANCj4gICANCj4gLSAgICAgICAgLnNlY3Rpb24gLmluaXQudGV4
dCwgImF4IiwgQHByb2diaXRzDQo+ICsgICAgICAgIC5zZWN0aW9uIC5pbml0Lm11bHRpYm9v
dCwgImF4IiwgQHByb2diaXRzDQo+ICAgDQo+ICAgZWFybHlfZXJyb3I6IC8qIEhlcmUgdG8g
aW1wcm92ZSB0aGUgZGlzYXNzZW1ibHkuICovDQo+ICAgDQo+IEBAIC03MTAsNiArNzEwLDcg
QEAgdHJhbXBvbGluZV9zZXR1cDoNCj4gICAgICAgICAgIC8qIEp1bXAgaW50byB0aGUgcmVs
b2NhdGVkIHRyYW1wb2xpbmUuICovDQo+ICAgICAgICAgICBscmV0DQo+ICAgDQo+ICsgICAg
ICAgIC5zZWN0aW9uIC5pbml0LnRleHQsICJheCIsIEBwcm9nYml0cw0KPiAgIEVOVFJZKHRy
YW1wb2xpbmVfc3RhcnQpDQo+ICAgI2luY2x1ZGUgInRyYW1wb2xpbmUuUyINCj4gICBFTlRS
WSh0cmFtcG9saW5lX2VuZCkNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRz
LlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+IGluZGV4IGY3NTg5NDA2NzQuLjc0OWQ5
NzE5Y2MgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4gKysrIGIv
eGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPiBAQCAtNTcsNiArNTcsMTAgQEAgU0VDVElPTlMN
Cj4gICAgIF9faW1hZ2VfYmFzZV9fID0gLjsNCj4gICAjZWxzZQ0KPiAgICAgLiA9IF9faW1h
Z2VfYmFzZV9fOw0KPiArICAvRElTQ0FSRC8gOiB7DQo+ICsgICAgKigudGV4dC5oZWFkZXIp
DQo+ICsgICAgKiguaW5pdC5tdWx0aWJvb3QpDQo+ICsgIH0NCj4gICAjZW5kaWYNCj4gICAN
Cj4gICAjaWYgMA0KPiBAQCAtMTk1LDYgKzE5OSw3IEBAIFNFQ1RJT05TDQo+ICAgICBERUNM
X1NFQ1RJT04oLmluaXQudGV4dCkgew0KPiAgICNlbmRpZg0KPiAgICAgICAgICBfc2luaXR0
ZXh0ID0gLjsNCj4gKyAgICAgICAqKC5pbml0Lm11bHRpYm9vdCkNCj4gICAgICAgICAgKigu
aW5pdC50ZXh0KQ0KPiAgICAgICAgICAqKC50ZXh0LnN0YXJ0dXApDQo+ICAgICAgICAgIF9l
aW5pdHRleHQgPSAuOw0KDQpUZWRkeQ0K
--------------1kVAH0WbrZgiV0npv6extKwE
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------1kVAH0WbrZgiV0npv6extKwE--

--------------g0aGJ7s8Vvl3b9gZ8C0otnp9--

--------------jDHGfCErTntTRWBLYB1CqgKm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmorRT8FAwAAAAAACgkQZg+p0QLLz9AI
lgv/ZjKVoC678FHs7Ouxq5fo0uEsK4+aWKHS0Wq8v8hGxBegEVbhByNZI6G/CYdDhm3NUPfOld5x
Y3/Yqng8AgmhQybEGqZ36oVU4/1xyrTwUQjWeGkHxlWqPMav9KOodlU/jrqwpwSLn0t1UPet4jMX
47ZGyiuXo2/X7AyxanKlyUAFijkYr3aRY4ih2JCc7WZP/eiSMsuH9ILjI3L5lyN0CyHjRtFoe+V+
KD9HwIPRjg4xyakrx2P6JWawnQROxlbku7acjrVbHMQ5QWD2MGelXsbCFn05NBsKmUwQRdatGMKS
1S828JKx5kxz91Yo1jUYbIyqMoD3MzZfrHNgXLtanICIkTSWWxEyeUzaIIQeDY3qm22V7tjzrye3
NEMnroYShhe5r7FHR44K0nEuNd+8y/wOsmEsetwOI5+2Dem8astMMCVQRb+5XCw3+gUcqre74QIp
LvvsKBKCNDi6Tsk0O7ir8rUgHNI82Vb8EXw4jctxeFdr/mxASFwU2QnhGnUj
=v93y
-----END PGP SIGNATURE-----

--------------jDHGfCErTntTRWBLYB1CqgKm--

