Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED2AA0B0A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972262.1360654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jgb-0006pK-WC; Tue, 29 Apr 2025 12:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972262.1360654; Tue, 29 Apr 2025 12:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jgb-0006mk-TY; Tue, 29 Apr 2025 12:03:41 +0000
Received: by outflank-mailman (input) for mailman id 972262;
 Tue, 29 Apr 2025 12:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cjpo=XP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u9jga-0006me-7C
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:03:40 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbcf53af-24f1-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:03:38 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5f6222c6c4cso9232878a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 05:03:38 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acec4186fd3sm141807066b.82.2025.04.29.05.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 05:03:36 -0700 (PDT)
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
X-Inumbo-ID: fbcf53af-24f1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745928217; x=1746533017; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tWXjCEn9PiseYTn3909SgiiZVnVb4NCLZrhDySo1B8U=;
        b=WSfRytsZgr3HE7HXJib2bwxM4D+RhLeRUOQbuCUpeC/oBfGaUuKHOjqJZj8ywZjFtP
         By2zW8R/7IQ6hGxWCLtupJdLFCLkM7gJTx0xhBoDtAFXQJHUOAn2+7+XgC0RXXzb/5Tz
         Ltkrv+sD0eY0robuF4+a6wlGlhVJ3VZNe+wcWS83eoFCJy/JaD3d+Oz0aTk2ikhmhvSl
         SAI6kcBIk5O9j8hTtkac3U0k9q5/sepD2MH4iU3ShjKvOkv+qMcNPANdu6OzNIULYGw3
         dFG50MxZgvXANONjXSwyAN5Z5W3qAGwTjROi1vCPVmYkqFhhDyo6bKp8qug2TdvcFhR3
         Y27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928217; x=1746533017;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWXjCEn9PiseYTn3909SgiiZVnVb4NCLZrhDySo1B8U=;
        b=HTmIZtgKiJoJYTizgZwwkxXIM7LVEVKJP0ecDtePnX4XHFF8zqBme6ICaH4IvYAYf9
         mxBVytKUybN+F4o2HwBZgXTHZOYQw67w6fEKdJp50Tw3upQOqMaU+gMnhbzA1HoIvQFh
         2+5IKQ4IVe2LR58FpCMwWSd5gMT+HUB2HITu+HVWBTEKKsqN19wWzqJIz1yIIkCPI4dk
         eFzQTPDp27g8BLRCIbCo5lqbbZJUdac1h4Ede2cAEDR3UFbzRFWmcPlfoebnGkvGBegH
         WmD4bTqg/q4n6D1ld162x94S/AHjskQ7U2dbX5EBkuA2rzOBO3hNpW9QNbggAHiPWkRD
         QhCg==
X-Forwarded-Encrypted: i=1; AJvYcCU8U8kFVvVjdkkEcI2lgbGXeS9E5CDVVA2xCLjl+rcmJuRH2bB9C3KbP+z/jWQB8QBYxaJIEQ+cbug=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiO7RPz7QDHeWq70grZDqFOzoWunzURHimDRFcKyYZiCJuOU0+
	1RNRr3NH45d441v3z1Ts7gbNTnRhTh/3YvccxGVtmC6rmCwFnbhF3SEA826KUQ4=
X-Gm-Gg: ASbGncses+8AqKrMB/0e9d8LEluZIZySQxqyyJxAdCzHidLz/mIjm3KB9GxMMaRnrku
	pT+HSbyN1Yo43t8rVeHIviDLjbAXn6Vu927rMjUajsjiaTIK5E1FJOfJqnouvVCmrheo2a8ZaZE
	fyeZzgk8hKslY3jeVM7sV0oRuxvvebotgyLJuJjmb0uEvLlMTs3SDvtdN0IBKiyjRSiEDjvC9Dt
	PiOWeVk1DvpCP2h5UpBYf0AEW7WRGtECSfWS4YBcisZqgcrwgyR+TOSeyTu15msN++2Z7XN06CY
	tw/mxYv/qEfyDeqBjzaVSnsdnnMsWxAkE5kYq04Ri6x5j2e3lBUwf5l5ANJe6BZ6Z6Oid9cbRZ+
	NbtvTKpkAqkC2Y74FgLVunjxRZcZ09wuuq1YW463VIB8owsOlIe7MdeH7YWo//86p9A==
X-Google-Smtp-Source: AGHT+IEokryXB2GYaD6tgtEkjtV6oZQlcQ33iLoZeWv21Bb6GFTYwRXC8MIxBJedwj0OdIvOhPYeBw==
X-Received: by 2002:a17:907:3d93:b0:ace:c3b9:c710 with SMTP id a640c23a62f3a-acec4dffc67mr341266666b.36.1745928217315;
        Tue, 29 Apr 2025 05:03:37 -0700 (PDT)
Message-ID: <50800903-3ade-4cc5-bed3-93c19f605907@suse.com>
Date: Tue, 29 Apr 2025 14:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] tools: remove support for running a guest with
 qemu-traditional
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-3-jgross@suse.com>
 <b51b142f-d534-48f3-b506-c949ed535623@suse.com>
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
In-Reply-To: <b51b142f-d534-48f3-b506-c949ed535623@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FjzEPPCgNIMk0EnbGwYXHRCf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FjzEPPCgNIMk0EnbGwYXHRCf
Content-Type: multipart/mixed; boundary="------------p2okPk0vb0dU0SbNqZqa8Cq0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <50800903-3ade-4cc5-bed3-93c19f605907@suse.com>
Subject: Re: [PATCH v3 2/4] tools: remove support for running a guest with
 qemu-traditional
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-3-jgross@suse.com>
 <b51b142f-d534-48f3-b506-c949ed535623@suse.com>
In-Reply-To: <b51b142f-d534-48f3-b506-c949ed535623@suse.com>
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

--------------p2okPk0vb0dU0SbNqZqa8Cq0
Content-Type: multipart/mixed; boundary="------------KITpn2ECuWijIoVTx0e08Cnj"

--------------KITpn2ECuWijIoVTx0e08Cnj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDQuMjUgMTQ6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wNC4yMDI1
IDEzOjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUv
aHZtbG9hZGVyL01ha2VmaWxlDQo+PiArKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIv
TWFrZWZpbGUNCj4+IEBAIC01OSw2ICs1OSw3IEBAIE9CSlMgKz0gb3B0aW9ucm9tcy5vIDMy
Yml0Ymlvc19zdXBwb3J0Lm8gcm9tYmlvcy5vDQo+PiAgIENGTEFHUyArPSAtREVOQUJMRV9S
T01CSU9TDQo+PiAgIFJPTUJJT1NfUk9NIDo9ICQoUk9NQklPU19ESVIpL0JJT1MtYm9jaHMt
bGF0ZXN0DQo+PiAgIFJPTVMgKz0gJChST01CSU9TX1JPTSkgJChTVERWR0FfUk9NKSAkKENJ
UlJVU1ZHQV9ST00pDQo+PiArRFNEVF9GSUxFUyA9IGRzZHRfYW55Y3B1LmMgZHNkdF8xNWNw
dS5jDQo+PiAgIGVuZGlmDQo+IA0KPiBUbyBiZSByZXNpbGllbnQgdG8gYSByYW5kb20gRFNE
VF9GSUxFUyBpbiB0aGUgZW52aXJvbm1lbnQsIEkgdGhpbmsgeW91IHdhbnQgdG8NCj4gdXNl
ICs9IGhlcmUgYXMgd2VsbCwganVzdCBsaWtlIC4uLg0KPiANCj4+IEBAIC03Niw3ICs3Nyw3
IEBAIHJvbWJpb3Mubzogcm9tcy5pbmMNCj4+ICAgc21iaW9zLm86IENGTEFHUyArPSAtRF9f
U01CSU9TX0RBVEVfXz0iXCIkKFNNQklPU19SRUxfREFURSlcIiINCj4+ICAgDQo+PiAgIEFD
UElfUEFUSCA9IC4uLy4uL2xpYmFjcGkNCj4+IC1EU0RUX0ZJTEVTID0gZHNkdF9hbnljcHUu
YyBkc2R0XzE1Y3B1LmMgZHNkdF9hbnljcHVfcWVtdV94ZW4uYw0KPj4gK0RTRFRfRklMRVMg
Kz0gZHNkdF9hbnljcHVfcWVtdV94ZW4uYw0KPiANCj4gLi4uIHlvdSBoYXZlIGl0IGhlcmUs
IGFuZCBzZXQgdGhlIHZhcmlhYmxlIHRvIG5vdGhpbmcgeWV0IGZ1cnRoZXIgdXAuDQoNCk9r
YXkuDQoNCj4gVGhlbg0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiAjIGh2bWxvYWRlcg0KDQpUaGFua3MsDQoNCg0KSnVlcmdlbg0K
--------------KITpn2ECuWijIoVTx0e08Cnj
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------KITpn2ECuWijIoVTx0e08Cnj--

--------------p2okPk0vb0dU0SbNqZqa8Cq0--

--------------FjzEPPCgNIMk0EnbGwYXHRCf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgQwBgFAwAAAAAACgkQsN6d1ii/Ey8E
bgf9E3hASRrFvG+9fFHJjj0gnkQXM9GqA0qGQvYxXudT77vWqTHiHdkqWqz8+ynPK8ksP4c5HVnH
24q6x+zL3cd2CYgLFqAWZwlutiSwA8JJYBVqmstHoAtX1bSXxuh1agPQyV+qqrC5XgIVj3xLeCXD
yJernwlRx0Vuk25ktCG0vuLdU4g+kj7zD8Qw5qhe7TZxoypHyQpBB7MdY/+DIqlSeHCxGb0D9lvU
mP9wFbNhnv5TaZ+kISf0ZLerf0s2VYyl8wKwugifndNQpSAXdkl5dXVERNSR2+VY68U0SyNBZLVH
mxP0ESUPtdysFNB+Yug8qi8883NYhZs1mOTOZ7BN0w==
=m0fC
-----END PGP SIGNATURE-----

--------------FjzEPPCgNIMk0EnbGwYXHRCf--

