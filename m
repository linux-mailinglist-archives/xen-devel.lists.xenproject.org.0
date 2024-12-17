Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E99F4A78
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858895.1271131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNWEf-0006zk-Jx; Tue, 17 Dec 2024 11:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858895.1271131; Tue, 17 Dec 2024 11:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNWEf-0006wa-Ew; Tue, 17 Dec 2024 11:59:33 +0000
Received: by outflank-mailman (input) for mailman id 858895;
 Tue, 17 Dec 2024 11:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNWEe-0006wU-4x
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:59:32 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f1070bc-bc6e-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 12:59:30 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so9061922a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 03:59:30 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d65346456fsm4182149a12.71.2024.12.17.03.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 03:59:29 -0800 (PST)
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
X-Inumbo-ID: 5f1070bc-bc6e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734436769; x=1735041569; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4TK4xsKrBg7l7IKfhFhTEA2zGyreDJOlWm4cabCk6BQ=;
        b=DqpK1mhuY6xUjf/8L63mFJ/cZFMhfr3aiflv/5XHAaStJ5CP0hB6NABLnZrDCQwVqx
         gKmTJBwa91hkdKEvLkAUqd+FQoLESIkuAaHXSV71xlxcJ5OIRaabvQCjyC/RLAYn1/Of
         42DhtxgT0TRhHrxdCGY4kisiWFppJSh5WOdkvCDK6v4kKRITWb6WBVzJbUMEEiTDn8NT
         YqgVlNfl+L9y+OnLiHtR0GOERPshmEwW5p8Wy05YZwi20iiqLAT2q5fr/4ybnUp++iAt
         g6rTymZIGzmozAeej+xA7ODTyMZrTumxqr8KR0nkfQ/Jad/lu6VtYPMZCIqs2UqEUV0M
         x2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436769; x=1735041569;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TK4xsKrBg7l7IKfhFhTEA2zGyreDJOlWm4cabCk6BQ=;
        b=f/YmWKGvdoTfqpEZCCGNfgHPFoHxGdt9GKyw3UhzAFPkm5DldpTMmCXxhu4IDMTjPw
         Om8M2wOWCr7xlJgWa3sYnOKgjR//jPhlWMsXvDPtj41MY74M+W1vRbgFjn1/stKL734b
         RHQbgkWI5VfMx9Zh0EBBFpqV01D9o9Uey58QCm5VUP3CJwvB6KsDdYYwsuwqzaWj3/jK
         yEIe72hHqHuKqNiII8sm8c+ADS3TM+4wB1RIAHB1u7kEIqSJUGPXhiJIUr/DJcX4h+uU
         x2M2KMt382CvZyBdfM8uhFznITkW/xIe0mPzrMHHKlmmK7zWNh9kSWCID2h2X1DD0QSo
         YAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4+udVChMoMpeQ33iGoVCB37vdXjnR//h2vQtK+pBYyJM5hObGpkULLNx8Q398YaPXUXD/1Wo7xI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxwSApDpQm+v1FzzPBW4sRHBmYywn71CnrtAXLce2r+XcHLsCl
	6TDwxDZLLzvx+2bg/4Wbr4rVuo0Dfe7wxfHfUWdh3LOFpuT8+PyPJDxu69zZ76UYStThxa5rObX
	uKT0=
X-Gm-Gg: ASbGnctcv0NvPerVECYSClLY71jgyOjuOrysUfN5IIPWk2uh3Jg/FkrtIBmLafiQYFy
	v0WCPQl7pzduh+OtwlCsqhqZFPAt+20ubOvx4AK0EaMGcAdeP/e5hsoV0ughjj+5DtTXTA5CK3F
	2XJ1nGtH+nHpWecSInKDD/6HjR3go4+YeU6jCICPjS/wlw2PxlVcwTtUPWnV6NT6iSM9Psys303
	m1ggmUeu2TJGx4m/01acLPpDZqu6w46jE7kUy0wpKbpVRJSOzK4DdFbT0VmcSK188kiyA1NjgnS
	rEeMhlONBsZfw0loRwLO8A6TziUABeUXId4Nki5AvQfzp5JwkfcMSPOc8DlnP2KJibSldtBr73h
	9OHjQbQ==
X-Google-Smtp-Source: AGHT+IGWR78OD3BAYl6jvbazy60DXDZ0u61C7S0+bTIFvVxoz4MNRXo2ntKpHFaUXz7HhefyMNeCQQ==
X-Received: by 2002:a05:6402:3805:b0:5cf:b079:68ef with SMTP id 4fb4d7f45d1cf-5d7d40dbdf3mr2954190a12.26.1734436769354;
        Tue, 17 Dec 2024 03:59:29 -0800 (PST)
Message-ID: <f681d00f-6ef6-41c6-bf3c-ad2dfd6da183@suse.com>
Date: Tue, 17 Dec 2024 12:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217111247.2204-1-jgross@suse.com>
 <20241217111247.2204-3-jgross@suse.com>
 <c2b9fb7a-cb45-4914-9d74-5933317737d3@suse.com>
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
In-Reply-To: <c2b9fb7a-cb45-4914-9d74-5933317737d3@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a3tcmIthmmlNBa0m1S4JBYwb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a3tcmIthmmlNBa0m1S4JBYwb
Content-Type: multipart/mixed; boundary="------------VvILjMkBX5lM01rk369AgU7j";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <f681d00f-6ef6-41c6-bf3c-ad2dfd6da183@suse.com>
Subject: Re: [PATCH v4 2/5] xen: add bitmap to indicate per-domain state
 changes
References: <20241217111247.2204-1-jgross@suse.com>
 <20241217111247.2204-3-jgross@suse.com>
 <c2b9fb7a-cb45-4914-9d74-5933317737d3@suse.com>
In-Reply-To: <c2b9fb7a-cb45-4914-9d74-5933317737d3@suse.com>
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

--------------VvILjMkBX5lM01rk369AgU7j
Content-Type: multipart/mixed; boundary="------------oh10exoWoyLLAwwSKsINQC6l"

--------------oh10exoWoyLLAwwSKsINQC6l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTIuMjQgMTI6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMi4yMDI0
IDEyOjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVjQ6DQo+PiAtIGFkZCBfX3JlYWRf
bW9zdGx5IChKYW4gQmV1bGljaCkNCj4+IC0gdXNlIF9fc2V0X2JpeigpIChKYW4gQmV1bGlj
aCkNCj4+IC0gZml4IGVycm9yIGhhbmRsaW5nIGluIGV2dGNobl9iaW5kX3ZpcnEoKSAoSmFu
IEJldWxpY2gpDQo+IA0KPiBJJ20gc29ycnksIEkgc2hvdWxkIGhhdmUgc3BvdHRlZCBhIDJu
ZCBpc3N1ZSBhbHJlYWR5IHdoZW4gcmV2aWV3aW5nIHYzIChvcg0KPiBldmVuIGFuIGVhcmxp
ZXIgdmVyc2lvbikuDQo+IA0KPj4gQEAgLTEzOCw2ICsxMzksNjAgQEAgYm9vbCBfX3JlYWRf
bW9zdGx5IHZtdHJhY2VfYXZhaWxhYmxlOw0KPj4gICANCj4+ICAgYm9vbCBfX3JlYWRfbW9z
dGx5IHZwbXVfaXNfYXZhaWxhYmxlOw0KPj4gICANCj4+ICtzdGF0aWMgREVGSU5FX1NQSU5M
T0NLKGRvbV9zdGF0ZV9jaGFuZ2VkX2xvY2spOw0KPj4gK3N0YXRpYyB1bnNpZ25lZCBsb25n
ICpfX3JlYWRfbW9zdGx5IGRvbV9zdGF0ZV9jaGFuZ2VkOw0KPj4gKw0KPj4gK2ludCBkb21h
aW5faW5pdF9zdGF0ZXModm9pZCkNCj4+ICt7DQo+PiArICAgIGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQ7DQo+PiArICAgIGludCByYyA9IC1FTk9NRU07DQo+PiArDQo+PiArICAgIHNwaW5f
bG9jaygmZG9tX3N0YXRlX2NoYW5nZWRfbG9jayk7DQo+PiArDQo+PiArICAgIGlmICggZG9t
X3N0YXRlX2NoYW5nZWQgKQ0KPj4gKyAgICAgICAgYml0bWFwX3plcm8oZG9tX3N0YXRlX2No
YW5nZWQsIERPTUlEX0ZJUlNUX1JFU0VSVkVEKTsNCj4gDQo+IFRoaXMgbmVlZHMgdG8gbm90
IGhhcHBlbiB3aGVuIC4uLg0KPiANCj4+IEBAIC00ODUsMTEgKzQ4NiwyMSBAQCBpbnQgZXZ0
Y2huX2JpbmRfdmlycShldnRjaG5fYmluZF92aXJxX3QgKmJpbmQsIGV2dGNobl9wb3J0X3Qg
cG9ydCkNCj4+ICAgICAgIGlmICggKHYgPSBkb21haW5fdmNwdShkLCB2Y3B1KSkgPT0gTlVM
TCApDQo+PiAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7DQo+PiAgIA0KPj4gKyAgICBpZiAo
IHZpcnEgPT0gVklSUV9ET01fRVhDICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcmMgPSBk
b21haW5faW5pdF9zdGF0ZXMoKTsNCj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAg
ICAgICAgIHJldHVybiByYzsNCj4+ICsNCj4+ICsgICAgICAgIGRlaW5pdF9pZl9lcnIgPSB0
cnVlOw0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgICB3cml0ZV9sb2NrKCZkLT5ldmVudF9s
b2NrKTsNCj4+ICAgDQo+PiAgICAgICBpZiAoIHJlYWRfYXRvbWljKCZ2LT52aXJxX3RvX2V2
dGNoblt2aXJxXSkgKQ0KPj4gICAgICAgew0KPj4gICAgICAgICAgIHJjID0gLUVFWElTVDsN
Cj4+ICsgICAgICAgIGRlaW5pdF9pZl9lcnIgPSBmYWxzZTsNCj4+ICAgICAgICAgICBnZHBy
aW50ayhYRU5MT0dfV0FSTklORywgIkVWVENITk9QIGZhaWx1cmU6IGVycm9yICVkXG4iLCBy
Yyk7DQo+PiAgICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgICB9DQo+IA0KPiAuLi4gd2Ug
dGFrZSB0aGlzIGVycm9yIHBhdGguIFdoaWNoIEkgdGhpbmsgY2FsbHMgZm9yIG1vdmluZyB0
aGUNCj4gZG9tYWluX2luaXRfc3RhdGVzKCkgaW52b2NhdGlvbiAuLi4NCj4gDQo+PiBAQCAt
NTI3LDYgKzUzOCw5IEBAIGludCBldnRjaG5fYmluZF92aXJxKGV2dGNobl9iaW5kX3ZpcnFf
dCAqYmluZCwgZXZ0Y2huX3BvcnRfdCBwb3J0KQ0KPj4gICAgb3V0Og0KPj4gICAgICAgd3Jp
dGVfdW5sb2NrKCZkLT5ldmVudF9sb2NrKTsNCj4+ICAgDQo+PiArICAgIGlmICggcmMgJiYg
ZGVpbml0X2lmX2VyciApDQo+PiArICAgICAgICBkb21haW5fZGVpbml0X3N0YXRlcygpOw0K
Pj4gKw0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+IA0KPiAuLi4gc29tZXdoZXJl
IGhlcmUuIEl0IHJlYWxseSBkb2Vzbid0IG5lZWQgZG9pbmcgZWFybHksIGFzIHRoZSBjYWxs
ZXINCj4gbWF5IGFzc3VtZSB0aGUgYml0bWFwIHdhcyBzZXQgdXAgb25seSB3aGVuIHRoaXMg
aHlwZXJjYWxsIHJldHVybnMNCj4gc3VjY2Vzc2Z1bGx5Lg0KDQpPVE9IIHRoaXMgd2lsbCBy
ZXF1aXJlIHVuZG9pbmcgdGhlIGJpbmRpbmcgb2YgdGhlIHZpcnEgaW4gY2FzZSBvZiBhbg0K
ZXJyb3IgcmV0dXJuZWQgYnkgZG9tYWluX2luaXRfc3RhdGVzKCkuDQoNCkl0IHdvdWxkIHBy
b2JhYmx5IGJlIGJlc3QgdG8gcGxhY2UgdGhlIGNhbGwgb2YgZG9tYWluX2luaXRfc3RhdGVz
KCkNCmFmdGVyIHRoZSAtRUVYSVNUIGNhc2UuDQoNCg0KSnVlcmdlbg0K
--------------oh10exoWoyLLAwwSKsINQC6l
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oh10exoWoyLLAwwSKsINQC6l--

--------------VvILjMkBX5lM01rk369AgU7j--

--------------a3tcmIthmmlNBa0m1S4JBYwb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdhZ6AFAwAAAAAACgkQsN6d1ii/Ey97
Wwf/Y77M4zphV+LssDNJNIr4Nf5fgQxrA/RiNJEh4g+6GY2Tyv+CpH5a7PG50Nc44rGoIbplGJiP
t1urGHoRWRZ++FbHl4KtBXf8isARGt/70nzYmDODkXG/+TWqUyC/dbaDRKfDxXeV3t7/rfwjjpwU
62jINR3oQQ5iQCWeZOeRw/lBjICfStLEYIKigA4FYc9XmrDKsmtg3m2Wnra4gVaDu+uKzZYzZIEs
wHqA/EX78v7Oerm/RBZbllF/6agKZH5B/ERfo3LZ1d0AT9O7ZaTNXUZ42boz7Kya1yu4oNiKOvgc
DtGr31NPaC+5JD485ddQWFrrQSeukPl0YLbaLrajCQ==
=a9EA
-----END PGP SIGNATURE-----

--------------a3tcmIthmmlNBa0m1S4JBYwb--

