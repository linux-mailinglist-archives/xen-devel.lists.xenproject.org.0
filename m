Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D428E979BC8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799222.1209116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5lF-0003nU-Kg; Mon, 16 Sep 2024 07:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799222.1209116; Mon, 16 Sep 2024 07:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5lF-0003lz-HW; Mon, 16 Sep 2024 07:03:01 +0000
Received: by outflank-mailman (input) for mailman id 799222;
 Mon, 16 Sep 2024 07:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tb4s=QO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sq5lE-0003lr-22
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:03:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4e520b4-73f9-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 09:02:59 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so489959966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 00:02:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df579sm271123566b.164.2024.09.16.00.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 00:02:57 -0700 (PDT)
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
X-Inumbo-ID: b4e520b4-73f9-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726470179; x=1727074979; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0jLGTTNJVLD+ZkLZh/t7sywdQYc68KZYHW/yc9fKY58=;
        b=YJr364oZFOEZQuBxSg3SraHArRZNZYPYWirpXNwGhYAzBzVyJ3wQysiAWdopTpB+vF
         zFg0WCeQA3Vk2+4ByTNBcmFXL7fexe8K8RKJIqWVtPdLGL1zVIDk6PTQdz3/0mnfCynI
         jthDupvBHnao3G54q7iIIqaSIXIIik+x0qGtSQSo8Ux2FTgjGQ/rHvwTMbZlbjlDZti6
         RK5I2dPTqlvsNMeKtP1mT1Zyppztm6vi0liWgC5xOMjKHrw7ZKgAOL3BIDIb/d2e1zyB
         ZNnce1Z5Z2dxnLNal2hESBg6UpsKSrlN6mDpVik6u3/0YSWN8ymYuQ0B+A1asX9LUx1p
         JBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726470179; x=1727074979;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jLGTTNJVLD+ZkLZh/t7sywdQYc68KZYHW/yc9fKY58=;
        b=JhO7SnKUOggIEYiplses6dFSyWky8PHEWNh9CB7+EkiMBxT5h1whoC3awOyZnuLX4E
         UhLQ/JB6TVM6AUjcKOh08XUJ5oFKC/6XSA/ZpmQSQ0n1lWiCPpNVikOu3JZnfsN6LCII
         UD/VMGKgpK9LGfb4oghvrjQMesABZcYszN+M66yCMCTzi+UH+fSCS/I2ooEJRH/mvzSz
         rdgrZqxvCqW2UWlR/xB+0BmDu/zjFcrULzoSyU6pjyEg42GdcjQd7ZSuWAlyZqjyLEPM
         lecb9gEAifLeYij8Kelf5nQzyfgpLly8sFt0pCQsnP/ZaK/+NQclGv9rUJ5xE8Xqw+Bv
         7ocQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlGW+gMHpvXPq4K3FZb/fexFwtYBD2L+qj7nxMrfCddws8eSP0cETTOe3WwEWD+KYa+H/0/ccYphc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNpXz4bKmuPc33Xe7Z2iYf3IqjfVILvXAWArJrzrfokm+GjxzX
	d939NvWmlzwjDMfXzvC4P8QMj2SSnDeCECAD9IGDMI1oQERfPJCFtE5YLLKwMaA=
X-Google-Smtp-Source: AGHT+IHCL7p5E7AYQrbKZKm7+Pegmtq34KTDoNgDAoUVEdP1+Q7uIpYHid2lJZtu4r8VTCoKw++o6w==
X-Received: by 2002:a17:907:9724:b0:a8a:cc5a:7f3a with SMTP id a640c23a62f3a-a9029617903mr1515483266b.49.1726470177873;
        Mon, 16 Sep 2024 00:02:57 -0700 (PDT)
Message-ID: <993c74fb-c812-4bac-b47a-eff2062fa40d@suse.com>
Date: Mon, 16 Sep 2024 09:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/swiotlb: add alignment check for dma buffers
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20240916064748.18071-1-jgross@suse.com>
 <20240916064748.18071-2-jgross@suse.com>
 <d23c9af4-4a79-4300-891a-fba3ea9cbb1c@suse.com>
 <c2dd89b4-46c7-4a0a-a47b-70862294176b@suse.com>
 <c97450a0-6ddd-49c5-a8e4-0cd2cf9d1635@suse.com>
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
In-Reply-To: <c97450a0-6ddd-49c5-a8e4-0cd2cf9d1635@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bnj0g4e6xe239CXhVgCcxQ01"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bnj0g4e6xe239CXhVgCcxQ01
Content-Type: multipart/mixed; boundary="------------jzOKOhib5KhVMKcA02CVXTau";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
Message-ID: <993c74fb-c812-4bac-b47a-eff2062fa40d@suse.com>
Subject: Re: [PATCH v2 1/2] xen/swiotlb: add alignment check for dma buffers
References: <20240916064748.18071-1-jgross@suse.com>
 <20240916064748.18071-2-jgross@suse.com>
 <d23c9af4-4a79-4300-891a-fba3ea9cbb1c@suse.com>
 <c2dd89b4-46c7-4a0a-a47b-70862294176b@suse.com>
 <c97450a0-6ddd-49c5-a8e4-0cd2cf9d1635@suse.com>
In-Reply-To: <c97450a0-6ddd-49c5-a8e4-0cd2cf9d1635@suse.com>
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

--------------jzOKOhib5KhVMKcA02CVXTau
Content-Type: multipart/mixed; boundary="------------cC0he52szSOhot8ZbCRyuEfi"

--------------cC0he52szSOhot8ZbCRyuEfi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDkuMjQgMDg6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wOS4yMDI0
IDA4OjU2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTYuMDkuMjQgMDg6NTAsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE2LjA5LjIwMjQgMDg6NDcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMNCj4+Pj4g
KysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYw0KPj4+PiBAQCAtNzgsOSArNzgsMTUg
QEAgc3RhdGljIGlubGluZSBpbnQgcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5
c19hZGRyX3QgcCwgc2l6ZV90IHNpemUpDQo+Pj4+ICAgIHsNCj4+Pj4gICAgCXVuc2lnbmVk
IGxvbmcgbmV4dF9iZm4sIHhlbl9wZm4gPSBYRU5fUEZOX0RPV04ocCk7DQo+Pj4+ICAgIAl1
bnNpZ25lZCBpbnQgaSwgbnJfcGFnZXMgPSBYRU5fUEZOX1VQKHhlbl9vZmZzZXRfaW5fcGFn
ZShwKSArIHNpemUpOw0KPj4+PiArCXBoeXNfYWRkcl90IGFsZ24gPSAxVUxMIDw8IChnZXRf
b3JkZXIoc2l6ZSkgKyBQQUdFX1NISUZUKTsNCj4+Pj4gICAgDQo+Pj4+ICAgIAluZXh0X2Jm
biA9IHBmbl90b19iZm4oeGVuX3Bmbik7DQo+Pj4+ICAgIA0KPj4+PiArCS8qIElmIGJ1ZmZl
ciBpcyBwaHlzaWNhbGx5IGFsaWduZWQsIGVuc3VyZSBETUEgYWxpZ25tZW50LiAqLw0KPj4+
PiArCWlmIChJU19BTElHTkVEKHAsIGFsZ24pICYmDQo+Pj4+ICsJICAgICFJU19BTElHTkVE
KG5leHRfYmZuIDw8IFhFTl9QQUdFX1NISUZULCBhbGduKSkNCj4+Pg0KPj4+IEFuZCB0aGlz
IHNoaWZ0IGlzIG5vdCBhdCByaXNrIG9mIGxvc2luZyBiaXRzIG9uIEFybSBMUEFFPw0KPj4N
Cj4+IEZvciBhbGlnbm1lbnQgY2hlY2sgdGhpcyBqdXN0IGRvZXNuJ3QgbWF0dGVyIChhc3N1
bWluZyBYRU5fUEFHRV9TSVpFIGlzDQo+PiBzbWFsbGVyIHRoYW4gNEcpLg0KPiANCj4gT2gs
IHllcyAtIG9mIGNvdXJzZS4gQSAoaHlwb3RoZXRpY2FsPykgc3RyaWN0IG5vLW92ZXJmbG93
IGNoZWNraW5nDQo+IG1vZGUgb2YgdGhlIGtlcm5lbCBtYXkgdGFrZSBpc3N1ZSB0aG91Z2gs
IHNvIG1heWJlIGJldHRlciB0byByaWdodC0NCj4gc2hpZnQgImFsZ24iPw0KDQpObywgdGhp
cyB3b3VsZG4ndCB3b3JrIGluIGNhc2UgYWxnbiA8IFhFTl9QQUdFX1NJWkUuDQoNCg0KSnVl
cmdlbg0K
--------------cC0he52szSOhot8ZbCRyuEfi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cC0he52szSOhot8ZbCRyuEfi--

--------------jzOKOhib5KhVMKcA02CVXTau--

--------------Bnj0g4e6xe239CXhVgCcxQ01
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbn2CEFAwAAAAAACgkQsN6d1ii/Ey8p
/Qf+NLFO0QPQPnmwCSfmzSj0gyX/97Tf/Yfwq69FhG/6glAHr+uNU+pK1dKa/c4NocSLC9q48L3f
WU13bAMlAS0+gtC9fAxvsdRqOh6J87ENiVwZ+F9lJkV5k0SEvZy4V2lHjFPnR/YV6WdYKvqDZnjJ
IsmLQX41APRYsWFYIpj0u30b0EXf7bCnaxtBVw38vwbskeIXQvUOIFxRLafElrtWe9P980hdJVtM
x0j1+25j0LIXNyMw4MxFtu9b75zmZ+BShPMxPY7oygOUscqFLNeW7Cw4pwBTa+mw4hb9WA7mGxvH
Ka/gtYxPjMC0v587ETh8JxOKzZSzc4Vsy4KSP7vBAA==
=yB3F
-----END PGP SIGNATURE-----

--------------Bnj0g4e6xe239CXhVgCcxQ01--

