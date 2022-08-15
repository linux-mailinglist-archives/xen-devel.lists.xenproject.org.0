Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728E592E8F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:58:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387359.623559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYjt-0005LO-7W; Mon, 15 Aug 2022 11:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387359.623559; Mon, 15 Aug 2022 11:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYjt-0005Iv-4X; Mon, 15 Aug 2022 11:58:37 +0000
Received: by outflank-mailman (input) for mailman id 387359;
 Mon, 15 Aug 2022 11:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNYjs-0005Ik-5H
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:58:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973375a2-1c91-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 13:58:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DDFF0208FD;
 Mon, 15 Aug 2022 11:58:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BA4F13A99;
 Mon, 15 Aug 2022 11:58:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kNdaJOo0+mKuHgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 11:58:34 +0000
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
X-Inumbo-ID: 973375a2-1c91-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660564714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X5enU23xExb2aBTXP+XxS4PAe3BeaXSgMiJMJ9avGfc=;
	b=XRAbfs/PNrd6l5Z/hg8228yJyCAfqKE5i6EskviJJ7NoxBW5y1Gx/+3Sv4OBXqx9nIlWvl
	lirTD7mhfc8vKu9/p+VM0vMp5rUrHcEWEpTdUE32UO+FDfplWeLz9FbVUy8zxlcri+m0R2
	e1H1Ijy3ZzTpPRSjvLPx5RMUlPkKeW0=
Message-ID: <1e86164f-b08c-a9bd-3437-af569342cc1e@suse.com>
Date: Mon, 15 Aug 2022 13:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] xen/sched: introduce
 cpupool_update_node_affinity()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-2-jgross@suse.com>
 <9abc061b-2d98-ace8-af4b-0881a5737dd6@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <9abc061b-2d98-ace8-af4b-0881a5737dd6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KSbh1xH1VKpW05d3EIKcHuMd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KSbh1xH1VKpW05d3EIKcHuMd
Content-Type: multipart/mixed; boundary="------------qvRTLLJ0T5UzuquoKLu1bPyq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <1e86164f-b08c-a9bd-3437-af569342cc1e@suse.com>
Subject: Re: [PATCH v2 1/3] xen/sched: introduce
 cpupool_update_node_affinity()
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-2-jgross@suse.com>
 <9abc061b-2d98-ace8-af4b-0881a5737dd6@suse.com>
In-Reply-To: <9abc061b-2d98-ace8-af4b-0881a5737dd6@suse.com>

--------------qvRTLLJ0T5UzuquoKLu1bPyq
Content-Type: multipart/mixed; boundary="------------yZwDuoEcKUP8WTEP9mYaGHjq"

--------------yZwDuoEcKUP8WTEP9mYaGHjq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjIgMTM6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wOC4yMDIy
IDEzOjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gRm9yIHVwZGF0aW5nIHRoZSBub2Rl
IGFmZmluaXRpZXMgb2YgYWxsIGRvbWFpbnMgaW4gYSBjcHVwb29sIGFkZCBhIG5ldw0KPj4g
ZnVuY3Rpb24gY3B1cG9vbF91cGRhdGVfbm9kZV9hZmZpbml0eSgpLg0KPj4NCj4+IEluIG9y
ZGVyIHRvIGF2b2lkIG11bHRpcGxlIGFsbG9jYXRpb25zIG9mIGNwdW1hc2tzIGNhcnZlIG91
dCBtZW1vcnkNCj4+IGFsbG9jYXRpb24gYW5kIGZyZWVpbmcgZnJvbSBkb21haW5fdXBkYXRl
X25vZGVfYWZmaW5pdHkoKSBpbnRvIG5ldw0KPj4gaGVscGVycywgd2hpY2ggY2FuIGJlIHVz
ZWQgYnkgY3B1cG9vbF91cGRhdGVfbm9kZV9hZmZpbml0eSgpLg0KPj4NCj4+IE1vZGlmeSBk
b21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoKSB0byB0YWtlIGFuIGFkZGl0aW9uYWwgcGFy
YW1ldGVyDQo+PiBmb3IgcGFzc2luZyB0aGUgYWxsb2NhdGVkIG1lbW9yeSBpbiBhbmQgdG8g
YWxsb2NhdGUgYW5kIGZyZWUgdGhlIG1lbW9yeQ0KPj4gdmlhIHRoZSBuZXcgaGVscGVycyBp
biBjYXNlIE5VTEwgd2FzIHBhc3NlZC4NCj4+DQo+PiBUaGlzIHdpbGwgaGVscCBsYXRlciB0
byBwcmUtYWxsb2NhdGUgdGhlIGNwdW1hc2tzIGluIG9yZGVyIHRvIGF2b2lkDQo+PiBhbGxv
Y2F0aW9ucyBpbiBzdG9wLW1hY2hpbmUgY29udGV4dC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiB3aXRoIHRoZSBvYnNlcnZhdGlv
biB0aGF0IC4uLg0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiAr
KysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4gQEAgLTE4MjQsOSArMTgyNCwyOCBA
QCBpbnQgdmNwdV9hZmZpbml0eV9kb21jdGwoc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3Qg
Y21kLA0KPj4gICAgICAgcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4gICANCj4+IC12b2lkIGRv
bWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gK2Jvb2wg
dXBkYXRlX25vZGVfYWZmX2FsbG9jKHN0cnVjdCBhZmZpbml0eV9tYXNrcyAqYWZmaW5pdHkp
DQo+PiAgIHsNCj4+IC0gICAgY3B1bWFza192YXJfdCBkb21fY3B1bWFzaywgZG9tX2NwdW1h
c2tfc29mdDsNCj4+ICsgICAgaWYgKCAhYWxsb2NfY3B1bWFza192YXIoJmFmZmluaXR5LT5o
YXJkKSApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArICAgIGlmICggIWFsbG9j
X2NwdW1hc2tfdmFyKCZhZmZpbml0eS0+c29mdCkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAg
ICBmcmVlX2NwdW1hc2tfdmFyKGFmZmluaXR5LT5oYXJkKTsNCj4+ICsgICAgICAgIHJldHVy
biBmYWxzZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+ICt9
DQo+PiArDQo+PiArdm9pZCB1cGRhdGVfbm9kZV9hZmZfZnJlZShzdHJ1Y3QgYWZmaW5pdHlf
bWFza3MgKmFmZmluaXR5KQ0KPj4gK3sNCj4+ICsgICAgZnJlZV9jcHVtYXNrX3ZhcihhZmZp
bml0eS0+c29mdCk7DQo+PiArICAgIGZyZWVfY3B1bWFza192YXIoYWZmaW5pdHktPmhhcmQp
Ow0KPj4gK30NCj4+ICsNCj4+ICt2b2lkIGRvbWFpbl91cGRhdGVfbm9kZV9hZmYoc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGFmZmluaXR5X21hc2tzICphZmZpbml0eSkNCj4+ICt7DQo+
PiArICAgIHN0cnVjdCBhZmZpbml0eV9tYXNrcyBtYXNrcyA9IHsgfTsNCj4gDQo+IC4uLiB0
aGUgaW5pdGlhbGl6ZXIgZG9lc24ndCByZWFsbHkgbG9vayB0byBiZSBuZWVkZWQgaGVyZSwg
anVzdCBsaWtlDQo+IHlvdSBkb24ndCBoYXZlIG9uZSBpbiBjcHVwb29sX3VwZGF0ZV9ub2Rl
X2FmZmluaXR5KCkuIFRoZSBvbmUgdGhpbmcNCj4gSSdtIG5vdCBzdXJlIGFib3V0IGlzIHdo
ZXRoZXIgb2xkIGdjYyBtaWdodCBtaXMtcmVwb3J0IGEgcG90ZW50aWFsbHkNCj4gdW5pbml0
aWFsaXplZCB2YXJpYWJsZSB3aXRoIHRoZSBpbml0aWFsaXplciBkcm9wcGVkIC4uLg0KDQpI
bW0sIHllcywgSSB0aGluayB0aGUgaW5pdGlhbGl6ZXIgd2FzIG5lZWRlZCBvbmx5IGluIFYx
Lg0KDQpJIGd1ZXNzIHlvdSBjb3VsZCByZW1vdmUgaXQgd2hpbGUgY29tbWl0dGluZyBpbiBj
YXNlIG5vIHJlc3BpbiBvZiB0aGUNCnNlcmllcyBpcyBuZWVkZWQgb3RoZXJ3aXNlPw0KDQoN
Ckp1ZXJnZW4NCg==
--------------yZwDuoEcKUP8WTEP9mYaGHjq
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

--------------yZwDuoEcKUP8WTEP9mYaGHjq--

--------------qvRTLLJ0T5UzuquoKLu1bPyq--

--------------KSbh1xH1VKpW05d3EIKcHuMd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL6NOoFAwAAAAAACgkQsN6d1ii/Ey/5
VQf/cQnzx2nA2U8I/6+31E8O6+dBqUGjrVEQgljGRPIzEYK9tsqPIIZnDYDbuR0Sx11wmQM6/g0K
Lzw02jRM6bhCDKgrTLtDsQ/Zr3odlQC00OM0uqfVUASU35F+sqtsodkfcIjIRXeaolB2rJ17ZyZ5
5oi7dI32fsWY1KSJORWZIaHguLcn8cO5R3R1oi4TLEarhEkYKXj7gCBBAaGy7/YDUi3QJaiTJXc6
iMqXRgdph/ixqenHGC8AcLwQxeKi88Pby2VwcpO4uaaekrUXHzKjUFcV47C0zFa/h4tIYjt8b2rk
qWQ/a8h19C3fWchpNcoB1r+NFAIb35584kC5kD3W3g==
=4JZU
-----END PGP SIGNATURE-----

--------------KSbh1xH1VKpW05d3EIKcHuMd--

