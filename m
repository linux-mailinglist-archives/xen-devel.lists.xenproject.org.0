Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF46C83B26
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 08:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171708.1496712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNnMS-0002kT-8l; Tue, 25 Nov 2025 07:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171708.1496712; Tue, 25 Nov 2025 07:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNnMS-0002hc-5h; Tue, 25 Nov 2025 07:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1171708;
 Tue, 25 Nov 2025 07:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNnMR-0002hW-1m
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 07:21:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5216cea7-c9cf-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 08:21:12 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so947924066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 23:21:12 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-645363b62cesm14063701a12.13.2025.11.24.23.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 23:21:11 -0800 (PST)
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
X-Inumbo-ID: 5216cea7-c9cf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764055271; x=1764660071; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=19G+vzm4z8VGr42iTwcdy1kvT/i3RcVxNvQmZUsluZM=;
        b=El8B7gwfidJyeF85+0/r7Hm2cabQfJTeKKRwB7+7wdqFWfbHwdDwQKEmzVhDom4blZ
         r6fBMYUQfcy6FlJg/h0zvMHIX6KkHDwlxm5hsqZ0gGTRSLu1sJk2L/PpbHHmzKWMC1Sa
         /2YXj1+04vnkxs2GZdXGMl4mMnJa/phzgtj5x83P+ttjRNnwGq9vHB1evB9jftNC1JMu
         3ank1AkngO3nTVkZlUSNEuTpP8X011nJgSHFM+YuX43FiFL3G288cRCfYTfjMDWONjQG
         mDJn5t8G4S6sOlZljRFURU7nDGQC85Onnfu7bFHPTtd9YW87k5d7fY80mHhpRFJ3FnYb
         6z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764055271; x=1764660071;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19G+vzm4z8VGr42iTwcdy1kvT/i3RcVxNvQmZUsluZM=;
        b=QcsmY8JUXNso3ynxSSOcT/hIdpdFM+htGQeDmN1RZBjVnD17zhe2up/eqxH1yaCDnV
         N3uwcImwYgei8eM0etJODVwHGY+5L9StzaOCqhhTKtl1OEVl64tzXsCzTI+KWU6+HMRH
         j2LqxtYtOtcyAvNkREcniDqRp3NjrSLUQ2gdeFlKyMBEK8d/OprXye5pZkodDobxyvLM
         22F3f2IJFyPvo+uumtu1xWIVmADDLCJj6B9BN7ZLrC4x+XIqFw/qsCnUlfsggn+7RN83
         Myh4lcmrS4KrzPQM7m85n5PbzkBENfrObB2nAG2hH682nmdcESnJ+UbybeNGRgz8ZRLj
         Wpeg==
X-Forwarded-Encrypted: i=1; AJvYcCXC/mCKPViSkeygfPoEQ5ihByhsibaOx7vZr4t49U2XmkR7QruZELw0csnfRIgZL0ttTM4DYHFadso=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/SH9oVVtu5k8maAFuV1DVGWl1LgNDz1TN4lJkJACm93FLEtcM
	mkmh06g9nLKo7/gwYOkuLI8eqFdB5motTpdV2ViPzQf8P9ISeVGOY6mFo28gei+bjDU=
X-Gm-Gg: ASbGncshEiQHtBv0a16/BxuIfndn90HDl4EyrZEv2o5rfJzoOPL6vjTp19MmBqHhi3R
	AALpFFfvccWHi75Pzrs9JfSlBFquv29+KQdu37OcuwLo2FxWduwriJ5lOf/9Vv5QPp9P+7wu+Xb
	B5dfpREY8zqQAdWIF0miVtbKlPYmF+cVFN4UFjGtkJLjol12QM4s9tmGN9M45ioMdfCE44Dbs2S
	UpD+sIJxUG4g6mgadbbAtMDidfqfdExhMfIiExlpQ0CuFTnqHrn9G+iCBz0zwEYtupV2wTbyEmQ
	2908RDd59fJn1aIlryrGncSqXhwK1YmBjSY+UIj21sHRUwGuabKvff2ZL6i3Uewl51OZ7pyh4DD
	C0GGncTZQ6olF+3Tu4Ihk8Ld62BPNxA4dXpUgCRpH6TNKsFVcY6Dl4FmLGTNnSJJZPuTNVa8rNy
	rRGP6mLHcHhl86Nn5QvhVhAwwblPnFlYRhVu7S37fLMW9ywwjFQzMTedemlt9XlY3IGw9PgOAN3
	E7tFTsZeAP+Vh8ojtHKwA7h1Zqosf2kebePs+U=
X-Google-Smtp-Source: AGHT+IEgOrElu8cNu1oteObH+4oOJSq/cvme0pH6zzvqQcuhAbIB7vNObwPK2wGqQ4HV25rKk7afDg==
X-Received: by 2002:a17:907:6e9e:b0:b73:6d56:7459 with SMTP id a640c23a62f3a-b7671705640mr1650006066b.38.1764055271546;
        Mon, 24 Nov 2025 23:21:11 -0800 (PST)
Message-ID: <b84ac7d4-e03f-4f91-921d-1ee36ed925e1@suse.com>
Date: Tue, 25 Nov 2025 08:21:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/2] xenstored: Default priv_domid to store_domid
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20251124223533.31613-1-jason.andryuk@amd.com>
 <20251124223533.31613-2-jason.andryuk@amd.com>
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
In-Reply-To: <20251124223533.31613-2-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vYtdXjLFBXJdxq4tbvB7JKhD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vYtdXjLFBXJdxq4tbvB7JKhD
Content-Type: multipart/mixed; boundary="------------USAeVClfDN8aUNZaKaaCFykV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <b84ac7d4-e03f-4f91-921d-1ee36ed925e1@suse.com>
Subject: Re: [XEN][PATCH 1/2] xenstored: Default priv_domid to store_domid
References: <20251124223533.31613-1-jason.andryuk@amd.com>
 <20251124223533.31613-2-jason.andryuk@amd.com>
In-Reply-To: <20251124223533.31613-2-jason.andryuk@amd.com>

--------------USAeVClfDN8aUNZaKaaCFykV
Content-Type: multipart/mixed; boundary="------------08fVWKo2RE2EBLdqYUZAdnQe"

--------------08fVWKo2RE2EBLdqYUZAdnQe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjUgMjM6MzUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIGEgc3lzdGVt
IHdpdGhvdXQgYSBjb250cm9sIGRvbWFpbiwgYSBoYXJkd2FyZXx4ZW5zdG9yZSBkb21haW4N
Cj4gc3RhcnRpbmcgeGVuc3RvcmVkIHNob3dzOg0KPiBjb21tb24vZ3JhbnRfdGFibGUuYzox
MDQxOmQydjAgQ291bGQgbm90IGZpbmQgZG9tYWluIDMyNzU2DQo+IGdudHRhYjogZXJyb3I6
IG1tYXAgZmFpbGVkOiBJbnZhbGlkIGFyZ3VtZW50DQo+IENvdWxkIG5vdCBpbml0aWFsaXpl
IGRvbTMyNzU2DQo+IA0KPiBzZXR1cF9zdHJ1Y3R1cmUoKSBkb2VzIG5vdCBnZXQgY2FsbGVk
IHdpdGhvdXQgcHJpdl9kb21pZC4gIFN1YnNlcXVlbnQNCj4gaW50cm9kdWNlX2RvbWFpbigp
IGNhbGxzIHdpbGwgZmF1bHQgd2hlbiBjYWxsaW5nIGZpcmVfc3BlY2lhbF93YXRjaGVzKCku
DQo+IA0KPiBEZWZhdWx0IHByaXZfZG9taWQgdG8gc3RvcmVfZG9taWQgd2hlbiB0aGVyZSBp
cyBubyBjb250cm9sIGRvbWFpbi4NCj4gDQo+IEZpeGVzOiBlNWIwYTk0MDU1NzEgKCJ0b29s
cy94ZW5zdG9yZWQ6IEF1dG8taW50cm9kdWNlIGRvbWFpbnMiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoNClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCj4gLS0tDQo+IEkgZGlkbid0
IHZlcmlmeSB0aGUgc2VnZmF1bHQgaW4gZmlyZV93YXRjaGVzKCkgaW4gdGhpcyBzaXR1YXRp
b24sIGJ1dCBJDQo+IHNhdyB0aGF0IHByZXZpb3VzbHkgd2hlbiB3b3JraW5nIG9uIHRoaXMu
ICBSZWdhcmRsZXNzIG9mIHRoZSBzcGVjaWZpYw0KPiBlcnJvciwgeGVuc3RvcmVkIHdhcyBu
b3Qgd29ya2luZyBwcm9wZXJseSB3aXRob3V0IHRoaXMgY2hhbmdlLg0KDQpUaGUgc2VnZmF1
bHQgd2FzIHByb2JhYmx5IHJlYWxseSByZWxhdGVkIHRvIHRoZSBtaXNzaW5nIGNhbGwgb2YN
CnNldHVwX3N0cnVjdHVyZSgpIGluIHRoaXMgY2FzZSwgYXMgdGhlIG5vZGVzIGhhc2h0YWJs
ZSB3b3VsZG4ndCBiZQ0KaW5pdGlhbGl6ZWQuIFRoaXMgd2lsbCByZXN1bHQgaW4gYSBOVUxM
IGRlcmVmZXJlbmNlIGFzIHNvb24gYXMgYW55DQp3YXRjaCBpcyB0cmllZCB0byBiZSBmaXJl
ZCB3aGVuIHRoZSBleGlzdGVuY2Ugb2YgdGhlIHJlbGF0ZWQgbm9kZQ0KKEBpbnRyb2R1Y2VE
b21haW4gaW4gdGhpcyBjYXNlKSBpcyBjaGVja2VkLg0KDQoNCkp1ZXJnZW4NCg==
--------------08fVWKo2RE2EBLdqYUZAdnQe
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------08fVWKo2RE2EBLdqYUZAdnQe--

--------------USAeVClfDN8aUNZaKaaCFykV--

--------------vYtdXjLFBXJdxq4tbvB7JKhD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmklWOYFAwAAAAAACgkQsN6d1ii/Ey9k
hAf/SFRpf3tU4JNa+kGnVxhiL67xyJW53rv3OUCz1eX6zZm2YZWu9iuyHPrjmb3GvdKt9DpkJ3cT
dElB5WhmVcBHqRoyGdPnOddByBZE1eAuvbwIf+wRoTOXlw/pePvkiuZ5mWJRlpCpQmOgGNI9FE94
LU9pzGCt6ihrd8bU64cgO3bh1GQ63T7VwuGb+3jW10CjeZLe+lawngqRoFSu4dFYeZ8h8QTh5CFp
nEi/TKmywlDR/fEeel5cdr2g44p1QLOKSZSCZu061u45pchmmd9Zbg+ybHvXwdb6BttVEsWwdDTv
j/GJkn6AsncI84DKhxaE9MTUQaSidXpUVIYlD9Kf+A==
=1+JE
-----END PGP SIGNATURE-----

--------------vYtdXjLFBXJdxq4tbvB7JKhD--

