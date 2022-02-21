Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934524BDA2F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 15:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276297.472422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9fH-00078G-V5; Mon, 21 Feb 2022 14:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276297.472422; Mon, 21 Feb 2022 14:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9fH-00075S-RY; Mon, 21 Feb 2022 14:27:47 +0000
Received: by outflank-mailman (input) for mailman id 276297;
 Mon, 21 Feb 2022 14:27:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tDfV=TE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nM9fG-00075M-Fn
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 14:27:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa00bc6-9322-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 15:27:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0291E1F390;
 Mon, 21 Feb 2022 14:27:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C254813B2F;
 Mon, 21 Feb 2022 14:27:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AgO1LWChE2JPJwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Feb 2022 14:27:44 +0000
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
X-Inumbo-ID: 6fa00bc6-9322-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645453665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHOy4+ZNl8F5x6c7k6RvuYPUl6iZNZdlBsE1U2QBbPE=;
	b=YHr37gvU0WSo00gNrOpqez6sccdhoaO6huBk4DdWu77SdUThgJAPT+vEMAXhFVqZ+w3yaw
	+HvRh9g9gY/H2bH1Fj/YOSogrbNxuIsOpf+yTPnl1mhASBplKuVPxd6ME68foW63hJYJkr
	8XbhPA2Rc6QSFymmkp4RYbsosqM1QQA=
Message-ID: <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
Date: Mon, 21 Feb 2022 15:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
In-Reply-To: <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gWE6ZntGoPMa0s0w3Uj1ykpD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gWE6ZntGoPMa0s0w3Uj1ykpD
Content-Type: multipart/mixed; boundary="------------tReYW0wuT60qrgHyXFQBk6eK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
In-Reply-To: <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>

--------------tReYW0wuT60qrgHyXFQBk6eK
Content-Type: multipart/mixed; boundary="------------Cuvmf1mlx7LgFe7M4o3cfBS3"

--------------Cuvmf1mlx7LgFe7M4o3cfBS3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDIuMjIgMTU6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wMi4yMDIy
IDEzOjQyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gUHJvdmlkaW5nIGEgbWFjcm8gZm9y
IGFuIGludmFsaWQgZ3JhbnQgcmVmZXJlbmNlIHdvdWxkIGJlIGJlbmVmaWNpYWwNCj4+IGZv
ciB1c2VycywgZXNwZWNpYWxseSBhcyBzb21lIGFyZSB1c2luZyB0aGUgd3JvbmcgdmFsdWUg
IjAiIGZvciB0aGF0DQo+PiBwdXJwb3NlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IE92ZXIgdGhlIHllYXJzIEkndmUg
YmVlbiBjb25zaWRlcmluZyB0byBhZGQgc3VjaCB0byB0aGUgcHVibGljDQo+IGludGVyZmFj
ZSwgcGVyaGFwcyBldmVuIG1vcmUgdGhhbiBvbmNlLiBCdXQgSSdtIGFmcmFpZCBpdCdzIG5v
dCB0aGF0DQo+IGVhc3kuIEluIHByaW5jaXBsZSAweGZmZmZmZmZmICh3aGljaCBidHcgaXNu
J3QgbmVjZXNzYXJpbHkgfjB1KSBjb3VsZA0KDQpJIGNhbiBjaGFuZ2UgdGhhdCB0byB1c2Ug
MHhmZmZmZmZmZiBleHBsaWNpdGx5Lg0KDQo+IGJlIGEgdmFsaWQgcmVmLiBJdCBpcyByZWFs
bHkgaW50ZXJuYWwgYWdyZWVtZW50IGJ5IHVzZXJzIG9mIHRoZQ0KPiBpbnRlcmZhY2UgdG8g
c2V0IGZvciB0aGVtc2VsdmVzIHRoYXQgdGhleSdyZSBub3QgZXZlciBnb2luZyB0byBtYWtl
DQo+IGEgdmFsaWQgZ3JhbnQgYmVoaW5kIHRoYXQgcmVmZXJlbmNlLg0KDQpBcyB0aGUgZ3Jh
bnQgcmVmZXJlbmNlIGlzIGFuIGluZGV4IGludG8gdGhlIGdyYW50IHRhYmxlIHRoaXMgd291
bGQNCmxpbWl0IHRoZSBzaXplIG9mIHRoZSBncmFudCB0YWJsZSB0byAib25seSIgVUlOVF9N
QVggLSAxLiBJIGRvbid0DQp0aGluayB0aGlzIHdpbGwgYmUgZXZlciBhIGNvbmNlcm4gKG90
aGVyIHRoYW4gYW4gYWNhZGVtaWNhbCBvbmUpLg0KDQoNCkp1ZXJnZW4NCg0K
--------------Cuvmf1mlx7LgFe7M4o3cfBS3
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

--------------Cuvmf1mlx7LgFe7M4o3cfBS3--

--------------tReYW0wuT60qrgHyXFQBk6eK--

--------------gWE6ZntGoPMa0s0w3Uj1ykpD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIToWAFAwAAAAAACgkQsN6d1ii/Ey84
zwf/dYqGfLyJotSX/10nPat1LyqdAdyNu6x9oGxLQK5QCOqNtfHJeH0/5xNxYVzhU5B0+2OS2vkK
SlNSuyZhFdyRiqkakxlDWUcg/IJ7+oHAggh6oDGJMxHJPN4DpUHz0cmDndH/zvhxdihPJgE2/sPQ
YgZTML8DhYIQS0GwNCo87nSSmK/16+zwqfRC5luCpGFWy5VJ4qgJjO3Gi/fT82E/WPXfxcdQbB4j
uY4AKB39JJqKrtcRGU8znEBMcPug/wQRlJyY286qiVnAo1EVrKrd/8FGoynWaKNn3PsPB1RGuEas
kMHpPppFaPxGJSluCYbZOFUPLGR/lrYpEkf/oeNVjQ==
=/0gY
-----END PGP SIGNATURE-----

--------------gWE6ZntGoPMa0s0w3Uj1ykpD--

