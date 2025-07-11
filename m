Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B99B01542
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 09:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040615.1412017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua8cb-0004U2-V3; Fri, 11 Jul 2025 07:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040615.1412017; Fri, 11 Jul 2025 07:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua8cb-0004Sc-SC; Fri, 11 Jul 2025 07:56:41 +0000
Received: by outflank-mailman (input) for mailman id 1040615;
 Fri, 11 Jul 2025 07:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ua8ca-0004SB-4U
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 07:56:40 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 934c1611-5e2c-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 09:56:39 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-ae0bde4d5c9so364178166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 00:56:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e9105csm255979066b.20.2025.07.11.00.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 00:56:38 -0700 (PDT)
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
X-Inumbo-ID: 934c1611-5e2c-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752220599; x=1752825399; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mnrxRntTreLBRjHTND7WQ70bJvT2gtDjkKw+0HUxyZQ=;
        b=CwQvgwuRWLiU7U8cBmLNLJ7wPcORhi3wR7KiKnH343iiDQ1VnegyhxQx/FG1QDqzIm
         Sg/OWkl//xFf5B0akEkokPLfTNYCIRb5cgwstip7J2aQeVzXZ8p5i9H+U/S/iPPxohoD
         43CRPkq8fvhOja3gu2N1r3rYouxILWu3AjrANC/cBAmWn1iowgdgirDgg1TlSIZ7vZG3
         BwVIsVleYNGG0cYQshag2FLVdBHD5+Ti/nLKyt9FFMHUej4Tb5CZ4PLp4f18LJIQd9/o
         ok+jLMwoVeFW6Zm1sUnoCqGu3KRSomxq5mJo+YPABejpTIoNtJ9UQQW+xKZIOoRhtv4X
         Asgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752220599; x=1752825399;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnrxRntTreLBRjHTND7WQ70bJvT2gtDjkKw+0HUxyZQ=;
        b=tI7jMtQEMfm8ctnu+3i6w5frDx8fJFK/dTBSJP8VP5AtNHdvN9ttEBoUzT1kNWL0xg
         zs5FioNuyNOvn7zERFpPvQuFd5ns5MRlwZL81sd8l37u0b8V3rlMPoEquoCIbapgGHTZ
         4mXt3Zd8LwQZOKwVfckheZZDhoeWJkiV5VN1E9HalKIt+aJnlI+A14PyV+fQQkMY5MIH
         Ak6urwe3Ldm3TSddiHV0zoe0Md/byJ+ipzafdKIjTV1EjmjorhpbpdbcNuSyylY4fo9k
         SMmJrKJwkqR6WZnB2gQtgXpWhXNVIFzjbH/Nbbe085XPIJpF1rLxdQM1sxEPQBGkCFK0
         0pxA==
X-Forwarded-Encrypted: i=1; AJvYcCXJPYJw3eBcBUgi8OPUXYArdIYaFAEvG+Z0YeBSeFA0xNc9a/dFzYOjM8zTYqTZE83xrz/w7eGnx3Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf4yXQ2zQR/x/QeKltLAUdwiczp+DT9QJmFe0Ve8higWoToph+
	1GGD9FvXICnfCEb12QMhygRdCjg2MZQ9exrOAys+xEFPpdDQVnUrv7JPiiMUbDt6dzg=
X-Gm-Gg: ASbGncuWm24dmQXCZLKKcZF3t63SXK4Y0m31dNX5Idn91dDdKPnHEVxZM1ljiYNR9BF
	EBRbneL+EUNzHFwC8r/zHOlmVvie+KW187/i8dof6oZHCxnEH7uV/gMNLcyaAVhWn1J8zF361Pd
	7jQf+QLsUNRUzYvUaqFbMmgxAsVaEN5fWsCGP9tACcWLFXAk3aLdbCaNSUjuka7RYRgjHdXWmoG
	O7PSbiTtc+kOYpgxF48Ab+XVclUsWvwp9yqDB6i4crFl1q0AgNuv9bHDpuh1OrbfTVniAss3DVF
	FMxUmW5qb43Xf/xPzJNZWTIHXRNm5pufvDoQ0VW33VhikpmsJbkDv4QmoPW7HxCFiru9ZVKeD/g
	oyMFxggo+Dbp8yq4V+8tloaQ3Uh/G6bPblsKz6JpR3r/d7Gw8xPOsw59wsBcqSOBwnf4N07ZiQM
	nLTWUTKD8sjOich1oTHkklR5VHHStBaFZBzGoF2K37p9AL
X-Google-Smtp-Source: AGHT+IGbL5x18u+MxJHpvinMwljJhIi5FiekTbnSFLTJXCPQhxpgbasOGdVyX+YOFwWfHajqR73e8A==
X-Received: by 2002:a17:907:da17:b0:ae0:cc9c:b5e2 with SMTP id a640c23a62f3a-ae6fc1532eamr216979366b.48.1752220598647;
        Fri, 11 Jul 2025 00:56:38 -0700 (PDT)
Message-ID: <4f5c5d7f-2526-4f5a-b75d-8380770ee7c4@suse.com>
Date: Fri, 11 Jul 2025 09:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 11/19] mini-os: config: add support for config
 items with numerical values
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-12-jgross@suse.com>
 <6102acd3-b4c0-45a1-87d1-8f4888c662cd@suse.com>
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
In-Reply-To: <6102acd3-b4c0-45a1-87d1-8f4888c662cd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U0O0Czs40YRC0iw06hu20jza"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U0O0Czs40YRC0iw06hu20jza
Content-Type: multipart/mixed; boundary="------------0cngMd1cpa6ZpB4rN5j1hhMk";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <4f5c5d7f-2526-4f5a-b75d-8380770ee7c4@suse.com>
Subject: Re: [MINI-OS PATCH 11/19] mini-os: config: add support for config
 items with numerical values
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-12-jgross@suse.com>
 <6102acd3-b4c0-45a1-87d1-8f4888c662cd@suse.com>
In-Reply-To: <6102acd3-b4c0-45a1-87d1-8f4888c662cd@suse.com>
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

--------------0cngMd1cpa6ZpB4rN5j1hhMk
Content-Type: multipart/mixed; boundary="------------nn0dgDWBYJWhkPufkFzGMc1o"

--------------nn0dgDWBYJWhkPufkFzGMc1o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjUgMDg6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wNy4yMDI1
IDEwOjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIHN1cHBvcnQgZm9yIGEgTWlu
aS1PUyBjb25maWcgZmlsZSBjb250YWluaW5nIGNvbmZpZyBpdGVtcyB3aXRoDQo+PiBudW1l
cmljYWwgdmFsdWVzLCBlLmcuIENPTkZJR19GT089Ny4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gQWxiZWl0IEknbSBwdXp6
bGVkIGJ5IHRoZSB1c2UgaW4gdGhlIG5leHQgcGF0Y2guIEJlc2lkZXMgbWUgcGVyaGFwcyBz
aW1wbHkNCj4gbm90IGtub3dpbmcgd2hlcmUgdGhlIG5ldyBDT05GSUdfKiB3b3VsZCBhY3R1
YWxseSBoYXZlIGl0cyB2YWx1ZSBzZXQsIEkNCj4gd29uZGVyIHdoeSwgLi4uDQo+IA0KPj4g
LS0tIGEvQ29uZmlnLm1rDQo+PiArKysgYi9Db25maWcubWsNCj4+IEBAIC0xNzgsNiArMTc4
LDcgQEAgZW5kaWYNCj4+ICAgIyBDT05GSUcteSBjb250YWlucyBhbGwgaXRlbXMgZGVmYXVs
dGluZyB0byAieSINCj4+ICAgIyBDT05GSUctbiBjb250YWlucyBhbGwgaXRlbXMgZGVmYXVs
dGluZyB0byAibiINCj4+ICAgIyBDT05GSUcteCBjb250YWlucyBhbGwgaXRlbXMgYmVpbmcg
Y2FsY3VsYXRlZCBpZiBub3Qgc2V0IGV4cGxpY2l0bHkNCj4+ICsjIENPTkZJRy12YWwteSBj
b250YWlucyBhbGwgaXRlbXMgd2l0aCBudW1lcmljYWwgdmFsdWVzLCBkZWZhdWx0aW5nIHRv
IDANCj4+ICAgQ09ORklHLXkgKz0gQ09ORklHX1NUQVJUX05FVFdPUksNCj4+ICAgQ09ORklH
LXkgKz0gQ09ORklHX1NQQVJTRV9CU1MNCj4+ICAgQ09ORklHLXkgKz0gQ09ORklHX0JMS0ZS
T05UDQo+PiBAQCAtMjE5LDYgKzIyMCw4IEBAIENPTkZJRy0kKGx3aXApICs9IENPTkZJR19M
V0lQDQo+PiAgICQoZm9yZWFjaCBpLCQoQ09ORklHLXkpLCQoZXZhbCAkKGkpID89IHkpKQ0K
Pj4gICAkKGZvcmVhY2ggaSwkKENPTkZJRy1uKSwkKGV2YWwgJChpKSA/PSBuKSkNCj4+ICAg
DQo+PiArJChmb3JlYWNoIGksJChDT05GSUctdmFsLXkpLCQoZXZhbCAkKGkpID89IDApKQ0K
PiANCj4gLi4uIHdpdGggdGhpcyBhbmQgLi4uDQo+IA0KPj4gQEAgLTIyNiw2ICsyMjksNyBA
QCBDT05GSUctYWxsIDo9ICQoQ09ORklHLXkpICQoQ09ORklHLW4pICQoQ09ORklHLXgpDQo+
PiAgIA0KPj4gICAjIEV4cG9ydCBjb25maWcgaXRlbXMgYXMgY29tcGlsZXIgZGlyZWN0aXZl
cw0KPj4gICAkKGZvcmVhY2ggaSwkKENPTkZJRy1hbGwpLCQoZXZhbCBERUZJTkVTLSQoJChp
KSkgKz0gLUQkKGkpKSkNCj4+ICskKGZvcmVhY2ggaSwkKENPTkZJRy12YWwteSksJChldmFs
IERFRklORVMteSArPSAtRCQoaSk9JCgkKGkpKSkpDQo+IA0KPiAuLi4gdGhpcywga2V4ZWMu
aCBzdGlsbCBuZWVkcyB0byBoYXZlIGEgZmFsbGJhY2sgI2RlZmluZSB0aGVyZS4NCg0KVGhh
bmtzIGZvciBjYXRjaGluZy4NCg0KSSBoYWQgYW4gaW50ZXJtZWRpYXRlIHZlcnNpb24gdXNp
bmcgQ09ORklHX0tFWEVDX01PRFVMRV9QQUdFUyBvdXRzaWRlDQprZXhlYy5jLCBidXQgbW92
ZWQgdGhlIHJlbGF0ZWQgY29kZSBsYXRlci4NCg0KSSdsbCByZW1vdmUgdGhlIGZhbGxiYWNr
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------nn0dgDWBYJWhkPufkFzGMc1o
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nn0dgDWBYJWhkPufkFzGMc1o--

--------------0cngMd1cpa6ZpB4rN5j1hhMk--

--------------U0O0Czs40YRC0iw06hu20jza
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhww7UFAwAAAAAACgkQsN6d1ii/Ey8n
cAf7BmL1Jrm/ouS3nEi+N8jot9CbjeQj3sILxiO1ahn/qu9lAiO0N9p5ow7ltixWDOeNsGh1OFMB
nyCc2mVqDMIQBkhHhm2y+Du3fo4Hv5NQM5ojU0HkyA1kUCIQrwvpNfgalGvpWh4dM/D70is5royf
8ywJAfEui1H4M84gVOJWCuhqyYMZkZBSSzvz46Tvk2jmioZ36MLs0VVhXhtbCB7MgxDw31AGHyXU
UaPKNENoOF70CYyLMev43E5PnWiefoAi4NcGcYEZ/FzZR7Dx8wB7lNxz2UkBfdBgv/uIxTDeCczd
xWE8bfZ+Nt6F6QDlnVU8MnCDtL09JdF8Nlf/xZAw1w==
=7eN8
-----END PGP SIGNATURE-----

--------------U0O0Czs40YRC0iw06hu20jza--

