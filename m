Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sLZbJ6S0Q2oWfgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 14:20:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE14E6E41C7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 14:20:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=hUHZ4nZo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1348799.1606494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weXRr-0005vz-4j; Tue, 30 Jun 2026 12:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348799.1606494; Tue, 30 Jun 2026 12:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weXRr-0005tg-21; Tue, 30 Jun 2026 12:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1348799;
 Tue, 30 Jun 2026 12:20:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1878d948000701b@swg.vates.tech>)
 id 1weXRo-0005ta-Gi
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 12:20:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weXRn-000r7Z-FA
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:20:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1878d948000701b@swg.vates.tech>)
 id 6a43b47f-bab6-0a2a0a5309dd-0a2a4501a36c-2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 14:20:15 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1878d948000701b@swg.vates.tech>)
 id 6a43b479-400f-0a2a45010019-b9ff1c12afe3-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 14:20:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f1878d948000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 30 Jun 2026 12:20:00 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 89C1E86B1F;
 Tue, 30 Jun 2026 14:19:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Agk+6JfzUCy19MJPQ/PTisWNIpeU5qj+wt4VwHOmcj8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=hUHZ4nZocLcOi63i9Vao8trEXTcOfI+ulQnLWSN9TWaZkCv/B/Wxj2fY5TVphrBDt1aGR7+j6
 i5H6B6qRPYHczSbOSVoN6mzYLeKjdIgZrBochPD3fML6E8iNZDOYOrYztInz7mWHATGyBSlSnro
 BXGhmp7H/evBK8n0nSdooxPL/lUypmPeWMEeWnKHShG168QLI7gjxUBpOq0TiljoAWZFh3qrlAa
 2F2UEZ1YC8XV6GV1RKI7xscvfDp4KEOaH1a3NevLLWYVx8tjWv8/ueJRGVOiD8IxyRyKIuh+6X9
 rm+jFhByjqpVcuPTZN5hr6mOmpmQv/hsGCDlFaKKGMIA==
X-Zone-Loop: cdbc533f9d93c2490cbe5e69d4692bd598da06cc1e31
x-campaign-type: default
x-transaction-id: 350282cc-fc8f-4c80-9621-bed13bf29cd6
x-swg-uid: 01-f54344ff-522f-4083-961f-7f9be05ac119
X-Mailer: Sweego
Message-ID:
 <1782822001.8631fc262581453bbf619ec5b2062170.19f1878d948000701b@vates.tech>
x-swg-bid: 1782822001.8631fc262581453bbf619ec5b2062170.19f1878d948000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 30 Jun 2026 14:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] pci: Use pci_sbdf_t in pci_add_device()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
 <b0900c5f-03eb-4b80-9cbd-56368b0ffde7@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <b0900c5f-03eb-4b80-9cbd-56368b0ffde7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VprEeS2xjmgsKupPkx20mQf5"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782821999779
X-purgate-ID: tlsNG-d62444/1782822009-FE0DC1E0-05B193C7/0/0
X-purgate-type: clean
X-purgate-size: 9655
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
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE14E6E41C7

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VprEeS2xjmgsKupPkx20mQf5
Content-Type: multipart/mixed; boundary="------------UMQJuZQ695RxEXOhQVOMtEI8";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Message-ID: <6bb29a5f-5232-4848-a301-9a72b2b73bd0@vates.tech>
Subject: Re: [PATCH v3 02/18] pci: Use pci_sbdf_t in pci_add_device()
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
 <b0900c5f-03eb-4b80-9cbd-56368b0ffde7@suse.com>
In-Reply-To: <b0900c5f-03eb-4b80-9cbd-56368b0ffde7@suse.com>

--------------UMQJuZQ695RxEXOhQVOMtEI8
Content-Type: multipart/mixed; boundary="------------SsZe18FkGHRGrNybpFzTzHXl"

--------------SsZe18FkGHRGrNybpFzTzHXl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMDYvMjAyNiDDoCAxMzo0NCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjkuMDYuMjAyNiAxOToyMSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMNCj4+IEBAIC02NjIsMTIgKzY2MiwxMSBAQCB1bnNpZ25lZCBpbnQgcGNpX3Np
emVfbWVtX2JhcihwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCBwb3MsDQo+PiAgICAg
ICByZXR1cm4gaXM2NGJpdHMgPyAyIDogMTsNCj4+ICAgfQ0KPj4gICANCj4+IC1pbnQgcGNp
X2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwNCj4+IC0gICAgICAgICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXZfaW5mbyAqaW5mbywgbm9kZWlkX3Qgbm9k
ZSkNCj4+ICtpbnQgcGNpX2FkZF9kZXZpY2UocGNpX3NiZGZfdCBzYmRmLCBjb25zdCBzdHJ1
Y3QgcGNpX2Rldl9pbmZvICppbmZvLCBub2RlaWRfdCBub2RlKQ0KPiANCj4gTml0OiBPdmVy
bG9uZyBsaW5lIChsaWtlIGFscmVhZHkgcG9pbnRlZCBvdXQgZm9yIHYyKS4NCj4gDQo+PiAg
IHsNCj4+ICAgICAgIHN0cnVjdCBwY2lfc2VnICpwc2VnOw0KPj4gICAgICAgc3RydWN0IHBj
aV9kZXYgKnBkZXY7DQo+PiAtICAgIHVuc2lnbmVkIGludCBzbG90ID0gUENJX1NMT1QoZGV2
Zm4pLCBmdW5jID0gUENJX0ZVTkMoZGV2Zm4pOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgc2xv
dCA9IHNiZGYuZGV2Zm4sIGZ1bmMgPSBzYmRmLmZuOw0KPiANCj4gQW5kcmV3IHBvaW50ZWQg
b3V0IGFuIGlzc3VlIGhlcmUgZm9yIHYyLCBhbmQgeW91IGFkZHJlc3NlZCBvbmx5IGhhbGYg
b2YgaGlzDQo+IGNvbW1lbnQuDQo+IA0KDQpBaCwgSSBzZWUsIEkgdXNlZCBkZXZmbiBpbnN0
ZWFkIG9mIGRldmljZS4NCkkgZ3Vlc3MgaXQgd291bGQgYmUgYmV0dGVyIHRvIGF2b2lkIHNs
b3QgdnMgZGV2IHdvcmRpbmcgYXMgaXQncyBlYXN5IHRvIA0KZ2V0IHdyb25nLg0KSW4gdGhp
cyBjYXNlLCBJIHRoaW5rIGl0IHdvdWxkIGJlIGV2ZW4gYmV0dGVyIHRvIGRyb3AgdGhpcyB2
YXJpYWJsZSBhcyANCml0J3MgYmFyZWx5IHVzZWQgKG9ubHkgdXNlZCBhdCB0aGUgZW5kIGZv
ciBkaXNwbGF5IGFzIGEgYWxpYXMgZm9yIHNiZGYuZGV2KS4NCg0KPj4gQEAgLTcyOSwxNCAr
NzI3LDE0IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZu
LA0KPj4gICAgICAgICAgICAgICBpZiAoICFwZGV2LT5leHRfY2ZnICkNCj4+ICAgICAgICAg
ICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICIlcHA6IFZGIHdpdGhvdXQgZXh0ZW5kZWQgY29uZmlnIHNwYWNlP1xuIiwNCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmKTsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICZzYmRmKTsNCj4+ICAgICAgICAgICB9DQo+PiAgICAgICB9DQo+PiAg
IA0KPj4gICAgICAgaWYgKCAhcGRldi0+aW5mby5pc192aXJ0Zm4gJiYgIXBkZXYtPnBoeXNm
bi52Zl9ybGVuWzBdICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICB1bnNpZ25lZCBpbnQg
cG9zID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxpdHkocGRldiwgUENJX0VYVF9DQVBfSURfU1JJ
T1YpOw0KPj4gLSAgICAgICAgdWludDE2X3QgY3RybCA9IHBjaV9jb25mX3JlYWQxNihwZGV2
LT5zYmRmLCBwb3MgKyBQQ0lfU1JJT1ZfQ1RSTCk7DQo+PiArICAgICAgICB1aW50MTZfdCBj
dHJsID0gcGNpX2NvbmZfcmVhZDE2KHNiZGYsIHBvcyArIFBDSV9TUklPVl9DVFJMKTsNCj4g
DQo+IFF1b3RpbmcgZnJvbSBteSB2MiByZXBseToNCj4gDQo+ICJBcmUgY2hhbmdlcyBsaWtl
IHRoZXNlIHR3byBhY3R1YWxseSB3b3J0aHdoaWxlIHRvIG1ha2U/IHNiZGYsIGJlaW5nIGEg
ZnVuY3Rpb24NCj4gICBwYXJhbWV0ZXIsIGNhbiBiZSBtb2RpZmllZCBpbiB0aGUgY291cnNl
IG9mIHRoZSBmdW5jdGlvbi4gcGRldi0+c2JkZiwgb3RvaCwNCj4gICBjYW5ub3QgKGZvciBi
ZWluZyBpbiBhIGNvbnN0IHN0cnVjdCBmaWVsZCkuIElmIGZ1cnRoZXIgc2JkZiwgdGhyb3Vn
aG91dCB0aGUNCj4gICBmdW5jdGlvbiwgbmV2ZXIgaGFkIGl0cyBhZGRyZXNzIHRha2VuLCB0
aGUgY29tcGlsZXIgbWF5IGJlIGFibGUgdG8gcHJvZHVjZQ0KPiAgIGJldHRlciBjb2RlLiIN
Cj4gDQoNCkkgbWlzc2VkIGl0OyB0aG91Z2ggSSdtIG5vdCBjb252aW5jZWQgdGhhdCB3b3Vs
ZCB3b3JrLiBXaGlsZSB0aGUgc2JkZiANCmZpZWxkIG9mIHN0cnVjdCBwY2lfZGV2IGlzIGNv
bnN0LCB0aGUgcG9pbnRlciB0byBpdCBpc24ndCwgc28gaW4gdGhlIA0Kc2FtZSByZWdhcmQs
IHRoZSBjb21waWxlciBjYW4gYXNzdW1lIHRoYXQgdGhlIHBkZXYgcG9pbnRlciBjaGFuZ2Vz
IHRodXMgDQpjYW4ndCByZWx5IG9uIHRoZSBjb25zdCBwcm9wZXJ0eSBvZiB0aGUgcGNpX2Rl
djo6c2JkZiBmaWVsZC4NCg0KQSBiZXR0ZXIgYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gbWFy
ayB0aGUgc2JkZiBmdW5jdGlvbiBwYXJhbSBjb25zdC4NCg0KPj4gQEAgLTgxOCwxNCArODE2
LDE0IEBAIG91dDoNCj4+ICAgICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+PiAgICAgICBpZiAo
ICFyZXQgKQ0KPj4gICAgICAgew0KPj4gLSAgICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAi
UENJIGFkZCAlcyAlcHBcbiIsIHR5cGUsICZwZGV2LT5zYmRmKTsNCj4+ICsgICAgICAgIHBy
aW50ayhYRU5MT0dfREVCVUcgIlBDSSBhZGQgJXMgJXBwXG4iLCB0eXBlLCAmc2JkZik7DQo+
PiAgICAgICAgICAgd2hpbGUgKCBwZGV2LT5waGFudG9tX3N0cmlkZSApDQo+PiAgICAgICAg
ICAgew0KPj4gICAgICAgICAgICAgICBmdW5jICs9IHBkZXYtPnBoYW50b21fc3RyaWRlOw0K
Pj4gICAgICAgICAgICAgICBpZiAoIFBDSV9TTE9UKGZ1bmMpICkNCj4+ICAgICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPj4gICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJQ
Q0kgcGhhbnRvbSAlcHBcbiIsDQo+PiAtICAgICAgICAgICAgICAgICAgICZQQ0lfU0JERihz
ZWcsIGJ1cywgc2xvdCwgZnVuYykpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAmUENJX1NC
REYoc2JkZi5zZWcsIHNiZGYuYnVzLCBzbG90LCBmdW5jKSk7DQo+IA0KPiBNeSB2MiByZW1h
cmsgaGVyZSBhbHNvIHdhc24ndCBhZGRyZXNzZWQuIFBsZWFzZSBjYW4geW91IG1ha2Ugc3Vy
ZSB0byBhZGRyZXNzDQo+IF9hbGxfIHJldmlldyBjb21tZW50cyBiZWZvcmUgc2VuZGluZyBh
IG5ldyB2ZXJzaW9uPw0KPiANCj4gSmFuDQoNClRlZGR5DQo=
--------------SsZe18FkGHRGrNybpFzTzHXl
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------SsZe18FkGHRGrNybpFzTzHXl--

--------------UMQJuZQ695RxEXOhQVOMtEI8--

--------------VprEeS2xjmgsKupPkx20mQf5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpDtG8FAwAAAAAACgkQZg+p0QLLz9Cd
6Qv/XnV9O/80y/P7YWoNT4plNMePDMHFOw3uLHvtRYp2Y8rPP/+m7gkwIU6qXVrc6ZMAPR/FQsQw
+VyUfLoNiXELMRm9xlgcaKAjZKdLR6d/xKN5ssaKYTxhKMifzfyNZgp3TJec6SsXr/RKOykvXP/p
R27E/IRnh16ps+5sfRwh5IZWz6GRhNs/cm5RV9JVO68vrV9BpexOPmrm+FzWFmHXogwcP/eg4u32
K+wY8wkUW11cBVTSUyqCt0CRID8cZ5RLqqSZ1YiyIz4nrZX4JGdOISJmxVlsKSX1hhTM7QceypB+
EIesPGHUST730dJ+A9BcvkzRxblGu1VFuNkjX6A6DCHoJRtWbgqe0nvRVUs+mrsDJYUskrz9GLmz
/PUElpKNngi5E0qrMXhLrB4tB9Q2qG2G7/VWsiFxhcSGHPf19pfcF3v+O1b5b58ymQhkpurTW+Oh
b/46w24n6hEjHqBEGwYmiQVPUXuCmtzB4fYdx+xiwmTLhKdJ39OoOlHjBtZ5
=aPUK
-----END PGP SIGNATURE-----

--------------VprEeS2xjmgsKupPkx20mQf5--

