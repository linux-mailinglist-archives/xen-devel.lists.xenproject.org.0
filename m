Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04EA9F42F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970807.1359387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QCe-00046u-Bw; Mon, 28 Apr 2025 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970807.1359387; Mon, 28 Apr 2025 15:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QCe-00044T-7m; Mon, 28 Apr 2025 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 970807;
 Mon, 28 Apr 2025 15:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WylS=XO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u9QCc-00044I-T0
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:15:26 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9647bea1-2443-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 17:15:15 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ace98258d4bso285141566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 08:15:15 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf8f3dsm625384566b.110.2025.04.28.08.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 08:15:14 -0700 (PDT)
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
X-Inumbo-ID: 9647bea1-2443-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745853315; x=1746458115; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bacVE9/OrhxlPoWqA2TQ2cLpPUSmkdlr6FpjXGtTg1A=;
        b=SNMMgy2/H1XaagReTQ7zpR77LQ1LUgkXWAwqugobkAs2zaU+HxfUSEVic+VbU30tHC
         I0MMSZEqA8BMbqWSF20k6RJh6+pD8FcNIpSdYUZapIAlUykNpZh2jW/uJWT3bvMaWYL6
         MTTuZXa1YyGZXzmUYqoOZCi3rn1QB7SJHtdV1JZ/pPE9nRULwN9+/YSQ+I5qL9feoLDU
         DKXnmQA/y2JgXCbzFTcUxgVNLwCVx9sCvGgj2gHD1Bi8xwDJotFf/AnbFFG85EjPvYZe
         6tU94vBCX6IDZWyMH8jbBJtqPLjmD+3+7BNMou13Oe8m6Hl3ciEma/sXuzdJu0uavYRV
         vd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853315; x=1746458115;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bacVE9/OrhxlPoWqA2TQ2cLpPUSmkdlr6FpjXGtTg1A=;
        b=OizAx8wi1WY/U/Cetee8rGuJe1cmZOWH7gE0hO3adzq/HMdJcuzj3O/A4HknSkHi85
         0O4t2f3060XtjGU1o6eJvQICkhEUs0gHFraO30qa9swxYAi8WXj+mIMlUZuY/BnVrayT
         4K4J/3RuUKVJSPVmC+jToKvBXdYkyfXC7vhg8zo/RBPMgU5jMNd/Nd4BYcrjTG7twh42
         37cBZsFcTjpvFFaH4Jn4MDV1hjQyWyQ6EEdB6omMhkg6VUK9NxN+HXS2PJWPZmndnYUx
         dkmToHJCMoBxeyDPNZQvVGVNBkYxDgjwnjtp2MummK97gMhkodg0lZDCrVtDLL+93MC4
         Zdiw==
X-Gm-Message-State: AOJu0Yx3BZEcgSjjjuvlzbEiAkADh/DUWAkDlWqojwhUkC/9HuxHN02W
	x9n4ZkeS88BJDvnpbwfumujkhtSbhvMrLm+dbrhKoa42phLUPwbQjMlSONc7ogc=
X-Gm-Gg: ASbGncutjiVAiFct/YT6/JQE2/o7lak7LZ0gsDRPzzBTI7S5EIhz89NPzOEmef63ZqA
	8lrOJKpgnVXTxhnXhL7NVVNrlJoe+jbeKYs0AOBbv9dJkpavPbI67ehMUbpXdiIOhV0MsiLnr34
	ky7wG9Ua/T87SMqsXfYxVZwpRbEfH0IBcpS22GHJDQLDLguRMjyA+OhiquKByX6jinrnAyCygIu
	ZSAQNySXwZYeO8NmGhIVEdTjKLP32MXy2DPO+w4DH6Vlal6EONyWegzlo+HfQCXZ38R77qlSIk2
	teFUM8A09qBKBkxE8DheglNOSnNdYbMer69hvFD7lm2QK/oVqgKHdBM1EbdkJ3fy5jTpQmb1fUy
	dEPVSC9W60itlwexXTwfYXOtR8qVPIhIsoiLwvetJKxN7v1wuJydvakHF0U6cDQNsVg==
X-Google-Smtp-Source: AGHT+IHh50gHZvUcOFF0n8DCbzyVUYvqWA9D7Y5fz1urpLPdKzMxQTxT96Oo09xZAEHFu4oDiDT9mw==
X-Received: by 2002:a17:907:7208:b0:ace:3c0b:1965 with SMTP id a640c23a62f3a-acec4eadb28mr9721266b.39.1745853314572;
        Mon, 28 Apr 2025 08:15:14 -0700 (PDT)
Message-ID: <198ec36e-15e3-491a-bd15-d440d9d578da@suse.com>
Date: Mon, 28 Apr 2025 17:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
To: Alejandro Vallejo <agarciav@amd.com>,
 Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
 <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
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
In-Reply-To: <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a2dnIdEuwvnhRyiQxP9xf8t3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a2dnIdEuwvnhRyiQxP9xf8t3
Content-Type: multipart/mixed; boundary="------------x07PnmailfT0AMP9Nqa3zTMo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alejandro Vallejo <agarciav@amd.com>,
 Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Message-ID: <198ec36e-15e3-491a-bd15-d440d9d578da@suse.com>
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
 <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
In-Reply-To: <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
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

--------------x07PnmailfT0AMP9Nqa3zTMo
Content-Type: multipart/mixed; boundary="------------TS7orJfXgfY00xjsobxt25EX"

--------------TS7orJfXgfY00xjsobxt25EX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjUgMTc6MTIsIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPiBPbiBUaHUg
QXByIDI0LCAyMDI1IGF0IDEwOjQxIEFNIEJTVCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+
PiBPbiBUdWUsIEFwciAwOCwgMjAyNSBhdCAwMjozNToyMFBNICswMjAwLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOg0KPj4+IEBAIC0xOTAzLDEwICsxODk0LDcgQEAgaXQgbWF5IGJlIHVzZWZ1
bCB0byByZXF1ZXN0IGEgZGlmZmVyZW50IG9uZSwgbGlrZSBVRUZJLg0KPj4+ICAgDQo+Pj4g
ICA9aXRlbSBCPHJvbWJpb3M+DQo+Pj4gICANCj4+PiAtTG9hZHMgUk9NQklPUywgYSAxNi1i
aXQgeDg2IGNvbXBhdGlibGUgQklPUy4gVGhpcyBpcyB1c2VkIGJ5IGRlZmF1bHQNCj4+PiAt
d2hlbiBCPGRldmljZV9tb2RlbF92ZXJzaW9uPXFlbXUteGVuLXRyYWRpdGlvbmFsPi4gVGhp
cyBpcyB0aGUgb25seSBCSU9TDQo+Pj4gLW9wdGlvbiBzdXBwb3J0ZWQgd2hlbiBCPGRldmlj
ZV9tb2RlbF92ZXJzaW9uPXFlbXUteGVuLXRyYWRpdGlvbmFsPi4gVGhpcyBpcw0KPj4+IC10
aGUgQklPUyB1c2VkIGJ5IGFsbCBwcmV2aW91cyBYZW4gdmVyc2lvbnMuDQo+Pj4gK0xvYWRz
IFJPTUJJT1MsIGEgMTYtYml0IHg4NiBjb21wYXRpYmxlIEJJT1MuDQo+Pg0KPj4gVGhpcyBv
cHRpb24gaXMgbm90IHZhbGlkIGFueW1vcmUsIGxpYnhsIHdpbGwgY29tcGxhaW4gd2l0aDoN
Cj4+ICAgICAgInFlbXUteGVuIGRvZXMgbm90IHN1cHBvcnQgYmlvcz1yb21iaW9zLiINCj4g
DQo+IFNvdW5kcyBsaWtlIGEgZ29vZCB0aW1lIHRvIHJlbW92ZSBiaW9zPXJvbWJpb3MgYWx0
b2dldGhlciBhbmQgc3RyaWN0bHkNCj4gc3VwcG9ydCBiaW9zPXNlYWJpb3Mgb25seSAocGx1
cyB0aGUgb3ZlcnJpZGUpLg0KDQpGaW5lIHdpdGggbWUuDQoNCkJ1dCBwcm9iYWJseSB3ZSBz
aG91bGQgTk9UIGRyb3AgYnVpbGRpbmcgUm9tQklPUywgcmlnaHQ/DQoNCj4+IEFuZCBJIGhh
dmUgbm8gaWRlYSBpZiBpdCBjYW4gd29yayBvbiBub3QsIEkganVzdCBrbm93IHRoYXQgWGVu
U2VydmVyDQo+PiBzdGlsbCB1c2UgUm9tQklPUyB3aXRoIGEgcGF0Y2hlZCBRRU1VLg0KPiAN
Cj4gTm90IFhDUC1uZz8gUmVnYXJkbGVzcywgbm9uZSBvZiB0aGVtIGRvIHNvIHZpYSB4bCBv
ciBsaWJ4bC4NCg0KUmlnaHQuDQoNCg0KSnVlcmdlbg0K
--------------TS7orJfXgfY00xjsobxt25EX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------TS7orJfXgfY00xjsobxt25EX--

--------------x07PnmailfT0AMP9Nqa3zTMo--

--------------a2dnIdEuwvnhRyiQxP9xf8t3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgPm4EFAwAAAAAACgkQsN6d1ii/Ey+x
QwgAhPuecb4+6alra5ON4XwGQaCjT/mNfS8ieLv19U8cM7QYiBQb7gTk3pvN/ezhnodBuIxIa/s+
OXTaCLJuN1MZCdRDq3s7okfkwO5lxZIuN42x/GQ4dXSPS5GTr9Okf+AvJqMqondnJvYbEq+fRV6E
518z+EIm7H4j5fNZeK5w6CM7z/OW00shYNOk1agaUeRY5AS7lL6lAwHgtSe9QO+wccmLfWJOHIYf
9L5f/mWr7x2fg7yQhckBmx/nB2W3BazcbnJcUxcy0Wpxq33I49LAtQd9ezM1R7DcXISgpwweyVy1
XoGr8lYy6y3cuZ4CmC3nlkviIAkoYWEH7Cgz24vhqg==
=4Tte
-----END PGP SIGNATURE-----

--------------a2dnIdEuwvnhRyiQxP9xf8t3--

