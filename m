Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F5C644B8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:10:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163888.1490934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKz0H-0002Ju-8d; Mon, 17 Nov 2025 13:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163888.1490934; Mon, 17 Nov 2025 13:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKz0H-0002HW-5v; Mon, 17 Nov 2025 13:10:45 +0000
Received: by outflank-mailman (input) for mailman id 1163888;
 Mon, 17 Nov 2025 13:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vKz0F-0002HQ-KR
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:10:43 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfb9884b-c3b6-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 14:10:38 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b3c965df5so2564282f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 05:10:38 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b60csm25637222f8f.22.2025.11.17.05.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:10:37 -0800 (PST)
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
X-Inumbo-ID: cfb9884b-c3b6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763385038; x=1763989838; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VukSc617M9c4pTrd2Qz5kwOcNWcaJJ8FFPz4BpHG88g=;
        b=HAi1Y2UllIyqaKp24FiA5brL8The4tFcT2TL3ECgPd1kq2CzKqmu7X/EFf0YRLQLNJ
         DcXH2FMnHRUlHqqCV4vNdnIcK8kPV9tgxe8lPEj+eEQ4aZ1Mml/2uWmManpHnMfrqfxQ
         JwaoPQ2N3sNYJNX22bGb6Obst4LhLVuYlsPJEKkb7sUC+oJcDHuX3NlW9J/LzGYQBcZU
         tutXaDZEuOXsPhszg6HNEw6/yzMBY0XSkwW/1pg9LGOWBKwfusqRnfMraFesbO2qGrb1
         b19EZ5d+RHibTNiYRSmrSzqJfV5QsvxRR9FWyCWOvH3j/vDTPQdq2/NxEO19J/9i/rcL
         5SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763385038; x=1763989838;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VukSc617M9c4pTrd2Qz5kwOcNWcaJJ8FFPz4BpHG88g=;
        b=qSxCQsRukCWwIxRc1e+3txtaCoguweLl8OGMC1PVT/83FDvrGBfh1hXpqjams9NcBd
         lTcblNB9f66JLCcmlv0DBRpquYYyROFfxDyiRFelEU1nngC2XC0oiqbdgl1XWa0CQw9E
         Hludg3nyH1nr3CslY4ALExi6eLKgVyR2z0A3RO4qokroPVU9GID/QQm7b7HTJzvjMFJi
         rKTMpFQUE9jZEATnrejYkYCQGVX9QpSU/q+rowT4kqJi1O4pTl8rbFEcPX4bMXpvILo0
         qXEKYIWfNQmHMSPHbmr8GDI7pUBQHBURAlgiC1WRJ/nhPkD61FcKIbvi5/NSYoS6/KCV
         nYog==
X-Forwarded-Encrypted: i=1; AJvYcCXwsbySOSAl/nFB6ABQr+B9c/B3wHgUpoDNwHeI8zF4fRkUzbMI9MlDDS+wOCQxR7ymnFy7ZEjm240=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs5/BfrI9n29RzLXLkOootIqvkoOmQ2eS9vRArCZi6jvCaiiP9
	BWd73IcFrU2KcWfa2DuVsU2BiqK9R1vM4/zTguh9vsN9VQ15wAB5y2/q4gDsd/LtuqI=
X-Gm-Gg: ASbGncsAST3uGYE2gn31NyUbKOX0McEP/7kc3mb3McP0N7M3JA+kQKhDKCohxPlxoPr
	e+30OgVwhqzaDTx4ImcpdOKRGuKDxd1wDewGi1lLGV/NUTYE9hVaxHH2puVMI6pTJOBmqCjgzDY
	9EpwoJfI7bPyQ0ye8z1BDIlwu/z5UQnYlVsfVgEkMFTYD4ug6LoZtaCR7T7uJR7aEo+XS/nuMv2
	Ov7t3AoUa+0YbNdxbmIlvJM1XXcNdnt/+JABW3jvLm8xtIowlZUGLRwxt1/pTrJuOMuL5GCOxjW
	cW4OqTDAnB5i/xSs307W5JkkxQ/0ITkE6kzR9xmDcgzhW55GhanU7/MNX3Xb5v1FJcmcPZUJjjO
	EhEeWYjt4RQoQJjc01G+00aVxHlIosIdqXt3bDn4PPclwGbsBj/yRaa2sB7yeZYpKMGpLPK5piC
	MFmdPgs4ZuYoMrj752jPqeWnNwx4xDPfltkAfsx7TLZXW+QJSSHi6w0KzQmtB+s4MlHsYuTttOa
	7KjY8BL9CuxXlkkQ1jPZwCA8B63NMQCK/iNiCYXLXtg5ITdUAuO+uzdhtM4
X-Google-Smtp-Source: AGHT+IFcUX8w0lBDARwl7Tt7X46SP2prbJppAr1qqxH/50OCccBTrlG7DBpwEugWTwbq4mdr3Pewgg==
X-Received: by 2002:a05:6000:26d2:b0:427:167:c2c3 with SMTP id ffacd0b85a97d-42b59398a6fmr11711000f8f.48.1763385037777;
        Mon, 17 Nov 2025 05:10:37 -0800 (PST)
Message-ID: <7ce4dd85-d88d-420d-b6da-9bee9fe61017@suse.com>
Date: Mon, 17 Nov 2025 14:10:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <936632a3-d713-4183-b1db-5a554b617b74@suse.com>
 <7577ceec-1271-4569-91f1-fd7197a33991@suse.com>
 <f42863be-aef8-4a7b-915b-235bd89a8341@suse.com>
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
In-Reply-To: <f42863be-aef8-4a7b-915b-235bd89a8341@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0o8z4I3jvQFR3i6YExUnUPZi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0o8z4I3jvQFR3i6YExUnUPZi
Content-Type: multipart/mixed; boundary="------------DbmIrp4ljiJnQkEUap9d4xpO";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <7ce4dd85-d88d-420d-b6da-9bee9fe61017@suse.com>
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <936632a3-d713-4183-b1db-5a554b617b74@suse.com>
 <7577ceec-1271-4569-91f1-fd7197a33991@suse.com>
 <f42863be-aef8-4a7b-915b-235bd89a8341@suse.com>
In-Reply-To: <f42863be-aef8-4a7b-915b-235bd89a8341@suse.com>
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

--------------DbmIrp4ljiJnQkEUap9d4xpO
Content-Type: multipart/mixed; boundary="------------PGNE6SYQ1MmMa1wO1tpIV6GS"

--------------PGNE6SYQ1MmMa1wO1tpIV6GS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTEuMjUgMTM6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMS4yMDI1
IDEzOjQ4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMTEuMjUgMTM6MjksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE0LjExLjIwMjUgMTI6MzIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL0NvbmZpZy5taw0KPj4+PiArKysgYi9Db25maWcubWsN
Cj4+Pj4gQEAgLTE1OSw2ICsxNTksMTkgQEAgZGVmaW5lIG1vdmUtaWYtY2hhbmdlZA0KPj4+
PiAgICAJaWYgISBjbXAgLXMgJCgxKSAkKDIpOyB0aGVuIG12IC1mICQoMSkgJCgyKTsgZWxz
ZSBybSAtZiAkKDEpOyBmaQ0KPj4+PiAgICBlbmRlZg0KPj4+PiAgICANCj4+Pj4gK1BBVEhf
RklMRVMgOj0gUGF0aHMNCj4+Pj4gK0lOQ19GSUxFUyA6PSAkKGZvcmVhY2ggZiwgJChQQVRI
X0ZJTEVTKSwgJChYRU5fUk9PVCkvY29uZmlnLyQoZikubWspDQo+Pj4+ICsNCj4+Pj4gK2lu
Y2x1ZGUgJChJTkNfRklMRVMpDQo+Pj4NCj4+PiBJcyBhbnkgb2YgdGhlIGFib3ZlIHBhcnQg
b2YgaW50cm9kdWNpbmcgdGhlIG1hY3JvPyAiUGF0aHMiIGlzIGFscmVhZHkgYQ0KPj4+IHNw
ZWNpZmljIGNhc2Ugb2YgaG9sZGluZyBwYXR0ZXJucyB0aGF0IHdhbnQgcmVwbGFjaW5nLiBJ
biB0dXJuIC4uLg0KPj4+DQo+Pj4+ICtCVUlMRF9NQUtFX1ZBUlMgOj0gJChmb3JlYWNoIGYs
ICQoUEFUSF9GSUxFUyksICQoc2hlbGwgYXdrICckJDIgPT0gIjo9IiB7IHByaW50ICQkMTsg
fScgJChYRU5fUk9PVCkvY29uZmlnLyQoZikubWsuaW4pKQ0KPj4+DQo+Pj4gLi4uIGl0J3Mg
bm90IHF1aXRlIGNsZWFyIHRvIG1lIGhvdyBpdCBjYW4gYmUgJChQQVRIX0ZJTEVTKSBoZXJl
Lg0KPj4NCj4+IFNlZSBwYXRjaCA0Lg0KPj4NCj4+IFBBVEhfRklMRVMgaXMgc3BlY2lmeWlu
ZyB0aGUgLm1rIGZpbGVzIGNvbnRhaW5pbmcgdGhlIG1hcmtlciBkZWZpbml0aW9ucy4NCj4+
IEkgbmVlZCB0aGUgYWJpbGl0eSB0byBoYXZlIG11bHRpcGxlIHN1Y2ggZmlsZXMgaW4gb3Jk
ZXIgdG8gYmUgYWJsZSB0byBsZXQNCj4+IHRvb2xzL2NvbmZpZ3VyZSBidWlsZCBpdHMgb3du
IGRlZmluaXRpb25zLg0KPiANCj4gVGhhdCdzIGEgZ29vZCBleGFtcGxlIC0gd2h5IHdvdWxk
IHRoYXQgYWZmZWN0IHRoZSBzdHViZG9tLyBwYXJ0IG9mIHRoZSB0cmVlPw0KPiBJbW8gd2hh
dCBwYXR0ZXJuIGZpbGUocykgdG8gdXNlIHdhbnRzIGxlYXZpbmcgdG8gdGhlIGludm9rZWUg
b2YgdGhlIG1hY3JvLA0KPiBub3QgcGlubmluZyBkb3duIGdsb2JhbGx5IGZvciBldmVyeW9u
ZS4NCg0KWWVzLCBJIGNvdWxkIGFkZCB0aGUgdG9vbHMgc3BlY2lmaWMgbWFya2VyIGZpbGUg
aW4gdGhlIHVzZSBjYXNlcyB1bmRlciB0b29scy4NCg0KVGhlIHF1ZXN0aW9uIGlzIHdoZXRo
ZXIgYWRkaW5nIGl0IHRvIDYgTWFrZWZpbGVzIGlzIHJlYWxseSB3b3J0aCB0aGF0DQpvcHRp
bWl6YXRpb24sIGVzcGVjaWFsbHkgYXMgb25seSBidWlsZGluZyB0aGUgbWFuIGZpbGVzIHdv
dWxkIGJlIGVmZmVjdGVkDQpyaWdodCBub3cgKHdoaWNoIGNvdWxkIGNoYW5nZSBpbiBmdXR1
cmUsIG9mIGNvdXJzZSkuDQoNCg0KSnVlcmdlbg0K
--------------PGNE6SYQ1MmMa1wO1tpIV6GS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------PGNE6SYQ1MmMa1wO1tpIV6GS--

--------------DbmIrp4ljiJnQkEUap9d4xpO--

--------------0o8z4I3jvQFR3i6YExUnUPZi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkbHswFAwAAAAAACgkQsN6d1ii/Ey/t
rgf/cyJi3VZQ235vB6xsXq1/3kH9jMDT6w5pVClotl6t9Y5zn3Uxan4eje5TqOjcLFSvkp31nO9/
7RDYijQaKp1r8KluLfUAhpMzGoAlfWF2uaJknGvBcWQjH6PkpNgkxu4r1GcxezUvYqTH59+2uH2C
9oXWcd2WwwApBBgpYsEm1JxqDPrpsR54QyvT8jocck0JlASbpKmWn/aGF6DWsP0cIBOb4IDNGNS0
bhmIEAb+0PqV0ChBZDZFsSBQeCqBqJqso1Xab6IHhB0Aq6Tj74SjcaTzOzeo4rkCOBc44IU1zRq7
KHD5N3FB8ynDUOyN98bpandP4vEGKanrVZ7orur06g==
=6A3J
-----END PGP SIGNATURE-----

--------------0o8z4I3jvQFR3i6YExUnUPZi--

