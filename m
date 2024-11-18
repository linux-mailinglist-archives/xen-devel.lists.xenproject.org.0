Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4E9D0A30
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 08:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839072.1254875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCw94-0007Bu-8W; Mon, 18 Nov 2024 07:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839072.1254875; Mon, 18 Nov 2024 07:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCw94-00079b-5s; Mon, 18 Nov 2024 07:26:02 +0000
Received: by outflank-mailman (input) for mailman id 839072;
 Mon, 18 Nov 2024 07:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4K+I=SN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tCw92-00079V-Ek
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 07:26:00 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59a19488-a57e-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 08:25:56 +0100 (CET)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-5cf0810f5f9so1188911a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 Nov 2024 23:25:56 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e04676csm504617666b.157.2024.11.17.23.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Nov 2024 23:25:55 -0800 (PST)
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
X-Inumbo-ID: 59a19488-a57e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1NDMiLCJoZWxvIjoibWFpbC1lZDEteDU0My5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU5YTE5NDg4LWE1N2UtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTE0NzU2LjE5MjEyMiwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731914755; x=1732519555; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HcP4kfjMHAHw10FIw4Zg3i5DgWCGGceJ1j5hHXNdbgw=;
        b=AT0zaLWOpoI3tsYLtJDSWViTlDn65tBUHl4MxiJ1iSfX/GRqE+czQ/XhV7rjuU13h+
         DcAFy3hwEg/H2jxR6ohCOW73MRhBpI9DBMJO1P2jWov/8sb6A3eXcYF5kRtWf4TjsjNp
         QQBPDTFmCZ+HemXtwrkQO+rPaGRcuQTb7fM+yFI4OYGLOsRmjyHWRDytzAwbx/40K5pQ
         ZJBfvyVZlSFRF9c7E/ImWgoXu/2Bkenpa2jV8078eiHmBX1x0tB+uvgLBv/k1s/CrA7g
         uy+v1remALxGBw9bAm/Wg5vWpx2GPr9pQt+OJQcolHHA05g40TPAWosYgakkTKojmm6H
         LJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731914755; x=1732519555;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcP4kfjMHAHw10FIw4Zg3i5DgWCGGceJ1j5hHXNdbgw=;
        b=CW7AH1ZsTlw61OolC1LCkDCTReiG4rAwaNCmfrzTvFvZniHp9AedGYQIGp84D6t6A4
         oTH/OMtPxP39KT44zf0Q3g+xONP+hBVXtsXauTDmcaKYbbCn1/meBxw0x3PrsfAc+37S
         toAdrFusUgDKI47dhBcYqKipyodISVBth6fIbY/eo65LqFI4nispgzfy8BML7Jiwr2iB
         bOYtvL+Y9f0TV9W0jvvvxDtpcNGi9asU0rfz2VCUaMc7O6GvM8DnphIcszBvNWNqiWts
         5odFQJUd2KFBfsqxJh7WrBF3NLWnM1PyAkIzUFzcTIkyoGq5MB+hKJKDWzQ+tkieXEZW
         vwoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkCSWjClO+TME0nLlrVEFEBed4zIzpL0JDbykre26LvRfLoQDQlGPtN564Tjj+KWQ9vl8KcGn8xo4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhtKUbzv/43xKE1Y/R6fqPDs4KX8aDdz/Kt2BYz3qViPy6KfAl
	D7VdTcoEWRpROdMAvnQhelm2pJYkiCNo+4t0ApvcK8nsFqNOB3lIENEZTsqgZ1Sp7znqzxj8/KF
	SbNhWkA==
X-Google-Smtp-Source: AGHT+IE4kuvziuH+oCzl+Ko76Wug3BvtKFa1v6J7JQ/PsUYsp/OA1hWCEjBzlt6+JEvgyH2r/NXARg==
X-Received: by 2002:a05:6402:42c8:b0:5cf:b995:112b with SMTP id 4fb4d7f45d1cf-5cfb9951419mr7303219a12.34.1731914755502;
        Sun, 17 Nov 2024 23:25:55 -0800 (PST)
Message-ID: <ff46eeac-8af6-40ba-8f62-de9b9ef95ed7@suse.com>
Date: Mon, 18 Nov 2024 08:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <0f058cca-8c5b-4b6b-919b-cccff9ee2df6@xen.org>
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
In-Reply-To: <0f058cca-8c5b-4b6b-919b-cccff9ee2df6@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qLOGt2lcfMXDD7NFs8noA0hJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qLOGt2lcfMXDD7NFs8noA0hJ
Content-Type: multipart/mixed; boundary="------------OX5rXbn1Pda9xjIgmTVHjjNJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ff46eeac-8af6-40ba-8f62-de9b9ef95ed7@suse.com>
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <0f058cca-8c5b-4b6b-919b-cccff9ee2df6@xen.org>
In-Reply-To: <0f058cca-8c5b-4b6b-919b-cccff9ee2df6@xen.org>
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

--------------OX5rXbn1Pda9xjIgmTVHjjNJ
Content-Type: multipart/mixed; boundary="------------xaeMnweE3Azq0ec0VxCI0lYo"

--------------xaeMnweE3Azq0ec0VxCI0lYo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTEuMjQgMTE6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyMy8xMC8yMDI0IDE0OjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gWGVuc3RvcmUg
aXMgcmVmZXJlbmNpbmcgZG9tYWlucyBieSB0aGVpciBkb21pZCwgYnV0IHJldXNlIG9mIGEg
ZG9taWQNCj4+IGNhbiBsZWFkIHRvIHRoZSBzaXR1YXRpb24gdGhhdCBYZW5zdG9yZSBjYW4n
dCB0ZWxsIHdoZXRoZXIgYSBkb21haW4NCj4+IHdpdGggdGhhdCBkb21pZCBoYXMgYmVlbiBk
ZWxldGVkIGFuZCBjcmVhdGVkIGFnYWluIHdpdGhvdXQgWGVuc3RvcmUNCj4+IG5vdGljaW5n
IHRoZSBkb21haW4gaXMgYSBuZXcgb25lIG5vdy4NCj4+DQo+PiBBZGQgYSBnbG9iYWwgZG9t
YWluIGNyZWF0aW9uIHVuaXF1ZSBpZCB3aGljaCBpcyB1cGRhdGVkIHdoZW4gY3JlYXRpbmcN
Cj4+IGEgbmV3IGRvbWFpbiwgYW5kIHN0b3JlIHRoYXQgdmFsdWUgaW4gc3RydWN0IGRvbWFp
biBvZiB0aGUgbmV3IGRvbWFpbi4NCj4+IFRoZSBnbG9iYWwgdW5pcXVlIGlkIGlzIGluaXRp
YWxpemVkIHdpdGggdGhlIHN5c3RlbSB0aW1lIGFuZCB1cGRhdGVzDQo+PiBhcmUgZG9uZSB2
aWEgdGhlIHhvcnNoaWZ0IGFsZ29yaXRobSB3aGljaCBpcyB1c2VkIGZvciBwc2V1ZG8gcmFu
ZG9tDQo+PiBudW1iZXIgZ2VuZXJhdGlvbiwgdG9vIChzZWUgaHR0cHM6Ly9lbi53aWtpcGVk
aWEub3JnL3dpa2kvWG9yc2hpZnQpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYxOg0KPj4gLSBtYWtlIHVuaXF1ZV9p
ZCBsb2NhbCB0byBmdW5jdGlvbiAoSmFuIEJldWxpY2gpDQo+PiAtIGFkZCBsb2NrIChKdWxp
ZW4gR3JhbGwpDQo+PiAtIGFkZCBjb21tZW50IChKdWxpZW4gR3JhbGwpDQo+PiAtLS0NCj4+
IMKgIHhlbi9jb21tb24vZG9tYWluLmPCoMKgwqDCoCB8IDIwICsrKysrKysrKysrKysrKysr
KysrDQo+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8wqAgMyArKysNCj4+IMKgIDIg
ZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPj4gaW5kZXggOTIy
NjNhNGZiZC4uMzk0ODY0MGZiMCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWlu
LmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4+IEBAIC01NjIsNiArNTYyLDI1
IEBAIHN0YXRpYyB2b2lkIF9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4g
wqDCoMKgwqDCoCBmcmVlX2RvbWFpbl9zdHJ1Y3QoZCk7DQo+PiDCoCB9DQo+PiArc3RhdGlj
IHVpbnQ2NF90IGdldF91bmlxdWVfaWQodm9pZCkNCj4+ICt7DQo+PiArwqDCoMKgIHN0YXRp
YyB1aW50NjRfdCB1bmlxdWVfaWQ7DQo+PiArwqDCoMKgIHN0YXRpYyBERUZJTkVfU1BJTkxP
Q0sobG9jayk7DQo+PiArwqDCoMKgIHVpbnQ2NF90IHggPSB1bmlxdWVfaWQgPyA6IE5PVygp
Ow0KPiANCj4gSSB0aGluayB1bmlxdWVfaWQgbmVlZHMgdG8gYmUgcmVhZCB3aXRoaW4gdGhl
IGNyaXRpY2FsIHNlY3Rpb24uIE90aGVyd2lzZSwgDQo+IGdldF91bmlxdWVfaWQoKSBjb3Vs
ZCByZXR1cm4gdGhlIHNhbWUgSUQgdHdpY2UuDQoNClllcywgeW91IGFyZSByaWdodC4NCg0K
DQpKdWVyZ2VuDQo=
--------------xaeMnweE3Azq0ec0VxCI0lYo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xaeMnweE3Azq0ec0VxCI0lYo--

--------------OX5rXbn1Pda9xjIgmTVHjjNJ--

--------------qLOGt2lcfMXDD7NFs8noA0hJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmc67AIFAwAAAAAACgkQsN6d1ii/Ey+X
rwf/UkgUnuC2CdngzfT/mpHHOV9QlLA/MXIm7fK5E2tMI9W3IMI7PlhNUohOHkeJVKrf+VpZQ+TT
AAWNdQ1MR7nCKy1rlQ7tuTKXyhzH76Xk9C9bgJ43H+DXxVAvW9SZqsljHtuLFk2pQSlbNXJHYy7l
RGF+c+CO9hm+PA8olCUyAFSgOzgD9tBKt0LdrD+4J9VsI2b1F3agatR69/ll4wg2qsNYRc+EXghi
QUG47O2jMp6rfFvjbDeTyvOMPnve47mpRjwT5RlQOPxrrkIpGalf2D3eq4MBujHZtLRJuMhkWdRO
vZmp1hKdKh3at7pYoFZA6iLPnj4iq76hMjX92jNddQ==
=WmxM
-----END PGP SIGNATURE-----

--------------qLOGt2lcfMXDD7NFs8noA0hJ--

