Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E01AE8701
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025156.1400815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURPi-0002CZ-48; Wed, 25 Jun 2025 14:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025156.1400815; Wed, 25 Jun 2025 14:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURPi-0002B3-0u; Wed, 25 Jun 2025 14:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1025156;
 Wed, 25 Jun 2025 14:47:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uURPg-0002Ax-Ki
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:47:48 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd0a375-51d3-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 16:47:47 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4536b8c183cso121205e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:47:47 -0700 (PDT)
Received: from ?IPV6:2003:e5:8746:1a00:ff67:e633:2aa8:93ba?
 (p200300e587461a00ff67e6332aa893ba.dip0.t-ipconnect.de.
 [2003:e5:8746:1a00:ff67:e633:2aa8:93ba])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f264esm4758822f8f.47.2025.06.25.07.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:47:46 -0700 (PDT)
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
X-Inumbo-ID: 5bd0a375-51d3-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750862866; x=1751467666; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x9RFIw6wUxqrKC8KklVrEHXXs9oNUzPHaXVEpobsAwY=;
        b=gsHhmklYjFa7v/2eIJ7iaUYOPTxaRYfMfqi6Tmtd5sS5+dKeOPeYXMAtxLfjGJ90wm
         Fl2XaNcCXPTVszhEHr1gZH4UijQ+vno676hRT9lhcfr4WaxH5X/N0k8S5E/mRxSu/hue
         mu0RICn4eSF8QgUJaHmgsG+ncuZwOpCfnOhj5ECzcPe5Klt7uyM4jLGZx0iwj0Yyz52/
         CvH3e9631J1z0VmbrnpCpFBDf8kmel+BYwDoqoybmmevoOUrBDxcQbbNMMfymjifA/uo
         s9awE1r/SqPlpl4vjTxyALpVv4zweK985a0SZDceCojYmIk6p+Iq5IK7Aoyz88spE2cB
         tFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862866; x=1751467666;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9RFIw6wUxqrKC8KklVrEHXXs9oNUzPHaXVEpobsAwY=;
        b=QzPzvKB/1zO1FTOuqpvdqsLJSgC+uPxaox4mLvQU9miEg9sJSR1lHzz3OGeHUP9lSD
         3loiqr8Q6v33GoMSV354PFBgGsjWzKUr1uY5cUPSeYPuviYWGVz4y/C8Wnl74CQNi7Ml
         Rq4pNb2C9qxpTEjZSCLkHX0Q4/tiIzcWrXJl0d2y7sfZwo8PEo4J1ttUJCxKV2vtDrk6
         +4U78GalTG3KMEtV2lkfhRiFADnltA+NX3aLUphL8Vyhv9QTzBCYm/vv3U47OEB11Nvo
         1gLg+i/hTy+X0ysBjLhRONfixTqiTvWMAaYPbjERY9uyI/N3g+2gaIfowg8uoUGgmhPG
         zv0w==
X-Forwarded-Encrypted: i=1; AJvYcCV91lNmaagt18k/8U4XYLrooz9skUxcAflA/BXp/mX+hJdpCgSQbApbygJ72ByJvhf7NKUQbzjpwVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydv3R1KVff8OqPCiRsYZBHNXNo2e7mIzOjHt2MOyEnSYX39SWs
	tZstZyMvavJEjtZhrxeI6+DTXokYp6zBr7HzLmITrmCT3y3OkdT1POCUA3RTd2Z+9Aw=
X-Gm-Gg: ASbGncsdiHvt+lr1YMpps8YJrWCb5k1Oel9ZM3CQvG/s5jj15HO8fFl/VF4zqhXtAnt
	1ydhn8B8IsGpUFHkDJo7mtwefsTsIqoSX63NIp5ktB6jy1VgnzEukQfHOJuxsxDMbZAfHIIzYdG
	FyeLndVegjZs9lfdnTWItT7pNI/Ye7RfJmeN9XDGM/kGWZ0aRq1sbUGe0N/xMGNwrMjjuaOuMEQ
	TSbWL4tsEIQjmcIQMrrSD0iELFtAmukX7jVA3cgzse/X1/bRGR4hl/rxXXG5YJkjOifGyMfQvsD
	BcB81qQT1195aZRr79XW9dHy/dI9HanO/BTSFavY0j6iOKy9Pnj/vcGBDulUnEMYYSdvH6JVuXA
	GvosH4m3taXyJC1fL823eRMsHH8GIaTSC2ovXGUeCvyMRvZPDsXpqQM6/3ELCSxYH4hlhpGzxsg
	uOBKGlaPI+mgw=
X-Google-Smtp-Source: AGHT+IHa7qBvbArMb+KXB+Y4KskDxfPnw+YxQMAp4qBGD2NLYJ7aWSzZ2IOVs6L5wxls3EYlkdhQ2g==
X-Received: by 2002:a05:600c:3541:b0:453:10c1:cb21 with SMTP id 5b1f17b1804b1-45381b8a0d7mr33522775e9.8.1750862866326;
        Wed, 25 Jun 2025 07:47:46 -0700 (PDT)
Message-ID: <6eeb2f5a-3ef1-402f-a56d-3053984bf8f8@suse.com>
Date: Wed, 25 Jun 2025 16:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stubdom/grub: avoid relying on start_info definition
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20250625110843.24840-1-jgross@suse.com>
 <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
 <d18ab226-183c-4c3b-b0e8-6d2aaae953c8@suse.com>
 <e3b5921c-bda5-4a8a-94e4-c65100216b08@citrix.com>
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
In-Reply-To: <e3b5921c-bda5-4a8a-94e4-c65100216b08@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ordGi8MfxLipVyK70PP0rJSW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ordGi8MfxLipVyK70PP0rJSW
Content-Type: multipart/mixed; boundary="------------HAYeLfaIqdZkW3zCm16glos7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
Message-ID: <6eeb2f5a-3ef1-402f-a56d-3053984bf8f8@suse.com>
Subject: Re: [PATCH] stubdom/grub: avoid relying on start_info definition
References: <20250625110843.24840-1-jgross@suse.com>
 <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
 <d18ab226-183c-4c3b-b0e8-6d2aaae953c8@suse.com>
 <e3b5921c-bda5-4a8a-94e4-c65100216b08@citrix.com>
In-Reply-To: <e3b5921c-bda5-4a8a-94e4-c65100216b08@citrix.com>
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

--------------HAYeLfaIqdZkW3zCm16glos7
Content-Type: multipart/mixed; boundary="------------Z4qHNc0BR3WUAaVtue4RInwa"

--------------Z4qHNc0BR3WUAaVtue4RInwa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDYuMjUgMTY6MzAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI1LzA2LzIw
MjUgMzoyOCBwbSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDI1LjA2LjI1IDE2OjIw
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNS4wNi4yMDI1IDEzOjA4LCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOg0KPj4+PiBAQCAtNDMyLDMgKzQzMSwxMCBAQCBvdXQ6DQo+Pj4+ICDC
oMKgwqDCoMKgIGFsbG9jYXRlZCA9IDA7DQo+Pj4+ICDCoMKgwqDCoMKgIHhjX2ludGVyZmFj
ZV9jbG9zZSh4Y19oYW5kbGUgKTsNCj4+Pj4gIMKgIH0NCj4+Pj4gKw0KPj4+PiArc3RhdGlj
IHZvaWQgY2FsbF9zdGFydF9pbmZvX2hvb2soc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQ0K
Pj4+PiArew0KPj4+PiArI3VuZGVmIHN0YXJ0X2luZm8NCj4+Pj4gK8KgwqDCoCBpZiAoIGRv
bS0+YXJjaF9ob29rcy0+c3RhcnRfaW5mbyApDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkb20t
PmFyY2hfaG9va3MtPnN0YXJ0X2luZm8oZG9tKTsNCj4+Pj4gK30NCj4+Pg0KPj4+IE1heWJl
IGFkZCBhIGNvbW1lbnQgYWhlYWQgb2YgdGhlIGZ1bmN0aW9uIGNsYXJpZnlpbmcgdGhhdCBp
dCBvdWdodCB0bw0KPj4+IHJlbWFpbg0KPj4+IGxhc3Q/DQo+Pg0KPj4gR29vZCBpZGVhLg0K
Pj4NCj4+IEknbGwgYWRkOg0KPj4NCj4+IC8qIE5vIHJlZmVyZW5jZXMgdG8gc3RhcnRfaW5m
byBvZiBNaW5pLU9TIGFmdGVyIHRoaXMgZnVuY3Rpb24uICovDQo+IA0KPiBHaXZlbiBob3cg
ZmV3IHVzZXMgb2Ygc3RhcnRfaW5mbyB0aGVyZSBhY3R1YWxseSBhcmUsIGNhbid0IHlvdSBq
dXN0IGRyb3ANCj4gdGhhdCBwaWVjZSBvZiBleHRyZW1lIG9iZnVzY2F0aW9uIGFuZCBtYWtl
IHRoaXMgd29yayBsaWtlIHJlZ3VsYXIgQz8NCg0KSG1tLCB5b3UgbWVhbiBieSB1c2luZyBz
dGFydF9pbmZvX3B0ciBkaXJlY3RseT8NCg0KVGhpcyB3b3VsZCBiZSBwb3NzaWJsZSwgYnV0
IGl0IHdvdWxkIGludHJvZHVjZSBhIHR3by13YXkgZGVwZW5kZW5jeSBiZXR3ZWVuDQp4ZW4u
Z2l0IGFuZCBtaW5pb3MuZ2l0Lg0KDQpSaWdodCBub3cgdGhlIGJ1aWxkIGlzIGJhc2ljYWxs
eSBmaW5lLCBhcyBDb25maWcubWsgZG9lc24ndCByZWZlcmVuY2UgdGhlDQp2YXJpYW50IG9m
IE1pbmktT1MgYnJlYWtpbmcgdG9kYXkncyBncnViLXB2Lg0KDQpBcHBseWluZyBteSBjdXJy
ZW50IHBhdGNoIHRvIGdydWItcHYgd2lsbCBzdGlsbCB3b3JrIHdpdGggdGhlICJvbGQiIE1p
bmktT1MsDQp3aGljaCB0aGVuIGNvdWxkIGJlIHVwZGF0ZWQgdG8gYSBjb21taXQtaWQgY29u
dGFpbmluZyB0aGUgcmVsYXRlZCBNaW5pLU9TDQpwYXRjaCBkZWZpbmluZyBzdGFydF9pbmZv
IGRpZmZlcmVudGx5Lg0KDQpUaGlzIHVwZGF0ZSBzdHJhdGVneSB3b3VsZCBub3QgcmVzdWx0
IGluIGEgc2l0dWF0aW9uIHdoZXJlIHRoZSBidWlsZCBpcyBicm9rZW4sDQp3aGlsZSBtb2Rp
ZnlpbmcgZ3J1Yi1wdiB0byB1c2Ugc3RhcnRfaW5mb19wdHIgZGlyZWN0bHkgaXNuJ3QgcG9z
c2libGUgd2l0aG91dA0KZWl0aGVyIGJyZWFraW5nIHRoZSBidWlsZCBpbiBiZXR3ZWVuICh3
ZSdkIG5lZWQgYSBNaW5pLU9TIHVwZGF0ZSBmb3IgdGhhdCB0bw0KaGF2ZSAiRVhQT1JUX1NZ
TUJPTChzdGFydF9pbmZvX3B0cik7IiBpbmNsdWRlZCksIG9yIGJ5IHRha2luZyBteSBjdXJy
ZW50IHBhdGNoDQphcyBhbiBpbnRlcm1lZGlhdGUgc3RlcCBhbmQgb25seSB0aGVuIHN3aXRj
aCBncnViLXB2IHRvIHVzZSBzdGFydF9pbmZvX3B0ci4NCg0KVGhvdWdodHM/DQoNCg0KSnVl
cmdlbg0K
--------------Z4qHNc0BR3WUAaVtue4RInwa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Z4qHNc0BR3WUAaVtue4RInwa--

--------------HAYeLfaIqdZkW3zCm16glos7--

--------------ordGi8MfxLipVyK70PP0rJSW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhcDBEFAwAAAAAACgkQsN6d1ii/Ey/F
mAf5AePUfJNXbyF8kXda94FeI2iCREuNO33hTE7Hh3kfREVRabwwQgGOeibQzEvh0y3cev3l4Efm
Zf5ONNUCKbNadTBn1AMlRsIyA00udVf2SvJ9CSso6ROeurVO+PMvK5bVPN9u/Gnk4rcacK9+GKFn
6cJ3032sKXdfYeXTRXarOe5cvWCfHH6AW4vHnkj/7wqFET3iRDJ9jgdZ1LpCX7ufh1GO+a30F7Zj
Pos6YDp0Z9hEf8GWVdczX0SpxkjMtBTlC4QK/nBw155lIehbBL6cRIdE9bKSMMttrEjBI5eQOWm8
Qhpt87o25dMr3QnIlyYj2lGxut6HEcNnWkwCJH9Wlg==
=oEhA
-----END PGP SIGNATURE-----

--------------ordGi8MfxLipVyK70PP0rJSW--

