Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP/uBTbA+WlADAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:02:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85E4CA596
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300428.1574957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCbS-00024i-IU; Tue, 05 May 2026 10:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300428.1574957; Tue, 05 May 2026 10:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCbS-00023A-Fk; Tue, 05 May 2026 10:02:10 +0000
Received: by outflank-mailman (input) for mailman id 1300428;
 Tue, 05 May 2026 10:02:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df7967376000f373@swg.vates.tech>)
 id 1wKCbQ-000234-ID
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:02:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCbP-004Vqs-Gt
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:02:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df7967376000f373@swg.vates.tech>)
 id 69f9c01e-e002-0a2a0a5209dd-0a2a4505ddd8-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:02:07 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df7967376000f373@swg.vates.tech>)
 id 69f9c01f-aaa8-0a2a45050019-b9ff1c2298bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:02:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19df7967376000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 05 May 2026 10:02:05 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id C7A1E80FC6;
 Tue,  5 May 2026 12:02:04 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9EKhUjDGkc0lKvm0VFMt5U/6Pn0SUg0vhtKq20wqv04=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=hPfzH9OymzsTBOF1Hj3uMDjBB94XY1zlMfyOAOcSi4EdGiC/JB4fZyV5nC3VhBAevN27d3NEZ
 YSWYBOlyzoilNWUdG0uY2/UIZR9KZyMcMKpTaJh6+Qkxf1pTOtZR0AgRXqz1uUpzoWxajeOIF3H
 zHmVK/zZf2G92/zz79MaUJbkL4EvWfhLyN6RC5B4nJfgy9Yxwwgc10kkzw/kkj1UoEDLcK9UnaF
 dLWCcMB1ajC7lYpZl6Z5sdWwFrgFnYzxtDr3FQZ8O9q78l8mZ47IA59LIVGWvgLdSH48gFtN9FG
 t/zWGHiHXsb6bT9VbQ7l2LVojwNFyGM9DGakYC2wM3Dg==
X-Zone-Loop: 3c645d950c25f51d5696d2956fab20b3754c1770632e
x-campaign-type: default
x-transaction-id: 8b8a0012-926f-4cbd-b0ac-ac8375a083a5
x-swg-uid: 01-b6927106-73c9-4261-9f1e-b8906e19fc75
X-Mailer: Sweego
Message-ID:
 <1777975325.8631fc262581453bbf619ec5b2062170.19df7967376000f373@vates.tech>
x-swg-bid: 1777975325.8631fc262581453bbf619ec5b2062170.19df7967376000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 5 May 2026 12:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Disable interrupts when establishing SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260505084315.1350002-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260505084315.1350002-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d5LENjm7gWSBOfIrz7H8vIUy"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777975324915
X-purgate-ID: tlsNG-c201ff/1777975327-E81A9443-EE0A9D78/0/0
X-purgate-type: clean
X-purgate-size: 9913
X-Rspamd-Queue-Id: 6C85E4CA596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email,vates.tech:dkim,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d5LENjm7gWSBOfIrz7H8vIUy
Content-Type: multipart/mixed; boundary="------------RPqqEVBnck7zQ25taWQJJjep";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <bd84f288-7a95-411f-8f02-36eefeed11ed@vates.tech>
Subject: Re: [PATCH v2] x86/boot: Disable interrupts when establishing SSP
References: <20260505084315.1350002-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260505084315.1350002-1-andrew.cooper3@citrix.com>

--------------RPqqEVBnck7zQ25taWQJJjep
Content-Type: multipart/mixed; boundary="------------GSm3FYIZ18c0K6XG6dIKNTig"

--------------GSm3FYIZ18c0K6XG6dIKNTig
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDUvMDUvMjAyNiDDoCAxMDo0NiwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBH
aXRsYWIgQ0kgcmVwb3J0ZWQgYSBjcmFzaCBvbiBib290IG9uIEFsZGVyIExha2UgaGFyZHdh
cmUuICBUaGUgYnVnIGlzIHllYXJzDQo+IG9sZCwgbWFraW5nIGl0IGFuIGluY3JlZGlibHkg
cmFyZSBvY2N1cmFuY2U6DQo+IA0KPiAgICAoWEVOKSAqKiogRE9VQkxFIEZBVUxUICoqKg0K
PiAgICAoWEVOKSAtLS0tWyBYZW4tNC4yMi11bnN0YWJsZSAgeDg2XzY0ICBkZWJ1Zz15IHVi
c2FuPXkgIE5vdCB0YWludGVkIF0tLS0tDQo+ICAgIChYRU4pIENQVTogICAgMA0KPiAgICAo
WEVOKSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDQwNzdiYmM0Pl0gYXJjaC94ODYvc2V0dXAu
YyNyZWluaXRfYnNwX3N0YWNrKzB4ZmEvMHgxNjANCj4gICAgKFhFTikgUkZMQUdTOiAwMDAw
MDAwMDAwMDEwMjAyICAgQ09OVEVYVDogaHlwZXJ2aXNvcg0KPiAgICAoWEVOKSByYXg6IDAw
MDAwMDAwMDAwMDAwMDcgICByYng6IGZmZmY4MzA0OWE0YjAwMDAgICByY3g6IDAwMDAwMDAw
MDAwMDA2YTINCj4gICAgKFhFTikgcmR4OiAwMDAwMDAwMDAwMDAwMDAwICAgcnNpOiAwMDAw
MDAwMDAwMDAwMDAwICAgcmRpOiAwMDAwMDAwMDAwMDAwMDAwDQo+ICAgIChYRU4pIHJicDog
ZmZmZjgzMDQ5YTRiN2YwMCAgIHJzcDogZmZmZjgzMDQ5YTRiN2VmOCAgIHI4OiAgZmZmZjgz
MDQ5N2U0NzAwMA0KPiAgICAoWEVOKSByOTogIDAwMDAwMDAwZmZmZmZmZmYgICByMTA6IDAw
MDAwMDAwOTAwYzIxMjEgICByMTE6IDAwMDAwMDAwOWEzOTI5NTYNCj4gICAgKFhFTikgcjEy
OiBmZmZmODMwNDk3ZTQ3MDAwICAgcjEzOiBmZmZmODMwNDk3ZTQ5ZjQwICAgcjE0OiAwMDAw
MDAwMDAwMDAwMDAwDQo+ICAgIChYRU4pIHIxNTogZmZmZjgyZDA0MDdkYWQxMCAgIGNyMDog
MDAwMDAwMDA4MDA1MDAzMyAgIGNyNDogMDAwMDAwMDAwMGY1MjZlMA0KPiAgICAoWEVOKSBj
cjM6IDAwMDAwMDAwNDNjMTYwMDAgICBjcjI6IGZmZmZmZmZmZmZmZmZmZmMNCj4gICAgKFhF
TikgZnNiOiAwMDAwMDAwMDAwMDAwMDAwICAgZ3NiOiAwMDAwMDAwMDAwMDAwMDAwICAgZ3Nz
OiAwMDAwMDAwMDAwMDAwMDAwDQo+ICAgIChYRU4pIGRzOiAwMDAwICAgZXM6IDAwMDAgICBm
czogMDAwMCAgIGdzOiAwMDAwICAgc3M6IDAwMDAgICBjczogZTAwOA0KPiAgICAoWEVOKSBY
ZW4gY29kZSBhcm91bmQgPGZmZmY4MmQwNDA3N2JiYzQ+IChhcmNoL3g4Ni9zZXR1cC5jI3Jl
aW5pdF9ic3Bfc3RhY2srMHhmYS8weDE2MCk6DQo+ICAgIChYRU4pICAwMCBiOSBhMiAwNiAw
MCAwMCAwZiAzMCA8ODA+IDNkIDcxIDI2IGYxIGZmIDAwIDc0IDNlIDQ4IDhkIDkzIGY4IDVm
IDAwIDAwDQo+ICAgIChYRU4pIFZhbGlkIHN0YWNrIHJhbmdlOiBmZmZmODMwNDlhNGI2MDAw
LWZmZmY4MzA0OWE0YjgwMDAsIHNwPWZmZmY4MzA0OWE0YjdlZjgsIHRzcy5yc3AwPWZmZmY4
MzA0OWE0YjdmYjANCj4gICAgKFhFTikgTm8gc3RhY2sgb3ZlcmZsb3cgZGV0ZWN0ZWQuIFNr
aXBwaW5nIHN0YWNrIHRyYWNlLg0KPiAgICAoWEVOKQ0KPiAgICAoWEVOKSAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ICAgIChYRU4pIFBhbmljIG9uIENQ
VSAwOg0KPiAgICAoWEVOKSBET1VCTEUgRkFVTFQgLS0gc3lzdGVtIHNodXRkb3duDQo+ICAg
IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gDQo+
IFRoaXMgaXMgb24gdGhlIGluc3RydWN0aW9uIGJvdW5kYXJ5IGFmdGVyIGVuYWJsaW5nIENF
VCAod3JpdGluZyBNU1JfU19DRVQpIGFuZA0KPiBwcmlvciB0byBlc3RhYmxpc2hpbmcgU1NQ
LiAgRGVzcGl0ZSBpZGVudGlmeWluZyB0aGlzIGFzIGEgY3JpdGljYWwgd2luZG93DQo+IHdo
ZXJlIGFueSBmYXVsdCB3YXMgZGVhZGx5ICh0aGUgQ1BVIHRyaWVzIHRvIHB1c2ggYSBzaGFk
b3cgc3RhY2sgZnJhbWUgYXQgMCwNCj4gaGVuY2UgdGhlIENSMiB2YWx1ZSB3cmFwcGluZyBh
cm91bmQgdG8gdGhlIHRvcCBvZiB0aGUgYWRkcmVzcyBzcGFjZSksIEkNCj4gY2xlYXJseSBm
b3Jnb3QgdGhhdCB0aGlzIG1lYW50IGludGVycnVwdHMgdG9vLCB3aGljaCBhcmUgZW5hYmxl
ZC4NCj4gDQo+IERpc2FibGUgaW50ZXJydXB0cyBkdXJpbmcgdGhlIGNyaXRpY2FsIHBlcmlv
ZC4NCj4gDQo+IEZpeGVzOiBiNjBhYjQyZGIyZjAgKCJ4ODYvc2hzdGs6IEFjdGl2YXRlIFN1
cGVydmlzb3IgU2hhZG93IFN0YWNrcyIpDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDQzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQo+IENDOiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMu
dGVjaD4NCj4gDQo+IHYyOg0KPiAgICogT25seSBkaXNhYmxlIHJlZ3VsYXIgaW50ZXJydXB0
cy4gIE5NSXMgYXJlIGZpbmUuDQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9zZXR1cC5jIHwg
OSArKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0
dXAuYw0KPiBpbmRleCBkMDQxY2JkNWY2ZjEuLjE5ZWU4NTdhYmZiOCAxMDA2NDQNCj4gLS0t
IGEveGVuL2FyY2gveDg2L3NldHVwLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMN
Cj4gQEAgLTkwOCw2ICs5MDgsMTMgQEAgc3RhdGljIHZvaWQgX19pbml0IG5vcmV0dXJuIHJl
aW5pdF9ic3Bfc3RhY2sodm9pZCkNCj4gICANCj4gICAgICAgaWYgKCBjcHVfaGFzX3hlbl9z
aHN0ayApDQo+ICAgICAgIHsNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogSW1tZWRp
YXRlbHkgYWZ0ZXIgZW5hYmxpbmcgQ0VULCBTU1AgaXMgMCBhbmQgbW9zdCBpbnRlcnJ1cHRz
IGFuZA0KPiArICAgICAgICAgKiBleGNlcHRpb25zIGFyZSBmYXRhbC4gIExpa2UgdGhlIFNZ
U0NBTEwvU1lTRU5URVIgZ2FwcywgSVNUIHZlY3RvcnMNCj4gKyAgICAgICAgICogKGluY2x1
ZGluZyBOTUkgYW5kICNNQykgYXJlIHNhZmUgb3dpbmcgdG8gSVNUIHN3aXRjaGluZyB0aGUg
c2hzdGsuDQo+ICsgICAgICAgICAqLw0KPiArICAgICAgICBsb2NhbF9pcnFfZGlzYWJsZSgp
Ow0KPiArDQo+ICAgICAgICAgICB3cm1zcmwoTVNSX1NfQ0VULCB4ZW5fbXNyX3NfY2V0X3Zh
bHVlKCkpOw0KPiAgIA0KPiAgICAgICAgICAgLyoNCj4gQEAgLTkzMiw2ICs5MzksOCBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgbm9yZXR1cm4gcmVpbml0X2JzcF9zdGFjayh2b2lkKQ0KPiAg
ICAgICAgICAgfQ0KPiAgICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgIGFzbSB2b2xh
dGlsZSAoICJzZXRzc2JzeSIgOjo6ICJtZW1vcnkiICk7DQo+ICsNCj4gKyAgICAgICAgbG9j
YWxfaXJxX2VuYWJsZSgpOw0KPiAgICAgICB9DQo+ICAgDQo+ICAgICAgIHJlc2V0X3N0YWNr
X2FuZF9qdW1wKGluaXRfZG9uZSk7DQo+IA0KPiBiYXNlLWNvbW1pdDogZjRhZjU3MWRkNzBi
ZWE5N2Q4ZGU4MmQ3YWEzOWM2MmM1MzBkYjg5Nw0KDQpSZXZpZXdlZC1ieTogVGVkZHkgQXN0
aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQoNCihhbHNvIHRha2luZyB0aGUgb3Bwb3J0
dW5pdHkgdG8gdGVzdCBPcGVuUEdQIHNpZ25pbmcgdG8gYXZvaWQgbWFpbCANCnByb3ZpZGVy
IGlzc3VlcykNCg0KVGVkZHkNCg==
--------------GSm3FYIZ18c0K6XG6dIKNTig
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------GSm3FYIZ18c0K6XG6dIKNTig--

--------------RPqqEVBnck7zQ25taWQJJjep--

--------------d5LENjm7gWSBOfIrz7H8vIUy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5wBwFAwAAAAAACgkQZg+p0QLLz9Da
KAwAlvGaSIAJfhRj9NcovpOyYV48T3Lyx/rDS8XqNymEovmSeCz+IiILgeOUjOSXwUyOreSF9QtD
QTB5Ue/mEHSsRm2Snr7LSAgGQtsAQmUZXxk2ZTvBTvYTaTB854ijV1GZiLc3XmWsjxSKoBw4SSL2
qrVddhx6RtlsrRL6IARsT98OLg1edpicjbY3NtosJf8WeleAytJpGwvO3mg+V4fQlI4BTpW7nFrm
6BUNGi2a97grC8T/16bOwHmINEYHN/YGvKJVY0Nndz14oaplrIw53XTI0p/ceqgMVehWgAgWD8Ni
j0tGzlLsGDzsNaAFTd/rsulmpjgHwmC0tviWuRv9VZodj2S+8yg4TrxDZAvMYq5/Y4wtOO+iK70f
RTEiVWZjwX3eUjXq5kxMdb5wGA9HNL6fX4uvEdlQ6XNrA9kBX7IlAv+5/uf8XEK2Y9jHJQWOruBf
qv6WfDWAsq4BtRehdST036LWAyk/OI6cq8BDzCgESn9cvAAC4Qmo6F0fVAAb
=3Xki
-----END PGP SIGNATURE-----

--------------d5LENjm7gWSBOfIrz7H8vIUy--

