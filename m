Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E029B0C3A6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 13:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051421.1419753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udp1m-0005Yz-KM; Mon, 21 Jul 2025 11:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051421.1419753; Mon, 21 Jul 2025 11:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udp1m-0005WK-Hj; Mon, 21 Jul 2025 11:49:54 +0000
Received: by outflank-mailman (input) for mailman id 1051421;
 Mon, 21 Jul 2025 11:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1udp1l-0005WE-4A
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 11:49:53 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf9cf10f-6628-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 13:49:51 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae0de0c03e9so628956166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 04:49:51 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca2ec42sm666355666b.78.2025.07.21.04.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 04:49:50 -0700 (PDT)
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
X-Inumbo-ID: cf9cf10f-6628-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753098591; x=1753703391; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8au3/JIhaBEkPfTAFCgdCi3/3GWEqi6khZv5QH/yppU=;
        b=AELblOjTJcFCvrDMoxWF2wsnXcUFL1Z9raY2rFLeoMh/wAgH1PgrTE1Bw14WqNKYXu
         Ijbh6CYCeqfckcW9mUj9U/i9NMlFaoJ2H8r05JIXiLqE71MxTbBTrOc1uuLYMnWyHVwZ
         OlPVtYl3Fx0fsiQwqGTdIyGIae3/X+JXEdJREgajdtqDfm5gpjogMUPpc7E2x/jCo18+
         dOib5n6lRHBDaww4p4eQFoKyalCO9jg0QL6/O6suXnxYK0zo7337rI9X5CJJzNE8nOR+
         RoG9N0oTUa/U9R+bYJJLiWVZXtOYkA2kL6qxAPNgOyHig3vxrVDkYof8e5j8dsVOXWXx
         YoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753098591; x=1753703391;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8au3/JIhaBEkPfTAFCgdCi3/3GWEqi6khZv5QH/yppU=;
        b=qCsJo7tneZmfrHnROqV8cYftZbjxhl2dcHfZ+Y2wC0g01jwd/qc6z9BXgkJlfpdpVm
         Q7buw64K42NriTKjQNIduQlZaj6FLyL5KQ3uOuKHA8iOhiS+NrNSiE3AAi6I+jGZnlaR
         AOz5mdMgxGQqcTKHiHmD+J+VXP6KyGSz69o/JLaVS7CjEBBb8AOMvO3aPyRRlfXuU5Cb
         Wim3533poh0x5PMTu6vSCdpMrqfQrAGURy+fYdsbCM4vf+6pgWBig9SC9VieZwTuD5TL
         uyOkX0JN+v4iw9ppsUMBg7pwESRkr0IG8tLMpKvTlTdoiSPbSlhpzk0Kw5iRDEmiu2L/
         R15g==
X-Forwarded-Encrypted: i=1; AJvYcCXqE/oVzLJ6lHZWOVZpOgZ5Twzc9ZnB/0Fo+SUD/bVZDOIQ7G+TpZD+3XmsMjhZrn+Y34AVZYFPNAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8kcIUaBAdlZZr0F2cPQuOBGuzPBY0otJ20FDi4jR+ZeyDon2i
	O4hzJ+PFHG5Zz6kWjlA3vCeAcU2eLftlNTW2j7hLfu6XXjZOL5nIbggaTFiw9fYHOww=
X-Gm-Gg: ASbGnctCQvCxgs2VxOdZJgP/IEBW47Ni8gXCAy8W15HAGQw3SqjtR++4YTCQ01zLPHm
	iOAgR4komejZSzwz9QjCImDvYulBoqObaaYhVhJJ4pmU2gs0G0y1QnmAcLMt2Ki9LtmzqJ+DxNq
	Ro7j6aEr2InQ93Enh7Fi/lyzpX4tY980fJLhA5Yt6gAJV//cmtwgus6ORNsC14NIXjEMs2Wd9Ym
	BGht4LHnBzDHTeOOqMLX6E3dbqmJhCOHgjRvB2+W1paq4x90/zKe7tMiNomB84WW0F5Qrx3F5jy
	IpGc/b+xNK+sQ+QG8RT8A/y6j1Uncc2MLGGHZqqYaBYXRi97SQlQxaIxq608VqXlmI40XUTHcv+
	7G3kL9H0HT0RnoxvsdMRYJN1vWyMjpbtFsxsRWvaaaqJzbi2995cJEEU5hLvViOnYe3UrmzHk3F
	hFVd7Ui3FWteTdp6Fab9gtVqdVZ0utc4TRQtaxSvOhut5C
X-Google-Smtp-Source: AGHT+IFK7nVG27q+Zsbbi2BxedKIeYMQACela3D93rQcqbGO20roXXwcOORq8osNyhfYjwHzhurwYA==
X-Received: by 2002:a17:907:6e8f:b0:ae3:a604:b1fe with SMTP id a640c23a62f3a-ae9c9aca97fmr1962293366b.38.1753098591034;
        Mon, 21 Jul 2025 04:49:51 -0700 (PDT)
Message-ID: <4dd70c84-c8c1-42aa-8887-889a364afbf8@suse.com>
Date: Mon, 21 Jul 2025 13:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/core: Update vcpu_runstate_get() to return
 nonaffine time
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
 <20250721094951.2006-2-bernhard.kaindl@cloud.com>
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
In-Reply-To: <20250721094951.2006-2-bernhard.kaindl@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zbSv5tpB918REET5r0WQulCV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zbSv5tpB918REET5r0WQulCV
Content-Type: multipart/mixed; boundary="------------EvFKCEAH4v06Jf646znQYx8L";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <4dd70c84-c8c1-42aa-8887-889a364afbf8@suse.com>
Subject: Re: [PATCH 2/2] sched/core: Update vcpu_runstate_get() to return
 nonaffine time
References: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
 <20250721094951.2006-2-bernhard.kaindl@cloud.com>
In-Reply-To: <20250721094951.2006-2-bernhard.kaindl@cloud.com>
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

--------------EvFKCEAH4v06Jf646znQYx8L
Content-Type: multipart/mixed; boundary="------------aNNl8KwH0nAdCNFf0WPJR6Ej"

--------------aNNl8KwH0nAdCNFf0WPJR6Ej
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDcuMjUgMTE6NDksIEJlcm5oYXJkIEthaW5kbCB3cm90ZToNCj4gVXBkYXRlIHZj
cHVfcnVuc3RhdGVfZ2V0KCkgdG8gcmV0dXJuIGEgc25hcHNob3Qgb2YgdGhlIGFjY3VtdWxh
dGVkDQo+IG5vbi1hZmZpbmUgdkNQVSBydW5uaW5nIHRpbWUgYXQgdGhlIGN1cnJlbnQgdGlt
ZSBvZiB0aGlzIGNhbGwuDQo+IA0KPiBXZSBjYW5ub3QgY2hhbmdlIHRoZSBzdHJ1Y3QgdmNw
dV9ydW5zdGF0ZV9pbmZvOiBJdCBpcyBwYXJ0IG9mIHRoZQ0KPiBHdWVzdCBzaGFyZWQgbWVt
b3J5IGFyZWEgdGhhdCBpcyBwYXJ0IG9mIHRoZSBmcm96ZW4gVk0gQUJJLg0KPiANCj4gSW5z
dGVhZCByZXR1cm4gdGhlIG5ldyB2YWx1ZTogVGhpcyB3YXkgd2UgZG8gbm90IGhhdmUgdG8g
Y2hhbmdlIGFsbA0KPiBvbGQgY2FsbGVycyB0byBwYXNzIGEgTlVMTCBpbiBwbGFjZSBvZiBp
dCwgYW5kIHdlIGFsc28gd2UgZG9uJ3Qgd2FudA0KPiBhbiBpbnRlcm5hbCBzaGFkb3cgc3Ry
dWN0IHRoYXQgd2UgbWVtY3B5IGZyb20gd2l0aCBzaXplb2YoKS4gVG8gYmUgb3Blbg0KPiBv
cGVuIHRvIHJldHVybiBkYXRhIGluIHRoZSBmdXR1cmUsIHJldHVybiBhIHN0cnVjdCB3aXRo
IHRoZSBuZXcgZmllbGQuDQoNCkRvdWJsZSAib3BlbiIuDQoNCkl0IGlzIG5vdCBjbGVhciB0
byBtZSBob3cgdGhlIG5vbi1hZmZpbmUgdkNQVSBydW5uaW5nIHRpbWUgcmV0dXJuZWQgYnkN
CnZjcHVfcnVuc3RhdGVfZ2V0KCkgd2lsbCBiZSB1c2VkIGFmdGVyd2FyZHMsIGFzIHlvdSBk
b24ndCBhZGQgYW55IHVzZXJzDQpsb29raW5nIGF0IHRoZSByZXR1cm4gdmFsdWUuIEkgY2Fu
IGhhcmRseSByZXZpZXcgdGhlIHBhdGNoIHdpdGhvdXQgdGhpcw0KaW5mb3JtYXRpb24uIFJp
Z2h0IG5vdyBJJ2QgTkFDSyB0aGlzIHNlcmllcywgYXMgaXQgc2VlbXMgdG8gYWRkIGRlYWQg
Y29kZQ0Kb25seS4NCg0KSU9XOiBwbGVhc2UgaW5jbHVkZSBhL3NvbWUgcGF0Y2goZXMpIG1h
a2luZyB1c2Ugb2YgdGhhdCBjb2RlLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFy
ZCBLYWluZGwgPGJlcm5oYXJkLmthaW5kbEBjbG91ZC5jb20+DQo+IC0tLQ0KPiAgIHhlbi9j
b21tb24vc2NoZWQvY29yZS5jICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKystLQ0K
PiAgIHhlbi9pbmNsdWRlL3B1YmxpYy92Y3B1LmggfCAxMCArKysrKysrKysrDQo+ICAgeGVu
L2luY2x1ZGUveGVuL3NjaGVkLmggICB8ICA0ICsrLS0NCj4gICAzIGZpbGVzIGNoYW5nZWQs
IDM2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiBp
bmRleCA0ODkyNTViOWM2Li4zMTliZDdhOTI4IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9u
L3NjaGVkL2NvcmUuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiBAQCAt
MzI0LDEyICszMjQsMjUgQEAgdm9pZCBzY2hlZF9ndWVzdF9pZGxlKHZvaWQgKCppZGxlKSAo
dm9pZCksIHVuc2lnbmVkIGludCBjcHUpDQo+ICAgICAgIGF0b21pY19kZWMoJnBlcl9jcHUo
c2NoZWRfdXJnZW50X2NvdW50LCBjcHUpKTsNCj4gICB9DQo+ICAgDQo+IC12b2lkIHZjcHVf
cnVuc3RhdGVfZ2V0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0ZSkNCj4gKy8qKg0K
PiArICogdmNwdV9ydW5zdGF0ZV9nZXQoKTogUmV0dXJuIHZDUFUgdGltZSBzcGVudCBpbiBk
aWZmZXJlbnQgcnVuc3RhdGVzDQo+ICsgKg0KPiArICogQHBhcmFtIHY6ICAgICAgICB2Q1BV
IHRvIGdldCBydW5zdGF0ZSB0aW1lcyAoc2luY2UgdkNQVSBzdGFydCkNCj4gKyAqIEBwYXJh
bSBydW5zdGF0ZTogUmV0dXJuIHRpbWUgc3BlbnQgaW4gZWFjaCBydW5zdGF0ZS4NCj4gKyAq
ICAgICAgICAgICAgICAgICAgVGhpcyBzdHJ1Y3R1cmUgaXMgcGFydCBvZiB0aGUgcnVuc3Rh
dGUgbWVtb3J5IGFyZWFzDQo+ICsgKiAgICAgICAgICAgICAgICAgIHNoYXJlZCB3aXRoIHRo
ZSBkb21haW5zIHdoaWNoIGlzIHBhcnQgb2YgdGhlIEFCSQ0KPiArICogICAgICAgICAgICAg
ICAgICB3aXRoIGRvbWFpbnMgdGhhdCBpcyBmcm96ZW4gYW5kIGNhbm5vdCBiZSBjaGFuZ2Vk
Lg0KPiArICogICAgICAgICAgICAgICAgICBUbyByZXR1cm4gYWRkaXRpb25hbCB2YWx1ZXMs
IHVzZSBlLmcuIHRoZSByZXR1cm4NCj4gKyAqICAgICAgICAgICAgICAgICAgdmFsdWUobm8g
bmVlZCB0byBjaGFuZ2UgYWxsIGNhbGxlcnMpIG9mIHRoaXMgZnVuY3Rpb24uDQo+ICsgKiBA
cmV0dXJucyAgICAgICAgIHN0cnVjdCB3aXRoIG5vbi1hZmZpbmUgcnVubmluZyB0aW1lIHNp
bmNlIHZjcHUgY3JlYXRpb24NCj4gKyAqLw0KPiArdmNwdV9ydW5zdGF0ZV9leHRyYV90IHZj
cHVfcnVuc3RhdGVfZ2V0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8g
KnJ1bnN0YXRlKQ0KDQpSZXR1cm5pbmcgYSBzdHJ1Y3QgYnkgdmFsdWUgaXMgbGltaXRpbmcg
dGhlIHBvc3NpYmlsaXR5IHRvIGV4cGFuZCB0aGlzDQpzdHJ1Y3QgbGF0ZXIuDQoNCkkgZG9u
J3QgdGhpbmsgaXQgaXMgYSBnb29kIGlkZWEgdG8gZG8gaXQgdGhpcyB3YXkuDQoNCj4gICB7
DQo+ICAgICAgIHNwaW5sb2NrX3QgKmxvY2s7DQo+ICAgICAgIHNfdGltZV90IGRlbHRhOw0K
PiAgICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsNCj4gKyAgICB2Y3B1X3J1bnN0YXRl
X2V4dHJhX3QgcmV0Ow0KPiAgIA0KPiAgICAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNf
cmN1bG9jayk7DQo+ICAgDQo+IEBAIC0zNDMsMTQgKzM1NiwyMyBAQCB2b2lkIHZjcHVfcnVu
c3RhdGVfZ2V0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDogdi0+c2NoZWRfdW5pdDsNCj4gICAgICAgbG9jayA9IGxpa2VseSh2ID09
IGN1cnJlbnQpID8gTlVMTCA6IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7DQo+ICAg
ICAgIG1lbWNweShydW5zdGF0ZSwgJnYtPnJ1bnN0YXRlLCBzaXplb2YoKnJ1bnN0YXRlKSk7
DQo+ICsgICAgcmV0Lm5vbmFmZmluZV90aW1lID0gdi0+bm9uYWZmaW5lX3RpbWU7IC8qIGFj
Y3VtdWxhdGVkIG5vbmFmZmluZSB0aW1lICovDQo+ICsNCj4gICAgICAgZGVsdGEgPSBOT1co
KSAtIHJ1bnN0YXRlLT5zdGF0ZV9lbnRyeV90aW1lOw0KPiAgICAgICBpZiAoIGRlbHRhID4g
MCApDQo+ICsgICAgew0KPiAgICAgICAgICAgcnVuc3RhdGUtPnRpbWVbcnVuc3RhdGUtPnN0
YXRlXSArPSBkZWx0YTsNCj4gICANCj4gKyAgICAgICAgaWYgKCBub25hZmZpbmUodiwgdW5p
dCkgKSAvKiBXaGVuIHJ1bm5pbmcgbm9uYWZmaW5lLCBhZGQgdGhlIGRlbHRhICovDQo+ICsg
ICAgICAgICAgICByZXQubm9uYWZmaW5lX3RpbWUgKz0gZGVsdGE7DQo+ICsgICAgfQ0KPiAr
DQo+ICAgICAgIGlmICggdW5saWtlbHkobG9jayAhPSBOVUxMKSApDQo+ICAgICAgICAgICB1
bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdW5pdCk7DQo+ICAgDQo+ICAgICAgIHJj
dV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOw0KPiArDQo+ICsgICAgcmV0dXJu
IHJldDsNCj4gICB9DQo+ICAgDQo+ICAgdWludDY0X3QgZ2V0X2NwdV9pZGxlX3RpbWUodW5z
aWduZWQgaW50IGNwdSkNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy92Y3B1
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvdmNwdS5oDQo+IGluZGV4IGY3NDQ1YWMwYjAuLjU5
ZTY2NDdhMjQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy92Y3B1LmgNCj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaA0KPiBAQCAtNzksOCArNzksMTggQEAg
c3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyB7DQo+ICAgICAgIHVpbnQ2NF90IHRpbWVbNF07
DQo+ICAgfTsNCj4gICB0eXBlZGVmIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gdmNwdV9y
dW5zdGF0ZV9pbmZvX3Q7DQo+ICsvKiB2Y3B1X3J1bnN0YXRlX2luZm9fdCBpcyBpbiB0aGUg
R3Vlc3Qgc2hhcmVkIG1lbW9yeSBhcmVhIChmcm96ZW4gQUJJKSAqLw0KPiAgIERFRklORV9Y
RU5fR1VFU1RfSEFORExFKHZjcHVfcnVuc3RhdGVfaW5mb190KTsNCj4gICANCj4gKy8qDQo+
ICsgKiBFeHRyYSBpbmZvcm1hdGlvbiByZXR1cm5lZCBmcm9tIHZjcHVfcnVuc3RhdGVfZ2V0
IHRoYXQgaXMgbm90IHBhcnQNCj4gKyAqIG9mIHRoZSBHdWVzdCBzaGFyZWQgbWVtb3J5IGFy
ZWEgKG5vdCBwYXJ0IG9mIHRoZSBmcm96ZW4gR3Vlc3QgQUJJKQ0KPiArICovDQo+ICtzdHJ1
Y3QgdmNwdV9ydW5zdGF0ZV9leHRyYSB7DQo+ICsgICAgdWludDY0X3Qgbm9uYWZmaW5lX3Rp
bWU7IC8qIFRpbWUgcnVubmluZyBvdXRzaWRlIHNvZnRfYWZmaW5pdHkgbWFzayAqLw0KPiAr
fTsNCj4gK3R5cGVkZWYgc3RydWN0IHZjcHVfcnVuc3RhdGVfZXh0cmEgdmNwdV9ydW5zdGF0
ZV9leHRyYV90Ow0KPiArDQoNCklzIGl0IHJlYWxseSBuZWVkZWQgdG8gYWRkIHRoaXMgdG8g
dGhlIHB1YmxpYyBoZWFkZXI/IFRoaXMgd2F5IHlvdSBhcmUNCmp1c3QgYWRkaW5nIGFub3Ro
ZXIgc3RhYmxlIGludGVyZmFjZSB3aGljaCBjYW4ndCBiZSBleHBhbmRlZCBlYXNpbHkuDQoN
Cj4gICAvKiBWQ1BVIGlzIGN1cnJlbnRseSBydW5uaW5nIG9uIGEgcGh5c2ljYWwgQ1BVLiAq
Lw0KPiAgICNkZWZpbmUgUlVOU1RBVEVfcnVubmluZyAgMA0KPiAgIA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0K
PiBpbmRleCBhYmE2MGFmZDRmLi40ZmRiYmFlYTg3IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiBA
QCAtMTExMCw4ICsxMTEwLDggQEAgaW50IHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoc3RydWN0
IHZjcHUgKnYsIGNvbnN0IGNwdW1hc2tfdCAqYWZmaW5pdHkpOw0KPiAgIGludCB2Y3B1X2Fm
ZmluaXR5X2RvbWN0bChzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBjbWQsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX3ZjcHVhZmZpbml0eSAq
dmNwdWFmZik7DQo+ICAgDQo+IC12b2lkIHZjcHVfcnVuc3RhdGVfZ2V0KGNvbnN0IHN0cnVj
dCB2Y3B1ICp2LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmNwdV9ydW5z
dGF0ZV9pbmZvICpydW5zdGF0ZSk7DQo+ICt2Y3B1X3J1bnN0YXRlX2V4dHJhX3QgdmNwdV9y
dW5zdGF0ZV9nZXQoY29uc3Qgc3RydWN0IHZjcHUgKnYsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVu
c3RhdGUpOw0KPiAgIHVpbnQ2NF90IGdldF9jcHVfaWRsZV90aW1lKHVuc2lnbmVkIGludCBj
cHUpOw0KPiAgIHZvaWQgc2NoZWRfZ3Vlc3RfaWRsZSh2b2lkICgqaWRsZSkgKHZvaWQpLCB1
bnNpZ25lZCBpbnQgY3B1KTsNCj4gICB2b2lkIHNjaGVkdWxlcl9lbmFibGUodm9pZCk7DQoN
Cg0KSnVlcmdlbg0KDQo=
--------------aNNl8KwH0nAdCNFf0WPJR6Ej
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------aNNl8KwH0nAdCNFf0WPJR6Ej--

--------------EvFKCEAH4v06Jf646znQYx8L--

--------------zbSv5tpB918REET5r0WQulCV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh+KV0FAwAAAAAACgkQsN6d1ii/Ey+a
nAf/XjpTvfsGIcSRPjvjTLLTfJA8NJ7oTcNVnE+JebjFuhK6sMvPuYinjH3tx1Mx7T4VRQ6u7gKH
18x1QAv24nt7hmXGluKtVXanHKXHGMQDAwbFp9x+Bly1HBXxLyidgUmFD/JpuUG4BwXn7OfpE7s7
p55sM8z8kSAHxUO+P40a7+4p+14dclIMXH0/BeoC3X4TXUAbjpRx/CORBj3OXQ0iXI+ukqIIcdc7
uK4rT07WtqJUa7azG67ymeT3cmyOrMOFq//Y/h5H6MBi9p280680BhPApu/B6j2a5VsiCSxbpLsM
XXH+ad0e2F4Kf5YgIyjR++qgaIcRKJSGiENDFg9O4g==
=MfN6
-----END PGP SIGNATURE-----

--------------zbSv5tpB918REET5r0WQulCV--

