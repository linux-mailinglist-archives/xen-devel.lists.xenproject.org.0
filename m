Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1BE6061BA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426813.675516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVhO-0007ra-2V; Thu, 20 Oct 2022 13:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426813.675516; Thu, 20 Oct 2022 13:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVhN-0007oW-VW; Thu, 20 Oct 2022 13:35:01 +0000
Received: by outflank-mailman (input) for mailman id 426813;
 Thu, 20 Oct 2022 13:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tgfI=2V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olVhM-0007oQ-JH
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:35:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe1fbd33-507b-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 15:34:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0522322526;
 Thu, 20 Oct 2022 13:34:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4AE113494;
 Thu, 20 Oct 2022 13:34:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RObBJoJOUWOQSAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Oct 2022 13:34:58 +0000
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
X-Inumbo-ID: fe1fbd33-507b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666272899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ARNcepPKyfTU7bO/bwBF1UWT9pTUYO6AT49ukGfCHD8=;
	b=EpNZNQb/hNP9jS9wPXdCxcmjPycruocr80DaPtf13D9IjVgUyiD+MLjPHi6c8Me/k7UguS
	dPx8dte5Rz3wl9NcQ8FTfvTkCkTqTbnAwqaqjDBG4bCbrqY6j3S1MGwn2aGvSm6SOmLxJT
	QDxnTXgC7Dcn431gBOCEyWPH2/fe2qU=
Message-ID: <26bae6db-0e17-2b54-4046-0e85b26f6401@suse.com>
Date: Thu, 20 Oct 2022 15:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20221020113759.17402-1-jgross@suse.com>
 <47668d94-6b55-2894-fa6d-82b1f17312bf@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: silence smatch warning in pmu_msr_chk_emulated()
In-Reply-To: <47668d94-6b55-2894-fa6d-82b1f17312bf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------57JFMDa70xHhdru0CQKVxZA5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------57JFMDa70xHhdru0CQKVxZA5
Content-Type: multipart/mixed; boundary="------------6b698FiirMJSMgvVYTVWAQ27";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Message-ID: <26bae6db-0e17-2b54-4046-0e85b26f6401@suse.com>
Subject: Re: [PATCH] x86/xen: silence smatch warning in pmu_msr_chk_emulated()
References: <20221020113759.17402-1-jgross@suse.com>
 <47668d94-6b55-2894-fa6d-82b1f17312bf@suse.com>
In-Reply-To: <47668d94-6b55-2894-fa6d-82b1f17312bf@suse.com>

--------------6b698FiirMJSMgvVYTVWAQ27
Content-Type: multipart/mixed; boundary="------------m0MNGMfGi7qcqgN8ZUMqrCaE"

--------------m0MNGMfGi7qcqgN8ZUMqrCaE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTAuMjIgMTU6MTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4xMC4yMDIy
IDEzOjM3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQ29tbWl0IDg3MTRmN2JjZDNjMiAo
Inhlbi9wdjogYWRkIGZhdWx0IHJlY292ZXJ5IGNvbnRyb2wgdG8gcG11IG1zcg0KPj4gYWNj
ZXNzZXMiKSBpbnRyb2R1Y2VkIGNvZGUgcmVzdWx0aW5nIGluIGEgd2FybmluZyBpc3N1ZWQg
YnkgdGhlIHNtYXRjaA0KPj4gc3RhdGljIGNoZWNrZXIsIGNsYWltaW5nIHRvIHVzZSBhbiB1
bmluaXRpYWxpemVkIHZhcmlhYmxlLg0KPj4NCj4+IFRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2
ZSwgYnV0IHdvcmsgYXJvdW5kIHRoZSB3YXJuaW5nIG5ldmVydGhlbGVzcy4NCj4gDQo+IFRo
ZSByaXNrIG9mIGludHJvZHVjaW5nIGEgcHJvYmxlbSBtaWdodCBiZSBxdWl0ZSBsb3cgaGVy
ZSwgYnV0IGluIGdlbmVyYWwNCj4gaXQgZXhpc3RzOiBXaXRoIHRoZSBhZGp1c3RtZW50IHlv
dSByZW1vdmUgYW55IGNoYW5jZSBvZiB0aGUgY29tcGlsZXINCj4gc3BvdHRpbmcgYSBtaXNz
aW5nIGluaXRpYWxpemF0aW9uIGJlZm9yZSB1c2UuIEFuZCBJJ20gbm90IGNvbnZpbmNlZCB1
c2luZw0KPiAwIGluIHN1Y2ggYSBjYXNlIHdvdWxkIGFjdHVhbGx5IGJlIGVuZGluZyB1cCBz
dWZmaWNpZW50bHkgYmVuaWduLg0KDQpIbW0sIGFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRv
IGluaXRpYWxpemUgaXQgdG8gLTEgYW5kIGFkZCBhIHRlc3QgZm9yIHRoZQ0KaW5kZXggdG8g
YmUgPj0gMCBiZWZvcmUgdXNpbmcgaXQuDQoNCk9yIHRvIGxpdmUgd2l0aCB0aGUgc21hc2gg
d2FybmluZyB3aXRoIHRoZSBjaGFuY2UsIHRoYXQgYSBjb21waWxlciBtaWdodCBiZQ0Kd2Fy
bmluZyBmb3IgdGhlIHNhbWUgcmVhc29uIGluIHRoZSBmdXR1cmUuDQoNCg0KSnVlcmdlbg0K

--------------m0MNGMfGi7qcqgN8ZUMqrCaE
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

--------------m0MNGMfGi7qcqgN8ZUMqrCaE--

--------------6b698FiirMJSMgvVYTVWAQ27--

--------------57JFMDa70xHhdru0CQKVxZA5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNRToIFAwAAAAAACgkQsN6d1ii/Ey/y
vAf/ZuR/GKdTUEzYncOawz7kdZHgCaF3QZuVpveV/KJ9fqhX0vIO0vGSgvQ3K45faVm3O4AJAO3j
IZt1fNtxS7nda8pJBqkjj6YM05OjOunP3E9l0go6OOLaeF8bk+e8tNVIZBhtdOLh4gi3JbuRGSTg
8oqhNhduzxQp8MmEZm+evpfdDYxdngJJLktEkpV39kIsA9sFHU6+J6JkRuC0wZxO3nFQUfjC3StF
W6r/4fMCpCHPWSdkesfwl1OYPfFvBUEYB/SkKqRuhllUuz0dQbdHQtRxtu/iH2X7MsEmdn2NcmhB
A40khxvUP8oitAEJzKOOY+XDgaoM5pyjjZafUGlReA==
=bEMw
-----END PGP SIGNATURE-----

--------------57JFMDa70xHhdru0CQKVxZA5--

