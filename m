Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF19766F87
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 16:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571486.895451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOVp-0005w0-3y; Fri, 28 Jul 2023 14:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571486.895451; Fri, 28 Jul 2023 14:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOVo-0005uM-W2; Fri, 28 Jul 2023 14:32:12 +0000
Received: by outflank-mailman (input) for mailman id 571486;
 Fri, 28 Jul 2023 14:32:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPOVo-0005uG-0F
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 14:32:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8827952f-2d53-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 16:32:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 141B31F8A4;
 Fri, 28 Jul 2023 14:32:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D958B13276;
 Fri, 28 Jul 2023 14:32:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z6UgM2fRw2SSKQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 14:32:07 +0000
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
X-Inumbo-ID: 8827952f-2d53-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690554728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvmRvG9UQ6Glg+ejYwcpLDsrsWmKKXP/m6tVM8agjko=;
	b=k1/z24UphHT9SVIupXGK5QRxh3mh9qUl8lVwiupIqajvhX651FHBg6wJOmNkZbysDR2EBX
	jTlnInaiLW2LO5nduFH5xepL7mos/TcS5In5qz6o2+r/IhObYko65I5B/9bjgO2cupZ68C
	y16S50gKRnyttHJ5Z7sG7Yk+DkJwdzo=
Message-ID: <daaf9af4-639e-c6fb-890b-852c0781271c@suse.com>
Date: Fri, 28 Jul 2023 16:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
 <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
 <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
 <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
 <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vAj0gu0xMo6mCvlIGCgtbafQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vAj0gu0xMo6mCvlIGCgtbafQ
Content-Type: multipart/mixed; boundary="------------DIEBHJyoQsyuPhIMfXIpHhXL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <daaf9af4-639e-c6fb-890b-852c0781271c@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
 <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
 <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
 <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
 <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>
In-Reply-To: <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>

--------------DIEBHJyoQsyuPhIMfXIpHhXL
Content-Type: multipart/mixed; boundary="------------zp1Hs5eeLgGoIdoRaU6EIV0q"

--------------zp1Hs5eeLgGoIdoRaU6EIV0q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjMgMTY6MDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI4LzA3LzIwMjMgMTQ6MjQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyOC4wNy4yMyAxNDo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gT24gMjgvMDcvMjAyMyAxMzowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24g
MjguMDcuMjMgMTM6MTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4+IEluIGNhc2Ug
b2YgYSBydW50aW1lIGNoZWNrIEkNCj4+Pj4+Pj4+IGFncmVlIHRoYXQgYSBtb3JlIGNlbnRy
YWwgcGxhY2Ugd291bGQgYmUgcHJlZmVycmVkLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEluIHRo
ZSBlbmQgSSBkb24ndCBtaW5kIHRoYXQgbXVjaCwgYnV0DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4g
wqDCoMKgwqDCoEJVSUxEX0JVR19PTihYRU5TVE9SRV9QQVlMT0FEX01BWCA+PQ0KPj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHR5cGVvZigoc3RydWN0IG5vZGVfaGRy
ICopTlVMTC0+ZGF0YWxlbikpKC0xKSk7DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gaXMgYSBsaXR0
bGUgYml0IGNsdW1zeSBJTUhPLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBBZ3JlZS4gV2UgY291bGQg
aW50cm9kdWNlIEZJRUxEX1NJWkVPRigpIChhcyBMaW51eCBkaWQpIHRvIGhpZGUgdGhlIA0K
Pj4+Pj4+PiBjb21wbGV4aXR5LiBUaGUgY29kZSB3b3VsZCB0aGVuIGxvb2sgbGlrZToNCj4+
Pj4+Pj4NCj4+Pj4+Pj4gwqA+PSAoOCAqIEZJRUxEX1NJWkVPRihzdHJ1Y3Qgbm9kZV9oZHIs
IGRhdGFsZW4pKQ0KPj4+Pj4+DQo+Pj4+Pj4gT2gsIEkgZ3Vlc3MgeW91IG1lYW4gc2l6ZW9m
X2ZpZWxkKCkuDQo+Pj4+Pj4NCj4+Pj4+PiBBbmQgZXZlbiB3aXRoIHRoYXQgaXQgd291bGQg
bG9vayBxdWl0ZSBjbHVtc3k6DQo+Pj4+Pj4NCj4+Pj4+PiDCoMKgwqDCoMKgQlVJTERfQlVH
X09OKFhFTlNUT1JFX1BBWUxPQURfTUFYID49DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKDFVTCA8PCAoOCAqIHNpemVvZl9maWVsZChzdHJ1Y3Qgbm9kZV9oZHIsIGRh
dGFsZW4pKSkpOw0KPj4+Pj4NCj4+Pj4+IEhvdyBhYm91dCBrZWVwaW5nIHRoZSBCVUlMRF9C
VUdfT04oKSBpbiB3cml0ZV9ub2RlX3JhdygpIGFuZCBhZGQgdGhlIA0KPj4+Pj4gZm9sbG93
aW5nIGNvbW1lbnQgb24gdG9wIG9mIGhhbmRsZV9pbnB1dCgpOg0KPj4+Pj4NCj4+Pj4+IFNv
bWUgZmllbGRzIGluIFhlbnN0b3JlZCBhcmUgc2l6ZWQgYmFzZWQgb24gdGhlIG1heCBwYXls
b2FkIChzZWUgdmFyaW91cyANCj4+Pj4+IEJVSUxEX0JVR19PTigpKS4gVGhpcyB3b3VsZCBu
ZWVkIGV4dHJhIHJ1bnRpbWUgY2hlY2sgaWYgd2UgZXZlciBkZWNpZGUgdG8gDQo+Pj4+PiBo
YXZlIGEgZHluYW1pYyBwYXlsb2FkIHNpemUuDQo+Pj4+DQo+Pj4+IEkgX2NvdWxkXyBkbyB0
aGF0LCBidXQgd2hlcmUgdG8gc3RvcCBhZGRpbmcgc3VjaCBjb21tZW50cz8NCj4+Pg0KPj4+
IFdoZW4gc29tZW9uZSBvdGhlciB0aGFuIHRoZSBhdXRob3IgaXMgYWJsZSB0byB1bmRlcnN0
YW5kIHRoZSBjb2RlIHdpdGhvdXQgdG9vIA0KPj4+IG11Y2ggZWZmb3J0LiBNb3JlIGNvbW1l
bnRzIG5ldmVyIGh1cnRzLCBsZXNzIHdpbGwgaW4gdGhlIGxvbmdlciBydW4gKHNlZSBiZWxv
dykuDQo+Pg0KPj4gSSBhZ3JlZSB3aXRoIHRoYXQgc3RhdGVtZW50IGluIGdlbmVyYWwsIGJ1
dCByZXF1ZXN0aW5nIGEgY29tbWVudCB0byBhaWQgYQ0KPj4gZnV0dXJlIHBvdGVudGlhbCBj
aGFuZ2UgdmlvbGF0aW5nIHRoZSBYZW5zdG9yZSB3aXJlIHByb3RvY29sIGlzIGEgbGl0dGxl
IGJpdA0KPj4gd2VpcmQuDQo+IA0KPiBXZWxsLi4uIFRoaXMgaXMgdmlvbGF0aW5nIHRoZSBl
eGlzdGluZyBwcm90b2NvbCwgYnV0IGl0IGlzIG5vdCBzZXQgaW4gc3RvbmUgYW5kIA0KPiBJ
IHRoaW5rIHRoaXMgaXMgYWNjZXB0YWJsZSB0byB1cGRhdGUgaXQgd2hlbiB0aGVyZSBpcyBu
byBjaGFuZ2UgZm9yIHRoZSBWTXMgYW5kIA0KPiBmb3IgbmV3IGZlYXR1cmVzIChlLmcuIExp
dmUtVXBkYXRlL0xpdmUtTWlncmF0aW9uKS4NCg0KTm8sIEkgZG9uJ3QgdGhpbmsgc28uDQoN
ClRoaW5rIG9mIFhlbnN0b3JlIGxpdmluZyBpbiBhIHN0dWJkb20uIFRoaXMgbWVhbnMgdGhh
dCBldmVuIGRvbTAgcmVxdWVzdHMgaGF2ZQ0KdG8gZ28gdmlhIGEgcmluZyBwYWdlLCBhbmQg
eW91IGFyZSBqdXN0IGFzc3VtaW5nIHRoYXQgdGhlIGtlcm5lbCBzaWRlIGRyaXZlcg0KZm9y
d2FyZGluZyB0aGUgcmVxdWVzdHMgZnJvbSB1c2VyIG1vZGUgaXMgZmluZSB3aXRoIFhFTlNU
T1JFX1BBWUxPQURfTUFYIF9ub3RfDQpiZWluZyB0aGUgYWJzb2x1dGUgbWF4aW11bSBvZiBk
YXRhIHRyYW5zZmVycmVkIHZpYSBhIHNpbmdsZSBjb21tYW5kLiBJIGNvdWxkDQpwZXJmZWN0
bHkgdW5kZXJzdGFuZCB0aGF0IHRoZSBrZXJuZWwgbWlnaHQgaGF2ZSBhIFhFTlNUT1JFX1BB
WUxPQURfTUFYIHNpemVkDQpidWZmZXIgZm9yIHRoZSBwYXlsb2FkLCB3aGljaCB3b3VsZCBi
ZSBub3QgbGFyZ2UgZW5vdWdoIGZvciB5b3VyIHVzZSBjYXNlLg0KDQpTbyB2aW9sYXRpbmcg
WEVOU1RPUkVfUEFZTE9BRF9NQVggbWlnaHQgYmUgYSBiYWQgaWRlYSB3aXRoIHNvbWUgaW1w
bGVtZW50YXRpb25zLA0KYXQgbGVhc3QgaW4gdGhlb3J5Lg0KDQpUaGlzIG1lYW5zLCBCVFcs
IHRoYXQgY2hhbmdpbmcgWEVOU1RPUkVfUEFZTE9BRF9NQVggaXMgYSBiYWQgaWRlYSwgdG9v
LCBhcyB0aGlzDQp3b3VsZCByZXF1aXJlIHRvIHN5bmMgYmV0d2VlbiBhbGwgY29tcG9uZW50
cyBrbm93aW5nIGl0cyB2YWx1ZS4NCg0KPj4+PiBUQkgsIEkgcmVhbGx5IGRvbid0IHNlZSB0
aGUgcG9pbnQgZG9pbmcgdGhhdC4NCj4+Pj4NCj4+Pj4gSW4gY2FzZSBhIHBhdGNoIGNhbWUg
dXAgdXBzdHJlYW0gdHJ5aW5nIHRvIHZpb2xhdGUgWEVOU1RPUkVfUEFZTE9BRF9NQVggSSB3
b3VsZA0KPj4+PiBzdXJlbHkgTkFDSyBpdC4NCj4+PiBUaGF0J3MgYXNzdW1pbmcgeW91IHdp
bGwgc3RpbGwgYmUgYXJvdW5kIHdoZW4gdGhpcyBoYXBwZW5zIDopLiBJIGFtIG5vdCANCj4+
PiB3aXNoaW5nIGFueXRoaW5nIGJhZCBidXQgdGhlIGNvZGUgd2lsbCBsaWtlbHkgb3V0bGFz
dCBhbnkgb2YgdXMuDQo+Pg0KPj4gTWF5YmUuIEJ1dCB3b3VsZCB5b3UgcmVhbGx5IEFjayBw
YXRjaGVzIGFkZGluZyBjb21tZW50cyBsaWtlIHRoYXQgaW4gb3RoZXINCj4+IGFyZWFzPw0K
PiANCj4gUG90ZW50aWFsbHkgeWVzLiBXZSBoYWQgYSBzaW1pbGFyIGRpc2N1c3Npb24gb24g
QXJtIHdoZW4gYWxsb3dpbmcgcGFkZHJfdCB0byBiZSANCj4gMzItYml0Lg0KPiANCj4gWy4u
Ll0NCj4gDQo+Pj4+IEluIGNhc2Ugd2UgbmVlZCBwYXlsb2FkcyBsYXJnZXIgdGhhbiBYRU5T
VE9SRV9QQVlMT0FEX01BWCB3ZSBzaG91bGQgc3BsaXQgdGhlDQo+Pj4+IHJlbGF0ZWQgb3Bl
cmF0aW9uIGluIG11bHRpcGxlIHBhcnRzIChzZWUgZS5nLiBYU19ESVJFQ1RPUllfUEFSVCBv
ciBYU19DT05UUk9MDQo+Pj4+IGZvciB1cGxvYWRpbmcgYSBuZXcga2VybmVsIHRvIFhlbnN0
b3JlLXN0dWJkb20gZm9yIGxpdmUgdXBkYXRlKS4gV2hpY2ggaXMsIEJUVywNCj4+Pj4gdGhl
IHdheSBBV1Mgc2hvdWxkIGhhdmUgaGFuZGxlZCB0aGUgbWlncmF0aW9uIHByb2JsZW0gKHRy
YW5zYWN0aW9ucyBjb21lIHRvIG15DQo+Pj4+IG1pbmQgaW4gdGhpcyBjb250ZXh0KS4NCj4+
Pg0KPj4+IEkgd2Fzbid0IHBhcnQgb2YgdGhlIG9yaWdpbmFsIGRlc2lnbiwgYnV0IEkgY2Fu
IHNlZSB3aHkgaXQgd2FzIGRvbmUgbGlrZSB0aGF0Lg0KPj4NCj4+IEkgY2FuIHNlZSB3aHkg
aXQgd2FzIGRvbmUgdGhhdCB3YXksIGJ1dCB0aGlzIGRvZXNuJ3QgbWVhbiBJIGNhbiB1bmRl
cnN0YW5kDQo+PiB3aHkgc3VjaCBhIGRlc2lnbiBzaG91bGQgYmUgc3VwcG9ydGVkIGJ5IGFk
ZGluZyBjb21tZW50cyBoZWxwaW5nIHRvIHJlcGVhdCBzdWNoDQo+PiBhIGJhZCBkZWNpc2lv
bi4NCj4+DQo+Pj4gVXNpbmcgbXVsdGlwbGUgY29tbWFuZHMgaGFzIGFsc28gaXRzIGRvd25z
aWRlLiBUaGUgZmlyc3QgdGhhdCBjb21lcyB0byBteSANCj4+PiBtaW5kIGlmIHRoYXQgeW91
IG5lZWQgdG8ga2VlcCBhcm91bmQgdGhlIGRhdGEuIEJ1dCwgd2l0aCB5b3VyIHByb3Bvc2Fs
LCB5b3UgDQo+Pj4gd2Ugd291bGRuJ3QgYmUgYWJsZSB0byBzdG9yZSBpdCBpbiB0aGUgZGF0
YWJhc2UgKGxpa2UgZm9yIHRyYW5zYWN0aW9uIHVwZGF0ZSkgDQo+Pj4gYXMgZGF0YWxlbiBj
YW4gb25seSBiZSA2NUtCLg0KPj4NCj4+IEkgd2Fzbid0IGF3YXJlIHRoYXQgYSBjb21wbGV0
ZSB0cmFuc2FjdGlvbiBuZWVkcyB0byBiZSBrZXB0IGluIGEgc2luZ2xlIGRhdGENCj4+IGJh
c2UgcmVjb3JkLiA6LSkNCj4gDQo+IElJVUMsIHlvdSBhcmUgdGhpbmtpbmcgdGhhdCB0aGUg
Y2xpZW50IHdpbGwgcmVzdG9yZSBhbGwgdGhlIHN0YXRlIGJpdHMgYnkgYml0cy4gDQo+IEJ1
dCBpZiB5b3UgbG9vayBhdCB0aGUgZGVzaWduIGluIGRvY3MvZGVzaWducy94ZW5zdG9yZS1t
aWdyYXRpb24ubWQsIHRoaXMgaXMgYSANCj4gYmxvYi4NCg0KT2YgY291cnNlIGl0IGlzLg0K
DQpJIHdhcyBuZXZlciBhc3N1bWluZyB0aGF0IHRoZSBzdGF0ZSB3b3VsZCBiZSBhcHBsaWVk
IHBpZWNlbWVhbCwgdGhpcyBoYXMgdG8NCmhhcHBlbiBhdG9taWNhbGx5Lg0KDQo+PiBJdCB3
b3VsZCB3b3JrIHBlcmZlY3RseSBmaW5lIHRvIGFsbG9jYXRlIHRoZSBuZWVkZWQgbWVtb3J5
IHZpYSB0YWxsb2MoKSBhbmQgdG8NCj4+IHJlZmVyZW5jZSBpdCBmcm9tIGEgc3BlY2lhbCBu
b2RlIGJlaW5nIHBhcnQgb2YgdGhlIHRyYW5zYWN0aW9uLCBvciB0byBub3QgdXNlDQo+PiBh
IG5vZGUgYXQgYWxsIChzZWUgYWdhaW4gdGhlIFhTX0NPTlRST0wgZXhhbXBsZSkuDQo+IA0K
PiBJIGFtIG5vdCBjb252aW5jZWQgdGhlIGNvbXBsZXhpdHkgaXMgd29ydGggaXQgaGVyZS4g
VG8gYmUgaG9uZXN0LCBJIHRoaW5rIHRoZSANCj4gcGF5bG9hZCBsaW1pdCBzaG91bGQgaGF2
ZSBiZWVuIHJlbGF4ZWQgZm9yIExpdmUtVXBkYXRlIGFzIHdlbGwgYXMgeW91IGRvbid0IGdh
aW4gDQo+IG11Y2ggdG8gc3BsaXQuIFRoYXQgc2FpZCwgdGhpcyBpcyBsZXNzIGEgY29uY2Vy
biBiZWNhdXNlIHlvdSBhcmUgbm90IHRpbWUgDQo+IGNvbnN0cmFpbmVkLg0KPiANCj4gWy4u
Ll0NCj4gDQo+PiBCdXQgbWF5YmUgdGhhdCBjb21tZW50IHdhcyBiYXNlZCBvbiB3cm9uZyBh
c3N1bXB0aW9ucywgbGlrZSB0aGUgbWVudGlvbmVkDQo+PiBjaGFuZ2Ugbm90IHZpb2xhdGlu
ZyB0aGUgcHJvdG9jb2wuID4NCj4+PiBJIGFtIGhhcHB5IHRvIHJld3JpdGUgdGhlIGNvbW1l
bnQgc28gaXQgZG9lc24ndCBsZWFkIHRvIHRoaW5rIHRoYXQgeW91IChhcyANCj4+PiB0aGUg
bWFpbnRhaW5lcikgYXJlIG9wZW4gdG8gaGF2ZSBhIG1vcmUgcmVsYXggbGVuZ3RoIGNoZWNr
Lg0KPj4NCj4+IFllcywgcGxlYXNlIG1ha2UgYSBzdWdnZXN0aW9uIGZvciBhIHByb3BlciBj
b21tZW50IG5vdCBzdWdnZXN0aW5nIHdlIGFyZSBmaW5lDQo+PiB0byB2aW9sYXRlIHRoZSB3
aXJlIHByb3RvY29sLg0KPiANCj4gSGVyZSB3ZSBnbzoNCj4gDQo+ICJUaGUgcGF5bG9hZCBz
aXplIGlzIG5vdCBvbmx5IGN1cnJlbnRseSByZXN0cmljdGVkIGJ5IHRoZSBwcm90b2NvbCBi
dXQgYWxzbyB0aGUgDQo+IGludGVybmFsIGltcGxlbWVudGF0aW9uIChzZWUgdmFyaW91cyBC
VUlMRF9CVUdfT04oKSkuIg0KDQpIbW0sIEknbSBzdGlsbCBmZWVsaW5nIHVuZWFzeSB0byBp
bXBseSB0aGF0IHRoZSBwYXlsb2FkIHNpemUgbWlnaHQgYmUgY2hhbmdlZC4NClNlZSBhYm92
ZSByZWFzb25pbmcuDQoNClRoZSBvbmx5IHdheSBJIGNvdWxkIGltYWdpbmUgdGhpcyBiZWlu
ZyBwb3NzaWJsZSB3b3VsZCBiZSBhIHBlci1yaW5nLXBhZ2UNCmF0dHJpYnV0ZSB3aXRoIGJv
dGggc2lkZXMgYWdyZWVpbmcgdG8gdGhlIG1heCBhbGxvd2VkIHNpemUgKHRoZSBtaW5pbXVt
IGJlaW5nDQp0b2RheSdzIHZhbHVlKS4NCg0KV2l0aCB0aGF0IGluIG1pbmQgSSBjYW4gaGVz
aXRhbnRseSBhZGQgdGhlIGNvbW1lbnQsIG1heWJlIHdpdGggdGhlIGFkZGl0aW9uOg0KIkFu
eSBwb3RlbnRpYWwgY2hhbmdlIG9mIHRoZSBtYXhpbXVtIHBheWxvYWQgc2l6ZSBuZWVkcyB0
byBiZSBuZWdvdGlhdGVkIGJldHdlZW4NCnRoZSBpbnZvbHZlZCBwYXJ0aWVzLiINCg0KDQpK
dWVyZ2VuDQo=
--------------zp1Hs5eeLgGoIdoRaU6EIV0q
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zp1Hs5eeLgGoIdoRaU6EIV0q--

--------------DIEBHJyoQsyuPhIMfXIpHhXL--

--------------vAj0gu0xMo6mCvlIGCgtbafQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTD0WcFAwAAAAAACgkQsN6d1ii/Ey+Z
iwf/anK4SeWdm0wKXmUu8a0779eqK2pYUbL+c2ZStx5qABH5/03Zz+xYa+4UqUhB8Vgw6apOjiLD
qxT+gS1qbJIMC6mr/QEmBbwmI7mrF6CXGwEZKyP36bIh4FIYVE1tywfcjKNOnbxfdeobbennNJfD
OcnbCIubwyb0e3aSlOZ1/6qui4N1ywqjfilfryQw/xdTVCVK6UUsIUIMhwPRWRO9Lnza2DR8T7FJ
JzlSWSmfgAZWxRQ8PuX2b5cVVkg0CgB/0h2QJf06ibGT+mLKwZc1Y7LTI0AccMJm0Crek4uuBgMh
YKHKduEzyfn2/yh3HT5N4ICkHcWi1FKS9lMcNDdC4Q==
=68Hm
-----END PGP SIGNATURE-----

--------------vAj0gu0xMo6mCvlIGCgtbafQ--

