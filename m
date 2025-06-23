Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B779AE38E4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022211.1397981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcqa-0003Hc-4g; Mon, 23 Jun 2025 08:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022211.1397981; Mon, 23 Jun 2025 08:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcqa-0003EZ-0k; Mon, 23 Jun 2025 08:48:12 +0000
Received: by outflank-mailman (input) for mailman id 1022211;
 Mon, 23 Jun 2025 08:48:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDJJ=ZG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uTcqY-0003CS-05
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:48:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a0c223-500e-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 10:48:07 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453608ed113so34079935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 01:48:07 -0700 (PDT)
Received: from ?IPV6:2003:e5:8746:1a00:ff67:e633:2aa8:93ba?
 (p200300e587461a00ff67e6332aa893ba.dip0.t-ipconnect.de.
 [2003:e5:8746:1a00:ff67:e633:2aa8:93ba])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45365af83easm97427295e9.25.2025.06.23.01.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 01:48:06 -0700 (PDT)
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
X-Inumbo-ID: c8a0c223-500e-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750668487; x=1751273287; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NXvOq4cMPULULEMsjTN205cI8aIH9nff3JOcVEFn04k=;
        b=GoTARdDglQt3G6rMDvNWANM8Z1acDQqfnpSXUkXhq1oK10z/8hHmlUxbg4AIPLIW1s
         ls1iT23ktbhKUrYuZigtlYyOsN2ZZgYT33eLN9oaVlJhR7DMobUbm0RfZBUw2iGWaI8n
         TYu5AFTF1E015qaFz8VENabFVqI1GMIX5EoF2JGvCr3gwhnHIJlx4lZx5VBd81ZLvCR4
         vgX3H7tmYtlFKxxDMqIvEBOjRKN94Mk3LQ5h/vy4EPerTSQOLpS3wKnPZP2ZdEPHuEWa
         x+UR132B+Td88V8kqChOenAe/wt54FwDMGlJJWpQd85nU9/JdYWgN5ZYRlrd+KnTYoIo
         9Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668487; x=1751273287;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXvOq4cMPULULEMsjTN205cI8aIH9nff3JOcVEFn04k=;
        b=FpAwXVkqY8bPNtI7j2hDw/b4xW4RUpC3Jbyx180P7gxcRDmLI6nIkwtvjohYy1fJpU
         Do4uBLNPlEzcaP2Y7YUKF7ZA/tcdVPTLvOsQ2Y1uOnZbDsnReetVeUiJVG5ezFy72L89
         UUzkuB+7uiqqtfj19b+93eeE/UY7NQfPEi+aVfxBE3ot8TSSRtKvId4Wi5DFmjqe04mU
         qqgYF5DjIrVT/s/jDK5ck2NeT44cocoGsVKCQjwPbaPPjiHDFmiKzR0akNj13vrJCVyG
         eXIrxo+hdN1fAhO0XdOfSRFCYOm25qYDbB+w+dXwRl0YLpvEysmXvnVZ1M3lwtUj6GMi
         rvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPkVN+Y899P8YxgSG0vbmkyPlkT9BVv+P/QppkrZdsOJRQWDLdfny9kbqceWORinFWy0Rq6jZG8+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRGbBtANlFRWGEGhoBBgvse9Lm28+xmQoQZ+jlz4mOhDFGIcsU
	E9MZDgLz7lmDm0eUNcMruAZWE/4d8N2czS+sARWin3UFs65tfRglsXYGx04EI5pWKCQ=
X-Gm-Gg: ASbGnctpN0MnZpYAO3u9+E7GrGTG/b76wv1ZO2/AIBiDlzLUEg2KMJtWA0BGKvhHADa
	XLSkxv6PsliT0N/Htb8KsOE7lOCoVUrsCmmkQSRW9urvLNph5CtORWnPmbhenDU10cXv1QTT1Mh
	KTb0ouH+KTrDMp3LkmOtSJ7+ojdwAnij2jG6/hUYJXAxsd9Zvg6QNIML13TduluH/YcKOF4DkSF
	wLxrL0/4l/apdRDBGND26DomcV++M0QyhT4W5XFR/dkpMNmP+vu3c5synUGc80Gdt65JjuWicUt
	aYadnaUbbAJVQDxg+bpeP2LKd/N0aFUFhx0lTnM/UpOeXK4KDQnqbzzW/TecBF/D9nEjixXDOEJ
	or9GVh9JEM3u/W0gHdHX8H+1lHu8AdIA/4lHvNqMGy+MgYEmhwrFKdauxm317Nqd1PPu5GP/OJC
	ENZsIumAqgXW0=
X-Google-Smtp-Source: AGHT+IFllvis6BqL2cIxJTR1xgSGIlzoCAIRAtCNJL2/Yp8WJIBoMDSRc3EF5GS2MU7XCpF3+/e3KA==
X-Received: by 2002:a05:600c:3542:b0:453:5fde:fb5b with SMTP id 5b1f17b1804b1-453659eea05mr98184685e9.19.1750668486822;
        Mon, 23 Jun 2025 01:48:06 -0700 (PDT)
Message-ID: <169ca556-0082-4885-bc41-2aa0a61d33b8@suse.com>
Date: Mon, 23 Jun 2025 10:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 0/6] hide struct start_info from PVH code
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250619113804.32694-1-jgross@suse.com>
 <00495ca3-55f1-422b-9839-aa54ec42a129@suse.com>
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
In-Reply-To: <00495ca3-55f1-422b-9839-aa54ec42a129@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dlbn0Pnb42asKOsf1yWYSuYk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dlbn0Pnb42asKOsf1yWYSuYk
Content-Type: multipart/mixed; boundary="------------JY1QJSAeC6Dw0xcCXSFBht2V";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <169ca556-0082-4885-bc41-2aa0a61d33b8@suse.com>
Subject: Re: [MINI-OS PATCH 0/6] hide struct start_info from PVH code
References: <20250619113804.32694-1-jgross@suse.com>
 <00495ca3-55f1-422b-9839-aa54ec42a129@suse.com>
In-Reply-To: <00495ca3-55f1-422b-9839-aa54ec42a129@suse.com>
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

--------------JY1QJSAeC6Dw0xcCXSFBht2V
Content-Type: multipart/mixed; boundary="------------mrluI7AjAKXjH176hi71uL4c"

--------------mrluI7AjAKXjH176hi71uL4c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjUgMTA6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wNi4yMDI1
IDEzOjM3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hpbGUgd29ya2luZyBvbiB4ZW5z
dG9yZS1zdHViZG9tIGxpdmUgdXBkYXRlIHN1cHBvcnQgSSBjYW1lIGFjcm9zcw0KPj4gc29t
ZSByZWFsbHkgdW5wbGVhc2FudCBjb2RlIHVzaW5nIHN0cnVjdCBzdGFydF9pbmZvIGV2ZW4g
d2hlbiBydW5uaW5nDQo+PiBpbiBQVkggbW9kZS4NCj4+DQo+PiBFc3BlY2lhbGx5IHN1c3Bl
bmQvcmVzdW1lIHdhcyBkb2luZyBzb21lIGNyYXp5IHN0dWZmLCBpbmNsdWRpbmcNCj4+IG92
ZXJ3cml0aW5nIHRoZSBpbml0aWFsIHN0cnVjdCBodm1fc3RhcnRfaW5mbyBwYXJ0aWFsbHku
DQo+Pg0KPj4gVGhpcyBzZXJpZXMgaXMgaGlkaW5nIHN0cnVjdCBzdGFydF9pbmZvIGZyb20g
UFZIIGNvZGUuIFRoaXMgZGlkbid0DQo+PiByZXN1bHQgaW4gYW55IHJ1bnRpbWUgZXJyb3Is
IGJ1dCBpbiBmdXR1cmUgSSdsbCBuZWVkIHRvIGFjY2VzcyBzdHJ1Y3QNCj4+IGh2bV9zdGFy
dF9pbmZvIHNvbWUgdGltZSBhZnRlciBib290LCBzbyBJIG5lZWQgdG8gZ2V0IHRoYXQgZml4
ZWQuDQo+Pg0KPj4gVGVzdGVkIGVzcGVjaWFsbHkgd2l0aCB4bCBzdXNwZW5kL3Jlc3VtZSBh
bmQgeGwgc2F2ZS9yZXN0b3JlIGluIFBWIGFuZA0KPj4gaW4gUFZIIG1vZGUuDQo+Pg0KPj4g
SnVlcmdlbiBHcm9zcyAoNik6DQo+PiAgICBzdXNwZW5kOiBkcm9wIGNyYXp5IHBmbiBoYW5k
bGluZyBmb3IgUFZIDQo+PiAgICBzZXR1cDogZHJvcCBwYXJhbWV0ZXIgZnJvbSBtYXBfc2hh
cmVkX2luZm8oKQ0KPj4gICAgeDg2L3B2OiByZW1vdmUgZ2xvYmFsIHN0YXJ0X2luZm8NCj4+
ICAgIGNvbnNvbGU6IGRyb3AgcGFyYW1ldGVyIGZyb20gZ2V0X2NvbnNvbGUoKQ0KPj4gICAg
eGVuYnVzOiBkcm9wIHBhcmFtZXRlciBmcm9tIGdldF94ZW5idXMoKQ0KPj4gICAgeDg2L3B2
OiBtYWtlIHN0YXJ0X2luZm9fcHRyIFBWLW9ubHkNCj4gDQo+IEJlZm9yZSBJIGV2ZW4gdHJ5
OiBEb2VzIHRoaXMgc2VyaWVzIGludGVyZmVyZSBpbiBhbnkgd2F5IHdpdGggdGhlIGtleGVj
IG9uZSwNCj4gYW5kIGhlbmNlIG1heSBuZWVkIHJlLWJhc2luZyBvbiB0b3Agb2YgdGhhdCAo
d2hpY2ggSSd2ZSBwdXNoZWQgYSBtaW51dGUgYWdvKT8NCg0KSSdtIG5vdCBhd2FyZSBvZiBh
bnkgcG9zc2libGUgY29uZmxpY3QuDQoNCg0KSnVlcmdlbg0K
--------------mrluI7AjAKXjH176hi71uL4c
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mrluI7AjAKXjH176hi71uL4c--

--------------JY1QJSAeC6Dw0xcCXSFBht2V--

--------------dlbn0Pnb42asKOsf1yWYSuYk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhZFMUFAwAAAAAACgkQsN6d1ii/Ey+C
Vwf8DWzJllBPIxuydOg7UQYXy3Ly+UsQtqzvldp6JxxOYAm+lRNWoYNxkzaG03LSl6wmz/J9EYTS
meM1U1PvBohR0kBQGycaBJXb6Sf9+s9oULBdzyjUcv/GUuNU/68CKtVLOV2CrhfE7xfkRh0gU77U
Ox/EWJJj3T1shb9uaELgAStDiS5GSF39FHZcmPYMNQBSFg0VOUBXxZlDQDmcAB6ZG+8C611VfxVq
jeiXe8VX4Ek64JRzMZ4Zhpw+r/KRKo3Qfo7twHEErSbkmFo3WrL+TC2JaFLwF5NlL7OrgcxW0uUE
GLy6ocGpiQFkEGDH6si7Mi9cjTOAHasfkOmxnTMa7w==
=ftjf
-----END PGP SIGNATURE-----

--------------dlbn0Pnb42asKOsf1yWYSuYk--

