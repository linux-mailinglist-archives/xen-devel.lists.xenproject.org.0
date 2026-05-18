Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHtcGJtKC2o7FQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 19:21:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EDF5718DA
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 19:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312173.1582339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP1df-0002QH-G6; Mon, 18 May 2026 17:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312173.1582339; Mon, 18 May 2026 17:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP1df-0002OX-D6; Mon, 18 May 2026 17:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1312173;
 Mon, 18 May 2026 17:20:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@swg.vates.tech>)
 id 1wP1de-0002OR-H1
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:20:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP1dd-009CLD-TP
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 19:20:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@swg.vates.tech>)
 id 6a0b4a3e-bab6-0a2a0a5309dd-0a2a450c92fa-48
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 19:20:21 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@swg.vates.tech>)
 id 6a0b4a55-62f1-0a2a450c0019-b9ff1c2292af-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 19:20:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e3c1a4a3e000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 17:20:16 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id A244E862B6;
 Mon, 18 May 2026 19:20:15 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=hra9r/K7igTQFEEyjuEvXlR5DPULI1rg28Vp8J2SGCc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=kUX/B+Zab2MOGdzdLl8xorHiE3bocZ2W5/i3+s9YFD14pkgUcdSSNIheZpgtQnaqmb1o7JcbI
 dv8WBUvXEK2iMxBuzR69hYAIRFwkOEEidPkGA34Gm0Mp0snC4CU2bmEx0qEpyTGPlOi6t9iijaI
 dYLxeX4tHRydCFNAH/cmwVYBOvIEVJsM1RUMCPg/C3M6VFfbWZhWpHAmD0BPx4SwQ1fgGl94Eh1
 rDCpfznW3wDzpKpZttUvD6xfKmCYdqP0e0v7hUIleEori4VB1LMOcIw3KO8OuoDmJWj1eunYs+v
 IRIPyzoyv7Y9UA55rP42DBPaPXG5fsspZed1bkUbfi6Q==
X-Zone-Loop: a6ca151f86f1954769f84cd7dba69e910b8496af4835
x-campaign-type: default
x-transaction-id: 027ce0ef-2aac-4fc7-bfa1-bd925e781530
x-swg-uid: 01-919c3f49-d901-4964-b27c-2c025e2667e7
X-Mailer: Sweego
Message-ID:
 <1779124816.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@vates.tech>
x-swg-bid: 1779124816.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 18 May 2026 19:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Small PCI refactoring
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <cover.1779116255.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <cover.1779116255.git.teddy.astie@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wsDScAUdj85lIBzS7DRc1Uw9"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779124815832
X-purgate-ID: tlsNG-d25034/1779124821-F5585CF5-002AD657/0/0
X-purgate-type: clean
X-purgate-size: 11125
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
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B6EDF5718DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wsDScAUdj85lIBzS7DRc1Uw9
Content-Type: multipart/mixed; boundary="------------eViBguofPDE0pRtXSMXpjhGo";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <70b597da-e564-4f97-b22d-a647b6497a0d@vates.tech>
Subject: Re: [PATCH 0/5] Small PCI refactoring
References: <cover.1779116255.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1779116255.git.teddy.astie@vates.tech>

--------------eViBguofPDE0pRtXSMXpjhGo
Content-Type: multipart/mixed; boundary="------------zvnv6f4a0PpngRFwpPYNjlmx"

--------------zvnv6f4a0PpngRFwpPYNjlmx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTgvMDUvMjAyNiDDoCAxNzoyMiwgVGVkZHkgQXN0aWUgYSDDqWNyaXTCoDoNCj4gVGhl
IGdvYWwgb2YgdGhpcyBzZXJpZXMgaXMgdG8gbWFrZSBzb21lIHJlZmFjdG9yaW5nIG9mIHNv
bWUNCj4gcGNpIHByaW1pdGl2ZXMgdG8gaW1wcm92ZSBjb2RlZ2VuIGFuZCBtYWtlIGNvZGUg
bGVzcyB2ZXJib3NlLg0KPiANCj4gQSBiaWcgY2h1bmsgb2YgaXQgaXMgY29udmVydGluZyBt
YW55IHBsYWNlcyB3aGVyZSAoc2VnLCBidXMsIGRldiwgZm4pDQo+IGlzIHNwbGl0IGludG8g
bXVsdGlwbGVzIHZhcmlhYmxlcyBhbmQgY29udmVydCBpdCBpbnRvIGJlaW5nIGp1c3QNCj4g
cGNpX3NiZGZfdCwgaW4gcGFydGljdWxhciBpbiBzb21lIFBDSSBmdW5jdGlvbiBwYXJhbWV0
ZXJzIHRvIHJlZHVjZQ0KPiBwYXJhbWV0ZXIgY291bnQgd2hpY2ggdXN1YWxseSB0cmFuc2xh
dGUgaW50byBsZXNzIHJlZ2lzdGVycyB0byBwYXNzDQo+IHRvIHRoZSBmdW5jdGlvbi4gTW9y
ZW92ZXIsIHdlIGFsc28gYXZvaWQgdHJhbnNsYXRpbmcgYmFjayBhbmQgZm9ydGgNCj4gYmV0
d2VlbiBwY2lfc2JkZl90IGFuZCBpbmRpdmlkdWFsIChzZWcsIGJ1cywgZGV2LCBmbikuDQo+
IA0KPiBMYXRlc3QgcGF0Y2ggYXR0ZW1wdHMgdG8gaW1wcm92ZSBjb2RlZ2VuIG9mIHBjaV9j
b25mX3tyZWFkLHdyaXRlfU4oKQ0KPiBieSBtYWtpbmcgdGhlbSBpbmxpbmUgc3BlY2lhbGl6
ZWQgdmFyaWFudHMgb2YgcGNpX21tY2ZnX3tyZWFkLHdyaXRlfSgpDQo+IGluIG9yZGVyIHRv
IGVsaW1pbmF0ZSBhIHBhcnRpY3VsYXIgYHN3aXRjaCAobGVuKWAgYXQgY29tcGlsZSB0aW1l
Lg0KPiANCj4gTm8gaW50ZW5kZWQgZnVuY3Rpb25hbCBjaGFuZ2UsIGFzaWRlIHNvbWUgcGFy
dHMgb2YgdGhlIGNvZGViYXNlIHRoYXQgd2lsbA0KPiBub3cgY29ycmVjdGx5IGhhbmRsZSBQ
Q0kgc2VnbWVudCB3aGVuIHBhcnNlZCB3aGlsZSBpdCB3YXMgcHJldmlvdXNseQ0KPiBpZ25v
cmVkIChlLmcgZGJncCkuDQo+IA0KPiBCbG9hdC1vLW1ldGVyIGlzIHByZXR0eSB0ZWxsaW5n
DQo+IA0KPiBhZGQvcmVtb3ZlOiA0LzIgZ3Jvdy9zaHJpbms6IDExLzE0IHVwL2Rvd246IDUy
OS8tMTQ3MCAoLTk0MSkNCj4gRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQ0KPiBwY2lfbW1jZmdfYmFzZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0gICAgIDEwNiAgICArMTA2DQo+IHBhcnNlX3Bj
aV9zYmRmX3NlZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSAgICAgIDg4ICAgICAr
ODgNCj4gcGFyc2VfcGNpX3NiZGYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
ICAgICAgODUgICAgICs4NQ0KPiBwY2lfZGV2X2Jhc2UgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0gICAgICA1NiAgICAgKzU2DQo+IHBjaV9jb25mX3JlYWQxNiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA5MiAgICAgMTE4ICAgICArMjYNCj4gcGNpX2Nv
bmZfcmVhZDggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDkyICAgICAxMTcgICAg
ICsyNQ0KPiBlaGNpX2RiZ3BfaW5pdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA2
MjkgICAgIDY1MiAgICAgKzIzDQo+IHBjaV9jb25mX3JlYWQzMiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA5NCAgICAgMTE2ICAgICArMjINCj4gcGNpX2NvbmZfd3JpdGUzMiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDg4ICAgICAxMDkgICAgICsyMQ0KPiBzeW1i
b2xzX25hbWVzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMDY0MzUgIDEwNjQ1MiAg
ICAgKzE3DQo+IHN5bWJvbHNfc29ydGVkX29mZnNldHMgICAgICAgICAgICAgICAgICAgICA1
OTY3MiAgIDU5Njg4ICAgICArMTYNCj4gcGNpX2NvbmZfd3JpdGUxNiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDk0ICAgICAxMDkgICAgICsxNQ0KPiBwY2lfY29uZl93cml0ZTgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOTQgICAgIDEwOCAgICAgKzE0DQo+IHJl
c2VydmVfdW5pdHlfbWFwX2Zvcl9kZXZpY2UgICAgICAgICAgICAgICAgIDQzNCAgICAgNDQ1
ICAgICArMTENCj4gc3ltYm9sc19vZmZzZXRzICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDMxOTIwICAgMzE5MjQgICAgICArNA0KPiBtbWNmZ19pbnRlcmNlcHRfd3JpdGUgICAgICAg
ICAgICAgICAgICAgICAgICAxOTQgICAgIDE5MyAgICAgIC0xDQo+IGFkZF9vbmVfdXNlcl9y
bXJyICAgICAgICAgICAgICAgICAgICAgICAgICAgIDY1MyAgICAgNjQ0ICAgICAgLTkNCj4g
X19maW5kX2RiZ3AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDg3ICAgICAg
NjAgICAgIC0yNw0KPiBwY2lfZGV2aWNlX2RldGVjdCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgODkgICAgICA1NSAgICAgLTM0DQo+IHBjaV9tbWNmZ193cml0ZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDE5NyAgICAgMTUyICAgICAtNDUNCj4gX3NjYW5fcGNpX2Rl
dmljZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjg2ICAgICAyNDEgICAgIC00NQ0K
PiBwYXJzZV9pdnJzX2lvYXBpYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAyOTIgICAg
IDIzNSAgICAgLTU3DQo+IHBhcnNlX3JtcnJfcGFyYW0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDQ4NCAgICAgNDIwICAgICAtNjQNCj4gcmVnaXN0ZXJfb25lX3JtcnIgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMzg5ICAgICAzMjQgICAgIC02NQ0KPiBwYXJzZV9pdnJz
X2hwZXQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyNDkgICAgIDE4NCAgICAgLTY1
DQo+IHBhcnNlX2l2bWRfcGFyYW0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIDY1MSAg
ICAgNTcwICAgICAtODENCj4gYWNwaV9wYXJzZV9kbWFyICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAyNjI1ICAgIDI1MjAgICAgLTEwNQ0KPiBnZXRfdmlydCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAxMDYgICAgICAgLSAgICAtMTA2DQo+IHBjaV9tbWNm
Z19yZWFkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE4OSAgICAgICAtICAgIC0x
ODkNCj4gbnMxNjU1MF9pbml0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAzMjA1
ICAgIDMwMDIgICAgLTIwMw0KPiBhY3BpX3BhcnNlX2Rldl9zY29wZSAgICAgICAgICAgICAg
ICAgICAgICAgIDE0NjUgICAgMTA5MSAgICAtMzc0DQo+IA0KPiBUZWRkeSBBc3RpZSAoNSk6
DQo+ICAgIHBjaTogSW50cm9kdWNlIHBhcnNlX3BjaV9zYmRme19zZWd9KCkNCj4gICAgdnRk
OiBVc2UgcGNpX3NiZGZfdCBpbiBhY3BpX3BhcnNlX2Rldl9zY29wZSgpDQo+ICAgIHBjaTog
VXNlIHBjaV9zYmRmX3QgaW4gcGNpX2RldmljZV9kZXRlY3QoKQ0KPiAgICBwY2k6IFBhcnNl
IGludG8gcGNpX3NiZGZfdCBkaXJlY3RseQ0KPiAgICBSRkM6IHBjaTogTWlncmF0ZSBwY2lf
bW1jZmdfe3JlYWQsd3JpdGV9KCkgdG8gcGNpLmMNCj4gDQo+ICAgeGVuL2FyY2gveDg2L3B2
L3JvLXBhZ2UtZmF1bHQuYyAgICAgICAgICB8ICAgMyArLQ0KPiAgIHhlbi9hcmNoL3g4Ni94
ODZfNjQvbW1jb25maWcuaCAgICAgICAgICAgfCAgNDMgLS0tLS0tLS0NCj4gICB4ZW4vYXJj
aC94ODYveDg2XzY0L21tY29uZmlnXzY0LmMgICAgICAgIHwgMTA2ICsrKystLS0tLS0tLS0t
LS0tLS0tDQo+ICAgeGVuL2FyY2gveDg2L3g4Nl82NC9wY2kuYyAgICAgICAgICAgICAgICB8
IDEyMiArKysrKysrKysrKysrKysrKysrKystLQ0KPiAgIHhlbi9kcml2ZXJzL2NoYXIvZWhj
aS1kYmdwLmMgICAgICAgICAgICAgfCAgMzUgKysrLS0tLQ0KPiAgIHhlbi9kcml2ZXJzL2No
YXIvbnMxNjU1MC5jICAgICAgICAgICAgICAgfCAgMjQgKystLS0NCj4gICB4ZW4vZHJpdmVy
cy9jaGFyL3hoY2ktZGJjLmMgICAgICAgICAgICAgIHwgICA2ICstDQo+ICAgeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYyB8ICAyNiArKy0tLQ0KPiAgIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgICAgICAgICAgfCAgMTYgKy0tDQo+ICAgeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYyAgICAgICB8ICA4MCArKysrKystLS0t
LS0tLS0NCj4gICB4ZW4vZHJpdmVycy9wY2kvcGNpLmMgICAgICAgICAgICAgICAgICAgIHwg
IDE4ICsrKysNCj4gICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAgICAgICAgICAg
IHwgIDExICstDQo+ICAgMTIgZmlsZXMgY2hhbmdlZCwgMjQzIGluc2VydGlvbnMoKyksIDI0
NyBkZWxldGlvbnMoLSkNCj4gDQoNClRoZXJlIGFyZSBzb21lIGlzc3VlcyB3aXRoIG91ciBt
YWlsIHByb3ZpZGVyIGZvciB0aGUgY292ZXIgbGV0dGVyIGFuZCANCnNvbWUgd2hpdGVzcGFj
ZSBpc3N1ZXMgaW4gb25lIG9mIHRoZSBwYXRjaCwgd2lsbCByZXNlbmQgdG9tb3Jyb3cgDQoo
aG9wZWZ1bGx5IGNvcnJlY3RseSB0aGlzIHRpbWUpLg0KDQpUZWRkeQ0K
--------------zvnv6f4a0PpngRFwpPYNjlmx
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------zvnv6f4a0PpngRFwpPYNjlmx--

--------------eViBguofPDE0pRtXSMXpjhGo--

--------------wsDScAUdj85lIBzS7DRc1Uw9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoLSk8FAwAAAAAACgkQZg+p0QLLz9DK
ywwAkatCCt3kig4rV6kGwkbHQfs5ImENXC0GfqBHWNEDv1aDZRYY9uV8Xy3cLQr266VMliaa7qTW
JAYOYX+JlLR2qeTHTRY+Yt8w4hkcuZbBoFNOShHNUVMXoBCXUfsFOgwwQfeg99lmzZEIPpuANJcu
JI9BUX7oe4c2tSYDrnEimHMuXLzze+vy7HUbxotOLv/tVCPDuWHl9cHZag1Qdx5DFFdxWw5qY3rx
yzFRvEZv28/U/qMNhSm2rRq8vNHX+udw9+In8+HMvFH3lsJtxyXvPO4t+4UXHxLT6cQWny+6Wg8w
pgT12op4yJCJ4gH7kHhal6BErGXG4ijrWRwMLN+vdR7FMEXAiMX311wJ8RFTjAxetz9+jtEFXhF5
TeN9QsXZwZ3GwirG5yT0i0zz48Esppirwry63itcX3uedMHkuo+7KT76w2W3vyowkOTH4AJvbPGJ
5FdnRCa0afUbXm/sssMX6eRP/fOEKDrsRzB2IaKoUjOdNxxZEw/njQ+q7Uhe
=vSDr
-----END PGP SIGNATURE-----

--------------wsDScAUdj85lIBzS7DRc1Uw9--

