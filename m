Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0BEBCC41A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 11:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141065.1475659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v791i-00034B-FZ; Fri, 10 Oct 2025 09:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141065.1475659; Fri, 10 Oct 2025 09:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v791i-000329-Cx; Fri, 10 Oct 2025 09:03:02 +0000
Received: by outflank-mailman (input) for mailman id 1141065;
 Fri, 10 Oct 2025 09:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xlOq=4T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v791h-000323-Ax
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 09:03:01 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb782c94-a5b7-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 11:03:00 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so509200f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Oct 2025 02:02:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9absm41336135e9.2.2025.10.10.02.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 02:02:58 -0700 (PDT)
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
X-Inumbo-ID: eb782c94-a5b7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760086979; x=1760691779; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yF6v3c2S5biMsqyfCnyMKzd7MeN9VSav5j87YefjOmg=;
        b=I2ywlBLM+WqLjoB4gNRzFtJ4VfT8lVODbdqoHZJGN40edx+zy98oaeaHrBnsV3B5AA
         JoN5ag+8ibwMHzp4JpX5a77CgrNG52XIicYjlfkpz6A7DaKNnDc8A225rxKDNhFC7SQa
         KLjad9059k7yIXILn0xZf+ZvE4hOLCP+BFZG/njBmrZBA4HJ6HbLTrCHmeqw8GFPWDnJ
         D2ZYUHKdjqg8biHFIRl1dKISiGyy4QQobC9YMJC7Z7fwBEt8txPI+ynoU1mO5yFRq3gv
         nhS6mRsHA6cRqBfuRiaKAtt3j+yQG6uryK3HvYov0NaHIkDrphn2MpLwQCouz/1CLVxx
         BX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760086979; x=1760691779;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yF6v3c2S5biMsqyfCnyMKzd7MeN9VSav5j87YefjOmg=;
        b=TMiiJgWIh6w/TK3Oku3yvjctXQD8YLAyB8xtRVcHa5kwf9m7kftaQn7O3fHE8ypKjg
         VjGDOpbpv0aJX+scUnp7LDo7/435SWR382IjyOAOewvbnAFzt4Q/OzIjMA2tTzmzyDpG
         upKRdCYbtUx0n/96KD5ogNmtDQeoMMfxod8QIj/q/0cqm26rsfQ1vd23cpj5ghpS8+6M
         t1EOXnPkRNiQ8FSfdZPTBGBP3DZwLZ3+VOEunzcdGG8qhup4L0SvqQg8K/7gipxFByB+
         MFe13DWfdnaAtQerCNzREoM1h+O4WKTAtjqSeWE6YeeRN5byPadACf75diPIU8QcI9/t
         sufQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfHgLywdbPFyy14WuplE2qW4zGKrxA3E2tGrnyxl/NhSoLhWwxHo5KWjJVk+Fj/HvrTjjSB3qamtM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzP7p7J+1TldluNQkmb8N3SgBNlEi72fHDUPSGDtqkIahI8U0Vv
	ZkQYvA1C72j+WT9eYGEzMMM1AegoVBjqxGrZm1LVoMkEauDnuLderxqCfTseeSjAOb6UjGzBzUY
	l7R5YQVg=
X-Gm-Gg: ASbGncup/ea8fHnBQ/muR7WfWW9asB4qfNQ8ZDJbbOPnUmpvkufv9Rl/aig2xUCsSsO
	k/Z8W5kFGGSHj/wzdb7JA5SVC/y5+cvIiQNuliFsLRYDyVKFulzGCKhpiz0NSUozlvpNVM04Nvs
	PkrX694WxI3oz2GkfYtxDMtSpP7r2VXwDdcNrf8KwR9np8IUQTzbqLFiBW3fmxFuglddf3EFdoF
	eBl5f/3Jxs7gJnYcLvrGKhDQgV9Bzlb4L0sl9PS7oGJ0uKUKAWQLDtSQsw845VBn9xFRC3pYTgX
	tM6mEMXfu+LCWVihuqGCSKmLHSHMCa6bt8sCyEY8EEPXzwdpqcj7Ycin60XABferI5Yrb128XEG
	wsh+jWTYpq1pTv6DFlkC/IKB0evO3x4SXFGb5UcjlhZQvV6q3ipEmk14rvbbXjUCBndHMsWur7d
	MfzHpLI7B5LfBhJbD4phW296ePYpFWochNeTunaJetAOdOQNKp372G2bTv4kqLz74nfRhjRGv7s
	A==
X-Google-Smtp-Source: AGHT+IGfSYeLJqf34+HbVtqi4NCUoyMlpHx/Bx77zyyEfFIWAkeVhLYggQugv2hP/jInaiNFXF8z4A==
X-Received: by 2002:a05:6000:1887:b0:3ec:e226:c580 with SMTP id ffacd0b85a97d-4267b339754mr7227602f8f.60.1760086979073;
        Fri, 10 Oct 2025 02:02:59 -0700 (PDT)
Message-ID: <5e48c480-cc26-4621-bc27-a6f251ed1cef@suse.com>
Date: Fri, 10 Oct 2025 11:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools/libs/light: fix BAR memory address truncation
To: Jan Beulich <jbeulich@suse.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20251010080029.29328-1-Jiqian.Chen@amd.com>
 <f7fd633b-486d-4b8e-969e-1e944bf62884@suse.com>
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
In-Reply-To: <f7fd633b-486d-4b8e-969e-1e944bf62884@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x08QmTX9mjGeqvw4pey2yOrz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x08QmTX9mjGeqvw4pey2yOrz
Content-Type: multipart/mixed; boundary="------------pnOJsXrBfJk2unrD7AdvTVoK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <5e48c480-cc26-4621-bc27-a6f251ed1cef@suse.com>
Subject: Re: [PATCH 1/1] tools/libs/light: fix BAR memory address truncation
References: <20251010080029.29328-1-Jiqian.Chen@amd.com>
 <f7fd633b-486d-4b8e-969e-1e944bf62884@suse.com>
In-Reply-To: <f7fd633b-486d-4b8e-969e-1e944bf62884@suse.com>
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

--------------pnOJsXrBfJk2unrD7AdvTVoK
Content-Type: multipart/mixed; boundary="------------mmFCkmT8wDUB2KKRM8IXn0Sm"

--------------mmFCkmT8wDUB2KKRM8IXn0Sm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTAuMjUgMTA6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4xMC4yMDI1
IDEwOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IDY0LWJpdCBCQVIgbWVtb3J5IGFkZHJl
c3MgaXMgdHJ1bmNhdGVkIHdoZW4gcmVtb3ZpbmcgYSBwYXNzdGhyb3VnaCBwY2kNCj4+IGRl
dmljZSBmcm9tIGd1ZXN0IHNpbmNlIGl0IHVzZXMgInVuc2lnbmVkIGludCIuDQo+IA0KPiBZ
b3UgdGFsa2luZyBvZiBhZGRyZXNzIHRydW5jYXRpb24gb25seSBoZXJlLCAuLi4NCj4gDQo+
PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiArKysgYi90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiBAQCAtMjAwMSw3ICsyMDAxLDggQEAgc3RhdGlj
IHZvaWQgcGNpX3JlbW92ZV9kZXRhY2hlZChsaWJ4bF9fZWdjICplZ2MsDQo+PiAgIHsNCj4+
ICAgICAgIFNUQVRFX0FPX0dDKHBycy0+YW9kZXYtPmFvKTsNCj4+ICAgICAgIGxpYnhsX2N0
eCAqY3R4ID0gbGlieGxfX2djX293bmVyKGdjKTsNCj4+IC0gICAgdW5zaWduZWQgaW50IHN0
YXJ0ID0gMCwgZW5kID0gMCwgZmxhZ3MgPSAwLCBzaXplID0gMCwgaXJxID0gMDsNCj4+ICsg
ICAgdW5zaWduZWQgbG9uZyBsb25nIHN0YXJ0ID0gMCwgZW5kID0gMCwgZmxhZ3MgPSAwLCBz
aXplID0gMDsNCj4+ICsgICAgdW5zaWduZWQgaW50IGlycSA9IDA7DQo+IA0KPiAuLi4gZG9l
cyAiZmxhZ3MiIHJlYWxseSBuZWVkIHdpZGVuaW5nLCB0b28/DQoNCkF0IGxlYXN0IG9uIHRo
ZSBzeXN0ZW0gSSBsb29rZWQgdGhlIHZhbHVlIHdhcyBwcmludGVkIGFzIGEgNjQtYml0IG9u
ZToNCg0KIyBjYXQgL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMDowMDowMC4wL3Jlc291cmNl
DQoweDAwMDAwMDAwMDAwMDAwMDAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4MDAwMDAwMDAwMDAw
MDAwMA0KLi4uDQoNClNvIG5vdCB3aWRlbmluZyBmbGFncyB3b3VsZCByZWx5IG9uIFVCIHRv
IHByZXNlcnZlIHRoZSBldmFsdWF0ZWQgUENJX0JBUl9JTw0KZmxhZyBpbiBjYXNlIHRoZSBo
aWdoIDMyIGJpdHMgZG9uJ3QgY29udGFpbiAwLg0KDQo+IA0KPj4gQEAgLTIwMzEsNyArMjAz
Miw3IEBAIHN0YXRpYyB2b2lkIHBjaV9yZW1vdmVfZGV0YWNoZWQobGlieGxfX2VnYyAqZWdj
LA0KPj4gICAgICAgfQ0KPj4gICANCj4+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBQUk9DX1BD
SV9OVU1fUkVTT1VSQ0VTOyBpKyspIHsNCj4+IC0gICAgICAgIGlmIChmc2NhbmYoZiwgIjB4
JXggMHgleCAweCV4XG4iLCAmc3RhcnQsICZlbmQsICZmbGFncykgIT0gMykNCj4+ICsgICAg
ICAgIGlmIChmc2NhbmYoZiwgIjB4JWxseCAweCVsbHggMHglbGx4XG4iLCAmc3RhcnQsICZl
bmQsICZmbGFncykgIT0gMykNCj4gDQo+IFdoaWxlIHRvdWNoaW5nIHRoaXMsIGRvbid0IHdl
IHdhbnQgdG8gZHJvcCB0aGUgc3RyYXkgMHggaW4gaGVyZT8gVGhlaXINCj4gcHJlc2VuY2Ug
Y2F1c2VzIGJvZ3VzIGlucHV0IGxpa2UgMHgweDAgdG8gYmUgYWNjZXB0ZWQsIGFmYWljdC4N
Cg0KSG1tLCBkbyB3ZSByZWFsbHkgZXhwZWN0IGEgc3lzZnMgZmlsZSB0byBwcm9kdWNlIGJv
Z3VzIG91dHB1dD8NCg0KV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGtlZXAgdGhlICIweCIg
aW4gb3JkZXIgdG8gZGV0ZWN0IGEgZGlmZmVyaW5nDQpvdXRwdXQgZm9ybWF0LCB3aGljaCBj
b3VsZCByZXN1bHQgaW4gc2lsZW50IG1pc2JlaGF2aW9yPw0KDQpJJ20gbm90IHJlYWxseSBm
ZWVsaW5nIHN0cm9uZyBoZXJlLCBhcyBib3RoIGNhc2VzIHNlZW0gaGlnaGx5IHVubGlrZWx5
Lg0KDQo+IA0KPj4gQEAgLTIwNDAsNyArMjA0MSw3IEBAIHN0YXRpYyB2b2lkIHBjaV9yZW1v
dmVfZGV0YWNoZWQobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSwgMCk7DQo+PiAgICAgICAgICAg
ICAgICAgICBpZiAocmMgPCAwKQ0KPj4gICAgICAgICAgICAgICAgICAgICAgIExPR0VEKEVS
Uk9SLCBkb21pZCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICJ4Y19kb21haW5f
aW9wb3J0X3Blcm1pc3Npb24gZXJyb3IgMHgleC8weCV4IiwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICJ4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24gZXJyb3IgMHglbGx4
LzB4JWxseCIsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQsDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSk7DQo+PiAgICAgICAgICAgICAgIH0g
ZWxzZSB7DQo+PiBAQCAtMjA1MCw3ICsyMDUxLDcgQEAgc3RhdGljIHZvaWQgcGNpX3JlbW92
ZV9kZXRhY2hlZChsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDApOw0KPj4gICAgICAgICAgICAgICAgICAg
aWYgKHJjIDwgMCkNCj4+ICAgICAgICAgICAgICAgICAgICAgICBMT0dFRChFUlJPUiwgZG9t
aWQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAieGNfZG9tYWluX2lvbWVtX3Bl
cm1pc3Npb24gZXJyb3IgMHgleC8weCV4IiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICJ4Y19kb21haW5faW9tZW1fcGVybWlzc2lvbiBlcnJvciAweCVsbHgvMHglbGx4IiwN
Cj4gDQo+IEluIHRoZSBoeXBlcnZpc29yIEkgd291bGQgcmVxdWVzdCB1c2Ugb2YgJSNsbHgg
aGVyZTsgbm90IHN1cmUgd2hhdCB0aGUNCj4gdG9vbHN0YWNrJ3MgdGFrZSBvbiB0aGlzIGlz
Lg0KDQpJJ2QgZ28gYSBsaXR0bGUgYml0IGZ1cnRoZXIgYW5kIHJlcXVlc3QgdG8gdXNlIHVp
bnQ2NF90IGluc3RlYWQgb2YNCiJ1bnNpZ25lZCBsb25nIGxvbmciIGFuZCB0aGVuIHVzZSAi
IyJQUkl4NjQgZm9yIHRoZSBmb3JtYXQuDQoNCg0KSnVlcmdlbg0K
--------------mmFCkmT8wDUB2KKRM8IXn0Sm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mmFCkmT8wDUB2KKRM8IXn0Sm--

--------------pnOJsXrBfJk2unrD7AdvTVoK--

--------------x08QmTX9mjGeqvw4pey2yOrz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjoy8IFAwAAAAAACgkQsN6d1ii/Ey+k
Iwf/eRoqgiJJpfKjwO9q9L/Ow5H3Gxc0ofJ4y/CMTYpbGj9VumvpKnEhxmW26Mq/XUtAw1748Gb2
hMQcK/dFejz0q4d7IBbzqZ1NM+rBxANmF5oSGL41uRCPp/54KkSUw6HU1xRZpy31CcD8PU3aJdoU
q0kl+Bjkwf0sGjTKp5CHEcaBq/m+YlKTEH1KwmrmMpcsqfdKJhP7l8wo0EXw9Us0L/CniBeCGCuq
O4cO4lBIyB0fGB75jBKZli9Kf38LQbGeBfzjb9km5+fh2w10MtNaSlgwQkLf/CrhcGMCTno4CHvd
XLB1dGtH9Kv6bJY5DUp9b+V16R2PsTP14yQL2ExltA==
=r7RY
-----END PGP SIGNATURE-----

--------------x08QmTX9mjGeqvw4pey2yOrz--

