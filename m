Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3A073FD3F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 15:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556169.868470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE96j-0006eJ-7m; Tue, 27 Jun 2023 13:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556169.868470; Tue, 27 Jun 2023 13:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE96j-0006c1-4I; Tue, 27 Jun 2023 13:51:49 +0000
Received: by outflank-mailman (input) for mailman id 556169;
 Tue, 27 Jun 2023 13:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE96h-0006bv-My
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 13:51:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c027a9bc-14f1-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 15:51:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 972FA1F8B4;
 Tue, 27 Jun 2023 13:51:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CA6413276;
 Tue, 27 Jun 2023 13:51:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /tjtEG/pmmRNeAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 13:51:43 +0000
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
X-Inumbo-ID: c027a9bc-14f1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687873903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh2fLbzcvw+bR6rZPMtoAGrpbqaOY8T8nWBJkcP5p8Y=;
	b=FzvkWJZfU+IzMlOPPnUW99cQKLXueXAnxs4J8Y9at+3Fn9ptHq77WwSLOgfsgrHFeRySAK
	BZhFHn7FCD5CDLVOKPi//yA/qNxr4lNeGvJWZIK6yBDJs5HCqlrtNh6TyETPwgyVGdSYk/
	resqL0HJXiXXGaeOIXvPVhVJ9ENgsm8=
Message-ID: <11942629-dc10-d26e-1bf8-2c1b8751106c@suse.com>
Date: Tue, 27 Jun 2023 15:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Yann Dirson <yann.dirson@vates.fr>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230531103427.1551719-1-yann.dirson@vates.fr>
 <20230531103427.1551719-2-yann.dirson@vates.fr>
 <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org>
 <ede5628d-31c2-9637-df60-209d0c9107d8@suse.com>
 <046475ca-a940-d9c6-9913-26bf7fe3ca25@vates.fr>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/1] doc: clarify intended usage of ~/control/ xentore
 path
In-Reply-To: <046475ca-a940-d9c6-9913-26bf7fe3ca25@vates.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3LJ1USBl2pyul8ZhpjrQdhP7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3LJ1USBl2pyul8ZhpjrQdhP7
Content-Type: multipart/mixed; boundary="------------UymK5MUw59LV0ODFU3ooKlv8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Yann Dirson <yann.dirson@vates.fr>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <11942629-dc10-d26e-1bf8-2c1b8751106c@suse.com>
Subject: Re: [PATCH 1/1] doc: clarify intended usage of ~/control/ xentore
 path
References: <20230531103427.1551719-1-yann.dirson@vates.fr>
 <20230531103427.1551719-2-yann.dirson@vates.fr>
 <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org>
 <ede5628d-31c2-9637-df60-209d0c9107d8@suse.com>
 <046475ca-a940-d9c6-9913-26bf7fe3ca25@vates.fr>
In-Reply-To: <046475ca-a940-d9c6-9913-26bf7fe3ca25@vates.fr>

--------------UymK5MUw59LV0ODFU3ooKlv8
Content-Type: multipart/mixed; boundary="------------VbbGTI5401trzLDlj3OZegxH"

--------------VbbGTI5401trzLDlj3OZegxH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjMgMDk6MzUsIFlhbm4gRGlyc29uIHdyb3RlOg0KPiBBcyBkaXNjdXNzZWQg
aW4gWGVuIFN1bW1pdCwgd2UgbGlrZWx5IGRvbid0IHdhbnQgdG8gbWVyZ2UgaXQgYXMgaXMg
YWZ0ZXINCj4gYWxsLCBidXQgcmF0aGVyIGFja25vd2xlZGdlIHRoYXQgWEFQSSBoYXMgdGFr
ZW4gdGhlIG9wcG9zaXRlIHJvdXRlIGFuZA0KPiBhbGxvdyB0aGUgdG9vbHN0YWNrIHRvIGdp
dmUgb3duZXJzaGlwIG9mIH4vY29udHJvbCAob3IgYXQgbGVhc3Qgd3JpdGUNCj4gcGVybWlz
c2lvbj8pIHRvIHRoZSBndWVzdCAtLSBtYXliZSBhbHNvIHJlY29tbWVuZGluZyBub3QgdG8g
ZG8gdGhhdC4NCj4gDQo+IFdvdWxkIHRoYXQgc291bmQgT0sgdG8gZXZlcnlvbmU/DQoNClRo
YXQgd291bGQgYmUgZmluZSB3aXRoIG1lLiBBcyB0aGVyZSBhcmUgb3RoZXIgZ3Vlc3Qgd3Jp
dGFibGUgbm9kZXMgYW55d2F5LA0KdGhpcyB3b3VsZG4ndCBhZGQgYW55IHNlY3VyaXR5IHBy
b2JsZW1zLg0KDQoNCkp1ZXJnZW4NCg==
--------------VbbGTI5401trzLDlj3OZegxH
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

--------------VbbGTI5401trzLDlj3OZegxH--

--------------UymK5MUw59LV0ODFU3ooKlv8--

--------------3LJ1USBl2pyul8ZhpjrQdhP7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSa6W4FAwAAAAAACgkQsN6d1ii/Ey9g
4Qf/TrA6AYdm1a4K0LEhEUD8n9jrENIKLWTuAGOso5j21L71mRE20/mU/DSX4gkyd9gGn/2jfDE8
xe2zr9Pgu8ST4SCw8ht+u+KhQA49lxTblNRVha3azywUE0P/YUtQ6xkzq2IwtyrCV0Fbh4Z4FcLm
jHGoer+uGnUhhjZ6jY6IVM4k4CKvPMyQNv0afxHDwK5gujGib/r+XtWuVIYEKeDehY4WznQX4K2K
Uvvq3cyfmkTeZAcStd1Ri/bhjnW2HN0ER4eGOGyRPMJ/KVHDwBzeBistthPtQGaZlps6nauhvLD9
S4Yg9zDhvJIMRQsXm/+CsXijTDJnJy/bhlXdX5pFHA==
=LCjk
-----END PGP SIGNATURE-----

--------------3LJ1USBl2pyul8ZhpjrQdhP7--

