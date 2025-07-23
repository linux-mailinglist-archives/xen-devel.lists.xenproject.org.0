Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20ECB0EBE8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:29:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053379.1422143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTuu-0008Sq-6F; Wed, 23 Jul 2025 07:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053379.1422143; Wed, 23 Jul 2025 07:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTuu-0008Qv-3V; Wed, 23 Jul 2025 07:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1053379;
 Wed, 23 Jul 2025 07:29:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEQx=2E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ueTus-0008Ql-Fg
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:29:30 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id becaecc5-6796-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:29:19 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aec5a714ae9so814357966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 00:29:19 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79aebasm997908966b.23.2025.07.23.00.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 00:29:18 -0700 (PDT)
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
X-Inumbo-ID: becaecc5-6796-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753255759; x=1753860559; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MRfBc9s/GkhurgLMtQ2D4qhGwgaGaPnBd4cnIh8nTuQ=;
        b=MS0c4avf7lgKBKGty1QDbKdq9kw0OP9EpqI6e1BwN8QgGpSJUE0o3IKVanD0t+TVsA
         mX3EV/7eJ51pgvIso3YDYF6IvPly+gfiZzKiIRTXrOJFF2dhX7Jk9hN7oIMuljnCUGib
         ZZcpdqv0Kbf7lg+SzOUdCNwU0KADIXxa6iNYA0wctv9nE/mu4l8YnAMeknzYQjjvuU3r
         A+qdjHsd0s1KLcvjiMel4W0S0dBN5MsoK9Bw15Zf4h9j9JaMnI3iizu6JWhcHdUi2lOo
         hSI7iWbeWExbjWcFD/7XtO8MLqsKysFl/xk8bEES6g2pAqloHZU4tgSXDRuqZAT+jSjW
         RW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753255759; x=1753860559;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRfBc9s/GkhurgLMtQ2D4qhGwgaGaPnBd4cnIh8nTuQ=;
        b=vA3YAftYD7RsN66IELmhsKpugVg6wWGXEEq79ZRe0RNuJM4EcP5jZDcMUl9AwpWkoh
         N+HWwwOT3RmwdHqrLDUpm+svvgJzRcYRsluNEpxGTJO3NrYJHRHil+b/n22L4Zubbgba
         brw7P8Q+Y95+zbivNwQ4w8aYvQDXTa4JH/WX5V62NSpT0mZZeYXWTE4xHJou8RRS7wgi
         SPs1Hz4Wi8WgH/0MrogiowIjdD51XJd/eRpOyANsp2OjmpS1YNXLNZz0AxxmDMKkTKpi
         7sVHv7PB8Sf3dgkaNHRa1mFBbR+UiqrHtzLKf60AaDavBBkWiiGy319Xpe0kcKdE9YQy
         8HmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjbsRNajwbuZ6tre2WCrYHcDfGaY4fI01iCvUPLVmyaPYuyw86EqVm3MqYWn0Td11raUfUrc9mR40=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvpEUFvfkT3+Iumjm4ksBmW+VSnnFdrkjO9nUL5VwGDNKaIiYr
	+2upOC/XlpyyDhZ7FBu0zHd5cUzD+icIky9kReqbTs1gF6dlT7GTsPk4YKXwW4WDC94=
X-Gm-Gg: ASbGncsd5T6Me2F39eeWFxDv0fxk6WmUxriwB9qH45enbwjInZ7nIeG2CEN1wscLI4X
	ba54CS79qblIbvQuSflT4Zv0wt6qAwaZgrqdUvUdBpj5QjR7ae2tslFkILiz7+hA2ToPuFYE+lY
	rifQTQJW/1MAfads+dqRt+Rm5z0IEXns8mizmdS+LsQWbhjYGPVFKZ5qpwdR6bqKkIK3E4ljV2j
	GDNHFp8Yj1Gzbg/oWXtj1emohkdJTd1GjxU+6EUB/pEG/+eNoNVt9WcxpLErvfaOKoMz8ywEu5v
	RToPDu6qWzAFcygaie0iJHVmq1OZpFrs1JTUv8UFxNvUNKYwyLdl/g6bLDZr/zc9M68/q3Md7Wc
	Owk4u4KXL47IChUtcaNvuT/ObC1SsGgH+jfmMA0b437mpXlShhpW/a63mvbGYuOul7Zl7AQQUHI
	UVg3/jrRssnAt1fJx3nR4M2PuonDBEvgbRfuvY/YPIGo7+
X-Google-Smtp-Source: AGHT+IEPww4EY5cUzi2+PkG20y7SUfPSRQaFxdFH9msMS8tBgExvM+ROPF7z2jznKs3IojJ1eONlJA==
X-Received: by 2002:a17:907:3d0d:b0:ae0:da2d:44b9 with SMTP id a640c23a62f3a-af2f64b604cmr192664566b.7.1753255758521;
        Wed, 23 Jul 2025 00:29:18 -0700 (PDT)
Message-ID: <62ce197b-5e80-4605-84de-4257936d472c@suse.com>
Date: Wed, 23 Jul 2025 09:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
 <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
 <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
 <b33a1b88-dca1-42f1-874a-5681eea53336@suse.com>
 <d0081137-7eef-4866-8261-1148cf53db99@suse.com>
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
In-Reply-To: <d0081137-7eef-4866-8261-1148cf53db99@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KMe7rTbb6KEUNLSRvxJoIg5j"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KMe7rTbb6KEUNLSRvxJoIg5j
Content-Type: multipart/mixed; boundary="------------8V00XLTBhYwl8b4WHCKSxkNi";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <62ce197b-5e80-4605-84de-4257936d472c@suse.com>
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
 <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
 <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
 <b33a1b88-dca1-42f1-874a-5681eea53336@suse.com>
 <d0081137-7eef-4866-8261-1148cf53db99@suse.com>
In-Reply-To: <d0081137-7eef-4866-8261-1148cf53db99@suse.com>
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

--------------8V00XLTBhYwl8b4WHCKSxkNi
Content-Type: multipart/mixed; boundary="------------ROexSV6iH4kBG8kS5SjMp0hh"

--------------ROexSV6iH4kBG8kS5SjMp0hh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDcuMjUgMDk6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNy4yMDI1
IDA4OjU1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjMuMDcuMjUgMDg6NDMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjA3LjIwMjUgMDg6MzQsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDIzLjA3LjI1IDA4OjI4LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDIyLjA3LjIwMjUgMDI6MTksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+Pj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYw0KPj4+Pj4+ICsrKyBiL3hlbi9jb21tb24v
ZG9tYWluLmMNCj4+Pj4+PiBAQCAtMTk1LDYgKzE5NSwxNCBAQCBzdGF0aWMgdm9pZCBzZXRf
ZG9tYWluX3N0YXRlX2luZm8oc3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAq
aW5mbywNCj4+Pj4+PiAgICAgICAgICAgICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dF
VERPTVNUQVRFX1NUQVRFX0RZSU5HOw0KPj4+Pj4+ICAgICAgICAgaWYgKCBkLT5pc19keWlu
ZyA9PSBET01EWUlOR19kZWFkICkNCj4+Pj4+PiAgICAgICAgICAgICBpbmZvLT5zdGF0ZSB8
PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RFQUQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+
ICsgICAgaW5mby0+Y2FwcyA9IDA7DQo+Pj4+Pj4gKyAgICBpZiAoIGlzX2NvbnRyb2xfZG9t
YWluKGQpICkNCj4+Pj4+PiArICAgICAgICBpbmZvLT5jYXBzIHw9IFhFTl9ET01DVExfR0VU
RE9NU1RBVEVfQ0FQX0NPTlRST0w7DQo+Pj4+Pj4gKyAgICBpZiAoIGlzX2hhcmR3YXJlX2Rv
bWFpbihkKSApDQo+Pj4+Pj4gKyAgICAgICAgaW5mby0+Y2FwcyB8PSBYRU5fRE9NQ1RMX0dF
VERPTVNUQVRFX0NBUF9IQVJEV0FSRTsNCj4+Pj4+PiArICAgIGlmICggaXNfeGVuc3RvcmVf
ZG9tYWluKGQpICkNCj4+Pj4+PiArICAgICAgICBpbmZvLT5jYXBzIHw9IFhFTl9ET01DVExf
R0VURE9NU1RBVEVfQ0FQX1hFTlNUT1JFOw0KPj4+Pj4+ICAgICAgICAgaW5mby0+dW5pcXVl
X2lkID0gZC0+dW5pcXVlX2lkOw0KPj4+Pj4+ICAgICB9DQo+Pj4+Pg0KPj4+Pj4gVGhpcyBi
ZWluZyBhIHN0YWJsZSBzdWItb3AsIGRvbid0IHdlIG5lZWQgYSB3YXkgdG8gaW5kaWNhdGUg
dG8gdGhlIGNhbGxlcg0KPj4+Pj4gX3RoYXRfIHRoaXMgZmllbGQgaGFzIHZhbGlkIGRhdGEg
bm93PyBXaGVuIG5vbi16ZXJvIGl0J3MgZWFzeSB0byB0ZWxsLCBidXQNCj4+Pj4+IGdldHRp
bmcgYmFjayB6ZXJvIGlzIGFtYmlndW91cy4NCj4+Pj4NCj4+Pj4gVGhlIGh5cGVyY2FsbCBz
dWItb3Agd2FzIGludHJvZHVjZWQgaW4gdGhpcyBkZXZlbG9wbWVudCBjeWNsZSBvbmx5LCBz
bw0KPj4+PiB0aGVyZSBpcyBubyByZWxlYXNlZCBYZW4gaHlwZXJ2aXNvciB3aXRob3V0IHRo
ZSBjYXBhYmlsaXR5IHNldHRpbmcuDQo+Pj4+DQo+Pj4+IEluIGNhc2UgdGhpcyBwYXRjaCBk
b2Vzbid0IG1ha2UgaXQgaW50byA0LjIxLCB0aGUgY2FzZSB5b3UgYXJlIG1lbnRpb25pbmcN
Cj4+Pj4gbXVzdCBiZSBoYW5kbGVkLCBvZiBjb3Vyc2UuDQo+Pj4NCj4+PiBIbW0sIHllcywg
dGhpcyB3YXkgaXQncyBvbiB0aGUgZWRnZS4gQXMgYSBzdGFibGUgc3ViLW9wLCBzb21lb25l
IGNvdWxkIGhhdmUNCj4+PiBiYWNrcG9ydGVkIHRoZSBjaGFuZ2UsIHRob3VnaC4gSU9XIChh
bmQgaW4gZ2VuZXJhbCkgSSB3b25kZXIgd2hldGhlciBmb3INCj4+PiBzdGFibGUgc3ViLW9w
cyB3ZSBzaG91bGRuJ3QgYmUgcHJldHR5IHN0cmljdCBhYm91dCBmdW5jdGlvbmFsIGV4dGVu
c2lvbnMsDQo+Pj4gbm90IHR5aW5nIHRoZWlyIGFkZGl0aW9uIHRvIHJlbGVhc2VzIGF0IGFs
bC4NCj4+DQo+PiBTaG91bGQgd2UgcmVhbGx5IGNhcmUgYWJvdXQgZG93bnN0cmVhbXMgYmFj
a3BvcnRpbmcgbm90IHlldCByZWxlYXNlZA0KPj4gZnVuY3Rpb25hbGl0eT8NCj4+DQo+PiBV
c2luZyB5b3VyIHJlYXNvbmluZyB0aGlzIHdvdWxkIG1lYW4gd2UnZCBuZWVkIHRvIGlzc3Vl
IFhTQXMgZm9yIG5vdCB5ZXQNCj4+IHJlbGVhc2VkIGh5cGVydmlzb3IgaXNzdWVzIG9mIHN0
YWJsZSBpbnRlcmZhY2VzLCB0b28uIEkgZG9uJ3QgdGhpbmsgd2UNCj4+IHdhbnQgdG8gZG8g
dGhhdC4NCj4gDQo+IFRvIG1lLCB0aGUgbGF0dGVyIGRvZXNuJ3QgbmVjZXNzYXJpbHkgZm9s
bG93IGZyb20gdGhlIGZvcm1lci4gQnV0IGFueXdheSwgSSdtDQo+IG5vdCBnb2luZyB0byBp
bnNpc3QsIGJ1dCBJIHdhbnRlZCB0aGUgc2l0dWF0aW9uIHRvIGF0IGxlYXN0IGJlIGNvbnNp
ZGVyZWQuIEluDQo+IHBhcnRpY3VsYXIgYWxzbyBmb3J3YXJkLWxvb2tpbmcsIHdoZW4gd2Ug
bWF5IGdhaW4gbW9yZSBzdGFibGUgc3ViLW9wcy4gQXQgc29tZQ0KPiBwb2ludCBpdCBtYXkg
dHVybiBvdXQgbmVjZXNzYXJ5IHRvIGJhY2twb3J0IHN1Y2ggZXZlbiBpbnRvIHVwc3RyZWFt
IGJyYW5jaGVzLg0KDQpJIHRoaW5rIGl0IGlzIGZpbmUgdG8gZGlzY3VzcyB0aGlzIHNpdHVh
dGlvbi4NCg0KSSdkIHN1Z2dlc3Qgbm90IHRvIHN1cHBvcnQgYW55IHBvdGVudGlhbCBkb3du
c3RyZWFtIGJhY2twb3J0cyBvZiBub3QgeWV0DQpyZWxlYXNlZCBmdW5jdGlvbmFsaXR5LiBD
b25zaWRlciBhIG5ldyBpbnRlcmZhY2UgYmVpbmcgZGV2ZWxvcGVkIGluIGEgbGFyZ2VyDQpw
YXRjaCBzZXJpZXMuIEluIGNhc2UgdGhlIHNlcmllcyBpcyBub3QgYmVpbmcgY29tbWl0dGVk
IGluIG9uZSBnbywgd291bGQgeW91DQp3YW50IHRvIHN1cHBvcnQgYmFja3BvcnRzIG9mIG9u
bHkgYSBwYXJ0IG9mIGl0PyBXaGF0IGFib3V0IGZpeGVzIG9mIHRoYXQNCmludGVyZmFjZSBp
biB0aGUgY3VycmVudCByZWxlYXNlIGN5Y2xlLCBlLmcuIGR1ZSB0byB0aGUgdXNlIGNhc2Vz
IGhhdmluZyBiZWVuDQpjb21taXR0ZWQgb25seSBzb21lIHRpbWUgbGF0ZXIgdW5jb3Zlcmlu
ZyB0aGUgbmVlZCB0byBjaGFuZ2UgdGhlIGludGVyZmFjZQ0KdG8gbWFrZSBpdCBzYWZlPw0K
DQoNCkp1ZXJnZW4NCg==
--------------ROexSV6iH4kBG8kS5SjMp0hh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ROexSV6iH4kBG8kS5SjMp0hh--

--------------8V00XLTBhYwl8b4WHCKSxkNi--

--------------KMe7rTbb6KEUNLSRvxJoIg5j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiAj00FAwAAAAAACgkQsN6d1ii/Ey/Y
pQf8Cbry7kOXGiRLCc7N67utCgiEdgUICRrp5Cj7m9hPxOz4ZHFH8HJVeCawMfXJJmg7Aqvam8lD
vu7RAcKj5BVd0PpUrmveF/62w8x2S9943B78mEJA0BthGP4IINbZJBxNGg/kYWnyFGq6Dhzrk5NN
H/rY6kHiTgYwtybG42Yrr3+ZO8CR+epjjnfX1/cxCEAVrXows6g5XhnykV3ipF+CwqgfHg4uNPrs
dl8nmu/CoQtimIIbc3a+GOQL9wz9cDz+PP8J/SOrI4njdaOAkM6DfEflu9DMCJLeyTLew/pUk/8Q
fmMlLQdpKmRg2gOhQ7XDSRnYRZl4+ilOOQll7SrLFQ==
=3anj
-----END PGP SIGNATURE-----

--------------KMe7rTbb6KEUNLSRvxJoIg5j--

