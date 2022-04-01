Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B018D4EEEEC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:11:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297421.506655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHzc-0000sl-L7; Fri, 01 Apr 2022 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297421.506655; Fri, 01 Apr 2022 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHzc-0000pp-Ho; Fri, 01 Apr 2022 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 297421;
 Fri, 01 Apr 2022 14:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1naHzb-0000pj-2Z
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:11:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 942b12d5-b1c5-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:11:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F3DF2160A;
 Fri,  1 Apr 2022 14:11:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B19271331E;
 Fri,  1 Apr 2022 14:11:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tFgKKvwHR2JCcQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Apr 2022 14:11:08 +0000
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
X-Inumbo-ID: 942b12d5-b1c5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648822269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5T4I/BUhiYm8R0fl+2XzTBsaChUa1rSub7WEeYdBQw=;
	b=Ux5ovpjLQ40pHrB39hmAWyE1shXjYKzcJBb7s9Agf2Rg9B8sLbp1voygPd1GqkhjdZ1CA7
	7ijVBFoxPIRvwkyg6P5rQzrqER6EyzZwAL3tC4h90/PfoxjduE6br3R5VGXRRPs5VB0MS5
	SIekvjnwCcztFYqrQZTVL894OLoUqLc=
Message-ID: <11cf2108-7210-376c-c6ac-0b5b404c0eb6@suse.com>
Date: Fri, 1 Apr 2022 16:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
 <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
 <57312254-b599-6de5-04aa-f88907c49163@xen.org>
 <5522e39c-e7b6-eecf-526d-abe6964e068c@suse.com>
 <a34092cd-0eeb-ac8b-a2f3-650f022a5e2c@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <a34092cd-0eeb-ac8b-a2f3-650f022a5e2c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ucg8LmSg7Ye0gqYWjcOzEl0q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ucg8LmSg7Ye0gqYWjcOzEl0q
Content-Type: multipart/mixed; boundary="------------VdgOorOWQQbyUILiublFBFCu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <11cf2108-7210-376c-c6ac-0b5b404c0eb6@suse.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
 <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
 <57312254-b599-6de5-04aa-f88907c49163@xen.org>
 <5522e39c-e7b6-eecf-526d-abe6964e068c@suse.com>
 <a34092cd-0eeb-ac8b-a2f3-650f022a5e2c@xen.org>
In-Reply-To: <a34092cd-0eeb-ac8b-a2f3-650f022a5e2c@xen.org>

--------------VdgOorOWQQbyUILiublFBFCu
Content-Type: multipart/mixed; boundary="------------ZSyS50h38fpkyVXDfqal718e"

--------------ZSyS50h38fpkyVXDfqal718e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDQuMjIgMTY6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzA0LzIwMjIgMTQ6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwMS4wNC4yMiAxNTozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAwMS8wNC8yMDIyIDExOjQ2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBPbiAwMS4wNC4yMiAxMjoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gSGks
DQo+Pj4+Pg0KPj4+Pj4gSSBoYXZlIHBvc3RlZCBzb21lIGNvbW1lbnRzIGluIHYzIGFmdGVy
IHlvdSBzZW50IHRoaXMgdmVyc2lvbi4gUGxlYXNlIGhhdmUgDQo+Pj4+PiBhIGxvb2suDQo+
Pj4+Pg0KPj4+Pj4gT24gMDEvMDQvMjAyMiAwMTozOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPj4+Pj4+ICtzdGF0aWMgaW50IGluaXRfZG9tYWluKHN0cnVjdCB4c19oYW5kbGUg
KnhzaCwgbGlieGxfZG9taW5mbyAqaW5mbykNCj4+Pj4+PiArew0KPj4+Pj4+ICvCoMKgwqAg
c3RydWN0IHhjX2ludGVyZmFjZV9jb3JlICp4Y2g7DQo+Pj4+Pj4gK8KgwqDCoCBsaWJ4bF91
dWlkIHV1aWQ7DQo+Pj4+Pj4gK8KgwqDCoCB1aW50NjRfdCB4ZW5zdG9yZV9ldnRjaG4sIHhl
bnN0b3JlX3BmbjsNCj4+Pj4+PiArwqDCoMKgIGludCByYzsNCj4+Pj4+PiArDQo+Pj4+Pj4g
K8KgwqDCoCBwcmludGYoIkluaXQgZG9tMGxlc3MgZG9tYWluOiAldVxuIiwgaW5mby0+ZG9t
aWQpOw0KPj4+Pj4+ICvCoMKgwqAgeGNoID0geGNfaW50ZXJmYWNlX29wZW4oMCwgMCwgMCk7
DQo+Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgwqAgcmMgPSB4Y19odm1fcGFyYW1fZ2V0KHhjaCwg
aW5mby0+ZG9taWQsIEhWTV9QQVJBTV9TVE9SRV9FVlRDSE4sDQo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZ4ZW5zdG9yZV9l
dnRjaG4pOw0KPj4+Pj4+ICvCoMKgwqAgaWYgKHJjICE9IDApIHsNCj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgcHJpbnRmKCJGYWlsZWQgdG8gZ2V0IEhWTV9QQVJBTV9TVE9SRV9FVlRDSE5c
biIpOw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsNCj4+Pj4+PiArwqDCoMKg
IH0NCj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoCAvKiBBbGxvYyB4ZW5zdG9yZSBwYWdlICov
DQo+Pj4+Pj4gK8KgwqDCoCBpZiAoYWxsb2NfeHNfcGFnZSh4Y2gsIGluZm8sICZ4ZW5zdG9y
ZV9wZm4pICE9IDApIHsNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJFcnJvciBv
biBhbGxvYyBtYWdpYyBwYWdlc1xuIik7DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAxOw0KPj4+Pj4+ICvCoMKgwqAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIHJjID0g
eGNfZG9tX2dudHRhYl9zZWVkKHhjaCwgaW5mby0+ZG9taWQsIHRydWUsDQo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAo
eGVuX3Bmbl90KS0xLCB4ZW5zdG9yZV9wZm4sIDAsIDApOw0KPj4+Pj4+ICvCoMKgwqAgaWYg
KHJjKQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIoMSwgInhjX2RvbV9nbnR0YWJfc2Vl
ZCIpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIGxpYnhsX3V1aWRfZ2VuZXJhdGUoJnV1
aWQpOw0KPj4+Pj4+ICvCoMKgwqAgeGNfZG9tYWluX3NldGhhbmRsZSh4Y2gsIGluZm8tPmRv
bWlkLCBsaWJ4bF91dWlkX2J5dGVhcnJheSgmdXVpZCkpOw0KPj4+Pj4+ICsNCj4+Pj4+PiAr
wqDCoMKgIHJjID0gZ2VuX3N0dWJfanNvbl9jb25maWcoaW5mby0+ZG9taWQsICZ1dWlkKTsN
Cj4+Pj4+PiArwqDCoMKgIGlmIChyYykNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZXJyKDEs
ICJnZW5fc3R1Yl9qc29uX2NvbmZpZyIpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIC8q
IE5vdyBldmVyeXRoaW5nIGlzIHJlYWR5OiBzZXQgSFZNX1BBUkFNX1NUT1JFX1BGTiAqLw0K
Pj4+Pj4+ICvCoMKgwqAgcmMgPSB4Y19odm1fcGFyYW1fc2V0KHhjaCwgaW5mby0+ZG9taWQs
IEhWTV9QQVJBTV9TVE9SRV9QRk4sDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlbnN0b3JlX3Bmbik7DQo+Pj4+Pg0KPj4+
Pj4gT24gcGF0Y2ggIzEsIHlvdSB0b2xkIG1lIHlvdSBkaWRuJ3Qgd2FudCB0byBhbGxvY2F0
ZSB0aGUgcGFnZSBpbiBYZW4gDQo+Pj4+PiBiZWNhdXNlIGl0IHdvdWxkbid0IGJlIGluaXRp
YWxpemVkIGJ5IFhlbnN0b3JlZC4gQnV0IHRoaXMgaXMgd2hhdCB3ZSBhcmUgDQo+Pj4+PiBk
b2luZyBoZXJlLg0KPj4+Pg0KPj4+PiBYZW5zdG9yZSAoYXQgbGVhc3QgdGhlIEMgdmFyaWFu
dCkgaXMgb25seSB1c2luZyB0aGUgZml4ZWQgZ3JhbnQgcmVmDQo+Pj4+IEdOVFRBQl9SRVNF
UlZFRF9YRU5TVE9SRSwgc28gaXQgZG9lc24ndCBuZWVkIHRoZSBwYWdlIHRvIGJlIGFkdmVy
dGlzZWQNCj4+Pj4gdG8gdGhlIGd1ZXN0LiBBbmQgdGhlIG1hcHBpbmcgaXMgZG9uZSBvbmx5
IHdoZW4gdGhlIGRvbWFpbiBpcyBiZWluZw0KPj4+PiBpbnRyb2R1Y2VkIHRvIFhlbnN0b3Jl
Lg0KPj4+DQo+Pj4gQW5kIHdlIGRvbid0IGV4cGVjdCB0aGUgZ3Vlc3QgdG8gdXNlIHRoZSBn
cmFudCBlbnRyeSB0byBmaW5kIHRoZSB4ZW5zdG9yZSBwYWdlPw0KPj4+Pg0KPj4+Pj4NCj4+
Pj4+IFRoaXMgd291bGQgYmUgYSBwcm9ibGVtIGlmIExpbnV4IGlzIHN0aWxsIGJvb3Rpbmcg
YW5kIGhhc24ndCB5ZXQgY2FsbCANCj4+Pj4+IHhlbmJ1c19wcm9iZV9pbml0Y2FsbCgpLg0K
Pj4+Pj4NCj4+Pj4+IEkgdW5kZXJzdGFuZCB3ZSBuZWVkIHRvIGhhdmUgdGhlIHBhZ2Ugc2V0
dXAgYmVmb3JlIHJhaXNpbmcgdGhlIGV2ZW50IA0KPj4+Pj4gY2hhbm5lbC4gSSBkb24ndCB0
aGluayB3ZSBjYW4gYWxsb3cgWGVuc3RvcmVkIHRvIHNldCB0aGUgSFZNX1BBUkFNIChpdCBt
YXkgDQo+Pj4+PiBydW4gaW4gYSBkb21haW4gd2l0aCBsZXNzIHByaXZpbGVnZSkuIFNvIEkg
dGhpbmsgd2UgbWF5IG5lZWQgdG8gY3JlYXRlIGEgDQo+Pj4+PiBzZXBhcmF0ZSBjb21tYW5k
IHRvIGtpY2sgdGhlIGNsaWVudCAobm90IGdyZWF0KS4NCj4+Pj4+DQo+Pj4+PiBKdWVyZ2Vu
LCBhbnkgdGhvdWdodHM/DQo+Pj4+DQo+Pj4+IEkgdGhpbmsgaXQgc2hvdWxkIHdvcmsgbGlr
ZSB0aGF0Og0KPj4+Pg0KPj4+PiAtIHNldHVwIHRoZSBncmFudCB2aWEgeGNfZG9tX2dudHRh
Yl9zZWVkKCkNCj4+Pj4gLSBpbnRyb2R1Y2UgdGhlIGRvbWFpbiB0byBYZW5zdG9yZQ0KPj4+
PiAtIGNhbGwgeGNfaHZtX3BhcmFtX3NldCgpDQo+Pj4+DQo+Pj4+IFdoZW4gdGhlIGd1ZXN0
IGlzIHJlY2VpdmluZyB0aGUgZXZlbnQsIGl0IHNob3VsZCB3YWl0IGZvciB0aGUgeGVuc3Rv
cmUNCj4+Pj4gcGFnZSB0byBhcHBlYXIuDQo+Pj4gSUlVQywgdGhpcyB3b3VsZCBtZWFuIHRo
ZSBndWVzdCB3b3VsZCBuZWVkIHRvIGRvIHNvbWUgc29ydCBvZiBidXN5IGxvb3AgdW50aWwg
DQo+Pj4gdGhlIHhlbnN0b3JlIHBhZ2UgdG8gYXBwZWFyLg0KPj4NCj4+IExvb2tpbmcgZm9y
IGl0IGV2ZXJ5IHNlY29uZCBvciBzbyB3b3VsZCBiZSBlbm91Z2guDQo+IA0KPiBUaGlzIGlz
IGEgYmV0dGVyIHRoYW4gYSBidXN5IGxvb3AgYnV0IG5vdCBieSBtdWNoLiBJIHdvdWxkIGFy
Z3VlIGEgZGVzaWduIHRoYXQgDQo+IHJlcXVpcmVzIHRvIHBvbGwgYWZ0ZXIgcmVjZWl2aW5n
IGFuIGludGVycnVwdCBpcyBicm9rZW4uDQo+IA0KPj4NCj4+PiBJZiBzbywgdGhpcyBkb2Vz
bid0IHNvdW5kIGdyZWF0IHRvIG1lLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBo
YXZlIGEgDQo+Pj4gZmxhZyBpbiB0aGUgcGFnZSB0byBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBw
YWdlIGlzIG5vdCByZWFkeS4NCj4+Pg0KPj4+IFhlbnN0b3JlZCBjb3VsZCB0aGVuIGNsZWFy
IHRoZSBmbGFnIGJlZm9yZSByYWlzaW5nIHRoZSBldmVudCBjaGFubmVsLg0KPj4NCj4+IEht
bSwgdGhlICJjb25uZWN0aW9uIiBmaWVsZCBjb3VsZCBiZSB1c2VkIGZvciB0aGF0Lg0KPiAN
Cj4gSSB0aG91Z2h0IGFib3V0IHRoZSBmaWVsZCBidXQgdGhlIGRlc2NyaXB0aW9uIGRvZXNu
J3QgZW50aXJlbHkgbWF0Y2ggd2hhdCB3ZSANCj4gd2FudC4gSW4gcGFydGljdWxhciwgdGhl
IHNwZWMgc2F5cyBvbmx5IHRoZSBndWVzdCBzaG91bGQgc2V0IHRoZSB2YWx1ZSB0byAxIA0K
PiAoaS5lLiByZWNvbm5lY3QpLiBNYXliZSB0aGlzIGNvdWxkIGJlIHJlbGF4ZWQ/DQo+IA0K
Pj4NCj4+IEl0IHdvdWxkIG1lYW4sIHRob3VnaCwgdGhhdCBlLmcuIGxpYnhsIHdvdWxkIG5l
ZWQgdG8gaW5pdGlhbGl6ZSB0aGUNCj4+IHBhZ2UgYWNjb3JkaW5nbHkgYmVmb3JlIGNhbGxp
bmcgeHNfaW50cm9kdWNlKCkNCj4gDQo+IGxpYnhsIG9ubHkgY3JlYXRlIGRvbWFpbiBwYXVz
ZWQuIFNvIEkgZG9uJ3QgdGhpbmsgaXQgd291bGQgYmUgbmVjZXNzYXJ5IHRvIA0KPiB1cGRh
dGUgaXQuDQoNCk1heWJlIG5vdCBsaWJ4bCwgYnV0IHdob2V2ZXIgaXMgY2FsbGluZyB4Y19k
b21fZ250dGFiX3NlZWQoKSwNCnhjX2h2bV9wYXJhbV9zZXQoKSBhbmQvb3IgeHNfaW50cm9k
dWNlKCkgbmVlZHMgdG8gc2V0IHRoZSBmaWVsZCwgaW4NCm9yZGVyIHRvIGhhdmUgYW4gZWZm
ZWN0IG9mIFhlbnN0b3JlIHJlc2V0dGluZyBpdC4NCg0KDQpKdWVyZ2VuDQo=
--------------ZSyS50h38fpkyVXDfqal718e
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZSyS50h38fpkyVXDfqal718e--

--------------VdgOorOWQQbyUILiublFBFCu--

--------------Ucg8LmSg7Ye0gqYWjcOzEl0q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJHB/wFAwAAAAAACgkQsN6d1ii/Ey9j
Vwf+KO+LAnoyGRTgZLLfgHZCxoycQqr382l4CbEOlPaXrOEQnrvybu/i7zQFihRPJ6KWgkC17QNR
4KeXj4xJQW0wanq1EknRLWNQYhoUKttgLTcQuK/7w2yt9EJkJCFvrjKwuwQVOGAwhKutiOXllMd3
kFztOtGU2J/JJGgY8nIzDHZx1fQiLT+HhlfxRs06cu+rDh0lNGoAe7ZJP84HWlak14a9Gx0XUl7f
AklRlUKxQ1ZrMFQ1Huzc+kD/8LBvlZbMUjTCNbo7Hrg4vYGdwr64Dwim91XPPjPqBvPcWoc1c132
7aKwKzbM/GIa5ssTeedx4n20UrA2rj8OFgYOnQLpNQ==
=3g9c
-----END PGP SIGNATURE-----

--------------Ucg8LmSg7Ye0gqYWjcOzEl0q--

