Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CBA76464E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 07:54:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570788.892922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOtx5-0004lX-NL; Thu, 27 Jul 2023 05:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570788.892922; Thu, 27 Jul 2023 05:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOtx5-0004jZ-Jz; Thu, 27 Jul 2023 05:54:19 +0000
Received: by outflank-mailman (input) for mailman id 570788;
 Thu, 27 Jul 2023 05:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PqFe=DN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qOtx4-0004jT-Hr
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 05:54:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0531daae-2c42-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 07:54:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02B9A1F383;
 Thu, 27 Jul 2023 05:54:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF38D1341F;
 Thu, 27 Jul 2023 05:54:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bevrMIcGwmR9CQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 27 Jul 2023 05:54:15 +0000
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
X-Inumbo-ID: 0531daae-2c42-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690437256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cTOhp7gzTtljGoWxVjaxLCsraETAq5ShPGu+HEHGneU=;
	b=kouLPPETSOQji+YuSUZn4VWQKS38RgenGK9AuclG8s5ievjs7AzqDgqsOlJl1+fMqv40FM
	8EX1svd4id95S4IoS4r4lOHX7tqoGuwy3MCbd+n5t9HUDlBYSontHJhTeeHL8/zEiGcc09
	d7prEswbfzVVCVah8B615qZWUBsT0+c=
Message-ID: <a54de6ad-ecbd-4f79-f82a-2f54be38bde7@suse.com>
Date: Thu, 27 Jul 2023 07:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xenbus: check xen_domain in xenbus_probe_initcall
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 pmladek@suse.com
References: <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Cr8v2k08dQPD0rbCXOR0kF4U"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Cr8v2k08dQPD0rbCXOR0kF4U
Content-Type: multipart/mixed; boundary="------------jEc0T0g0KIX9PQpz0HsSEoCn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 pmladek@suse.com
Message-ID: <a54de6ad-ecbd-4f79-f82a-2f54be38bde7@suse.com>
Subject: Re: [PATCH] xenbus: check xen_domain in xenbus_probe_initcall
References: <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>

--------------jEc0T0g0KIX9PQpz0HsSEoCn
Content-Type: multipart/mixed; boundary="------------YtQ5G1DImMCnPEcdyeqV0D72"

--------------YtQ5G1DImMCnPEcdyeqV0D72
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDcuMjMgMDE6MTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gVGhlIHNh
bWUgd2F5IHdlIGFscmVhZHkgZG8gaW4geGVuYnVzX2luaXQuDQo+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgd2FybmluZzoNCj4gDQo+IFsgIDM1Mi4xNzU1NjNdIFRyeWluZyB0byBmcmVlIGFs
cmVhZHktZnJlZSBJUlEgMA0KPiBbICAzNTIuMTc3MzU1XSBXQVJOSU5HOiBDUFU6IDEgUElE
OiA4OCBhdCBrZXJuZWwvaXJxL21hbmFnZS5jOjE4OTMgZnJlZV9pcnErMHhiZi8weDM1MA0K
PiBbLi4uXQ0KPiBbICAzNTIuMjEzOTUxXSBDYWxsIFRyYWNlOg0KPiBbICAzNTIuMjE0Mzkw
XSAgPFRBU0s+DQo+IFsgIDM1Mi4yMTQ3MTddICA/IF9fd2FybisweDgxLzB4MTcwDQo+IFsg
IDM1Mi4yMTU0MzZdICA/IGZyZWVfaXJxKzB4YmYvMHgzNTANCj4gWyAgMzUyLjIxNTkwNl0g
ID8gcmVwb3J0X2J1ZysweDEwYi8weDIwMA0KPiBbICAzNTIuMjE2NDA4XSAgPyBwcmJfcmVh
ZF92YWxpZCsweDE3LzB4MjANCj4gWyAgMzUyLjIxNjkyNl0gID8gaGFuZGxlX2J1ZysweDQ0
LzB4ODANCj4gWyAgMzUyLjIxNzQwOV0gID8gZXhjX2ludmFsaWRfb3ArMHgxMy8weDYwDQo+
IFsgIDM1Mi4yMTc5MzJdICA/IGFzbV9leGNfaW52YWxpZF9vcCsweDE2LzB4MjANCj4gWyAg
MzUyLjIxODQ5N10gID8gZnJlZV9pcnErMHhiZi8weDM1MA0KPiBbICAzNTIuMjE4OTc5XSAg
PyBfX3BmeF94ZW5idXNfcHJvYmVfdGhyZWFkKzB4MTAvMHgxMA0KPiBbICAzNTIuMjE5NjAw
XSAgeGVuYnVzX3Byb2JlKzB4N2EvMHg4MA0KPiBbICAzNTIuMjIxMDMwXSAgeGVuYnVzX3By
b2JlX3RocmVhZCsweDc2LzB4YzANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+IFRlc3RlZC1ieTogUGV0
ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+DQoNClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBm
b3ItbGludXMtNi41YQ0KDQoNCkp1ZXJnZW4NCg0K
--------------YtQ5G1DImMCnPEcdyeqV0D72
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

--------------YtQ5G1DImMCnPEcdyeqV0D72--

--------------jEc0T0g0KIX9PQpz0HsSEoCn--

--------------Cr8v2k08dQPD0rbCXOR0kF4U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTCBocFAwAAAAAACgkQsN6d1ii/Ey8N
hgf/ZULN+ts5xyA7sfl0WnA7tusFl3CDVWcLQVBCAhDSmm29HHTkPjQNbwBNWUKw7lWS5ZBQmGMM
yhwwtFtRi18vF4Qm7yrnhoL6oEpayrtOxXPfQ4rc1dzdfUEzHOiQ1loxWbrNH962HLqoSp7PaSsN
Vmq3bokMo+LHLTs26B88ahBbE8NlRncfHA3DvWF+7AIqqX408na6aepoB3bqXCZp1sC5IhN6B92I
W3cMxkJZGmIF5v9eznj0JFiO4JO+cyWJplHUAH1kL5Q55IALlAI1ZTGWHj/JOBVK9s/x44Pmhfwl
wC7XPk7IQjdZkcLX4WKaoV3qJEKgK2Ir3alOrn96fQ==
=9R1l
-----END PGP SIGNATURE-----

--------------Cr8v2k08dQPD0rbCXOR0kF4U--

