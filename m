Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A0BA5D6CF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 08:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910002.1316813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsGAD-0002XB-GO; Wed, 12 Mar 2025 07:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910002.1316813; Wed, 12 Mar 2025 07:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsGAD-0002Um-Cd; Wed, 12 Mar 2025 07:06:01 +0000
Received: by outflank-mailman (input) for mailman id 910002;
 Wed, 12 Mar 2025 07:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IlF8=V7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsGAB-0002Ug-Sh
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 07:06:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72cf2df8-ff10-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 08:05:58 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso8675935e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 00:05:58 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74c59esm11818595e9.14.2025.03.12.00.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 00:05:57 -0700 (PDT)
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
X-Inumbo-ID: 72cf2df8-ff10-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741763158; x=1742367958; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WKu4ZEn+9+yDU4g2fGRozFQ0eK9xTZQ/9+4GI+XaFOE=;
        b=PR+3HU5eqneBkX0xjCwDd9DFVJ84GU4czCVCssh2+Svn48l3WLJ1S30xVxVj+dL1TS
         RSCk6inWASrTluxZ/cxVs/k8DLVfXh8j4hauthwm3LCLJ6ydY32kZQxFyISXax6CZx8a
         4vaz65CL8CG/WQxmRNIa8Dh8/Ep1yu79MdNbG84i7O8oCQtRCJJNVGXRle1yo0ktBMOq
         ah9W9IJVJCCPZQ9RTDh8GFT7xDrDbGYXz+hj4kKiEs987vK7x2daMIreM9VfS/qOwel1
         l43W8ea0SdxK+JLv4Pi+Z0PYff/toAWzsMIk5iF1VxvIA7Of5oJSknbmBQ1NMR5ZKgJj
         IjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741763158; x=1742367958;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKu4ZEn+9+yDU4g2fGRozFQ0eK9xTZQ/9+4GI+XaFOE=;
        b=TZpKrgFT1TxwAcL6WTYMW3E+b3sgCu2kDGsBokwhsEua9NrXqv98W5XNNwFhudstyw
         TR0DCSVa9LEDq5RTMlSKCPjlxDPpRsShrmIq5q6QdFXNvFv3cuMcigRRLRIQUuDAs+nn
         NhsI+/Pf+Zcoe2wHXYmz6nS6U6CYNJYnFrKrjUbYDmRWJ4tF+dYN/ikkddQnrLaP3dyx
         UjnLGJvp7ydFYwpG+kZt1Bssk3mpTvEug16rnQ059aIVS8KzX474AKEvmdmKEsew7NeB
         VsKTfyYYUP7AuNiW8CrnBUH3kE7nn0DWQfcgNi6I8RCI6BH3GYNcycjgMtY06KY542lo
         fw8g==
X-Forwarded-Encrypted: i=1; AJvYcCVsu9HldmA3AbKfWvKrViKPrHfMQWXAiFNb4Fk8rFAEH8VEd/EtqQkf+JRxbpQeI91p2JdWQnepCqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywatsw48YAGa8TF0NttDd254FAPtS/H+lBYaUpBxGWwone9LmjB
	jbmXTxqO9JsT8APpMNS3rL++BXXh+swB9lm8MFqX5JgkzOtQh8MGP2eLV42qh3I=
X-Gm-Gg: ASbGncvF+uREZDfv/nRKISw0R8L2iVwCXj6PClW2UzxUlJ6khV31MLSwOzYyPKSI6ip
	uLP0Wedyx04HVekTj9gZj5bv3UjVNg6nPZxgBzi1hOem9zF4+wpowlGAvOsRW/dKX719tbre0I3
	4IjYZ7t8HgfG4PKwL9kvq73Akmr3Tw8M2rtlcvK0bueWpR/rPUu2hdMkO05ED6mEva+6M6LUVBz
	HHMXC1jM6EZ+PTmJCS55kHqTRFmTOAxOxcvz5J8ictLvVrnKOCqaYeogDcy22peTTs0nrY7af1A
	GemyO05AUA5Mm9bBzGPgeodpy7JYGoFaecEHmOhfmpwVyG22dLGGn7DWORophpYe8JmO/9fB0sf
	2n4QvqosPt0dNPibcUKjWUCISCA52Ig0Yd91g0V+tiwvknMFK5T1fMo8FiJQIS+EV7J/wq2S2bA
	tvnA==
X-Google-Smtp-Source: AGHT+IGd43et33//djrJ1FVo21jXOrYI+pzUiQ1pe9+2Y9uhd5oKd1qlbWopwxCcMSe4AuC4iRBkLA==
X-Received: by 2002:a05:600c:3b10:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-43d047e37d8mr62285265e9.11.1741763157716;
        Wed, 12 Mar 2025 00:05:57 -0700 (PDT)
Message-ID: <d469e915-1c0b-4f9c-bff1-dcd455aad7b9@suse.com>
Date: Wed, 12 Mar 2025 08:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] xen/events: don't allow binding a global virq from
 any domain
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-2-jgross@suse.com>
 <24a909a8-c6a9-4c09-b819-24c10e0762c3@xen.org>
 <e6352575-c2cb-4616-b305-1cd64480de1a@suse.com>
 <06966fe2-17f6-40b2-a0ac-56fad426c951@xen.org>
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
In-Reply-To: <06966fe2-17f6-40b2-a0ac-56fad426c951@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yhjrLD7MqiWgrMYmGixXstHk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yhjrLD7MqiWgrMYmGixXstHk
Content-Type: multipart/mixed; boundary="------------B5agClRZuxX50eGBl6ghPcLX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <d469e915-1c0b-4f9c-bff1-dcd455aad7b9@suse.com>
Subject: Re: [PATCH v8 1/9] xen/events: don't allow binding a global virq from
 any domain
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-2-jgross@suse.com>
 <24a909a8-c6a9-4c09-b819-24c10e0762c3@xen.org>
 <e6352575-c2cb-4616-b305-1cd64480de1a@suse.com>
 <06966fe2-17f6-40b2-a0ac-56fad426c951@xen.org>
In-Reply-To: <06966fe2-17f6-40b2-a0ac-56fad426c951@xen.org>
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

--------------B5agClRZuxX50eGBl6ghPcLX
Content-Type: multipart/mixed; boundary="------------l0inRJ4cdcNFDjehee3WcmCG"

--------------l0inRJ4cdcNFDjehee3WcmCG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDMuMjUgMjA6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDExLzAzLzIwMjUgMDk6NTEsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBP
biAxMS4wMy4yNSAxMDozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAwNC8wMi8yMDI1IDExOjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBUb2RheSBYZW4gd2lsbCBoYXBwaWx5IGFsbG93IGJpbmRpbmcgYSBnbG9iYWwgdmly
cSBieSBhIGRvbWFpbiB3aGljaA0KPj4+PiBpc24ndCBjb25maWd1cmVkIHRvIHJlY2VpdmUg
aXQuIFRoaXMgd29uJ3QgcmVzdWx0IGluIGFueSBiYWQgYWN0aW9ucywNCj4+Pj4gYnV0IHRo
ZSBiaW5kIHdpbGwgYXBwZWFyIHRvIGhhdmUgc3VjY2VlZGVkIHdpdGggbm8gZXZlbnQgZXZl
ciBiZWluZw0KPj4+PiByZWNlaXZlZCBieSB0aGF0IGV2ZW50IGNoYW5uZWwuDQo+Pj4+DQo+
Pj4+IEluc3RlYWQgb2YgYWxsb3dpbmcgdGhlIGJpbmQsIGVycm9yIG91dCBpZiB0aGUgZG9t
YWluIGlzbid0IHNldCB0bw0KPj4+PiBoYW5kbGUgdGhhdCB2aXJxLiBOb3RlIHRoYXQgdGhp
cyBjaGVjayBpcyBpbnNpZGUgdGhlIHdyaXRlX2xvY2soKSBvbg0KPj4+PiBwdXJwb3NlLCBh
cyBhIGZ1dHVyZSBwYXRjaCB3aWxsIHB1dCBhIHJlbGF0ZWQgY2hlY2sgaW50bw0KPj4+PiBz
ZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcigpIHdpdGggdGhlIGFkZGl0aW9uIG9mIHVzaW5nIHRo
ZSBzYW1lIGxvY2suDQo+Pj4gwqA+ID4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KPj4+DQo+Pj4gSSBzZWUgdGhpcyBwYXRjaCB3YXMgYWxyZWFk
eSBjb21taXR0ZWQuIEJ1dCBJIGhhdmUgYSBxdWVzdGlvbiBhYm91dCB0aGUgbG9naWMuDQo+
Pj4NCj4+Pj4gLS0tDQo+Pj4+IFY2Og0KPj4+PiAtIG5ldyBwYXRjaA0KPj4+PiBWNzoNCj4+
Pj4gLSBtb3ZlIGhhbmRsaW5nIGRvbWFpbiBjaGVjayBpbnNpZGUgbG9ja2VkIHJlZ2lvbiAo
SmFuIEJldWxpY2gpDQo+Pj4+IC0gc3R5bGUgZml4IChKYW4gQmV1bGljaCkNCj4+Pj4gLS0t
DQo+Pj4+IMKgIHhlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jIHwgMjEgKysrKysrKysrKysr
KysrKystLS0tDQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ldmVu
dF9jaGFubmVsLmMgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4+PiBpbmRleCA0
NjI4MWIxNmNlLi5jZDZmNWExMjExIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vY29tbW9uL2V2
ZW50X2NoYW5uZWwuYw0KPj4+PiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYw0K
Pj4+PiBAQCAtMTIwLDYgKzEyMCwxMyBAQCBzdGF0aWMgdWludDhfdCANCj4+Pj4gZ2V0X3hl
bl9jb25zdW1lcih4ZW5fZXZlbnRfY2hhbm5lbF9ub3RpZmljYXRpb25fdCBmbikNCj4+Pj4g
wqAgLyogR2V0IHRoZSBub3RpZmljYXRpb24gZnVuY3Rpb24gZm9yIGEgZ2l2ZW4gWGVuLWJv
dW5kIGV2ZW50IGNoYW5uZWwuICovDQo+Pj4+IMKgICNkZWZpbmUgeGVuX25vdGlmaWNhdGlv
bl9mbihlKSAoeGVuX2NvbnN1bWVyc1soZSktPnhlbl9jb25zdW1lci0xXSkNCj4+Pj4gK3N0
YXRpYyBzdHJ1Y3QgZG9tYWluICpfX3JlYWRfbW9zdGx5IGdsb2JhbF92aXJxX2hhbmRsZXJz
W05SX1ZJUlFTXTsNCj4+Pj4gKw0KPj4+PiArc3RhdGljIHN0cnVjdCBkb21haW4gKmdldF9n
bG9iYWxfdmlycV9oYW5kbGVyKHVuc2lnbmVkIGludCB2aXJxKQ0KPj4+PiArew0KPj4+PiAr
wqDCoMKgIHJldHVybiBnbG9iYWxfdmlycV9oYW5kbGVyc1t2aXJxXSA/OiBoYXJkd2FyZV9k
b21haW47DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gwqAgc3RhdGljIGJvb2wgdmlycV9pc19n
bG9iYWwodW5zaWduZWQgaW50IHZpcnEpDQo+Pj4+IMKgIHsNCj4+Pj4gwqDCoMKgwqDCoCBz
d2l0Y2ggKCB2aXJxICkNCj4+Pj4gQEAgLTQ2OSw2ICs0NzYsNyBAQCBpbnQgZXZ0Y2huX2Jp
bmRfdmlycShldnRjaG5fYmluZF92aXJxX3QgKmJpbmQsIA0KPj4+PiBldnRjaG5fcG9ydF90
IHBvcnQpDQo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRv
bWFpbjsNCj4+Pj4gwqDCoMKgwqDCoCBpbnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZpcnEg
PSBiaW5kLT52aXJxLCB2Y3B1ID0gYmluZC0+dmNwdTsNCj4+Pj4gwqDCoMKgwqDCoCBpbnTC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjID0gMDsNCj4+Pj4gK8KgwqDCoCBib29swqDCoMKg
wqDCoMKgwqDCoMKgwqAgaXNfZ2xvYmFsOw0KPj4+PiDCoMKgwqDCoMKgIGlmICggKHZpcnEg
PCAwKSB8fCAodmlycSA+PSBBUlJBWV9TSVpFKHYtPnZpcnFfdG9fZXZ0Y2huKSkgKQ0KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+IEBAIC00NzgsOCAr
NDg2LDkgQEAgaW50IGV2dGNobl9iaW5kX3ZpcnEoZXZ0Y2huX2JpbmRfdmlycV90ICpiaW5k
LCANCj4+Pj4gZXZ0Y2huX3BvcnRfdCBwb3J0KQ0KPj4+PiDCoMKgwqDCoMKgICogc3BlY3Vs
YXRpdmUgZXhlY3V0aW9uLg0KPj4+PiDCoMKgwqDCoMKgICovDQo+Pj4+IMKgwqDCoMKgwqAg
dmlycSA9IGFycmF5X2luZGV4X25vc3BlYyh2aXJxLCBBUlJBWV9TSVpFKHYtPnZpcnFfdG9f
ZXZ0Y2huKSk7DQo+Pj4+ICvCoMKgwqAgaXNfZ2xvYmFsID0gdmlycV9pc19nbG9iYWwodmly
cSk7DQo+Pj4+IC3CoMKgwqAgaWYgKCB2aXJxX2lzX2dsb2JhbCh2aXJxKSAmJiAodmNwdSAh
PSAwKSApDQo+Pj4+ICvCoMKgwqAgaWYgKCBpc19nbG9iYWwgJiYgdmNwdSAhPSAwICkNCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+PiDCoMKgwqDCoMKg
IGlmICggKHYgPSBkb21haW5fdmNwdShkLCB2Y3B1KSkgPT0gTlVMTCApDQo+Pj4+IEBAIC00
ODcsNiArNDk2LDEyIEBAIGludCBldnRjaG5fYmluZF92aXJxKGV2dGNobl9iaW5kX3ZpcnFf
dCAqYmluZCwgDQo+Pj4+IGV2dGNobl9wb3J0X3QgcG9ydCkNCj4+Pj4gwqDCoMKgwqDCoCB3
cml0ZV9sb2NrKCZkLT5ldmVudF9sb2NrKTsNCj4+Pj4gK8KgwqDCoCBpZiAoIGlzX2dsb2Jh
bCAmJiBnZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcih2aXJxKSAhPSBkICkNCj4+Pg0KPj4+IFdo
YXQgcHJldmVudCBhIHJhY2UgYmV0d2VlbiBnZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcigpIGFu
ZCANCj4+PiBzZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcigpPyBBbHNvLCBpdCBpcyBub3QgY2xl
YXIgaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIA0KPj4+IGdldF9nbG9iYWxfdmlycV9oYW5k
bGVyKCkgdGhhdCBpdCB3aWxsIGV2ZXIgb25seSByZWFkIA0KPj4+IGdsb2JhbF92aXJxX2hh
bmRsZXJzW3ZpcnFdIG9uY2UuDQo+Pg0KPj4gc2V0X2dsb2JhbF92aXJxX2hhbmRsZXIoKSBp
cyB0YWtpbmcgdGhlIGV2ZW50X2xvY2sgb2YgdGhlIGRvbWFpbg0KPj4gcmVnaXN0ZXJlZCBh
cyBoYW5kbGVyLg0KPj4NCj4+IFNvIGlmIGEgZG9tYWluIGlzIHJlZ2lzdGVyZWQgZm9yIGhh
bmRsaW5nIGEgdmlycSwgZC0+ZXZlbnRfbG9jayBpcw0KPj4gcHJvdGVjdGluZyBhZ2FpbnN0
IHRoZSBoYW5kbGluZyBkb21haW4gdG8gYmUgY2hhbmdlZC4gQ29uY3VycmVudA0KPj4gY2Fs
bHMgb2Ygc2V0X2dsb2JhbF92aXJxX2hhbmRsZXIoKSBhcmUgaGFuZGxlZCB2aWEgdGFraW5n
IHRoZQ0KPj4gZ2xvYmFsX3ZpcnFfaGFuZGxlcnNfbG9jayBzcGluX2xvY2suDQo+IA0KPiBJ
IGFncmVlIHRoaXMgd291bGQgd29yayBmb3IgZXZ0Y2huX2JpbmRfdmlycSgpIGJlY2F1c2Ug
d2Ugb25seSBldmVyIGNvbXBhcmUuIEJ1dCANCj4gSSBzdGlsbCB3b25kZXIgd2hldGhlciBn
ZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcigpIHNob3VsZCBnYWluIGFuIEFDQ0VTU19PTkNFKCk/
IA0KPiBDb3VsZCB0aGUgY29tcGlsZXIgZGVjaWRlIHRvIHJlYWQgZ2xvYmFsX3ZpcnFfaGFu
ZGxlcnNbLi4uXSB0d2ljZSBhbmQgdGhlcmVmb3JlIA0KPiByZXR1cm4gTlVMTD8NCg0KSSBk
b24ndCB0aGluayB0aGVyZSBpcyBjdXJyZW50bHkgYW55IHVzZSBjYXNlIG9mIGdldF9nbG9i
YWxfdmlycV9oYW5kbGVyKCkNCndoZXJlIHRoaXMgd291bGQgYmUgYSBwcm9ibGVtLiBnZXRf
Z2xvYmFsX3ZpcnFfaGFuZGxlcigpIGlzIGFsbG93ZWQgdG8NCnJldHVybiBOVUxMIGluIGNh
c2Ugb2YgZS5nLiBhIGRvbTBsZXNzIHN5c3RlbSB3aGVyZSBoYXJkd2FyZV9kb21haW4gaXMg
TlVMTC4NCg0KDQpKdWVyZ2VuDQo=
--------------l0inRJ4cdcNFDjehee3WcmCG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------l0inRJ4cdcNFDjehee3WcmCG--

--------------B5agClRZuxX50eGBl6ghPcLX--

--------------yhjrLD7MqiWgrMYmGixXstHk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfRMlQFAwAAAAAACgkQsN6d1ii/Ey+e
TAf/YZzZM6SsGbG0hj0UrbOxidvakQP8+zpXF78IUKoJ+6YLUnAEGLTj+f4S9ziR+Ty7fZM/anpY
RQtplpn0/FnUNZmoN5PMy9cK9BypW42rb42+OT6lF8DFIjYtXjWakiOBFttK7m9doik917Pzp81W
+NhuMZl++9G7LEwfe+2M4xpohxZENPCXy5w+S2cBs5Iijy3GO91pdsNrp6d+Gp7EkLMLo0yjEoQk
pfBN9QvK5WUbYR39VZzfycSfii5zACUwC/hRsqCb04eNVTz5n7l3hCU7qBRodcuoUVNwuOucgnC0
xNTRymtuvnMrBe1yemqdvV7AUnmp+G8XSUInYjl80A==
=tQMH
-----END PGP SIGNATURE-----

--------------yhjrLD7MqiWgrMYmGixXstHk--

