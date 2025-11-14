Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BDC5D38A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 14:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162634.1490208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtST-0004ve-Er; Fri, 14 Nov 2025 13:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162634.1490208; Fri, 14 Nov 2025 13:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtST-0004sX-B5; Fri, 14 Nov 2025 13:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1162634;
 Fri, 14 Nov 2025 13:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJtSS-0004rC-90
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 13:03:20 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ae83a94-c15a-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 14:03:19 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so239889966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 05:03:19 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8bc8sm384694466b.49.2025.11.14.05.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 05:03:18 -0800 (PST)
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
X-Inumbo-ID: 4ae83a94-c15a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763125399; x=1763730199; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2rRN6feC+uysqXsLSRlwFV0VtBW24DkCMBbwS+u0G8=;
        b=DjiyrIvZnCe81F8iEpGQbFHgyzdgctb2F69wUWseJZZ1TtPSmnjn5IDe+N+wHo84sm
         oXnepHl0WGhRJk5RU9lOjKlqsBt7aSdytqFE2vy3YmbFqQ8IGzJDheQo7yknbLVQ0Lho
         WtGNQGJf87XliFTnTG7atz39GKexVtX4A6EP9zd/blH7HY68V1hZtULVjKBgS0OlEo+N
         teuBZXSLW4ej96mqBiVmD388iX5+CkRXE50XuqlDIbYGPMEAVrwVWLIFgNrDXibPOlNU
         DeqHicdOETXyHxPXAGN1okwULUn2SvqK3mW681tca7AYexZDs7vL2swbloYPA+vgs1cM
         lu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125399; x=1763730199;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2rRN6feC+uysqXsLSRlwFV0VtBW24DkCMBbwS+u0G8=;
        b=aKO46eUeRzap+v7IKn5Oxm1th8E2Cv0jzy0jhLeLpBKEP5opJT1Fw0MNmiXKBG4zsb
         ethPImallUCEH3KuWMpGugRDoLMWvtMSAEYqI4ORxggxHV3NyqKy17a2DH4bmiYtPDmd
         o2S96UMYHCZYSjHOzCeBTfmm5v+FqYIgXR0lF62SYf8KLAWbYuCl4IHCiGv+vmG6FBeS
         qXF2I50z3T4IEXhF/NV1CexI7qVaHZVF/FqZLRlAbWvwy64v04iWEtVeyhS3SKKBt9ax
         vDyrJdpZ/h8cKQn80uoZOmTGnZm+mWy6tn6K0xC4++uV2CfL04WBUA9s/2KNEF2d4mn3
         WhoA==
X-Forwarded-Encrypted: i=1; AJvYcCWXuQHcqN8EBdaTzV5LrTQupWAtAXfWxKh/+UBRqplWr8J99uXpagJfGIhiQfmtXGhTLrrdu/hi+oQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDKaEYwbsCpcVo1QFwoKPtTtityGF5dKwp41c0tXqs8OMhazql
	GwN2lYDa5fBqArY8mQ9p5CTVfhPIg5PoezqdnvoLrbbePf8gvhY/WDZkoaUn59O0EzA=
X-Gm-Gg: ASbGnctrdfBd+X5kPzv4XT1AMK3KlUlVqhirpcXMRAchBlsA9N+/8B8WE40gSBre5/z
	pF3iNuzQD91cRtbjXaVzcFQB6mmEy1XqpmEOJipBjBXDtnOeFQPa7K/9mFfsDUBoSY1ctZnE1CF
	B1TlJvx2Z1c/oXKKeGiXJi6n64nUYtVMoh+fTV+gkVPQRE/rOiKfYFLAhEs6E/5xgbbOiCzi7Iq
	KJGMMJwes6Tepd/5IkJN76D/szXz9Keprd+3AgoH0o8fly2MGL6qCFYYO5L++hH5wetQdNSwcXK
	y6qI7t3QFgbe2K4i+FscCNURjNuhK1C8VlVH+2l4vxPI/ba21wdg9EWMZ4uydGbWwsgGChN40FK
	R/3M87FOgQLxMIh8HKFxHDE1ZMWtuPbse7kwXE6SAJDoqBgdXpkYvvg/esGDBrpq/l4VWwijJEi
	qZawo4a6fQqllvrOorpUvhq0aF41wC1AaoMwAdc8bKJRNVMG+ub0XWDLuB2cPr1g0fMJ2EFzr1c
	2qm7grhoHjzCQoSPanEm+5iJtS0FSQ763/U+KI=
X-Google-Smtp-Source: AGHT+IFZQ8R+RqV56yQCe3/GeBPCXB00/du3PJwWO1eIBjJO/3mJ0mwPcE+RQ4a3LNqx4qxOIecgKA==
X-Received: by 2002:a17:907:3f0a:b0:b6d:2c75:3c57 with SMTP id a640c23a62f3a-b736793d1c3mr286585766b.39.1763125399066;
        Fri, 14 Nov 2025 05:03:19 -0800 (PST)
Message-ID: <b2983c1d-03dc-485e-90ec-b668b85a25be@suse.com>
Date: Fri, 14 Nov 2025 14:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools: replace @xxx@ markers at build time
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-5-jgross@suse.com>
 <d558864b-baa7-4262-9336-1f3362d7924b@citrix.com>
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
In-Reply-To: <d558864b-baa7-4262-9336-1f3362d7924b@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uolDbVnRHSsRh0Dwger6DirP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uolDbVnRHSsRh0Dwger6DirP
Content-Type: multipart/mixed; boundary="------------8CHRWZrVM1gEC88ajEbDYMkE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Message-ID: <b2983c1d-03dc-485e-90ec-b668b85a25be@suse.com>
Subject: Re: [PATCH v2 4/4] tools: replace @xxx@ markers at build time
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-5-jgross@suse.com>
 <d558864b-baa7-4262-9336-1f3362d7924b@citrix.com>
In-Reply-To: <d558864b-baa7-4262-9336-1f3362d7924b@citrix.com>
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

--------------8CHRWZrVM1gEC88ajEbDYMkE
Content-Type: multipart/mixed; boundary="------------Wft5o6WzSOvs6FA74ea8HkzC"

--------------Wft5o6WzSOvs6FA74ea8HkzC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjUgMTI6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE0LzExLzIw
MjUgMTE6MzIgYW0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMvaG90cGx1Zy9GcmVlQlNEL01ha2VmaWxlIGIvdG9vbHMvaG90cGx1Zy9GcmVlQlNEL01h
a2VmaWxlDQo+PiBpbmRleCBhNjU1MmM5ODg0Li44ZGU5MjM3ODFjIDEwMDY0NA0KPj4gLS0t
IGEvdG9vbHMvaG90cGx1Zy9GcmVlQlNEL01ha2VmaWxlDQo+PiArKysgYi90b29scy9ob3Rw
bHVnL0ZyZWVCU0QvTWFrZWZpbGUNCj4+IEBAIC01MSwzICs1NSw0IEBAIGNsZWFuOg0KPj4g
ICANCj4+ICAgLlBIT05ZOiBkaXN0Y2xlYW4NCj4+ICAgZGlzdGNsZWFuOiBjbGVhbg0KPj4g
KwlybSAtcmYgJChJTl9GSUxFUykNCj4gDQo+IEluIGFkZGl0aW9uIHRvIHRoZSBwb2ludHMg
aW4gcGF0Y2ggMiwgY2FuIHdlIHVzZSAkKFJNKSAod2hpY2ggaW5jbHVkZXMNCj4gLWYgSUlS
Qykgd2hlbiBhZGRpbmcgdGhlc2UuwqAgTm9uZSBvZiB0aGUgZ2VuZXJhdGVkIGZpbGVzIGFy
ZQ0KPiBkaXJlY3Rvcmllcywgc28gdGhlIC1yIHdhbnRzIGRyb3BwaW5nLg0KDQpPa2F5Lg0K
DQo+IA0KPiBCdXQgYWdhaW4sIHRoaXMgaXMgZmFyIG5pY2VyIHRoYW4gdjEgb3ZlcmFsbC4N
Cj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9NYWtlZmlsZSBiL3Rv
b2xzL2hvdHBsdWcvTGludXgvTWFrZWZpbGUNCj4+IGluZGV4IDlhN2IzYTM1MTUuLjZmY2Y4
NGE2ZjQgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9ob3RwbHVnL0xpbnV4L01ha2VmaWxlDQo+
PiArKysgYi90b29scy9ob3RwbHVnL0xpbnV4L01ha2VmaWxlDQo+PiBAQCAtMzcsNyArNDQs
NyBAQCB1bmluc3RhbGw6IHVuaW5zdGFsbC1pbml0ZCB1bmluc3RhbGwtc2NyaXB0cyBzdWJk
aXJzLXVuaW5zdGFsbA0KPj4gICANCj4+ICAgIyBTZWUgZG9jcy9taXNjL2Rpc3Ryb19tYXBw
aW5nLnR4dCBmb3IgSU5JVERfRElSIGxvY2F0aW9uDQo+PiAgIC5QSE9OWTogaW5zdGFsbC1p
bml0ZA0KPj4gLWluc3RhbGwtaW5pdGQ6DQo+PiAraW5zdGFsbC1pbml0ZDogJChJTl9GSUxF
UykNCj4+ICAgCSQoSU5TVEFMTF9ESVIpICQoREVTVERJUikkKElOSVREX0RJUikNCj4+ICAg
CSQoSU5TVEFMTF9ESVIpICQoREVTVERJUikkKFNZU0NPTkZJR19ESVIpDQo+PiAgIAkkKElO
U1RBTExfRElSKSAkKERFU1RESVIpJChMSUJFWEVDX0JJTikNCj4gDQo+IEhtbS7CoCBMb2dp
Y2FsbHksIGdlbmVyYXRpbmcgdGhlIGZpbGVzIHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBidWls
ZCBzdGVwLA0KPiBub3QgdGhlIGluc3RhbGwgc3RlcC4NCg0KQWdyZWVkLiBXaWxsIGNoYW5n
ZSB0aGlzLg0KDQoNCkp1ZXJnZW4NCg==
--------------Wft5o6WzSOvs6FA74ea8HkzC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Wft5o6WzSOvs6FA74ea8HkzC--

--------------8CHRWZrVM1gEC88ajEbDYMkE--

--------------uolDbVnRHSsRh0Dwger6DirP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkXKJYFAwAAAAAACgkQsN6d1ii/Ey+a
EAgAkYyPSTBJQYmdk/465wplP6G9A9OWjylDMsUk5qDUHHernZEQXe43rKBXpMGAINg6IZ4IDG5s
0OG/c79v6jHR4u4JeG5rRyjls7GI4GOS6xaGt7OpV2sbkDDzqGV2vJm53+nDVnQ14WVF4/t2McsM
QVSZcBsygCkn8yeQPp95px2WMfmUze4nXDjsrIfWdt+nZPhpuMNBftqk8W4/JGa3pOQlYAch5B1W
+UbTS50XyyG1i3pjB+J1/Yxyo33nUTcb6TA5ZiahkFFMqOHCLZ/c0afMO7/9TqLt3pn/bKytiMFk
5VjYwcouxKdPztA2g+Md7/Vv0QGrKNtcdnaZcQ53oA==
=Ap3S
-----END PGP SIGNATURE-----

--------------uolDbVnRHSsRh0Dwger6DirP--

