Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C427B4AA30
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116212.1462624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvQk-0006r5-Oc; Tue, 09 Sep 2025 10:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116212.1462624; Tue, 09 Sep 2025 10:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvQk-0006nv-LE; Tue, 09 Sep 2025 10:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1116212;
 Tue, 09 Sep 2025 10:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dp7M=3U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uvvQj-0006mE-8L
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:18:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53cdaf1d-8d66-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:18:28 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so50375725e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 03:18:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b?
 (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de.
 [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45deff57c33sm8146705e9.1.2025.09.09.03.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 03:18:27 -0700 (PDT)
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
X-Inumbo-ID: 53cdaf1d-8d66-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757413107; x=1758017907; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A8grYvfhvATeam8Zhil48UBjlD6r5yngkKE3+P2X+wk=;
        b=KJm5lWEQakAHtjLy5TqAbIWFoN/FopDlBa0hF5CGYsZeInythx9I8+lamVFbUZN8mY
         BSAvQmJziiPqTM/8fUH5c/Sehe671Ein1MIuGG3AKF15iiPrhaEobtvd/7z/J0eT6Dgw
         g8qMbPbp3DCezDvsAmdrTL51HZCLaU0Eg3GewEsNEmJn32YBC5sVEPStxI7DTAIczx75
         sPiCQB8Qh0+3NAZrygCvtSk2+jt7CQiCOueII0y8WobL2uQrAu2GEczphcDJTwk7aST8
         K+OJlegJsIqvQ665tQkc6HfnFmZsKxGHrMSnDxhrOGVpFkD9kXX5FQCyRtdkKamrq4gO
         MLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413107; x=1758017907;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8grYvfhvATeam8Zhil48UBjlD6r5yngkKE3+P2X+wk=;
        b=oaMrQ+BSiCKZ9RkBjOeSwRy5L4BR6gNILC0hK8BEPuA2VbrIQvlXOM1RKvX061FzIu
         3y+cC+kUr9dV5bEXlcsslQWuibkzxGiEPEc4ATuEgEM0DxH93dveImMOBYC3puQnlE5a
         h+OTd7M9JdA9XsfWWNkAxgSgThXgtjkzGo6QsY6OW+Ci50KgAoYNtXU62udp4NWtxNK6
         TMf+ImT9KsEV1OMrPnQg5yIY+a9jqXlvT7cltD9DXi8N6/0f2gVjmCq641XXVPEnptTH
         LX2RXF12kKp56r6z3+Qxwu9tjMhIqoPWX+Bj7J4qz2fnoofeJi/7zETzzTcAKM0ml4cM
         tP9w==
X-Forwarded-Encrypted: i=1; AJvYcCVfu+gxVtN6uHs8OqTS3P0hX07SxDDZa7vEWF9+tfh92sOr9e0u38KvNOZZp1duyJDdpiSO8yRzsZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL8/HU6GPUSYis1EHr0dd8nkc48QvfkU0ueMbAO6bS540hTRPO
	QbKFXOfNFCDlfrg2YLazkLpFjd7YrA4YJ7jZzhmBP8zKd3fPBSrOPahI0mKWDmFGvJc=
X-Gm-Gg: ASbGncs2G1n4dsrqmXo1z6ZZZvb336rHz6Np776KN3MlUA2VbrfE7cQ2I0Ja1TtX1v0
	t0E2Ss5EGt1azsgm5IG0VD1BS1jXga7IPLxspQ6OAF59cCG1M54Vt7DWh3M7AOrXaLslwmAXnxk
	2pLG2ktWtTDxyY4PKQpquvfIdLKL8ITRqzU8Xj9lT0thLxIz3GBTN1YaInpr94nAdSMRdmHgP8G
	AwCmhEhC6DW4xKH86U+KrzO555yHT3GgpM+2k2/GcnRQLxIJfkS6CRfIeR2ByFyKep1+jgtRDix
	Bjq6cpupg4yvBg67f2yqLadbB9dFQtMF/F/cXCqjRM3upzt+MwvhIMbuvp07jw0m7UhrxOa0vh+
	GD1axVDe10n52gqghRQ8bR44lnesLlAJc2dDaSYThrTPmBQjDtZIlJVSxeLKQ49+csZtv7iIYZw
	UnvYL9sgxfYu7qmfiks9k2FFEGVmrfrpdG/ob1gVZDMCJzpWo2bEHwGmY=
X-Google-Smtp-Source: AGHT+IFq9JnfrgPLbXyCwpmmKqs8DOJtKx0TjiU8QMOqT550rjxiM5W2xaCCLNf3pdnlpziCkYGPZw==
X-Received: by 2002:a05:600c:1987:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45ddde8a55cmr122253105e9.8.1757413107494;
        Tue, 09 Sep 2025 03:18:27 -0700 (PDT)
Message-ID: <e5382a07-7044-4999-9232-07dcf677fb97@suse.com>
Date: Tue, 9 Sep 2025 12:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xenconsole: Add connection flag
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250822213946.245307-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250822213946.245307-1-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xudSpYz0pr2eOfa5ScIGtHBP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xudSpYz0pr2eOfa5ScIGtHBP
Content-Type: multipart/mixed; boundary="------------QXETNBHzrXRFC0bEI9FxNu9F";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <e5382a07-7044-4999-9232-07dcf677fb97@suse.com>
Subject: Re: [PATCH v2 0/3] xenconsole: Add connection flag
References: <20250822213946.245307-1-jason.andryuk@amd.com>
In-Reply-To: <20250822213946.245307-1-jason.andryuk@amd.com>

--------------QXETNBHzrXRFC0bEI9FxNu9F
Content-Type: multipart/mixed; boundary="------------WyLpkjOUVjMz0vrcyfIXQGB2"

--------------WyLpkjOUVjMz0vrcyfIXQGB2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDguMjUgMjM6MzksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IEFkZCBhIGNvbm5l
Y3Rpb24gZmxhZyB0byB0aGUgY29uc29sZSBpbnRlcmZhY2UgcGFnZSBzbyBhIGRvbWFpbiBj
YW4gdGVsbA0KPiBpZiBpdCBpcyBjb25uZWN0ZWQgb3Igbm90LiAgVGhpcyBiZWNhbWUgYSBz
ZXJpZXMgaW4gdjIgdG8gYWRkIGZsYWcNCj4gc2V0dGluZyB0byBsaWJ4ZW5ndWVzdC4NCj4g
DQo+IEphc29uIEFuZHJ5dWsgKDMpOg0KPiAgICB4ZW5jb25zb2xlOiBBZGQgY29ubmVjdGlv
biBmbGFnDQo+ICAgIGxpYnMvZ3Vlc3Q6IFNldCBjb25zb2xlIHBhZ2UgdG8gZGlzY29ubmVj
dGVkDQo+ICAgIGxpYnMvZ3Vlc3Q6IFNldCBjb25zb2xlIGFzIGRpc2Nvbm5lY3RlZCBvbiBy
ZXN1bWUNCj4gDQo+ICAgdG9vbHMvY29uc29sZS9kYWVtb24vaW8uYyAgICAgICAgICAgICAg
ICB8ICA0ICsrKw0KPiAgIHRvb2xzL2luY2x1ZGUveGVuZ3Vlc3QuaCAgICAgICAgICAgICAg
ICAgfCAgNCArKysNCj4gICB0b29scy9saWJzL2d1ZXN0L3hnX2RvbV9hcm0uYyAgICAgICAg
ICAgIHwgIDIgKy0NCj4gICB0b29scy9saWJzL2d1ZXN0L3hnX2RvbV9ib290LmMgICAgICAg
ICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgdG9vbHMvbGlicy9ndWVz
dC94Z19kb21feDg2LmMgICAgICAgICAgICB8ICA2ICsrLS0NCj4gICB0b29scy9saWJzL2d1
ZXN0L3hnX3NyX3Jlc3RvcmVfeDg2X2h2bS5jIHwgIDIgKy0NCj4gICB0b29scy9saWJzL2d1
ZXN0L3hnX3NyX3Jlc3RvcmVfeDg2X3B2LmMgIHwgIDEgKw0KPiAgIHhlbi9pbmNsdWRlL3B1
YmxpYy9pby9jb25zb2xlLmggICAgICAgICAgfCAxMyArKysrKysrKysNCj4gICA4IGZpbGVz
IGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KDQpGb3Ig
dGhlIHNlcmllczoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------WyLpkjOUVjMz0vrcyfIXQGB2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------WyLpkjOUVjMz0vrcyfIXQGB2--

--------------QXETNBHzrXRFC0bEI9FxNu9F--

--------------xudSpYz0pr2eOfa5ScIGtHBP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi//vIFAwAAAAAACgkQsN6d1ii/Ey9W
5wf/QPwm7dViKRKa9kxpnmMKrlzdzpF2PBnoQAMF1wVw7jakUQwhVhoxS5KpXyFXCS4vCenTMq2s
1Azv1Of1zHAnixOTgTVy2qxfy++bNryaxj8sI7e9TQyu2fIu1r39lI8W1nlkCfvQg5IqiGF66xm0
h40tIY6bKsEUhhhKXHRxdLh1ivamK4Mis6+omeAxd2RaxfqxgJKSi82cDPPjhhP/azZtkgEgI4AQ
NlYzIsIIP2wuZFppUfCY0nGNYDdtyDuEKstzXYYxMsUDBgFCw/U0mOtTs5v/4i34MRgxqWBqO+aK
b225D2vwrKFidJ7lzfG8nDOTGFQPL6r8b+JAyVA9Xg==
=MdWB
-----END PGP SIGNATURE-----

--------------xudSpYz0pr2eOfa5ScIGtHBP--

