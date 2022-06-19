Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07D5508C8
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jun 2022 07:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352028.578736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2nqo-0006L7-5Q; Sun, 19 Jun 2022 05:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352028.578736; Sun, 19 Jun 2022 05:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2nqo-0006J0-28; Sun, 19 Jun 2022 05:51:58 +0000
Received: by outflank-mailman (input) for mailman id 352028;
 Sun, 19 Jun 2022 05:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o2nqm-0006Ip-Rm
 for xen-devel@lists.xenproject.org; Sun, 19 Jun 2022 05:51:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec2cf6f0-ef93-11ec-b725-ed86ccbb4733;
 Sun, 19 Jun 2022 07:51:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E5A021DFC;
 Sun, 19 Jun 2022 05:51:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3DD113458;
 Sun, 19 Jun 2022 05:51:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XW4pMXm5rmILUAAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 19 Jun 2022 05:51:53 +0000
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
X-Inumbo-ID: ec2cf6f0-ef93-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655617914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L/RykbmL5s0TZXBBWPLquIWnkE/8q9vQJ3Ra5JnTDjg=;
	b=R8WLOD5Mn4bPjpJfsD1YbN0Bc44LOmMB0SI1FWSQhUzq6GQYtUpziDemDuaokPt8PqqhCW
	vZJbA6lahumenjpw5aJ1acSlYQqxg9e3IzOPUAlIOQYe/qN5nNyr/j8CjU2i0Sin06NcwC
	e4KvnZ72RS+VOB1WdjAQno6oEZ5B2lg=
Message-ID: <09d88287-a957-b89a-939a-7d39282e7d94@suse.com>
Date: Sun, 19 Jun 2022 07:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] mini-os: fix number of pages for PVH
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20220618104816.11527-1-jgross@suse.com>
 <20220618104816.11527-4-jgross@suse.com>
 <20220618121328.54byw5ggucap6x5j@begin>
 <8815b69d-f687-3b0f-1b9c-6bd273cd3404@suse.com>
 <20220618155654.kcvodnjcd7khwspl@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220618155654.kcvodnjcd7khwspl@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5CgqcIrOffQ7QwdM0BKvXb4p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5CgqcIrOffQ7QwdM0BKvXb4p
Content-Type: multipart/mixed; boundary="------------s0gT5wMZ48gjfVaL77yMyCbE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <09d88287-a957-b89a-939a-7d39282e7d94@suse.com>
Subject: Re: [PATCH 3/3] mini-os: fix number of pages for PVH
References: <20220618104816.11527-1-jgross@suse.com>
 <20220618104816.11527-4-jgross@suse.com>
 <20220618121328.54byw5ggucap6x5j@begin>
 <8815b69d-f687-3b0f-1b9c-6bd273cd3404@suse.com>
 <20220618155654.kcvodnjcd7khwspl@begin>
In-Reply-To: <20220618155654.kcvodnjcd7khwspl@begin>

--------------s0gT5wMZ48gjfVaL77yMyCbE
Content-Type: multipart/mixed; boundary="------------2GZMiMbs0NqV6DqwP8JmwmsF"

--------------2GZMiMbs0NqV6DqwP8JmwmsF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDYuMjIgMTc6NTYsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgc2FtLiAxOCBqdWluIDIwMjIgMTY6MDc6MDcgKzAyMDAsIGEgZWNyaXQ6DQo+
PiBPbiAxOC4wNi4yMiAxNDoxMywgU2FtdWVsIFRoaWJhdWx0IHdyb3RlOg0KPj4+IEhlbGxv
LA0KPj4+DQo+Pj4gSnVlcmdlbiBHcm9zcywgbGUgc2FtLiAxOCBqdWluIDIwMjIgMTI6NDg6
MTYgKzAyMDAsIGEgZWNyaXQ6DQo+Pj4+IEBAIC0xMjQsNyArMTI2LDcgQEAgdm9pZCBhcmNo
X21tX3ByZWluaXQodm9pZCAqcCkNCj4+Pj4gICAgICAgICAgICBkb19leGl0KCk7DQo+Pj4+
ICAgICAgICB9DQo+Pj4+IC0gICAgbGFzdF9mcmVlX3BmbiA9IGU4MjBfZ2V0X21heHBmbihy
ZXQpOw0KPj4+PiArICAgIGxhc3RfZnJlZV9wZm4gPSBlODIwX2dldF9tYXhwZm4ocmV0IC0g
ZTgyMF9pbml0aWFsX3Jlc2VydmVkX3BmbnMpOw0KPj4+DQo+Pj4gTW1tLCBidXQgdGhlIHJl
c2VydmVkIHBmbiBjb3VsZCBiZSBpbiB0aGUgbWlkZGxlIG9mIHRoZSBlODIwIGFkZHJlc3MN
Cj4+PiBzcGFjZS4NCj4+DQo+PiBUaGF0IGRvZXNuJ3QgbWF0dGVyLg0KPj4NCj4+IGU4MjBf
Z2V0X21heHBmbihuKSB3aWxsIGp1c3QgcmV0dXJuIHRoZSBwZm4gb2YgdGhlIG4tdGggUkFN
IHBmbiBpdCBpcw0KPj4gZmluZGluZyBpbiB0aGUgRTgyMCBtYXAuDQo+IA0KPiBZZXMsIGJ1
dCBzdWJ0cmFjdGluZyBhdCB0aGlzIHBvaW50IGxvb2tzIGEgYml0IGhhY2t5IHRvIG1lLg0K
PiANCj4gSXQgc2VlbXMgdG8gbWUgdGhhdCBpdCdkIGJlIGJldHRlciB0byBtYWtlIGU4MjBf
Z2V0X21heHBmbiBjb3VudCBieQ0KPiBpdHNlbGYgdGhlIHJlc2VydmVkIHBhZ2VzIChidXQg
bmV2ZXIgcmV0dXJuIGl0cyBwZm4gb2YgY291cnNlKSwgcmF0aGVyDQo+IHRoYW4gaGF2aW5n
IHRvIG1ha2UgZTgyMF9zYW5pdGl6ZSBsb29rIGF0IHRoZSByZXNlcnZlZCBwYWdlcywgc3Rv
cmUNCj4gaXQgc29tZXdoZXJlLCBhbmQgaG9wZSB0aGF0IG90aGVyIGNvZGUgd2lsbCByZW1l
bWJlciB0byBzdWJ0cmFjdCB0aGF0DQo+IGJlZm9yZSBjYWxsaW5nIGU4MjBfZ2V0X21heHBm
bi4NCj4gDQo+IEkgbWVhbiBzb21ldGhpbmcgbGlrZToNCj4gDQo+IHVuc2lnbmVkIGxvbmcg
ZTgyMF9nZXRfbWF4cGZuKHVuc2lnbmVkIGxvbmcgcGFnZXMpDQo+IHsNCj4gICAgICBpbnQg
aTsNCj4gICAgICB1bnNpZ25lZCBsb25nIHBmbnMgPSAwLCBzdGFydCA9IDA7DQo+IA0KPiAg
ICAgIGlmICggIWU4MjBfZW50cmllcyApDQo+ICAgICAgICAgIGU4MjBfZ2V0X21lbW1hcCgp
Ow0KPiANCj4gICAgICBmb3IgKCBpID0gMDsgaSA8IGU4MjBfZW50cmllczsgaSsrICkNCj4g
ICAgICB7DQo+ICAgICAgICAgIHBmbnMgPSBlODIwX21hcFtpXS5zaXplID4+IFBBR0VfU0hJ
RlQ7DQo+IA0KPiAJaWYgKCBlODIwX21hcFtpXS50eXBlID09IEU4MjBfUkVTRVJWRUQgKQ0K
PiAJew0KPiAJICAgIC8qIFRoaXMgY291bnRzIGluIHRoZSBtZW1vcnkgcmVzZXJ2YXRpb24s
IGJ1dCBpcyBub3QgdXNhYmxlICovDQo+ICAgICAgICAgICAgICBwYWdlcyAtPSBwZm5zOw0K
PiAJICAgIGNvbnRpbnVlOw0KPiAJfQ0KPiAgICAgICAgICBpZiAoIGU4MjBfbWFwW2ldLnR5
cGUgIT0gRTgyMF9SQU0gKQ0KPiAgICAgICAgICAgICAgY29udGludWU7DQo+IA0KPiAgICAg
ICAgICBzdGFydCA9IGU4MjBfbWFwW2ldLmFkZHIgPj4gUEFHRV9TSElGVDsNCj4gICAgICAg
ICAgaWYgKCBwYWdlcyA8PSBwZm5zICkNCj4gICAgICAgICAgICAgIHJldHVybiBzdGFydCAr
IHBhZ2VzOw0KPiAgICAgICAgICBwYWdlcyAtPSBwZm5zOw0KPiAgICAgIH0NCj4gDQo+ICAg
ICAgcmV0dXJuIHN0YXJ0ICsgcGZuczsNCj4gfQ0KDQpUaGlzIHdvdWxkIGxlYWQgdG8gd3Jv
bmcgdmFsdWVzIG9mIG5yX21lbV9wYWdlcy4gSSB0aGluayB0aGUgYmVzdCBzb2x1dGlvbg0K
d291bGQgYmUgdG8gaGF2ZSBmdW5jdGlvbnMgcmV0dXJuaW5nIHRoZSBudW1iZXIgb2YgYXZh
aWxhYmxlIGFuZCBtYXggUkFNDQpwYWdlcyB0byBlODIwLmMuIFRoaXMgd291bGQgYWRkcmVz
cyB5b3VyIHZhbGlkIGNvbmNlcm4sIHdoaWxlIG5vdCBsZWFkaW5nDQp0byB3cm9uZyB2YWx1
ZXMgYXQgdGhlIGNhbGxlcnMgc2lkZS4NCg0KDQpKdWVyZ2VuDQo=
--------------2GZMiMbs0NqV6DqwP8JmwmsF
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

--------------2GZMiMbs0NqV6DqwP8JmwmsF--

--------------s0gT5wMZ48gjfVaL77yMyCbE--

--------------5CgqcIrOffQ7QwdM0BKvXb4p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKuuXkFAwAAAAAACgkQsN6d1ii/Ey+J
QAgAn3f11VEGbKSa2SRSCF/1x2iiXgwNnUvcFA1z7a1JG6vCKdmWNoHGgHyORIsEpNsiruAsViRw
W/jLjS7+u3oC5pe/VsF8E4S19+OgGFjztzwaB6TgDp+hDyMv7VGrr05phmL3TI8Pt/xWXdQQIEWI
QEbbOnHWr0IAplWPxBJvTFmxUU9ww3N674k0vFxgtaPg+41ZDSrCfUZ9UM6CeNYRyD903JsM0tMw
LM5I5jNc49v+w5ZsBgecMb9SbqUxa46pqs17CGaMRuEiAWkPN6ZggBJgxZ7vQ2RPUvG6rC0bouxi
RjPAEc0l+sGi6eREfJaZBVA3Dn7kRBkMlrqrKuABeQ==
=7Qeu
-----END PGP SIGNATURE-----

--------------5CgqcIrOffQ7QwdM0BKvXb4p--

