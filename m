Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A25B5646
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405557.648004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXesi-0005VB-UN; Mon, 12 Sep 2022 08:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405557.648004; Mon, 12 Sep 2022 08:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXesi-0005Sy-RV; Mon, 12 Sep 2022 08:33:28 +0000
Received: by outflank-mailman (input) for mailman id 405557;
 Mon, 12 Sep 2022 08:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oXesi-0005Sq-6d
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:33:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9279c6a4-3275-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 10:33:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC1C91FB59;
 Mon, 12 Sep 2022 08:33:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A324D139E0;
 Mon, 12 Sep 2022 08:33:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2pdLJtbuHmNZLAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Sep 2022 08:33:26 +0000
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
X-Inumbo-ID: 9279c6a4-3275-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662971606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gIbEQYuRxed1sKs3TrZHbm3VQcicEvfnPymumYqyiDw=;
	b=NISn3GVT/rNm/ynyo7JdP5sp9q4saZ353nat5EltH6OOG60Puylbd884LeGiuZrjrIA2S5
	s9WCExANZtKvfsf0yYsf2TNwkjlMlfOHgHvDfVT8mrpA3/GGkgKxgU71TsM3YBMxcFmRdJ
	n+yh1y5PuwU7ypzAql3Mlc283QiRSTE=
Message-ID: <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
Date: Mon, 12 Sep 2022 10:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
 <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bousNCkHmwnzyrJAod6Bp1fq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bousNCkHmwnzyrJAod6Bp1fq
Content-Type: multipart/mixed; boundary="------------VqUzmyUxRbs78XjvTeHv6LPC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
 <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
In-Reply-To: <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>

--------------VqUzmyUxRbs78XjvTeHv6LPC
Content-Type: multipart/mixed; boundary="------------V87TF1GjO8lo7dt2EUv00r19"

--------------V87TF1GjO8lo7dt2EUv00r19
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDkuMjIgMTA6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wOS4yMDIy
IDEwOjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTIuMDkuMjIgMTA6MTksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEyLjA5LjIwMjIgMDc6NTMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEFkZCBhIGhlbHBlciBkb21pZF90b19kb21haW4oKSByZXR1cm5p
bmcgdGhlIHN0cnVjdCBkb21haW4gcG9pbnRlciBmb3INCj4+Pj4gYSBkb21haW4gZ2l2ZSBi
eSBpdHMgZG9taWQgYW5kIHdoaWNoIGlzIGtub3duIG5vdCBiZWluZyBhYmxlIHRvIGJlDQo+
Pj4+IHJlbGVhc2VkIChpdHMgcmVmZXJlbmNlIGNvdW50IGlzbid0IGluY3JlbWVudGVkIGFu
ZCBubyByY3VfbG9ja19kb21haW4oKQ0KPj4+PiBpcyBjYWxsZWQgZm9yIGl0KS4NCj4+Pj4N
Cj4+Pj4gSW4gb3JkZXIgdG8gc2ltcGxpZnkgY29kaW5nIGFkZCBhbiBpbnRlcm5hbCBoZWxw
ZXIgZm9yIGRvaW5nIHRoZSBsb29rdXANCj4+Pj4gYW5kIGNhbGwgdGhhdCBmcm9tIHRoZSBu
ZXcgZnVuY3Rpb24gYW5kIHNpbWlsYXIgZnVuY3Rpb25zLg0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4NCj4+PiBJIGRv
bid0IHNlZSBhbiBpc3N1ZSB3aXRoIGFkZGluZyBzdWNoIGEgaGVscGVyIChyZXNwb25kaW5n
IHRvIHlvdXIgY29uY2Vybg0KPj4+IGluIHRoZSBjb3ZlciBsZXR0ZXIpLCBidXQgSSB0aGlu
ayB0aGUgY29uc3RyYWludHMgbmVlZCB0byBiZSBlbXBhaHNpemVkDQo+Pj4gbW9yZTogV2Ug
YWxyZWFkeSBoYXZlIGdldF9rbm93bmFsaXZlX2RvbWFpbigpIGFuZCBnZXRfZG9tYWluX2J5
X2lkKCksIHNvDQo+Pj4gaG93IGFib3V0IG5hbWluZyB0aGUgbmV3IGhlbHBlciBnZXRfa25v
d25hbGl2ZV9kb21haW5fYnlfaWQoKT8gQW5kIHRoZW4gLi4uDQo+Pg0KPj4gSSBleHBsaWNp
dGx5IGRpZG4ndCBuYW1lIGl0ICJnZXRfLi4uIiwgYXMgdGhvc2UgaGVscGVycyBhbGwgaW5j
cmVtZW50IHRoZQ0KPj4gcmVmZXJlbmNlIGNvdW50IG9mIHRoZSBkb21haW4uIEFuZCB0aGlz
IGlzIE5PVCBkb25lIGJ5IHRoZSBuZXcgaGVscGVyLg0KPiANCj4gSG1tLCBhZ3JlZWQuIEJ1
dCBkb21pZF90b19kb21haW4oKSBpc24ndCBleHByZXNzaW5nIHRoZSAia25vd24gYWxpdmUi
IGFzcGVjdCwNCj4geWV0IHRoYXQncyByZWxldmFudCB0byBzZWUgd2hlbiByZXZpZXdpbmcg
bmV3IHVzZXMgb2YgdGhlIGZ1bmN0aW9uLiBTdWNoIHVzZXMNCj4gYXJlbid0IGxpa2VseSB0
byBtYWtlIHRoZSByZXZpZXdlciBnbyBsb29rIGF0IHRoZSBmdW5jdGlvbiBkZWNsYXJhdGlv
biB3aGVuDQo+IHRoZSBmdW5jdGlvbiBuYW1lIGlzIHByZXR0eSAiaW5ub2NlbnQiLg0KDQpP
a2F5LCB3aGF0IGFib3V0IGRvbWlkX3RvX2tub3duYWxpdmVfZG9tYWluKCk/DQoNCk9yIGtu
b3duYWxpdmVfZG9tYWluX2Zyb21fZG9taWQoKT8NCg0KDQpKdWVyZ2VuDQo=
--------------V87TF1GjO8lo7dt2EUv00r19
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

--------------V87TF1GjO8lo7dt2EUv00r19--

--------------VqUzmyUxRbs78XjvTeHv6LPC--

--------------bousNCkHmwnzyrJAod6Bp1fq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMe7tYFAwAAAAAACgkQsN6d1ii/Ey+E
sAgAlVE/tJYUmHggdxW2e6eslpbFOmxttoILGHILa7QgIWRrezUAMy2m1eotBk9Ni/0FCNFadIAb
szaAR14GudDDCEQlDbvvf3j28Vy8BR7J9IE0HfbS5VAYVFbE0SO0mwQ8BCa9sNhd9ikaUKthlGu/
h6lgmNCEWFwfHFqKMNucSGWolFN9AtBMaUVk6Phqb9+S8OKMOCSmNvmWrt9unWfXjj7+vaPYVXxY
kV1XsKZb1xrcAllidh9iBGwNhhVrPk1EFj5XPO4k4oSfjfNP/yC3vwVPnSp+pPhJHkT33al/hvfM
hPUHRLL59azI9QYon9rBi67aF4pMBec8IYesIbG2Mw==
=LNiV
-----END PGP SIGNATURE-----

--------------bousNCkHmwnzyrJAod6Bp1fq--

