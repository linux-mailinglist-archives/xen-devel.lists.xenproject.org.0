Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3A77B176
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 08:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583183.913250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVQum-0007B8-Vr; Mon, 14 Aug 2023 06:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583183.913250; Mon, 14 Aug 2023 06:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVQum-00078W-Sm; Mon, 14 Aug 2023 06:18:56 +0000
Received: by outflank-mailman (input) for mailman id 583183;
 Mon, 14 Aug 2023 06:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVQum-00078O-6y
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 06:18:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7112bae4-3a6a-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 08:18:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B470F2197D;
 Mon, 14 Aug 2023 06:18:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A260138E2;
 Mon, 14 Aug 2023 06:18:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TH5aHE3H2WSYHwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 06:18:53 +0000
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
X-Inumbo-ID: 7112bae4-3a6a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691993933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H7cOJe9OPNRO8It0PdLEvFDf762fBVgQKem/aOAA0K4=;
	b=CPD1v5x4GFvV1w6drb4/7dR1epVCIzMQpbXwKcnv/hSfuPm7fIft5wn52ctEtYUWVOLiJJ
	6O/pvT0CgVrIPsTm5otam2DSrkAx9gD8DkPxS+TtZoDNddZza0Bfj5j9aKbm7QVckvL3Hq
	5LneAq8C7+iQvjhOVBinPIE7HOjvo08=
Message-ID: <fee8a01a-72e4-4e74-87f1-637807e8db06@suse.com>
Date: Mon, 14 Aug 2023 08:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] libxl: Make domain build xc_domain_setmaxmem()
 call use max_memkb
Content-Language: en-US
To: Kevin Alarcon Negy <kevin@exostellar.io>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
 <226469c1-c291-3756-88c8-24b51fecc6a2@suse.com>
 <CAGP=kr5U3C4hKmFZ6Odnqs-1EtZ-Lc=4Q3F0Na5j0HOTGYEwXw@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAGP=kr5U3C4hKmFZ6Odnqs-1EtZ-Lc=4Q3F0Na5j0HOTGYEwXw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zDz6O7tiS5N90GgswYal0J0u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zDz6O7tiS5N90GgswYal0J0u
Content-Type: multipart/mixed; boundary="------------AXuxQX9HT0XAANrE0SVMxLbk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Kevin Alarcon Negy <kevin@exostellar.io>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
Message-ID: <fee8a01a-72e4-4e74-87f1-637807e8db06@suse.com>
Subject: Re: [PATCH RESEND] libxl: Make domain build xc_domain_setmaxmem()
 call use max_memkb
References: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
 <226469c1-c291-3756-88c8-24b51fecc6a2@suse.com>
 <CAGP=kr5U3C4hKmFZ6Odnqs-1EtZ-Lc=4Q3F0Na5j0HOTGYEwXw@mail.gmail.com>
In-Reply-To: <CAGP=kr5U3C4hKmFZ6Odnqs-1EtZ-Lc=4Q3F0Na5j0HOTGYEwXw@mail.gmail.com>

--------------AXuxQX9HT0XAANrE0SVMxLbk
Content-Type: multipart/mixed; boundary="------------j8mkDayV8106MWaE0msLl0nJ"

--------------j8mkDayV8106MWaE0msLl0nJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDguMjMgMDQ6MzIsIEtldmluIEFsYXJjb24gTmVneSB3cm90ZToNCj4gQXBvbG9n
aWVzIGlmIEkgbWlzdXNlZCB0aGUgIlJFU0VORCIgc3ViamVjdCBsaW5lLiBUaGUgeGVuIHBh
dGNoIGd1aWRlDQo+IFsxXSBzZWVtZWQgdG8gc3VnZ2VzdCB1c2luZyBpdCBhcyBhIHdheSB0
byBwaW5nLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEkgcmVhbGl6ZSBub3cg
dGhhdCBteSBtaXN1bmRlcnN0YW5kaW5nIGluIGhvdw0KPiB0aGUgb3JpZ2luYWwgY29kZSBz
aG91bGQgd29yayBpcyBiZWNhdXNlIG9mIG15IGNvbmZ1c2lvbiBiZXR3ZWVuDQo+ICJtYXht
ZW0iIHRoZSBjb25maWcgdmFyaWFibGUgdnMuICJ4bCBtZW0tbWF4IiBjb21tYW5kLiBJIHRo
b3VnaHQgdGhhdA0KPiBib3RoIHNob3VsZCBhY3QgZXhhY3RseSB0aGUgc2FtZSB3YXkuIEFz
IGluLCAieGwgbWVtLW1heCIgY2FsbHMNCj4geGNfZG9tYWluX3NldG1heG1lbSgpIGFuZCBh
bHNvIHNldHMgdGhlIHN0YXRpYy1tYXggdmFyaWFibGUgWzJdLiBJDQo+IGtub3cgdGhhdCBt
YXhtZW0gKGNvbmZpZyB2YXJpYWJsZSkgc3RhcnRzIG91dCBhcyBqdXN0IHRoZSBzdGF0aWMt
bWF4DQo+IHZhcmlhYmxlIGFuZCBkb2VzIG5vdCByZXN1bHQgaW4gYW4geGNfZG9tYWluX3Nl
dG1heG1lbShtYXhtZW0pIGNhbGwNCj4gdXBvbiBib290dXAsIGJ1dCBpdCB3YXNuJ3QgY2xl
YXIgdG8gbWUgdGhhdCB0aGlzIHdhcyBpbnRlbmRlZC4gTXkNCj4gcGF0Y2ggd2FzIGludGVu
ZGVkIHRvIG1ha2UgYm90aCB0aGUgY29uZmlnIHZhcmlhYmxlIGFuZCB0aGUgeGwgY29tbWFu
ZA0KPiBhY3QgaW4gdGhlIHNhbWUgd2F5Lg0KPiANCj4gUGVyaGFwcyB0aGlzIGRpc3RpbmN0
aW9uIGlzIGJldHRlciByZXNvbHZlZCB3aXRoIGRpZmZlcmVudCBuYW1pbmc/IEZvcg0KPiBp
bnN0YW5jZSwgaW5zdGVhZCBvZiAibWF4bWVtIiBmb3IgdGhlIGNvbmZpZyB2YXJpYWJsZSwg
Y2FsbCBpdA0KPiAic3RhdGljLW1heCIgdG8gbWF0Y2ggaXRzIGludGVybmFsIG1lYW5pbmc/
DQoNCldoaWxlIHlvdSBhcmUgcmlnaHQgd2l0aCAic3RhdGljLW1heCIgZXhwbGFpbmluZyB0
aGUgc2VtYW50aWNzIGZvcg0Kc29tZW9uZSBmYW1pbGlhciB3aXRoIHRoZSBpbnRlcm5hbHMg
YmV0dGVyLCBJJ20gbm90IHN1cmUgdGhpcyBhcHBsaWVzDQp0byBYZW4gdXNlcnMsIHRvby4N
Cg0KQWRkaXRpb25hbGx5IHdlIHdvdWxkIG5lZWQgdG8gc3VwcG9ydCBib3RoIG5hbWVzIGFm
dGVyIGRvaW5nIHRoZSBzd2l0Y2gsDQphcyB3ZSBkb24ndCB3YW50IHRvIGJyZWFrIGV4aXN0
aW5nIGNvbmZpZyBmaWxlcyB1c2luZyAibWF4bWVtIi4NCg0KU28gY2hhbmdpbmcgdGhlIHBh
cmFtZXRlciBuYW1lIHdvdWxkIG5vdCByZWFsbHkgaGVscCBJTUhPLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------j8mkDayV8106MWaE0msLl0nJ
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

--------------j8mkDayV8106MWaE0msLl0nJ--

--------------AXuxQX9HT0XAANrE0SVMxLbk--

--------------zDz6O7tiS5N90GgswYal0J0u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTZx00FAwAAAAAACgkQsN6d1ii/Ey9h
vgf/VZCObUiumvQa9Na9P+8WFb2lalmdfIAo2Sjqy5CN+xRc8EBfe3wwKNomGInSwJaMoEAeE/fj
fPisHYaGEMsvGrFjlrGuEeqFKV8ZtSfuXvxCjMIcrocJ73xrbTXmqacizFkgeHhSx5AmtR/C9Q4e
Zuqy2kcUEEsaiIfWQHGeCspGK/D1XD7422mhg2+BsW5HfZFnuPmm80Aoj2NQzp7NdYwGrkcf09n7
4oh8Xv9vBWgN+5UJd9CDoeAQ+Q1ymIMBgSrKFrRenYnbHtheKECtlLWgGUL0Izd+fhj7FpkZ56KO
Enkl8JbT5d7gxuLi2s0BjvLl7mhakP3rdXvbCNKiwg==
=FRkA
-----END PGP SIGNATURE-----

--------------zDz6O7tiS5N90GgswYal0J0u--

