Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IIUJCnhDWop4gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:28:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FBB591F8B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314157.1584155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjm2-0005iZ-Oy; Wed, 20 May 2026 16:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314157.1584155; Wed, 20 May 2026 16:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjm2-0005fc-Lo; Wed, 20 May 2026 16:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1314157;
 Wed, 20 May 2026 16:27:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46370a9a000f373@swg.vates.tech>)
 id 1wPjm1-0005fF-4U
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:27:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPjm0-00Gnvi-HM
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:27:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46370a9a000f373@swg.vates.tech>)
 id 6a0de0e6-bab6-0a2a0a5309dd-0a2a4508c92a-46
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:27:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46370a9a000f373@swg.vates.tech>)
 id 6a0de10c-63b5-0a2a45080019-b9ff1c228d37-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:27:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e46370a9a000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 16:27:52 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 023FF86379;
 Wed, 20 May 2026 18:27:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=6ai6RDoOnMiVqPq5fxns6SLHJNSmKZqtrRwSK9574ko=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=C70QacQ+3KNYAEGvveaTPPLAtzI2nuR6D6lHTCEPJkljvd6FSZwYhA3hdPiwME4mAmFai731D
 KI1AwBvRAxH71O9bVczjwiaqZBjl5FbEbhE4tav2u5RtXT6qkVlQkZV+XQywkhUAxLBcyua2z3G
 Nx05feqm5W40b7Ik2iFMfJo7w3slyAjmS3Q5HmrKDqeWsSyAGk39PztcunTVeIpvWmt1j/OEpHx
 VhCjEE9JOmIwIFnngebEj4TV3dTZVOdEjaLb2CIXnmoZlqtLUAvfn9+VHOHka2N3bEgzomtrVS0
 okh04Vdn/pvPhYRWRyfmFqj8Qh9iZZdymbSgcqOAP6vA==
X-Zone-Loop: fa9293090769a94597df8d20adf012fae000a11078d2
x-campaign-type: default
x-transaction-id: 10a098b1-d381-4c42-b5b4-88babb6eb2e1
x-swg-uid: 01-4ae21b1f-02b1-4bb0-9844-4c75350d5923
X-Mailer: Sweego
Message-ID:
 <1779294472.8631fc262581453bbf619ec5b2062170.19e46370a9a000f373@vates.tech>
x-swg-bid: 1779294472.8631fc262581453bbf619ec5b2062170.19e46370a9a000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 20 May 2026 18:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/7] x86/hvm: Move INSTR_* constants to hvm.h
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-6-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260518131404.3716969-6-ross.lagerwall@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nWwNd3YfCTqIOB9d3IGnGF0Z"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779294472135
X-purgate-ID: tlsNG-c1860d/1779294476-B7370DB1-F0A9F2A5/0/0
X-purgate-type: clean
X-purgate-size: 12065
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
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
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E4FBB591F8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nWwNd3YfCTqIOB9d3IGnGF0Z
Content-Type: multipart/mixed; boundary="------------w0AUmbiNtGs0DU4wEQcl2flT";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <b7ff4761-cd0f-49c1-a2fd-bea66a1315e2@vates.tech>
Subject: Re: [RFC v1 5/7] x86/hvm: Move INSTR_* constants to hvm.h
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-6-ross.lagerwall@citrix.com>
In-Reply-To: <20260518131404.3716969-6-ross.lagerwall@citrix.com>

--------------w0AUmbiNtGs0DU4wEQcl2flT
Content-Type: multipart/mixed; boundary="------------vI6JgBA3q8y6cDyxiKRcbwGl"

--------------vI6JgBA3q8y6cDyxiKRcbwGl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkxlIDE4LzA1LzIwMjYgw6AgMTU6MTQsIFJvc3MgTGFnZXJ3YWxsIGEgw6lj
cml0wqA6DQo+IFRoZXNlIGFyZW4ndCBzcGVjaWZpYyB0byBTVk0gYW5kIHdpbGwgYmUgdXNl
ZCBmb3IgZW11bGF0b3IgZmFzdCBwYXRoIHNvDQo+IG1vdmUgdGhlbSB0byBodm0uaC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRy
aXguY29tPg0KPiAtLS0NCj4gICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uaCAgICAgICAg
IHwgMjkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICB4ZW4vYXJjaC94ODYv
aW5jbHVkZS9hc20vaHZtL2h2bS5oIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5oIGIv
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmgNCj4gaW5kZXggY2ZhNDExYWQ1YWUxLi5mNzVi
Y2E3YzVmNjYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5oDQo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5oDQo+IEBAIC0zNiwzNSArMzYsNiBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgc3ZtX2ludmxwZ2EodW5zaWduZWQgbG9uZyBsaW5lYXIs
IHVpbnQzMl90IGFzaWQpDQo+ICAgICAgIGFzbSB2b2xhdGlsZSAoICJpbnZscGdhIiA6OiAi
YSIgKGxpbmVhciksICJjIiAoYXNpZCkgKTsNCj4gICB9DQo+ICAgDQo+IC0vKg0KPiAtICog
RW5jb2RpbmcgZm9yIHN2bV9nZXRfaW5zbl9sZW4oKS4gIFdlIHRha2UgWDg2RU1VTF9PUEMo
KSBmb3IgdGhlIG1haW4NCj4gLSAqIG9wY29kZSwgc2hpZnRlZCBsZWZ0IHRvIG1ha2Ugcm9v
bSBmb3IgdGhlIE1vZFJNIGJ5dGUuDQo+IC0gKg0KPiAtICogVGhlIEdycDcgaW5zdHJ1Y3Rp
b25zIGhhdmUgdGhlaXIgTW9kUk0gYnl0ZSBleHByZXNzZWQgaW4gb2N0YWwgZm9yIGVhc2ll
cg0KPiAtICogY3Jvc3MgcmVmZXJlbmNpbmcgd2l0aCB0aGUgb3Bjb2RlIGV4dGVuc2lvbiB0
YWJsZS4NCj4gLSAqLw0KPiAtI2RlZmluZSBJTlNUUl9FTkMob3BjLCBtb2RybSkgKCgob3Bj
KSA8PCA4KSB8IChtb2RybSkpDQo+IC0NCj4gLSNkZWZpbmUgSU5TVFJfUEFVU0UgICAgICBJ
TlNUUl9FTkMoWDg2RU1VTF9PUENfRjMoMCwgMHg5MCksIDApDQo+IC0jZGVmaW5lIElOU1RS
X0lOVDMgICAgICAgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKCAgIDAsIDB4Y2MpLCAwKQ0KPiAt
I2RlZmluZSBJTlNUUl9JQ0VCUCAgICAgIElOU1RSX0VOQyhYODZFTVVMX09QQyggICAwLCAw
eGYxKSwgMCkNCj4gLSNkZWZpbmUgSU5TVFJfSExUICAgICAgICBJTlNUUl9FTkMoWDg2RU1V
TF9PUEMoICAgMCwgMHhmNCksIDApDQo+IC0jZGVmaW5lIElOU1RSX1hTRVRCViAgICAgSU5T
VFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzIxKSAvKiBvY3RhbC1vayAqLw0K
PiAtI2RlZmluZSBJTlNUUl9WTVJVTiAgICAgIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBm
LCAweDAxKSwgMDMzMCkgLyogb2N0YWwtb2sgKi8NCj4gLSNkZWZpbmUgSU5TVFJfVk1DQUxM
ICAgICBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMzEpIC8qIG9jdGFs
LW9rICovDQo+IC0jZGVmaW5lIElOU1RSX1ZNTE9BRCAgICAgSU5TVFJfRU5DKFg4NkVNVUxf
T1BDKDB4MGYsIDB4MDEpLCAwMzMyKSAvKiBvY3RhbC1vayAqLw0KPiAtI2RlZmluZSBJTlNU
Ul9WTVNBVkUgICAgIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMzMykg
Lyogb2N0YWwtb2sgKi8NCj4gLSNkZWZpbmUgSU5TVFJfU1RHSSAgICAgICBJTlNUUl9FTkMo
WDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMzQpIC8qIG9jdGFsLW9rICovDQo+IC0jZGVm
aW5lIElOU1RSX0NMR0kgICAgICAgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEp
LCAwMzM1KSAvKiBvY3RhbC1vayAqLw0KPiAtI2RlZmluZSBJTlNUUl9JTlZMUEdBICAgIElO
U1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMzNykgLyogb2N0YWwtb2sgKi8N
Cj4gLSNkZWZpbmUgSU5TVFJfUkRUU0NQICAgICBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgw
ZiwgMHgwMSksIDAzNzEpIC8qIG9jdGFsLW9rICovDQo+IC0jZGVmaW5lIElOU1RSX0lOVkQg
ICAgICAgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDgpLCAwKQ0KPiAtI2RlZmlu
ZSBJTlNUUl9XQklOVkQgICAgIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDA5KSwg
MCkNCj4gLSNkZWZpbmUgSU5TVFJfV1JNU1IgICAgICBJTlNUUl9FTkMoWDg2RU1VTF9PUEMo
MHgwZiwgMHgzMCksIDApDQo+IC0jZGVmaW5lIElOU1RSX1JEVFNDICAgICAgSU5TVFJfRU5D
KFg4NkVNVUxfT1BDKDB4MGYsIDB4MzEpLCAwKQ0KPiAtI2RlZmluZSBJTlNUUl9SRE1TUiAg
ICAgIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDMyKSwgMCkNCj4gLSNkZWZpbmUg
SU5TVFJfQ1BVSUQgICAgICBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHhhMiksIDAp
DQo+IC0NCj4gICB1bnNpZ25lZCBpbnQgc3ZtX2dldF9pbnNuX2xlbihzdHJ1Y3QgdmNwdSAq
diwgdW5zaWduZWQgaW50IGluc3RyX2VuYyk7DQo+ICAgdW5zaWduZWQgaW50IHN2bV9nZXRf
dGFza19zd2l0Y2hfaW5zbl9sZW4odm9pZCk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2h2bS5oIGIveGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2h2bS9odm0uaA0KPiBpbmRleCBlN2MxMzY0ODAyZjguLmE5YjY0ODE0Y2E3MSAxMDA2
NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h2bS9odm0uaA0KPiArKysg
Yi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2h2bS5oDQo+IEBAIC04NTEsNiArODUx
LDM1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBodm1fc3luY19waXJfdG9faXJyKHN0cnVjdCB2
Y3B1ICp2KQ0KPiAgICAgICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoaHZtX2Z1bmNzLnN5bmNf
cGlyX3RvX2lyciwgdik7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAqIEVuY29kaW5nIGZv
ciBzdm1fZ2V0X2luc25fbGVuKCkuICBXZSB0YWtlIFg4NkVNVUxfT1BDKCkgZm9yIHRoZSBt
YWluDQo+ICsgKiBvcGNvZGUsIHNoaWZ0ZWQgbGVmdCB0byBtYWtlIHJvb20gZm9yIHRoZSBN
b2RSTSBieXRlLg0KPiArICoNCj4gKyAqIFRoZSBHcnA3IGluc3RydWN0aW9ucyBoYXZlIHRo
ZWlyIE1vZFJNIGJ5dGUgZXhwcmVzc2VkIGluIG9jdGFsIGZvciBlYXNpZXINCj4gKyAqIGNy
b3NzIHJlZmVyZW5jaW5nIHdpdGggdGhlIG9wY29kZSBleHRlbnNpb24gdGFibGUuDQo+ICsg
Ki8NCj4gKyNkZWZpbmUgSU5TVFJfRU5DKG9wYywgbW9kcm0pICgoKG9wYykgPDwgOCkgfCAo
bW9kcm0pKQ0KPiArDQo+ICsjZGVmaW5lIElOU1RSX1BBVVNFICAgICAgSU5TVFJfRU5DKFg4
NkVNVUxfT1BDX0YzKDAsIDB4OTApLCAwKQ0KPiArI2RlZmluZSBJTlNUUl9JTlQzICAgICAg
IElOU1RSX0VOQyhYODZFTVVMX09QQyggICAwLCAweGNjKSwgMCkNCj4gKyNkZWZpbmUgSU5T
VFJfSUNFQlAgICAgICBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoICAgMCwgMHhmMSksIDApDQo+
ICsjZGVmaW5lIElOU1RSX0hMVCAgICAgICAgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKCAgIDAs
IDB4ZjQpLCAwKQ0KPiArI2RlZmluZSBJTlNUUl9YU0VUQlYgICAgIElOU1RSX0VOQyhYODZF
TVVMX09QQygweDBmLCAweDAxKSwgMDMyMSkgLyogb2N0YWwtb2sgKi8NCj4gKyNkZWZpbmUg
SU5TVFJfVk1SVU4gICAgICBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAz
MzApIC8qIG9jdGFsLW9rICovDQo+ICsjZGVmaW5lIElOU1RSX1ZNQ0FMTCAgICAgSU5TVFJf
RU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzMxKSAvKiBvY3RhbC1vayAqLw0KDQpJ
IGFzc3VtZSBhIHBhcnQgb2YgdGhlIHBsYW4gaXMgdG8gdXNlIHRoZXNlIGNvbnN0YW50cyBm
b3IgVk1YIGFzIHdlbGwuDQpIZW5jZSwgeW91IHZlcnkgbGlrZWx5IHdhbnQgdG8gc3BsaXQg
Vk1DQUxMIChWTVgpIGFuZCBWTU1DQUxMIChTVk0pIA0KZW5jb2RpbmdzICh3aGljaCBpcyBv
ZGRseSBuYW1lZCBJTlNUUl9WTUNBTEwgZGVzcGl0ZSBhY3R1YWxseSBiZWluZyANCmFjdHVh
bGx5IHZtbWNhbGwgZW5jb2RpbmcpLg0KDQo+ICsjZGVmaW5lIElOU1RSX1ZNTE9BRCAgICAg
SU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzMyKSAvKiBvY3RhbC1vayAq
Lw0KPiArI2RlZmluZSBJTlNUUl9WTVNBVkUgICAgIElOU1RSX0VOQyhYODZFTVVMX09QQygw
eDBmLCAweDAxKSwgMDMzMykgLyogb2N0YWwtb2sgKi8NCj4gKyNkZWZpbmUgSU5TVFJfU1RH
SSAgICAgICBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMzQpIC8qIG9j
dGFsLW9rICovDQo+ICsjZGVmaW5lIElOU1RSX0NMR0kgICAgICAgSU5TVFJfRU5DKFg4NkVN
VUxfT1BDKDB4MGYsIDB4MDEpLCAwMzM1KSAvKiBvY3RhbC1vayAqLw0KPiArI2RlZmluZSBJ
TlNUUl9JTlZMUEdBICAgIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMz
NykgLyogb2N0YWwtb2sgKi8NCj4gKyNkZWZpbmUgSU5TVFJfUkRUU0NQICAgICBJTlNUUl9F
TkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzNzEpIC8qIG9jdGFsLW9rICovDQo+ICsj
ZGVmaW5lIElOU1RSX0lOVkQgICAgICAgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4
MDgpLCAwKQ0KPiArI2RlZmluZSBJTlNUUl9XQklOVkQgICAgIElOU1RSX0VOQyhYODZFTVVM
X09QQygweDBmLCAweDA5KSwgMCkNCj4gKyNkZWZpbmUgSU5TVFJfV1JNU1IgICAgICBJTlNU
Ul9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgzMCksIDApDQo+ICsjZGVmaW5lIElOU1RSX1JE
VFNDICAgICAgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MzEpLCAwKQ0KPiArI2Rl
ZmluZSBJTlNUUl9SRE1TUiAgICAgIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDMy
KSwgMCkNCj4gKyNkZWZpbmUgSU5TVFJfQ1BVSUQgICAgICBJTlNUUl9FTkMoWDg2RU1VTF9P
UEMoMHgwZiwgMHhhMiksIDApDQo+ICsNCj4gICAjZWxzZSAgLyogQ09ORklHX0hWTSAqLw0K
PiAgIA0KPiAgICNkZWZpbmUgaHZtX2VuYWJsZWQgZmFsc2UNCg0KVGVkZHkNCg==
--------------vI6JgBA3q8y6cDyxiKRcbwGl
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDNBGn5sK8BDACuzSrrTjpVf4ay06OYB6yY0J1PqKffihoNMtrQRZjAHxoAPC7L
TBVHV/XOZw5HJc+9R71z1JV+iYg6z3jPziGKzX8Fj3ZXlzJPmpf1PuETH3KdbvtJ
T4ny+OGntnJntUoRKRPhTirr6yNeBk/637O3CQXjtqFUPZnko8OI/o1yawIBhJJA
WicutjkkUgd28Bh6HV9EIumHtCBgn5/1A/fpm9624MMgYLsA8qjC4XsoovQvFCaO
8HEhvfzrrTZHjn/nPeB9SigxIxXW8YaTVqMdqul07o72m3eA2mf+LMu9a04FX/d4
wbxBLtELm+1jIrbtyaFZEMOLv/haSiS/Lj3btJH/EoucejoZ5SH49ksmVAmKOLkt
OaTQ8b2gEvP7iaKiIiszCCtOSRohr+2GvDsDeLvVZnlR3I+SPhHar7TPKjFz0G3D
PNolyjXywNqOAMpomSPi8lSwjAFsxOtQbcck/qRGRSNk4DAmH70pA+89MXfQXZ3q
t1Q01B1+sU0I8xsAEQEAAc0kVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVz
LnRlY2g+wsENBBMBCAA3FiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sK8FCQWj
moACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRBmD6nRAsvP0ID6DACGOktArFbLKHNz
uyOVCskwfUZPla6Zpd3GZ8r61SrAKePIr2BnpgPkd0hV3bSRkRLIrgjzR2NRCzfp
0x0HfuhcYfAYPR46XHTvjaJEv99sT/vGUG1BZguYDOScSEpgSNaNlYum3RKZbMuR
OxdK8G+YHccJY8PvWSq2K2yiae2KGiAv1yjnZxug9/PtDfX8vQFUSg2w1ukRDf50
wvDohN1zUQfFtofOP2xCRsDZiHAlQ0pF+aUjXQhPeP3IdpfWc8cyRLXF06Rk46YM
YCytweGtGdHcqAfrVthl84129ZPN422k/voW0sm14gjYlGcTUwgnYlFRk2FLq0Qe
KEDcS0aj3o3EVAQCrayoGzi1pnlIKE3PRGUcUzjGVvzQ/po24gOjwba9Egr/Wmu3
MQlx/7A8zT5QBzF/n+RYdLNQ0Eu6YnUwf0Z1uieqNaon+olyIRFiLb/hCZHO6ekN
f5vrm2clHUbQAYaPQebknujoKBo6ZLHg0WM1gZS01Gz+aUpKsUfOwM0EafmwsAEM
AKiQiZa3yQMmc/h3sDbfVHPSiBA4IMI/NAB7IotzPHq1GzCpsoVILAhF/INbWjxJ
3DbVf+en3/FvdVZg2S38xtnth0njNdlVKpyxm054phKjbdoFDwaknWolS4hrddTm
etSG5/52AjtmPFtlXAk0NmLvfJnW3seXVQbgM7sW/MNXPP5UKDpkGnLhnvej+GU0
s3109sJeXT5ImVdphFs9cvyZyBT9t1PbRowv58EgV0zE4hbAeVkULAbxFV5b/ExT
jjGVHoX7CVhWxvCiTqCUoXZRkUE9C3FnkzEFRkKbYu6NCfiHfEyB3Xyg9hfdrRgj
MRq907zCof+nDtWxGz1MSEuvTj1g9GZ049Bennqzjc/Q+0ovXoK4jm+Py0FiUGUa
A6yhexficjH+kCR/xDbVnWrMhSLB4AuTBT9HjfZI6gk3uYLhoT8Pig4/eVtR2Q1w
ZIJsFToR6ofGuyECwFcs+PUXN7fmGRSiPXgjAr/zIUBdW0VWCE3OGPNqtRk2E5s6
IQARAQABwsD8BBgBCAAmFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sLAFCQWj
moACGwwACgkQZg+p0QLLz9DncQwAg76IehTemLIfrB8T9WIBZrI4kUV7G7a4rjiV
oUiHYN5QwhnbZnsaJDlt+Ezoqy/510eo2bCSzvW5xXYPgyjcuOPwgQo1Qp764Qxy
X6rld2f2RcWkDuBHun55ZWXjby8o21ginPRwruBVYY5rVf3DV1iBu4NurUeHtyFk
/dS0XTOQi2wVUb17sW/+ybCEokdVacZGzOqP/OmwHrF8ylXlXnhQq6e3r+J+T8fu
oGJelm/CJiMwyP6cEWE8sxVqX/iqwjwUYkuOCpE+lOWSvdNHgoEkWR0RXBPQjnGm
LKbfTl/QDXLk6NP2/r9uxm2HL6Ei3QJKSEdrp+XZaVnk/OffO485NOTKwGOxyWb0
06cTMh53xPkAJFQu4Tvdj+odsHz88jqw5wfPG0BYWx0I/FspYj7N9kZR8ULR9nX0
LvpzJ/kB4NgHIUt8YtIL6ZSfM2dbF7fKzvx1UqFfvozJZwFzfEieJLXa4nlGgR6D
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------vI6JgBA3q8y6cDyxiKRcbwGl--

--------------w0AUmbiNtGs0DU4wEQcl2flT--

--------------nWwNd3YfCTqIOB9d3IGnGF0Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoN4QcFAwAAAAAACgkQZg+p0QLLz9A2
2gv+NAvj1fce1RfMtJ5x3tS7hUAWcXJnNQyYDb1Jm2xjDa892NrRBe/fhi7xywo9Gic1lkFeOM0e
hfBWv2CLIfwf+acEZ4aRwRZO3Pj1ots6sTYx1YYG0S42jGKQAapB4SONmjFgRME6ER8UnvqkhiEE
8KLa+3b8dZ0vKiBU4BqbF+zhRUdscf4BmL0ze+e8HjuQ78AU10lOiUo2o88OSDtJgayI7J85sLsd
1a1VAdoFfgdNHcBqn1F7YAB9fiPgivHwRHJPCIWfWWx3etvPqSBpjAU9JBEoM7AQhrpjEiwajwC8
aKo7Nap9v0a4YstYjo9DTmPXclvav8zM5dmjoaJERbVGv1tNBTV5wwtUs1ObAILrqKwdt2sB07le
UhGoBdk34rhWy5iqujLodexFCMbnf7I6T5lTDkw+w2UcxfD/Pn9Axd7Xi70mN3prEjflRQ8NWbf8
ZAEqOvnpJZ83egpCHGRQx9hYBHM8eGuF79zoScHulkltBgU2eynMTpM0d0Pd
=EbGn
-----END PGP SIGNATURE-----

--------------nWwNd3YfCTqIOB9d3IGnGF0Z--

