Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D75A6CFD2
	for <lists+xen-devel@lfdr.de>; Sun, 23 Mar 2025 15:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925026.1327918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twMlR-0005CZ-ER; Sun, 23 Mar 2025 14:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925026.1327918; Sun, 23 Mar 2025 14:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twMlR-00059t-Be; Sun, 23 Mar 2025 14:57:25 +0000
Received: by outflank-mailman (input) for mailman id 925026;
 Sun, 23 Mar 2025 14:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VYxF=WK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1twMlP-0004jC-RX
 for xen-devel@lists.xenproject.org; Sun, 23 Mar 2025 14:57:23 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df1503f-07f7-11f0-9ffa-bf95429c2676;
 Sun, 23 Mar 2025 15:57:19 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac25520a289so645446766b.3
 for <xen-devel@lists.xenproject.org>; Sun, 23 Mar 2025 07:57:19 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef86e514sm513243666b.35.2025.03.23.07.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Mar 2025 07:57:17 -0700 (PDT)
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
X-Inumbo-ID: 1df1503f-07f7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742741838; x=1743346638; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdH+n5ZsFZ1e9SDqOoXbXvRhwi+aE9DjDljJHnPMIBk=;
        b=b94af7xInozHVY2++xkCRZGK3SN1DKjLDrWNg0U0vFcwY6gEAX0NfCt/YZl2iFCogH
         PBfyNcBgUCobTrRNuE0XwhM0R53JMVN0RMey0DGEo3PHOP750nkFz6tGX1fSt72ypQdz
         9cDuFl/lEYJ8kUfKlQ+tumCLOiEehTVqEeX96QWRMv6PyX4q8rKZVPWhk/z2dqjD4RvI
         I8j7poEtsdrIEtIkEm1vZO9jo9W1IK2yNxFLLzbUBGISETgWoClHhXmRiQR24SBLOXcA
         4SToEUOir2aupgEHud9Zr+EekulDfwkYxu+1u/lw4dPHGchyO3ZWV1YBTgnp1jWaPAsP
         Jo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742741838; x=1743346638;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WdH+n5ZsFZ1e9SDqOoXbXvRhwi+aE9DjDljJHnPMIBk=;
        b=Ol4kWF0Z1DkDHXhP0HIk3fk76egunHFp0ius6H+Qdi9JcEeCDHRAFvOWqZiQxvs5vO
         MRR/0BBCSurLH2UZVJ4GRjJzql9RYFhkWIxR3aZCNTetBnwXozQjYALce5hsipMJu+8I
         qDW0FPFralDaJKiyjKa9YETwSe46jXZiUmqfE56+/F7gIY7+J2VTpON3Ln06q/oYmWXj
         APXyU6ecv7x/p+XMQ9lg0fYPkEnNg0eMWKacmO2TzXA5dZHVWomTGDmVovA+TXOYBTho
         +BwdVqLw1enYXVqodIuXEerB4h6uL9u14CBko8cYrN/jzbeWcTLGx4RIz0O8NSF6xx4X
         3k+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhueh9pM0rdelbf3bxsq7bKQ1nmSh9YxMZgbUuwuuhgVLcgCl1nD38eQNegjur1cgHhJsmHEltyi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEgn5LmG/cyuEJLcaFxGs9HSGOEdoMCMXUdldFY44NIv6wb/Wi
	iwSG4aOUQoifPm8oI4S1BhJhzDXnOh2FSzcnj2qf1wxLw8CKq+9Nk3gXlsRinc4=
X-Gm-Gg: ASbGncsoN7ztxLVjj/eI7yaqj+dFawCYvx/xQxTFZaZY4AIfP004jE3A7Uu39YOi7Gz
	HOHsMYXRTPt3n9KCSdpzQT+k3z/6sZmQ1udgHU59JFGvQcHaEOU4xOwL9Bxkmp5HMEG/LoA8ZCm
	dvjWt+nne0QHQBwA2Xinvyx5ABjHMyVmT6x9ObG8+5hmdlH4G3fL0o/KYOt3Bplabvh8GU+CASp
	+35sDyGNNy51gEGNvt0ge4/b/w+aMfkI1SAdvs6tQ6vuFFT3Zc4+5YkDmuPiCUwySmBOL14umlY
	/wHsaJKtK3Y+HRv44DgJtIJXnmFZOw13UKiKkPFz6luClpg02TbjVnzlNW3FIHXPiWJcZ5kYMAN
	WHvcSJafVkyUgKt6+/kKTruXcbmwyYu1GqYXaGYeVmQ2OpyYlfDHcIl+YsymJ1mJN6NAIjg==
X-Google-Smtp-Source: AGHT+IFfOE0BqQOHwwya9xngkInjobQNlGNE/78WGhVZPMZkiJX8j3THxJkwC3RAZUJja32O3HxEkQ==
X-Received: by 2002:a17:907:2d08:b0:ac2:e748:9f1c with SMTP id a640c23a62f3a-ac3f2267455mr927404566b.33.1742741838381;
        Sun, 23 Mar 2025 07:57:18 -0700 (PDT)
Message-ID: <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
Date: Sun, 23 Mar 2025 15:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com> <Z99PXOXocyuZtf_X@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <Z99PXOXocyuZtf_X@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Q0X04zf4o7oMkpAI85Y62xI6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Q0X04zf4o7oMkpAI85Y62xI6
Content-Type: multipart/mixed; boundary="------------40dumUshyvbmw6vMBLOWyoO3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com> <Z99PXOXocyuZtf_X@begin>
In-Reply-To: <Z99PXOXocyuZtf_X@begin>

--------------40dumUshyvbmw6vMBLOWyoO3
Content-Type: multipart/mixed; boundary="------------dDQE02dV7F0sVrhUNbepYu91"

--------------dDQE02dV7F0sVrhUNbepYu91
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjUgMDE6MDEsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgdmVuLiAyMSBtYXJzIDIwMjUgMTA6MzE6NDQgKzAxMDAsIGEgZWNyaXQ6DQo+
PiBBZGQgYSBmaWxlIG9wZXJhdGlvbnMgZnN0YXQgaG9vayB0byB0aGUgOXBmcyBmcm9udGVu
ZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+PiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQu
Y29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+IC0gb3IgZmlsZSBhY2Nlc3MgbW9kZSBpbnRvIHN0
X21vZGUgKEphc29uIEFuZHJ5dWspDQo+PiAtLS0NCj4+ICAgOXBmcm9udC5jIHwgMjkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvOXBmcm9udC5jIGIvOXBmcm9udC5j
DQo+PiBpbmRleCAxNzQxZDYwMC4uNzI1N2EwN2UgMTAwNjQ0DQo+PiAtLS0gYS85cGZyb250
LmMNCj4+ICsrKyBiLzlwZnJvbnQuYw0KPj4gQEAgLTg1LDYgKzg1LDggQEAgc3RydWN0IGZp
bGVfOXBmcyB7DQo+PiAgIA0KPj4gICAjZGVmaW5lIFA5X1FJRF9TSVpFICAgIDEzDQo+PiAg
IA0KPj4gKyNkZWZpbmUgUUlEX1RZUEVfRElSICAgMHg4MCAgICAgLyogQXBwbGllcyB0byBx
aWRbMF0uICovDQo+PiArDQo+PiAgIHN0cnVjdCBwOV9oZWFkZXIgew0KPj4gICAgICAgdWlu
dDMyX3Qgc2l6ZTsNCj4+ICAgICAgIHVpbnQ4X3QgY21kOw0KPj4gQEAgLTk1MCw2ICs5NTIs
MzIgQEAgc3RhdGljIGludCB3cml0ZV85cGZzKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCB2
b2lkICpidWYsIHNpemVfdCBuYnl0ZXMpDQo+PiAgICAgICByZXR1cm4gcmV0Ow0KPj4gICB9
DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgZnN0YXRfOXBmcyhzdHJ1Y3QgZmlsZSAqZmlsZSwg
c3RydWN0IHN0YXQgKmJ1ZikNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBmaWxlXzlwZnMgKmY5
cGZzID0gZmlsZS0+ZmlsZWRhdGE7DQo+PiArICAgIHN0cnVjdCBwOV9zdGF0IHN0YXQ7DQo+
PiArICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgIHJldCA9IHA5X3N0YXQoZjlwZnMtPmRl
diwgZjlwZnMtPmZpZCwgJnN0YXQpOw0KPj4gKyAgICBpZiAoIHJldCApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIGVycm5vID0gRUlPOw0KPj4gKyAgICAgICAgcmV0dXJuIC0xOw0KPj4g
KyAgICB9DQo+PiArDQo+PiArICAgIGJ1Zi0+c3RfbW9kZSA9IChzdGF0LnFpZFswXSA9PSBR
SURfVFlQRV9ESVIpID8gU19JRkRJUiA6IFNfSUZSRUc7DQo+PiArICAgIGJ1Zi0+c3RfbW9k
ZSB8PSBzdGF0Lm1vZGUgJiAwNzc3Ow0KPj4gKyAgICBidWYtPnN0X2F0aW1lID0gc3RhdC5h
dGltZTsNCj4+ICsgICAgYnVmLT5zdF9tdGltZSA9IHN0YXQubXRpbWU7DQo+IA0KPiBTaG91
bGQgd2UgcGVyaGFwcyBhbHNvIGZpbGwgc3RfY3RpbWU/IExlYXZpbmcgaXQgYXQgMCBjb3Vs
ZCBzdXJwcmlzZQ0KPiBvdGhlciBzb2Z0d2FyZSBsYXllcnMuDQoNCkkgY2FuIHNldCBpdCB0
byB0aGUgc2FtZSB2YWx1ZSBhcyBzdF9tdGltZS4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBh
IHdheQ0KdG8gZ2V0IHRoZSAicmVhbCIgY3RpbWUgdmFsdWUgdmlhIHRoZSA5cCBwcm90b2Nv
bC4NCg0KDQpKdWVyZ2VuDQo=
--------------dDQE02dV7F0sVrhUNbepYu91
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dDQE02dV7F0sVrhUNbepYu91--

--------------40dumUshyvbmw6vMBLOWyoO3--

--------------Q0X04zf4o7oMkpAI85Y62xI6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfgIU0FAwAAAAAACgkQsN6d1ii/Ey9R
fwf/Y1yj6p786U/PIL0zY4D1syNOiZjmKXpGITCping8aoZz9wX8afrGBdF4zwVzoaf9+oejctP+
qA/iu9mgzwUp/sBZkGeterqWeUbADwAPFJN4AW8YJLNruOYGMedWTwThfZGnof0z34hW2H2iwUaG
7/zddhu/2gvB4JOyq73sHd+yt3crAzzsn53f7bObIn4rZnZvDFA/sLzRfOv/fToDNPXAtLr2YOVU
6p3SkDuhceBI5GkmC4frs9EhCHzS2olhMiwu/FLWcB6cS8ezn83YsR8EdCsEaWG5wbf2LCMDboMU
1EDIvBs812MLHx6iZY8pP7yh4hF9D/AahXsJeIGmHg==
=ozOc
-----END PGP SIGNATURE-----

--------------Q0X04zf4o7oMkpAI85Y62xI6--

