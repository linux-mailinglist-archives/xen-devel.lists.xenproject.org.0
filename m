Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318709AE043
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 11:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825048.1239248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tuD-0004gy-Ou; Thu, 24 Oct 2024 09:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825048.1239248; Thu, 24 Oct 2024 09:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tuD-0004eM-MG; Thu, 24 Oct 2024 09:13:21 +0000
Received: by outflank-mailman (input) for mailman id 825048;
 Thu, 24 Oct 2024 09:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MNKq=RU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t3tuC-0004eG-C8
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 09:13:20 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3510206d-91e8-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 11:13:18 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so6563491fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 02:13:18 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b16esm5436786a12.60.2024.10.24.02.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 02:13:16 -0700 (PDT)
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
X-Inumbo-ID: 3510206d-91e8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729761197; x=1730365997; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PC40bluxgxNoJ/QlQ+VZUbt0hlUDMFgeadCh/QTj7Bc=;
        b=VuCeAVGBewpRChumqdJsvrVH/kTzDKPV3q8xfpm4DBjOfQeCyrnTIUyIZsbKjijeXE
         7ZNMfmqwrh70/RdaqkLA4ZKFYqw2u0ERNLu2gMMRrARWMhUofjYJSJEvy4BP11o1sW7m
         /HIwC8DHsPzpGbHo213OnYg3pNEVVCj1RLtamk2A6HJrQ42dEw/0J0eSoc3a+3jNcjRA
         dgMOcmO+vWJt8Yy4ZtzfQGV5Y4ZifigDMTcbIsh58ACuhVem+X+7wTCbDamsFQ+Xp5lj
         gz6ZQHV/wLm6CRENuSnBV/cWJQNVq9t3tDnrgVMsgtPfPgXXAoCVM3Ss4DSA/eMAYYVO
         QRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761197; x=1730365997;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PC40bluxgxNoJ/QlQ+VZUbt0hlUDMFgeadCh/QTj7Bc=;
        b=qKrCDRx6Cd0FijBc7TxXClAD7YxSokCdvLxlR6DwdSI9qerkFDWSfhMvC1EZ1QfcPZ
         QMj94SGj6zK6/zUZbOB45UEuSyGLoSmpIpkELLi2nEPrCxM0tZX2XWbmNyybo/yzA9lT
         kwaoUZf8iobze0IAwVsogTlazju56viX/tq3qDU7iKkDpYR7QoEjEVOkvfj1HcJ1roRb
         u4zdiSxwwRz2MUU4M+fje5b3iKmTj+MHA3Jd616YXoyLbWBuBPUbLe85xO8IGkfAmZSV
         ffyDehEkguLe5JB5XFlWOUXRmmYBwJGso4ivXiDMXN+PWbehhhn9cep7ZUU/qB/lA+Zu
         XmFg==
X-Forwarded-Encrypted: i=1; AJvYcCXLu9BKVZLBQVvBNxzE2PIViERBdHCiuWi4XgEZNDKfW+a3BDRE8shWmeyEVM+oyEjOwNRpSciDQVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkC2H7BhrxszLqdPOBN9SqRX6zMD8701UXh2MjRDWneNmeheGr
	hy9CHPVEfKf4oL//8JmpUVQUhk3J3XZhikd3Aru68mkMpDN/Nhdf2UOtW82Cj2w=
X-Google-Smtp-Source: AGHT+IEss0UCO9QMpkpGYQJZjuTkGW5F5JfgHF6fLhHWS84eBWsayqlhZ6EjfrG47HlRyHt1gx22ZQ==
X-Received: by 2002:a2e:b8c9:0:b0:2fb:b8a:7abb with SMTP id 38308e7fff4ca-2fca8225499mr8441451fa.21.1729761197326;
        Thu, 24 Oct 2024 02:13:17 -0700 (PDT)
Message-ID: <9a049e23-471f-4987-9993-e5f2db60ac1f@suse.com>
Date: Thu, 24 Oct 2024 11:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <ea2aeed1-91b7-47db-9354-d0634d0db9e8@apertussolutions.com>
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
In-Reply-To: <ea2aeed1-91b7-47db-9354-d0634d0db9e8@apertussolutions.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iajCeEtt9l1v7lszBCoE7rrA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iajCeEtt9l1v7lszBCoE7rrA
Content-Type: multipart/mixed; boundary="------------0eUmDybNHL2hbxJ0Ojj0CbjI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <9a049e23-471f-4987-9993-e5f2db60ac1f@suse.com>
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <ea2aeed1-91b7-47db-9354-d0634d0db9e8@apertussolutions.com>
In-Reply-To: <ea2aeed1-91b7-47db-9354-d0634d0db9e8@apertussolutions.com>
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

--------------0eUmDybNHL2hbxJ0Ojj0CbjI
Content-Type: multipart/mixed; boundary="------------oy0ClXDl1vdSOAqwHGgC60Ou"

--------------oy0ClXDl1vdSOAqwHGgC60Ou
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTAuMjQgMTc6NTUsIERhbmllbCBQLiBTbWl0aCB3cm90ZToNCj4gT24gMTAvMjMv
MjQgMDk6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgYSBuZXcgZG9tY3RsIHN1
Yi1mdW5jdGlvbiB0byBnZXQgZGF0YSBvZiBhIGRvbWFpbiBoYXZpbmcgY2hhbmdlZA0KPj4g
c3RhdGUgKHRoaXMgaXMgbmVlZGVkIGJ5IFhlbnN0b3JlKS4NCj4+DQo+PiBUaGUgcmV0dXJu
ZWQgc3RhdGUganVzdCBjb250YWlucyB0aGUgZG9taWQsIHRoZSBkb21haW4gdW5pcXVlIGlk
LA0KPj4gYW5kIHNvbWUgZmxhZ3MgKGV4aXN0aW5nLCBzaHV0ZG93biwgZHlpbmcpLg0KPj4N
Cj4+IEluIG9yZGVyIHRvIGVuYWJsZSBYZW5zdG9yZSBzdHViZG9tIGJlaW5nIGJ1aWx0IGZv
ciBtdWx0aXBsZSBYZW4NCj4+IHZlcnNpb25zLCBtYWtlIHRoaXMgZG9tY3RsIHN0YWJsZS7C
oCBGb3Igc3RhYmxlIGRvbWN0bHMgdGhlDQo+PiBpbnRlcmZhY2VfdmVyc2lvbiBpcyBzcGVj
aWZpYyB0byB0aGUgcmVzcGVjdGl2ZSBkb21jdGwgb3AgYW5kIGl0IGlzIGFuDQo+PiBpbi9v
dXQgcGFyYW1ldGVyOiBPbiBpbnB1dCB0aGUgY2FsbGVyIGlzIHNwZWNpZnlpbmcgdGhlIGRl
c2lyZWQgdmVyc2lvbg0KPj4gb2YgdGhlIG9wLCB3aGlsZSBvbiBvdXRwdXQgdGhlIGh5cGVy
dmlzb3Igd2lsbCByZXR1cm4gdGhlIHVzZWQgdmVyc2lvbg0KPj4gKHRoaXMgd2lsbCBiZSBh
dCBtYXggdGhlIGNhbGxlciBzdXBwbGllZCB2ZXJzaW9uLCBidXQgbWlnaHQgYmUgbG93ZXIg
aW4NCj4+IGNhc2UgdGhlIGh5cGVydmlzb3IgZG9lc24ndCBzdXBwb3J0IHRoaXMgdmVyc2lv
bikuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPj4gLS0tDQo+PiBWMToNCj4+IC0gdXNlIGEgZG9tY3RsIHN1Ym9wIGZvciB0aGUg
bmV3IGludGVyZmFjZSAoSmFuIEJldWxpY2gpDQo+PiAtLS0NCj4+IMKgIHRvb2xzL2ZsYXNr
L3BvbGljeS9tb2R1bGVzL2RvbTAudGXCoCB8wqAgMiArLQ0KPj4gwqAgeGVuL2NvbW1vbi9k
b21haW4uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4+IMKgIHhlbi9jb21tb24vZG9tY3RsLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE5ICsrKysrKysrKystDQo+PiDCoCB4ZW4v
Y29tbW9uL2V2ZW50X2NoYW5uZWwuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArKysrLQ0K
Pj4gwqAgeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5owqDCoMKgwqDCoMKgwqDCoCB8IDMz
ICsrKysrKysrKysrKysrKysrKysNCj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9ldmVudC5owqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrKysNCj4+IMKgIHhlbi9pbmNsdWRlL3hl
bi9zY2hlZC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsrDQo+PiDCoCB4ZW4v
aW5jbHVkZS94c20vZHVtbXkuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOCArKysr
Kw0KPj4gwqAgeGVuL2luY2x1ZGUveHNtL3hzbS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNiArKysrDQo+PiDCoCB4ZW4veHNtL2R1bW15LmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4+IMKgIHhlbi94c20vZmxhc2sv
aG9va3MuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKysrKw0KPj4gwqAg
eGVuL3hzbS9mbGFzay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgfMKgIDIgKysNCj4+IMKgIDEy
IGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS90b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20wLnRlIA0K
Pj4gYi90b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20wLnRlDQo+PiBpbmRleCAxNmI4
Yzk2NDZkLi42MDQzYzAxYjEyIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvZmxhc2svcG9saWN5
L21vZHVsZXMvZG9tMC50ZQ0KPj4gKysrIGIvdG9vbHMvZmxhc2svcG9saWN5L21vZHVsZXMv
ZG9tMC50ZQ0KPj4gQEAgLTQwLDcgKzQwLDcgQEAgYWxsb3cgZG9tMF90IGRvbTBfdDpkb21h
aW4gew0KPj4gwqAgfTsNCj4+IMKgIGFsbG93IGRvbTBfdCBkb20wX3Q6ZG9tYWluMiB7DQo+
PiDCoMKgwqDCoMKgIHNldF9jcHVfcG9saWN5IGdldHRzYyBzZXR0c2Mgc2V0c2NoZWR1bGVy
IHNldF92bnVtYWluZm8NCj4+IC3CoMKgwqAgZ2V0X3ZudW1haW5mbyBwc3JfY210X29wIHBz
cl9hbGxvYyBnZXRfY3B1X3BvbGljeQ0KPj4gK8KgwqDCoCBnZXRfdm51bWFpbmZvIHBzcl9j
bXRfb3AgcHNyX2FsbG9jIGdldF9jcHVfcG9saWN5IGdldF9kb21haW5fc3RhdGUNCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyB3aGVyZSB5b3Ugd2FudCBpdCwgYXMgdGhhdCByZXN0
cmljdHMgZG9tMCB0byBvbmx5IGJlaW5nIA0KPiBhYmxlIHRvIG1ha2UgdGhhdCBjYWxsIGFn
YWluc3QgZG9tMC4gVGhlIHF1ZXN0aW9uIEkgaGF2ZSBpcywgYXJlIHlvdSBsb29raW5nIGZv
ciANCj4gdGhpcyBwZXJtaXNzaW9uIHRvIGJlIGV4cGxpY2l0bHkgYXNzaWduZWQgdG8gZG9t
MCBvciB0byB0aGUgZG9tYWluIHR5cGUgdGhhdCB3YXMgDQo+IGFsbG93ZWQgdG8gY3JlYXRl
IHRoZSBkb21haW4uIElNSE8sIEkgdGhpbmsgeW91IHdvdWxkIHdhbnQgdGhlIGxhdHRlciwg
c28gbm90IA0KPiBvbmx5IHNob3VsZCB0aGUgcGVybWlzc2lvbiBnbyBoZXJlLCBidXQgYWxz
byBhZGRlZCB0byB4ZW4uaWY6Y3JlYXRlX2RvbWFpbl9jb21tb24uDQo+IA0KPiBBZGRpdGlv
bmFsbHksIEkgd291bGQgYWxzbyByZWNvbW1lbmQgYWRkaW5nIHRoZSBmb2xsb3dpbmcgdG8g
eGVuc3RvcmUudGU6DQo+IA0KPiBhbGxvdyB4ZW5zdG9yZV90IGRvbWFpbl90eXBlOmRvbWFp
biBnZXRfZG9tYWluX3N0YXRlDQoNCk9rYXksIGJ1dCBzaG91bGRuJ3QgdGhpcyBiZToNCg0K
YWxsb3cgeGVuc3RvcmVfdCBkb21haW5fdHlwZTpkb21haW4yIGdldF9kb21haW5fc3RhdGU7
DQoNCj4gDQo+PiDCoCBhbGxvdyBkb20wX3QgZG9tMF90OnJlc291cmNlIHsgYWRkIHJlbW92
ZSB9Ow0KPiANCj4gLi4uDQo+IA0KPj4gQEAgLTg2Niw2ICs4NzMsMTYgQEAgbG9uZyBkb19k
b21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIA0KPj4gdV9kb21j
dGwpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fSFlQRVJWSVNP
Ul9kb21jdGwsICJoIiwgdV9kb21jdGwpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Ow0KPj4gK8KgwqDCoCBjYXNlIFhFTl9ET01DVExfZ2V0X2RvbWFpbl9zdGF0ZToNCj4+ICvC
oMKgwqDCoMKgwqDCoCByZXQgPSB4c21fZ2V0X2RvbWFpbl9zdGF0ZShYU01fSE9PSywgZCk7
DQo+IA0KPiBYU01fSE9PSyB3aWxsIGFsbG93IGFueSBkb21haW4gdG8gbWFrZSB0aGlzIGNh
bGwgb24gYW55IGRvbWFpbi4gV2hhdCBJIHRoaW5rIHlvdSANCj4gd2FudCBoZXJlIGlzIFhT
TV9YU19QUklWLiBUaGF0IHdpbGwgYWxsb3cgZWl0aGVyIGEgZG9tYWluIGZsYWdnZWQgYXMg
dGhlIA0KPiB4ZW5zdG9yZSBkb21haW4gb3IgZG9tMCB0byBtYWtlIHRoZSBjYWxsLg0KDQpJ
IHRob3VnaHQgc28sIHRvbywgYnV0IGxvb2tpbmcgYXQgdGhlICJnZXRkb21haW5pbmZvIiBl
eGFtcGxlIGl0IHNlZW1zDQp0byBiZSBva2F5IHRoaXMgd2F5LCB0b28uIEVzcGVjaWFsbHkg
d2l0aCB0aGUgYWRkaXRpb24gdG8geHNtX2RvbWN0bCgpDQpjaGVja2luZyBmb3IgWFNNX1hT
X1BSSVYuDQoNCj4gDQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCByZXQgKQ0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgY29w
eWJhY2sgPSAxOw0KPj4gK8KgwqDCoMKgwqDCoMKgIG9wLT5pbnRlcmZhY2VfdmVyc2lvbiA9
IFhFTl9ET01DVExfR0VURE9NU1RBVEVfVkVSU19NQVg7DQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0ID0gZ2V0X2RvbWFpbl9zdGF0ZSgmb3AtPnUuZ2V0X2RvbWFpbl9zdGF0ZSwgZCk7DQo+
PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiArDQo+PiDCoMKgwqDCoMKgIGRlZmF1bHQ6
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gYXJjaF9kb19kb21jdGwob3AsIGQsIHVf
ZG9tY3RsKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4gDQo+IC4uLg0KPiAN
Cj4+IEBAIC04MTUsNiArODE2LDEzIEBAIHN0YXRpYyBYU01fSU5MSU5FIGludCBjZl9jaGVj
ayB4c21fYXJnb19zZW5kKA0KPj4gwqAgI2VuZGlmIC8qIENPTkZJR19BUkdPICovDQo+PiAr
c3RhdGljIFhTTV9JTkxJTkUgaW50IGNmX2NoZWNrIHhzbV9nZXRfZG9tYWluX3N0YXRlKA0K
Pj4gK8KgwqDCoCBYU01fREVGQVVMVF9BUkcgc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+
PiArwqDCoMKgIFhTTV9BU1NFUlRfQUNUSU9OKFhTTV9IT09LKTsNCj4gDQo+IFBlciB0aGUg
YWJvdmUsIHRoaXMgd291bGQgbmVlZCBjaGFuZ2VkIHRvIFhTTV9YU19QUklWLg0KPiANCj4+
ICvCoMKgwqAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihhY3Rpb24sIGN1cnJlbnQtPmRv
bWFpbiwgZCk7DQo+PiArfQ0KPj4gKw0KPj4gwqAgI2luY2x1ZGUgPHB1YmxpYy92ZXJzaW9u
Lmg+DQo+PiDCoCBzdGF0aWMgWFNNX0lOTElORSBpbnQgY2ZfY2hlY2sgeHNtX3hlbl92ZXJz
aW9uKFhTTV9ERUZBVUxUX0FSRyB1aW50MzJfdCBvcCkNCj4+IMKgIHsNCj4gDQo+IC4uLg0K
PiANCj4+IEBAIC0xODUzLDYgKzE4NTQsMTEgQEAgc3RhdGljIGludCBjZl9jaGVjayBmbGFz
a19hcmdvX3NlbmQoDQo+PiDCoCAjZW5kaWYNCj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGZs
YXNrX2dldF9kb21haW5fc3RhdGUoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArwqDC
oMKgIHJldHVybiBjdXJyZW50X2hhc19wZXJtKGQsIFNFQ0NMQVNTX0RPTUFJTiwgRE9NQUlO
X19HRVRfRE9NQUlOX1NUQVRFKTsNCj4gDQo+IEkgYmVsaWV2ZSB5b3Ugd2FudCBTRUNDTEFT
U19ET01BSU4yIGhlcmUuDQoNCk9oLCBpbmRlZWQuIEFuZCBwcm9iYWJseSBET01BSU4yX19H
RVRfRE9NQUlOX1NUQVRFDQoNCg0KVGhhbmtzLA0KDQpKdWVyZ2VuDQo=
--------------oy0ClXDl1vdSOAqwHGgC60Ou
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oy0ClXDl1vdSOAqwHGgC60Ou--

--------------0eUmDybNHL2hbxJ0Ojj0CbjI--

--------------iajCeEtt9l1v7lszBCoE7rrA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcaD6wFAwAAAAAACgkQsN6d1ii/Ey9G
2Qf9HOkgcXofqQJ69oUazxKFvgzPLUnAWwlrIh3R3D1P6m9mYbxpzsdD4DdQcn78l92PJCjsxzib
yfwqojbriVGj+6w5jQ6TbzfbsmzILGDjpUpHi6Lq2RS9vn37bb1pUPI2mz2cz/0ueENCYsi7UfIw
e8gkudNYQTU1WxrnsexRJGtRmLo1yDknQlnlzippmrinEKUyBPBdDvSEIWEaIoXM912zjHEO15mg
CE5QuDOrdaBGG8x05mwC91ximJRtwtPVk6A+DqS6E18eavAkS3cuABViHje0sIaQ+z5p+57zoEbY
5xB63aUxPMAcwBN0M+4KJEXaBefSS6LrFGkGBPIVWA==
=seby
-----END PGP SIGNATURE-----

--------------iajCeEtt9l1v7lszBCoE7rrA--

