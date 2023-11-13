Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871217E971C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 08:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631336.984581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RYe-0002km-DJ; Mon, 13 Nov 2023 07:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631336.984581; Mon, 13 Nov 2023 07:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RYe-0002iX-9l; Mon, 13 Nov 2023 07:40:32 +0000
Received: by outflank-mailman (input) for mailman id 631336;
 Mon, 13 Nov 2023 07:40:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2RYd-0002iG-14
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 07:40:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eafb1e6c-81f7-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 08:40:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 46736218F1;
 Mon, 13 Nov 2023 07:40:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1680B13398;
 Mon, 13 Nov 2023 07:40:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v/3kA+rSUWVcWAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 07:40:26 +0000
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
X-Inumbo-ID: eafb1e6c-81f7-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699861226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hxer3f0h6JhLk8Fw3eUEndBiNXXOkg12tP/3IGXiErQ=;
	b=tsjQ5YhCEEtCVSS6LygAvmn1shpYs5KjhWVMHXTpNi/g4S4bYtIhn1BhgofRCyrjMBhzH4
	QEy2r2UXp35KfaehKyUH7QWJpEJWf1NbYR5LPdYaHbVB8je/UYY+ZBuSc2RmSntihx5zT3
	aAEZkKKZFq6GEuBqxdbjaQ/Fkpz1ILU=
Message-ID: <5641db4f-a599-429f-b64b-3bbbcc157af6@suse.com>
Date: Mon, 13 Nov 2023 08:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-US
To: Julien Grall <julien@xen.org>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com>
 <06119077-00e4-4b33-a71e-b6eafd63271e@xen.org>
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
In-Reply-To: <06119077-00e4-4b33-a71e-b6eafd63271e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Xtqcp0Lt5hJrT38ZlQRVBTyo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Xtqcp0Lt5hJrT38ZlQRVBTyo
Content-Type: multipart/mixed; boundary="------------hmsZr5vzWZcb9IxcJyvJQz2F";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <5641db4f-a599-429f-b64b-3bbbcc157af6@suse.com>
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com>
 <06119077-00e4-4b33-a71e-b6eafd63271e@xen.org>
In-Reply-To: <06119077-00e4-4b33-a71e-b6eafd63271e@xen.org>

--------------hmsZr5vzWZcb9IxcJyvJQz2F
Content-Type: multipart/mixed; boundary="------------zEHRFpG99PcYZvYJ6Y0R06yv"

--------------zEHRFpG99PcYZvYJ6Y0R06yv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjMgMTg6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMC8xMS8yMDIzIDExOjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gR2V0IHRoZSBv
d24gZG9taWQgdmlhIGNyZWF0aW9uIG9mIGEgdGVtcG9yYXJ5IGV2ZW50IGNoYW5uZWwuIFRo
ZXJlIGlzDQo+PiBubyAib2ZmaWNpYWwiIHdheSB0byByZWFkIHRoZSBvd24gZG9taWQgaW4g
UFYgZ3Vlc3RzLCBzbyB1c2UgdGhlIGV2ZW50DQo+PiBjaGFubmVsIGludGVyZmFjZSB0byBn
ZXQgaXQ6DQo+Pg0KPj4gLSBhbGxvY2F0ZSBhbiB1bmJvdW5kIGV2ZW50IGNoYW5uZWwgc3Bl
Y2lmeWluZyBET01JRF9TRUxGIGZvciB0aGUNCj4+IMKgwqAgb3RoZXIgZW5kDQo+Pg0KPj4g
LSByZWFkIHRoZSBldmVudCBjaGFubmVsIHN0YXR1cyB3aGljaCB3aWxsIGNvbnRhaW4gdGhl
IG93biBkb21pZCBpbg0KPj4gwqDCoCB1bmJvdW5kLmRvbQ0KPj4NCj4+IC0gY2xvc2UgdGhl
IGV2ZW50IGNoYW5uZWwNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20NCj4+IC0tLQ0KPj4gVjI6DQo+PiAtIG5ldyBwYXRjaA0KPj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+
PiDCoCBldmVudHMuY8KgwqDCoMKgwqDCoMKgwqAgfCAzMiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gwqAgaW5jbHVkZS9ldmVudHMuaCB8wqAgMiArKw0KPj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2V2ZW50cy5jIGIvZXZlbnRzLmMNCj4+IGluZGV4IGNkYWU5MGY0Li5hZjlmOWY5ZSAxMDA2
NDQNCj4+IC0tLSBhL2V2ZW50cy5jDQo+PiArKysgYi9ldmVudHMuYw0KPj4gQEAgLTI2MSw2
ICsyNjEsMzggQEAgaW50IGV2dGNobl9nZXRfcGVlcmNvbnRleHQoZXZ0Y2huX3BvcnRfdCBs
b2NhbF9wb3J0LCBjaGFyIA0KPj4gKmN0eCwgaW50IHNpemUpDQo+PiDCoMKgwqDCoMKgIHJl
dHVybiByYzsNCj4+IMKgIH0NCj4+ICtkb21pZF90IGV2dGNobl9nZXRfZG9taWQodm9pZCkN
Cj4gSSB0aGluayB0aGUgZnVuY3Rpb24gbmFtZSBzaG91bGQgYmUgZ2VuZXJpYyBzbyB0aGUg
Y2FsbGVyIGRvZXNuJ3QgbmVlZCB0byBiZSANCj4gbW9kaWZpZWQgZXZlcnl0aW1lIHRoZSBp
bXBsZW1lbnRhdGlvbiBpcyB1cGRhdGVkLg0KPiANCj4gSG93IGFib3V0IGdldF9kb21pZCgp
Pw0KDQpGaW5lIHdpdGggbWUuIEFuZCBJIHRoaW5rIGl0IHNob3VsZCBoYXZlIGEgcHJvdG90
eXBlIGluIGluY2x1ZGUvbGliLmgNCg0KDQpKdWVyZ2VuDQoNCg==
--------------zEHRFpG99PcYZvYJ6Y0R06yv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zEHRFpG99PcYZvYJ6Y0R06yv--

--------------hmsZr5vzWZcb9IxcJyvJQz2F--

--------------Xtqcp0Lt5hJrT38ZlQRVBTyo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVR0ukFAwAAAAAACgkQsN6d1ii/Ey+F
OQgAmtPGc1PZvrFSCCMlFHqk8mf7HKIZJpbSJzhml1wjDwOKwd+Gu7p/cHCXSQ2uq8RWNo3pPCsg
jrzVkgtc25Y+m7Rsbz2I9T9DfxENXG5wl20xeaqaDTInKvkYkL0LsXVrOA4+pl4xkl5VNeK7O72Z
clEy5kO+Dvm8L42K37vHwQP+8MpVLKnUMtk0lukoi/zpdHySoK3Pf8exZaDq5olFXkS1kT2PGcXV
KRgAmQNYQk75R9xEQIjtdmzNAut809R+P8eKdb0PGl7PLOQAMkWpvq0iSdZVlYePEpoMElXpGMfd
zUcUPeGi6M5NVp5VfmRxNAO6kkqJ88OVn36PsOIw8w==
=7wT/
-----END PGP SIGNATURE-----

--------------Xtqcp0Lt5hJrT38ZlQRVBTyo--

