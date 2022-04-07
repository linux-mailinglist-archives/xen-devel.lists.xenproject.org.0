Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711044F7D37
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 12:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300695.512965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPe5-00024G-Po; Thu, 07 Apr 2022 10:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300695.512965; Thu, 07 Apr 2022 10:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPe5-00021h-L0; Thu, 07 Apr 2022 10:45:45 +0000
Received: by outflank-mailman (input) for mailman id 300695;
 Thu, 07 Apr 2022 10:45:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncPe4-00021b-86
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 10:45:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df6bfc7a-b65f-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 12:45:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 82D1E1F85A;
 Thu,  7 Apr 2022 10:45:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4683A13485;
 Thu,  7 Apr 2022 10:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fo+8D9bATmK9VwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 10:45:42 +0000
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
X-Inumbo-ID: df6bfc7a-b65f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649328342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3sIYAjKG+ir9t1Xfq2O2bvY4pK7tgGKcci1Lb9ZLb/E=;
	b=T2GeSlh5bMffFn6Wrev58YTl7GerUzxaIEtGzkGShCEYEBQ+oW/i5Yj/kAb3O7XPcs2nM+
	8v4R0hMm8xfUC90uATGNZV7HKJxT1GwOTqfCHqViNlu8KcC0fHwtC8zT4kUH/c0jr7a/vE
	xqIwP5oSdzVN1oki0h/qVcu2uC9wfJQ=
Message-ID: <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>
Date: Thu, 7 Apr 2022 12:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Mel Gorman <mgorman@suse.de>
References: <20220407093221.1090-1-jgross@suse.com>
 <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
In-Reply-To: <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TIl0s0UqKaX7PIe2u5NyjClQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TIl0s0UqKaX7PIe2u5NyjClQ
Content-Type: multipart/mixed; boundary="------------4EuXqQpxank1GYekfOIj7tkc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michal Hocko <mhocko@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Mel Gorman <mgorman@suse.de>
Message-ID: <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
References: <20220407093221.1090-1-jgross@suse.com>
 <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
In-Reply-To: <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>

--------------4EuXqQpxank1GYekfOIj7tkc
Content-Type: multipart/mixed; boundary="------------JB9VhSY0XY0ANUPejKIckOrg"

--------------JB9VhSY0XY0ANUPejKIckOrg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDQuMjIgMTI6MzQsIE1pY2hhbCBIb2NrbyB3cm90ZToNCj4gQ2NpbmcgTWVsDQo+
IA0KPiBPbiBUaHUgMDctMDQtMjIgMTE6MzI6MjEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
PiBTaW5jZSBjb21taXQgOWQzYmUyMWJmOWMwICgibW0sIHBhZ2VfYWxsb2M6IHNpbXBsaWZ5
IHpvbmVsaXN0DQo+PiBpbml0aWFsaXphdGlvbiIpIG9ubHkgem9uZXMgd2l0aCBmcmVlIG1l
bW9yeSBhcmUgaW5jbHVkZWQgaW4gYSBidWlsdA0KPj4gem9uZWxpc3QuIFRoaXMgaXMgcHJv
YmxlbWF0aWMgd2hlbiBlLmcuIGFsbCBtZW1vcnkgb2YgYSB6b25lIGhhcyBiZWVuDQo+PiBi
YWxsb29uZWQgb3V0Lg0KPiANCj4gV2hhdCBpcyB0aGUgYWN0dWFsIHByb2JsZW0gdGhlcmU/
DQoNCldoZW4gcnVubmluZyBhcyBYZW4gZ3Vlc3QgbmV3IGhvdHBsdWdnZWQgbWVtb3J5IHdp
bGwgbm90IGJlIG9ubGluZWQNCmF1dG9tYXRpY2FsbHksIGJ1dCBvbmx5IG9uIHNwZWNpYWwg
cmVxdWVzdC4gVGhpcyBpcyBkb25lIGluIG9yZGVyIHRvDQpzdXBwb3J0IGFkZGluZyBlLmcu
IHRoZSBwb3NzaWJpbGl0eSB0byB1c2UgYW5vdGhlciBHQiBvZiBtZW1vcnksIHdoaWxlDQph
ZGRpbmcgb25seSBhIHBhcnQgb2YgdGhhdCBtZW1vcnkgaW5pdGlhbGx5Lg0KDQpJbiBjYXNl
IGFkZGluZyB0aGF0IG1lbW9yeSBpcyBwb3B1bGF0aW5nIGEgbmV3IHpvbmUsIHRoZSBwYWdl
IGFsbG9jYXRvcg0Kd29uJ3QgYmUgYWJsZSB0byB1c2UgdGhpcyBtZW1vcnkgd2hlbiBpdCBp
cyBvbmxpbmVkLCBhcyB0aGUgem9uZSB3YXNuJ3QNCmFkZGVkIHRvIHRoZSB6b25lbGlzdCwg
ZHVlIHRvIG1hbmFnZWRfem9uZSgpIHJldHVybmluZyAwLg0KDQpOb3RlIHRoYXQgYSBzaW1p
bGFyIHByb2JsZW0gY291bGQgb2NjdXIgaW4gY2FzZSB0aGUgem9uZWxpc3RzIGFyZQ0KcmVi
dWlsdCBhbmQgYSB6b25lIGhhcHBlbnMgdG8gaGF2ZSBhbGwgbWVtb3J5IGluIHVzZS4gVGhh
dCB6b25lIHdpbGwNCnRoZW4gYmUgZHJvcHBlZCBmcm9tIHRoZSByZWJ1aWx0IHpvbmVsaXN0
cy4NCg0KPiANCj4+IFVzZSBwb3B1bGF0ZWRfem9uZSgpIHdoZW4gYnVpbGRpbmcgYSB6b25l
bGlzdCBhcyBpdCBoYXMgYmVlbiBkb25lDQo+PiBiZWZvcmUgdGhhdCBjb21taXQuDQo+Pg0K
Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4+IEZpeGVzOiA5ZDNiZTIxYmY5YzAg
KCJtbSwgcGFnZV9hbGxvYzogc2ltcGxpZnkgem9uZWxpc3QgaW5pdGlhbGl6YXRpb24iKQ0K
PiANCj4gRGlkIHlvdSBtZWFuIHRvIHJlZmVyIHRvDQo+IDZhYTMwM2RlZmI3NCAoIm1tLCB2
bXNjYW46IG9ubHkgYWxsb2NhdGUgYW5kIHJlY2xhaW0gZnJvbSB6b25lcyB3aXRoDQo+IHBh
Z2VzIG1hbmFnZWQgYnkgdGhlIGJ1ZGR5IGFsbG9jYXRvciIpPw0KDQpZZXMuIEkgcmVhbGx5
IGNhbid0IGV4cGxhaW4gd2hlcmUgdGhpcyBvdGhlciByZWZlcmVuY2UgaXMgY29taW5nIGZy
b20uDQpJIG11c3QgaGF2ZSBzZWxlY3RlZCB0aGUgd3JvbmcgbGluZSBmcm9tIGEgZ2l0IGFu
bm90YXRlIG91dHB1dA0KDQoNCkp1ZXJnZW4NCg==
--------------JB9VhSY0XY0ANUPejKIckOrg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------JB9VhSY0XY0ANUPejKIckOrg--

--------------4EuXqQpxank1GYekfOIj7tkc--

--------------TIl0s0UqKaX7PIe2u5NyjClQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJOwNUFAwAAAAAACgkQsN6d1ii/Ey/4
qQgAnJxLJDcydEybZ6xKrNlhYEdZMI2p1iPldUfmz7mK0PPHWsPGfVIA6FqdtKq1d+Ne/egV88bH
Lv1NFCzKnCyux4IWJuv8Hbr03qxnbTtUJD0hQ/Igdb3xXGCxtwk11OzPM+MTe5UgadnNnBIDb0Gm
mSE30rnSjxXc7OZ8HmbCRaK4Nokf4qJNnCfJpKV/PAzoUuT1hsYu2rRSdqx/EGtc7RxASol2CUpN
C6VakkcZx7eKHlNQ0ZfGMmK2bixYXAcFTDwmpf6McoICMJ1Qoc5KnRUb14HLFFT6Rm8OLvyvultE
/JvgO2Tlhy7r2S+WB1rFRwC/jyJp6aJjWrHC1hUZnA==
=YuTn
-----END PGP SIGNATURE-----

--------------TIl0s0UqKaX7PIe2u5NyjClQ--

