Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787809DFBE4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 09:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846335.1261501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1mg-0000eS-Op; Mon, 02 Dec 2024 08:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846335.1261501; Mon, 02 Dec 2024 08:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1mg-0000bw-LZ; Mon, 02 Dec 2024 08:27:58 +0000
Received: by outflank-mailman (input) for mailman id 846335;
 Mon, 02 Dec 2024 08:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tI1mf-0000bq-3V
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 08:27:57 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5283f8ed-b087-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 09:27:52 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385d6e36de7so3472549f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 00:27:53 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ed8dee66sm3853882f8f.104.2024.12.02.00.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 00:27:51 -0800 (PST)
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
X-Inumbo-ID: 5283f8ed-b087-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzMiLCJoZWxvIjoibWFpbC13cjEteDQzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUyODNmOGVkLWIwODctMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTI4MDcyLjc3ODYyOSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733128072; x=1733732872; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgmP7IRPapdyM00KytQd+l/oRf7Nj76V9zYC2A411XM=;
        b=dXKLmo0EJT+Pbtv9E1TQ5JUd7U8HayzNsL8U13+JToVSzHw5uF29C1Gp5B+mtOC3Jt
         BK8cnUNrMAx+AarN0iRwcWieneKEZwozZf1CGoWCUDAn9s9SAe6gicsp7hXchC0El+bM
         GLk3uImVpaWIFQgkM7s2BFNoYzA3umF0S5HlTzAfVdH/GcKdkloY1Iq+C5GqyMjHSfFv
         0JLIbfOYobI+hlpQB2Z8XHqpcKYDu0qH3qeZQyDMOkw2YZCvChCagQbFQOrZgeG97MLF
         C0/tHRhdeQ9Hen8sw+zpg4CZvPRUElEuk5QpnXbYUL8GgdvSwshaz53ispxtXSKNWy3m
         utow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128072; x=1733732872;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgmP7IRPapdyM00KytQd+l/oRf7Nj76V9zYC2A411XM=;
        b=NxHlPpfER+A12E+hqAoLvGo26SXemTwdjKn74NogiB7bIc2T27qJM1ETWEoNS9Vlf7
         IUY1HkpKf6q5ZKi0wdAYyHZhD8ls6DRKNDXSWbznixKvZ+fdmlJXjFaCnAfXLt7D0emZ
         8dmf82a0xqF5PrQqJxGDBnYQAuOlsvO9eLk6Kzv8SRLXfiHL51mSwM+xi9yKbn/+45im
         qHt7fpS7zXGuKIXTrvSnprHCBinIjBYgxBBFYyEkB97weT5KE9Kj+7RbyTzbn+U3W1rL
         M4vgxAT5yggW9ImizT+htWzUSpZHvrDVZssCaGesTi7NDyJer4Dh3px5EDhy+2uMYOFt
         Es6A==
X-Forwarded-Encrypted: i=1; AJvYcCVecmdJejjTfrLUBVZN3ZVBoACaBMui4IP5/dzQ0wSW2I4uD0IEkWbFRXbROllWqfBwgVx1FJbvJNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCB9Ztzamu/I5Hcm8YMDgqViaPsXgnzaZ805230KJpeSlFkmW3
	wCeNg/dYt8jgkC0XzzmVU24wITlYyWcsQ4508K//w2W7d3K8yM1iIAHh6wWMf4U=
X-Gm-Gg: ASbGncu4gIf6Icq9lJiGDHsuuHrhBFdWMarqX8FAvKw26Oxks1OvwJ6M05VPJ0MSWDc
	A2hAVGHWLKisSd+RLQdIU22yuDqLkbZp6RknZ330DpGJRo5Xuye+yiYy5EdZ+hNClcDnXCOCNUF
	k9xCoxxCxWbG32si3+aj8H2nE4WnHfsmqr/aPYjG8ypi9aCEzgtywc3ETjA6d8zY/1X+ionGgLX
	r14p9jL3BmHUCL5FOOtIw1YMltMtGrElSm8dij2LMC5kWecC9S42Do0F2GxmXibRJgFjfaZ6Z1a
	b1ksNWnDTw+5xKleW/wL2/73dCQbays8w43unS6QmFpIOgcJempzqyAke811QTsgPbET4gDqkrA
	=
X-Google-Smtp-Source: AGHT+IHCew4p32M0fnntOLTxvXn5rhPcZ/Oxoj8redCrFVYAiUiu7LZghywbN0mQOwwTkZ319CdZ2g==
X-Received: by 2002:a5d:5f43:0:b0:385:f66a:4271 with SMTP id ffacd0b85a97d-385f66a4481mr1226523f8f.4.1733128072319;
        Mon, 02 Dec 2024 00:27:52 -0800 (PST)
Message-ID: <2d4fd45a-2461-441e-a116-3b6cff18ee9e@suse.com>
Date: Mon, 2 Dec 2024 09:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/swiotlb: add alignment check for dma buffers
To: Thierry Escande <thierry.escande@vates.tech>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, jbeulich@suse.com
References: <20240916064748.18071-1-jgross@suse.com>
 <20240916064748.18071-2-jgross@suse.com>
 <e6ceb22d-3fa7-430c-9410-3c5ffd9ded2d@vates.tech>
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
In-Reply-To: <e6ceb22d-3fa7-430c-9410-3c5ffd9ded2d@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cqzeUayVGoZI9y6WbVrHfeVr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cqzeUayVGoZI9y6WbVrHfeVr
Content-Type: multipart/mixed; boundary="------------YLCLZf9pp80BxTgr2PYG6yMv";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Thierry Escande <thierry.escande@vates.tech>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, jbeulich@suse.com
Message-ID: <2d4fd45a-2461-441e-a116-3b6cff18ee9e@suse.com>
Subject: Re: [PATCH v2 1/2] xen/swiotlb: add alignment check for dma buffers
References: <20240916064748.18071-1-jgross@suse.com>
 <20240916064748.18071-2-jgross@suse.com>
 <e6ceb22d-3fa7-430c-9410-3c5ffd9ded2d@vates.tech>
In-Reply-To: <e6ceb22d-3fa7-430c-9410-3c5ffd9ded2d@vates.tech>
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

--------------YLCLZf9pp80BxTgr2PYG6yMv
Content-Type: multipart/mixed; boundary="------------u48cR0db4DRmFDg6gYOPKEyz"

--------------u48cR0db4DRmFDg6gYOPKEyz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMTEuMjQgMTg6MzYsIFRoaWVycnkgRXNjYW5kZSB3cm90ZToNCj4gSGksDQo+IA0K
PiBPbiAxNi8wOS8yMDI0IDA4OjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxi
LXhlbi5jDQo+PiBpbmRleCAzNTE1NTI1OGE3ZTIuLmRkZjViMWRmNjMyZSAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMNCj4+ICsrKyBiL2RyaXZlcnMveGVu
L3N3aW90bGIteGVuLmMNCj4+IEBAIC03OCw5ICs3OCwxNSBAQCBzdGF0aWMgaW5saW5lIGlu
dCByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzX2FkZHJfdCBwLCBzaXplX3Qg
c2l6ZSkNCj4+ICAgew0KPj4gICAJdW5zaWduZWQgbG9uZyBuZXh0X2JmbiwgeGVuX3BmbiA9
IFhFTl9QRk5fRE9XTihwKTsNCj4+ICAgCXVuc2lnbmVkIGludCBpLCBucl9wYWdlcyA9IFhF
Tl9QRk5fVVAoeGVuX29mZnNldF9pbl9wYWdlKHApICsgc2l6ZSk7DQo+PiArCXBoeXNfYWRk
cl90IGFsZ24gPSAxVUxMIDw8IChnZXRfb3JkZXIoc2l6ZSkgKyBQQUdFX1NISUZUKTsNCj4+
ICAgDQo+PiAgIAluZXh0X2JmbiA9IHBmbl90b19iZm4oeGVuX3Bmbik7DQo+PiAgIA0KPj4g
KwkvKiBJZiBidWZmZXIgaXMgcGh5c2ljYWxseSBhbGlnbmVkLCBlbnN1cmUgRE1BIGFsaWdu
bWVudC4gKi8NCj4+ICsJaWYgKElTX0FMSUdORUQocCwgYWxnbikgJiYNCj4+ICsJICAgICFJ
U19BTElHTkVEKG5leHRfYmZuIDw8IFhFTl9QQUdFX1NISUZULCBhbGduKSkNCj4+ICsJCXJl
dHVybiAxOw0KPiANCj4gVGhlcmUgaXMgYSByZWdyZXNzaW9uIGluIHRoZSBtcHQzc2FzIGRy
aXZlciBiZWNhdXNlIG9mIHRoaXMgY2hhbmdlLg0KPiBXaGVuLCBpbiBhIGRvbTAsIHRoaXMg
ZHJpdmVyIGNyZWF0ZXMgaXRzIERNQSBwb29sIGF0IHByb2JlIHRpbWUgYW5kDQo+IGNhbGxz
IGRtYV9wb29sX3phbGxvYygpIChzZWUgWzFdKSwgdGhlIGNhbGwgdG8NCj4gcmFuZ2Vfc3Ry
YWRkbGVzX3BhZ2VfYm91bmRhcnkoKSAoZnJvbSB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVu
dCgpKQ0KPiByZXR1cm5zIDEgYmVjYXVzZSBvZiB0aGUgYWxpZ25tZW50IGNoZWNrcyBhZGRl
ZCBieSB0aGlzIHBhdGNoLiBUaGVuIHRoZQ0KPiBjYWxsIHRvIHhlbl9jcmVhdGVfY29udGln
dW91c19yZWdpb24oKSBpbiB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudCgpDQo+IGZhaWxz
IGJlY2F1c2UgdGhlIHBhc3NlZCBzaXplIG9yZGVyIGlzIHRvbyBiaWcgKD4gTUFYX0NPTlRJ
R19PUkRFUikuDQo+IFRoaXMgZHJpdmVyIHNldHMgdGhlIHBvb2wgYWxsb2NhdGlvbiBibG9j
ayBzaXplIHRvIDIuMysgTUJ5dGVzLg0KPiANCj4gIEZyb20gcHJldmlvdXMgZGlzY3Vzc2lv
bnMgb24gdGhlIHYxIHBhdGNoLCB0aGVzZSBjaGVja3MgYXJlIG5vdA0KPiBuZWNlc3Nhcnkg
ZnJvbSB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudCgpIHRoYXQgYWxyZWFkeSBlbnN1cmVz
DQo+IGFsaWdubWVudCwgcmlnaHQ/DQoNCkl0IGVuc3VyZXMgYWxpZ25tZW50IHJlZ2FyZGlu
ZyBndWVzdCBwaHlzaWNhbCBtZW1vcnksIGJ1dCBpdCBkb2Vzbid0IGRvDQpzbyBmb3IgbWFj
aGluZSBtZW1vcnkuDQoNCkZvciBETUEgbWFjaGluZSBtZW1vcnkgcHJvcGVyIGFsaWdubWVu
dCBtaWdodCBiZSBuZWVkZWQsIHRvbywgc28gdGhlDQpjaGVjayBpcyByZXF1aXJlZC4gQXMg
YW4gZXhhbXBsZSwgc29tZSBjcnlwdG8gZHJpdmVycyBzZWVtIHRvIHJlbHkgb24NCnByb3Bl
ciBtYWNoaW5lIG1lbW9yeSBhbGlnbm1lbnQsIHdoaWNoIHdhcyB0aGUgcmVhc29uIGZvciB0
aG9zZSBjaGVja3MNCnRvIGJlIGFkZGVkLg0KDQpQb3NzaWJsZSBzb2x1dGlvbnMgaW5jbHVk
ZToNCg0KLSByaXNpbmcgdGhlIE1BWF9DT05USUdfT1JERVIgbGltaXQgKHRvIHdoaWNoIHZh
bHVlPykNCi0gYWRkaW5nIGEgd2F5IHRvIGFsbG9jYXRlIGxhcmdlIERNQSBidWZmZXJzIHdp
dGggcmVsYXhlZCBhbGlnbm1lbnQNCiAgIHJlcXVpcmVtZW50cyAodGhpcyB3aWxsIGltcGFj
dCB0aGUgd2hvbGUgRE1BIGluZnJhc3RydWN0dXJlIHBsdXMNCiAgIGRyaXZlcnMgbGlrZSBt
cDNzYXMgd2hpY2ggd291bGQgbmVlZCB0byB1c2UgdGhlIG5ldyBpbnRlcmZhY2UpDQotIG1v
ZGlmeSB0aGUgbXB0M3NhcyBkcml2ZXIgdG8gc3RheSB3aXRoaW4gdGhlIGN1cnJlbnQgbGlt
aXRzDQotIG9ubHkgZ3VhcmFudGVlIHByb3BlciBtYWNoaW5lIG1lbW9yeSBhbGlnbm1lbnQg
dXAgdG8gTUFYX0NPTlRJR19PUkRFUg0KICAgKHJpc2tpbmcgdG8gaW50cm9kdWNlIGhhcmQg
dG8gZGlhZ25vc2UgYnVncyBmb3IgdGhlIHJhcmUgdXNlIGNhc2VzIG9mDQogICBzdWNoIGxh
cmdlIGJ1ZmZlcnMpDQoNCg0KSnVlcmdlbg0K
--------------u48cR0db4DRmFDg6gYOPKEyz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------u48cR0db4DRmFDg6gYOPKEyz--

--------------YLCLZf9pp80BxTgr2PYG6yMv--

--------------cqzeUayVGoZI9y6WbVrHfeVr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdNb4YFAwAAAAAACgkQsN6d1ii/Ey8i
owf/TcDODvWNKhz2VeRgdGyE7HG1+otkteHBaLk+f4aNs23ObF6X7Eravdqcc39HkM7V+U1KRQba
j0VvZVkgmnrnvbWVNmvDXvlrcWfAurH+29rJUNHZWTtiPPpQ6Y+yYeCfhhvtweoKSY4wY//7sfSK
LdmmrXyQMhyFGF8VMhbcpXtp+3Ep7ChdpJnlQxo2TchCzYW75cV+SwkCOM3+F7MknUlcYIwPTmxD
2ODvXeNIWVZsOjeXB3pxsrn0szX4c0OVf4LnmbdE0ZfY42oRNtKB3pafJIBAk71wdgS7/Pf/tut5
fotoeuKAermUDfRksDgHxVMYeJgV0CXVXx24/bgpHA==
=A3ah
-----END PGP SIGNATURE-----

--------------cqzeUayVGoZI9y6WbVrHfeVr--

