Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RZmdAthTMWqCgwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:47:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684D690133
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:47:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=ijSBlGez;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1339245.1600399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZU7d-0004J8-9y; Tue, 16 Jun 2026 13:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339245.1600399; Tue, 16 Jun 2026 13:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZU7d-0004Hj-71; Tue, 16 Jun 2026 13:46:33 +0000
Received: by outflank-mailman (input) for mailman id 1339245;
 Tue, 16 Jun 2026 13:46:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ed0aee98a000701b@swg.vates.tech>)
 id 1wZU7b-0004Hd-G3
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:46:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZU7a-0063wm-Hz
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:46:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ed0aee98a000701b@swg.vates.tech>)
 id 6a3153af-e002-0a2a0a5209dd-0a2a450cc390-32
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:46:30 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ed0aee98a000701b@swg.vates.tech>)
 id 6a3153b6-62f1-0a2a450c0019-b9ff1c128caf-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:46:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ed0aee98a000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Jun 2026 13:46:24 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id C15038681F;
 Tue, 16 Jun 2026 15:46:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=NSoq7TAY5qPhlPjEiWFXfMclqWZaDZz0i1aCrZgepds=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ijSBlGezEW2MFvloWQ6Dr5a3i8uy7kcuBNYBHYwlqR2QWzR/ejvknsoIdMtYCDv/Exbtg/FN2
 I5q46M7QhiKeKi7FFKNyVEowfv3Y6hRzKygzppjBBH2qR4tHL8yt1aO1ccrftp1+ydzRO+79IVf
 4sqchfRZUrYbGprhYVJbooGFIaSxXJZQMGBQ0tOqc6H4iJTXPQvRFEWCLZGsqE1lrUmDBXIvG9b
 ckIwn9+hL7Gr0KnewziJoBkwKQz6dt5t5bnihpj/UfrytOZgEy5H7GOMn6/JVX0gBYWJXe5C11A
 sF2HZ3ZgaivgltC7pQxB7nkMrkvGV+TuTI7+ujt9j7FA==
X-Zone-Loop: 689bde526127b92011d2c24c92cc446a7a8112761d92
x-campaign-type: default
x-transaction-id: be81acd5-2d97-46ff-83f9-311a3a81e55b
x-swg-uid: 01-f8ce3a4c-ee1a-45b9-9cf9-4bcffbef2052
X-Mailer: Sweego
Message-ID:
 <1781617584.8631fc262581453bbf619ec5b2062170.19ed0aee98a000701b@vates.tech>
x-swg-bid: 1781617584.8631fc262581453bbf619ec5b2062170.19ed0aee98a000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 16 Jun 2026 15:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] common: Track latest pCPU that ran the vCPU
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
 <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
 <1777976230.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@vates.tech>
 <0b311682-9633-4aa0-8067-534456c7b848@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <0b311682-9633-4aa0-8067-534456c7b848@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cj2ex53lTECmU0kXg9mVKnVo"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781617583991
X-purgate-ID: tlsNG-d25034/1781617590-D9F6ACF5-EB202F9B/0/0
X-purgate-type: clean
X-purgate-size: 8730
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4684D690133

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cj2ex53lTECmU0kXg9mVKnVo
Content-Type: multipart/mixed; boundary="------------9hxoH6NIeci0QLtWuJtoTyP4";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <45cd11b8-a697-4038-a261-08b6e871d20c@vates.tech>
Subject: Re: [RFC PATCH 2/7] common: Track latest pCPU that ran the vCPU
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
 <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
 <1777976230.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@vates.tech>
 <0b311682-9633-4aa0-8067-534456c7b848@suse.com>
In-Reply-To: <0b311682-9633-4aa0-8067-534456c7b848@suse.com>

--------------9hxoH6NIeci0QLtWuJtoTyP4
Content-Type: multipart/mixed; boundary="------------DALL4Ahgb0v3t0fOThtn6VtW"

--------------DALL4Ahgb0v3t0fOThtn6VtW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDUvMDUvMjAyNiDDoCAxMjozMiwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MDUuMDUuMjAyNiAxMjoxNywgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBMZSAwNC8wNS8yMDI2
IMOgIDE3OjUxLCBKYW4gQmV1bGljaCBhIMOpY3JpdMKgOg0KPj4+IE9uIDE1LjA0LjIwMjYg
MTU6MzIsIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4+PiBUcmFjayBvbiB3aGljaCBwQ1BVIGVh
Y2ggdkNQVSBvZiBhIGRvbWFpbiByYW4uIFRoaXMgd2lsbA0KPj4+PiBiZSB1c2VkIHRvIGtu
b3cgd2hldGhlciBhIFRMQiBmbHVzaCBpcyByZXF1aXJlZCBvciBub3QNCj4+Pj4gd2hlbiB0
aGUgdkNQVSBpcyBtaWdyYXRlZCBvbiBhbm90aGVyIHBDUFUuDQo+Pj4NCj4+PiBTb21ld2hh
dCByZWxhdGVkIHRyYWNraW5nIGFscmVhZHkgZXhpc3RzIC0gc2VlIHRoZSBkaXJ0eV9jcHVt
YXNrIGZpZWxkLg0KPj4NCj4+IEkndmUgc2VlbiBpdCwgYnV0IEknbSBub3Qgc3VyZSBob3cg
aXQgY2FuIGJlIGxldmVyYWdlZCBoZXJlLg0KPj4NCj4+IEkgd2lsbCB0cnkgdG8gdGFrZSBh
IGNsb3NlciBsb29rIGlmIHRoYXQgY291bGQgYmUgdXNlZCBpbnN0ZWFkLg0KPj4NCj4+PiBC
dXQgd2hhdCB0aXRsZSBhbmQgZGVzY3JpcHRpb24gc2F5IGRvZXNuJ3QgbWF0Y2ggLi4uDQo+
Pj4NCj4+Pj4gQEAgLTk3Nyw2ICs5NzgsOCBAQCB2b2lkIGFzbWxpbmthZ2Ugc3ZtX3ZtZW50
ZXJfaGVscGVyKHZvaWQpDQo+Pj4+ICAgIA0KPj4+PiAgICAgICAgc3ZtX3N5bmNfdm1jYihj
dXJyLCB2bWNiX25lZWRzX3Ztc2F2ZSk7DQo+Pj4+ICAgIA0KPj4+PiArICAgIGN1cnItPmRv
bWFpbi0+bGF0ZXN0X3ZjcHVbY3B1XSA9IGN1cnItPnZjcHVfaWQ7DQo+Pj4NCj4+PiAuLi4g
dGhlIGltcGxlbWVudGF0aW9uIGFueXdheTogWW91IHRyYWNrIHdoaWNoIHZDUFUgbGFzdCBy
YW4gb24gYSBnaXZlbg0KPj4+IHBDUFUuIFNpbmNlIHRoZSBzYW1lIHBDUFUgbWF5IGhhdmUg
cnVuIG11bHRpcGxlIHZDUFUtcyB3aGljaCB0aGVuIHdlcmVuJ3QNCj4+PiBzY2hlZHVsZWQg
YWdhaW4sIHlvdSBsb3NlIGRhdGEgYWZhaWN0Lg0KPj4+DQo+Pg0KPj4gSSBtaXhlZCB1cCB0
aGUgd29yZGluZy4gQnV0IHRoZSBpbXBsZW1lbnRhdGlvbiBpcyB0aGUgcHJvcGVyIGludGVu
dC4NCj4+DQo+PiBJdCdzIG1vcmUNCj4+DQo+PiAgICAgVHJhY2sgd2hpY2ggdkNQVSBvZiB0
aGUgZG9tYWluIGVhY2ggcENQVSByYW4uDQo+IA0KPiBPa2F5LCB5ZXQgdGhlbiAoYXMgYWxy
ZWFkeSBwb2ludGVkIG91dCkgaG93IGRvIHlvdSBrbm93IHZDUFUwIHJhbiBsYXN0IG9uDQo+
IGEgZ2l2ZW4gcENQVSBpZiBhZnRlciBpdHMgZGUtc2NoZWR1bGluZyB2Q1BVMSAob2YgdGhl
IHNhbWUgZG9tYWluKSB3YXMNCj4gcHV0IHRoZXJlLiBZb3VyIHRyYWNrIHJlY29yZCAoYWZ0
ZXIgZGUtc2NoZWR1bGluZyB2Q1BVMSkgd2lsbCBzYXkgb25seQ0KPiB2Q1BVMTsgaW5mb3Jt
YXRpb24gb24gdkNQVTAgd2lsbCBiZSBsb3N0LiBZZXQgdGhlbiwgYXMgYWxzbyBpbmRpY2F0
ZWQsDQo+IGl0J3Mgbm90IHF1aXRlIGNsZWFyIHRvIG1lIGhvdyBleGFjdGx5IHlvdSBtZWFu
IHRvIGxldmVyYWdlIHRoaXMgdHJhY2tpbmcuDQo+IA0KDQpUaGUgaWRlYSBpcyB0byBrbm93
IHdoaWNoIHZDUFUgb2YgdGhlIGRvbWFpbiB0aGUgcENQVSBBU0lEIGlzIGhvbGRpbmcuIA0K
SGVuY2UsIHdlIG5lZWQgdG8ga25vdyB3aGljaCB3YXMgdGhlIGxhdGVzdCBydW5uaW5nIHZD
UFUgb2YgdGhlIGRvbWFpbiANCm9uIGEgcGVyIHBDUFUgYmFzaXMgKG5vdyB0aGF0IGVhY2gg
ZG9tYWluIGhhcyBpdCdzIG93biB1bmlxdWUgQVNJRCwgYW5kIA0KZWFjaCBwQ1BVIGhhcyBp
dHMgb3duIFRMQikuDQoNCkludGVybWVkaWF0ZSB2Q1BVcyBhcmUgbm90IHVzZWZ1bCwgZ2l2
ZW4gdGhhdCB0aGUgVExCIGlzIGV4cGVjdGVkIHRvIGJlIA0KZmx1c2hlZCB3aGVuIHN3aXRj
aGluZyB2Q1BVcyBvZiBhIHNhbWUgZG9tYWluIChhcyB0aGV5IHNoYXJlIHRoZSBzYW1lIEFT
SUQpLg0KDQpTbyBvdmVyYWxsLCB3ZSBmbHVzaCB0aGUgVExCIHdoZW4gZWl0aGVyIDoNCi0g
c3dpdGNoaW5nIGJldHdlZW5zIHZDUFUgb2YgYSBzYW1lIGRvbWFpbiBvbiBhIHNpbmdsZSBw
Q1BVDQotIHRoZSB2Q1BVIHdhcyBwcmV2aW91c2x5IHJhbiBlbHNld2hlcmUgKHRoaXMgaXMg
ZGVhbHQgaW4gcGF0Y2ggMyANCnRocm91Z2ggb2xkX2NwdSAhPSBuZXdfY3B1IGNoZWNrIGlu
IHNjaGVkX3VuaXRfbWlncmF0ZV9maW5pc2goKSkNCg0KSSB0aGluayB0aGUgY29tbWl0IGRl
c2NyaXB0aW9uIGlzIGxhY2tpbmcgdGhlICJsYXN0IHZDUFUiIGlkZWEuDQoNCldvdWxkIHRo
aXMgYmUgYmV0dGVyID8gOg0KDQpJbnRyb2R1Y2UgbGFzdF92Y3B1IHdoaWNoIG1hcHMgZWFj
aCBwQ1BVIHRvIHRoZSBsYXRlc3QgdkNQVSB0aGF0IHJhbiBvbiANCml0LiBUaGlzIHdpbGwg
YmUgdXNlZCB0byBrbm93IHdoZXRoZXIgYSBUTEIgZmx1c2ggaXMgcmVxdWlyZWQgb3Igbm90
DQp3aGVuIHRoZSBwQ1BVIFRMQiBkb2Vzbid0IGhvbGQgdGhpcyB2Q1BVIHN0YXRlIGFueW1v
cmUuDQoNCj4gSmFuDQo+IA0KDQpUZWRkeQ0K
--------------DALL4Ahgb0v3t0fOThtn6VtW
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------DALL4Ahgb0v3t0fOThtn6VtW--

--------------9hxoH6NIeci0QLtWuJtoTyP4--

--------------cj2ex53lTECmU0kXg9mVKnVo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoxU68FAwAAAAAACgkQZg+p0QLLz9De
Awv/ThW/VyptEMIbPAXitGTFdQ+7XHv3ZxdIabC7S61a2HzdSxDAB55jiHs/ZROqG8t12QhWHJ1e
6ZGDDctJueEUFpbX+oAw3XnVfmlPEUlPtL2IzXXJHOZsjSd1cIui114E7aEpqn0wQHv/Z9eQPfKI
QM+lMcZO8HZIE7YiPJsHVSQMkN6fks9eFzZjKvTwqo2xRhsasTpNiAo9I3XJOUPkJvIFfWGTCXrw
R+YmszT1D32NU8cIOXYqZStSDH1Zc85j/H+Gty/EERjHlU10WtDaOLGsYh8ZiIjwpRosDhdrbz5S
5Mhpdm1yS34pa2HTgN9+jYiC/yVorgKbC8L7ooBT/SI6D+R2pLz0Cegq65REubBSK61bYKXYGTne
OT3IMRSWI5riXgWIGvt0lp17kC4iP3LPWce4qiwIZKduWZNy2wXC2RJw9wsgEPgTvIaznjqZZNHx
ZqQyYc2YzIeGK9qSoiXaQKQn0g+OBALHlDW5Tsf41Yo/upO0AoXh8RTw4Lgc
=ZHrJ
-----END PGP SIGNATURE-----

--------------cj2ex53lTECmU0kXg9mVKnVo--

