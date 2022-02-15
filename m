Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AAF4B6FEC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273362.468521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK01E-0006f9-Ez; Tue, 15 Feb 2022 15:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273362.468521; Tue, 15 Feb 2022 15:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK01E-0006d8-Bg; Tue, 15 Feb 2022 15:45:32 +0000
Received: by outflank-mailman (input) for mailman id 273362;
 Tue, 15 Feb 2022 15:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=az2O=S6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nK01C-0006d2-UV
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:45:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d60bf38-8e76-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 16:45:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 79D8B1F37B;
 Tue, 15 Feb 2022 15:45:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EE8D13C96;
 Tue, 15 Feb 2022 15:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PwcODpnKC2IjTwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 15 Feb 2022 15:45:29 +0000
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
X-Inumbo-ID: 4d60bf38-8e76-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644939929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bx7iozxsbrgZUNO9o0t54rHCxDQLvX1k2zoI6oQ1rpk=;
	b=gj0z6WajwMh5j5GGvc8zDw9R0fpZPHgbLEwtqjtWJilyDtH6lqe8cGpOvu6ZjbxWiNmGl0
	oikbxsxYhyRSqeb9286jk+tKTQOji9gzu8T5opjw3ZnH10nofnTwaAiUXO23BAC5PFRc13
	RQKKTzEkwQNd0a0EixGd/7RhisP4ero=
Message-ID: <8891ed69-2ad2-2842-e34e-8252860b71d9@suse.com>
Date: Tue, 15 Feb 2022 16:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] tools/xenstore: add error indicator to ring page
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220210111620.5256-1-jgross@suse.com>
 <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jM2uX0ZAdAgVliFxjyKxO0iz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jM2uX0ZAdAgVliFxjyKxO0iz
Content-Type: multipart/mixed; boundary="------------k2QtBf1P8l1ffGBSTBGUEmRy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <8891ed69-2ad2-2842-e34e-8252860b71d9@suse.com>
Subject: Re: [PATCH] tools/xenstore: add error indicator to ring page
References: <20220210111620.5256-1-jgross@suse.com>
 <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>
In-Reply-To: <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>

--------------k2QtBf1P8l1ffGBSTBGUEmRy
Content-Type: multipart/mixed; boundary="------------T0y3kQCNviUlbupCaY0WwuEj"

--------------T0y3kQCNviUlbupCaY0WwuEj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIEZl
YiAxMCwgMjAyMiBhdCAxMjoxNjoyMFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gK1RoZSAiQ29ubmVjdGlvbiBlcnJvciBpbmRpY2F0b3IiIGlzIHVzZWQgdG8gbGV0IHRo
ZSBzZXJ2ZXIgaW5kaWNhdGUgaXQgaGFzDQo+PiArZGV0ZWN0ZWQgc29tZSBlcnJvciB0aGF0
IGxlZCB0byBkZWFjdGl2YXRpb24gb2YgdGhlIGNvbm5lY3Rpb24gYnkgdGhlIHNlcnZlci4N
Cj4+ICtJZiB0aGUgZmVhdHVyZSBoYXMgYmVlbiBhZHZlcnRpc2VkIHRoZW4gdGhlICJDb25u
ZWN0aW9uIGVycm9yIGluZGljYXRvciIgbWF5DQo+PiArdGFrZSB0aGUgZm9sbG93aW5nIHZh
bHVlczoNCj4+ICsNCj4+ICtWYWx1ZSAgIERlc2NyaXB0aW9uDQo+PiArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+ICswICAgICAgIE5vIGVycm9yLCBjb25uZWN0aW9uIGlzIHZhbGlkDQo+PiArMSAgICAg
ICBDb21tdW5pY2F0aW9uIHByb2JsZW1zIChldmVudCBjaGFubmVsIG5vdCBmdW5jdGlvbmFs
KQ0KPj4gKzIgICAgICAgSW5jb25zaXN0ZW50IHByb2R1Y2VyIG9yIGNvbnN1bWVyIG9mZnNl
dA0KPj4gKzMgICAgICAgUHJvdG9jb2wgdmlvbGF0aW9uIChjbGllbnQgZGF0YSBwYWNrYWdl
IHRvbyBsb25nKQ0KPiANCj4gSXMgdGhpcyBtZWFudCB0byBiZSB0aGUgb25seSBwb3NzaWJs
ZSBlcnJvciB2YWx1ZT8gSWYgaW4gdGhlIGZ1dHVyZSB3ZQ0KPiB3YW50IHRvIGFkZCBtb3Jl
IHBvc3NpYmxlIGVycm9yLCBkb2VzIGl0IGdvaW5nIHRvIG5lZWQgYSBuZXcgZmVhdHVyZQ0K
PiBiaXQgYW5kIG1heWJlIGEgbmV3IGVycm9yIGZpZWxkPw0KDQpObywgYXMgdGhlIGd1ZXN0
IGlzIG5vdCBvcHRpbmcgaW50byB0aGlzIGZlYXR1cmUsIGJ1dCBqdXN0IGdldHMgaXQNCnBy
ZXNlbnRlZCwgdGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIGFub3RoZXIgYml0IGZvciBuZXcg
ZXJyb3IgdmFsdWVzLg0KDQpOb3RlIHRoYXQgdGhpcyBpcyBhIHB1cmVseSBpbmZvcm1hdGlv
bmFsIGludGVyZmFjZS4gVGhlIGVycm9yIHZhbHVlDQoob3RoZXIgdGhhbiAwKSBpcyBvbmx5
IGZvciBkaWFnbm9zdGljIHB1cnBvc2VzLCB0aGVyZSBpcyBubyB3YXkgYQ0KZ3Vlc3QgY291
bGQgcmVhY3QgaW4gYSBzYW5lIHdheSB0byBhIHNwZWNpZmljIGVycm9yIGNhc2UuDQoNCg0K
SnVlcmdlbg0K
--------------T0y3kQCNviUlbupCaY0WwuEj
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

--------------T0y3kQCNviUlbupCaY0WwuEj--

--------------k2QtBf1P8l1ffGBSTBGUEmRy--

--------------jM2uX0ZAdAgVliFxjyKxO0iz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmILypgFAwAAAAAACgkQsN6d1ii/Ey89
kQf9GnC4ZL3nSpMDk8vZsAHLLPQLMDMKbdKyDCc/KiUghJ4LrTNLJUB5Hdr+Rsxd+5EpeL5nZIld
a4hHbwQJHYsxJX/EH/bpdXew/Pm1STjrhIueDgwH4yXKYkBpKvviSn+396fQAljt6y3Hr9vIRSRm
srS49/gqHW4DfKTZBlKEjEJne+lnFHXU61tuplrDho/OnUkf07+Glj0KfaEyUqr64GKhXXMmdGpL
Dx8tJhWJ8xfv+zj6OCYskodONDDkSNgD+/BQEcjz6kicUfDtySbsYalEOTdzhKb2tMXjb+fLVYOd
u4zl/moqogDsQ741L77/jWUUwmKLJ6Wcq5jJoPO0NA==
=dDd0
-----END PGP SIGNATURE-----

--------------jM2uX0ZAdAgVliFxjyKxO0iz--

