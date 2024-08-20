Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4485B9588FB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780496.1190115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPiq-0006eB-PT; Tue, 20 Aug 2024 14:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780496.1190115; Tue, 20 Aug 2024 14:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPiq-0006b9-MU; Tue, 20 Aug 2024 14:20:32 +0000
Received: by outflank-mailman (input) for mailman id 780496;
 Tue, 20 Aug 2024 14:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bKv/=PT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sgPip-0006b2-8T
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:20:31 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aa41915-5eff-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:20:30 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-429da8b5feaso61259265e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:20:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed648f55sm143875765e9.3.2024.08.20.07.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 07:20:28 -0700 (PDT)
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
X-Inumbo-ID: 5aa41915-5eff-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724163630; x=1724768430; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Il+ux5E/V/afeeGHtzrrXgP0e38W/c5NX5j5utEmh8=;
        b=OMNu7KvxeS4qAuS32cTvZJ9VWpp+a3nz6z7hQS1ycJTylKxtUj2JjKD5dExTw6iyyN
         8GoQdsK5B6PwQyY3IMvR+BbH/1La3LWERx3uHWs8tlSJ1YOke3ZZlAt8tKdWzQThK+QS
         LASGs9CVWxLXlkN3FGlw7i6r10nd9QgtfGAj1JRJ4DlCv3Twy9aNWMUNgLQ99OgpZQTg
         /oxbwyVtrMsx3zyAKokWh+JjY0n6i331Tt6vq3lVbeSeijbEzy/6gyb3U6zZqxfaueas
         zpsFwrsMfhEFXQMnztVHgCeRAZujfV0ttBnSKTVqku9hSAF6nXe79JLHZbrTTEDQ9iTR
         z9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163630; x=1724768430;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Il+ux5E/V/afeeGHtzrrXgP0e38W/c5NX5j5utEmh8=;
        b=NPpsXALAjhKOcjeX4ay9vvJCckiuQ+35E5u1QJo5CamuirKQKamlczT9XK8V5hVACI
         3df9hSYfiSH2bfWdrTt7aSTcwM8RhYD8xRn5XQprBD6xhrCzTohiXml1fI+E9/4F7RHH
         JBAMzzQ717qTeJnYVcWE3/NlTQKGacANiXXQDKGC+tVPO9bFLU1FhenzjgzhoId91HwN
         aFMIsw/nEl77DDkGLbJMDaa4g2DNmBCnUPwaYTiYlTIXTqeFrZ6sw/rW5op32//t6QN/
         bl9a1ThNzAxtXhEbxYF8Uu/D+cXbjTOPyFmbVKmJIaSP5oIQmR3Sfvhqzn5J7ivSTYBQ
         w4hA==
X-Forwarded-Encrypted: i=1; AJvYcCWUnrki1MLlDKKLIkBdBKJXaziZ1SQVtoPaE6Mez7uAW5ZOqZe8tO4s2y88GsHSCYdEX3TJY06FiiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBIXY4SuBijksvdG1ztHJtrQbJyKuWPXNl4w6zfqZ7qgV6pvaO
	AVKogWgK3pMjpiSepjxrk7iSRvjGKi4GGbvWxb+s3OqrBMKUaLFW0gJ8drvwo+p+uKWFAjvTx10
	49fk=
X-Google-Smtp-Source: AGHT+IFP1XPLJH9BZvEF0MNaTKFLkGDZMPI5hwrtY/zjkJKlEf34EaCVVbo43UTOKoImzaGPZJeSdA==
X-Received: by 2002:a05:600c:6a84:b0:426:6714:5415 with SMTP id 5b1f17b1804b1-429ed7d6497mr115067685e9.30.1724163629066;
        Tue, 20 Aug 2024 07:20:29 -0700 (PDT)
Message-ID: <89bbbc7b-4fda-4a14-a1a3-1c4b2b708691@suse.com>
Date: Tue, 20 Aug 2024 16:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mini-os: mm: introduce generic page table walk
 function
To: Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-2-jgross@suse.com>
 <20240820115248.34qg23znyx5qoh37@begin>
 <6e9715ba-7c49-426e-bff4-7569638c0a4b@suse.com>
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
In-Reply-To: <6e9715ba-7c49-426e-bff4-7569638c0a4b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T3f1gwaTgc6mWkcrHnc884aY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T3f1gwaTgc6mWkcrHnc884aY
Content-Type: multipart/mixed; boundary="------------OnYoWn5K2iIAfHc3Bm0JM2UH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Message-ID: <89bbbc7b-4fda-4a14-a1a3-1c4b2b708691@suse.com>
Subject: Re: [PATCH v2 1/3] mini-os: mm: introduce generic page table walk
 function
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-2-jgross@suse.com>
 <20240820115248.34qg23znyx5qoh37@begin>
 <6e9715ba-7c49-426e-bff4-7569638c0a4b@suse.com>
In-Reply-To: <6e9715ba-7c49-426e-bff4-7569638c0a4b@suse.com>
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

--------------OnYoWn5K2iIAfHc3Bm0JM2UH
Content-Type: multipart/mixed; boundary="------------exqA0MCtwvwHdgR5Fmv0pvth"

--------------exqA0MCtwvwHdgR5Fmv0pvth
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDguMjQgMTY6MTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI0
IDEzOjUyLCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6DQo+PiBKdWVyZ2VuIEdyb3NzLCBsZSBt
YXIuIDEzIGFvw7t0IDIwMjQgMTU6NDE6NTYgKzAyMDAsIGEgZWNyaXQ6DQo+Pj4gSW4geDg2
IG1tIGNvZGUgdGhlcmUgYXJlIG11bHRpcGxlIGluc3RhbmNlcyBvZiBwYWdlIHRhYmxlIHdh
bGtzIGZvcg0KPj4+IGRpZmZlcmVudCBwdXJwb3Nlcy4NCj4+Pg0KPj4+IEludHJvZHVjZSBh
IGdlbmVyaWMgcGFnZSB0YWJsZSB3YWxrZXIgYmVpbmcgYWJsZSB0byBjb3ZlciB0aGUgY3Vy
cmVudA0KPj4+IHVzZSBjYXNlcy4gSXQgd2lsbCBiZSB1c2VkIGZvciBvdGhlciBjYXNlcyBp
biBmdXR1cmUsIHRvby4NCj4+Pg0KPj4+IFRoZSBwYWdlIHRhYmxlIHdhbGtlciBuZWVkcyBz
b21lIHBlci1sZXZlbCBkYXRhLCBzbyBhZGQgYSB0YWJsZSBmb3INCj4+PiB0aGF0IGRhdGEu
IE1lcmdlIGl0IHdpdGggdGhlIGFscmVhZHkgZXhpc3RpbmcgcHRfcHJvdFtdIGFycmF5Lg0K
Pj4+DQo+Pj4gUmV3cml0ZSBnZXRfcGd0KCkgdG8gdXNlIHRoZSBuZXcgd2Fsa2VyLg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
Pj4NCj4+IFJldmlld2VkLWJ5OiBTQW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBl
bnMtbHlvbi5vcmc+DQo+IA0KPiBTYW11ZWwgLSBJJ3ZlIHRha2VuIHRoZSBsaWJlcnR5IHRv
IGNvbnZlcnQgdGhlIG9kZCB1cHBlci1jYXNlIEEuDQo+IA0KPiBKw7xyZ2VuIC0gbG9va2lu
ZyBhdCB0aGUgbWluaS1vcyBzaG9ydC1sb2cgaXMgcXVpdGUgb2RkLCBhbmQgaW5jcmVhc2lu
Z2x5DQo+IHNvLiBJbiB0aGUgbWluaS1vcyByZXBvIHN1cmVseSBhbGwgY29tbWl0cyBhcmUg
YWJvdXQgbWluaS1vczsgdGhlDQo+IHN1YmplY3QgcHJlZml4ZXMgYXJlIGtpbmQgb2YgcG9p
bnRsZXNzLiBUbyBuZXZlcnRoZWxlc3MgaWRlbnRpZnkgc3VjaA0KPiBwYXRjaGVzIG9uIHhl
bi1kZXZlbEAsIG1heSBJIHN1Z2dlc3QgdG8gdXNlICh0YWtpbmcgdGhpcyBwYXRjaCBhcyBh
bg0KPiBleGFtcGxlKSAiW1BBVENIIE1JTkktT1NdIG1tOiBpbnRyb2R1Y2UgZ2VuZXJpYyBw
YWdlIHRhYmxlIHdhbGsgZnVuY3Rpb24iDQo+IGluc3RlYWQgKG9yLCBvZiBjb3Vyc2UsIHdo
YXRldmVyIHZhcmlhdGlvbiB0aGVyZW9mIHlvdSBtYXkgbGlrZSBiZXR0ZXIpPw0KDQpPa2F5
LCBmaW5lIHdpdGggbWUuDQoNCg0KSnVlcmdlbg0KDQo=
--------------exqA0MCtwvwHdgR5Fmv0pvth
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
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------exqA0MCtwvwHdgR5Fmv0pvth--

--------------OnYoWn5K2iIAfHc3Bm0JM2UH--

--------------T3f1gwaTgc6mWkcrHnc884aY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbEpisFAwAAAAAACgkQsN6d1ii/Ey9g
FQf/cos49PwJfKBuHZAaKejlt9TYDDpsJbCEfOVuCOlPZBBIL2yi9Pw70/bZSYBJJxbX1/x/iNgm
LzIcUM73yP6gT1vKS94E1O/15jKLYHPxFgJibLqldcRV47HnXi3O563EuQUzdQMs3FhHkl5WgOAn
pYWnZgTW3gBaZUK7y9z4Y3+OUsk1XZtAT0bQ9eUMVJOlkt+iVmBYZOh4+XIIEFNsqQ//adgkos9u
4ojnkMCKjyZNMjZutOr7/oqcvSEiFqn3laSHRE1jBfGJt7pT84/PmjpcS5snmQUOXOcHv6Yr6zQ3
ImIML77Vkod81jVBIXHaVuEuPY8fawuOE/uJiUjobA==
=adaS
-----END PGP SIGNATURE-----

--------------T3f1gwaTgc6mWkcrHnc884aY--

