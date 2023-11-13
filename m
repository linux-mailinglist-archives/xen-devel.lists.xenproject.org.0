Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877147E987F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 10:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631410.984689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2SrF-00048Y-Pw; Mon, 13 Nov 2023 09:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631410.984689; Mon, 13 Nov 2023 09:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2SrF-00046Q-NH; Mon, 13 Nov 2023 09:03:49 +0000
Received: by outflank-mailman (input) for mailman id 631410;
 Mon, 13 Nov 2023 09:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2SrE-00046E-Ey
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 09:03:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bc648eb-8203-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 10:03:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 21BDA218FA;
 Mon, 13 Nov 2023 09:03:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3D1413398;
 Mon, 13 Nov 2023 09:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 90BHNm/mUWV7AgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 09:03:43 +0000
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
X-Inumbo-ID: 8bc648eb-8203-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699866224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RJZwJou12wLHOso9sTPGjR11fHsKl9PbnRblYXsy6V0=;
	b=X7xzONUDy1Cm3xGpIjE+STAKmvLfgHqIVtTt9TB1ex4D0mmC/z4XyuR3fWp2Hn59r4QlBU
	zB6l8fbcTHpi38HTqjg96DEWFzNW2yby2MeiS9FhQK/unkalkuLI1OifRYmaoCUnd6hsWF
	H5CS06euADt/ph/MOXJ05RU9zZkLXCQ=
Message-ID: <5896f355-256d-4501-bee1-b6ba1013c24c@suse.com>
Date: Mon, 13 Nov 2023 10:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/29] tools/xenstored: get own domid in stubdom case
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-23-jgross@suse.com>
 <430273e6-529b-4cb2-8998-97dc73e72f1b@xen.org>
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
In-Reply-To: <430273e6-529b-4cb2-8998-97dc73e72f1b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0XU1XBtMN7t2obOqx0f0aeBC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0XU1XBtMN7t2obOqx0f0aeBC
Content-Type: multipart/mixed; boundary="------------t9Eyx2A0v6Fw9WTdikLaEWTd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <5896f355-256d-4501-bee1-b6ba1013c24c@suse.com>
Subject: Re: [PATCH v2 22/29] tools/xenstored: get own domid in stubdom case
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-23-jgross@suse.com>
 <430273e6-529b-4cb2-8998-97dc73e72f1b@xen.org>
In-Reply-To: <430273e6-529b-4cb2-8998-97dc73e72f1b@xen.org>

--------------t9Eyx2A0v6Fw9WTdikLaEWTd
Content-Type: multipart/mixed; boundary="------------mvqtD97JXqOr0JVB4R7hfNkJ"

--------------mvqtD97JXqOr0JVB4R7hfNkJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjMgMTg6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzExLzIwMjMgMTY6MDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
YnRhaW4gdGhlIG93biBkb21pZCBmcm9tIHRoZSBYZW5zdG9yZSBzcGVjaWFsIGdyYW50IGVu
dHJ5IHdoZW4gcnVubmluZw0KPj4gYXMgc3R1YmRvbS4NCj4gVGhlIGNvbW1pdCBtZXNzYWdl
IHNheXMgd2Ugd291bGQgdXNlIHRoZSBncmFudCBlbnRyeSBidXQgLi4uDQoNClNvcnJ5LCBu
b3cgZml4ZWQuDQoNCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+IC0gcmVwbGFjZW1lbnQgb2Yg
VjEgcGF0Y2ggKEFOZHJldyBDb29wZXIpDQo+PiAtLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3Jl
ZC9jb3JlLmPCoMKgIHwgMSArDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvY29yZS5owqDCoCB8
IDEgKw0KPj4gwqAgdG9vbHMveGVuc3RvcmVkL21pbmlvcy5jIHwgNSArKysrKw0KPj4gwqAg
MyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMveGVuc3RvcmVkL2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+IGlu
ZGV4IDBjMTQ4MjNmYjAuLjhlMjcxZTMxZjkgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5z
dG9yZWQvY29yZS5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+PiBAQCAt
MjczOCw2ICsyNzM4LDcgQEAgc3RhdGljIHN0cnVjdCBvcHRpb24gb3B0aW9uc1tdID0gew0K
Pj4gwqAgaW50IGRvbTBfZG9taWQgPSAwOw0KPj4gwqAgaW50IGRvbTBfZXZlbnQgPSAwOw0K
Pj4gwqAgaW50IHByaXZfZG9taWQgPSAwOw0KPj4gK2ludCBzdHViX2RvbWlkID0gLTE7DQo+
PiDCoCBzdGF0aWMgdW5zaWduZWQgaW50IGdldF9vcHR2YWxfdWludChjb25zdCBjaGFyICph
cmcpDQo+PiDCoCB7DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuaCBi
L3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmgNCj4+IGluZGV4IGQwYWM1ODdmOGYuLjNjMjgwMDdk
MTEgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvY29yZS5oDQo+PiArKysgYi90
b29scy94ZW5zdG9yZWQvY29yZS5oDQo+PiBAQCAtMzYxLDYgKzM2MSw3IEBAIGRvIHvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+IMKgIGV4
dGVybiBpbnQgZG9tMF9kb21pZDsNCj4+IMKgIGV4dGVybiBpbnQgZG9tMF9ldmVudDsNCj4+
IMKgIGV4dGVybiBpbnQgcHJpdl9kb21pZDsNCj4+ICtleHRlcm4gaW50IHN0dWJfZG9taWQ7
DQo+PiDCoCBleHRlcm4gYm9vbCBrZWVwX29ycGhhbnM7DQo+PiDCoCBleHRlcm4gdW5zaWdu
ZWQgaW50IHRpbWVvdXRfd2F0Y2hfZXZlbnRfbXNlYzsNCj4+IGRpZmYgLS1naXQgYS90b29s
cy94ZW5zdG9yZWQvbWluaW9zLmMgYi90b29scy94ZW5zdG9yZWQvbWluaW9zLmMNCj4+IGlu
ZGV4IDBjZGVjM2FlNTEuLjIwMmQ3MDM4N2EgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5z
dG9yZWQvbWluaW9zLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9taW5pb3MuYw0KPj4g
QEAgLTE5LDYgKzE5LDggQEANCj4+IMKgICNpbmNsdWRlIDxzeXMvbW1hbi5oPg0KPj4gwqAg
I2luY2x1ZGUgImNvcmUuaCINCj4+IMKgICNpbmNsdWRlIDx4ZW4vZ3JhbnRfdGFibGUuaD4N
Cj4+ICsjaW5jbHVkZSA8bWluaS1vcy9ldmVudHMuaD4NCj4+ICsjaW5jbHVkZSA8bWluaS1v
cy9nbnR0YWIuaD4NCj4+IMKgIHZvaWQgd3JpdGVfcGlkZmlsZShjb25zdCBjaGFyICpwaWRm
aWxlKQ0KPj4gwqAgew0KPj4gQEAgLTU2LDQgKzU4LDcgQEAgdm9pZCB1bm1hcF94ZW5idXMo
dm9pZCAqaW50ZXJmYWNlKQ0KPj4gwqAgdm9pZCBlYXJseV9pbml0KHZvaWQpDQo+PiDCoCB7
DQo+PiArwqDCoMKgIHN0dWJfZG9taWQgPSBldnRjaG5fZ2V0X2RvbWlkKCk7DQo+IA0KPiAu
Li4gdGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBldnRjaG5fKi4gU28gdGhlIGNvbW1pdCBtZXNz
YWdlIGRvZXNuJ3Qgc2VlbSB0byBtYXRjaCANCj4gdGhlIGNvZGUuDQo+IA0KPiBBbHNvLCB5
b3Ugc2VlbSB0byBpbmNsdWRlIG1pbmktb3MvZ250dGFiLmggd2hlbiB5b3UgZG9uJ3QgYWRk
IGFueSBmdW5jdGlvbiB0aGF0IA0KPiBzZWVtcyB0byBiZSByZWxhdGVkLg0KPiANCj4gTGFz
dGx5LCBzaG91bGRuJ3QgdGhpcyBoZWxwZXIgYmUgY2FsbGVkIGdldF9kb21haW5faWQoKSAo
b3Igc2ltaWxhcikgYmVjYXVzZSB0aGUgDQo+IGRvbWlkIGlzIG5vdCBzcGVjaWZpYyB0byB0
aGUgZXZlbnQgY2hhbm5lbCBzdWJzeXN0ZW0/DQoNCkkndmUgbmFtZWQgaXQgZ2V0X2RvbWlk
KCkgbm93Lg0KDQoNCkp1ZXJnZW4NCg==
--------------mvqtD97JXqOr0JVB4R7hfNkJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mvqtD97JXqOr0JVB4R7hfNkJ--

--------------t9Eyx2A0v6Fw9WTdikLaEWTd--

--------------0XU1XBtMN7t2obOqx0f0aeBC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVR5m8FAwAAAAAACgkQsN6d1ii/Ey+0
vwf+ISSQ3Kk9NQvmUwY6gVAOqNt9nZcN05c/+XrWBn2PGXscZY5JMROsd3FOt8wn5t1l4E5Y1N3B
qsMqIVBhr+A6mUsHG5m8fwUgowIYtqjwfNUjyF8Lewffb5nbUSv1mEWTFFtHihVsWNldz8kiwIIA
ComfSNKgYpVvQUBvEJnqkM+n/4ER+fDNzAxryXRfc9Xjt4nI3maVGhxJUJ7WOyFEEHBhC+I96ft/
o9wrj+aT4M5MrXW2cm4/k0MXf6TmASQt5BLrvYFQ6ZCPqhgmeimRd/VR4v04l1ZdsKD9u4rT6cW6
UZKRqlPOQPXesqtWD/aznj46lJntkTRzoFvyGtTaHA==
=y2Ln
-----END PGP SIGNATURE-----

--------------0XU1XBtMN7t2obOqx0f0aeBC--

