Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C30AA54353
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 08:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902993.1310909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq5MZ-0006tI-Ty; Thu, 06 Mar 2025 07:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902993.1310909; Thu, 06 Mar 2025 07:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq5MZ-0006rQ-Qo; Thu, 06 Mar 2025 07:09:47 +0000
Received: by outflank-mailman (input) for mailman id 902993;
 Thu, 06 Mar 2025 07:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tq5MY-0006rK-04
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 07:09:46 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faa88359-fa59-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 08:09:44 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abf42913e95so43210966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 23:09:44 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2399d850esm45331366b.173.2025.03.05.23.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 23:09:42 -0800 (PST)
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
X-Inumbo-ID: faa88359-fa59-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741244983; x=1741849783; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NbQ9DiymrmZGpBANa7X6pG8OHXwWH4G7l1LpOcecpWU=;
        b=d1a/WNz1oF4NJg6JvDQr0rUUgshCy0Z95nsL4c7gfnbgokOKOEsi/ubMXZWP39wWm2
         DRL98yI3TvoNIbd2OVxItePmLs/4mqufciSGgLfuGkAWbyJKZAAsyVuipWI/RII1htQG
         LuuDFwQ9MsuQDmuU2L9MkPbIWb8qz+GmLaXdEjjzjeDIoZ9amEGRStplPGHpCNW+e8Lq
         nY+7qAcjXEruf1LwgAfywefrGREtfcqw7+9ITyW18ldYK0qrNWiHL9VMx3TaMC/ysHfb
         L3bHfF4pJDfIF3XH8XmyOzItoP4KQaR1WCxGroItVquZqC3g7nCi8ijOiItJciJcSpu8
         a0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741244983; x=1741849783;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbQ9DiymrmZGpBANa7X6pG8OHXwWH4G7l1LpOcecpWU=;
        b=sLN38d19LfATDxuerRzpNXAEyrFy1vIE08so/czxPA7A2kL7J6QWsNbW8yhN2PfatA
         4fmsDf2vL5Uh5IzxGJD2vvaZc8y2hL66ES9eO0uyrNixHvSsFdPUeWAcimqKctWkrQc3
         M0Z7pUqUt9AlL7LI69shW4q6+7/cB498ri7elbC+aDKZ7njS0KI7b5y+gf/V6mJDrfSu
         x919OB5S+xn5go/DdFj9YW9xnXXezmyDa3Ub6bAko5W5XmkjGxCcUTuJ3rSArDkxqWEr
         6nfAdnaOe7w9ykTKww0XJtYi5wSOr1gnu+ClT3l9oB+UuXkbpt3zpaijQKKlh2w6Cnwe
         M7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD+x6J+A+Y6aOyWQ6jn3pLQpKbT5Od6/t4PcmSpQC19NC2XhyXfp4BtKJ7/Q2+lUAzP63g6vz3SZk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQp4vO83cAJ4Vyj11eI66XmSfj1RCzin/UNexmyYWOz2aSztFm
	mfWnrBDWHXgGBzyUFjlxaf1GVyzNpFBx4/VPvR4suDONrukGlWYXKSAdnp099mI=
X-Gm-Gg: ASbGnctSO5SxGA+mxlo8wRs+4giiK/V6ajA90wQ3hdgJkWWHbSgCMh1048/FIeXrOuu
	+hBywm0jm+WyziWkNE9wQTgd3zon0dMWd3889nez/8OmgzwnFI3KFeKnK8LOlPPaDfvbwrVcPCs
	6L03O0TF5E3YEoxkU+yIG0ndaAv0h1Oeh8ZMd+YbPj+VMyjWewE4WA3La4KTkO7g/FafM4g9Jri
	ASYzwgNX482oXGCknvElsuXsUnlfBvAKIjxzQ1YT4z9AaIkszfOY2fUghRpkv/zNX9d68K+T25S
	Y3xQ/jdSwOoE9PHAvFIaJ7Qup4Nzdw4jAVCgzp090JobMquBKfmFTaiIXmarwS2Hz7aLG9gwGEz
	NmoU8tNJbKYUFcCG72pirZWZezlX/boBR9K+QjTRfyZHFKTpaG2ZMP8/zNPg6lLNH2jo=
X-Google-Smtp-Source: AGHT+IGDLJ25jTSnjtMrAzSMrhQ6KT57R3e6sxhKBHrla1Y9XWb0uxFltLbLxi//TloJn9XMYtCgdg==
X-Received: by 2002:a17:907:7f88:b0:abf:7ec9:fdf4 with SMTP id a640c23a62f3a-ac20d97e5c0mr579785466b.6.1741244983173;
        Wed, 05 Mar 2025 23:09:43 -0800 (PST)
Message-ID: <3f6f680d-3be7-41d8-a599-49521766aa62@suse.com>
Date: Thu, 6 Mar 2025 08:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix INTRODUCE description in xenstore.txt
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250305085201.14258-1-jgross@suse.com>
 <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
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
In-Reply-To: <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0usBs2nM9GJGlCXPuj0arfLW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0usBs2nM9GJGlCXPuj0arfLW
Content-Type: multipart/mixed; boundary="------------WHOUOINnYPhgatbZ9U0TmtX4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <3f6f680d-3be7-41d8-a599-49521766aa62@suse.com>
Subject: Re: [PATCH] docs: fix INTRODUCE description in xenstore.txt
References: <20250305085201.14258-1-jgross@suse.com>
 <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
In-Reply-To: <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
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

--------------WHOUOINnYPhgatbZ9U0TmtX4
Content-Type: multipart/mixed; boundary="------------WHQk2d54dvGszvb6h1Q1bkZw"

--------------WHQk2d54dvGszvb6h1Q1bkZw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDMuMjUgMjM6NTcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA1LzAzLzIw
MjUgODo1MiBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFRoZSBkZXNjcmlwdGlvbiBv
ZiB0aGUgWGVuc3RvcmUgSU5UUk9EVUNFIGNvbW1hbmQgaXMgc3RpbGwgcmVmZXJlbmNpbmcN
Cj4+IHhlbmQuIEZpeCB0aGF0Lg0KPj4NCj4+IFdoaWxlIGF0IGl0LCBtYWtlIGNsZWFyIHRo
YXQgdGhlIFhlbnN0b3JlIGltcGxlbWVudGF0aW9uIGlzIGFsbG93ZWQNCj4+IHRvIGlnbm9y
ZSB0aGUgc3BlY2lmaWVkIGdmbiBhbmQgdXNlIHRoZSBYZW5zdG9yZSByZXNlcnZlZCBncmFu
dCBpZA0KPj4gR05UVEFCX1JFU0VSVkVEX1hFTlNUT1JFIGluc3RlYWQuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+
PiAgIGRvY3MvbWlzYy94ZW5zdG9yZS50eHQgfCA2ICsrKysrLQ0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQgYi9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+
PiBpbmRleCAzODAxNTgzNWIxLi5kODk0ZDI0ZDExIDEwMDY0NA0KPj4gLS0tIGEvZG9jcy9t
aXNjL3hlbnN0b3JlLnR4dA0KPj4gKysrIGIvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4g
QEAgLTI4Niw3ICsyODYsNyBAQCBUUkFOU0FDVElPTl9FTkQJCUZ8DQo+PiAgIElOVFJPRFVD
RQkJPGRvbWlkPnw8Z2ZuPnw8ZXZ0Y2huPnw/DQo+PiAgIAlOb3RpZmllcyB4ZW5zdG9yZWQg
dG8gY29tbXVuaWNhdGUgd2l0aCB0aGlzIGRvbWFpbi4NCj4+ICAgDQo+PiAtCUlOVFJPRFVD
RSBpcyBjdXJyZW50bHkgb25seSB1c2VkIGJ5IHhlbmQgKGR1cmluZyBkb21haW4NCj4+ICsJ
SU5UUk9EVUNFIGlzIGN1cnJlbnRseSBvbmx5IHVzZWQgYnkgeGVuIHRvb2xzIChkdXJpbmcg
ZG9tYWluDQo+PiAgIAlzdGFydHVwIGFuZCB2YXJpb3VzIGZvcm1zIG9mIHJlc3RvcmUgYW5k
IHJlc3VtZSksIGFuZA0KPj4gICAJeGVuc3RvcmVkIHByZXZlbnRzIGl0cyB1c2Ugb3RoZXIg
dGhhbiBieSBkb20wLg0KPj4gICANCj4+IEBAIC0yOTksNiArMjk5LDEwIEBAIElOVFJPRFVD
RQkJPGRvbWlkPnw8Z2ZuPnw8ZXZ0Y2huPnw/DQo+PiAgIAlmb3IgZXhhbXBsZSBwYXNzaW5n
IGEgaGlnaC1iaXQtc2V0IDMyLWJpdCBnZm4gYXMgYW4gdW5zaWduZWQNCj4+ICAgCWRlY2lt
YWwgd2lsbCBhdHRlbXB0IHRvIHVzZSAweDdmZmZmZmZmIGluc3RlYWQgKCEpLg0KPj4gICAN
Cj4+ICsJWGVuc3RvcmVkIG1pZ2h0IGlnbm9yZSB0aGUgPGdmbj4gdmFsdWUgYW5kIHVzZSB0
aGUgcmVzZXJ2ZWQNCj4+ICsJZ3JhbnQgdGFibGUgZW50cnkgR05UVEFCX1JFU0VSVkVEX1hF
TlNUT1JFIGluc3RlYWQgZm9yIG1hcHBpbmcNCj4+ICsJdGhlIFhlbnN0b3JlIGludGVyZmFj
ZSBwYWdlIG9mIHRoZSBndWVzdC4NCj4gDQo+IEknZCBzdWdnZXN0IG1ha2luZyBhIHN0cm9u
Z2VyIHN0YXRlbWVudCB0aGFuIHRoaXMuDQo+IA0KPiAtLS0NCj4gVGhlIDxnZm4+IGZpZWxk
IGlzIHVzZWQgYnkgeGVuc3RvcmVkcyB3aGljaCB1c2UgZm9yZWlnbiBtYXBwaW5nIHRvDQo+
IGFjY2VzcyB0aGUgcmluZyBwYWdlLg0KPiANCj4gQWx0ZXJuYXRpdmVseSwgR3JhbnQgMSAo
R05UVEFCX1JFU0VSVkVEX1hFTlNUT1JFKSBpcyByZXNlcnZlZCBmb3IgdGhlDQo+IHNhbWUg
cHVycG9zZSwgYW5kIGlzIHBvcHVsYXRlZCBieSB0aGUgZG9tYWluIGJ1aWxkZXIgb24gYmVo
YWxmIG9mIHRoZQ0KPiBndWVzdC7CoCBUaGlzIG1lY2hhbmlzbSBpcyBwcmVmZXJyZWQgYmVj
YXVzZSByZWR1Y2VzIHRoZSBwZXJtaXNzaW9ucyB0aGF0DQo+IHhlbnN0b3JlZCBuZWVkcyBp
biBvcmRlciB0byBmdW5jdGlvbi4NCj4gDQo+IEJvdGggPGdmbj4gYW5kIEdyYW50IDEgbmVl
ZCB0byBhZ3JlZSwgYmVjYXVzZSBpbXBsZW1lbnRhdGlvbnMgb2YNCj4geGVuc3RvcmVkIHdp
bGwgdXNlIG9uZSBhbmQgaWdub3JlIHRoZSBvdGhlci4NCg0KRmluZSB3aXRoIG1lLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------WHQk2d54dvGszvb6h1Q1bkZw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------WHQk2d54dvGszvb6h1Q1bkZw--

--------------WHOUOINnYPhgatbZ9U0TmtX4--

--------------0usBs2nM9GJGlCXPuj0arfLW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfJSjYFAwAAAAAACgkQsN6d1ii/Ey/z
gAf/QNUYL5nXC/x2SZ3T8AQCtpaNkNPbiaeFs57mjx6dsH3jYdeN0MSqvFe3b2fGW6yAvnJvomlT
qN02hFYugQgyVcdb55Dk32HYyOMbGFBIiOeFuZd2LODqti+JDgSDYONsEYQq4fH6PoJoUrp/Dc+b
p7LYK8czb8nZH63spCWDJUk+AceLF/W4pwYs7s/9V5Dh2c1RRbw/6YoP/aHtxCnn+CV1oHHlppJU
wqcJXZHMDWDQB60HV8nHi2ocG616DbnqSvS/ZsmMU5cEbx1IuWeYm0TAzsGPXrht0X09ZZ7dRgyl
UpDtathsw5MoJNGuoWQPFydRb5UM9CzAgKxszoIT2g==
=Szpe
-----END PGP SIGNATURE-----

--------------0usBs2nM9GJGlCXPuj0arfLW--

