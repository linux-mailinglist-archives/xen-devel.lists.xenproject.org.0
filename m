Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46486ADD7F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 12:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507315.780662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVZv-0004Mr-P3; Tue, 07 Mar 2023 11:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507315.780662; Tue, 07 Mar 2023 11:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVZv-0004Ko-M1; Tue, 07 Mar 2023 11:33:59 +0000
Received: by outflank-mailman (input) for mailman id 507315;
 Tue, 07 Mar 2023 11:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZVZt-0004HF-Ot
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 11:33:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1853e1a-bcdb-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 12:33:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2137F1FE18;
 Tue,  7 Mar 2023 11:33:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF2D213440;
 Tue,  7 Mar 2023 11:33:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SlksNSIhB2Q9DQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 11:33:54 +0000
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
X-Inumbo-ID: f1853e1a-bcdb-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678188835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIhSjodlMZHkfVxut8QZ5TfxLHihKR/af6VWsZD68ig=;
	b=XIAsqSPY1lXvy9fPVKoT2zLhSUpDd4wV03scGU1CVSrseM/IYnhI+ajnvSiyxLmTw7eFCr
	LR6Nx9/3PbevOB2SsBjFfGTa/2RKK/7CahGCbAMuRYU3qcHxFtFjbZ9NeIrl6KpW3RMVsm
	y1DIOB+7Uj+CXKXwTADiR3I/p30DxXs=
Message-ID: <d3d2b65c-ccb4-5408-38d2-d637e1f67064@suse.com>
Date: Tue, 7 Mar 2023 12:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-2-jgross@suse.com>
 <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
In-Reply-To: <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h8uoewT2IvQkXrD0UgDcYb8A"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h8uoewT2IvQkXrD0UgDcYb8A
Content-Type: multipart/mixed; boundary="------------YF1Gsw5ZKqYBihYrS7APCSVM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <d3d2b65c-ccb4-5408-38d2-d637e1f67064@suse.com>
Subject: Re: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-2-jgross@suse.com>
 <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
In-Reply-To: <e1353c0c-9501-3713-b759-0989447e6496@suse.com>

--------------YF1Gsw5ZKqYBihYrS7APCSVM
Content-Type: multipart/mixed; boundary="------------APHLmIdao37ihpotCrNUZd70"

--------------APHLmIdao37ihpotCrNUZd70
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjMgMTE6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMy4yMDIz
IDA3OjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gc3VwcG9ydCBo
eXBlcnZpc29yIGFuYWx5c2lzIG9mIGNyYXNoIGR1bXBzLCB4ZW4tc3ltcyBuZWVkcw0KPj4g
dG8gY29udGFpbiBkZWJ1Z19pbmZvLiBJdCBzaG91bGQgYmUgYWxsb3dlZCB0byBjb25maWd1
cmUgdGhlIGh5cGVydmlzb3INCj4+IHRvIGJlIGJ1aWx0IHdpdGggQ09ORklHX0RFQlVHX0lO
Rk8gaW4gbm9uLWRlYnVnIGJ1aWxkcyB3aXRob3V0IGhhdmluZw0KPj4gdG8gZW5hYmxlIEVY
UEVSVC4NCj4gDQo+IEluIGhvdyBmYXIgZG9lcyB0aGlzIGFwcGx5IHRvIHhlbi5lZmkgYXMg
d2VsbD8gKFlvdSBjYW4ndCByZWFsbHkgdXNlDQo+IHhlbi1zeW1zIGZvciBjcmFzaCBkZWJ1
Z2dpbmcgd2hlbiB0aGUgY3Jhc2ggb2NjdXJyZWQgd2l0aCB4ZW4uZWZpIGluDQo+IHVzZS4p
DQoNClRCSCBJIGRvbid0IGtub3cgd2hhdCBpcyBuZWVkZWQgZm9yIGFuYWx5c2lzIG9mIGNy
YXNoIGR1bXBzIHdpdGggdGhlIHhlbi5lZmkNCmJpbmFyeS4NCg0KPiANCj4+IFVzaW5nIGEg
cmF0aGVyIG9sZGlzaCBnY2MgKDcuNSkgaXQgd2FzIHZlcmlmaWVkIHRoYXQgY29kZSBnZW5l
cmF0aW9uDQo+PiBkb2Vzbid0IHJlYWxseSBkaWZmZXIgYmV0d2VlbiBDT05GSUdfREVCVUdf
SU5GTyBvbiBvciBvZmYgd2l0aG91dA0KPj4gQ09ORklHX0RFQlVHIGJlaW5nIHNldCAob25s
eSBvYnNlcnZlZCBkaWZmZXJlbmNlcyB3ZXJlIHNsaWdodGx5DQo+PiBkaWZmZXJlbnQgc3lt
Ym9sIGFkZHJlc3NlcywgdmVyaWZpZWQgdmlhICJvYmpkdW1wIC1kIikuIFRoZSBvbGQgZ2Nj
DQo+PiB2ZXJzaW9uIHNlbGVjdGlvbiB3YXMgYmFzZWQgb24gdGhlIGFzc3VtcHRpb24sIHRo
YXQgbmV3ZXIgZ2NjIHdvbid0DQo+PiByZWdyZXNzIGluIHRoaXMgcmVnYXJkLg0KPiANCj4g
VGhpcyBpcyBnb29kIHRvIGtub3csIGJ1dCBJJ20gc3RpbGwgY3VyaW91cyBhYm91dCB0aGUg
bWVudGlvbmVkDQo+IGRpZmZlcmVuY2VzIGluIHN5bWJvbCBhZGRyZXNzZXM6IElmIGNvZGUg
Z2VuZXJhdGlvbiBkaWRuJ3QgY2hhbmdlLCB3aGF0DQo+IGNhdXNlZCBhZGRyZXNzZXMgdG8g
ZGlmZmVyPyBJcyB0aGF0IG1lcmVseSBiZWNhdXNlIGluZGl2aWR1YWwgZnVuY3Rpb25zDQo+
IG9yIG9iamVjdHMgYXJlIGVtaXR0ZWQgaW4gZGlmZmVyZW50IG9yZGVyIGJ5IHRoZSBjb21w
aWxlcj8gKElmIHNvIEknZA0KPiBiZSBpbmNsaW5lZCB0byBpbmZlciB0aGF0IGNvbXBhcmlu
ZyBnZW5lcmF0ZWQgY29kZSBtdXN0IGhhdmUgYmVlbg0KPiBxdWl0ZSBhIGJpdCBvZiBlZmZv
cnQsIGFzIGZpcnN0IG9mIGFsbCB5b3Ugd291bGQgaGF2ZSBoYWQgdG8gdW5kbyB0aGF0DQo+
IHJlLW9yZGVyaW5nLikNCg0KSSBkaWQgYSBzaW1wbGUgZGlmZiBvZiB0aGUgdHdvIGRpc2Fz
c2VtYmx5IG91dHB1dHMgYW5kIGdvdCBvbmx5IHNtYWxsDQpkaWZmZXJlbmNlcyBmb3IgJXJp
cCByZWxhdGl2ZSBhZGRyZXNzZXMgKHRoZSBkaWZmZXJlbmNlcyB3ZXJlIGluIHRoZQ0KcmFu
Z2Ugb2YgKy8tIDMyIGJ5dGVzKS4NCg0KPiBUaGUgb3RoZXIgdGhpbmcgdG8gYXQgbGVhc3Qg
bWVudGlvbiBoZXJlIGlzIHRoYXQgd2l0aCBuZXcgZW5vdWdoDQo+IGJpbnV0aWxzLCB3aGVu
IER3YXJmIGRlYnVnIGluZm8gY2FuIGJlIGVuYWJsZWQgZm9yIGtlZXBpbmcgaW4geGVuLmVm
aSwNCj4gbGlua2luZyB0aW1lIG9mIHhlbi5lZmkgaW5jcmVhc2VzIHF1aXRlIGEgYml0IHdp
dGggREVCVUdfSU5GTz15ICh3aGljaA0KPiBpcyBhIHJlc3VsdCBvZiBsaW5raW5nIEVMRiBv
YmplY3RzIGludG8gYSBub24tRUxGIGJpbmFyeSwgd2hlbiBhdA0KPiBsZWFzdCBHTlUgbGQg
b3B0aW1pemVzIG9ubHkgdGhlIEVMRiAtPiBFTEYgY2FzZSB3aGVuIHByb2Nlc3NpbmcgdGhl
DQo+IFttYXNzaXZlIGFtb3VudCBvZl0gcmVsb2NhdGlvbnMpLg0KDQpPa2F5LCBJIGNhbiBh
ZGQgdGhpcy4NCg0KPiANCj4+IFNvIG1vdmUgQ09ORklHX0RFQlVHX0lORk8gb3V0IG9mIHRo
ZSBzZWN0aW9uIGd1YXJkZWQgYnkgRVhQRVJULg0KPiANCj4gSXNuJ3QgdGhlIHByaW9yIERF
QlVHIGRlcGVuZGVuY3kgYXMgcmVsZXZhbnQ/DQoNCk5vdCBmb3IgdGhlIGNhc2UgIm5vbi1k
ZWJ1ZyBidWlsZHMiIHRoZSBwYXRjaCBpcyBhZGRyZXNzaW5nLg0KDQo+IA0KPj4gLS0tIGEv
eGVuL0tjb25maWcuZGVidWcNCj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnDQo+PiBAQCAt
MTEsNiArMTEsMTMgQEAgY29uZmlnIERFQlVHDQo+PiAgIA0KPj4gICAJICBZb3UgcHJvYmFi
bHkgd2FudCB0byBzYXkgJ04nIGhlcmUuDQo+PiAgIA0KPj4gK2NvbmZpZyBERUJVR19JTkZP
DQo+PiArCWJvb2wgIkNvbXBpbGUgWGVuIHdpdGggZGVidWcgaW5mbyINCj4+ICsJZGVmYXVs
dCBERUJVRw0KPj4gKwktLS1oZWxwLS0tDQo+IA0KPiBOaXQ6IEV2ZW4gaWYganVzdCBjb2Rl
IG1vdmVtZW50LCBwbGVhc2UgdXNlICJoZWxwIiBpbiB0aGUgbW92ZWQNCj4gaW5zdGFuY2Uu
DQoNCk9rYXkuDQoNCj4gDQo+PiArCSAgSWYgeW91IHNheSBZIGhlcmUgdGhlIHJlc3VsdGlu
ZyBYZW4gd2lsbCBpbmNsdWRlIGRlYnVnZ2luZyBpbmZvDQo+PiArCSAgcmVzdWx0aW5nIGlu
IGEgbGFyZ2VyIGJpbmFyeSBpbWFnZS4NCj4+ICsNCj4+ICAgaWYgREVCVUcgfHwgRVhQRVJU
DQo+IA0KPiBUaGUgbmV3IHBsYWNlbWVudCBpc24ndCB2ZXJ5IGhlbHBmdWwgd2hlbiBjb25z
aWRlcmluZyBzb21lIG9mIHRoZSB3YXlzDQo+IGtjb25maWcgZGF0YSBpcyBwcmVzZW50ZWQu
IEF0IGxlYXN0IGZvciB0aGUgbm9uLWdyYXBoaWNhbCBwcmVzZW50YXRpb24NCj4gaXQgdXNl
ZCB0byBiZSB0aGUgY2FzZSB0aGF0IGhpZXJhcmNoaWVzIHdlcmUgcHJlc2VudGVkIHByb3Bl
cmx5IG9ubHkNCj4gd2hlbiBkZXBlbmRlbmNpZXMgaW1tZWRpYXRlbHkgZm9sbG93ZWQgdGhl
aXIgZGVwZW5kZW50cyAoaS5lLiBoZXJlOg0KPiBERUJVRyBpcyBhIGRlcGVuZGVudCBvZiBl
dmVyeXRoaW5nIGluc2lkZSB0aGUgImlmIiBhYm92ZSkuIFRoZXJlZm9yZSBJDQo+IHRoaW5r
IHJhdGhlciB0aGFuIG1vdmluZyB0aGUgYmxvY2sgdXAgeW91IG1heSBiZXR0ZXIgbW92ZSBp
dCBkb3duIHBhc3QNCj4gdGhlICJlbmRpZiIuDQoNCkZpbmUgd2l0aCBtZS4NCg0KDQpKdWVy
Z2VuDQo=
--------------APHLmIdao37ihpotCrNUZd70
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------APHLmIdao37ihpotCrNUZd70--

--------------YF1Gsw5ZKqYBihYrS7APCSVM--

--------------h8uoewT2IvQkXrD0UgDcYb8A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQHISIFAwAAAAAACgkQsN6d1ii/Ey/4
6Qf9HeOttdGw1X/JNUsyU5IP8xwJ3Ji7YFwIo30/LfQtC8wJOM/PyTRqgWlzXBks47ZG5PeH7TTQ
HFebS/t2y/yS+lmtBTRbKqJTTem/WV0h6kKd/zeJSYcC1NDtIEt7fHIpXPr4sSko0g5FoOuVEo6T
a/2sXwEqMp4AOvwLrl/9YzoW9L+JvsED299j96+/e4i2KYfE2NrJQRSMcStpm/uFQHwgKLCl8GIf
NmFV8bsoC3HCe3pIvgjQtS3plnqo6R6gmni7XCfSYL//xst+dMN6POEgUY0AHunUehdUFQVwe+JA
mAEVKIKn2ia8SHHWSCNAXR6u+nPP9jWElSIZEd3Big==
=8gVL
-----END PGP SIGNATURE-----

--------------h8uoewT2IvQkXrD0UgDcYb8A--

