Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2D64B0A9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 08:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460254.718138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p50Ak-0002gq-5U; Tue, 13 Dec 2022 07:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460254.718138; Tue, 13 Dec 2022 07:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p50Ak-0002e6-2R; Tue, 13 Dec 2022 07:57:54 +0000
Received: by outflank-mailman (input) for mailman id 460254;
 Tue, 13 Dec 2022 07:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p50Aj-0002dy-74
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 07:57:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d51680da-7abb-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 08:57:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BC5D225C9;
 Tue, 13 Dec 2022 07:57:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F27A138F9;
 Tue, 13 Dec 2022 07:57:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 08ENFX8wmGMAEAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 07:57:51 +0000
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
X-Inumbo-ID: d51680da-7abb-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670918271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ard7t9tCMxeiqHzuwFCEnUKMs1vuUW4GI5BejTb1L+4=;
	b=KX/hUNHZ3xD+ZqO1xlqK/8vyUgZJG040VSaRa+OgxW3ktepI+QRfye9JFBQMg7RaDE9CYq
	q+y4ObUq2U3t3bMxCKgicjbDZkZnvNSQj5nFIXvh1kk4ZzX81982BaVkqcnzMsL5tTOh7H
	khUcK7rLzzkSRVCckkPFGBJ+RsxXD48=
Message-ID: <96e98cc3-71fd-13c5-ec0c-be9cdafc3678@suse.com>
Date: Tue, 13 Dec 2022 08:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 15/20] tools/xenstore: make domain_is_unprivileged() an
 inline function
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-16-jgross@suse.com>
 <872b4aae-34c1-be54-be58-6738ebd0537c@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <872b4aae-34c1-be54-be58-6738ebd0537c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CaOunXX43TRqOQHZCzlo9tyj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CaOunXX43TRqOQHZCzlo9tyj
Content-Type: multipart/mixed; boundary="------------7OtAgHqfvhic1AheCwLu19Je";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <96e98cc3-71fd-13c5-ec0c-be9cdafc3678@suse.com>
Subject: Re: [PATCH 15/20] tools/xenstore: make domain_is_unprivileged() an
 inline function
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-16-jgross@suse.com>
 <872b4aae-34c1-be54-be58-6738ebd0537c@xen.org>
In-Reply-To: <872b4aae-34c1-be54-be58-6738ebd0537c@xen.org>

--------------7OtAgHqfvhic1AheCwLu19Je
Content-Type: multipart/mixed; boundary="------------bFgEdx32n8ZENoNLjvk8Av7e"

--------------bFgEdx32n8ZENoNLjvk8Av7e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMjM6MDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBj
bGFuZyBpcyBjb21wbGFpbmluZyBhYm91dCBhIE5VTEwgZGVyZWZlcmVuY2UgZm9yIGNvbnN0
cnVjdHMgbGlrZToNCj4+DQo+PiDCoMKgIGRvbWFpbl9pc191bnByaXZpbGVnZWQoY29ubikg
PyBjb25uLT5pbiA6IE5VTEwNCj4gDQo+IEkgaGF2ZSBqdXN0IGJ1aWxkIHhlbnN0b3JlZCB3
aXRoIGNsYW5nIDExIGFuZCBkaWRuJ3QgZ2V0IGEgY29tcGxhaW4uIFNvIGNhbiB5b3UgDQo+
IHByb3ZpZGUgbW9yZSBkZXRhaWxzPw0KDQpJdCB3YXMgcmVwb3J0ZWQgYnkgRWR3aW4gZHVy
aW5nIGRldmVsb3BtZW50IG9mIHRoZSBYU0Egc2VyaWVzOg0KDQpPbiAxMS8wOC8yMDIyIDE5
OjAxLCBFZHdpbiBUb3JvayB3cm90ZToNCiA+IHhlbnN0b3JlZF93YXRjaC5jOjE1MjozOTog
d2FybmluZzogQWNjZXNzIHRvIGZpZWxkICdpbicgcmVzdWx0cyBpbiBhIA0KZGVyZWZlcmVu
Y2Ugb2YgYSBudWxsIHBvaW50ZXIgKGxvYWRlZCBmcm9tIHZhcmlhYmxlICdjb25uJykgW2Nv
cmUuTnVsbERlcmVmZXJlbmNlXQ0KID4gICAgICAgICAgcmVxID0gZG9tYWluX2lzX3VucHJp
dmlsZWdlZChjb25uKSA/IGNvbm4tPmluIDogTlVMTDsNCiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fg0KID4gMSB3YXJuaW5nIGdl
bmVyYXRlZC4NCiA+DQogPiBjbGFuZyAxNCBzYXlzIHRoaXMgaXMgYSBOVUxMIGRlcmVmZXJl
bmNlIC4uLg0KDQpZb3UgZXZlbiByZXNwb25kZWQgdG8gdGhhdCByZXBvcnQsIEJUVy4NCg0K
DQpKdWVyZ2VuDQo=
--------------bFgEdx32n8ZENoNLjvk8Av7e
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

--------------bFgEdx32n8ZENoNLjvk8Av7e--

--------------7OtAgHqfvhic1AheCwLu19Je--

--------------CaOunXX43TRqOQHZCzlo9tyj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOYMH4FAwAAAAAACgkQsN6d1ii/Ey+i
Ewf+MIPKgg2Uv4UCBQWwd2JqIxgXL2SozH1oJQN+E0/x02jn/1/FnkUwAKTnhS3pRIeejKjjWcIS
ciEzJEsjtkYJ/z9HiM6Gx872iSvM3kuxdfqJJkBeCIYHekTIA6h0O8fH8IoQFO839jZuDJh5tukP
2Kopqp0nGrY0xajwSZoaQh7nNPW21irzVI0wUmZDwDgh/C/pXgSyAfKeu1wX3I4ZL00BTzxmOFHO
jByQZkkCshcasjSmy4ctzRbXncOZ9QIm4MHfvBPF29G3/zGwrSM/dLSu3nXU4aVFvaCbJy4oXGIr
MU27dKFjiiYMKI+M04YgsKTKE/rGFxJVU0NxoR+JEA==
=Srs4
-----END PGP SIGNATURE-----

--------------CaOunXX43TRqOQHZCzlo9tyj--

