Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D96070AF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 09:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427372.676350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olm6f-0001s4-15; Fri, 21 Oct 2022 07:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427372.676350; Fri, 21 Oct 2022 07:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olm6e-0001qG-UD; Fri, 21 Oct 2022 07:06:12 +0000
Received: by outflank-mailman (input) for mailman id 427372;
 Fri, 21 Oct 2022 07:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olm6c-0001qA-HG
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 07:06:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d59a659b-510e-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 09:06:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 354041F74D;
 Fri, 21 Oct 2022 07:06:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7FA413A0E;
 Fri, 21 Oct 2022 07:06:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hJs2M95EUmOKJgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 07:06:06 +0000
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
X-Inumbo-ID: d59a659b-510e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666335967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vdcj9F9eh61DDb4NOAa7NQ6U9MiEGwzNy6Cji5VCinI=;
	b=T0nH5MkvwcXNMynb0Hv9RU93HzP5sENRaWmKcMZ/0DNdfI2bPR4elPTb2rSwGUuXImn1m+
	8schTLfcIYL3aXHSguwslAu/TaIE2vlR6udlovEzHdAy4KS0h8FRUip+B5OOupdSdcb+V5
	D6i+a77k+3HyIxRn2j0MfoHmygnKZfI=
Message-ID: <6ac5b62c-1679-b55b-e3aa-00ac395ce89c@suse.com>
Date: Fri, 21 Oct 2022 09:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20221021065806.14316-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221021065806.14316-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V0Lgz7AxECG2WEjAShDry3mi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V0Lgz7AxECG2WEjAShDry3mi
Content-Type: multipart/mixed; boundary="------------ZpkzQmT2h3MuH7n9jntZmdwg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <6ac5b62c-1679-b55b-e3aa-00ac395ce89c@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
References: <20221021065806.14316-1-jgross@suse.com>
In-Reply-To: <20221021065806.14316-1-jgross@suse.com>

--------------ZpkzQmT2h3MuH7n9jntZmdwg
Content-Type: multipart/mixed; boundary="------------6xoUVHxulvbL46hNCfxLgJvX"

--------------6xoUVHxulvbL46hNCfxLgJvX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTAuMjIgMDg6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFdoZW4gdGhlIHN5
c3RlbSBpcyBjb21pbmcgdXAgYWZ0ZXIgaGF2aW5nIGJlZW4gc3VzcGVuZGVkLA0KPiByZXN0
b3JlX3ZjcHVfYWZmaW5pdHkoKSBpcyBjYWxsZWQgZm9yIGVhY2ggZG9tYWluIGluIG9yZGVy
IHRvIGFkanVzdA0KPiB0aGUgdmNwdSdzIGFmZmluaXR5IHNldHRpbmdzIGluIGNhc2UgYSBj
cHUgZGlkbid0IGNvbWUgdG8gbGl2ZSBhZ2Fpbi4NCj4gDQo+IFRoZSB3YXkgcmVzdG9yZV92
Y3B1X2FmZmluaXR5KCkgaXMgZG9pbmcgdGhhdCBpcyB3cm9uZywgYmVjYXVzZSB0aGUNCj4g
c3BlY2lmaWMgc2NoZWR1bGVyIGlzbid0IGJlaW5nIGluZm9ybWVkIGFib3V0IGEgcG9zc2li
bGUgbWlncmF0aW9uIG9mDQo+IHRoZSB2Y3B1IHRvIGFub3RoZXIgY3B1LiBBZGRpdGlvbmFs
bHkgdGhlIG1pZ3JhdGlvbiBpcyBvZnRlbiBldmVuDQo+IGhhcHBlbmluZyBpZiBhbGwgY3B1
cyBhcmUgcnVubmluZyBhZ2FpbiwgYXMgaXQgaXMgZG9uZSB3aXRob3V0IGNoZWNrDQo+IHdo
ZXRoZXIgaXQgaXMgcmVhbGx5IG5lZWRlZC4NCj4gDQo+IEFzIGNwdXBvb2wgbWFuYWdlbWVu
dCBpcyBhbHJlYWR5IGNhbGxpbmcgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkgZm9yDQo+IGNw
dXMgbm90IGhhdmluZyBjb21lIHVwIGFnYWluLCBhbmQgY3B1X2Rpc2FibGVfc2NoZWR1bGVy
KCkgaXMgdGFraW5nDQo+IGNhcmUgb2YgZXZlbnR1YWxseSBuZWVkZWQgdmNwdSBtaWdyYXRp
b24gaW4gdGhlIHByb3BlciB3YXksIHRoZXJlIGlzDQo+IHNpbXBseSBubyBuZWVkIGZvciBy
ZXN0b3JlX3ZjcHVfYWZmaW5pdHkoKS4NCj4gDQo+IFNvIGp1c3QgcmVtb3ZlIHJlc3RvcmVf
dmNwdV9hZmZpbml0eSgpIGNvbXBsZXRlbHkuDQo+IA0KPiBGaXhlczogOGE1ZDUwZGQwYjA0
ICgieGVuOiBzY2hlZDogc2ltcGxpZnkgQUNQSSBTMyByZXN1bWUgcGF0aC4iKQ0KDQpUaGlz
IEZpeGVzOiB0YWcgaXMgd3JvbmcuIEl0IHNob3VsZCBiZToNCg0KRml4ZXM6IDhhMDRlYWE4
ZWE4MyAoInhlbi9zY2hlZDogbW92ZSBzb21lIHBlci12Y3B1IGl0ZW1zIHRvIHN0cnVjdCBz
Y2hlZF91bml0IikNCg0KDQpKdWVyZ2VuDQo=
--------------6xoUVHxulvbL46hNCfxLgJvX
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

--------------6xoUVHxulvbL46hNCfxLgJvX--

--------------ZpkzQmT2h3MuH7n9jntZmdwg--

--------------V0Lgz7AxECG2WEjAShDry3mi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNSRN4FAwAAAAAACgkQsN6d1ii/Ey/H
7Af+IrAtBUD8GyzT48WlLphugwuW2g64puj7inFbMKfCH3GmoL7iL0I6b6bsrsMnkQrUODzwJz3R
g5J78hb8ZuEwTpg1IX7djqkg4dSoq2cU1OBemQsueE7qjLYbLFdmHvA18GoxYR+22PQhG3M/diFR
YxAOUMvh/s7Xw4E7ppaUuAK1G0c+NxRMxlTEvlFNHZNgxJVoFKftwWHhey9n5OwsJKJuL3jVHMSl
Hf5KIxG83atRQxMd24A8z39QDn4uJYvbMKr+/hi17/B/Ms+3wIcxO2Ugdn68Cmo1XNUWH6Ti631J
5VCMrv6mlWen2IdLG9Lq0Ml2aulY5C0WK+zf7j770g==
=2vhO
-----END PGP SIGNATURE-----

--------------V0Lgz7AxECG2WEjAShDry3mi--

