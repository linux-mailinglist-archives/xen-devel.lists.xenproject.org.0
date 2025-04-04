Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04594A7B84B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937861.1338731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bdf-0005q0-FX; Fri, 04 Apr 2025 07:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937861.1338731; Fri, 04 Apr 2025 07:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bdf-0005nn-C0; Fri, 04 Apr 2025 07:38:55 +0000
Received: by outflank-mailman (input) for mailman id 937861;
 Fri, 04 Apr 2025 07:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u0bde-0005Wd-Ci
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:38:54 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db321eae-1127-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 09:38:52 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1c6ff8so3234697a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:38:52 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a9c9sm2034213a12.41.2025.04.04.00.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:38:51 -0700 (PDT)
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
X-Inumbo-ID: db321eae-1127-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743752332; x=1744357132; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6F3lg40gWNXXM8tzSYOkcqNEacl/M3IDIYky3PiKnR4=;
        b=K4tMCJ/jWQD4cUGtlbYmsK2nVxhCsUhOdsKJz3CBz62wehRi3vdC+rZkY/UEm8pM2F
         zi8DEO+GPXTeV/ghWtGScii1G5XCwFzm0Y3/Ns/JggmSejOY5oFpavuiEsabqfOBW4k+
         k/NfSaPbkSlgCbFlbFkklWBgEJq8Lb+A5DZ46yZI0/nIPVAWO4RW8mc5ok098GefSjuA
         EGiFqj5u/VVXR0KjdHUozgu9T3a2jcxg8oCtGlZEzn6J5jp3q4va8S6btY8EXMS/cQ5V
         QIl4Pu1gLlbcJTnC08aAawCVeUgAsUJyrWZvqhzXf/a+M9OHbz/GhYP+/U9b4QL5MNad
         CZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752332; x=1744357132;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6F3lg40gWNXXM8tzSYOkcqNEacl/M3IDIYky3PiKnR4=;
        b=CBuxytGc+wgMCM5olmVTIZmK866tZuNa/L4/Ba1qEhlh1R7thziRtjjMM1MB4uhXUX
         CxbrynIfChemMv6sSjlP76QjKvf/AwFdNm6Vj0yOWnJ5hvrdmL1vgUsAi8KwFcy+R+yf
         chT0GbYh/4X8E5cJge02HwsmosrtjREbZnZVYcFwVQOuL54yu+RXaNz7q6PqLewb5sUR
         ZpXhbbNfUip5f0ZweRkCn4Fpn6zUEsB1NvKKDHZZoQI2CGWEM/VovbRXOc+szcbmsvXu
         KrfqbRjM5pn1cGZwa3kraoltcP33HU1FUefKfBrplooml05wq0KiNiZN6WTcgYQdHmQn
         G+bw==
X-Forwarded-Encrypted: i=1; AJvYcCX/FwnguhlqhF3WRiwoiNgGgc7kv74Ba2NPGbLaKKpoz1XQr5dCyQgvcUyiv4yQWaEykQfWhaRdrLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy36Fv+6IAusS1bLJ8JeTvgW1gu3yLHcM8SDRDgTPyDgDlHpMLH
	mVe1gu0fbvYUD6SmiaSqM5nkm6f8pecjliwBTRBdI37iy5JsZ8JWfDDXjhoWyWY=
X-Gm-Gg: ASbGncs0ydDuOS6wHF4BUq0dnBgWHpDqkMQbspGGiJEr9sQBzymB4VEk3tF6zOnE/iQ
	Mr6J5z0dvRt3EELIKyX1PBR5uFnIuUqUCiAgAPEDsAoGC6NZ5zy5EMYHBGeP9xZCZDlFnVb/VuG
	JBYe68GU3q0Aq+K7lz9BJE48Vg8vpsgOH9UPX3oBbaD84am9YTYlftUD4Z80xvW63XLgL8e9orO
	/Tu/r25Itlfw8S7/uWZsWFos584eZGapPKXqtKFDERv8w2jrxAFVgyTsX8jQbWmwvmE7HSMEOrk
	iMDb1rA/gY+fa8DgdMEYUxfHzkOv6Sja5t8X5B4ccfsEWXZEQJ7SLh3hxml38Lsa8z2NH84MEaY
	bCESUP1JbPxSgg/Fj+iZIOYSXAw+yaBuQeIJwx4SQ3hnIdJ7Gbcf+D3AVvayqa1NIBfnVog==
X-Google-Smtp-Source: AGHT+IFfJsxhw7oogLkUFQJYPvOcG41omT39S8YNHDmmDMSKVLVdlx+p4RvI327g2tpqetU3SS3O5w==
X-Received: by 2002:a05:6402:50cc:b0:5e7:b02b:381f with SMTP id 4fb4d7f45d1cf-5f0b66271aemr1321583a12.30.1743752332190;
        Fri, 04 Apr 2025 00:38:52 -0700 (PDT)
Message-ID: <a03cd26b-c1b0-44d3-8bd8-f9c24d7ada5a@suse.com>
Date: Fri, 4 Apr 2025 09:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/null: avoid another crash after failed domU
 creation
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250403214829.128294-1-stewart.hildebrand@amd.com>
 <2b8e33f7-7e51-4ab5-ba1e-9d30d14be3bb@suse.com>
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
In-Reply-To: <2b8e33f7-7e51-4ab5-ba1e-9d30d14be3bb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DptvhkxxIkgtM5BhtcWN4AoV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DptvhkxxIkgtM5BhtcWN4AoV
Content-Type: multipart/mixed; boundary="------------QlgOJLDV74Vs6u93yw0sWUGS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <a03cd26b-c1b0-44d3-8bd8-f9c24d7ada5a@suse.com>
Subject: Re: [PATCH] sched/null: avoid another crash after failed domU
 creation
References: <20250403214829.128294-1-stewart.hildebrand@amd.com>
 <2b8e33f7-7e51-4ab5-ba1e-9d30d14be3bb@suse.com>
In-Reply-To: <2b8e33f7-7e51-4ab5-ba1e-9d30d14be3bb@suse.com>
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

--------------QlgOJLDV74Vs6u93yw0sWUGS
Content-Type: multipart/mixed; boundary="------------n50QHNCqkIax68GF15RsvDW8"

--------------n50QHNCqkIax68GF15RsvDW8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDQuMjUgMDk6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wNC4yMDI1
IDIzOjQ4LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+PiBUaGUgZm9sbG93aW5nIHNl
cXVlbmNlIG9mIGV2ZW50cyBtYXkgbGVhZCBhIGRlYnVnIGJ1aWxkIG9mIFhlbiB0byBjcmFz
aA0KPj4gd2hlbiB1c2luZyB0aGUgbnVsbCBzY2hlZHVsZXI6DQo+Pg0KPj4gMS4gZG9tYWlu
IGNyZWF0aW9uIChlLmcuIGQxKSBmYWlsZWQgZHVlIHRvIGJhZCBjb25maWd1cmF0aW9uDQo+
PiAyLiBjb21wbGV0ZV9kb21haW5fZGVzdHJveSgpIHdhcyBkZWZlcnJlZA0KPj4gMy4gZG9t
YWluIGNyZWF0aW9uIChlLmcuIGQyKSBzdWNjZWVkcw0KPj4NCj4+IEF0IHRoaXMgcG9pbnQs
IGQyIGlzIHJ1bm5pbmcsIHdoaWxlIHRoZSB6b21iaWUgZDEgaXMgbm90IGZ1bGx5IGNsZWFu
ZWQNCj4+IHVwOg0KPj4NCj4+IChYRU4pIE9ubGluZSBDcHVzOiAwLTMNCj4+IChYRU4pIENw
dXBvb2wgMDoNCj4+IChYRU4pIENwdXM6IDAtMw0KPj4gKFhFTikgU2NoZWR1bGluZyBncmFu
dWxhcml0eTogY3B1LCAxIENQVSBwZXIgc2NoZWQtcmVzb3VyY2UNCj4+IChYRU4pIFNjaGVk
dWxlcjogbnVsbCBTY2hlZHVsZXIgKG51bGwpDQo+PiAoWEVOKSAgIGNwdXNfZnJlZSA9IDMN
Cj4+IChYRU4pIERvbWFpbiBpbmZvOg0KPj4gKFhFTikgICBEb21haW46IDANCj4+IChYRU4p
ICAgICAxOiBbMC4wXSBwY3B1PTANCj4+IChYRU4pICAgICAyOiBbMC4xXSBwY3B1PTENCj4+
IChYRU4pICAgRG9tYWluOiAxDQo+PiAoWEVOKSAgICAgMzogWzEuMF0gcGNwdT0yDQo+PiAo
WEVOKSAgIERvbWFpbjogMg0KPj4gKFhFTikgICAgIDQ6IFsyLjBdIHBjcHU9Mg0KPj4NCj4+
IDQuIGNvbXBsZXRlX2RvbWFpbl9kZXN0cm95KCkgZ2V0cyBjYWxsZWQgZm9yIGQxIGFuZCB0
cmlnZ2VycyB0aGUNCj4+IGZvbGxvd2luZzoNCj4+DQo+PiAoWEVOKSBYZW4gY2FsbCB0cmFj
ZToNCj4+IChYRU4pICAgIFs8MDAwMDBhMDAwMDMyMmVkND5dIG51bGwuYyN1bml0X2RlYXNz
aWduKzB4MmQ4LzB4YjcwIChQQykNCj4+IChYRU4pICAgIFs8MDAwMDBhMDAwMDMyNDU3Yz5d
IG51bGwuYyNudWxsX3VuaXRfcmVtb3ZlKzB4NjcwLzB4YmE4IChMUikNCj4+IChYRU4pICAg
IFs8MDAwMDBhMDAwMDMyNDU3Yz5dIG51bGwuYyNudWxsX3VuaXRfcmVtb3ZlKzB4NjcwLzB4
YmE4DQo+PiAoWEVOKSAgICBbPDAwMDAwYTAwMDAzMzY0MDQ+XSBzY2hlZF9kZXN0cm95X3Zj
cHUrMHgzNTQvMHg4ZmMNCj4+IChYRU4pICAgIFs8MDAwMDBhMDAwMDIyNzMyND5dIGRvbWFp
bi5jI2NvbXBsZXRlX2RvbWFpbl9kZXN0cm95KzB4MTFjLzB4NDljDQo+PiAoWEVOKSAgICBb
PDAwMDAwYTAwMDAyOWZiZDA+XSByY3VwZGF0ZS5jI3JjdV9kb19iYXRjaCsweDk0LzB4M2Qw
DQo+PiAoWEVOKSAgICBbPDAwMDAwYTAwMDAyYTEwYzA+XSByY3VwZGF0ZS5jI19fcmN1X3By
b2Nlc3NfY2FsbGJhY2tzKzB4MTYwLzB4NWY0DQo+PiAoWEVOKSAgICBbPDAwMDAwYTAwMDAy
YTFlNjA+XSByY3VwZGF0ZS5jI3JjdV9wcm9jZXNzX2NhbGxiYWNrcysweGNjLzB4MWIwDQo+
PiAoWEVOKSAgICBbPDAwMDAwYTAwMDAyYTM0NjA+XSBzb2Z0aXJxLmMjX19kb19zb2Z0aXJx
KzB4MWY0LzB4M2Q4DQo+PiAoWEVOKSAgICBbPDAwMDAwYTAwMDAyYTM3YzQ+XSBkb19zb2Z0
aXJxKzB4MTQvMHgxYw0KPj4gKFhFTikgICAgWzwwMDAwMGEwMDAwNDY1MjYwPl0gdHJhcHMu
YyNjaGVja19mb3JfcGNwdV93b3JrKzB4MzAvMHhiOA0KPj4gKFhFTikgICAgWzwwMDAwMGEw
MDAwNDZiYjA4Pl0gbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdCsweDI4LzB4MTk4DQo+PiAo
WEVOKSAgICBbPDAwMDAwYTAwMDA0MDljODQ+XSBlbnRyeS5vI2d1ZXN0X3N5bmNfc2xvd3Bh
dGgrMHhhYy8weGQ4DQo+PiAoWEVOKQ0KPj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKg0KPj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6DQo+PiAoWEVO
KSBBc3NlcnRpb24gJ25wYy0+dW5pdCA9PSB1bml0JyBmYWlsZWQgYXQgY29tbW9uL3NjaGVk
L251bGwuYzozODMNCj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioNCj4+DQo+PiBGaXggYnkgc2tpcHBpbmcgdW5pdF9kZWFzc2lnbigpIHdoZW4g
dGhlIHVuaXQgdG8gYmUgcmVtb3ZlZCBkb2VzIG5vdA0KPj4gbWF0Y2ggdGhlIHBjcHUncyBj
dXJyZW50bHkgYXNzaWduZWQgdW5pdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0
IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPiANCj4gSnVzdCBv
bmUgcmVtYXJrIGhlcmU6IFRoaXMgYWxtb3N0IGNlcnRhaW5seSB3YW50cyBhIEZpeGVzOiB0
YWcuDQoNClRoaXMgd2lsbCBwcm9iYWJseSBiZSBkNjcxZGEzYmUzY2EgKHRoZSBpbml0aWFs
IE5VTEwgc2NoZWR1bGVyIGNvbW1pdCkuDQoNCg0KSnVlcmdlbg0KDQo=
--------------n50QHNCqkIax68GF15RsvDW8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------n50QHNCqkIax68GF15RsvDW8--

--------------QlgOJLDV74Vs6u93yw0sWUGS--

--------------DptvhkxxIkgtM5BhtcWN4AoV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfvjIsFAwAAAAAACgkQsN6d1ii/Ey/k
AwgAm4B5FbEy2pbfIr9zjZidowOXUTSnGe6w9NZaC6nbY0lXYtYESsARS+Boe+ksvfoK83+ZQ+72
F7HwdIZsk5rFMZU0b46kJaTzbhywzvnkwarH6nYMQYqbtg2/tvKgkJaKlWNx7rCP3Iod0eVPYvWX
+SycVH/EqJgBygFqwZLatqn15dy2Vs8n91oMpGDoJCeYkbdy4Qa63ZeFdahk+MrlALlKCncptelM
06sFtdqZRN9rlKme6gdjGaICgVlMKd0NrmY3fW98sGx81FEJECO+rbtFq/I8jCxQwC0+T86EFtMH
SuM/6UKKDkqBF9VdJsHwhnyMPujiE2yt4oFyV7gr4A==
=e2cE
-----END PGP SIGNATURE-----

--------------DptvhkxxIkgtM5BhtcWN4AoV--

