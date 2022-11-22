Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C99633CD0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 13:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447144.703061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSgI-0003N6-SP; Tue, 22 Nov 2022 12:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447144.703061; Tue, 22 Nov 2022 12:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSgI-0003Ky-PP; Tue, 22 Nov 2022 12:47:18 +0000
Received: by outflank-mailman (input) for mailman id 447144;
 Tue, 22 Nov 2022 12:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rKVg=3W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oxSgH-0003CI-21
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 12:47:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cac570e1-6a63-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 13:47:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A92E21D3F;
 Tue, 22 Nov 2022 12:47:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEDFA13B01;
 Tue, 22 Nov 2022 12:47:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6TL5NNLEfGMtNAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 22 Nov 2022 12:47:14 +0000
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
X-Inumbo-ID: cac570e1-6a63-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669121235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YsI7A9SUK5qB234FSuBPSK2EHGVG9qNw7j4AtLZMBFs=;
	b=HcI0V97JVESYsYCFrZMA/9XvAVxNCGjH531cFEv8+9xWNpmt9D+e/kJ+ADeycemTTztcdD
	1pBn8cOQ0yiSWUGagYyz+qRPQju7a+IIWQyxk5MIsYdMbEKzpAcNwK69SL5gXPH3rNSRiA
	0bRVi+M2wb9wNR4jnIHvyhfPLfQyViI=
Message-ID: <f56663a5-30bd-fa59-34cb-883bf53088d5@suse.com>
Date: Tue, 22 Nov 2022 13:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/5] x86: Switch X86_FEATURE_XENPV to
 cpu_feature_enabled() use
Content-Language: en-US
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Pu Wen <puwen@hygon.cn>
References: <20221104072701.20283-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221104072701.20283-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BM67QrvznezM2snUWc094p0n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BM67QrvznezM2snUWc094p0n
Content-Type: multipart/mixed; boundary="------------DY0Si20AgKhX1epXJ30fV0Ic";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Pu Wen <puwen@hygon.cn>
Message-ID: <f56663a5-30bd-fa59-34cb-883bf53088d5@suse.com>
Subject: Re: [PATCH v2 0/5] x86: Switch X86_FEATURE_XENPV to
 cpu_feature_enabled() use
References: <20221104072701.20283-1-jgross@suse.com>
In-Reply-To: <20221104072701.20283-1-jgross@suse.com>

--------------DY0Si20AgKhX1epXJ30fV0Ic
Content-Type: multipart/mixed; boundary="------------E5GA5WyRnhJiGBCZDpezveYm"

--------------E5GA5WyRnhJiGBCZDpezveYm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTEuMjIgMDg6MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE1ha2UgZXNwZWNp
YWxseSBrZXJuZWxzIHdpdGhvdXQgQ09ORklHX1hFTl9QViBtb3JlIGVmZmljaWVudCBieQ0K
PiB1c2luZyBjcHVfZmVhdHVyZV9lbmFibGVkKFg4Nl9GRUFUVVJFX1hFTlBWKSBpbnN0ZWFk
IG9mIGJvb3RfY3B1X2hhcygpDQo+IGFuZCBmcmllbmRzLg0KPiANCj4gQ2hhbmdlcyBpbiBW
MjoNCj4gLSBuZXcgcGF0Y2ggNA0KPiANCj4gSnVlcmdlbiBHcm9zcyAoNSk6DQo+ICAgIHg4
NjogYWRkIFg4Nl9GRUFUVVJFX1hFTlBWIHRvIGRpc2FibGVkLWZlYXR1cmVzLmgNCj4gICAg
eDg2OiByZW1vdmUgdW5uZWVkZWQgNjQtYml0IGRlcGVuZGVuY3kgaW4gYXJjaF9lbnRlcl9m
cm9tX3VzZXJfbW9kZSgpDQo+ICAgIHg4NjogZHJvcCAzMi1iaXQgWGVuIFBWIGd1ZXN0IGNv
ZGUgaW4gdXBkYXRlX3Rhc2tfc3RhY2soKQ0KPiAgICB4ODY6IHJlbW92ZSBYODZfRkVBVFVS
RV9YRU5QViB1c2FnZSBpbiBzZXR1cF9jcHVfZW50cnlfYXJlYSgpDQo+ICAgIHg4Njogc3dp
dGNoIHRvIGNwdV9mZWF0dXJlX2VuYWJsZWQoKSBmb3IgWDg2X0ZFQVRVUkVfWEVOUFYNCj4g
DQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vZGlzYWJsZWQtZmVhdHVyZXMuaCB8IDggKysr
KysrKy0NCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaCAgICAgIHwg
NCArKy0tDQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggICAgICAgICB8
IDcgKystLS0tLQ0KPiAgIGFyY2gveDg2L2tlcm5lbC9jcHUvYW1kLmMgICAgICAgICAgICAg
ICAgfCAyICstDQo+ICAgYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMgICAgICAgICAgICAg
ICB8IDIgKy0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvY3B1L2h5Z29uLmMgICAgICAgICAgICAg
IHwgMiArLQ0KPiAgIGFyY2gveDg2L2tlcm5lbC9wcm9jZXNzXzY0LmMgICAgICAgICAgICAg
fCA0ICsrLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvdG9wb2xvZ3kuYyAgICAgICAgICAgICAg
IHwgMiArLQ0KPiAgIGFyY2gveDg2L21tL2NwdV9lbnRyeV9hcmVhLmMgICAgICAgICAgICAg
fCA4ICsrLS0tLS0tDQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAy
MCBkZWxldGlvbnMoLSkNCj4gDQoNClRoZSBwYXRjaGVzIGhhdmUgYWxsIGFuICJBY2siIGJ5
IERhdmUuIEkgdGhpbmsgdGhpcyBzZXJpZXMgc2hvdWxkIGdvIGluDQp2aWEgdGhlIHRpcCB0
cmVlLCBubz8NCg0KDQpKdWVyZ2VuDQo=
--------------E5GA5WyRnhJiGBCZDpezveYm
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

--------------E5GA5WyRnhJiGBCZDpezveYm--

--------------DY0Si20AgKhX1epXJ30fV0Ic--

--------------BM67QrvznezM2snUWc094p0n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmN8xNIFAwAAAAAACgkQsN6d1ii/Ey+X
Zgf+Kyl5SsflAy66qlgC+7jxck3nSUVruLb5t+QS9ovIZUCboi2QQopfEtZqI2aNaAVuQSUjNTKQ
tJnBHduslM0ZEdNA9o3bOTKajo4Uweh7ruP5lq93jsaSc2cvj0TnjSbStk8O1b+VN+vaAO94vmwG
qVUZ1stQtYRQ1x92zvMYX5Nk1oRlcSIBsVjSk23QU0D4+iFqUpV+/Jo8u+YKrxp7gZulXpD3vUMX
AeegrU2HZKPHDsuD9ax3LFZ/YIILqJCxdrkIjNb+DhynYR9GsQqvPYWa9mMId/kyvCvhX3Rv1lpi
UZezHAhtybIkPo77jldrjQQKu+IsDgKSSINmXwx58g==
=gZnK
-----END PGP SIGNATURE-----

--------------BM67QrvznezM2snUWc094p0n--

