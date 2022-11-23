Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D763597D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 11:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447504.703799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmph-0001Is-RN; Wed, 23 Nov 2022 10:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447504.703799; Wed, 23 Nov 2022 10:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmph-0001Fs-NU; Wed, 23 Nov 2022 10:18:21 +0000
Received: by outflank-mailman (input) for mailman id 447504;
 Wed, 23 Nov 2022 10:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVpM=3X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oxmpf-0001Fm-NZ
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 10:18:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 261b79ce-6b18-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 11:18:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C473C1F8BB;
 Wed, 23 Nov 2022 10:18:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CF5C13AE7;
 Wed, 23 Nov 2022 10:18:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2TEJJWnzfWPHJwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Nov 2022 10:18:17 +0000
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
X-Inumbo-ID: 261b79ce-6b18-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669198697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iuSGZFuyZzeUEmumRiCxIHsb08pfKDky/5eomCPXUPE=;
	b=o+EgsLh8LX3pcIUJGxqg0KB8j41kRsFYMsilohL4JTKxpzKVgB4duFJFrdqTNpTI+RLeBR
	uJviCcxA7c4oX6kJK0CtGHR1aYxILJppysiqO07kUielJIH9HQKJ1MzoFKiCEcmIuCfjGZ
	MGPi01yma4UrJAoGUlT6BHgFSeEU/ZY=
Message-ID: <1c96e05c-1f2f-bb0f-864d-6a247416e2bd@suse.com>
Date: Wed, 23 Nov 2022 11:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: EFI's -mapbs option may cause Linux to panic()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
 <Y3uryky3urmQlIjs@Air-de-Roger>
 <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
 <Y3yanWFrRpPg4bKW@Air-de-Roger>
 <a7af879c-0e58-d12b-287d-22ae7b9d9e2e@suse.com>
 <7491ca33-291f-1dfe-6826-2a210a1d08ae@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <7491ca33-291f-1dfe-6826-2a210a1d08ae@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ez0VEdPf9XymXnZJIQD02dFx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ez0VEdPf9XymXnZJIQD02dFx
Content-Type: multipart/mixed; boundary="------------ZfyUh4e93zmqQHU6hcgSrYP1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <1c96e05c-1f2f-bb0f-864d-6a247416e2bd@suse.com>
Subject: Re: EFI's -mapbs option may cause Linux to panic()
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
 <Y3uryky3urmQlIjs@Air-de-Roger>
 <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
 <Y3yanWFrRpPg4bKW@Air-de-Roger>
 <a7af879c-0e58-d12b-287d-22ae7b9d9e2e@suse.com>
 <7491ca33-291f-1dfe-6826-2a210a1d08ae@suse.com>
In-Reply-To: <7491ca33-291f-1dfe-6826-2a210a1d08ae@suse.com>

--------------ZfyUh4e93zmqQHU6hcgSrYP1
Content-Type: multipart/mixed; boundary="------------4sZHyZqM39qp0fxPWukRviJs"

--------------4sZHyZqM39qp0fxPWukRviJs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTEuMjIgMTA6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4xMS4yMDIy
IDA4OjM5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjIuMTEuMjIgMTA6NDcsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9uLCBOb3YgMjEsIDIwMjIgYXQgMDY6
MDE6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDIxLjExLjIwMjIg
MTc6NDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBNb24sIE5vdiAyMSwg
MjAyMiBhdCAwNToyNzoxNlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBI
ZWxsbywNCj4+Pj4+Pg0KPj4+Pj4+IG9uIGEgc3lzdGVtIHdpdGggdGhlc2UgZmlyc3QgdHdv
IEVGSSBtZW1vcnkgbWFwIGVudHJpZXMNCj4+Pj4+Pg0KPj4+Pj4+IChYRU4pICAwMDAwMDAw
MDAwMDAwLTAwMDAwMDAwOWRmZmYgdHlwZT00IGF0dHI9MDAwMDAwMDAwMDAwMDAwZg0KPj4+
Pj4+IChYRU4pICAwMDAwMDAwMDllMDAwLTAwMDAwMDAwOWZmZmYgdHlwZT0yIGF0dHI9MDAw
MDAwMDAwMDAwMDAwZg0KPj4+Pj4+DQo+Pj4+Pj4gaS5lLiBleGNlcHQgZm9yIDIgcGFnZXMg
YWxsIHNwYWNlIGJlbG93IDFNIGJlaW5nIEJvb3RTZXJ2aWNlc0RhdGEsIHRoZQ0KPj4+Pj4+
IC1tYXBicyBvcHRpb24gaGFzIHRoZSBlZmZlY3Qgb2YgbWFya2luZyByZXNlcnZlZCBhbGwg
dGhhdCBzcGFjZS4gVGhlbg0KPj4+Pj4+IExpbnV4IGZhaWxzIHRyeWluZyB0byBhbGxvY2F0
ZSBpdHMgbG93bWVtIHRyYW1wb2xpbmUgKHdoaWNoIHJlYWxseSBpdA0KPj4+Pj4+IHNob3Vs
ZG4ndCBuZWVkIHdoZW4gcnVubmluZyBpbiBQViBtb2RlKSwgdWx0aW1hdGVseSBsZWFkaW5n
IHRvDQo+Pj4+Pj4NCj4+Pj4+PiAJCXBhbmljKCJSZWFsIG1vZGUgdHJhbXBvbGluZSB3YXMg
bm90IGFsbG9jYXRlZCIpOw0KPj4+Pj4+DQo+Pj4+Pj4gaW4gdGhlaXIgaW5pdF9yZWFsX21v
ZGUoKS4NCj4+Pj4+Pg0KPj4+Pj4+IFdoaWxlIGZvciBQViBJIHRoaW5rIGl0IGlzIGNsZWFy
IHRoYXQgdGhlIGVhc2llc3QgaXMgdG8gYXZvaWQNCj4+Pj4+PiB0cmFtcG9saW5lIHNldHVw
IGluIHRoZSBmaXJzdCBwbGFjZSwgaWlyYyBQVkggRG9tMCBhbHNvIHRyaWVzIHRvDQo+Pj4+
Pj4gbWlycm9yIHRoZSBob3N0IG1lbW9yeSBtYXAgdG8gaXRzIG93biBhZGRyZXNzIHNwYWNl
LiBEb2VzIFBWSCBMaW51eA0KPj4+Pj4+IHJlcXVpcmUgYSBsb3dtZW0gdHJhbXBvbGluZT8N
Cj4+Pj4+DQo+Pj4+PiBZZXMsIGl0IGRvZXMgQUZBSUsuICBJIGd1ZXNzIHRob3NlIHR3byBw
YWdlcyB3b24ndCBiZSBlbm91Z2ggZm9yDQo+Pj4+PiBMaW51eCBib290IHRyYW1wb2xpbmUg
cmVxdWlyZW1lbnRzIHRoZW4uDQo+Pj4+Pg0KPj4+Pj4gSSBhc3N1bWUgbmF0aXZlIExpbnV4
IGlzIGZpbmUgd2l0aCB0aGlzIG1lbW9yeSBtYXAgYmVjYXVzZSBpdCByZWNsYWltcw0KPj4+
Pj4gdGhlIEVmaUJvb3RTZXJ2aWNlc0RhdGEgcmVnaW9uIGFuZCB0aGF0J3MgZW5vdWdoLg0K
Pj4+Pg0KPj4+PiBUaGF0J3MgbXkgdW5kZXJzdGFuZGluZyBhcyB3ZWxsLg0KPj4+Pg0KPj4+
Pj4+IFdoaWxlIHRoZSB0d28gcGFnZXMgaGVyZSBhcmUganVzdCBlbm91Z2ggZm9yIFhlbidz
IHRyYW1wb2xpbmUsIEkgc3RpbGwNCj4+Pj4+PiB3b25kZXIgd2hldGhlciB3ZSB3YW50IHRv
IGFkanVzdCAtbWFwYnMgYmVoYXZpb3IuIFNpbmNlIHdoYXRldmVyIHdlDQo+Pj4+Pj4gbWln
aHQgZG8gbGVhdmVzIGEgcmlzayBvZiBjb25mbGljdGluZyB3aXRoIHRydWUgZmlybXdhcmUg
KG1pcyl1c2Ugb2YNCj4+Pj4+PiB0aGF0IHNwYWNlLCB0aGUgYmVzdCBJIGNhbiB0aGluayBv
ZiByaWdodCBub3cgd291bGQgYmUgYW5vdGhlciBvcHRpb24NCj4+Pj4+PiBhbHRlcmluZyBi
ZWhhdmlvciAob3IgcHJvdmlkaW5nIGFsdGVyZWQgYmVoYXZpb3IpLiBZZXQgc3VjaCBhbiBv
cHRpb24NCj4+Pj4+PiB3b3VsZCBsaWtlbHkgbmVlZCB0byBiZSBtb3JlIGZpbmUtZ3JhaW5l
ZCB0aGVuIHRoYW4gY292ZXJpbmcgYWxsIG9mDQo+Pj4+Pj4gdGhlIGxvdyBNYiBpbiBvbmUg
Z28uIFdoaWNoIGZlZWxzIGxpa2UgYm90aCBnb2luZyB0b28gZmFyIGFuZCBtYWtpbmcNCj4+
Pj4+PiBpdCBhd2t3YXJkIGZvciBwZW9wbGUgdG8gZmlndXJlIG91dCB3aGF0IHZhbHVlKHMp
IHRvIHVzZSAuLi4NCj4+Pj4+Pg0KPj4+Pj4+IFRob3VnaHRzIGFueW9uZT8NCj4+Pj4+DQo+
Pj4+PiBJJ20gdW5zdXJlIHdoYXQgdG8gcmVjb21tZW5kLiAgVGhlIG1hcGJzIG9wdGlvbiBp
cyBhIHdvcmthcm91bmQgZm9yDQo+Pj4+PiBicm9rZW4gZmlybXdhcmUsIGFuZCBpdCdzIG5v
dCBlbmFibGVkIGJ5IGRlZmF1bHQsIHNvIHdlIG1pZ2h0IGJlIGx1Y2t5DQo+Pj4+PiBhbmQg
bmV2ZXIgZmluZCBhIHN5c3RlbSB3aXRoIGEgbWVtb3J5IG1hcCBsaWtlIHlvdSBkZXNjcmli
ZSB0aGF0IGFsc28NCj4+Pj4+IHJlcXVpcmVzIG1hcGJzIGluIG9yZGVyIHRvIGJvb3QuDQo+
Pj4+DQo+Pj4+IEd1ZXNzIGhvdyB3ZSd2ZSBsZWFybmVkIG9mIHRoZSBpc3N1ZTogU3lzdGVt
cyBtYXkgYm9vdCBmaW5lIHdpdGhvdXQNCj4+Pj4gLW1hcGJzLCBidXQgdGhleSBtYXkgZmFp
bCB0byByZWJvb3QgYmVjYXVzZSBvZiB0aGF0IChpbilmYW1vdXMgaXNzdWUgb2YNCj4+Pj4g
ZmlybXdhcmUgd3JpdGVycyBub3QgcHJvcGVybHkgc2VwYXJhdGluZyBib290IHNlcnZpY2Vz
IGNvZGUgcGF0aHMgZnJvbQ0KPj4+PiBydW50aW1lIHNlcnZpY2VzIG9uZXMuIEFuZCB0aGVy
ZSB3ZSdyZSBkZWFsaW5nIHdpdGggYSBzeXN0ZW0gd2hlcmUgSQ0KPj4+PiBzdXNwZWN0IHRo
aXMgdG8gYmUgdGhlIGNhc2UsIGp1c3QgdGhhdCAtIHVubGlrZSBpbiBlYXJsaWVyIHNpbWls
YXINCj4+Pj4gY2FzZXMgLSB0aGVyZSdzIG5vICJjbGVhbiIgY3Jhc2ggcHJvdmluZyB0aGUg
aXNzdWUgKHRoZSBzeXN0ZW0gc2ltcGx5DQo+Pj4+IGhhbmdzKS4gSGVuY2UgbXkgcmVxdWVz
dCB0aGF0IHRoZXkgdXNlIC1tYXBicyB0byB0cnkgdG8gZmlndXJlIG91dC4NCj4+Pj4NCj4+
Pj4gQW5kIHllcywgInJlYm9vdD1hY3BpIiBoZWxwcyB0aGVyZSwgYnV0IHRoZXkgaW5zaXN0
IG9uIGtub3dpbmcgd2hhdA0KPj4+PiBjb21wb25lbnQgaXMgdG8gYmxhbWUuDQo+Pj4NCj4+
PiBXZWxsLCBpZiByZWJvb3Q9YWNwaSBmaXhlcyBpdCB0aGVuIGl0J3MgcXVpdGUgY2xlYXIg
RUZJIHJlYm9vdCBtZXRob2QNCj4+PiBpcyB0byBibGFtZT8NCj4+Pg0KPj4+IE9yIHRoZXkg
d2FudCB0byBrbm93IHRoZSBleGFjdCBjYXVzZSB0aGF0IG1ha2VzIEVGSSByZWJvb3QgZmFp
bCwNCj4+PiBiZWNhdXNlIHRoYXQncyBxdWl0ZSBkaWZmaWN1bHQgdG8gZmlndXJlIG91dCBm
cm9tIG91ciBlbmQuDQo+Pj4NCj4+PiBCdXQgSSdtIGFmcmFpZCBJIGRvbid0IHNlZSBhbnkg
c29sdXRpb24gdG8gbWFrZSBtYXBicyB3b3JrIHdpdGggYSBQVkgNCj4+PiBkb20wIG9uIGEg
c3lzdGVtIHdpdGggYSBtZW1vcnkgbWFwIGxpa2UgeW91IHByb3ZpZGVkLCBzaG9ydCBvZiBh
ZGRpbmcNCj4+PiBzb21lIGtpbmQgb2YgYm9kZ2UgdG8gbm90IG1hcCBhbmQgbWFyayBhcyBy
ZXNlcnZlZCBtZW1vcnkgYmVsb3cgMU1CDQo+Pj4gKGJ1dCB0aGF0IGtpbmQgb2YgZGVmZWF0
cyB0aGUgcHVycG9zZSBvZiBtYXBicykuDQo+Pg0KPj4gV2hhdCB3ZSBjb3VsZCBkbyBpbiBz
dWNoIGEgY2FzZSB3b3VsZCBiZSB0byBpbmhpYml0IHN1c3BlbmRpbmcgdGhlDQo+PiBzeXN0
ZW0sIGFuZCB0byBydW4gZG9tMCB3aXRoIGEgc2luZ2xlIGNwdSBvbmx5LiBBbiBlcnJvciBt
ZXNzYWdlDQo+PiBpbmRpY2F0aW5nIHRoYXQgdGhlIHN5c3RlbSBzaG91bGQgYmUgYm9vdGVk
IHdpdGhvdXQgbWFwYnMgc2hvdWxkIGJlDQo+PiBpc3N1ZWQsIG9mIGNvdXJzZS4NCj4gDQo+
IFRoYXQncyBnb2luZyB0byBiZSBhd2t3YXJkOiBMaW51eCBjYW4ndCB2ZXJ5IHdlbGwgaXNz
dWUgYSBtZXNzYWdlDQo+IHN1Z2dlc3RpbmcgdG8gcmVtb3ZlIHRoZSB1c2Ugb2YgYSBoeXBl
cnZpc29yIG9wdGlvbiAoYmVoYXZpb3Igb2Ygd2hpY2gNCj4gaXMgYW4gaW1wbGVtZW50YXRp
b24gZGV0YWlsIHRvIHNvbWUgZGVncmVlLCBhbmQgaGVuY2UgdGhlIG1lc3NhZ2UNCj4gY291
bGQgZW5kIHVwIGJlaW5nIG1pc2xlYWRpbmcgbGF0ZXIpLiBYZW4gYWxzbyBjYW4ndCB2ZXJ5
IHdlbGwgaXNzdWUNCj4gc3VjaCBhIG1lc3NhZ2UsIHNpbmNlIGl0IGRvZXNuJ3Qga25vdyBo
b3cgbXVjaCBvZiBsb3dtZW0gaXMgZ29pbmcgdG8NCj4gYmUgZW5vdWdoIGZvciB3aGljaGV2
ZXIgRG9tMCBPUyB0aGVyZSdzIGdvaW5nIHRvIGJlIGJvb3RlZC4gSW4NCj4gcHJpbmNpcGxl
IGFuIE9TIG1heSBnZXQgYXdheSB3aXRoIGxlc3MgdGhhbiBhIHNpbmdsZSBwYWdlLiBIZW5j
ZSBYZW4NCj4gYXQgYmVzdCBjb3VsZCBpc3N1ZSBhICJtYXkgbm90IHdvcmsiIG1lc3NhZ2Ug
KHVubGVzcyBubyBzcGFjZSBhdCBhbGwNCj4gd2FzIGF2YWlsYWJsZSBhdCBzb21lIDRrLWFs
aWduZWQgYm91bmRhcnkpLCBhbmQgZXZlbiB0aGVuIGl0IGJlaW5nIGENCj4gZmFsc2UgaW5k
aWNhdGlvbiBvbiBzb21lIChtYW55Pykgc3lzdGVtcyBtYXkgbGVhZCB0byBwZW9wbGUgbm90
IHBheWluZw0KPiBhdHRlbnRpb24gd2hlbiB0aGV5IHNob3VsZC4NCg0KQSBrZXJuZWwgbWVz
c2FnZSBjb3VsZCBiZSBwaHJhc2VkIG1vcmUgZ2VuZXJpYywgZS5nLiAiQ291bGRuJ3QgZmlu
ZCBhDQpsYXJnZSBlbm91Z2ggZnJlZSBtZW1vcnkgcmVnaW9uIGJlbG93IDFNQiwgbWF5YmUg
ZHVlIHRvIGh5cGVydmlzb3INCnNldHRpbmdzIGFuZC9vciBmaXJtd2FyZSBpc3N1ZXMuIg0K
DQoNCkp1ZXJnZW4NCg0K
--------------4sZHyZqM39qp0fxPWukRviJs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4sZHyZqM39qp0fxPWukRviJs--

--------------ZfyUh4e93zmqQHU6hcgSrYP1--

--------------ez0VEdPf9XymXnZJIQD02dFx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmN982kFAwAAAAAACgkQsN6d1ii/Ey+I
+Af8COVoVWLZi5kwaGlDIykPU0lhbCP3H0tKLPpTJzQkKtb0dotqb9FWvZk36s5R04dNdKwH9LTa
E2ubhFpTXq91Yx9g+DTUyr2Ei7F6vS2Hq6QmZ2uJbRU0N2fTbAotvoavAYmaX9Rcc0bRS7urnJxV
8e87rM7hvjJd3nLcV2s52MmaBHSrleaCZk4+w5zpC1Lyafud+4jvE1+EjxIDyL3pSfy/+Y8hK7sy
GxB79dID/xpXLuqh0v8u+5quu5sQvSO1uPhlOFtfFD2aIfoOhR8jTxe6/m37sr459dTIGSkiKz86
93RMKHRg8OuqqqmkcM7NBxlHvxpZmO6ROXLva7PDOg==
=J5Fh
-----END PGP SIGNATURE-----

--------------ez0VEdPf9XymXnZJIQD02dFx--

