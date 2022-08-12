Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF64590FD2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 12:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385563.621239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSLJ-0005hf-7y; Fri, 12 Aug 2022 10:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385563.621239; Fri, 12 Aug 2022 10:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSLJ-0005fF-5M; Fri, 12 Aug 2022 10:56:41 +0000
Received: by outflank-mailman (input) for mailman id 385563;
 Fri, 12 Aug 2022 10:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oMSLH-0005f9-Nx
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 10:56:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6feceb22-1a2d-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 12:56:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB0882041B;
 Fri, 12 Aug 2022 10:56:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9AE5B13305;
 Fri, 12 Aug 2022 10:56:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rghUJOQx9mJoaAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 12 Aug 2022 10:56:36 +0000
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
X-Inumbo-ID: 6feceb22-1a2d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660301796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zuoa2xO47g6XI92DEFL9YIR7Juqd1ZyKsTUon0Wq/BM=;
	b=VmcMyy2AfT2G4ma/LFhpjHLHcqm7VYYYXFovhrBs6UtRZ0TUqZ5RxsfdNgBR2Bf0uFHTSO
	BdsE3MLNUEMsaV2qBn7VhOp6p4EZFTBW1OAE6Zc2F5zM4XlI48aKJcuG67kKuECwEfBAKm
	WeS5o0WOYZ19LYTfAQQB93zDnCIjeIw=
Message-ID: <1455f58e-f035-083d-c1bb-13bafb45f933@suse.com>
Date: Fri, 12 Aug 2022 12:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
 <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
 <68ca5d7c-d443-ea48-3984-ff76652392df@xen.org>
 <9e485550-ae67-151c-daf9-964fdb2a027e@suse.com>
 <65772df3-a462-65fe-864e-d613d32c76e0@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
In-Reply-To: <65772df3-a462-65fe-864e-d613d32c76e0@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rFQ2e3qeYUmBk8zTUrLXh0XB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rFQ2e3qeYUmBk8zTUrLXh0XB
Content-Type: multipart/mixed; boundary="------------Ddh7u3VWKQU0vof09wjsWzly";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <1455f58e-f035-083d-c1bb-13bafb45f933@suse.com>
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
 <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
 <68ca5d7c-d443-ea48-3984-ff76652392df@xen.org>
 <9e485550-ae67-151c-daf9-964fdb2a027e@suse.com>
 <65772df3-a462-65fe-864e-d613d32c76e0@xen.org>
In-Reply-To: <65772df3-a462-65fe-864e-d613d32c76e0@xen.org>

--------------Ddh7u3VWKQU0vof09wjsWzly
Content-Type: multipart/mixed; boundary="------------315qE0e1J5bSnYby0JCPozov"

--------------315qE0e1J5bSnYby0JCPozov
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDguMjIgMTE6MTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA4LzA4LzIwMjIgMTI6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwOC4wOC4yMiAxMzowMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBUaGlzIHdvdWxk
IGJyZWFrIHRoZSB1c2Ugb2YgeGVuc3RvcmUtc3R1YmRvbSBmb3Igc3VjaCBhIHNldHVwLg0K
Pj4+DQo+Pj4gSSBhbSBub3Qgc3VyZSB3aHkgaXQgd291bGQgYnJlYWsgdGhlIHVzZSBvZiB4
ZW5zdG9yZS1zdHViZG9tLiBBbiBhcHBsaWNhdGlvbiANCj4+PiB3aWxsIGFscmVhZHkgbmVl
ZCB0byBjb3BlIHdpdGggdGhlIGNhc2UgWGVuc3RvcmVkIGRvZXNuJ3Qgc3VwcG9ydCBhIGZl
YXR1cmUuDQo+Pg0KPj4gU29tZW9uZSByZWx5aW5nIHRvIGJlIGFibGUgdG8gc3dpdGNoIG9m
ZiBhIGZlYXR1cmUgb24gYSBzb2NrZXQgY29ubmVjdGlvbg0KPj4gbWlnaHQgZ2V0IGludG8g
dHJvdWJsZSB0cnlpbmcgdG8gZG8gdGhlIHNhbWUgd2hlbiBydW5uaW5nIHdpdGggeGVuc3Rv
cmUtc3R1YmRvbS4NCj4gDQo+IFRoaXMgaXMgbm90IHZlcnkgZGlmZmVyZW50IGZyb20gYW4g
YXBwbGljYXRpb24gdGhhdCB3YXMgYnVpbHQgYWdhaW5zdCBhbiBvbGQgDQo+IFhlbnN0b3Jl
ZCBhbmQgd291bGQgbm90IGJlIGNhcGFibGUgdG8gdGFsayBwcm9wZXJseSB3aXRoIHRoZSBu
ZXcgWGVuc3RvcmVkIGlmIA0KPiB0aGUgZmVhdHVyZSBpcyBlbmFibGVkLiBJIHVuZGVyc3Rh
bmQgdGhhdC4uLg0KPiANCj4+IFN3aXRjaGluZyBhIGZlYXR1cmUgb2ZmIHdpbGwgZWl0aGVy
IG5vdCB3b3JrLCBvciBzd2l0Y2ggdGhlIGZlYXR1cmUgb2ZmIGZvciBhbGwNCj4+IGRvbTAg
Y29ubmVjdGlvbnMgKHdoaWNoIGlzIGEgc2luZ2xlIG9uZSwgb2YgY291cnNlKS4NCj4gDQo+
IC4uLiB3aGVuIHVzaW5nIHhlbnN0b3JlLXN0dWJkb20geGVuc3RvcmVkIGl0IG1lYW5zIHRo
YXQgdGhlIGZlYXR1cmUgd2lsbCBoYXZlIHRvIA0KPiBiZSBkaXNhYmxlIGZvciBhbGwgZG9t
MCBjb25uZWN0aW9ucy4NCg0KV2FpdCwgSSBkb24ndCB0aGluayB3ZSBjYW4gZXZlciBhZGQg
ZmVhdHVyZXMgd2hpY2ggd2lsbCBjaGFuZ2UgdGhlIGJlaGF2aW9yIG9mDQpYZW5zdG9yZSB3
aGVuIHRob3NlIG5ldyBmZWF0dXJlcyBhcmVuJ3QgYmVpbmcgdXNlZCBhY3RpdmVseS4gVGhl
IG5ldyBmZWF0dXJlcw0Kc2hvdWxkIGFsd2F5cyBiZSBvbiB0b3Agb2YgdGhlIGV4aXN0aW5n
IGZ1bmN0aW9uYWxpdHkuDQoNCj4gSG93ZXZlciwgaXQgc2VlbXMgdW5saWtlbHkgdG8gbWUg
dGhhdCBzb21lb25lIHdpbGwgc3dpdGNoIHRvIGEgeGVuc3RvcmUtc3R1YmRvbSANCj4gb24g
YSB3aGltIGJlY2F1c2UgdGhlcmUgYXJlIGFsc28gc2NhbGFiaWxpdHkgY29uY2VybnMgKG9u
ZSByaW5nIHRvIHJ1bGUgYWxsIA0KPiBjb25uZWN0aW9ucykuIFNvIEkgdGhpbmsgaXQgd291
bGQgYmUgZmFpciB0byBzYXkgdGhhdCB5b3VyIGFwcGxpY2F0aW9uIG1heSBuZWVkIA0KPiB0
byBiZSB0d2VhayBpZiB5b3UgYXJlIG5vdCB1c2luZyB0aGUgc2FtZSBmZWF0dXJlIGFzIHRo
ZSBzeXN0ZW0uDQoNCk5vLCB0aGlzIHNob3VsZCBuZXZlciBiZSB0aGUgY2FzZSBJTU8uIFNl
ZSBhYm92ZS4NCg0KPiANCj4+DQo+Pj4gQXQgd2hpY2ggcG9pbnQsIGl0IHdvdWxkIGJlIGVh
c3kgdG8gc2F5ICJJIGRvbid0IHdhbnQgdGhpcyBmZWF0dXJlIiB3aGVuIA0KPj4+IHVzaW5n
IGEgc29ja2V0Lg0KPj4NCj4+IEkgZG9uJ3Qgc2VlIHRoZSB2YWx1ZSBvZiB0aGF0LiBJZiB5
b3UgZG9uJ3Qgd2FudCBhIGZlYXR1cmUsIGp1c3QgZG9uJ3QgdXNlIGl0Lg0KPiANCj4gVGhp
cyBpcyBub3QgdGhhdCBzaW1wbGUuIFlvdXIgYXNzdW1wdGlvbiBpcyB0aGUgZmVhdHVyZSB3
aWxsIG5vdCBjaGFuZ2UgdGhlIA0KPiBiZWhhdmlvciBleHBvc2VkIHRvIHRoZSBhcHBsaWNh
dGlvbi4NCg0KQ29ycmVjdC4NCg0KPiANCj4gSSBkb24ndCB0aGluayB3ZSBoYXZlIHN1Y2gg
ZmVhdHVyZSB0b2RheSBidXQgSSBkb24ndCBzZWUgd2hhdCBwcmV2ZW50cyB1cyB0byBkbyAN
Cj4gdGhhdC4NCg0KQ29tcGF0aWJpbGl0eSBwcmV2ZW50cyB1cyBkb2luZyB0aGF0Lg0KDQpJ
ZiB3ZSB3YW50IGRpZmZlcmVudCBiZWhhdmlvciwgd2UgbmVlZCB0byB1c2UgZGlmZmVyZW50
IG9yIGV4dGVuZGVkIGNvbW1hbmRzDQooZS5nLiBsaWtlIHRoZSBhZGRpdGlvbmFsICJkZXB0
aCIgcGFyYW1ldGVyIG9mIFNFVF9XQVRDSCkuDQoNCg0KSnVlcmdlbg0K
--------------315qE0e1J5bSnYby0JCPozov
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------315qE0e1J5bSnYby0JCPozov--

--------------Ddh7u3VWKQU0vof09wjsWzly--

--------------rFQ2e3qeYUmBk8zTUrLXh0XB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL2MeQFAwAAAAAACgkQsN6d1ii/Ey/G
wAf/bVMhGVyUjk5gDT4qyGzbfA3EmhYd0Z85Mw6UEYxYoaBmLxJgXHrBCVX34iD12qpkgNy7ZbiM
fkHIJ8K0QHucA91K0qxoz5pcOmcl774gyWNfseXKVm9zsOIrBqXgDhnZ/lvEwwKpCOyFrTZioH7y
lQBGERZ1KqO2Di0eJ2I+OoYVOa+neBm2rtOP+ifw1fImhG8nBIS9n8qw6kjwJdBLkehY+NCI8VXu
V/7l1aJJH5DJYj5bBX1ot11OD/i3Hml7on3d9sw4AoeLbWmuW8v5mWUleqiMKNZ1fl9Fj/i3aDzp
OaPZvHcaZseNMiVI3RpIdB5g3csoH7f6bsBs4slllA==
=PIU5
-----END PGP SIGNATURE-----

--------------rFQ2e3qeYUmBk8zTUrLXh0XB--

