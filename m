Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437A597EAA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 08:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389311.626123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOZ53-0002zP-RD; Thu, 18 Aug 2022 06:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389311.626123; Thu, 18 Aug 2022 06:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOZ53-0002wq-OR; Thu, 18 Aug 2022 06:32:37 +0000
Received: by outflank-mailman (input) for mailman id 389311;
 Thu, 18 Aug 2022 06:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U+fg=YW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oOZ52-0002wk-5M
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 06:32:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b9fe87a-1ebf-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 08:32:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AB2D38C96;
 Thu, 18 Aug 2022 06:32:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5CD0A133B5;
 Thu, 18 Aug 2022 06:32:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3HE5FQLd/WK8OQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 18 Aug 2022 06:32:34 +0000
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
X-Inumbo-ID: 8b9fe87a-1ebf-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660804354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vyh1q8XzVY1/9NXBPz6oiJ6wb/v8vq9JpYwS4/WeeI8=;
	b=G7d9GHKLf59VpzHk4Q/jQqu7aTHMx8663CmQuNamZzZKFxBdQGmMRXglYpWmGEysOPH2TE
	+qexeG/vh7LI7nYS9ljM40x8ZUVt3ZNjSzEeZARvMHnx1PdNNKZXZFCY8Af+SbcnFlc2+J
	rb+pffUKE7QQU7guL5oJz8SxxClspls=
Message-ID: <f2550c1c-b843-cd04-c3f8-91737cc192ff@suse.com>
Date: Thu, 18 Aug 2022 08:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: USB passthrough fails with 64GB drive but works fine with 8GB
 drive
Content-Language: en-US
To: A Sudheer <asr7247@gmail.com>, xen-devel@lists.xenproject.org
References: <CABg_PyJ5M4tXoT4OO6xKn8csWMiwpZKoQjtPaWykvV6_wP5Pow@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <CABg_PyJ5M4tXoT4OO6xKn8csWMiwpZKoQjtPaWykvV6_wP5Pow@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m3BpMy5OxFd3UUd85TuW8B90"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m3BpMy5OxFd3UUd85TuW8B90
Content-Type: multipart/mixed; boundary="------------PnHPFE1NeZ9AqY0EHE8e3y2G";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: A Sudheer <asr7247@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <f2550c1c-b843-cd04-c3f8-91737cc192ff@suse.com>
Subject: Re: USB passthrough fails with 64GB drive but works fine with 8GB
 drive
References: <CABg_PyJ5M4tXoT4OO6xKn8csWMiwpZKoQjtPaWykvV6_wP5Pow@mail.gmail.com>
In-Reply-To: <CABg_PyJ5M4tXoT4OO6xKn8csWMiwpZKoQjtPaWykvV6_wP5Pow@mail.gmail.com>

--------------PnHPFE1NeZ9AqY0EHE8e3y2G
Content-Type: multipart/mixed; boundary="------------oDKLh0QzfAROgqgofWuAg0GF"

--------------oDKLh0QzfAROgqgofWuAg0GF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

W3JlbW92aW5nIHhlbi11c2VycyB0byBhdm9pZCBjcm9zc3Bvc3RpbmddDQoNCk9uIDE4LjA4
LjIyIDA4OjE4LCBBIFN1ZGhlZXIgd3JvdGU6DQo+IEhpIEFsbA0KPiANCj4gT24gWEVOLTQu
MTYgd2l0aCBVYnVudHUgMjIuMDQgRG9tMCBhbmQgSFZNLURvbVUsIEkgdHJpZWQgdG8gZG8g
YSBVU0IgbWFzcyANCj4gc3RvcmFnZSBkZXZpY2UgcGFzc3Rocm91Z2ggdG8gRG9tVS4NCj4g
SSBmb2xsb3dlZCB0aGUgUFZVU0IgbWV0aG9kIG1lbnRpb25lZCBpbiANCj4gaHR0cHM6Ly93
aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX1VTQl9QYXNzdGhyb3VnaCANCj4gPGh0dHBz
Oi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl9VU0JfUGFzc3Rocm91Z2g+Lg0KPiAN
Cj4gV2l0aCA4R0Igc2FuZGlzayBwZW4gZHJpdmUsIGkgYW0gYWJsZSB0byBkbyBVU0IgcGFz
c3Rocm91Z2ggdG8gRG9tVS4NCj4gQnV0IHdpdGggNjRHQiBzYW5kaXNrIHBlbmRyaXZlLCB0
aG91Z2ggYWJsZSB0byBtb3VudC91bW91bnQgaW4gRG9tMCwgbm90IGFibGUgdG8gDQo+IGRv
IHBhc3N0aHJvdWdoIHRvIERvbVUuDQo+IEkgc2VlIElPIGVycm9ycyBpbiBkbWVzZ8KgIHdo
ZW4gdHJpZWQgdG8gYWNjZXNzIHRoZSB1c2IgZGlzayBmb2xkZXIgaW4gRG9tVS4NCj4gQm90
aCA4R0IgYW5kIDY0R0IgZGlza3MgYXJlIDMuMkdlbjEuIChOb3QgdHJpZWQgd2l0aCAxNkdC
ICYgMzJHQiBkcml2ZXMpLg0KPiANCj4gRG9lcyBhbnlvbmUga25vdyB3aHkgNjRHQiB1c2Ig
ZGlzayBwYXNzdGhyb3VnaCBmYWlscyB3aXRoIHRoZSBiZWxvdyBlcnJvciA/DQo+IA0KPiBE
bWVzZyBFcnJvcjoNCj4gLS0tLS0tLS0tLS0tLS0tLS0NCj4gWyDCoDEyOC4zMzM0MDldIHVz
YiAyLTE6IHJlc2V0IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyBlaGNp
LXBjaQ0KPiBbIMKgMTI4LjUwMjg3Ml0gc2QgMjowOjA6MDogW3NkYV0gdGFnIzAgRkFJTEVE
IFJlc3VsdDogaG9zdGJ5dGU9RElEX0VSUk9SIA0KPiBkcml2ZXJieXRlPURSSVZFUl9PSyBj
bWRfYWdlPTBzDQo+IFsgwqAxMjguNTAyODgxXSBzZCAyOjA6MDowOiBbc2RhXSB0YWcjMCBD
REI6IFJlYWQoMTApIDI4IDAwIDAwIDAwIDdhIGI3IDAwIDAwIDNmIDAwDQo+IFsgwqAxMjgu
NTAyODgzXSBibGtfdXBkYXRlX3JlcXVlc3Q6IEkvTyBlcnJvciwgZGV2IHNkYSwgc2VjdG9y
IDMxNDE1IG9wIA0KPiAweDA6KFJFQUQpIGZsYWdzIDB4ODA3MDAgcGh5c19zZWcgNjMgcHJp
byBjbGFzcyAwDQoNCkRvIHlvdSBoYXZlIHRoZSByZWxhdGVkIHFlbXUgbG9nIGZyb20gZG9t
MD8gU2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlDQovdmFyL2xvZy94ZW4vcWVtdS1kbS0qLmxv
Zw0KDQoNCkp1ZXJnZW4NCg==
--------------oDKLh0QzfAROgqgofWuAg0GF
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

--------------oDKLh0QzfAROgqgofWuAg0GF--

--------------PnHPFE1NeZ9AqY0EHE8e3y2G--

--------------m3BpMy5OxFd3UUd85TuW8B90
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL93QEFAwAAAAAACgkQsN6d1ii/Ey84
kAf9HsyLo7vTzT6PVNWIWjXEILWz1UsVgS9VaFjTfCJirszi1TWFflry+zYaV8BDuXgQGBkpi6uI
3NGKKQBmzzndsUB+TSNRbUhPojqe+3NTsoqnXqdjeY669KkciQbYkskqXIwFN9Z5AYSA4QCtSrWp
Nq5N4DVA9TOM2GpQwmFhDCISNF05v8TpzjrsuprE/pwaF7TFn4hABo3yQgdoGhhNcMUixIsL6+xA
VRexRq5qpY8hHCUkm5QOREjM60+gMQRs/0QBvemoUSVM1bzcqPHqQsCcsSRIP5V8PUruRoEcvi6f
l6j/VtZmTSvnOd+fihtWADIq6AiVI6erqCK1IDqpVg==
=h/sf
-----END PGP SIGNATURE-----

--------------m3BpMy5OxFd3UUd85TuW8B90--

