Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6drnKcsmTmq6EAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 12:30:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8AC724581
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 12:30:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=KDjLI2ch;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356834.1611375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whPXq-00027q-SE; Wed, 08 Jul 2026 10:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356834.1611375; Wed, 08 Jul 2026 10:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whPXq-00026D-Ok; Wed, 08 Jul 2026 10:30:22 +0000
Received: by outflank-mailman (input) for mailman id 1356834;
 Wed, 08 Jul 2026 10:30:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4147441400080a8@swg.vates.tech>)
 id 1whPXp-000267-5x
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 10:30:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whPXo-00H7tW-5r
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 12:30:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4147441400080a8@swg.vates.tech>)
 id 6a4e26b8-2eae-0a2a0a5409dd-0a2a4506e2ba-12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 12:30:20 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4147441400080a8@swg.vates.tech>)
 id 6a4e26bb-08de-0a2a45060019-b9ff1c22a247-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 12:30:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4147441400080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 10:30:17 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9343C81EE4;
 Wed,  8 Jul 2026 12:30:16 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=sYV7oRyHzOxksYisaxys1ogzy1ohJHDjvyM76Dd8ZZU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KDjLI2chIxQWavhe2DlA4/bJJMWXivdkoQ8RqLjMNS4PitvcIyYyE4K5EcNLqHuEfrFgzZWNq
 1jWz4z8NjilEVB1UhkY6ajrXkD5bkYyAeJmfe5scM9Ox9HZ2wtC4Qxwao6Snk+vsUnDHayQJDa/
 Kjx58X29J3TsMYWdnJU5urohhn5mx+zyu+swIaSi4bmq7GGEuIMeGLEUFof7+15a9Mf/N2sUFMM
 inI2oQM0WNPdrgFXkKGZre2LLtcDCRi8Zd/tSPs5T83NuNrhbldtvxXaoyzwn0LY0EDWXZnZdQM
 J+9RKdFflxDDajlrzYNJ6lxCmaJdSDp47o2MPXpeDIHw==
X-Zone-Loop: e1d00ca2e706beac235836eb91a9dc47ed045ba10773
x-campaign-type: default
x-transaction-id: ab301ef2-933a-4efe-bd7b-8fa81c8ad215
x-swg-uid: 01-a96d3585-cc1c-479b-82fc-17a192fd5118
X-Mailer: Sweego
Message-ID:
 <1783506617.8631fc262581453bbf619ec5b2062170.19f4147441400080a8@vates.tech>
x-swg-bid: 1783506617.8631fc262581453bbf619ec5b2062170.19f4147441400080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 12:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
 <f4c52bd9-4851-488f-98dc-7188470fd850@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <f4c52bd9-4851-488f-98dc-7188470fd850@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7Sf9yXz00Diw7g5N0asWdX59"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783506616733
X-purgate-ID: tlsNG-16d1c6/1783506620-42F2468D-E8652F65/0/0
X-purgate-type: clean
X-purgate-size: 9071
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:from_mime,vates.tech:email,vates.tech:mid,vates.tech:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D8AC724581

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7Sf9yXz00Diw7g5N0asWdX59
Content-Type: multipart/mixed; boundary="------------zVd89plokHoq5E5M1Pjybozf";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <06aca489-afd0-48d8-9f53-ff2d2a36549f@vates.tech>
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
 <f4c52bd9-4851-488f-98dc-7188470fd850@citrix.com>
In-Reply-To: <f4c52bd9-4851-488f-98dc-7188470fd850@citrix.com>

--------------zVd89plokHoq5E5M1Pjybozf
Content-Type: multipart/mixed; boundary="------------I060FJH4JrVSTQAfO0Ix8OKF"

--------------I060FJH4JrVSTQAfO0Ix8OKF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDcvMjAyNiDDoCAxMTo1NywgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBP
biAwOC8wNy8yMDI2IDEwOjI5IGFtLCBUZWRkeSBBc3RpZSB3cm90ZToNCj4+IExlIDA3LzA3
LzIwMjYgw6AgMjE6NDksIEFuZHJldyBDb29wZXIgYSDDqWNyaXTCoDoNCj4+PiBUaGUgQVBN
IGRlc2NyaXB0aW9uIG9mIHRoZSBBbHRNb3ZDUjggZmVhdHVyZSBiaXQgaXM6DQo+Pj4NCj4+
PiAgwqDCoCAiTE9DSyBNT1YgQ1IwIG1lYW5zIE1PViBDUjgiDQo+Pj4NCj4+PiBBZGp1c3Qg
dGhlIGRlY29kZSBsb2dpYyB0byBiZWhhdmUgbGlrZSB0aGlzLg0KPj4+DQo+Pj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+
PiAtLS0NCj4+PiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+IEND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+PiBDQzogVGVk
ZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQo+Pj4NCj4+PiB2MzoNCj4+PiAg
wqAgKiBDaGFuZ2UgeWV0IGFnYWluLsKgIEEgY29udGFjdCB3aXRoIGluZm9ybWF0aW9uIG9u
IHRoZSBtYXR0ZXINCj4+PiBjb25maXJtZWQgdGhhdA0KPj4+ICDCoMKgwqAgaXQgaXMgYSBz
cGVjaWFsIGNhc2UgZm9yIFJlZyA9IDAsIGFuZCBub3QgYSBnZW5lcmFsIG1vZGlmaWVyIHRv
DQo+Pj4gYWxsIFJlZw0KPj4+ICDCoMKgwqAgdmFsdWVzLg0KPj4+IC0tLQ0KPj4+ICDCoCB4
ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUvZGVjb2RlLmMgfCA2ICsrKy0tLQ0KPj4+ICDCoCAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+DQo+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS9kZWNvZGUuYw0KPj4+
IGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL2RlY29kZS5jDQo+Pj4gaW5kZXggMmMxMzM1
NmM0ZDE3Li41N2Y2YmFmZmIwNjYgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlL2RlY29kZS5jDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRl
L2RlY29kZS5jDQo+Pj4gQEAgLTc4MCwxMiArNzgwLDEyIEBAIGRlY29kZV90d29ieXRlKHN0
cnVjdCB4ODZfZW11bGF0ZV9zdGF0ZSAqcywNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOw0KPj4+ICDCoCDCoMKgwqDCoMKgIGNhc2UgMHgyMDogY2FzZSAweDIyOiAvKiBtb3Yg
dG8vZnJvbSBjciAqLw0KPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIHMtPmxvY2tfcHJlZml4
ICYmIHZjcHVfaGFzX2NyOF9sZWdhY3koKSApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICgg
cy0+bG9ja19wcmVmaXggJiYgdmNwdV9oYXNfY3I4X2xlZ2FjeSgpICYmIHMtPm1vZHJtX3Jl
Zw0KPj4+ID09IDAgKQ0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgew0KPj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHMtPm1vZHJtX3JlZyArPSA4Ow0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHMtPm1vZHJtX3JlZyA9IDg7DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHMtPmxvY2tfcHJlZml4ID0gZmFsc2U7DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCB9DQo+Pj4gLcKgwqDCoMKgwqDCoMKgIC8qIGZhbGwgdGhyb3VnaCAqLw0KPj4+ICvCoMKg
wqDCoMKgwqDCoCBmYWxsdGhyb3VnaDsNCj4+PiAgwqDCoMKgwqDCoCBjYXNlIDB4MjE6IGNh
c2UgMHgyMzogLyogbW92IHRvL2Zyb20gZHIgKi8NCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
IEFTU0VSVChzLT5lYS50eXBlID09IE9QX1JFRyk7IC8qIEVhcmx5IG9wZXJhbmQgYWRqdXN0
bWVudA0KPj4+IGVuc3VyZXMgdGhpcy4gKi8NCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGdl
bmVyYXRlX2V4Y2VwdGlvbl9pZihzLT5sb2NrX3ByZWZpeCwgWDg2X0VYQ19VRCk7DQo+Pg0K
Pj4gSSdtIGZpbmUgd2l0aCBpdDsgdGhvdWdoIHdlIHByb2JhYmx5IHdhbnQgdG8gbWFrZSBz
dXJlIHdlIGFsd2F5cw0KPj4gYWR2ZXJ0aXNlIHRoZSBBbHRNb3ZDcjggZmVhdHVyZSBiaXQg
YXMgQVBNIHN1Z2dlc3QgdXNlcnMgdG8gYWx3YXlzDQo+PiBjaGVjayBmb3IgdGhpcyBiZWZv
cmUgcmVseWluZyBvbiB0aGlzIGJlaGF2aW9yLg0KPj4NCj4+IEludGVyZXN0aW5nbHksIEkg
c2VlIHRoaXMgZmVhdHVyZSBiaXQgc2V0IG9uIEludGVsIGhhcmR3YXJlLg0KPiANCj4gQXJl
IHlvdSBtaXhpbmcgdXAgdGhlIGJhc2ljIGFuZCBleHRlbmRlZCBmZWF0dXJlIGxlYXZlcz/C
oCBJbnRlbCBkb2VzIG5vdA0KPiBoYXZlIHRoaXMgYmVoYXZpb3VyIGFuZCBkb2Vzbid0ICh0
byBteSBrbm93bGVkZ2UpIGFkdmVydGlzZSB0aGUgQ1BVSUQgYml0Lg0KPiANCg0KSSB3YXMg
cmVhZGluZyBhcyAiZGVjaW1hbCIgaW5zdGVhZCBvZiAiaGV4YWRlY2ltYWwiLCBoZW5jZSB0
aGluZ3MgZ290IA0Kc2hpZnRlZCBhIGJpdC4gTG9va3MgbGlrZSBJIHdhc24ndCBmdWxseSB3
b2tlbiB1cCB0aGlzIG1vcm5pbmcuDQoNCj4+IFRob3VnaCwgaXQncyBhIHJlc2VydmVkIGJp
dCBpbiBTRE0sIGFuZCBsb2NrIG1vdiBjcjAgaXMgZGVmaW5lZCBhcw0KPj4gYmVpbmcgI1VE
Lg0KPj4NCj4+IFdoaWNoIENQVSBtb2RlbCBpbnRyb2R1Y2VkIHRoaXMgZmVhdHVyZSBiaXQg
PyBBbmQgZG9lcyBJbnRlbCBiZWhhdmlvcg0KPj4gbWF0Y2hlcyBBTUQncyBzcGVjID8NCj4g
DQo+IFRoYXQgd2FzIGluIHRoZSB2MiBjb21taXQgbWVzc2FnZSwgYnV0IEkgdG9vayBpdCBv
dXQgaGVyZS4NCj4gDQo+IEFNRCBLOCBSZXYgRi7CoCBQcmlvciBLOCByZXZpc2lvbnMgZGlk
bid0IGhhdmUgaXQuDQo+IA0KDQpPayB0aGFua3MuDQoNCj4gfkFuZHJldw0KDQoNClRoYXQg
bG9va3MgZ29vZCB0byBtZS4gQXMgYSBmb2xsb3ctdXAgcGF0Y2gsIGl0IG1pZ2h0IGJlIHdv
cnRoIHJlbmFtaW5nIA0KY3I4X2xlZ2FjeSBpbnRvIGFsdF9tb3ZfY3I4IHRvIGJldHRlciBt
YXRjaCBBUE0gdGVybWlub2xvZ3kuDQoNClJldmlld2VkLWJ5OiBUZWRkeSBBc3RpZSA8dGVk
ZHkuYXN0aWVAdmF0ZXMudGVjaD4NCg0K
--------------I060FJH4JrVSTQAfO0Ix8OKF
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------I060FJH4JrVSTQAfO0Ix8OKF--

--------------zVd89plokHoq5E5M1Pjybozf--

--------------7Sf9yXz00Diw7g5N0asWdX59
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpOJrgFAwAAAAAACgkQZg+p0QLLz9B6
qAv/enxmT+RMCzEuw6iRZrXH0QeLLGV4nYeEC3BF3+u3cQ/NqYrvS4gyfzlc/muJ4MnJPt8tMXxS
xfAhnqAwI++IMESwywhLFtvhF7NglWE8nDKnnaQq79F6zCHHbd8Z3BPCxMoENizsDPUuS0+mxMxh
G7h6N5V+EQqInnI9vB8NvoFg5FFGv7Gr8L02XRjBvmJo8lYgQ6vDFnEUmtPv+q7JvPwULDEi+GRB
vY/bHOdUiFXdcxmIpXXBA41JsfzIdFH2XNrU/tRhSsoBzkFJ7h6Edq/+RHg29CGlT+uMN1KpOET0
OnMEVdd+T1Y+jHhJbgCS+WmQrLJ65BESYED9dsX5RQSEeG+Vwd0VBel8NIjhvvJl6fRGgmEW0tgt
N3AcAJCAYJ/fdvmVYmPRp5AqTEPwk/fbIky2p/+P8Sj0jfNkdEgsp6yitysO8M7Iu+PissnMaPxB
aZ+lbYAaKBP78qVAJUvxYNd38p65LaZY9cwHPfCVjDG3EdzfvdY4uG5l3+2j
=upmi
-----END PGP SIGNATURE-----

--------------7Sf9yXz00Diw7g5N0asWdX59--

