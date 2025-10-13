Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D21BD2997
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142203.1476386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8G2x-0000xi-7N; Mon, 13 Oct 2025 10:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142203.1476386; Mon, 13 Oct 2025 10:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8G2x-0000vq-3p; Mon, 13 Oct 2025 10:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1142203;
 Mon, 13 Oct 2025 10:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v8G2v-0000Rh-Pq
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:44:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a610a624-a821-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:44:52 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-63b6dfd85d4so3747031a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 03:44:52 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c129c4sm913508566b.41.2025.10.13.03.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 03:44:49 -0700 (PDT)
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
X-Inumbo-ID: a610a624-a821-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760352292; x=1760957092; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+R/X78jm2Irj2eaN3Go6NwIYBw+jEsyYTK+w1HGhScs=;
        b=XWUq+1E877iobWsdY9RqGDsqc8uQlQdW7c5mlSymwCzJDUbyPlAvU1tR0RgfCA/vNQ
         FgO+sjIeL0dIC/s+83GzpOd/L0wRvQydbP1v5vFftylezm8ZUkKMFdetKG4jZCz/rdLl
         R8Qz4j7lQRITmRXaneRp0hU2+tQaZGYy3CrJVUCz5CtN5ydx4FMvocB5OM4+mTxQIsrA
         SXQg/GgDAfOwM6tzAsdpqRgyp1hvzLSpKQ2r8QUctS16143J0GF2LdbSKTXYpFkNAgah
         BGfRZ3oOY8sSjmg3wbcpCXgS9iA52YaMT68N2XI2stF5E03aV4iRbPK6BPkNJxjZB8Jq
         J+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760352292; x=1760957092;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R/X78jm2Irj2eaN3Go6NwIYBw+jEsyYTK+w1HGhScs=;
        b=wxc+IjxPjRoOKjIV1IItDB69EqcqqfWBus6Qj/0M9MvTFpG4eWXsM3UwNFTUBYCoWH
         uBiDd/K6c69DclAdtugcylu/+TBRvgcY6QPq5ub5/UZoC89GgO5efCALZLhTkZ233w7l
         F5yEu2buLzQf//fr44O1u4VqcJir1uJYlKitYoevHFCJSaAIAac8ouRKuQgo/Zjj41uC
         zVeVHWAm+k0EGogFY2hxO4vP2z9uqDyrRJ7ZRqhqaroeBojkoPmjfawgq0qUgOucsSsP
         fG+4WIPkerOPHvpKLgGOyqRgd6k81tHZlxMTKSl7VZXMraNoZIUnXHheC26i4szDic1I
         FfVA==
X-Forwarded-Encrypted: i=1; AJvYcCUyBvqI/kD05zk38bQwJet5n9PmYaIWUjjoVmqhJ5et32RPGeYcwwAHMbeesuUdFdyBdH+6wXQQfZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn2Kyb10dfGVjUvFkJC7Kixd7AfbfKNY56HwVdiak3E4uCJHtb
	EJCuckEOZWMJd++8X/YXo9AMuZp1YCXXkJb/xff3hMJL/5I3QjJpYbxYR8FZ7gwjVVk=
X-Gm-Gg: ASbGnct6STyBUdXaZvoZq2bn9IFb2CCnl0r9zkLcgvtXeXEq9gi02z20jSXzK7hYeHz
	AGYeB/Rm4Dt6bR9WPKAVeEpsidTNNKlN2pWfee0gHxU4eVx1qqyMp2o+kPfZTOTKwefhkdk6wTK
	GLHc+nG51Wt60F4zLXFXyfIB+wMxm6VH3YXZYw6RH3jdSoXuw0fTGQmt5RR0r7syp+iaXfqYrQa
	GP6cT/vPU51CsLWg4a219Iwu8oH/PNKSS43lsXBT9WIm4RX8k9NTX9MZj/mUtT3ch5IdevutMKS
	8vQCALjJKZTtEBNfHNxV/Owspy4lELW7kpPmugNyniY2ijsJnV+nAWGvF6/W+rEcqPVNvzhhr8U
	YeH0XJJbgllr5mOCTjTpbL7CTal/SLfgu8/tGv7s+LToXc4g0ObV45OLWqepw4XvABXvcIHoqs+
	Hjx63x1Aj4XEau4h3XEc/KXHiniWgRSJKvmGe6nPbP3ecVrFE/uSQnSTWXcoqVS8m3lqJ3UXyDA
	w==
X-Google-Smtp-Source: AGHT+IGl9boHafIzMWS+m4y2BY26uOS33v09kMz/36hXU09JSgcCj7Ok+Mi4qehgfm96eeKyCwzC/w==
X-Received: by 2002:a17:907:94c8:b0:b2d:e514:5348 with SMTP id a640c23a62f3a-b50abaafd5bmr2202165466b.33.1760352289526;
        Mon, 13 Oct 2025 03:44:49 -0700 (PDT)
Message-ID: <c31e2679-2326-4205-b72a-deeb27c19000@suse.com>
Date: Mon, 13 Oct 2025 12:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/28] xen/domctl: wrap vcpu_affinity_domctl() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-18-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-18-Penny.Zheng@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1ozWhP367BguysgfWOwoS4dg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1ozWhP367BguysgfWOwoS4dg
Content-Type: multipart/mixed; boundary="------------IKxh0LSag7VkRYnihYAlSCOP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <c31e2679-2326-4205-b72a-deeb27c19000@suse.com>
Subject: Re: [PATCH v3 17/28] xen/domctl: wrap vcpu_affinity_domctl() with
 CONFIG_MGMT_HYPERCALLS
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-18-Penny.Zheng@amd.com>
In-Reply-To: <20251013101540.3502842-18-Penny.Zheng@amd.com>

--------------IKxh0LSag7VkRYnihYAlSCOP
Content-Type: multipart/mixed; boundary="------------di2clyy8FUHResRLnwky7i9s"

--------------di2clyy8FUHResRLnwky7i9s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjUgMTI6MTUsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiBGdW5jdGlvbiB2Y3B1
X2FmZmluaXR5X2RvbWN0bCgpIGlzIHJlc3BvbnNpYmxlIGZvcg0KPiBYRU5fRE9NQ1RMX3tn
ZXR2Y3B1YWZmaW5pdHksc2V0dmNwdWFmZmluaXR5fSBkb21jdGwtb3AsIGFuZCBzaGFsbCBi
ZQ0KPiB3cmFwcGVkIHdpdGggQ09ORklHX01HTVRfSFlQRVJDQUxMUy4gT3RoZXJ3aXNlIGl0
IHdpbGwgYmVjb21lIHVucmVhY2hhYmxlDQo+IGNvZGVzIHdoZW4gTUdNVF9IWVBFUkNBTExT
PW4sIGFuZCBoZW5jZSB2aW9sYXRpbmcgTWlzcmEgcnVsZSAyLjEuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4gLS0tDQo+IHYx
IC0+IHYyOg0KPiAtIGFkYXB0IHRvIGNoYW5nZXMgb2YgInVuaWZ5IERPTUNUTCB0byBNR01U
X0hZUEVSQ0FMTFMiDQo+IC0gd3JhcCBYRU5fRE9NQ1RMX3tnZXR2Y3B1YWZmaW5pdHksc2V0
dmNwdWFmZmluaXR5fS1jYXNlIHRyYW5zaWVudGx5DQo+IC0tLQ0KPiB2MiAtPiB2MzoNCj4g
LSBhZGFwdCB0byBjaGFuZ2VzIG9mICJyZW1vdmUgdmNwdV9zZXRfc29mdF9hZmZpbml0eSgp
Ig0KPiAtIGFkZHJlc3MgInZpb2xhdGluZyBNaXNyYSBydWxlIDIuMSIgaW4gY29tbWl0IG1l
c3NhZ2UNCj4gLSByZW1vdmUgdHJhbnNpZW50IHdyYXBwaW5nIGFyb3VuZCBYRU5fRE9NQ1RM
X3tnZXR2Y3B1YWZmaW5pdHksc2V0dmNwdWFmZmluaXR5fS1jYXNlDQo+IC0tLQ0KPiAgIHhl
bi9jb21tb24vc2NoZWQvY29yZS5jIHwgMiArKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
YyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+IGluZGV4IDg4MTUwNDMyYzMuLjE4MGRl
Nzg0ZmEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+ICsrKyBi
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+IEBAIC0xNjg4LDYgKzE2ODgsNyBAQCBpbnQg
dmNwdWFmZmluaXR5X3BhcmFtc19pbnZhbGlkKGNvbnN0IHN0cnVjdCB4ZW5fZG9tY3RsX3Zj
cHVhZmZpbml0eSAqdmNwdWFmZikNCj4gICAgICAgICAgICAgICBndWVzdF9oYW5kbGVfaXNf
bnVsbCh2Y3B1YWZmLT5jcHVtYXBfc29mdC5iaXRtYXApKTsNCj4gICB9DQo+ICAgDQo+ICsj
aWZkZWYgQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KDQpJIHN1Z2dlc3QgdG8gbW92ZSB0aGlz
ICNpZmRlZiBhYm92ZSB2Y3B1YWZmaW5pdHlfcGFyYW1zX2ludmFsaWQoKSwgd2hpY2ggaXMN
CnVzZWQgYnkgdmNwdV9hZmZpbml0eV9kb21jdGwoKSBvbmx5Lg0KDQo+ICAgaW50IHZjcHVf
YWZmaW5pdHlfZG9tY3RsKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGNtZCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9kb21jdGxfdmNwdWFmZmluaXR5
ICp2Y3B1YWZmKQ0KPiAgIHsNCj4gQEAgLTE3OTgsNiArMTc5OSw3IEBAIGludCB2Y3B1X2Fm
ZmluaXR5X2RvbWN0bChzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBjbWQsDQo+ICAgDQo+
ICAgICAgIHJldHVybiByZXQ7DQo+ICAgfQ0KPiArI2VuZGlmIC8qIENPTkZJR19NR01UX0hZ
UEVSQ0FMTFMgKi8NCj4gICANCj4gICBib29sIGFsbG9jX2FmZmluaXR5X21hc2tzKHN0cnVj
dCBhZmZpbml0eV9tYXNrcyAqYWZmaW5pdHkpDQo+ICAgew0KDQoNCkp1ZXJnZW4NCg==
--------------di2clyy8FUHResRLnwky7i9s
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------di2clyy8FUHResRLnwky7i9s--

--------------IKxh0LSag7VkRYnihYAlSCOP--

--------------1ozWhP367BguysgfWOwoS4dg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjs2CAFAwAAAAAACgkQsN6d1ii/Ey+L
KAgAk4kb4PJdDinP8hLrEoIyCFrSykeg1fUo7rLffPLVC7Ih6pb9woYLmRph3w8QnLnJUJB7u5kQ
wbNkr5UWz8wAAWbJNH7ClFgQI4q6Ui1597n8fdzENPq5xGXqzZb6NeGuQ9xElehEbltCWTkqI8pg
Xum3Qyg25lXxXm2jIKHrnI0d8smMSB9+VvHl+loTljJT+Zqh0OWHGYK0ymhpjLmCO/Y0pfB2JHtQ
9IHxE7UR6NjBxkLnKcIm3dlG220gAdZCO3FVAiEVKUBz26wlIOR1pWiZO5CgyZzOXO3b0Qc7GjDh
fict3RdDM60S2Gf5fWnpkyKGMFTGzT6mBWJYv/Kxpw==
=oCzH
-----END PGP SIGNATURE-----

--------------1ozWhP367BguysgfWOwoS4dg--

