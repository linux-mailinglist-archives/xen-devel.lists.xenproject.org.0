Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QChHKLuXDGphjgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 19:02:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A5A582C9F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 19:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313277.1583489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNpj-000207-G7; Tue, 19 May 2026 17:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313277.1583489; Tue, 19 May 2026 17:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNpj-0001xD-Cf; Tue, 19 May 2026 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1313277;
 Tue, 19 May 2026 17:02:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373@swg.vates.tech>)
 id 1wPNph-0001x4-1D
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:02:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPNpf-00ClaK-Ez
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 19:02:15 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373@swg.vates.tech>)
 id 6a0c978f-2eae-0a2a0a5409dd-0a2a450393e0-26
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:02:15 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373@swg.vates.tech>)
 id 6a0c9796-672d-0a2a45030019-b9ff1c22b3a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:02:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e41301cfd000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 May 2026 17:02:12 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8C2EF866D2;
 Tue, 19 May 2026 19:02:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=BGLoXKjW+QoctzuaXS2h2JIaLtIBtboZDXZmE8fkcSE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Ju25qRR9kZyAI2/uYddduxUAYe/8/YpB4CzLNgpDXmk8WElV0izkAqn00Xz/9pDssfGy9A8YQ
 ZskNSPqP+0AvvJd58Th0q1PVDP1i02SNDb6wFiO2lDCV1tKiFw002O3aezFKznQOrGXl8lrcLU+
 92EtU4BXDQdqzikp9YZJvE2xoGtwK6kOeszMMOxtqdJDMI368xBZj2uc22wYI8CMvsRbHCu6ACQ
 GLiw/YF44304MkMHRt30YJmCSU7d1WFhol39wGGWdaaKRPPsqd+1DXHM6tWcf0QPFIvk5WyFyIS
 sN0hKfkpOF+25c8zi3c0FACSsekvercfT+NpRaNBI9QQ==
X-Zone-Loop: c8b5e218c58bfc1ddf4bc601eb7a8c5f773bc5eced15
x-campaign-type: default
x-transaction-id: b999a90f-18d8-469a-bbec-6dfd0c31f01d
x-swg-uid: 01-5944820a-a82b-41eb-9b90-e26ad13e094f
X-Mailer: Sweego
Message-ID:
 <1779210132.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373@vates.tech>
x-swg-bid: 1779210132.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 19 May 2026 19:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 6/7] x86/svm: Use the emulator path for VMEXIT_HLT
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-7-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260518131404.3716969-7-ross.lagerwall@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ar0zEbDrBzvgrywSSB5oec8Y"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779210131697
X-purgate-ID: tlsNG-33051d/1779210135-41197938-DC9C9EF9/0/0
X-purgate-type: clean
X-purgate-size: 11334
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_MUA_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 05A5A582C9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ar0zEbDrBzvgrywSSB5oec8Y
Content-Type: multipart/mixed; boundary="------------rH8w30eBaf70kN5g283p00Ix";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <02ba0a06-2df2-4f27-9d72-4cf77fbe9149@vates.tech>
Subject: Re: [RFC v1 6/7] x86/svm: Use the emulator path for VMEXIT_HLT
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-7-ross.lagerwall@citrix.com>
In-Reply-To: <20260518131404.3716969-7-ross.lagerwall@citrix.com>

--------------rH8w30eBaf70kN5g283p00Ix
Content-Type: multipart/mixed; boundary="------------bhFvJUHuc3jXUnzYdCXeC0gT"

--------------bhFvJUHuc3jXUnzYdCXeC0gT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkhlcmUgaXMgbXkgZmVlZGJhY2sgZnJvbSBhIFNFVi1FUyBpbXBsZW1lbnRh
dGlvbiBwZXJzcGVjdGl2ZSwgYXMgaXQgaGFzIA0Kc3BlY2lmaWMgbmVlZHMgcmVsYXRlZCB0
byBzb21lIFZNRVhJVCBoYW5kbGluZy4NCg0KTGUgMTgvMDUvMjAyNiDDoCAxNToxNCwgUm9z
cyBMYWdlcndhbGwgYSDDqWNyaXTCoDoNCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndh
bGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4
Ni9odm0vZW11bGF0ZS5jICAgICB8ICA1ICsrKysrDQo+ICAgeGVuL2FyY2gveDg2L2h2bS9z
dm0vZW11bGF0ZS5jIHwgIDIgKy0NCj4gICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAg
ICAgfCAyNCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gICB4ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uaCAgICAgfCAgMSArDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL2VtdWxhdGUuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jDQo+IGluZGV4
IGM5NTUzY2QyODIzOC4uNDcxYzAzMmMxZTljIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL2VtdWxhdGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYw0K
PiBAQCAtMjgwMCw2ICsyODAwLDExIEBAIHN0YXRpYyBpbnQgX2h2bV9lbXVsYXRlX29uZShz
dHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAqaHZtZW11bF9jdHh0LA0KPiAgIA0KPiAgICAgICAg
ICAgc3dpdGNoICggaHZtZW11bF9jdHh0LT5pbnNuICkNCj4gICAgICAgICAgIHsNCj4gKyAg
ICAgICAgY2FzZSBJTlNUUl9ITFQ6DQo+ICsgICAgICAgICAgICBodm1lbXVsX2N0eHQtPmN0
eHQucmV0aXJlLmhsdCA9IHRydWU7DQo+ICsgICAgICAgICAgICByYyA9IFg4NkVNVUxfT0tB
WTsNCj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiArDQo+ICAgICAgICAgICBkZWZhdWx0Og0K
PiAgICAgICAgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiAgICAgICAgICAgICAg
IHJjID0gWDg2RU1VTF9VTkhBTkRMRUFCTEU7DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL3N2bS9lbXVsYXRlLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMN
Cj4gaW5kZXggMWRkODMwYTMxYmQ3Li4zMWYzY2Q4OGE4NTggMTAwNjQ0DQo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vc3ZtL2VtdWxhdGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L3N2bS9lbXVsYXRlLmMNCj4gQEAgLTE2LDcgKzE2LDcgQEANCj4gICAjaW5jbHVkZSAic3Zt
LmgiDQo+ICAgI2luY2x1ZGUgInZtY2IuaCINCj4gICANCj4gLXN0YXRpYyB1bnNpZ25lZCBs
b25nIHN2bV9uZXh0cmlwX2luc25fbGVuZ3RoKHN0cnVjdCB2Y3B1ICp2KQ0KPiArdW5zaWdu
ZWQgbG9uZyBzdm1fbmV4dHJpcF9pbnNuX2xlbmd0aChzdHJ1Y3QgdmNwdSAqdikNCj4gICB7
DQo+ICAgICAgIHN0cnVjdCB2bWNiX3N0cnVjdCAqdm1jYiA9IHYtPmFyY2guaHZtLnN2bS52
bWNiOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMg
Yi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPiBpbmRleCBmNDlkMmViYmZkZDUuLjJk
NjAyMmQ2MjM4YyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMN
Cj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4gQEAgLTIwNTEsMTggKzIw
NTEsNiBAQCBzdGF0aWMgdm9pZCBzdm1fZG9fbXNyX2FjY2VzcyhzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykNCj4gICAgICAgICAgIGh2bV9pbmplY3RfaHdfZXhjZXB0aW9uKFg4Nl9F
WENfR1AsIDApOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lkIHN2bV92bWV4aXRfZG9f
aGx0KHN0cnVjdCB2bWNiX3N0cnVjdCAqdm1jYiwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPiAtew0KPiAtICAgIHVu
c2lnbmVkIGludCBpbnN0X2xlbjsNCj4gLQ0KPiAtICAgIGlmICggKGluc3RfbGVuID0gc3Zt
X2dldF9pbnNuX2xlbihjdXJyZW50LCBJTlNUUl9ITFQpKSA9PSAwICkNCj4gLSAgICAgICAg
cmV0dXJuOw0KPiAtICAgIF9fdXBkYXRlX2d1ZXN0X2VpcChyZWdzLCBpbnN0X2xlbik7DQo+
IC0NCj4gLSAgICBodm1faGx0KHJlZ3MtPmVmbGFncyk7DQo+IC19DQo+IC0NCj4gICBzdGF0
aWMgdm9pZCBzdm1fdm1leGl0X2RvX3JkdHNjKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
LCBib29sIHJkdHNjcCkNCj4gICB7DQo+ICAgICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3Vy
cmVudDsNCj4gQEAgLTIzNjMsNiArMjM1MSwxMyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBz
dm1fc2V0X3JlZyhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHJlZywgdWludDY0X3Qg
dmFsKQ0KPiAgICAgICB9DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgc3ZtX2VtdWxh
dGVfb25lKHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0ICpjdHh0KQ0KPiArew0KPiArICAgIGN0
eHQtPmluc25fbGVuID0gc3ZtX25leHRyaXBfaW5zbl9sZW5ndGgoY3VycmVudCk7DQo+ICsg
ICAgaWYgKCAhaHZtX2VtdWxhdGVfb25lX2N0eHQoY3R4dCkgKQ0KPiArICAgICAgICBodm1f
aW5qZWN0X2h3X2V4Y2VwdGlvbihYODZfRVhDX0dQLCAwKTsNCj4gK30NCj4gKw0KPiAgIHN0
YXRpYyBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlIF9faW5pdGRhdGFfY2ZfY2xvYmJlciBz
dm1fZnVuY3Rpb25fdGFibGUgPSB7DQo+ICAgICAgIC5uYW1lICAgICAgICAgICAgICAgICA9
ICJTVk0iLA0KPiAgICAgICAuY3B1X3VwX3ByZXBhcmUgICAgICAgPSBzdm1fY3B1X3VwX3By
ZXBhcmUsDQo+IEBAIC0yNDk2LDYgKzI0OTEsNyBAQCB2b2lkIGFzbWxpbmthZ2Ugc3ZtX3Zt
ZXhpdF9oYW5kbGVyKHZvaWQpDQo+ICAgICAgIHZpbnRyX3QgaW50cjsNCj4gICAgICAgYm9v
bCB2Y3B1X2d1ZXN0bW9kZSA9IGZhbHNlOw0KPiAgICAgICBzdHJ1Y3QgdmxhcGljICp2bGFw
aWMgPSB2Y3B1X3ZsYXBpYyh2KTsNCj4gKyAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCBj
dHh0Ow0KPiAgIA0KPiAgICAgICByZWdzLT5yYXggPSB2bWNiLT5yYXg7DQo+ICAgICAgIHJl
Z3MtPnJpcCA9IHZtY2ItPnJpcDsNCj4gQEAgLTI4NDAsNyArMjgzNiw5IEBAIHZvaWQgYXNt
bGlua2FnZSBzdm1fdm1leGl0X2hhbmRsZXIodm9pZCkNCj4gICAgICAgfQ0KPiAgIA0KPiAg
ICAgICBjYXNlIFZNRVhJVF9ITFQ6DQo+IC0gICAgICAgIHN2bV92bWV4aXRfZG9faGx0KHZt
Y2IsIHJlZ3MpOw0KPiArICAgICAgICBodm1fZW11bGF0ZV9pbml0X29uY2UoJmN0eHQsIE5V
TEwsIE5VTEwsIHJlZ3MpOw0KPiArICAgICAgICBjdHh0Lmluc24gPSBJTlNUUl9ITFQ7DQo+
ICsgICAgICAgIHN2bV9lbXVsYXRlX29uZSgmY3R4dCk7DQo+ICAgICAgICAgICBicmVhazsN
Cg0KDQpJbiB0aGlzIGNhc2UsIG1vc3Qgb2YgdGhlIGxvZ2ljIGlzIGhpZGRlbiBiZWhpbmQg
c3ZtX2VtdWxhdGVfb25lKCk7IA0KaG93ZXZlciwgU0VWLUVTIGNoYW5nZXMgc29tZSBhc3Bl
Y3RzIG9mIHRoZSBWTUVYSVRfSExUIGJlaGF2aW9yICh0aGlzIGlzIA0KdGhlIHNhbWUgZm9y
IGUuZyBWTUVYSVRfUEFVU0UpLg0KDQpXaXRoIFNFVi1FUywgd2UgY2FuJ3QgYWNjZXNzIHRo
ZSBDUFUgcmVnaXN0ZXJzIGFueW1vcmUgYnV0IGhsdCBjYW4gc3RpbGwgDQpiZSBpbnRlcmNl
cHRlZCAoaXQncyBhICJBdXRvbWF0aWMgRXhpdCAoQUUpIiksIGluIHRoaXMgY2FzZSwgdGhl
IENQVSANCmluY3JlYXNlcyBSSVAgaXRzZWxmICh0aGlzIGlzIGRvY3VtZW50ZWQgaW4gU0VW
LUVTIHNlY3Rpb24gb2YgdGhlIEFQTSksIA0KYW5kIHdlIGp1c3QgaGF2ZSB0byBlbXVsYXRl
IHRoZSBITFQgYmVoYXZpb3IuIEhvdyB3b3VsZCB0aGF0IHNwZWNpZmljIA0KYmVoYXZpb3Ig
Zml0IGluIHRoaXMgbmV3IGRlc2lnbiA/DQoNCldlIGNhbiBza2lwIGluY3JlYXNpbmcgcmlw
IGluIHRoaXMgc3BlY2lmaWMgY2FzZSwgYnV0IGl0J3Mgbm93IGNvbW1vbiBjb2RlLg0KDQo+
ICAgDQo+ICAgICAgIGNhc2UgVk1FWElUX0lPSU86DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvaHZtL3N2bS9zdm0uaCBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5oDQo+IGlu
ZGV4IGY3NWJjYTdjNWY2Ni4uOTQyMmRiZDM4YTc4IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3N2bS9zdm0uaA0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0u
aA0KPiBAQCAtMzYsNiArMzYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3ZtX2ludmxwZ2Eo
dW5zaWduZWQgbG9uZyBsaW5lYXIsIHVpbnQzMl90IGFzaWQpDQo+ICAgICAgIGFzbSB2b2xh
dGlsZSAoICJpbnZscGdhIiA6OiAiYSIgKGxpbmVhciksICJjIiAoYXNpZCkgKTsNCj4gICB9
DQo+ICAgDQo+ICt1bnNpZ25lZCBsb25nIHN2bV9uZXh0cmlwX2luc25fbGVuZ3RoKHN0cnVj
dCB2Y3B1ICp2KTsNCj4gICB1bnNpZ25lZCBpbnQgc3ZtX2dldF9pbnNuX2xlbihzdHJ1Y3Qg
dmNwdSAqdiwgdW5zaWduZWQgaW50IGluc3RyX2VuYyk7DQo+ICAgdW5zaWduZWQgaW50IHN2
bV9nZXRfdGFza19zd2l0Y2hfaW5zbl9sZW4odm9pZCk7DQo+ICAgDQoNClRlZGR5DQo=
--------------bhFvJUHuc3jXUnzYdCXeC0gT
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------bhFvJUHuc3jXUnzYdCXeC0gT--

--------------rH8w30eBaf70kN5g283p00Ix--

--------------ar0zEbDrBzvgrywSSB5oec8Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoMl5MFAwAAAAAACgkQZg+p0QLLz9AR
YwwArB88u2eJvYlIhEgg5PGGX/aCbLgFKuI1kNSfLqpG7GR0atKOJR66FG9eV+Bgn4LaLukUXIF4
cJNvFSmc5tYLSyhXh1YdO7lCSbn/hn5px0TqyTkJVKVjPCGgCbGXcVcNIFiF3knk20LG7jmiQB6y
KCICU/Vdf6ALiLrgzK53Ck/R6Ck+b+xa5DGL977IF4WWMsv6wndFVwwCHqrT2K5J2oqlZVWd6vYY
ANFERjfi0xirAKg8zzyDKbXoEZ8VAX8wGJu/uUl45ZRLIrjrSl4lgpy57q9VqhafQ4bJ2mz8oiZS
DAkE8YNpBvKjWn4EDqPfRQ1KFE+5e+z+zCHvL3O/IQ79VQ3Hm4R5kkIUZ4VxteMs8o1Py3MqNt0s
d8RafIL0Uhl8rqAffXsNBO1IJanTGUDqpGSwWMzuNDXPb06mrJw2jEXvXLqH9pNEllwFaKnsmwsL
w2dtvUvA090SCWou+TgSOLDlBU7vyAc+Sqn6D2m6ODBYwLrzgojaPQZqyIcJ
=2FnW
-----END PGP SIGNATURE-----

--------------ar0zEbDrBzvgrywSSB5oec8Y--

