Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F05930B4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387519.623813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNb4d-0004B3-0I; Mon, 15 Aug 2022 14:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387519.623813; Mon, 15 Aug 2022 14:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNb4c-000490-Tr; Mon, 15 Aug 2022 14:28:10 +0000
Received: by outflank-mailman (input) for mailman id 387519;
 Mon, 15 Aug 2022 14:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNb4b-00048u-EZ
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:28:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b0b1efa-1ca6-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 16:28:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C66E1FA8A;
 Mon, 15 Aug 2022 14:28:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D996613A99;
 Mon, 15 Aug 2022 14:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gtB6M/ZX+mLFYAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 14:28:06 +0000
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
X-Inumbo-ID: 7b0b1efa-1ca6-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660573687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXQoW8QhagmDnbGBGjYxOHPLMZJIiHtO9xf8whk/FFU=;
	b=dZa4U+CP2ouCv7xrgY78PGHO8Z+ErVLbSfL9lDqn+Aa7z9oXdWzNDnDxb1bD/ZZLSUkO8O
	VT2gEU54386AB22z7d0nWuyDcNSAzFkbc5hzclv0+eS0N7mSZcpMvLrfgQLq2VOV/zJsVg
	AHCXdeHyvADs5flwHY9xkw/l+KjvBmY=
Message-ID: <103c6910-0985-b0be-a034-6c79a13c8c6a@suse.com>
Date: Mon, 15 Aug 2022 16:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
 <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
 <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
 <55ef3754-f893-29fb-8504-27a309a9edec@suse.com>
 <813693ca-f9ff-a2da-ba92-d695d48ce012@suse.com>
In-Reply-To: <813693ca-f9ff-a2da-ba92-d695d48ce012@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zR5c60puEbtUCIyEgZVeXvgn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zR5c60puEbtUCIyEgZVeXvgn
Content-Type: multipart/mixed; boundary="------------OljPMVYG407yrPmTgMhSMtO9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <103c6910-0985-b0be-a034-6c79a13c8c6a@suse.com>
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
 <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
 <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
 <55ef3754-f893-29fb-8504-27a309a9edec@suse.com>
 <813693ca-f9ff-a2da-ba92-d695d48ce012@suse.com>
In-Reply-To: <813693ca-f9ff-a2da-ba92-d695d48ce012@suse.com>

--------------OljPMVYG407yrPmTgMhSMtO9
Content-Type: multipart/mixed; boundary="------------nc1g2zUjKw9DC6zqYeVTn1eH"

--------------nc1g2zUjKw9DC6zqYeVTn1eH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjIgMTQ6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDE1LjA4LjIy
IDE0OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE1LjA4LjIwMjIgMTQ6MTYsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMTUuMDguMjIgMTQ6MDAsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+PiBPbiAxNS4wOC4yMDIyIDEzOjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Og0KPj4+Pj4gT24gMTUuMDguMjIgMTM6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+
IE9uIDE1LjA4LjIwMjIgMTM6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4+IC0t
LSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+Pj4+ICsrKyBiL3hlbi9jb21tb24v
c2NoZWQvY29yZS5jDQo+Pj4+Pj4+IEBAIC0zMjM3LDYgKzMyMzcsNjUgQEAgb3V0Og0KPj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4+Pj4+PiDCoMKgwqAgfQ0KPj4+
Pj4+PiArc3RhdGljIHN0cnVjdCBjcHVfcm1fZGF0YSAqc2NoZWR1bGVfY3B1X3JtX2FsbG9j
KHVuc2lnbmVkIGludCBjcHUpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0
IGNwdV9ybV9kYXRhICpkYXRhOw0KPj4+Pj4+PiArwqDCoMKgIGNvbnN0IHN0cnVjdCBzY2hl
ZF9yZXNvdXJjZSAqc3I7DQo+Pj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGlkeDsNCj4+
Pj4+Pj4gKw0KPj4+Pj4+PiArwqDCoMKgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vs
b2NrKTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArwqDCoMKgIHNyID0gZ2V0X3NjaGVkX3Jlcyhj
cHUpOw0KPj4+Pj4+PiArwqDCoMKgIGRhdGEgPSB4bWFsbG9jX2ZsZXhfc3RydWN0KHN0cnVj
dCBjcHVfcm1fZGF0YSwgc3IsIHNyLT5ncmFudWxhcml0eSAtIA0KPj4+Pj4+PiAxKTsNCj4+
Pj4+Pj4gK8KgwqDCoCBpZiAoICFkYXRhICkNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdv
dG8gb3V0Ow0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICvCoMKgwqAgZGF0YS0+b2xkX29wcyA9IHNy
LT5zY2hlZHVsZXI7DQo+Pj4+Pj4+ICvCoMKgwqAgZGF0YS0+dnByaXZfb2xkID0gaWRsZV92
Y3B1W2NwdV0tPnNjaGVkX3VuaXQtPnByaXY7DQo+Pj4+Pj4+ICvCoMKgwqAgZGF0YS0+cHBy
aXZfb2xkID0gc3ItPnNjaGVkX3ByaXY7DQo+Pj4+Pj4NCj4+Pj4+PiBSZXBlYXRpbmcgYSB2
MSBjb21tZW50Og0KPj4+Pj4+DQo+Pj4+Pj4gIkF0IGxlYXN0IGZyb20gYW4gYWJzdHJhY3Qg
cGVyc3BlY3RpdmUsIGRvZXNuJ3QgcmVhZGluZyBmaWVsZHMgZnJvbQ0KPj4+Pj4+IMKgwqDC
oCBzciByZXF1aXJlIHRoZSBSQ1UgbG9jayB0byBiZSBoZWxkIGNvbnRpbnVvdXNseSAoaS5l
LiBub3QgZHJvcHBpbmcNCj4+Pj4+PiDCoMKgwqAgaXQgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1
bmN0aW9uIGFuZCByZS1hY3F1aXJpbmcgaXQgaW4gdGhlIGNhbGxlcik/Ig0KPj4+Pj4+DQo+
Pj4+Pj4gSW5pdGlhbGx5IEkgdGhvdWdodCB5b3UgZGlkIHJlc3BvbmQgdG8gdGhpcyBpbiBz
b21lIHdheSwgYnV0IHdoZW4NCj4+Pj4+PiBsb29raW5nIGZvciBhIG1hdGNoaW5nIHJlcGx5
IEkgY291bGRuJ3QgZmluZCBvbmUuDQo+Pj4+Pg0KPj4+Pj4gT2gsIHNvcnJ5Lg0KPj4+Pj4N
Cj4+Pj4+IFRoZSBSQ1UgbG9jayBpcyBwcm90ZWN0aW5nIG9ubHkgdGhlIHNyLCBub3QgYW55
IGRhdGEgcG9pbnRlcnMgaW4gdGhlIHNyDQo+Pj4+PiBhcmUgcmVmZXJlbmNpbmcuIFNvIGl0
IGlzIGZpbmUgdG8gZHJvcCB0aGUgUkNVIGxvY2sgYWZ0ZXIgcmVhZGluZyBzb21lDQo+Pj4+
PiBvZiB0aGUgZmllbGRzIGZyb20gdGhlIHNyIGFuZCBzdG9yaW5nIGl0IGluIHRoZSBjcHVf
cm1fZGF0YSBtZW1vcnkuDQo+Pj4+DQo+Pj4+IEhtbSwgaW50ZXJlc3RpbmcuICJQcm90ZWN0
aW5nIG9ubHkgdGhlIHNyIiB0aGVuIG1lYW5zIHdoYXQgZXhhY3RseT8NCj4+Pj4gSnVzdCBp
dHMgYWxsb2NhdGlvbiwgYnV0IG5vdCBpdHMgY29udGVudHM/DQo+Pj4NCj4+PiBDb3JyZWN0
Lg0KPj4+DQo+Pj4+IFBsdXMgaXQncyBub3QganVzdCB0aGUgcG9pbnRlcnMgLSBzci0+Z3Jh
bnVsYXJpdHkgYWxzbyB3b3VsZCBiZXR0ZXIgbm90DQo+Pj4+IGluY3JlYXNlIGluIHRoZSBt
ZWFudGltZSAuLi4gUXVpdGUgbGlrZWx5IHRoZXJlJ3MgYSByZWFzb24gd2h5IHRoYXQgYWxz
bw0KPj4+PiBjYW5ub3QgaGFwcGVuLCB5ZXQgZXZlbiB0aGVuIEkgdGhpbmsgYSBicmllZiBj
b2RlIGNvbW1lbnQgbWlnaHQgYmUNCj4+Pj4gaGVscGZ1bCBoZXJlLg0KPj4+DQo+Pj4gT2th
eSwgd2lsbCBhZGQgc29tZXRoaW5nIGxpa2U6DQo+Pj4NCj4+PiAiQmV0d2VlbiBzY2hlZHVs
ZV9jcHVfcm1fYWxsb2MoKSBhbmQgdGhlIHJlYWwgY3B1IHJlbW92YWwgYWN0aW9uIHRoZSBy
ZWxldmFudA0KPj4+IMKgwqAgY29udGVudHMgb2Ygc3RydWN0IHNjaGVkX3Jlc291cmNlIGNh
bid0IGNoYW5nZSwgYXMgdGhlIGNwdSBpbiBxdWVzdGlvbiBpcw0KPj4+IMKgwqAgbG9ja2Vk
IGFnYWluc3QgYW55IG90aGVyIG1vdmVtZW50IHRvIG9yIGZyb20gY3B1cG9vbHMsIGFuZCB0
aGUgZGF0YSBjb3BpZWQNCj4+PiDCoMKgIGJ5IHNjaGVkdWxlX2NwdV9ybV9hbGxvYygpIGlz
IGNwdXBvb2wgc3BlY2lmaWMuIg0KPj4+DQo+Pj4gSXMgdGhhdCBva2F5Pw0KPj4NCj4+IFdl
bGwsIEkgZ3Vlc3MgSSBuZWVkIHRvIGxlYXZlIHRoaXMgdG8gdGhlIHNjaGVkdWxlciBtYWlu
dGFpbmVycyB0aGVuLiBJDQo+PiBoYXZlIHRvIGFkbWl0IHRoYXQgaXQncyBub3QgY2xlYXIg
dG8gbWUgd2h5IGFsbCBvZiBzci0+Z3JhbnVsYXJpdHksDQo+PiBzci0+c2NoZWR1bGVyLCBv
ciBzci0+c2NoZWRfcHJpdiB3b3VsZCBiZSAiY3B1cG9vbCBzcGVjaWZpYyIuIEkgbWF5IGJl
DQo+IA0KPiBzci0+c2NoZWR1bGVyIGlzIHRoZSBwb2ludGVyIHRvIHRoZSBzY2hlZHVsZXIg
b3BzIGFycmF5IHdoaWNoIGlzIHNldCB3aGVuDQo+IGEgY3B1IGlzIGFkZGVkIHRvIGEgY3B1
cG9vbCAodGhlIHNjaGVkdWxlciBpcyBhIGNwdXBvb2wgcHJvcGVydHkpLiBUaGUgc2FtZQ0K
PiBhcHBsaWVzIHRvIHNyLT5ncmFudWxhcml0eTogdGhpcyB2YWx1ZSBpcyBwZXItY3B1cG9v
bCwgdG9vLiBzci0+c2NoZWRfcHJpdg0KPiBpcyBvbmx5IGNoYW5nZWQgd2hlbiBhIGNwdSBp
cyBhZGRlZCB0byBvciByZW1vdmVkIGZyb20gYSBjcHVwb29sLCBhcyB0aGlzDQo+IGlzIHRo
ZSBwZXItY3B1IGRhdGEgb2YgYSBzY2hlZHVsZXIsIHdoaWNoIG5lZWRzIHRvIHN0YXkgd2hl
biBzY2hlZHVsaW5nIGlzDQo+IGhhcHBlbmluZyBvbiB0aGUgY3B1LCB0aHVzIGl0IGlzIGFs
bG93ZWQgdG8gYmUgcmVtb3ZlZCBvbmx5IGluIGNhc2UgdGhlDQo+IGNwdSBpcyByZW1vdmVk
IGZyb20gb3IgYWRkZWQgdG8gdGhlIGNwdXBvb2wuDQo+IA0KPj4gYWJsZSB0byBhZ3JlZSBm
b3Igc3ItPmdyYW51bGFyaXR5LCBidXQgdGhlIG90aGVyIHR3byBJIHRob3VnaHQgd2FzDQo+
PiBzY2hlZHVsZXIgZGF0YSwgbm90IGNwdXBvb2wgZGF0YS4gRm9yIHNyLT5ncmFudWxhcml0
eSBpbiB0dXJuIChidXQNCj4+IHBlcmhhcHMgYWxzbyB0aGUgb3RoZXIgdHdvIGZpZWxkcykg
aXQncyBub3Qgb2J2aW91cyB0byBtZSB0aGF0IHBvb2wNCj4+IHByb3BlcnRpZXMgY2FuJ3Qg
Y2hhbmdlIGluIGEgcmFjaW5nIG1hbm5lci4NCj4gDQo+IFRoZXkgY2FuJ3QuIE90aGVyd2lz
ZSB0aGUgc2NoZWR1bGVyIHdvdWxkIGV4cGxvZGUuDQoNCkJUVywgSSdsbCByZXdvcmsgdGhl
IGNvbW1lbnQgYSBsaXR0bGUgYml0IHRvOg0KDQoiQmV0d2VlbiBzY2hlZHVsZV9jcHVfcm1f
YWxsb2MoKSBhbmQgdGhlIHJlYWwgY3B1IHJlbW92YWwgYWN0aW9uIHRoZSByZWxldmFudA0K
ICBjb250ZW50cyBvZiBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgY2FuJ3QgY2hhbmdlLCBhcyB0
aGUgY3B1IGluIHF1ZXN0aW9uIGlzDQogIGxvY2tlZCBhZ2FpbnN0IGFueSBvdGhlciBtb3Zl
bWVudCB0byBvciBmcm9tIGNwdXBvb2xzLCBhbmQgdGhlIGRhdGEgY29waWVkDQogIGJ5IHNj
aGVkdWxlX2NwdV9ybV9hbGxvYygpIGlzIG1vZGlmaWVkIG9ubHkgaW4gY2FzZSB0aGUgY3B1
IGluIHF1ZXN0aW9uIGlzDQogIGJlaW5nIG1vdmVkIGZyb20gb3IgdG8gYSBjcHVwb29sLiIN
Cg0KV2lsbCByZXNlbmQgdGhlIHNlcmllcyB0b21vcnJvdyBtb3JuaW5nIGlmIG5vYm9keSBv
YmplY3RzLg0KDQoNCkp1ZXJnZW4NCg==
--------------nc1g2zUjKw9DC6zqYeVTn1eH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------nc1g2zUjKw9DC6zqYeVTn1eH--

--------------OljPMVYG407yrPmTgMhSMtO9--

--------------zR5c60puEbtUCIyEgZVeXvgn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL6V/YFAwAAAAAACgkQsN6d1ii/Ey/7
EAf/VxGu6VaGPzcFJffGBaXzW1f8yVQ4zYN1ENXvY7RbWIJXA6WMavtC4xOuWgsXHFV36anYfWZj
MaXz7zJ1QA7Sj+0Gy3G3QYacWEKP6uPa1aFt9hPi3PJ5bRj8JGOiQweiEulKnmHy3AZgQgKpLNld
KKTuZp12P2zm9mvp4UnlrAW2BkMl7ypgc8L1K6skiXnMLKYBQGrrPPyGkE8tJexzTl48QNLhQ8n5
E1tpbR70+lKBP5owsdo0O+5ajj4O/hWUZXs433IBCxVu1arwKqNp9gj2BsAXriyIKCbZGjfP5A7n
2tFqAxrZx6B1rAMNZtQfE0PqTeQFg23lJSlk/QfwYw==
=/u6e
-----END PGP SIGNATURE-----

--------------zR5c60puEbtUCIyEgZVeXvgn--

