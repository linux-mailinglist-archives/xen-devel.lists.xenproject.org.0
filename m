Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369D9EB56A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852807.1266500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2Wu-0001AV-9e; Tue, 10 Dec 2024 15:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852807.1266500; Tue, 10 Dec 2024 15:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2Wu-000170-6R; Tue, 10 Dec 2024 15:52:08 +0000
Received: by outflank-mailman (input) for mailman id 852807;
 Tue, 10 Dec 2024 15:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2aGN=TD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tL2Ws-00016u-9f
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:52:06 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b427617c-b70e-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 16:52:05 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d2726c0d45so8784016a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:52:05 -0800 (PST)
Received: from ?IPV6:2003:e5:8701:7700:f2d:e3aa:8e9e:99bf?
 (p200300e5870177000f2de3aa8e9e99bf.dip0.t-ipconnect.de.
 [2003:e5:8701:7700:f2d:e3aa:8e9e:99bf])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6260e2c3csm861105866b.182.2024.12.10.07.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:52:04 -0800 (PST)
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
X-Inumbo-ID: b427617c-b70e-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733845925; x=1734450725; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E9W9UjaUHTHPDhOTQbrcnxr4xWiDnouU048thPKHzB4=;
        b=VAyFzosBex0X2K9ZQzedgxok/k4Ric/eIflwsY1UqSzh1bPRXDpV0kc17sJZo4oOOD
         gsmhdX2FDqblGseY59Q9OZx3/iLqMysWJqj5CfLsAbeCzxFPVAodKlPjPIudeac2ewlV
         yM42SJmWWAcyVrOT1xdgx8pMJkWO2zC1KbnzU6ZeDhKxIA2WuBBpbrR9tN10Wklmuans
         0yXmW9GKYfuuFLiIhelm8MEeO0uka/ZaVdx8i4d7bmj+gbWTt6xVNMcZ9KhwhVqUtgYl
         LwVi4spHkKbOlBor/bNhDf3Al2gqZkS2TAFuc59HYWoqpjifF9Indw+OAKp1AkoFqKaW
         Ni+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845925; x=1734450725;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9W9UjaUHTHPDhOTQbrcnxr4xWiDnouU048thPKHzB4=;
        b=KXOwudHc/6KMKbpugMXPKFOG6v4+H9gnBFSD02rVEdCmmIC5+fJC1SH8L60oGVzTCF
         nffYNSHdkOW4uBzMMJJ7c0SHD5j7xuAroMf7vcxv/2E6REaY98hIiuEOGg24nssTihzG
         Dm7fhGDhySbIEVihhGjx1WuN7e4rt2juO43YMmZBvPcOSgrMa6TwE6mzEyzUvVlzkX7Z
         hplvvzCLbXUd/TYWaVHaYVcepnGBzEOHMhdfzGD9ZpmaspcvnuRqqAabVL9+r/AXK6ZR
         EjQi/rB9YPqSt607UBIZX4TQVLZJLc4jRIBLHqwzL5JTpk/j52M6Tfp9tGARUNdmWaWY
         mmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEVBOjMvO7ra7OuDHQ7vzVrf6ZoivoKLeLWzbY64LUzzXKd8gh5aZGyBdQKGwTg3yoYdBjbTN7ZGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQRvAGAQTX3RPAiglBoXRm6/AyWp5ws0NtJjRpCq9iT2CRUJy2
	x3hVEWgmPXZGaQoYCbY2g53QmMsoI+7jVj8dtT9zEwJB+uutMH6G/iICzkoQKVI=
X-Gm-Gg: ASbGncuTZ+t0FqeCmjBdhyt3TASaPT+HLy8r2hbTPDvPH/bi1kd9ckdONZBRpQSiGqj
	NbpvKIv33hCwlrvvyogQWwZGNWmWYYeBKURlSK8owh9T53y8oY1YBLkq3ZMLhql+aAZ16Ilx6mm
	im/BB7HPzZm6FrjFC5iJNyyNg9303dcxvpVjoVdEU4myEmK08XtFLrmFO29vbOMXJIJ9Z9Jyk3I
	vevjA66bxzv+Z2S/MBsTlA4ulE/lPE4ZqYF+3bDnTDnxnMNLxIHUSbiO0RqQ5JYMMNoSn5/ks+X
	q4jjU5pLWW5v9nc8VzuWVpSMND4+LRq8ICkNJUE1+YmeboUVi4hzOzypudFM6ehQp5G8gRRgZZ6
	j
X-Google-Smtp-Source: AGHT+IHlAQsDFneSYZ9EANLPOKRjq8aXRXDlIY5vfZuNEuKGa1z7h5bR2dH9eQzJsXOz7mEfGov9bQ==
X-Received: by 2002:a17:907:7708:b0:aa6:79fa:b475 with SMTP id a640c23a62f3a-aa69cd5b3e7mr489602766b.25.1733845924689;
        Tue, 10 Dec 2024 07:52:04 -0800 (PST)
Message-ID: <30304914-f0c5-4053-ae23-890fa5b8a0c2@suse.com>
Date: Tue, 10 Dec 2024 16:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-6-jgross@suse.com>
 <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
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
In-Reply-To: <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NgzSoGpeRPNOUr4RUIEap0FU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NgzSoGpeRPNOUr4RUIEap0FU
Content-Type: multipart/mixed; boundary="------------WseeoFvbjq7j9Mgw9dxk1Ol0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <30304914-f0c5-4053-ae23-890fa5b8a0c2@suse.com>
Subject: Re: [PATCH v2 5/7] xen: add new domctl get_changed_domain
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-6-jgross@suse.com>
 <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
In-Reply-To: <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
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

--------------WseeoFvbjq7j9Mgw9dxk1Ol0
Content-Type: multipart/mixed; boundary="------------t068PHNO1099a9u0RTSL3SfF"

--------------t068PHNO1099a9u0RTSL3SfF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMTIuMjQgMTg6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMi4yMDI0
IDE0OjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9kb21h
aW4uYw0KPj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPj4gQEAgLTE5Miw2ICsxOTIs
NTQgQEAgc3RhdGljIHZvaWQgZG9tYWluX2NoYW5nZWRfc3RhdGUoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkNCj4+ICAgICAgIHNwaW5fdW5sb2NrKCZkb21fc3RhdGVfY2hhbmdlZF9sb2Nr
KTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgdm9pZCBzZXRfZG9tYWluX3N0YXRlX2lu
Zm8oc3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkN
Cj4+ICt7DQo+PiArICAgIGluZm8tPnN0YXRlID0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9T
VEFURV9FWElTVDsNCj4+ICsgICAgaWYgKCBkLT5pc19zaHV0X2Rvd24gKQ0KPj4gKyAgICAg
ICAgaW5mby0+c3RhdGUgfD0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9TSFVURE9X
TjsNCj4+ICsgICAgaWYgKCBkLT5pc19keWluZyA9PSBET01EWUlOR19kZWFkICkNCj4+ICsg
ICAgICAgIGluZm8tPnN0YXRlIHw9IFhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVfRFlJ
Tkc7DQo+IA0KPiBUaGUgcHVibGljIGNvbnN0YW50IHNheWluZyAiZHlpbmciIGlzbid0IHF1
aXRlIGluIGxpbmUgd2l0aCB0aGUgaW50ZXJuYWwNCj4gY29uc3RhbnQgc2F5aW5nICJkZWFk
Ii4gSXQgbWF5IHdlbGwgYmUgdGhhdCBYZW5zdG9yZSBvbmx5IGNhcmVzIGFib3V0IHRoZQ0K
PiAiZGVhZCIgc3RhdGUsIGJ1dCB0aGVuIGl0IHdvdWxkIGJldHRlciBiZSBuZW1hZWQgdGhp
cyB3YXkgYWxzbyBpbiB0aGUNCj4gcHVibGljIGludGVyZmFjZSwgSSB0aGluay4NCg0KT2th
eSwgSSdsbCByZW5hbWUgaXQgdG8gIlhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVfREVB
RCIuDQoNCj4gDQo+PiArICAgIGluZm8tPnVuaXF1ZV9pZCA9IGQtPnVuaXF1ZV9pZDsNCj4+
ICt9DQo+PiArDQo+PiAraW50IGdldF9kb21haW5fc3RhdGUoc3RydWN0IHhlbl9kb21jdGxf
Z2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywgc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICBkb21pZF90ICpkb21pZCkNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVk
IGludCBkb207DQo+PiArDQo+PiArICAgIG1lbXNldChpbmZvLCAwLCBzaXplb2YoKmluZm8p
KTsNCj4+ICsNCj4+ICsgICAgaWYgKCBkICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgc2V0
X2RvbWFpbl9zdGF0ZV9pbmZvKGluZm8sIGQpOw0KPj4gKw0KPj4gKyAgICAgICAgcmV0dXJu
IDA7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgd2hpbGUgKCAoZG9tID0gZmluZF9maXJz
dF9iaXQoZG9tX3N0YXRlX2NoYW5nZWQsIERPTUlEX01BU0sgKyAxKSkgPA0KPiANCj4gSSBj
YW4ndCBzcG90IGFueSBjaGVjayB0aGF0IGRvbV9zdGF0ZV9jaGFuZ2VkIHdhcyBhY3R1YWxs
eSBhbGxvY2F0ZWQuIEFsc28sDQo+IHVubGlrZSB0aGUgcHVibGljIGhlYWRlciBjb21tZW50
cyBzYXlzLCB0aGUgbmV3IHN1Yi1vcCBsb29rcyB0byBiZSB1c2FibGUNCj4gYnkgX2FueW9u
ZV8gKGVsaWdpYmxlIHByaXZpbGVnZS13aXNlKSBhcyBsb25nIGFzIF9zb21lb25lXyBkaWQg
c2V0IHVwIHRoZQ0KPiB2SVJRLiBUaGVyZSBsb29rcyB0byBldmVuIGJlIGEgcmFjZSBwb3Nz
aWJsZSB3aGVuIGEgIndyb25nIiBjYWxsZXIgdHJpZXMgdG8NCj4gY2FsbCB0aGlzIGF0IGp1
dCB0aGUgInJpZ2h0IiB0aW1lLg0KDQpSaWdodCwgSSdsbCBhZGQgYSBjaGVjayB0aGF0IHRo
ZSBjYWxsaW5nIGRvbWFpbiBpcyByZWdpc3RlcmVkIGZvciB0aGUNCnZJUlEuIEFkZGl0aW9u
YWxseSBJJ2xsIHB1dCBpbiBhbiAiQVNTRVJUKGRvbV9zdGF0ZV9jaGFuZ2VkKTsiLg0KDQo+
IA0KPj4gLS0tIGEveGVuL2NvbW1vbi9kb21jdGwuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9k
b21jdGwuYw0KPj4gQEAgLTI3OCw2ICsyNzgsMTEgQEAgc3RhdGljIHN0cnVjdCB2bnVtYV9p
bmZvICp2bnVtYV9pbml0KGNvbnN0IHN0cnVjdCB4ZW5fZG9tY3RsX3ZudW1hICp1aW5mbywN
Cj4+ICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3Rh
dGljIGJvb2wgaXNfc3RhYmxlX2RvbWN0bCh1aW50MzJfdCBjbWQpDQo+PiArew0KPj4gKyAg
ICByZXR1cm4gY21kID09IFhFTl9ET01DVExfZ2V0X2RvbWFpbl9zdGF0ZTsNCj4+ICt9DQo+
IA0KPiBMaWtlbHkgYmV0dGVyIGFzIHN3aXRjaCgpIGZyb20gdGhlIHZlcnkgYmVnaW5uaW5n
Lg0KPiANCj4+IEBAIC04NjYsNiArODczLDE1IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCj4+ICAgICAgICAgICAg
ICAgICAgIF9fSFlQRVJWSVNPUl9kb21jdGwsICJoIiwgdV9kb21jdGwpOw0KPj4gICAgICAg
ICAgIGJyZWFrOw0KPj4gICANCj4+ICsgICAgY2FzZSBYRU5fRE9NQ1RMX2dldF9kb21haW5f
c3RhdGU6DQo+PiArICAgICAgICByZXQgPSB4c21fZ2V0X2RvbWFpbl9zdGF0ZShYU01fWFNf
UFJJViwgZCk7DQo+PiArICAgICAgICBpZiAoIHJldCApDQo+PiArICAgICAgICAgICAgYnJl
YWs7DQo+PiArDQo+PiArICAgICAgICBjb3B5YmFjayA9IDE7DQo+PiArICAgICAgICByZXQg
PSBnZXRfZG9tYWluX3N0YXRlKCZvcC0+dS5nZXRfZG9tYWluX3N0YXRlLCBkLCAmb3AtPmRv
bWFpbik7DQo+PiArICAgICAgICBicmVhazsNCj4gDQo+IEVzcGVjaWFsbHkgd2l0aCB0aGlz
IGJlaW5nIGEgc3RhYmxlIGludGVyZmFjZSwgc3VyZWx5IHRoZSB0d28gcGFkZGluZyBmaWVs
ZHMNCj4gd2FudCBjaGVja2luZyB0byBiZSB6ZXJvIG9uIGlucHV0ICh0byBwb3NzaWJseSBh
bGxvdyB0aGVpciBmdXR1cmUgdXNlIGZvcg0KPiBzb21ldGhpbmcgaW5wdXQtaXNoKS4gVGhl
biBldmVuIHRoZSBtZW1zZXQoKSBpbiB0aGUgZnVuY3Rpb24gbWF5IG5vdCByZWFsbHkNCj4g
YmUgbmVlZGVkLg0KDQpJJ2xsIGFkZCB0aGUgY2hlY2suIFJlbW92aW5nIHRoZSBtZW1zZXQo
KSBpcyBhIGxpdHRsZSBiaXQgZG91YnRmdWwsIGFzIHRoaXMNCm1pZ2h0IHJlc3VsdCBpbiBs
ZWFraW5nIGh5cGVydmlzb3IgZGF0YSBlLmcuIGluIGNhc2UgYSBkb21haW4gaXNuJ3QgZXhp
c3RpbmcNCih0aGlzIHdpbGwgY29weSB0aGUgaW50ZXJuYWwgc3RydWN0IHRvIHRoZSB1c2Vy
IGV2ZW4gaW4gdGhlIC1FTk9FTlQgY2FzZSkuDQoNCg0KSnVlcmdlbg0K
--------------t068PHNO1099a9u0RTSL3SfF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------t068PHNO1099a9u0RTSL3SfF--

--------------WseeoFvbjq7j9Mgw9dxk1Ol0--

--------------NgzSoGpeRPNOUr4RUIEap0FU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdYY6MFAwAAAAAACgkQsN6d1ii/Ey9X
QQf/X7B+uWzWXCtIq+yztH0nJ/GyeJ0AMZe89LNAFJx8sOxJaDMedYJ51+UjczY8DjRVhi141jEg
qP2dlEsrvnHuVDu5/ZceSJES0MOnAIYxeZ4OTq40t+PPLWZkZ4t7A7oJp3F0rreOb8EvEzly9kzS
lvJu8vPn7Vh7Vrgdws93y9qNtgo6RVAkJH2OqFv9W5zNbR+8yMiFv7p0bgdyUNkiA5ltOOlCLvMC
a50kEA/WBM54xlCduGAduFQ+egBfuIrmlikKvAoqt7HKRXDG1Uniftnw2/iRqMPj17J9NrREkEMB
Z/z0YoWd8BkyFd46ZUxZgtwvGmw64a9WWGXJm3gOBQ==
=mHbd
-----END PGP SIGNATURE-----

--------------NgzSoGpeRPNOUr4RUIEap0FU--

