Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56135B408C4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 17:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106995.1457570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSn2-0004C5-Hd; Tue, 02 Sep 2025 15:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106995.1457570; Tue, 02 Sep 2025 15:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSn2-00049w-Dn; Tue, 02 Sep 2025 15:19:20 +0000
Received: by outflank-mailman (input) for mailman id 1106995;
 Tue, 02 Sep 2025 15:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Hxa=3N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1utSn1-00049q-MR
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 15:19:19 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c4e1a12-8810-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 17:19:09 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b042cc3962aso254051166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 08:19:09 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b01902d0e99sm851709166b.12.2025.09.02.08.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:19:08 -0700 (PDT)
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
X-Inumbo-ID: 2c4e1a12-8810-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756826349; x=1757431149; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ElgHAVVNLwg9OsBq8IQHveis3g0DDocxmjJQYTfPOIY=;
        b=WuXSyoYpY8p7lFPACtVFV76ttnp8LQgkVZnqTtmn7azX8jrSuYccgus2L2f4D1mxxt
         B8RDMlmMq5EtO2D8zB+dw6k0oCD63UQG8vQ6Aa6ALlCWXwYP4hUFtyN5HW/LN2GUjXKs
         6xkU2Lz/We8YxNV5fUH1k6O0k1xfrIv6KuHWbXf0HpYakil0IGJNCevH7BkrO8OheKqt
         Iq5VhyI4s3cewErR9AgiAKYrXTR6M5mXk95srAa3oehdIr0nxv4l9jKcctiIXnYp0h0n
         wkqGeJaR4NiNAcaoBq1QjHXZC/dOMuWeGcES/icUAHXuiXsbix8qDe0sttEzH/OCOfBT
         GAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756826349; x=1757431149;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElgHAVVNLwg9OsBq8IQHveis3g0DDocxmjJQYTfPOIY=;
        b=MAGlayu81SwtTUiSKQGmYlicjpsR3HADIMHnk7CW/AeSd3peBwM8lzOUOgHx/iMAPq
         Ah3F/Nh2g+fOuEvTFzeFEIYTNlZ3cFEt0Xe0Ntmokviu2akfDom92NFzs4/xXfW7mOxS
         9xw6J6tpl9glYCJxXzGLTNL9VSVLqhkifalD6eu1eC8PEE4WYuLbZr3ysX6BbPQMxFji
         rfIWCGmgznDPJQ6VWk5ZtAod9tCxGfAhUztLCRYNqCwKyVwUHevPVNTesnhU9JoBp74i
         JnTD0MiFhIDPZAf/qRUKhOxr4pGfsXynNItZ6INkuv5pdMKe2ajVUzA1U/Zo+hsRLNYg
         rz5w==
X-Forwarded-Encrypted: i=1; AJvYcCWcL3V4Bk0IMZJE6J4YGe6sAvFHVmPHdOkb5GMwaCs08aRHQbWpta8tL1AgjZLrE1L5Rg38S//fCtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY4HW5b463xj6YhaYgk8f9tQQnTgD+nAYf477yMCMX3sk+G92n
	o3oZqSjy8oP7/b2bU2XfEAHN22OdT6u4uCBug586GoR2E9uKWs8aGteJ2HRhJ+SyAioh8zU4wTI
	lccwKJWQ=
X-Gm-Gg: ASbGncsHfcLI0ht1j4hXvDnlGRjCRZFAVp41DyCXFYSQVVGPpwo8tBM5rW8zC4XcfP3
	Lt6CNrOXx49mwById+zUZlYN22hl6YvTbe09Nur2/btnX7bumwrNDcjRCgjUrcGkGFUprKjVz3J
	rO0F45IppT1SfjlYZXmJ0X1R9cc5sjs0oGR6RSjBLKVR+xNI3izs1b+WtIJ1L2DlhDDfHeu57kx
	wO4zheD+Qa7A83Ek3zHd0OIHFoZUCKV4AdFQdLpnAM4DgfJ0858fM6xpwP6CH0vK3y/TxyAq1dn
	bwiF4vxSEAPyK2zRpSPcX5SOS0CPUoxrUxzdbE/N5EKVFxuOPWUE4hRoqwMSkeHlsGl5qljLXOm
	Kma0P4bKi7mj5m1emvKsKxMdrVzRukztYdHeIPUHPZdtzkJGM8mBG7dU5oPJUpFN+Hjs+yz14ku
	bQ1U3wtv1tZOYscb1yaNhoE+56TUmvKv9ZDq6/QW6Ueoxg9QE=
X-Google-Smtp-Source: AGHT+IHK/6t0CUQBqAgl9k1Xj4c34tPnjQ1B0gKcckG8Hg9hf+XEiYscuuNTQQl5ijJKYNRO4dBxOg==
X-Received: by 2002:a17:906:478f:b0:afe:f651:118e with SMTP id a640c23a62f3a-b01d976e713mr1155638966b.49.1756826348657;
        Tue, 02 Sep 2025 08:19:08 -0700 (PDT)
Message-ID: <a2b0108b-261d-4a7d-8148-8b52a837d457@suse.com>
Date: Tue, 2 Sep 2025 17:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Tidy up .gitignore
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QmqWKSwVUpvNzbVpnnIWrbH0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QmqWKSwVUpvNzbVpnnIWrbH0
Content-Type: multipart/mixed; boundary="------------T7ZxjtksbhsgtG0Oyx5opl9z";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <a2b0108b-261d-4a7d-8148-8b52a837d457@suse.com>
Subject: Re: [PATCH 1/2] Tidy up .gitignore
References: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
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

--------------T7ZxjtksbhsgtG0Oyx5opl9z
Content-Type: multipart/mixed; boundary="------------pPPwsi0nefxWAPDidgo06IPJ"

--------------pPPwsi0nefxWAPDidgo06IPJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDkuMjUgMTY6NDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IERyb3AgdW51c2Vk
IG9yIHN0YWxlIGxpbmVzLg0KPiANCj4gICAqIFdoaWxlIGl0J3MgbmVjZXNzYXJ5IHRvIGhh
dmUgLmdpdCBhbmQgLmhnIGluIGVhY2ggb3RoZXJzIGlnbm9yZSBmaWxlcyBpZg0KPiAgICAg
dXNpbmcgbXVsdGlwbGUgU0NNcyAoYXMgd2UgZGlkIGZvciBhIHdoaWxlKSwgdGhleSBzaG91
bGQgbm90IGJlIGluIHRoZWlyDQo+ICAgICBvd24uDQo+IA0KPiAgICogVGhlIGlnbm9yZSBm
b3IgTGliVk5DU2VydmVyKiB3YXMgYWRkZWQgYnkgY29tbWl0IGEwOTBjYTQ5NWU3ZiAoIlZO
QyBwYXN3b3JkDQo+ICAgICBhdXRoZW50aWNhdGlvbiBzdXBwb3J0IGZvciB0aGUgcGFyYXZp
cnQgZnJhbWVidWZmZXIgc2VydmVyLiIpICAoMjAwNikgYnV0DQo+ICAgICB3aXRob3V0IGp1
c3RpZmljYXRpb24gb3IgYW55IG9idmlvdXMgcmVhc29uLg0KPiANCj4gICAqIFRoZSBpZ25v
cmUgZm9yIHRvb2xzL21pc2MvbG93bWVtZCB3YXMgYWRkZWQgaW4gY29tbWl0IGM4MTIyODIw
ODFiYiAoIkxvdw0KPiAgICAgbWVtIHZpcnEgaW5jcmVtZW50YWwgYWRqdXN0bWVudHMiKSAo
MjAxMiksIGJ1dCB4ZW4tbG93bWVtZCAoZnJvbSB0aGUgc2FtZQ0KPiAgICAgYXV0aG9yKSBh
bHJlYWR5IGV4aXN0ZWQgYW5kIHdhcyBpZ25vcmVkIHByb3Blcmx5Lg0KPiANCj4gICAqIHRv
b2xzL2xpYnMvZ3Vlc3QveGNfKiB3ZXJlIGFkZGVkIGluIGNvbW1pdCBhZjZjNzhkOWRjNjgg
KCJ0b29sczogbW92ZQ0KPiAgICAgbGlieGVuY3RybCBiZWxvdyB0b29scy9saWJzIikgZm9y
IGJpc2VjdGliaWxpdHksIGJ1dCBzaG91bGQgaGF2ZSBiZWVuDQo+ICAgICBkcm9wcGVkIGlu
IHRoZSBmb2xsb3dpbmcgY2hhbmdlLCBjb21taXQgZTNkZDYyNGU0ODdjICgidG9vbHMvbGli
eGM6IG1vdmUNCj4gICAgIGxpYnhlbmd1ZXN0IHRvIHRvb2xzL2xpYnMvZ3Vlc3QiKS4NCj4g
DQo+ICAgKiB0b29scy9kZWJ1Z2dlci94ZW5pdHAvIHdhcyBkcm9wcGVkIGluIGNvbW1pdCBl
NTY3OTY0YTU0YjggKCJ0b29sczogZHJvcA0KPiAgICAgaWE2NCBzdXBwb3J0IikgKDIwMTIp
Lg0KPiANCj4gICAqIHRvb2xzL2RlYnVnZ2VyL2dkYi8gd2FzIGRyb3BwZWQgaW4gY29tbWl0
DQo+ICAgICBiYWExYWFlOWNmZGQgKCJ0b29scy9kZWJ1Z2dlci9nZGI6IFJlbW92ZSBnZGIi
KSAoMjAxMCkuDQo+IA0KPiAgICogdG9vbHMvbWlzYy9jcHVwZXJmLyB3YXMgZHJvcHBlZCBp
biBjb21taXQgYWU5NWZkZjY1YTcyICgiW1RPT0xTXSBSZW1vdmUgdGhlDQo+ICAgICAnY3B1
cGVyZicgbWlzYyB0b29sLiIpICAoMjAwNikuDQo+IA0KPiAgICogdG9vbHMvbWlzYy94Y19z
aGFkb3cgd2FzIGRyb3BwZWQgaW4gY29tbWl0IDcxMzMxNDRlM2FiZiAoIlJlbW92ZSB4Y19z
aGFkb3cNCj4gICAgIHRvb2wiKSAoMjAwNykuDQo+IA0KPiAgICogdG9vbHMvbWlzYy94ZW5f
Y3B1cGVyZiB3YXMgZHJvcHBlZCBpbiBjb21taXQgNjBlYmE5YjBkMjY1ICgiRGVsZXRlIHNv
bWUNCj4gICAgIHVudXNlZCB0b29scyIpICgyMDA0KS4NCj4gDQo+ICAgKiB0b29scy9taXNj
L3hlbi10bWVtLWxpc3QtcGFyc2Ugd2FzIGRyb3BwZWQgaW4gY29tbWl0IGM1ODhjMDAyY2Mx
OSAoInRvb2xzOg0KPiAgICAgcmVtb3ZlIHRtZW0gY29kZSBhbmQgY29tbWFuZHMiKSAoMjAx
OCkuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------pPPwsi0nefxWAPDidgo06IPJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pPPwsi0nefxWAPDidgo06IPJ--

--------------T7ZxjtksbhsgtG0Oyx5opl9z--

--------------QmqWKSwVUpvNzbVpnnIWrbH0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi3CusFAwAAAAAACgkQsN6d1ii/Ey9V
YAf8CfUyp8LSIZKyBgLTQ6VlsWMewXJPJZqbRCH+3lJQpY+6rtU+Q46wqVHQs3yYDrrMEnm+m+ce
Pa2jr21NhCzcr7aaRuHwBiZWMxSCCL/VQkJmOARrE1bkFIZPunpOigD7VEL13u+ysrXwXzlGsHGH
SlX18NiQWqpvqMsxbc+dAIwH0s7Ti1K60XAE/5bFFLP6ZHdiuoot3mVJzNQl4inYUQeQbhOptLA+
3BbgIV+X0PfKlVW9VLZ+cH3QkJPp0vwIv78yKrEVjxZMaDcYS0/AQmZn7qBAgX4tkic6SNiM/MfC
O4m4cFp1H95MpNt4vRJ2VdLNCb0I/NKLsFLjTcsYlA==
=2AEN
-----END PGP SIGNATURE-----

--------------QmqWKSwVUpvNzbVpnnIWrbH0--

