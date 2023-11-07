Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76737E359D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 08:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628592.980215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0GIz-0003Jt-Vr; Tue, 07 Nov 2023 07:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628592.980215; Tue, 07 Nov 2023 07:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0GIz-0003ID-T8; Tue, 07 Nov 2023 07:15:21 +0000
Received: by outflank-mailman (input) for mailman id 628592;
 Tue, 07 Nov 2023 07:15:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ht7K=GU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r0GIz-0003I7-3r
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 07:15:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 688cb94e-7d3d-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 08:15:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B09F22C82;
 Tue,  7 Nov 2023 07:15:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 070EE132FD;
 Tue,  7 Nov 2023 07:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JPYYAAfkSWXvLQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Nov 2023 07:15:18 +0000
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
X-Inumbo-ID: 688cb94e-7d3d-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699341319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lu4QoJffdI8Wck0IdmEd0/7AWUT6PG52E2F/oqg2UeE=;
	b=bk1VwlpicyKZNQLOnNDbIVdyOrgzQa4ez1XLLFDI8av8n8JPMpmcjczxprdqAk/cm6QSCJ
	skfx+qBphG0HePKqqjpTed35qRIXF9E8OijCJ+pFSdiSDXUO8BnBK02/eWqRWZjM9A7y4z
	Dvg5hF5M6sNusBr7Rg6p6PLMwIwOpyE=
Message-ID: <83621ad0-412d-4d43-9d7d-9380683a6cf8@suse.com>
Date: Tue, 7 Nov 2023 08:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/29] tools/xenlogd: add 9pfs create request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-12-jgross@suse.com>
 <CAKf6xpu1-tQCY-DRtr2A7fo5=koKR4SjdKEw5J3EsUcY-8iO9Q@mail.gmail.com>
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
In-Reply-To: <CAKf6xpu1-tQCY-DRtr2A7fo5=koKR4SjdKEw5J3EsUcY-8iO9Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SYlxQkl5QoF0X29hWkMGoVPV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SYlxQkl5QoF0X29hWkMGoVPV
Content-Type: multipart/mixed; boundary="------------heHP9N18alraz5GydgOjX04P";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <83621ad0-412d-4d43-9d7d-9380683a6cf8@suse.com>
Subject: Re: [PATCH 11/29] tools/xenlogd: add 9pfs create request support
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-12-jgross@suse.com>
 <CAKf6xpu1-tQCY-DRtr2A7fo5=koKR4SjdKEw5J3EsUcY-8iO9Q@mail.gmail.com>
In-Reply-To: <CAKf6xpu1-tQCY-DRtr2A7fo5=koKR4SjdKEw5J3EsUcY-8iO9Q@mail.gmail.com>

--------------heHP9N18alraz5GydgOjX04P
Content-Type: multipart/mixed; boundary="------------BCciAmy21nQTsqrVe5apsHUe"

--------------BCciAmy21nQTsqrVe5apsHUe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjMgMjA6NTMsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNjo0OOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSBjcmVhdGUgcmVxdWVzdCBvZiB0aGUgOXBmcyBwcm90
b2NvbC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQo+PiAtLS0NCj4+ICAgdG9vbHMveGVubG9nZC9pby5jIHwgMTMzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMTMzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVu
bG9nZC9pby5jIGIvdG9vbHMveGVubG9nZC9pby5jDQo+PiBpbmRleCAyNjA3MDk1ZTUxLi4z
NGYxMzdiZTFiIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVubG9nZC9pby5jDQo+PiArKysg
Yi90b29scy94ZW5sb2dkL2lvLmMNCj4+IEBAIC0zMSw2ICszMSw3IEBADQo+PiAgICNkZWZp
bmUgUDlfQ01EX0VSUk9SICAgICAgMTA3DQo+PiAgICNkZWZpbmUgUDlfQ01EX1dBTEsgICAg
ICAgMTEwDQo+PiAgICNkZWZpbmUgUDlfQ01EX09QRU4gICAgICAgMTEyDQo+PiArI2RlZmlu
ZSBQOV9DTURfQ1JFQVRFICAgICAxMTQNCj4+ICAgI2RlZmluZSBQOV9DTURfQ0xVTksgICAg
ICAxMjANCj4+DQo+PiAgIC8qIFA5IHByb3RvY29sIG9wZW4gZmxhZ3MuICovDQo+PiBAQCAt
NDEsNiArNDIsMTIgQEANCj4+ICAgI2RlZmluZSBQOV9PVFJVTkMgICAgICAgIDB4MTAgICAv
KiBvcidlZCBpbiwgdHJ1bmNhdGUgZmlsZSBmaXJzdCAqLw0KPj4gICAjZGVmaW5lIFA5X09S
RU1PVkUgICAgICAgMHg0MCAgIC8qIG9yJ2VkIGluLCByZW1vdmUgZmlsZSBhZnRlciBjbHVu
ayAqLw0KPj4NCj4+ICsvKiBQOSBwcm90b2NvbCBjcmVhdGUgcGVybWlzc2lvbiBtYXNrcy4g
Ki8NCj4+ICsjZGVmaW5lIFA5X0NSRUFURV9QRVJNX0RJUiAgICAgICAgMHg4MDAwMDAwMA0K
Pj4gKyNkZWZpbmUgUDlfQ1JFQVRFX1BFUk1fTk9UU1VQUCAgICAweDAzYjAwMDAwICAgLyog
bGluaywgc3ltbGluaywgLi4uICovDQo+PiArI2RlZmluZSBQOV9DUkVBVEVfUEVSTV9ESVJf
TUFTSyAgIDA3NzcNCj4+ICsjZGVmaW5lIFA5X0NSRUFURV9QRVJNX0ZJTEVfTUFTSyAgMDY2
Ng0KPj4gKw0KPj4gICAjZGVmaW5lIFA5X01JTl9NU0laRSAgICAgIDIwNDgNCj4+ICAgI2Rl
ZmluZSBQOV9WRVJTSU9OICAgICAgICAiOVAyMDAwLnUiDQo+PiAgICNkZWZpbmUgUDlfV0FM
S19NQVhFTEVNICAgMTYNCj4+IEBAIC04NjEsNiArODY4LDEyOCBAQCBzdGF0aWMgdm9pZCBw
OV9vcGVuKGRldmljZSAqZGV2aWNlLCBzdHJ1Y3QgcDlfaGVhZGVyICpoZHIpDQo+PiAgICAg
ICBmaWxsX2J1ZmZlcihkZXZpY2UsIGhkci0+Y21kICsgMSwgaGRyLT50YWcsICJRVSIsICZx
aWQsICZpb3VuaXQpOw0KPj4gICB9DQo+Pg0KPj4gK3N0YXRpYyB2b2lkIHA5X2NyZWF0ZShk
ZXZpY2UgKmRldmljZSwgc3RydWN0IHA5X2hlYWRlciAqaGRyKQ0KPj4gK3sNCj4+ICsgICAg
dWludDMyX3QgZmlkOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgbmFtZV9vZmY7DQo+PiArICAg
IHVpbnQzMl90IHBlcm07DQo+PiArICAgIHVpbnQ4X3QgbW9kZTsNCj4+ICsgICAgdW5zaWdu
ZWQgaW50IGV4dF9vZmY7DQo+PiArICAgIHN0cnVjdCBwOV9maWQgKmZpZHA7DQo+PiArICAg
IHN0cnVjdCBwOV9maWQgKm5ld19maWRwOw0KPj4gKyAgICBjaGFyICpwYXRoOw0KPj4gKyAg
ICBzdHJ1Y3Qgc3RhdCBzdDsNCj4+ICsgICAgc3RydWN0IHA5X3FpZCBxaWQ7DQo+PiArICAg
IHVpbnQzMl90IGlvdW5pdDsNCj4+ICsgICAgaW50IGZsYWdzOw0KPj4gKyAgICBpbnQgcmV0
Ow0KPj4gKw0KPj4gKyAgICByZXQgPSBmaWxsX2RhdGEoZGV2aWNlLCAiVVNVYlMiLCAmZmlk
LCAmbmFtZV9vZmYsICZwZXJtLCAmbW9kZSwgJmV4dF9vZmYpOw0KPj4gKyAgICBpZiAoIHJl
dCAhPSA1ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHIt
PnRhZywgRUlOVkFMKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0K
Pj4gKyAgICBpZiAoICFuYW1lX29rKGRldmljZS0+c3RyICsgbmFtZV9vZmYpICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgRU5PRU5UKTsN
Cj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoIHBl
cm0gJiBQOV9DUkVBVEVfUEVSTV9OT1RTVVBQICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAg
cDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgRUlOVkFMKTsNCj4+ICsgICAgICAgIHJldHVy
bjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBmaWRwID0gZmluZF9maWQoZGV2aWNlLCBm
aWQpOw0KPj4gKyAgICBpZiAoICFmaWRwIHx8IGZpZHAtPm9wZW5lZCApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIHA5X2Vycm9yKGRldmljZSwgaGRyLT50YWcsIEVJTlZBTCk7DQo+PiAr
ICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcGF0aCA9IG1hbGxv
YyhzdHJsZW4oZmlkcC0+cGF0aCkgKyBzdHJsZW4oZGV2aWNlLT5zdHIgKyBuYW1lX29mZikg
KyAyIC0NCj4+ICsgICAgICAgICAgICAgICAgICBzdHJsZW4oZGV2aWNlLT5ob3N0X3BhdGgp
KTsNCj4+ICsgICAgaWYgKCAhcGF0aCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHA5X2Vy
cm9yKGRldmljZSwgaGRyLT50YWcsIEVOT01FTSk7DQo+PiArICAgICAgICByZXR1cm47DQo+
PiArICAgIH0NCj4+ICsgICAgc3ByaW50ZihwYXRoLCAiJXMvJXMiLCBmaWRwLT5wYXRoICsg
c3RybGVuKGRldmljZS0+aG9zdF9wYXRoKSwNCj4+ICsgICAgICAgICAgICBkZXZpY2UtPnN0
ciArIG5hbWVfb2ZmKTsNCj4+ICsgICAgbmV3X2ZpZHAgPSBhbGxvY19maWRfbWVtKGRldmlj
ZSwgZmlkLCBwYXRoKTsNCj4+ICsgICAgZnJlZShwYXRoKTsNCj4+ICsgICAgaWYgKCAhbmV3
X2ZpZHAgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwOV9lcnJvcihkZXZpY2UsIGhkci0+
dGFnLCBFTk9NRU0pOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+
PiArICAgIGlmICggcGVybSAmIFA5X0NSRUFURV9QRVJNX0RJUiApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIGlmICggbW9kZSAhPSBQOV9PUkVBRCApDQo+PiArICAgICAgICB7DQo+PiAr
ICAgICAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgRUlOVkFMKTsNCj4+ICsg
ICAgICAgICAgICBmcmVlKG5ld19maWRwKTsNCj4+ICsgICAgICAgICAgICByZXR1cm47DQo+
PiArICAgICAgICB9DQo+PiArICAgICAgICBpZiAoIG1rZGlyKG5ld19maWRwLT5wYXRoLCBw
ZXJtICYgUDlfQ1JFQVRFX1BFUk1fRElSX01BU0spIDwgMCApDQo+PiArICAgICAgICB7DQo+
PiArICAgICAgICAgICAgcDlfZXJyb3IoZGV2aWNlLCBoZHItPnRhZywgZXJybm8pOw0KPj4g
KyAgICAgICAgICAgIGZyZWUobmV3X2ZpZHApOw0KPj4gKyAgICAgICAgICAgIHJldHVybjsN
Cj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIFhFTl9UQUlMUV9SRU1PVkUoJmRl
dmljZS0+ZmlkcywgZmlkcCwgbGlzdCk7DQo+PiArICAgICAgICBYRU5fVEFJTFFfSU5TRVJU
X0hFQUQoJmRldmljZS0+ZmlkcywgbmV3X2ZpZHAsIGxpc3QpOw0KPj4gKyAgICAgICAgZnJl
ZShmaWRwKTsNCj4+ICsgICAgICAgIGZpZHAgPSBuZXdfZmlkcDsNCj4+ICsNCj4+ICsgICAg
ICAgIGZpZHAtPmRhdGEgPSBvcGVuZGlyKGZpZHAtPnBhdGgpOw0KPj4gKyAgICAgICAgaWYg
KCAhZmlkcC0+ZGF0YSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcDlfZXJy
b3IoZGV2aWNlLCBoZHItPnRhZywgZXJybm8pOw0KPj4gKyAgICAgICAgICAgIHJldHVybjsN
Cj4+ICsgICAgICAgIH0NCj4+ICsgICAgICAgIGZpZHAtPmZkID0gZGlyZmQoZmlkcC0+ZGF0
YSk7DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBm
bGFncyA9IG9wZW5fZmxhZ3NfZnJvbV9tb2RlKG1vZGUpOw0KPj4gKyAgICAgICAgaWYgKCBm
bGFncyA8IDAgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHA5X2Vycm9yKGRl
dmljZSwgaGRyLT50YWcsIEVJTlZBTCk7DQo+PiArICAgICAgICAgICAgZnJlZShuZXdfZmlk
cCk7DQo+PiArICAgICAgICAgICAgcmV0dXJuOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4g
KyAgICAgICAgWEVOX1RBSUxRX1JFTU9WRSgmZGV2aWNlLT5maWRzLCAiIiJmaWRwLCBsaXN0
KTsNCj4+ICsgICAgICAgIFhFTl9UQUlMUV9JTlNFUlRfSEVBRCgmZGV2aWNlLT5maWRzLCBu
ZXdfZmlkcCwgbGlzdCk7DQo+PiArICAgICAgICBmcmVlKGZpZHApOw0KPj4gKyAgICAgICAg
ZmlkcCA9IG5ld19maWRwOw0KPj4gKw0KPj4gKyAgICAgICAgZmlkcC0+ZmQgPSBjcmVhdChm
aWRwLT5wYXRoLCBmbGFncyk7DQo+IA0KPiBodHRwczovL2VyaWN2aC5naXRodWIuaW8vOXAt
cmZjL3JmYzlwMjAwMC5odG1sI2FuY2hvcjI5DQo+ICIiIg0KPiBUaGUgY3JlYXRlIHJlcXVl
c3QgYXNrcyB0aGUgZmlsZSBzZXJ2ZXIgdG8gY3JlYXRlIGEgbmV3IGZpbGUgd2l0aCB0aGUN
Cj4gbmFtZSBzdXBwbGllZCwgaW4gdGhlIGRpcmVjdG9yeSAoZGlyKSByZXByZXNlbnRlZCBi
eSBmaWQsIGFuZCByZXF1aXJlcw0KPiB3cml0ZSBwZXJtaXNzaW9uIGluIHRoZSBkaXJlY3Rv
cnkuIFRoZSBvd25lciBvZiB0aGUgZmlsZSBpcyB0aGUNCj4gaW1wbGllZCB1c2VyIGlkIG9m
IHRoZSByZXF1ZXN0LCB0aGUgZ3JvdXAgb2YgdGhlIGZpbGUgaXMgdGhlIHNhbWUgYXMNCj4g
ZGlyLCBhbmQgdGhlIHBlcm1pc3Npb25zIGFyZSB0aGUgdmFsdWUgb2YNCj4gDQo+IHBlcm0g
JiAofjA2NjYgfCAoZGlyLnBlcm0gJiAwNjY2KSkNCj4gDQo+IGlmIGEgcmVndWxhciBmaWxl
IGlzIGJlaW5nIGNyZWF0ZWQgYW5kDQo+IA0KPiBwZXJtICYgKH4wNzc3IHwgKGRpci5wZXJt
ICYgMDc3NykpDQo+IA0KPiBpZiBhIGRpcmVjdG9yeSBpcyBiZWluZyBjcmVhdGVkLiBUaGlz
IG1lYW5zLCBmb3IgZXhhbXBsZSwgdGhhdCBpZiB0aGUNCj4gY3JlYXRlIGFsbG93cyByZWFk
IHBlcm1pc3Npb24gdG8gb3RoZXJzLCBidXQgdGhlIGNvbnRhaW5pbmcgZGlyZWN0b3J5DQo+
IGRvZXMgbm90LCB0aGVuIHRoZSBjcmVhdGVkIGZpbGUgd2lsbCBub3QgYWxsb3cgb3RoZXJz
IHRvIHJlYWQgdGhlDQo+IGZpbGUuDQo+ICIiIg0KPiANCj4gU28gUDlfQ1JFQVRFX1BFUk1f
RklMRV9NQVNLICh3aGljaCBpcyBvdGhlcndpc2UgdW51c2VkKSBzaG91bGQgYmUNCj4gaW5j
b3Jwb3JhdGVkLiAgQWxzbyB0aGUgbW9kZSBhbmQgdGhlIHBlcm1pc3Npb25zIGFyZSBoYW5k
bGVkDQo+IGluZGVwZW5kZW50bHk6DQo+ICIiIg0KPiBGaW5hbGx5LCB0aGUgbmV3bHkgY3Jl
YXRlZCBmaWxlIGlzIG9wZW5lZCBhY2NvcmRpbmcgdG8gbW9kZSwgYW5kIGZpZA0KPiB3aWxs
IHJlcHJlc2VudCB0aGUgbmV3bHkgb3BlbmVkIGZpbGUuIE1vZGUgaXMgbm90IGNoZWNrZWQg
YWdhaW5zdCB0aGUNCj4gcGVybWlzc2lvbnMgaW4gcGVybS4NCj4gIiIiDQo+IA0KPiBJIHRo
aW5rIGZpZHAtPm1vZGUgc2hvdWxkIGJlIHNldCBpbiBoZXJlIHNvbWV3aGVyZSBiYXNlZCBv
biBtb2RlLiAgQW5kDQo+IGBmbGFnc2AgZm9yIGNyZWF0IHNob3VsZCBiZSBkZXJpdmVkIGZy
b20gdGhlIGluY29taW5nIHBlcm1zLg0KDQpZZXMsIEkgYWdyZWUuDQoNCg0KSnVlcmdlbg0K

--------------BCciAmy21nQTsqrVe5apsHUe
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BCciAmy21nQTsqrVe5apsHUe--

--------------heHP9N18alraz5GydgOjX04P--

--------------SYlxQkl5QoF0X29hWkMGoVPV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVJ5AYFAwAAAAAACgkQsN6d1ii/Ey8O
uwf+KRBAb4NNhHu+C/0nPfwkiAqg5DzMElbBwIu67hUppdL2uJZkvpMV1zjml2uBHCyqTUfT/siy
anzu/ZIfQaLWsN8np6RoxA5jRfICIn7HRFk937gXo56Vjfdq1XCjOOgy4Aeob8P+rCBcXAhcQ7/4
RGYvpn5Xri78o//MDwvSYdn2enrYnU8Rj5ZUurCXFVDxFcv7lUQapFSucb/dpHbuxEwyVBmj+Ix5
6bn1cHcqXx8v/CzqzDbFD4pZS85h59u01E+uOCOp8nkoKHQQG9DsM8krnflVeFZlUPkFIObtAri/
wfuygD4NBb7YNMwuHDWo6TtefpOTknDthoOSqhZPSw==
=Azzs
-----END PGP SIGNATURE-----

--------------SYlxQkl5QoF0X29hWkMGoVPV--

