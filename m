Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5BE7E1B88
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 08:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627784.978644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzuQc-0002uz-D5; Mon, 06 Nov 2023 07:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627784.978644; Mon, 06 Nov 2023 07:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzuQc-0002ss-9d; Mon, 06 Nov 2023 07:53:46 +0000
Received: by outflank-mailman (input) for mailman id 627784;
 Mon, 06 Nov 2023 07:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=czoR=GT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qzuQa-0002sY-Vg
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 07:53:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99b828fb-7c79-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 08:53:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91AD71F38A;
 Mon,  6 Nov 2023 07:53:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DE36138F3;
 Mon,  6 Nov 2023 07:53:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id COJMGYSbSGWjRgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Nov 2023 07:53:40 +0000
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
X-Inumbo-ID: 99b828fb-7c79-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699257220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Uh8n8XMwOJkoeRhtkuPqkM9hRpXQ8HRDlvtenHOGga8=;
	b=Vzf0qbogSr0qMdIcmHKWlJQ/OGGTVHBd1tObki6VxumkLjv1yAPB1KrhteqNUBwNLAEI0m
	9VJfdG45sNZSiY1BQhUqf3EL6jwFMv2Pf2aSTpISv8ZHUloAr24c3nGGf57tyUh/W1AEW6
	mFTBWMzy5bHf7P4QKpWB5E4y9xhFJVA=
Message-ID: <ff9a8e04-8d22-4433-b59d-bfabf514577c@suse.com>
Date: Mon, 6 Nov 2023 08:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/29] tools/xenlogd: add 9pfs walk request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-9-jgross@suse.com>
 <CAKf6xptRA6N8ymdgqPS_c+LjBFgN9NmmJAuJx3+vCV8GGkaw6Q@mail.gmail.com>
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
In-Reply-To: <CAKf6xptRA6N8ymdgqPS_c+LjBFgN9NmmJAuJx3+vCV8GGkaw6Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5rqGZdZRviF2oqOV3eU1luVa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5rqGZdZRviF2oqOV3eU1luVa
Content-Type: multipart/mixed; boundary="------------7Fs02FfKLi8s9Oyh2Gv9WYqX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ff9a8e04-8d22-4433-b59d-bfabf514577c@suse.com>
Subject: Re: [PATCH 08/29] tools/xenlogd: add 9pfs walk request support
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-9-jgross@suse.com>
 <CAKf6xptRA6N8ymdgqPS_c+LjBFgN9NmmJAuJx3+vCV8GGkaw6Q@mail.gmail.com>
In-Reply-To: <CAKf6xptRA6N8ymdgqPS_c+LjBFgN9NmmJAuJx3+vCV8GGkaw6Q@mail.gmail.com>

--------------7Fs02FfKLi8s9Oyh2Gv9WYqX
Content-Type: multipart/mixed; boundary="------------pcB5luPRs0tossLzlklJQPfJ"

--------------pcB5luPRs0tossLzlklJQPfJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMTEuMjMgMjA6NDgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNjowOeKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSB3YWxrIHJlcXVlc3Qgb2YgdGhlIDlwZnMgcHJvdG9j
b2wuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPj4gLS0tDQo+PiAgIHRvb2xzL3hlbmxvZ2QvaW8uYyAgICAgIHwgMTM4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgdG9vbHMveGVubG9n
ZC94ZW5sb2dkLmggfCAgIDEgKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRp
b25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbmxvZ2QvaW8uYyBiL3Rvb2xz
L3hlbmxvZ2QvaW8uYw0KPj4gaW5kZXggZmE4MjVjOWYzOS4uNzc4ZTFkYzJjOSAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL3hlbmxvZ2QvaW8uYw0KPj4gKysrIGIvdG9vbHMveGVubG9nZC9p
by5jDQo+IA0KPj4gQEAgLTYwMCw2ICs2MTYsMTI0IEBAIHN0YXRpYyB2b2lkIHA5X2F0dGFj
aChkZXZpY2UgKmRldmljZSwgc3RydWN0IHA5X2hlYWRlciAqaGRyKQ0KPj4gICAgICAgZmls
bF9idWZmZXIoZGV2aWNlLCBoZHItPmNtZCArIDEsIGhkci0+dGFnLCAiUSIsICZxaWQpOw0K
Pj4gICB9DQo+Pg0KPj4gK3N0YXRpYyB2b2lkIHA5X3dhbGsoZGV2aWNlICpkZXZpY2UsIHN0
cnVjdCBwOV9oZWFkZXIgKmhkcikNCj4+ICt7DQo+PiArICAgIHVpbnQzMl90IGZpZDsNCj4+
ICsgICAgdWludDMyX3QgbmV3ZmlkOw0KPj4gKyAgICBzdHJ1Y3QgcDlfZmlkICpmaWRwOw0K
Pj4gKyAgICBzdHJ1Y3QgcDlfcWlkICpxaWRzID0gTlVMTDsNCj4+ICsgICAgdW5zaWduZWQg
aW50IG5fbmFtZXMgPSAwOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgKm5hbWVzID0gTlVMTDsN
Cj4+ICsgICAgdW5zaWduZWQgaW50IHdhbGtlZCA9IDA7DQo+PiArICAgIHVuc2lnbmVkIGlu
dCBpOw0KPj4gKyAgICBjaGFyICpwYXRoID0gTlVMTDsNCj4+ICsgICAgdW5zaWduZWQgaW50
IHBhdGhfbGVuOw0KPj4gKyAgICBpbnQgcmV0Ow0KPj4gKw0KPj4gKyAgICByZXQgPSBmaWxs
X2RhdGEoZGV2aWNlLCAiVVVhUyIsICZmaWQsICZuZXdmaWQsICZuX25hbWVzLCAmbmFtZXMp
Ow0KPj4gKyAgICBpZiAoIG5fbmFtZXMgPiBQOV9XQUxLX01BWEVMRU0gKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICBwOV9lcnJvcihkZXZpY2UsIGhkci0+dGFnLCBFSU5WQUwpOw0KPj4g
KyAgICAgICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+ICsgICAgaWYgKCByZXQgIT0gMyAr
IG5fbmFtZXMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwOV9lcnJvcihkZXZpY2UsIGhk
ci0+dGFnLCBlcnJubyk7DQo+PiArICAgICAgICBnb3RvIG91dDsNCj4+ICsgICAgfQ0KPj4g
Kw0KPj4gKyAgICBmaWRwID0gZmluZF9maWQoZGV2aWNlLCBmaWQpOw0KPj4gKyAgICBpZiAo
ICFmaWRwICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHIt
PnRhZywgRU5PRU5UKTsNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICB9DQo+PiAr
ICAgIGlmICggZmlkcC0+b3BlbmVkICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcDlfZXJy
b3IoZGV2aWNlLCBoZHItPnRhZywgRUlOVkFMKTsNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0K
Pj4gKyAgICB9DQo+IA0KPiBodHRwczovL2VyaWN2aC5naXRodWIuaW8vOXAtcmZjL3JmYzlw
MjAwMC5odG1sI2FuY2hvcjMzDQo+ICIiIg0KPiBUaGUgZmlkIG11c3QgcmVwcmVzZW50IGEg
ZGlyZWN0b3J5IHVubGVzcyB6ZXJvIHBhdGggbmFtZSBlbGVtZW50cyBhcmUgc3BlY2lmaWVk
Lg0KPiAiIiINCj4gYW5kDQo+ICIiIg0KPiBGb3IgdGhlIGZpcnN0IGVsZW1lbnR3aXNlIHdh
bGsgdG8gc3VjY2VlZCwgdGhlIGZpbGUgaWRlbnRpZmllZCBieSBmaWQNCj4gbXVzdCBiZSBh
IGRpcmVjdG9yeSwgYW5kIHRoZSBpbXBsaWVkIHVzZXIgb2YgdGhlIHJlcXVlc3QgbXVzdCBo
YXZlDQo+IHBlcm1pc3Npb24gdG8gc2VhcmNoIHRoZSBkaXJlY3RvcnkgKHNlZSBpbnRybyg1
KSkuIFN1YnNlcXVlbnQNCj4gZWxlbWVudHdpc2Ugd2Fsa3MgaGF2ZSBlcXVpdmFsZW50IHJl
c3RyaWN0aW9ucyBhcHBsaWVkIHRvIHRoZSBpbXBsaWNpdA0KPiBmaWQgdGhhdCByZXN1bHRz
IGZyb20gdGhlIHByZWNlZGluZyBlbGVtZW50d2lzZSB3YWxrLg0KPiAiIiINCj4gDQo+IE1h
eWJlIGEgZGlyIGNoZWNrIHNob3VsZCBiZSBhZGRlZD8gIEhvd2V2ZXIsIGl0IGRvZXNuJ3Qg
bG9vayBsaWtlIFFFTVUNCj4gZG9lcyB0aGlzIGNoZWNrLiAgU2VlbXMgbGlrZSBpdCBpcyBp
bXBsaWNpdGx5IGNoZWNrZWQgYnkgdGhlIHBhdGgNCj4gY29uY2F0ZW5hdGlvbiwgc28gaXQg
bWF5IGJlIGZpbmUgYXMtaXMuDQo+IA0KPiBJZiB5b3UgdGhpbmsgaXQncyBvayBhcy1pczoN
Cj4gUmV2aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCg0K
VGhhbmtzLg0KDQpJIHRoaW5rIEknbGwgbGVhdmUgaXQgYXMgaXMuDQoNCg0KSnVlcmdlbg0K
DQo=
--------------pcB5luPRs0tossLzlklJQPfJ
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

--------------pcB5luPRs0tossLzlklJQPfJ--

--------------7Fs02FfKLi8s9Oyh2Gv9WYqX--

--------------5rqGZdZRviF2oqOV3eU1luVa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVIm4QFAwAAAAAACgkQsN6d1ii/Ey+E
cgf/TH3zJYuXpk3lDwtoYMixCzm2eoqxl+z+uYVqKLKxSuuPcWbl6aUos6HjeGW+71FkJo4r+eUu
QuzbuWeSIf+ABfTUaS+q9nk5YGWGG3SVJ0F0OodLGMFTAWHcN68LB1olU9YAmzLtL04qjBIiavu4
tjJcqIyM+F/6kTgDLJ37fRbI+HsQ3jS6NHSsSgxDu+ojUzjkOWztUvrUndxJYhmogno3quK2/5vO
Vx/Bupvtb3M1xWofbYy1ZcavwouUYRVF5p8+v+a9Ez98ZaStkW890htnIKJO8DcvYbSh/pc40msu
nLGVape7NYx4YJvrfV9js5hzoP19v7+xMJ1AZjCA1Q==
=dlq+
-----END PGP SIGNATURE-----

--------------5rqGZdZRviF2oqOV3eU1luVa--

