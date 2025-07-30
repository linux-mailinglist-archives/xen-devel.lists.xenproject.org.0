Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B175B158DD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 08:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063432.1429156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh09J-0002Be-7k; Wed, 30 Jul 2025 06:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063432.1429156; Wed, 30 Jul 2025 06:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh09J-00029V-4f; Wed, 30 Jul 2025 06:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1063432;
 Wed, 30 Jul 2025 06:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh09H-00029P-Iy
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 06:18:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ba76d28-6d0d-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 08:18:44 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0a0cd709bso120515966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 23:18:44 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af6358600b1sm702646966b.7.2025.07.29.23.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 23:18:43 -0700 (PDT)
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
X-Inumbo-ID: 0ba76d28-6d0d-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753856324; x=1754461124; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0nGaTIXEE3fyg/BvBLcBKQ2YU6qYQW6zpHTeaUL9gWw=;
        b=PDo9MYbf94VVSaJiFF1di5Ewq2Sg/mDdbDbyRKDalOokU7tRT6RKnmgYAQXbAg2zyh
         DBJrMgeaupapn2mBOQBtc6aE8dZX2o/3LtNoO/NxSgK0ShBETJ5jNuDCYi/BDcPlh1gs
         g+lsgm+ow9QZsOi5E+nFPuZMm0Snn7cVeRteiu+biPNXer0SaqeJK1fuZQ1JQ/Wb+hU3
         jRpvrE2mCFsW9ZLzaOSSoJYeoA3uGgdNwD11VOVveGqVJhAzOWs5YWB3ELkDIQAUnOe6
         +N3dhWk/4IyJzRSADHyJpXTMl69ADoqvy+lvvtP/+Q6UDCc56/MYqZqApmUK0CMOqUIn
         dkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856324; x=1754461124;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nGaTIXEE3fyg/BvBLcBKQ2YU6qYQW6zpHTeaUL9gWw=;
        b=H3Uw1p15pLSspWX5k0WxU5Gpf9lX2GrAD6qqFk00dNu2ly/1qnxA5OlM8oAsVyHmDO
         mCWuk1nR/Qnd/ij0MAxliJnVpVaUu0izJ2+JED4nGbhgHwS4o2oUkGoWBcYd35uIW73P
         wlolLUSOngEUrz0IcYVk/CPHgh7FhgqxjfeXgKOBuy7jAyD76+o4znqaoPED/QQi42vp
         UxYkykLr0ddmMABDeJAZXp1QTeuBz+hY/cn4Dk6Dqd7su5YaV0I+7khfkYU8/Zs3m71z
         1mDl3/+BhFt9874aYr+ckIqrk3OSqbDCMZ0fMOfHnynQiS6fZu/gfRGQt8Kg9Xd+9kgr
         O9OA==
X-Forwarded-Encrypted: i=1; AJvYcCWSJZ0Q/BNATVyU+wEwK+M3P5ESzXJt+yEcr3FOybtzqBd3NaHBgrjMgkXbgkcVNMb7ySv8SmmP/lM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMmF/D8EZHEnxpkuKr7SZmQTLyxR6HyR7trOitUxRLI9eTHE2F
	hBHvECiebocCWCNq9zBAvlDdqF8G/vC2tnDKJHPBNvs2cJnh1pLsH9jjAqUy18DlpA0=
X-Gm-Gg: ASbGncscpyECpwO6o/ldiWITWMERGxVQdSofysGwHn8BXgmZFBNNv1csm55zBHE773C
	DLaRgxlzPK5s4NyP3nTLcZ88/YTkDr3L2OtDXBRZk3HRN5Hkq8CCFPdJPRvBVRIQf3oj2nrtecP
	7bkcu6IJ5Gh64IKTsOwc9Z38z5FnYytAKR6L906Vlg4i3R8g89QzpKGJf6hgXFqwW1sHlJSZuRk
	pyzEiohME6s5cteEVZfjrmKTWVSdz2KFKaKGGnzm9+63Qkj8WT1kpkX8dLmm05d+Quf3jYoBgfS
	jyqqJd+n8Ew4cj8pjHSxvr+Y/iqJzKAHbELo3hv/T1vG2EVeAjQiI+HR68sRv6sN6vhV9Mns92a
	1KjMjJ3nAkcZqGxD5vUh6tpr0itD/FLEHBPll96XGHwjeCMgorWlaDjoVE2TJCTkqUpxaixwxnw
	zNP3xQd/pjxpwev/DnrV8lGGOHHd0UkYnKYylfRgvVcf9Sx7Yhcflv
X-Google-Smtp-Source: AGHT+IHQbSFCczgvvU15wuyNkx0VGicuiAq5JpRzIOgWdQCzpw8BIyZTBCOnQouXmHIT2uobfAjXBg==
X-Received: by 2002:a17:907:9691:b0:af8:f896:fe63 with SMTP id a640c23a62f3a-af8fcb5e742mr300168666b.0.1753856324087;
        Tue, 29 Jul 2025 23:18:44 -0700 (PDT)
Message-ID: <17bb1fd7-132b-400b-90ce-7ada6c87c388@suse.com>
Date: Wed, 30 Jul 2025 08:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-2-jgross@suse.com>
 <dfd09f68-1d2a-42b7-ba8f-c1f54c6861ce@citrix.com>
 <d2eb4a63-1bec-497d-911f-cf458533cd6f@citrix.com>
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
In-Reply-To: <d2eb4a63-1bec-497d-911f-cf458533cd6f@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------znHNX6akVd9sgjbfBkKpOvpb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------znHNX6akVd9sgjbfBkKpOvpb
Content-Type: multipart/mixed; boundary="------------uY40HQN2QMtPtMzva0dET0qN";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <17bb1fd7-132b-400b-90ce-7ada6c87c388@suse.com>
Subject: Re: [PATCH v2 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-2-jgross@suse.com>
 <dfd09f68-1d2a-42b7-ba8f-c1f54c6861ce@citrix.com>
 <d2eb4a63-1bec-497d-911f-cf458533cd6f@citrix.com>
In-Reply-To: <d2eb4a63-1bec-497d-911f-cf458533cd6f@citrix.com>

--------------uY40HQN2QMtPtMzva0dET0qN
Content-Type: multipart/mixed; boundary="------------oWxJTVaOzI7jlPV7nE08TZvh"

--------------oWxJTVaOzI7jlPV7nE08TZvh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDcuMjUgMjE6MjUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI5LzA3LzIw
MjUgODoyMSBwbSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDI5LzA3LzIwMjUgMTI6
MDEgcG0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hl
bnN0b3JlZC9sdS5jIGIvdG9vbHMveGVuc3RvcmVkL2x1LmMNCj4+PiBpbmRleCA3N2UwZDM3
N2M1Li5mMmM4YjkyZDA3IDEwMDY0NA0KPj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9sdS5j
DQo+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2x1LmMNCj4+PiBAQCAtMjcsOSArMjcsMTEg
QEAgc3RydWN0IGxpdmVfdXBkYXRlICpsdV9zdGF0dXM7DQo+Pj4gICANCj4+PiAgIHN0cnVj
dCBsdV9kdW1wX3N0YXRlIHsNCj4+PiAgIAl2b2lkICpidWY7DQo+Pj4gKwl1bnNpZ25lZCBp
bnQgYnVmX3NpemU7DQo+Pj4gICAJdW5zaWduZWQgaW50IHNpemU7DQo+Pj4gLQlpbnQgZmQ7
DQo+Pj4gKwl1bnNpZ25lZCBpbnQgb2Zmc2V0Ow0KPj4+ICAgCWNoYXIgKmZpbGVuYW1lOw0K
Pj4+ICsJRklMRSAqZnA7DQo+PiBJIGtub3cgdGhlcmUncyBhbHJlYWR5IG9uZSB1bnNpZ25l
ZCBpbnQgc2l6ZSBoZXJlLCBidXQgbGlmZSBpcyB0b28gc2hvcnQNCj4+IHRvIG5vdCB1c2Ug
c2l6ZV90IGZyb20gdGhlIGdldC1nby4NCj4gDQo+IFRoYXQgc2FpZCwgb2Zmc2V0IHJlYWxs
eSBuZWVkcyB0byBiZSBhbiBvZmZzNjRfdCBpZiB5b3Ugd2FudCAzMmJpdA0KPiBndWVzdHMg
dG8gOVAgc2FmZWx5IG9uIGEgbW9kZXJuIGZpbGVzeXN0ZW0uDQoNCkZvciAzMmJpdCBndWVz
dHMgSSBkb24ndCBzZWUgYSBwcm9ibGVtIGhlcmUsIGFzIHRoaXMgd291bGQgbWVhbiB0aGUg
WGVuc3RvcmUNCnN0YXRlIHdvdWxkIGV4Y2VlZCA0R0IsIHdoaWNoIHNlZW1zIHVubGlrZWx5
IHVzaW5nIGFuIGluLW1lbW9yeSBkYXRhIGJhc2UgaW4NCmEgc3lzdGVtIHN1cHBvcnRpbmcg
bGVzcyB0aGFuIDJHQiBvZiBtZW1vcnkgKHRoZSBNaW5pLU9TIGxpbWl0IGZvciAzMmJpdCBp
cw0KMUdCLCB3aGlsZSBhIDMyYml0IGRhZW1vbiBjYW4gdXNlIG1heC4gMkdCIG9mIHZpcnR1
YWwgbWVtb3J5KS4NCg0KVXNpbmcgdW5zaWduZWQgaW50IGlzIGEgcG90ZW50aWFsIHByb2Js
ZW0gaW4gNjRiaXQgbW9kZSwgdGhvdWdoLiBTbyBzd2l0Y2hpbmcNCnRvIHNpemVfdCBmb3Ig
c2l6ZSBhbmQgb2ZmNjRfdCBmb3Igb2Zmc2V0IHNlZW1zIHNlbnNpYmxlLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------oWxJTVaOzI7jlPV7nE08TZvh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oWxJTVaOzI7jlPV7nE08TZvh--

--------------uY40HQN2QMtPtMzva0dET0qN--

--------------znHNX6akVd9sgjbfBkKpOvpb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiJuUMFAwAAAAAACgkQsN6d1ii/Ey9m
vgf/Sg0nStZHGwVo5GIx9X1YRvaw76SoTR+KkamutreAgBag4hqAJYd2REJ0N/rRtdEZ/A8jiK0x
nrEvJuFad2ib3T3dQfuu4RxDbNM6mak/UCD2Os0BSJdlbIaeYxce7He06Fzc7tgQ3CxXdlD6vs7s
TRc0LYrvnteFIOW7MJR5rviuCZfTFFXqHzk/1bqMe3gk2bDxZ3NF3pWQnAz1IegcI6DDAQb3e9M1
9KzHB94zXd2raebKD7OId1YdN98Pyblr6s8Ci2BTzl9XBtP35TDxquMBi8qWlgKSg7yWh2FY2nne
F3zFFNe71tp5chbdDEQMUyl9e1X/4DGHTvKMUGf5yw==
=1rP6
-----END PGP SIGNATURE-----

--------------znHNX6akVd9sgjbfBkKpOvpb--

