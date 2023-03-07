Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9546AE197
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507421.780882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXvN-0007d5-HL; Tue, 07 Mar 2023 14:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507421.780882; Tue, 07 Mar 2023 14:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXvN-0007b6-EU; Tue, 07 Mar 2023 14:04:17 +0000
Received: by outflank-mailman (input) for mailman id 507421;
 Tue, 07 Mar 2023 14:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZXvL-0007b0-L4
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:04:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f04a6424-bcf0-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:04:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 68F061FDD1;
 Tue,  7 Mar 2023 14:04:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3011613440;
 Tue,  7 Mar 2023 14:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1Z9JClxEB2QgbQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 14:04:12 +0000
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
X-Inumbo-ID: f04a6424-bcf0-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678197852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJR3LUtl2kDfYB2pLO9FnSnEO18J5Fw09eTwyKgY3TE=;
	b=azuT+geI4R9lbd+OawhJDD94kIPKNTJwbtshrnLMMKx/dErwJniONYg5P/xd0ieYzhqV54
	RiEHHWg6uC/xRO+dhIw8sS58SNr3k4uEBEQzqRwLUxahLn/nDEDxHYKi3Tw3SmL0gZVmM9
	BUS+lhtuy8YVasVuj9gFmDFQSLECfb4=
Message-ID: <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
Date: Tue, 7 Mar 2023 15:04:11 +0100
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
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
In-Reply-To: <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rXCW2TQvma0iTsozsYxvR5OY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rXCW2TQvma0iTsozsYxvR5OY
Content-Type: multipart/mixed; boundary="------------s6jhj5JT5NNC9nkx2Yy4AFyH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
In-Reply-To: <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>

--------------s6jhj5JT5NNC9nkx2Yy4AFyH
Content-Type: multipart/mixed; boundary="------------tVPgJ6fj78Z0EIzHRJFACirY"

--------------tVPgJ6fj78Z0EIzHRJFACirY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjMgMTE6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMy4yMDIz
IDA3OjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL0tjb25maWcuZGVi
dWcNCj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnDQo+PiBAQCAtMTUsOCArMTUsMTEgQEAg
Y29uZmlnIERFQlVHX0lORk8NCj4+ICAgCWJvb2wgIkNvbXBpbGUgWGVuIHdpdGggZGVidWcg
aW5mbyINCj4+ICAgCWRlZmF1bHQgREVCVUcNCj4+ICAgCS0tLWhlbHAtLS0NCj4+IC0JICBJ
ZiB5b3Ugc2F5IFkgaGVyZSB0aGUgcmVzdWx0aW5nIFhlbiB3aWxsIGluY2x1ZGUgZGVidWdn
aW5nIGluZm8NCj4+IC0JICByZXN1bHRpbmcgaW4gYSBsYXJnZXIgYmluYXJ5IGltYWdlLg0K
Pj4gKwkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gYnVpbGQgWGVuIHdpdGggZGVidWcg
aW5mb3JtYXRpb24uIFRoaXMNCj4+ICsJICBpbmZvcm1hdGlvbiBpcyBuZWVkZWQgZS5nLiBm
b3IgZG9pbmcgY3Jhc2ggZHVtcCBhbmFseXNpcyBvZiB0aGUNCj4+ICsJICBoeXBlcnZpc29y
IHZpYSB0aGUgImNyYXNoIiB0b29sLg0KPj4gKwkgIFNheWluZyBZIHdpbGwgaW5jcmVhc2Ug
dGhlIHNpemUgb2YgeGVuLXN5bXMgYW5kIHRoZSBidWlsdCBFRkkNCj4+ICsJICBiaW5hcnku
DQo+IA0KPiBMYXJnZWx5IGZpbmUgd2l0aCBtZSwganVzdCBvbmUgcXVlc3Rpb246IFdoeSBk
byB5b3UgbWVudGlvbiB4ZW4tc3ltcyBieQ0KPiBuYW1lLCBidXQgdGhlbiB2ZXJiYWxseSBk
ZXNjcmliZSB4ZW4uZWZpPyBBbmQgc2luY2UsIHVubGlrZSBmb3IgeGVuLXN5bXMsDQoNCkZv
ciB4ZW4tc3ltcyBJIGNvdWxkbid0IGZpbmQgYW4gZWFzaWx5IHVuZGVyc3RhbmRhYmxlIHdv
cmRpbmcuIEknZCBiZSBmaW5lDQp3aXRoIGp1c3Qgc2F5aW5nICJ4ZW4uZWZpIi4NCg0KPiB0
aGlzIGFmZmVjdHMgdGhlIGluc3RhbGxlZCBiaW5hcnkgYWN0dWFsbHkgdXNlZCBmb3IgYm9v
dGluZyAod2hpY2ggbWF5DQo+IGJlIHBsYWNlZCBvbiBhIHNwYWNlIGNvbnN0cmFpbmVkIHBh
cnRpdGlvbiksIGl0IG1heSBiZSBwcnVkZW50IHRvDQo+IG1lbnRpb24gSU5TVEFMTF9FRklf
U1RSSVAgaGVyZSAoYXMgYSB3YXkgdG8gcmVkdWNlIHRoZSBiaW5hcnkgc2l6ZSBvZg0KPiB3
aGF0IGVuZHMgdXAgb24gdGhlIEVGSSBwYXJ0aXRpb24sIGV2ZW4gaWYgdGhhdCB3b3VsZG4n
dCBhZmZlY3QgdGhlDQo+ICJub3JtYWwiIHdheSBvZiBwdXR0aW5nIHRoZSBiaW5hcnkgb24g
dGhlIEVGSSBwYXJ0aXRpb24gLSBwZW9wbGUgd291bGQNCj4gc3RpbGwgbmVlZCB0byB0YWtl
IGNhcmUgb2YgdGhhdCBpbiB0aGVpciBkaXN0cm9zKS4NCg0KV2hhdCBhYm91dCBhZGRpbmcg
YSByZWxhdGVkIEtjb25maWcgb3B0aW9uIGluc3RlYWQ/DQoNCkknZCBiZSBmaW5lIHdpdGgg
YSB0ZXh0dWFsIG1lbnRpb25pbmcgb2YgSU5TVEFMTF9FRklfU1RSSVAsIHRvby4NCg0KPiBJ
IGd1ZXNzIHRoaXMgc2l6ZSBhc3BlY3Qgd3J0IHRoZSBFRkkgcGFydGl0aW9uIGlzIGFjdHVh
bGx5IHNvbWV0aGluZw0KPiB0aGF0IHNob3VsZCBhbHNvIGJlIG1lbnRpb25lZCBpbiBwYXRj
aCAxLCBiZWNhdXNlIHRoaXMgY2FuIGJlIGFuIGFyZ3VtZW50DQo+IGFnYWluc3QgZXhwb3N1
cmUgb2YgdGhlIG9wdGlvbiAocHJlY2lzZWx5IGJlY2F1c2UgaXQgcmVxdWlyZXMgZXh0cmEN
Cj4gYWN0aXZpdHkgdG8gcHJldmVudCB0aGUgRUZJIHBhcnRpdGlvbiBydW5uaW5nIG91dCBv
ZiBzcGFjZSkuDQoNClRoaXMgbWlnaHQgYmUgYW5vdGhlciByZWFzb24gdG8gbWFrZSBpdCBl
YXNpbHkgY29uZmlndXJhYmxlLg0KDQoNCkp1ZXJnZW4NCg==
--------------tVPgJ6fj78Z0EIzHRJFACirY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------tVPgJ6fj78Z0EIzHRJFACirY--

--------------s6jhj5JT5NNC9nkx2Yy4AFyH--

--------------rXCW2TQvma0iTsozsYxvR5OY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQHRFsFAwAAAAAACgkQsN6d1ii/Ey82
Hgf+LV7+9dubeAnJ24G8h+NoJ2LUCdyLYcr/ulzeiXykP260R+wfp52R2IYntFs8iKQ8KTKBpR72
PEn//NY61sgNfS3PBrgsLDhKq0FFgOyfZvA0MZarhg8rJapatAdeyWwY+8nCpzq0EzqCDe7A6yKB
iMBkq5nhK/G98mW6tyB8SpYwYAePFBa8yqkg4FVvixr2mo6Y72hAdlBovrSLhU6f/ENo/lDiFK0a
7eLCxD0uKHDtEpvC5H7fv/Dn101mzGLwI+4Yf4iQLPmcSlVDcaIuFCZlMCjpFgloEke3mt16YyOf
Ia/gz1QHm/Pvp+1w9Xo3w28eFkcWOEvqmqcmbu59bg==
=9AmD
-----END PGP SIGNATURE-----

--------------rXCW2TQvma0iTsozsYxvR5OY--

