Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E36654B5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 07:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475069.736574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFUjF-0000Jb-3U; Wed, 11 Jan 2023 06:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475069.736574; Wed, 11 Jan 2023 06:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFUjF-0000G4-0O; Wed, 11 Jan 2023 06:36:53 +0000
Received: by outflank-mailman (input) for mailman id 475069;
 Wed, 11 Jan 2023 06:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvS=5I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pFUjD-0000Fy-Lx
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 06:36:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5375e9bb-917a-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 07:36:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 38539767AF;
 Wed, 11 Jan 2023 06:36:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1446313591;
 Wed, 11 Jan 2023 06:36:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uQRkAwBZvmPpDwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 11 Jan 2023 06:36:48 +0000
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
X-Inumbo-ID: 5375e9bb-917a-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673419008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaBNeXv3JHHEZzeIDo3MVWFDAOvKZX193fiyQ4pPOJ4=;
	b=M4sHfpFQ+vLCruT3vRJ0x+AvFGg9BMQ713MwvhZ0a5lnXP0fEpLpQ6hRd90RzayXroq6MM
	ArkdSY5iCLNgTJKrmIM3DB+NBebmICWExJTTKs5ToLmL5kRyHwmLrHYXJEEURPj4fZZsd1
	X8A9Z8yoDxVET4JaYNd2/HfLt+rwRVI=
Message-ID: <27c0f7bd-b548-17f4-d675-7143e218fd65@suse.com>
Date: Wed, 11 Jan 2023 07:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/19] tools/xenstore: remove all watches when a domain
 has stopped
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-5-jgross@suse.com>
 <831c0e75-1a23-6210-9f5b-7212a6763dc3@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <831c0e75-1a23-6210-9f5b-7212a6763dc3@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------543lBimyMSr6wfImjmhUjh0V"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------543lBimyMSr6wfImjmhUjh0V
Content-Type: multipart/mixed; boundary="------------QnXaG4DvJ01tw3PmipuYzTR0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <27c0f7bd-b548-17f4-d675-7143e218fd65@suse.com>
Subject: Re: [PATCH v2 04/19] tools/xenstore: remove all watches when a domain
 has stopped
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-5-jgross@suse.com>
 <831c0e75-1a23-6210-9f5b-7212a6763dc3@xen.org>
In-Reply-To: <831c0e75-1a23-6210-9f5b-7212a6763dc3@xen.org>

--------------QnXaG4DvJ01tw3PmipuYzTR0
Content-Type: multipart/mixed; boundary="------------XdaIJZ0eb0W0NGn75bMqIkpx"

--------------XdaIJZ0eb0W0NGn75bMqIkpx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTIuMjIgMjA6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEzLzEyLzIwMjIgMTY6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBX
aGVuIGEgZG9tYWluIGhhcyBiZWVuIHJlbGVhc2VkIGJ5IFhlbiB0b29scywgcmVtb3ZlIGFs
bCBpdHMNCj4+IHJlZ2lzdGVyZWQgd2F0Y2hlcy4gVGhpcyBhdm9pZHMgc2VuZGluZyB3YXRj
aCBldmVudHMgdG8gdGhlIGRlYWQgZG9tYWluDQo+PiB3aGVuIGFsbCB0aGUgbm9kZXMgcmVs
YXRlZCB0byBpdCBhcmUgYmVpbmcgcmVtb3ZlZCBieSB0aGUgWGVuIHRvb2xzLg0KPiANCj4g
QUZBSUNULCB0aGUgb25seSB1c2VyIG9mIHRoZSBjb21tYW5kIGluIHRoZSB0cmVlIGlzIHNv
ZnRyZXNldC4gV291bGQgeW91IGJlIGFibGUgDQo+IHRvIGNoZWNrIHRoaXMgaXMgc3RpbGwg
d29ya2luZyBhcyBleHBlY3RlZD8NCg0KU2VlbXMgdG8gd29yayBmaW5lLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------XdaIJZ0eb0W0NGn75bMqIkpx
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

--------------XdaIJZ0eb0W0NGn75bMqIkpx--

--------------QnXaG4DvJ01tw3PmipuYzTR0--

--------------543lBimyMSr6wfImjmhUjh0V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO+WP8FAwAAAAAACgkQsN6d1ii/Ey+o
PQf+NNNGZzTLYRWZ6eDnIi+WZa7cfKJlPaRIpUXp69u6zH8fvwAKy4rVKyRRDaBXqK8+UWFQbBXe
pdJNXUGFtBrLumABe7IBdW5bx6qH0qT8azuL5TAXxEYNnVwaEvI8KZNaxgq5Y81p2LmVsNfXyBHT
hFqRDJt/pYj2eiBuJc6dRx6JFKyDBE9SPm2VvKG9KSS8d9qnfMEQ7/S/Tpe7g7597VlEv5bKjaPk
sg8g/G0X9RSoxsr6/RKW6IqrgTDHaToFd1mZa+8R+nBVo4elAIUgMagHdKu/NhjS60MrZBivOg5T
uNANbh1PYyUzdXJr8CAdcUUvb4zuN0uN6oeB+IuhjA==
=lgfh
-----END PGP SIGNATURE-----

--------------543lBimyMSr6wfImjmhUjh0V--

