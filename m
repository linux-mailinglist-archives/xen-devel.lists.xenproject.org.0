Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADDEA5EFF0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911744.1318146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfDb-0008Ql-Jq; Thu, 13 Mar 2025 09:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911744.1318146; Thu, 13 Mar 2025 09:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfDb-0008Oh-H2; Thu, 13 Mar 2025 09:51:11 +0000
Received: by outflank-mailman (input) for mailman id 911744;
 Thu, 13 Mar 2025 09:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsfDa-0008Ob-4g
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:51:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afdf4ee9-fff0-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 10:51:08 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so123140966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:51:08 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a481absm59285666b.155.2025.03.13.02.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:51:07 -0700 (PDT)
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
X-Inumbo-ID: afdf4ee9-fff0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741859467; x=1742464267; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2AeGXZApBOtFvJ543r87/bk8C9Jux8MAjo/HntMgh9k=;
        b=Dpi2kIWEmujGejlf6iUp3gHFPSO9dyKPjW6ARBWRF80I2ZIH6cCqxpjfTLBYlyY+xc
         dxNFvfRdbAbIynk4I9qOT0a9AyVV3XTxddID4h7+d/0OvY6tgQJJI2l1frww2n2Ajj8F
         rMiLY/nfLoACiBwpIH24E296LRyAkRt8mW96jrS1rRKyFCBmE3KCUIBQXCvYZhQ7hDee
         jd9sXdbI6swHh4oJc+JcIl3SY+kQoefIOaD1xlZbKz6FqnCN8Nu42S4snfjKGyatAkGg
         t/3qeqdt/sKIW1uMeKEW6BgQemKzT9HOndlQKbTqBMtkeCZReMPq397wkTed7VUrHkG2
         tU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741859467; x=1742464267;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AeGXZApBOtFvJ543r87/bk8C9Jux8MAjo/HntMgh9k=;
        b=j/98Z6EI7+SFv1jS1nASGEvJJsh3qqcgJZNje63kYcdhdXADzTDdbMqrRPUGyVNZBg
         f8FWB+ObSb7M2j9JULCRovPmzOhMGjtkQMd+LN3/ZOuKwSjo5KSu0CcztR8eDHSnBsPi
         A/uwGDj7e3P556r4ZLNwDb15ifu9g4gU+9AjQOykWuZLE7nlTf66rq8asjIXq6H5ziv/
         +fAIsKDeEs42lhSWuEvMK41Ak4Er+LiiSIblroKK3D+J3VcX06qW2MdAj5iFArGlZRnp
         fbBQbRa325vcUdsZY3blU5M6gFHec1sE2qZ04ThjSXnWD3+lx9POvRK+ZkLIp+ID4WU4
         o8HQ==
X-Gm-Message-State: AOJu0YxSaxJ2NnkmAyIvpjIRz7BLRdfldybM+ryKZ958t2OhmpHk4/v4
	5BQfoxHOK4FR55g4kA7q/f9bGgYx7Qw3/oaOMMyVO7gktxVeR+DDU9VrtcAU9PY=
X-Gm-Gg: ASbGncsfRLYxLP0wB+SJxUO3TpE6Y/gK3z1WtiqGXYv2spFrOre43T8EM9GhZyDD+Hb
	+gedIovbYjUwUdcZobn3FJhbYeTVNVwvViu73V1m0uj68h5UonYg/2jzqV99svaqHNoexQ8D2xW
	voB5qvCNL9Lbu0245t1KzHnLVJdWv3eupFmLJheUqwVcjraY198wlJ9xL9+yruct1FQZs7q6QI4
	PHefnDXnQXWzaIFhZ2riKWxsJVS8rNfO/rrdoZQUKT7XCwRBlyqErwFfMjwCnMobjpheBrD9yzN
	xOvLz6wn+NnpkDgseg0EB617hRrETBGfXm/RJ4C0ub9BsKvj051MclBs9ybb9mzDDtc9NRGkLa9
	snIqP+62vKpWb/nIRQBsR09I2taQHbqbgTdrFlLsaNbEDs5jd0X/duNkYnfffzJaXdns=
X-Google-Smtp-Source: AGHT+IFQswkzULsBOY/xtMNk7XzAJgv64Zl/6VN6xMS/8ql4eKgH7aZPJPeFMan/gVHbr+EgDWYqjw==
X-Received: by 2002:a17:906:f589:b0:abf:d4a9:a0a5 with SMTP id a640c23a62f3a-ac252f8e28fmr2945925666b.45.1741859467436;
        Thu, 13 Mar 2025 02:51:07 -0700 (PDT)
Message-ID: <ade9e905-f9d5-468c-bad6-acc996378f06@suse.com>
Date: Thu, 13 Mar 2025 10:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: specify numerical values of Xenstore commands
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250312084143.14045-1-jgross@suse.com> <Z9G6dXyhM01MFD_q@l14>
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
In-Reply-To: <Z9G6dXyhM01MFD_q@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Cu0px0tBBM9E5u3crMhU0A5F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Cu0px0tBBM9E5u3crMhU0A5F
Content-Type: multipart/mixed; boundary="------------Sk331VczAEH06yQ5up1KsFog";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ade9e905-f9d5-468c-bad6-acc996378f06@suse.com>
Subject: Re: [PATCH v3] docs: specify numerical values of Xenstore commands
References: <20250312084143.14045-1-jgross@suse.com> <Z9G6dXyhM01MFD_q@l14>
In-Reply-To: <Z9G6dXyhM01MFD_q@l14>
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

--------------Sk331VczAEH06yQ5up1KsFog
Content-Type: multipart/mixed; boundary="------------HMRyQNS7Zti760VX4qsey002"

--------------HMRyQNS7Zti760VX4qsey002
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjUgMTc6NDYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBXZWQsIE1h
ciAxMiwgMjAyNSBhdCAwOTo0MTo0M0FNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQgYi9kb2NzL21pc2MveGVu
c3RvcmUudHh0DQo+PiBpbmRleCA3ZTFmMDMxNTIwLi43MmRiNzNkZWVmIDEwMDY0NA0KPj4g
LS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4gKysrIGIvZG9jcy9taXNjL3hlbnN0
b3JlLnR4dA0KPj4gQEAgLTg2LDYgKzg2LDY3IEBAIHBhcnRzIG9mIHhlbnN0b3JlIGluYWNj
ZXNzaWJsZSB0byBzb21lIGNsaWVudHMuICBJbiBhbnkgY2FzZSBwYXNzaW5nDQo+PiArWFNf
Q09OVFJPTCAgICAgICAgICAgICAgIDAgICAgb3B0aW9uYWwNCj4+ICsgICAgSWYgbm90IHN1
cHBvcnRlZCwgeGVuc3RvcmUtY29udHJvbCBjb21tYW5kIHdpbGwgbm90IHdvcmsuDQo+PiAr
ICAgIFhTX0RFQlVHIGlzIGEgZGVwcmVjYXRlZCBhbGlhcyBvZiBYU19DT05UUk9MLg0KPj4g
K1hTX0RJUkVDVE9SWSAgICAgICAgICAgICAxDQo+PiArWFNfUkVBRCAgICAgICAgICAgICAg
ICAgIDINCj4+ICtYU19HRVRfUEVSTVMgICAgICAgICAgICAgMw0KPiANCj4gVGhpcyBuZXcg
dGFibGUgcHJlZml4IG1lc3NhZ2UgdHlwZSBuYW1lcyB3aXRoICJYU18iLCBidXQgdGhlIHJl
c3Qgb2YgdGhlDQo+IGRvY3VtZW50IGRlc2NyaWJlIGVhY2ggdHlwZSB3aXRob3V0IHRoZSBw
cmVmaXguIElzbid0IGl0IGdvaW5nIHRvIGJlDQo+IGNvbmZ1c2luZywgYW5kIG1ha2UgaXQg
c2xpZ2h0bHkgaGFyZGVyIHRvIGxpbmsgdGhpcyB0YWJsZSB0byByZXN0IG9mIHRoZQ0KPiBk
b2N1bWVudD8gKEkgb2Z0ZW4gc2VhcmNoIGJ5IGZ1bGwgd29yZCwgbGlrZSAnXDxHRVRfUEVS
TVNcPicsIGJlY2F1c2UNCj4gdGhhdCBvbmUga2V5IHN0cm9rZSBpbiB2aW0gJyonLCBzbyBo
YXZpbmcgZGlmZmVyZW50IHByZWZpeCBtYWtlcyBpdA0KPiBoYXJkZXIgdG8gc2VhcmNoKQ0K
DQpRdWVzdGlvbiBpcywgc2hvdWxkIEkgY2hhbmdlIHRoZSB0YWJsZSB0byBkcm9wICJYU18i
LCBvciB0aGUgcmVzdCBkb2N1bWVudA0KdG8gYWRkICJYU18iIGluc3RlYWQ/IEFmdGVyIGFs
bCB4c193aXJlLmggaXMgZGVmaW5pbmcgdGhlIG5hbWVzIHdpdGggIlhTXyIuDQoNCkknbSBz
bGlnaHRseSBsZWFuaW5nIHRvd2FyZHMgYSBwcmVwYXJhdG9yeSBwYXRjaCBhZGRpbmcgIlhT
XyIuDQoNCg0KSnVlcmdlbg0K
--------------HMRyQNS7Zti760VX4qsey002
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HMRyQNS7Zti760VX4qsey002--

--------------Sk331VczAEH06yQ5up1KsFog--

--------------Cu0px0tBBM9E5u3crMhU0A5F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfSqooFAwAAAAAACgkQsN6d1ii/Ey84
3wf9F2SGOaTLaHEUtsBf7wthHlf1rUfetStOsNoE6BYyIsGht3YthCR8rsYlXdi1Ef7noP52rmnV
NnZA0NvaE6oaT1HhDGIa/M7DkeDoQy8SxfE/Vxyx7wHlxY049oP/6rEsgVHm59Myf2KLkzDyfCFg
t8+7Ib40tuPeB9rvBKc4wnIQAAcAmO807Zu6boFOI+Mc5jKHzBjLPVe9k5tZcoBMY4LXWOQrE9tB
5Fuf2cnqTeUxcr4JIGbu+rqyA2igkSsUTmQSds7mgrYrgJuU49pais0LcEtjzr9rZniM5vq4GhpY
VmP6lei0j+0Gyh8oZihvpSOAmZ7WRUqiOV94nVgBbA==
=bD5P
-----END PGP SIGNATURE-----

--------------Cu0px0tBBM9E5u3crMhU0A5F--

