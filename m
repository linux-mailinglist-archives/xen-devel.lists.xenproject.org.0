Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD83A718BB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927927.1330680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRvL-0000uY-3K; Wed, 26 Mar 2025 14:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927927.1330680; Wed, 26 Mar 2025 14:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRvL-0000tm-0M; Wed, 26 Mar 2025 14:40:07 +0000
Received: by outflank-mailman (input) for mailman id 927927;
 Wed, 26 Mar 2025 14:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Vdm=WN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txRvJ-0000l0-6F
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:40:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 335f2500-0a50-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 15:40:02 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5ed1ac116e3so3531327a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 07:40:02 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebcd0c7157sm9478826a12.60.2025.03.26.07.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
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
X-Inumbo-ID: 335f2500-0a50-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743000002; x=1743604802; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LBKQj4AGc6WzVHDOJKfQ9gaWnyAMl1NEa5cuSk+EvWI=;
        b=U2mr5rNm1cszmRJeoWLn3kOcRaE2GOKv1rHleK1nzon1ffij2ipEBuBYIphZHxv5bf
         3OB15Ghs5PiBb75w5l+/ZaotLK/mZ3V+2Uw8VtaOZ1pnPKD1XeStd4+PLBL5+l7OF6u/
         Oqf3EmxRwCaJwRUuX95xIKBBrKhoVOXQUXvLiWbdjh0aB2zOeC3WtLgEL2HBCOTefwlE
         mWYN4h2guGxpQaWkOtF/LR1iOjvmtXZLpUvCW2eLgpI9NetU/00EvOoDscMsiLMDaJuy
         EqAwM76LRfjn+5d6zEvnzQrh00tSS0H89be9bKJlLt3/Z5gcrSQcYfrbAtePS3Us2GqE
         vIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000002; x=1743604802;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBKQj4AGc6WzVHDOJKfQ9gaWnyAMl1NEa5cuSk+EvWI=;
        b=Imlgdp3SUfwFSD+B5bg9trnd4S5m/MhpJF31522IvqJYPOv90GjQzu5O9Umj7buJhe
         j6s58h0axdMY/LwdUK8Va+ABAVXr3vE0E9/St3K0ytMYryrLKDZor0pLnwuIA8lnwNi/
         ODF/TzabZha4LzdDoAXMnh0IMp5LFHbVK+OX5v0USNfo9/MmieKBU6kHTzXypmJJpyTM
         lzw+OgNAPN8/e9Cto2fBzl65AsI1tics6pqC72N8+EEHF+IdwIc2z0zsx+VNFeqmS/JI
         /8I6Hp7VY1sjy0vbsWts/5PF89BN6Zy2zb97kIg0y3X3/xM8LsWvBXFKbK4MGTaCb350
         xfZA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrux8Rzwx2wv2cmvM2dhos/268E+x87w5W6LcDH1leTCNnG1vT+PQkw2t5Nx8ngzRb5DTcEFNFIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjwJbhpLuCoLCWjtmkfiApmw8nc0M+FFTW+ya6LciFYHBz+4me
	a5NBZ8qzhovik58ZMfatJHToiGUGOxPx0zFpDl1n8ji1gDYgUf6MwQ5IjjAw8M4=
X-Gm-Gg: ASbGncvnnPWE8DOxvSBiM/5R9tkHDq4C07MTr9Et6codbkqINxDUubnruKU59Lcw31i
	RKvv6ZNUOY7qjIjKPbVldNYwwPJBU6EqgOO3RK+91RkDm7CXMmEC+Q/x8TtEgnnbLZ8PV/7iBOS
	rKjVBLk2HAHwaJyNrOtzGWyblavIqtieckfTP7wq4xFc7yVskR+uK+SyR8evCDJH6vPCrfVFv/U
	vbkPveuNG1cd1kJYfBQ41DqfiKo0yK+0LciEBAsf3HUb/cKohJbQLkN8h85xDf2YA0iIBMG0r4L
	msgPkzDzPlPIRGN674AnewPukWcfUwmMI5P2ZY/Xvp2P04LE9uWZl9XwtAb6wSLuWpZM2v7xnLt
	TcTwtZIwjt7mybiJXrGkFgQvX+apRDHcdYanjVV04xkmkFhqF4FxWo0nZXVcKaEICU8SEUw==
X-Google-Smtp-Source: AGHT+IGJabndgE6F+zmKcKqz+FsRkoOgBSivA9eu7leUO6vjGnxM4SG0cW66opx6eFG6Cs4E0yP9HA==
X-Received: by 2002:a05:6402:524e:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5ebcd4f9dfamr17756864a12.25.1743000001800;
        Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
Message-ID: <cb993e55-35b4-4b22-bbbc-8d6aa8e89b7b@suse.com>
Date: Wed, 26 Mar 2025 15:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Remove support for qemu-trad's battery reporting
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250325174110.467-1-alejandro.vallejo@cloud.com>
 <936e7ebf-69e1-4854-87c5-340f56b9d432@citrix.com>
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
In-Reply-To: <936e7ebf-69e1-4854-87c5-340f56b9d432@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YX3eqMQd5pf0l0wRQ0gDRviC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YX3eqMQd5pf0l0wRQ0gDRviC
Content-Type: multipart/mixed; boundary="------------a8boNJGFWn0LWgZtEE6aa9um";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <cb993e55-35b4-4b22-bbbc-8d6aa8e89b7b@suse.com>
Subject: Re: [PATCH] tools: Remove support for qemu-trad's battery reporting
References: <20250325174110.467-1-alejandro.vallejo@cloud.com>
 <936e7ebf-69e1-4854-87c5-340f56b9d432@citrix.com>
In-Reply-To: <936e7ebf-69e1-4854-87c5-340f56b9d432@citrix.com>
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

--------------a8boNJGFWn0LWgZtEE6aa9um
Content-Type: multipart/mixed; boundary="------------tCTvhs7PoTUg5iIB2Vh7o87f"

--------------tCTvhs7PoTUg5iIB2Vh7o87f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDMuMjUgMTU6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI1LzAzLzIw
MjUgNTo0MSBwbSwgQWxlamFuZHJvIFZhbGxlam8gd3JvdGU6DQo+PiBUaGUgd2F5IHRoaXMg
dW5kb2N1bWVudGVkIGZlYXR1cmUgd29ya3MgaXMgdmlhIHFlbXUtdHJhZCAod2hvIG5vYm9k
eQ0KPj4gdXNlcyBhbnltb3JlKSwgYnkgaW50ZXJjZXB0aW5nIDMgbWFnaWMgUElPcy4gMHg4
OCBpcyBvbmUgb2YgdGhlbSwgYW5kDQo+PiBpdCdzIHByb2JlZCBieSBodm1sb2FkZXIgYXMg
YSBtZWFucyBvZiBkZXRlY3Rpbmcgc3VwcG9ydCBmb3IgdGhpcyAoc28sDQo+PiBvbiBxZW11
LXVwc3RyZWFtIHRoaXMgY2hlY2sgYWx3YXlzIGZhaWxzKS4gSWYgaHZtbG9hZGVyIGRldGVj
dHMgdGhlDQo+PiBmZWF0dXJlLCBpdCBhcHBlbmRzIGFuIFNTRFQgd2l0aCBBTUwgaW5oZXJp
dGVkIGZyb20gc29tZSBsYXB0b3AgfjIweQ0KPj4gYWdvLiBRRU1VIHRoZW4gY29tbXVuaWNh
dGVzIHdpdGggYSB1c2Vyc3BhY2UgZGFlbW9uICh4ZW5wbWQpIHZpYSBhbg0KPj4gdW5kb2N1
bWVudGVkIHhlbnN0b3JlIGtleSAoInJlZnJlc2hiYXR0ZXJ5c3RhdHVzIikgaW4gb3JkZXIg
dG8gcmVwb3J0DQo+PiBiYXR0ZXJ5IGxldmVscy4NCj4gDQo+IEFueSBjaGFuY2Ugd2UgY2Fu
IG1ha2UgdGhpcyBsZXNzIHVuZG9jdW1lbnRlZCwgZXZlbiBpZiBpdCBpcyBhIG5vdGUNCj4g
c2F5aW5nICJyZW1vdmVkIG5vdyIgPw0KPiANCj4+DQo+PiBTZWVpbmcgaG93IG5vIG9uZSB1
c2VzLCBtYW50YWlucyBvciBjYXJlcyBhYm91dCBxZW11LXRyYWQgYW55bW9yZSwgcmlwDQo+
PiBpdCBhbGwgb3V0LiBUaGUgaHZtbG9hZGVyIGNoZWNrLCB0aGUgU1NEVCBnZW5lcmF0aW9u
IGxvZ2ljIGFuZCB4ZW5wbWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQWxlamFuZHJvIFZh
bGxlam8gPGFsZWphbmRyby52YWxsZWpvQGNsb3VkLmNvbT4NCj4+IC0tLQ0KPj4gSWYgdGhp
cyBmZWF0dXJlIGlzIHRydWx5IHdhbnRlZCwgaXQgbXVzdCBiZSBpbXBsZW1lbnRlZCBpbg0K
Pj4gcWVtdS11cHN0cmVhbS4gSWRlYWxseSBpbiBhIE1VQ0ggbGVzcyByb3VuZGFib3V0IHdh
eS4gQW5kIGRlZmluaXRlbHkNCj4+IHdpdGhvdXQgaW52b2x2aW5nIHhlbnN0b3JlLg0KPj4g
LS0tDQo+PiAgIC5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQ0KPj4g
ICB0b29scy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAxIC0NCj4+ICAgdG9vbHMv
ZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuYyB8ICAgNyAtDQo+PiAgIHRvb2xzL2xpYmFjcGkv
TWFrZWZpbGUgICAgICAgICAgfCAgIDIgKy0NCj4+ICAgdG9vbHMvbGliYWNwaS9idWlsZC5j
ICAgICAgICAgICB8ICAgOSAtDQo+PiAgIHRvb2xzL2xpYmFjcGkvbGliYWNwaS5oICAgICAg
ICAgfCAgIDIgKy0NCj4+ICAgdG9vbHMvbGliYWNwaS9zc2R0X3BtLmFzbCAgICAgICB8IDQw
OSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIHRvb2xzL3hlbnBtZC9NYWtlZmls
ZSAgICAgICAgICAgfCAgMzAgLS0NCj4+ICAgdG9vbHMveGVucG1kL3hlbnBtZC5jICAgICAg
ICAgICB8IDUyNSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gICA5IGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOTg0IGRlbGV0aW9ucygtKQ0KPj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvbGliYWNwaS9zc2R0X3BtLmFzbA0KPj4gICBkZWxl
dGUgbW9kZSAxMDA2NDQgdG9vbHMveGVucG1kL01ha2VmaWxlDQo+PiAgIGRlbGV0ZSBtb2Rl
IDEwMDY0NCB0b29scy94ZW5wbWQveGVucG1kLmMNCj4gDQo+IEknbSB0ZW1wdGVkIHRvIHN1
bW1hcmlseSBhY2sgdGhpcyBiYXNlZCBvbiBkaWZmc3RhdCBhbG9uZS4NCj4gDQo+IEp1ZXJn
ZW4gaGFzIGV4cHJlc3NlZCBhbiBpbnRlcmVzdCBpbiBmaW5hbGx5IHB1cmdpbmcgcWVtdS10
cmFkIGluIHRoaXMNCj4gcmVsZWFzZSBjeWNsZSwgd2hpY2ggSSBhZ3JlZSB3aXRoLg0KPiAN
Cj4gSWYgd2UncmUgZ29pbmcgdG8gZG8gdGhpcywgdGhlbiBJIHN1Z2dlc3Qgd2UgZGVsZXRl
IHFlbXUtdHJhZCBmaXJzdC4NCj4gT3RoZXJ3aXNlIHdlIGFyZSB0ZWNobmljYWxseSBicmVh
a2luZyBzb21ldGhpbmcgdGhhdCBzb21lb25lIG1pZ2h0IGJlIHVzaW5nLg0KDQpJJ20gd29y
a2luZyBvbiB0aGUgcGF0Y2hlcyByaWdodCBub3cuDQoNCg0KSnVlcmdlbg0K
--------------tCTvhs7PoTUg5iIB2Vh7o87f
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tCTvhs7PoTUg5iIB2Vh7o87f--

--------------a8boNJGFWn0LWgZtEE6aa9um--

--------------YX3eqMQd5pf0l0wRQ0gDRviC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfkEcAFAwAAAAAACgkQsN6d1ii/Ey8j
PQgAnCqsb4pvvR/mv9JE2Mfaj/+YSxa9G0M+OGTTVnDInCDXMsF71SgHd7ggk6FIYbHQhgOYfIUO
jSovyucBe7pSSaEczs7HinCbUMahrsNRW6o7/H2BlRCWwRZE0IIMQwnVSIxX8EodlRsoWVNIRklw
9bDJFucB0YgmGfmPY4/GfT4Rz7XcfI5+IncjXFR93WZRPX1iRtuYXKuMKEKzILB6etcSfkDDpJii
hACbUOGpzKZiMar9+jyYAvCF4iH63K4jJjWESfZgL5SPNxwuZUl0Bscf94KVKnSUIZuhe/RzdnP2
oIPIRgUQXCHbV/m3W5aDYDdmeh7jQl9mUxG4BCGI8Q==
=Tee8
-----END PGP SIGNATURE-----

--------------YX3eqMQd5pf0l0wRQ0gDRviC--

