Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D772BF3F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546969.854104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8evd-0001CT-2p; Mon, 12 Jun 2023 10:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546969.854104; Mon, 12 Jun 2023 10:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8evc-0001A5-Vn; Mon, 12 Jun 2023 10:37:40 +0000
Received: by outflank-mailman (input) for mailman id 546969;
 Mon, 12 Jun 2023 10:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SXsF=CA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q8evc-00019z-7y
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:37:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26c69f32-090d-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 12:37:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 45A9E2032C;
 Mon, 12 Jun 2023 10:37:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 214E4138EC;
 Mon, 12 Jun 2023 10:37:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YIWpBnL1hmR+LwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Jun 2023 10:37:38 +0000
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
X-Inumbo-ID: 26c69f32-090d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686566258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eldJTJiaQfpZOuu612fRcRQEVGPJ6U1/I/FXQ9+H7xI=;
	b=JvjoKXB67oIfS7GC/WdKy1cuu9WAe+cnnTMtPBTLjlgsm0zjaThc57uh2Oo5kP5wAL+mjG
	r0lmmidGvcGnd/os975fZvPM6lFsqQVB+75008WibtHMwU/T3Rb64TVlTb0VFYKdBU4DIL
	PVIQ955X36MKk7tAvaq6CxKAxzRGyIs=
Message-ID: <8dcedf30-996c-6746-5788-253e07ff8467@suse.com>
Date: Mon, 12 Jun 2023 12:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 10/16] tools/libs/store: use xen_list.h instead of
 xenstore/list.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-11-jgross@suse.com>
 <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>
 <b34ce9b4-f289-c836-17d6-fcdd105f301f@suse.com>
 <f51554bf-616b-b568-a33b-1585878a1e19@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f51554bf-616b-b568-a33b-1585878a1e19@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ltnKM3evRlChX2352LKHoQt1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ltnKM3evRlChX2352LKHoQt1
Content-Type: multipart/mixed; boundary="------------i07Sghjrq4wy5Vc0Dj0C8YO5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <8dcedf30-996c-6746-5788-253e07ff8467@suse.com>
Subject: Re: [PATCH v3 10/16] tools/libs/store: use xen_list.h instead of
 xenstore/list.h
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-11-jgross@suse.com>
 <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>
 <b34ce9b4-f289-c836-17d6-fcdd105f301f@suse.com>
 <f51554bf-616b-b568-a33b-1585878a1e19@xen.org>
In-Reply-To: <f51554bf-616b-b568-a33b-1585878a1e19@xen.org>

--------------i07Sghjrq4wy5Vc0Dj0C8YO5
Content-Type: multipart/mixed; boundary="------------luMvz4TA700VhsA70m2twlJ0"

--------------luMvz4TA700VhsA70m2twlJ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDYuMjMgMTI6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMi8wNi8yMDIzIDA4OjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDkuMDYu
MjMgMjA6MDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMzAvMDUvMjAyMyAwOTo1NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gUmVw
bGFjZSB0aGUgdXNhZ2Ugb2YgdGhlIHhlbnN0b3JlIHByaXZhdGUgbGlzdC5oIGhlYWRlciB3
aXRoIHRoZQ0KPj4+PiBjb21tb24geGVuX2xpc3QuaCBvbmUuDQo+Pj4+DQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+
Pj4+IFYzOg0KPj4+PiAtIG5ldyBwYXRjaA0KPj4+PiAtLS0NCj4+Pj4gwqAgdG9vbHMvbGli
cy9zdG9yZS94cy5jIHwgNTYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMjgg
ZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL3N0b3Jl
L3hzLmMgYi90b29scy9saWJzL3N0b3JlL3hzLmMNCj4+Pj4gaW5kZXggN2E5YThiMTY1Ni4u
MzgxM2I2OWFlMiAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMvbGlicy9zdG9yZS94cy5jDQo+
Pj4+ICsrKyBiL3Rvb2xzL2xpYnMvc3RvcmUveHMuYw0KPj4+PiBAQCAtMzUsMTMgKzM1LDEz
IEBADQo+Pj4+IMKgICNpbmNsdWRlIDxlcnJuby5oPg0KPj4+PiDCoCAjaW5jbHVkZSAieGVu
c3RvcmUuaCINCj4+Pj4gwqAgI2luY2x1ZGUgInhzX2xpYi5oIg0KPj4+PiAtI2luY2x1ZGUg
Imxpc3QuaCINCj4+Pj4gwqAgI2luY2x1ZGUgInV0aWxzLmgiDQo+Pj4+IMKgICNpbmNsdWRl
IDx4ZW50b29sY29yZV9pbnRlcm5hbC5oPg0KPj4+PiArI2luY2x1ZGUgPHhlbl9saXN0Lmg+
DQo+Pj4+IMKgIHN0cnVjdCB4c19zdG9yZWRfbXNnIHsNCj4+Pj4gLcKgwqDCoCBzdHJ1Y3Qg
bGlzdF9oZWFkIGxpc3Q7DQo+Pj4+ICvCoMKgwqAgWEVOX1RBSUxRX0VOVFJZKHN0cnVjdCB4
c19zdG9yZWRfbXNnKSBsaXN0Ow0KPj4+DQo+Pj4gSSBoYXZlIGV4cGVjdGVkIHVzIHRvIHVz
ZSB0byBYRU5fTElTVF8qLiBDYW4geW91IGV4cGxhaW4gd2h5IHlvdSBkaWRuJ3QgdXNlIA0K
Pj4+IHRoZW0/DQo+Pg0KPj4gWEVOX0xJU1RfKiBkb2Vzbid0IHByb3ZpZGUgYSBsaXN0X2Fk
ZF90YWlsKCkgcmVwbGFjZW1lbnQuDQo+IA0KPiBPay4gRGlkIHlvdSBsb29rIGF0IHdoZXRo
ZXIgbGlzdF9hZGRfdGFpbCgpIGNvdWxkIGJlIHJlcGxhY2VkIHdpdGggYWRkaW5nIHRoZSAN
Cj4gZWxlbWVudCBhdCB0aGUgaGVhZD8NCj4gDQo+IEFueXdheSwgSSBjYW4gdW5kZXJzdGFu
ZCB0aGF0IHRoaXMgd291bGQgbm90IGJlIGEgc3RyYWlnaHQgc3dhcC4gQnV0IGl0IHdvdWxk
IGJlIA0KPiBnb29kIHRvIGhhdmUgc29tZSByYXRpb25hbGUgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIGFzIHRoaXMgaGVscHMgdW5kZXJzdGFuZGluZyANCj4gdGhlIGNob2ljZS4NCg0KT2th
eSwgSSdsbCBhZGQ6ICJVc2UgdGhlIFhFTl9UQUlMUSB0eXBlIGxpc3QsIGFzIGl0IGFsbG93
cyB0byBkaXJlY3RseSBzd2FwIHRoZQ0KcmVsYXRlZCBtYWNyb3MvZnVuY3Rpb25zIHdpdGhv
dXQgaGF2aW5nIHRvIGNoYW5nZSB0aGUgbG9naWMuIg0KDQo+IA0KPiBXaXRoIHRoYXQ6DQo+
IA0KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KVGhh
bmtzLA0KDQoNCkp1ZXJnZW4NCg0K
--------------luMvz4TA700VhsA70m2twlJ0
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

--------------luMvz4TA700VhsA70m2twlJ0--

--------------i07Sghjrq4wy5Vc0Dj0C8YO5--

--------------ltnKM3evRlChX2352LKHoQt1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSG9XEFAwAAAAAACgkQsN6d1ii/Ey9R
xgf+P4Rh1ghueYFS6zNrn79d1IEBqkzoomK79POuaEWGRMgu6WVWvixXl2aJHpRQtbK0BG3xGy1p
Ya9iImS87u9rIb/tmbDs4Bq3nwDJr0EiFRHnRWYtMYtjmZQN5JBs0jd0e/tiPxdwCqxZq+uTOzg6
ayghcLzxkk6Z76mwT0y/LthCPauyKRarfS/smE5d9wUZYypk2MS5g3kDXuuUGE4JzvSmxWfoOyOS
2dCTvGIkHXzZqZQ5iWKo8T/e/QD97aKKazeUVNcHLi4srwu2KqS7g7ABJXTsW9xJoEejL8yoeVQC
YoCHSG22Za5kY6dSbplYSJb2YDlQPPGT7sF8bFs0vw==
=tmEy
-----END PGP SIGNATURE-----

--------------ltnKM3evRlChX2352LKHoQt1--

