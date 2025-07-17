Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5AB08C9E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046751.1417182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNUO-0007Uf-0U; Thu, 17 Jul 2025 12:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046751.1417182; Thu, 17 Jul 2025 12:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNUN-0007SL-T9; Thu, 17 Jul 2025 12:13:27 +0000
Received: by outflank-mailman (input) for mailman id 1046751;
 Thu, 17 Jul 2025 12:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucNUM-0007Pz-1q
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 12:13:26 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fc72947-6307-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 14:13:24 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so169821466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 05:13:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c97335e2sm10220071a12.41.2025.07.17.05.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 05:13:22 -0700 (PDT)
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
X-Inumbo-ID: 6fc72947-6307-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752754403; x=1753359203; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yaYlcdjFM1fTzBzgR9diqI0Y/ao6VYYEtJIh8SjbfhU=;
        b=O9bzuWYklFP+HEIx7qY1M54UEH2gLBDCOTF2Yw/1aMZtpNDp0cLdpcWyA7PEyvtWNw
         +ZWRn0Ie0TB21htIhaT1jSZEMxgiOM3zFGG9xfkJP8LyY3jZHX7RDTsa1kybJ2JqPUIk
         /HBZZnKd2xRRXIa1Pm9k0bXUyKmHp+bVNwn8374an494b6bRo3A8C1zDWJeJuT7WUFG6
         YERUQ5eijDgOVE5VUX91e3qRpl8x3JW4JWSiNZHqLG2Z1Di5jq0UVF2vnWTfIgmkujA/
         C+ahFKxRapVxeeuUYoYal4l5GolY6yHG6k2ssK2YztrpoS09/Ugf0VYfkcHpM9OhrWpD
         dvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752754403; x=1753359203;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yaYlcdjFM1fTzBzgR9diqI0Y/ao6VYYEtJIh8SjbfhU=;
        b=Y/SXU2d0lYXmGA0VfMPjm1cQ0WHiWO+Md0wsi9zUFXjh8FHwpWqqQM4FTC8JtuX7pj
         r9uvuJY3rNIErzBeYIPYlJ1fsSnQCQN6CTNo2DFgzU5isoFQDdOPE5Pcfel4cAUznShP
         6cBUqmTcsD2RlnJ39IYUg2zDOMRZtWx8CBKHi9Yalit1XLp2Xf7eCZUqOpPojYj41Hce
         IJ3wOK7mjf2zKGnmYqldf6U5Mbe5hgbwP7RsnmUjcrzN4WM51VYzsxFRIqqPjw3EOAs1
         emmo2+u+u/XjyJtIhlo3gRRm30Nj0dR5mDYCsgHjo7QlEdgo9L43nnrEeYd20aHzCAW4
         /CRw==
X-Gm-Message-State: AOJu0YzT9YAX6JjTYvNaKMOd3Gts2dNaTSgXI/xFDKhyofJKQQJpkGJt
	WIIxojrxkDhpJNXarQAY0EO/2jf5VIycab7mqJ7r4LnqqTq5CqZ0x2JG2iIJI6eYXeA=
X-Gm-Gg: ASbGncuJnae93IzFX64xHlMIsgRLOOJ0C4ogMsSd8VmSe+vy4N2OmmgkpFZJKJxc7ko
	ezZhA5RvxayfLk7QSIfM/fdvszXbni1Yrnx6fUtL4FXSSdeeePweEyh8Q9cE4twqFHAxA8OEygT
	W4smeC7F5WxCFuwHCpIMGgPku+exnO7e/X46aR3HVIMKWYOiI3ig4PMDve51mBfZ1zP16JNyrYh
	1QzPBFg6hMlgxItPa9nur4xG56ZeUxLmG3tXtWO253pPDvfQAO5kF5wCmiWOynwY7GdfSlcH8qL
	tHPkJY9XpAO7p5iGIbvJ3ElzmHJmVZkwx6BIvNyBIXtSuQIe0tfMkmyfGUn6DGCMrdXiP8JYz1+
	TBPBtNPIOGPQ/NKcOi6zyPlh//T+DtgLcnn5uTwG6FYc9xsDuSMBJRZX/XMDmla9/TR3c4kTZtx
	NuKC4DimK/5XZaKlC6tpYDGBhT2k3M3IS3OSKcziX1wnBR
X-Google-Smtp-Source: AGHT+IGzQSSlkYCWEzcH4v5fBI1fajPbQT2T42hHs1UI7ncouitVXVGBc6KAoZ2UVe0WQ5kGVmnhxA==
X-Received: by 2002:a17:907:1c91:b0:ae0:9fdf:25e8 with SMTP id a640c23a62f3a-ae9ce149d12mr634338466b.47.1752754403263;
        Thu, 17 Jul 2025 05:13:23 -0700 (PDT)
Message-ID: <e307cbf1-7827-4f94-b5ea-3824faacb285@suse.com>
Date: Thu, 17 Jul 2025 14:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: initialize kexec_page in kexec()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Minios-devel <minios-devel@lists.xenproject.org>
References: <b96d2109-6c84-495c-8efe-f2fcfa95608d@suse.com>
 <7e9a8486-b60d-4929-bb37-275578a53359@suse.com>
 <8219b634-c6d8-43e4-82f6-b5622fd7afdd@suse.com>
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
In-Reply-To: <8219b634-c6d8-43e4-82f6-b5622fd7afdd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------30BNi0wzQPxtpTIECb10a3nr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------30BNi0wzQPxtpTIECb10a3nr
Content-Type: multipart/mixed; boundary="------------xT3J57SJ12hJn2Ra814w2q0i";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Minios-devel <minios-devel@lists.xenproject.org>
Message-ID: <e307cbf1-7827-4f94-b5ea-3824faacb285@suse.com>
Subject: Re: [PATCH] kexec: initialize kexec_page in kexec()
References: <b96d2109-6c84-495c-8efe-f2fcfa95608d@suse.com>
 <7e9a8486-b60d-4929-bb37-275578a53359@suse.com>
 <8219b634-c6d8-43e4-82f6-b5622fd7afdd@suse.com>
In-Reply-To: <8219b634-c6d8-43e4-82f6-b5622fd7afdd@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------xT3J57SJ12hJn2Ra814w2q0i
Content-Type: multipart/mixed; boundary="------------M1LN3BtLAfQtGkAeteLKVIHH"

--------------M1LN3BtLAfQtGkAeteLKVIHH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjUgMTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wNy4yMDI1
IDEzOjU4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMDcuMjUgMTM6NTMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IEZvciB0aGUgZXJyb3IgcGF0Y2ggdG8gbm90IHNlZSBp
dCB1bmluaXRpYWxpemVkLg0KPj4+DQo+Pj4gRml4ZXM6IDU2MGMyYTU1ODRjNCAoIm1pbmkt
b3M6IGtleGVjOiBkbyB0aGUgZmluYWwga2V4ZWMgc3RlcCIpDQo+Pj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4NCj4+IFJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBUaGFua3MuDQo+IA0K
PiBUaGUgcmV2ZXJ0IGFjdHVhbGx5IGRpZG4ndCBoZWxwLCB0aGUgcHJvYmxlbSB3YXMgYWxy
ZWFkeSBpbnRyb2R1Y2VkIGVhcmxpZXIuDQo+IEkgbm93IGRvbid0IHVuZGVyc3RhbmQgaG93
IHRoaW5ncyBidWlsdCBwcmV2aW91c2x5LiBJJ2xsIHJlLWFwcGx5IHRoZSBwYXRjaA0KPiBi
dW1waW5nIHRoZSBuZXcgcmV2aXNpb24gdG8gdGhpcyBhYm91dC10by1iZS1jb21taXR0ZWQg
Zml4Lg0KDQpJdCB3b3JrZWQgYmVmb3JlIGJlY2F1c2UgdGhlIHBhdGNoIGVuYWJsaW5nIENP
TkZJR19LRVhFQyBmb3IgdGhlIHN0dWJkb20gd2Fzbid0DQp0aGVyZS4NCg0KDQpKdWVyZ2Vu
DQo=
--------------M1LN3BtLAfQtGkAeteLKVIHH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------M1LN3BtLAfQtGkAeteLKVIHH--

--------------xT3J57SJ12hJn2Ra814w2q0i--

--------------30BNi0wzQPxtpTIECb10a3nr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh46OIFAwAAAAAACgkQsN6d1ii/Ey9m
FAf/U+c6pYcJyviOnPaD/vp/tbbTM5JOucx/A1IV6JYk+umPCNVVdvu03jQIVu1WpedHJ9+nq5gI
MjBzyxIuAxBj1L+poOyvfxB/XknJ+cGTx0B1VUNoAb/l8l72YlNhq6+fPEoa36dV53wCeBL05NYr
YBtwvMWmLVQQivG5kYf8aX+Gyfm6YZGZ/8lwI51Wu2N0NKUnrWQKHfALgySNdznmEcE61fh1sHKM
nU7MagUKCG8AWA12+1TKS4KhXJfFFtM9Rbx8xGb4kV23e74JPtt52G+YVlX+m9ko4nfpavNmlXVt
4X19wIcg9T1U2C42F20weZ3iYLTAPEZz/J1oUMP5qA==
=lOuX
-----END PGP SIGNATURE-----

--------------30BNi0wzQPxtpTIECb10a3nr--

