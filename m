Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52980A3827F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 12:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890319.1299308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzlQ-0006ew-SD; Mon, 17 Feb 2025 11:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890319.1299308; Mon, 17 Feb 2025 11:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzlQ-0006dA-ON; Mon, 17 Feb 2025 11:58:16 +0000
Received: by outflank-mailman (input) for mailman id 890319;
 Mon, 17 Feb 2025 11:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L/wo=VI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjzlP-0006cz-0K
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 11:58:15 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 764507f7-ed26-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 12:58:12 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso728778466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 03:58:12 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339dcdbsm872333666b.158.2025.02.17.03.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 03:58:11 -0800 (PST)
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
X-Inumbo-ID: 764507f7-ed26-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739793491; x=1740398291; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O5wm9roZF1NENuWqO5z4XvGpFgyQc9kYEk4ydwNhZ4s=;
        b=BO3mKjAkMMxC1nlfmnGqR3d6X5UTZZpyPh3nR90YiZOxPcTwmTqkBZI+hz7ArIdhDa
         0+BVANRt9hjVCa5gUYpJSVM7OJ/jcdBfpyLtIMrIzcHqdm/b4yInqIqdD7IxEgTe1vMI
         T1SnZh6u+otsbNVSncZaZljobYOEBlcMVptO1fBG8OVvqIk2MNHSg1o2DHVdgrfNf3IZ
         mDgIoRzZgdIp6qs70GIGkmyWAwNPYDKSJ8/W7o9phkEgqQZAB94tAZgl3idqew68dR6K
         0wYW4FgEzk/aX9wXGCh9YkmoV3Eddo2InN+Urco2/TQO4Ry08wgyukR5hT7EmtSEblVc
         KMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793491; x=1740398291;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5wm9roZF1NENuWqO5z4XvGpFgyQc9kYEk4ydwNhZ4s=;
        b=uZDMVmhpTtBJT2kejJgBsMFhWXgnOtz6v7aLhS8UoOaFhAEDML1PloN1BhPUoDner8
         mRqzfashdrKP6PgaQbM1k6UV62LUELQcCY68xargsfYUfYqozqApmStgkngdVowkpe+C
         MgOF6pj0/Kog2/tfCWnnBRgJS/g5rGy5IoEmkRLx+hlGD6d0QfVb6dI7KlUEFtUQUCFm
         QqqXqjgjTOKe3AzdHwUxt0+OOCuQEIPVqEDupCAq7E0KFw9bLcH56dsoYEibVoY9zaxz
         K7vUoyJQ0emCPitp3A2q8sgFwYQb1avFUBr/YTIq1+3iir0gv11jL6lRo6IfFPmoV7Ae
         eSeA==
X-Forwarded-Encrypted: i=1; AJvYcCXqS2KL9jD/QS928C46aEj4kICJnpmEt/q6vpVYs4vrrX9VdTC9mxkGs3kcQbrMgkcNB+wF2UiQopQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZFC3SQ1A0GJ7QgTv4tbH9ordFqMDhbh2XekQWn/wfFPgUd1Bm
	m4sMd5MAv+T2yUipw/b6ZkumWAczJIJYyRdBRXzoI0fDgoJ0pT/UvcqpsKIkAhI=
X-Gm-Gg: ASbGncu8ULc5+sGD1h3IjZ8iH7wWoRLZYgXIKXsEBB078iCdSSCu3GqVOPQNClIxief
	iHaS4qFPBAQvfFqUCRutThrdmHJJSPMCGDxxd3h4941pbCbrnoyeDLK7aqy9IP2iYX1phkYCGAT
	8h5rdNS+yBY97e+Zj7uE5g5Zyhz3QgWuvIpMvQMvJFOTZMQQfkZFW+bbBxbYf/5ELk0mLKuYWg6
	5U6XmwN4/qF9Nkbq0fB0kMOeCFO16prNh5LhUVd5Aj6K2ec44Zotab26DWQbIs5N4fls2IhnLYT
	F8Z0zjsdXA1KDf4ZW0r831RMvSI5iVethUMzvXJ2JF9kV6bM9BhjjLYwTgdIZ44u4UFZtLGszZ3
	iJntCF5t82KJZacw4dA9LC/R+T9Zz2C0hUB10Ww==
X-Google-Smtp-Source: AGHT+IHSv66Sb2/q/v/Q2qDdLnIj49D7/sUqB+5blXyE3xzOyFC0194jFK4JzFGPzROs7+ybwrBwug==
X-Received: by 2002:a17:906:c14c:b0:ab7:b390:5c67 with SMTP id a640c23a62f3a-abb70af3b2cmr886020866b.18.1739793491483;
        Mon, 17 Feb 2025 03:58:11 -0800 (PST)
Message-ID: <b1a4fd99-6553-4256-97ec-655c944170b2@suse.com>
Date: Mon, 17 Feb 2025 12:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
 <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
 <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
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
In-Reply-To: <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bBKBHJ9c6XGZHOAT0l5pzuKW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bBKBHJ9c6XGZHOAT0l5pzuKW
Content-Type: multipart/mixed; boundary="------------8YxF3OUm2E2OwQBSwjnBt721";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <b1a4fd99-6553-4256-97ec-655c944170b2@suse.com>
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
 <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
 <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
In-Reply-To: <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
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

--------------8YxF3OUm2E2OwQBSwjnBt721
Content-Type: multipart/mixed; boundary="------------iQ3mGRlcQipbsoL0hlAO0bjR"

--------------iQ3mGRlcQipbsoL0hlAO0bjR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDIuMjUgMTI6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wMi4yMDI1
IDEyOjE2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTcuMDIuMjUgMTA6NDcsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE2LjAyLjIwMjUgMTE6MjMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEBAIC01NTYsMTEgKzU5MCwxMSBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgbGlzdF9zcGxpY2VfaW5pdChzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0LA0KPj4+PiAgICAg
KiBAaGVhZDogICB0aGUgaGVhZCBmb3IgeW91ciBsaXN0Lg0KPj4+PiAgICAgKiBAbWVtYmVy
OiB0aGUgbmFtZSBvZiB0aGUgbGlzdF9zdHJ1Y3Qgd2l0aGluIHRoZSBzdHJ1Y3QuDQo+Pj4+
ICAgICAqLw0KPj4+PiAtI2RlZmluZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocG9zLCBu
LCBoZWFkLCBtZW1iZXIpICAgICAgICAgICAgICAgICAgXA0KPj4+PiAtICAgIGZvciAoKHBv
cykgPSBsaXN0X2VudHJ5KChoZWFkKS0+bmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlciks
ICAgICAgXA0KPj4+PiAtICAgICAgICAgKG4pID0gbGlzdF9lbnRyeSgocG9zKS0+bWVtYmVy
Lm5leHQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIpOyAgXA0KPj4+PiAtICAgICAgICAgJihw
b3MpLT5tZW1iZXIgIT0gKGhlYWQpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KPj4+PiAtICAgICAgICAgKHBvcykgPSAobiksIChuKSA9IGxpc3RfZW50cnko
KG4pLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoobikpLCBtZW1iZXIpKQ0KPj4+PiArI2RlZmlu
ZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocG9zLCBuLCBoZWFkLCBtZW1iZXIpICAgICAg
ICAgICAgICAgICAgICAgXA0KPj4+PiArICAgIGZvciAoIChwb3MpID0gbGlzdF9maXJzdF9l
bnRyeV9vcl9udWxsKGhlYWQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIpLCAgXA0KPj4+PiAr
ICAgICAgICAgIChuKSA9IChwb3MpID8gbGlzdF9uZXh0X2VudHJ5X29yX251bGwoaGVhZCwg
cG9zLCBtZW1iZXIpIDogTlVMTDsgXA0KPj4+DQo+Pj4gbiBjYW4gZW5kIHVwIGJlaW5nIE5V
TEwgaGVyZSBldmVuIGlmIHBvcyBpc24ndC4gVGhlbiAuLi4NCj4+Pg0KPj4+PiArICAgICAg
ICAgIHBvczsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXA0KPj4+PiArICAgICAgICAgIChwb3MpID0gKG4pLCAobikgPSBs
aXN0X25leHRfZW50cnlfb3JfbnVsbChoZWFkLCBuLCBtZW1iZXIpICkNCj4+Pg0KPj4+IC4u
LiB5b3UgY2FuJ3QgdXNlIGxpc3RfbmV4dF9lbnRyeV9vcl9udWxsKCkgb24gaXQuDQo+Pg0K
Pj4gQWgsIGluZGVlZC4NCj4+DQo+PiBXaGF0IHdvdWxkIHlvdSBwcmVmZXI/IEhhbmRsaW5n
IHRoYXQgaW4gdGhlICpfc2FmZSgpIGl0ZXJhdG9yIG1hY3Jvcywgb3INCj4+IGFsbG93aW5n
IHRoZSAqX2VudHJ5X29yX251bGwoKSBtYWNyb3MgdG8gYmUgY2FsbGVkIHdpdGggYSBOVUxM
IHBhcmFtZXRlcj8NCj4gDQo+IEknZCBwcmVmZXIgdGhlIGZvcm1lciwgYnV0IEkgcHJvYmFi
bHkgd291bGRuJ3QgbWluZCB0aGUgbGF0dGVyLg0KPiANCj4+Pj4gQEAgLTY1NSwxMCArNjg5
LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsaXN0X3NwbGljZV9pbml0KHN0cnVjdCBsaXN0
X2hlYWQgKmxpc3QsDQo+Pj4+ICAgICAqIHRoZSBfcmN1IGxpc3QtbXV0YXRpb24gcHJpbWl0
aXZlcyBzdWNoIGFzIGxpc3RfYWRkX3JjdSgpDQo+Pj4+ICAgICAqIGFzIGxvbmcgYXMgdGhl
IHRyYXZlcnNhbCBpcyBndWFyZGVkIGJ5IHJjdV9yZWFkX2xvY2soKS4NCj4+Pj4gICAgICov
DQo+Pj4+IC0jZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KHBvcywgaGVhZCwgbWVt
YmVyKSAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+IC0gICAgZm9yICgocG9zKSA9IGxp
c3RfZW50cnkoKGhlYWQpLT5uZXh0LCB0eXBlb2YoKihwb3MpKSwgbWVtYmVyKTsgICAgICBc
DQo+Pj4+IC0gICAgICAgICAmcmN1X2RlcmVmZXJlbmNlKHBvcyktPm1lbWJlciAhPSAoaGVh
ZCk7ICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+IC0gICAgICAgICAocG9zKSA9IGxp
c3RfZW50cnkoKHBvcyktPm1lbWJlci5uZXh0LCB0eXBlb2YoKihwb3MpKSwgbWVtYmVyKSkN
Cj4+Pj4gKyNkZWZpbmUgbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UocG9zLCBoZWFkLCBtZW1i
ZXIpICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+PiArICAgIGZvciAoIChwb3MpID0g
bGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKGhlYWQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIp
OyBcDQo+Pj4+ICsgICAgICAgICAgcmN1X2RlcmVmZXJlbmNlKHBvcyk7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4gKyAgICAgICAgICAocG9z
KSA9IGxpc3RfbmV4dF9lbnRyeV9vcl9udWxsKGhlYWQsIHBvcywgbWVtYmVyKSApDQo+Pj4N
Cj4+PiBEb24ndCB5b3UgbmVlZCBhIGxpc3RfbmV4dF9lbnRyeV9vcl9udWxsX3JjdSgpIGZs
YXZvciBoZXJlLCB1c2luZw0KPj4+IHJjdV9kZXJlZmVyZW5jZSgpIG9uIHRoZSBwYXNzZWQg
aW4gcG9zIGZvciB0aGUgKHBvcyktPm1lbWJlci5uZXh0IGRlcmVmPw0KPj4NCj4+IElzbid0
IHRoZSAicmN1X2RlcmVmZXJlbmNlKHBvcyk7IiBhbGwgd2hhdCBpcyBuZWVkZWQgZm9yIHRo
ZSBjdXJyZW50IGl0ZXJhdGlvbj8NCj4gDQo+IFJlYWRpbmcgTGludXgnZXMgcmN1X2RlcmVm
ZXJlbmNlLnJzdCwgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IG9uZSBvZiB0aGVtDQo+IHdv
dWxkIHN1ZmZpY2UgaWYgdGhlbiB3ZSB1c2VkIGl0cyByZXN1bHQgcmF0aGVyIHRoYW4gdGhl
IG9yaWdpbmFsIHBvaW50ZXIuDQo+IFRoZW4gYWdhaW4gUkNVIGhhcyBiZWVuIHNvbWV3aGF0
IG9wYXF1ZSB0byBtZSBmb3IgYWxsIHRoZSB5ZWFycyAuLi4NCj4gDQo+PiBPdGhlcndpc2Ug
dG9kYXkncyBpbXBsZW1lbnRhdGlvbiB3b3VsZCBzdWZmZXIgZnJvbSB0aGUgc2FtZSBwcm9i
bGVtIElNSE8uDQo+IA0KPiBUaGF0J3MgdGhlIGltcHJlc3Npb24gSSdtIChub3cpIGhhdmlu
Zy4NCg0KVGhlIHJjdV9kZXJlZmVyZW5jZSgpIGlzIGJhc2ljYWxseSBqdXN0IGZvciBkb2N1
bWVudGF0aW9uIHB1cnBvc2VzLiBJZiBuZWVkZWQNCmJ5IGFuIGFyY2gsIGl0IGNhbiBhZGQg
YmFycmllcnMsIHRvbywgYnV0IGFjY29yZGluZyB0byB0aGUgY29tbWVudHMgdGhvc2Ugd291
bGQNCmJlIG5lZWRlZCBvbiBhbHBoYSBvbmx5LiBUaGUgcmV0dXJuZWQgdmFsdWUgaXMgYWx3
YXlzIHRoZSBvcmlnaW5hbCBwb2ludGVyDQp2YWx1ZS4gU2VlIHRoZSBjb21tZW50IGJsb2Nr
IGluIHhlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oDQoNCg0KSnVlcmdlbg0K
--------------iQ3mGRlcQipbsoL0hlAO0bjR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------iQ3mGRlcQipbsoL0hlAO0bjR--

--------------8YxF3OUm2E2OwQBSwjnBt721--

--------------bBKBHJ9c6XGZHOAT0l5pzuKW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmezJFIFAwAAAAAACgkQsN6d1ii/Ey+S
mQf/ZZG+ThD7k9DFxSE2CZNYfIFE32lVyTq5oxVRvZ5O9qmqecwM5wCmWOKxpkM/zh3AIT8J665D
rGpvd3HS7hGyZGzbErU+s92PCSgxaN4w38MYSf54ANAv2FIuUjW8MqtAfEqoPivskzPSemJyWNba
6W7nLGYSUfUSxEQqh681KnyLhsZaebpzAOgiHo+kxoGwGeaYl/Bv/q7zvUO1g+Sehw0HCo+klkKD
unPVfGwPtHHQVtI3vANWAGFMjt6FgWzlXe4q8VgQBwc13cu8DphPeALBgZsNvry2EHzqYD3Fbg13
gjdKnVq5tSX3KajKHo7jae0obZEuFGbvssVSdiwAUA==
=Px23
-----END PGP SIGNATURE-----

--------------bBKBHJ9c6XGZHOAT0l5pzuKW--

