Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E90C6434F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163805.1490870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKylZ-0004fN-LY; Mon, 17 Nov 2025 12:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163805.1490870; Mon, 17 Nov 2025 12:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKylZ-0004d0-IM; Mon, 17 Nov 2025 12:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1163805;
 Mon, 17 Nov 2025 12:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vKylY-0004cr-VB
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:55:33 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2b07718-c3b4-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:55:30 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64369269721so2628409a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:55:30 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f96e2sm10093420a12.16.2025.11.17.04.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:55:30 -0800 (PST)
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
X-Inumbo-ID: b2b07718-c3b4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763384130; x=1763988930; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6meMSWXBwWYWEbph4UsfbB6H2faOmWr6FxRXUfcFges=;
        b=Jl7heS5VYhCJV6eCVgtrHWc1x0mgdnfm0tHyk634DyfTC3x3hRpPb1jUg/cbpYniJu
         KS1WYjf1nnpatjXyHGeUptB2cVMZnNwiIurC3ldlsGInKFlGs5hm/GcQPtGs7mwwcLxK
         ug1pSGXdP9APed4Jag9mM6aSq9TfBJKwGkajgAjUB/T592uaIH2YNP3euhV/KqN+XtiD
         1hlMJ5ElH974jd2Zk2POmFC7YpgFYSwave17T3ayq92NSJ9+4ulNkT5HOGXEC5b6VPri
         twond38l8NHLYkkSXtKI7tHIH8/JRMK1sexkvA6nnf9agfj9fiIt7dr7DUJvfyMtyQ16
         bL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384130; x=1763988930;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6meMSWXBwWYWEbph4UsfbB6H2faOmWr6FxRXUfcFges=;
        b=tk5dZHisfT6M23fz7QGVpCGgF40+Uy4eoUedI27FbLjUJWCR1ttz4YtGO6odhJ120a
         prCIVjml8pxUuAG1U8pl6Df77MgyoKmQK6P1x6kSme/ArVUafhJrlB8MvhqMpH5IbDz1
         YhFhr7MJcV7DANSvxdyrQmGBKDZR7Njd+UB29jeO6Ty4b23zinFFp5oalawyL23mTbwC
         NvFcyYR6Mtmuvxa2QYVc0/jVElxbyrk+UuchZfS91iPYyLaffjtV2Cdu5YkRqV68Rh8h
         zNKf7pUURI7/d3LYbqtugjv3l2+W+H09APr5oz5aMQ63fVQPBQJAEycs3FIxfNOdlUSx
         WvHg==
X-Forwarded-Encrypted: i=1; AJvYcCUeEwHOg0UdMjVNVYQIjZE7XGQ8pegr4eCeinWZm9VHvfM3Y8QkD3ei63x5OzHAankadc/B67gHIzs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPVTyKCRQHFMPi7QGokyL3qsPNEAaHFx0uwvHOX0pYklKdTyB/
	gXsdehoKmeCkfCRywTAS2NT+lICwH3DjcrFPxov/F0D8qv7EzpxBh6XGpQmS7uiviWA=
X-Gm-Gg: ASbGncvTcALOP+2pQy7jZ8Y1M5OHb8awVVhIgqvfE+/OFlaC3MyT5TfolCWq6LYN4AS
	oGuWNFGJfva/UMkf2ds7Bxbb25ECdK5D84AZNoCj72UUcIGUMSyDaBMDugIdrnAugCF7DvZcjVL
	GKdgyOwlqmqLPYIivIG/vENxIyeB7j+UFObrYb2ZGSlYqAr/SEBcxUmlEi1ibZhAD0+xJRkEpwd
	4iu10wgaEaKLDt2Ewg24kYTSieJ7OA7TK1e8HRqdCPlv4lX0/lIf9JEPD0q1FwhgIARAxhjeX21
	T+hrWzNk6hRZYhKiVYVEn9rJUgLLYDqfxoKrUu3XlJoCin/DL67uL1RuTISrveD3RGzNp5QsJ9r
	uvJAOuuAnz1HWyKv7zP8UD842RbjS7HhXe2k8G6eZxTrwf/E1r191EJRiBwIdvK2Ag9wJkszQLc
	YajJ5rPCBBHzKrflhd6Q6pu1pyrOvY0taMVP25XcdBp7WY2Wds+9Utz/7SQv9+zoiE5LcpwHsSh
	aL/REFn5Lx4aGsNQaysEfYMonWnZmVTTaMoRWcTu0BTuYXlNw==
X-Google-Smtp-Source: AGHT+IFnwEE3PfXgXzMOyhMmLD2WGS1MTOJzU1JB+74Q0skeQGWGVtPOt4gN2KzBR5GqKvLEbMNgzQ==
X-Received: by 2002:a05:6402:40c7:b0:640:e78f:f347 with SMTP id 4fb4d7f45d1cf-64350e8d394mr11888789a12.22.1763384130354;
        Mon, 17 Nov 2025 04:55:30 -0800 (PST)
Message-ID: <0ed9b152-6465-4736-be59-352d68b77e6f@suse.com>
Date: Mon, 17 Nov 2025 13:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
 <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
 <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
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
In-Reply-To: <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MA660uVfzbH9uhSV7LWYR7xk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MA660uVfzbH9uhSV7LWYR7xk
Content-Type: multipart/mixed; boundary="------------SRc8k92vSgHgqu2ZRE1SJflO";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <0ed9b152-6465-4736-be59-352d68b77e6f@suse.com>
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
 <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
 <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
In-Reply-To: <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
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

--------------SRc8k92vSgHgqu2ZRE1SJflO
Content-Type: multipart/mixed; boundary="------------OPXftXlBhMLkZpx9kiPh1s9q"

--------------OPXftXlBhMLkZpx9kiPh1s9q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTEuMjUgMTM6MzMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4xMS4yMDI1
IDE0OjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTQuMTEuMjUgMTI6NDAsIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMTQvMTEvMjAyNSAxMTozMiBhbSwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvTWFrZWZpbGUgYi9kb2Nz
L01ha2VmaWxlDQo+Pj4+IGluZGV4IDM3Nzc2ZDMwM2MuLmU1ZjRhOGNhODYgMTAwNjQ0DQo+
Pj4+IC0tLSBhL2RvY3MvTWFrZWZpbGUNCj4+Pj4gKysrIGIvZG9jcy9NYWtlZmlsZQ0KPj4+
PiBAQCAtOCw4ICs4LDExIEBAIERBVEUJCTo9ICQoY2FsbCBkYXRlLCIrJVktJW0tJWQiKQ0K
Pj4+PiAgICBET0NfQVJDSEVTICAgICAgOj0gYXJtIHBwYyByaXNjdiB4ODZfMzIgeDg2XzY0
DQo+Pj4+ICAgIE1BTl9TRUNUSU9OUyAgICA6PSAxIDUgNyA4DQo+Pj4+ICAgIA0KPj4+PiAr
SU5fRklMRVMgOj0gbWFuL3hsLWRpc2stY29uZmlndXJhdGlvbi41LnBvZCBtYW4veGwtbmV0
d29yay1jb25maWd1cmF0aW9uLjUucG9kDQo+Pj4+ICtJTl9GSUxFUyArPSBtYW4veGwuMS5w
b2QgbWFuL3hsLmNmZy41LnBvZCBtYW4veGwuY29uZi41LnBvZA0KPj4+DQo+Pj4gU29ycnks
IEkgbWVhbnQgdG8gc2F5IHRoaXMgb24gdGhlIHByZXZpb3VzIHJldmlzaW9uLsKgIENhbiB3
ZSBwbGVhc2UgbGlzdA0KPj4+IHRoZXNlIG9uZSBwZXIgbGluZSwgZm9yIHRoZSBmdXR1cmUg
ZWFzZSBvZiBpbnNlcnRpbmcvcmVtb3ZpbmcuDQo+Pg0KPj4gT2theS4NCj4+DQo+Pj4gSXMg
SU5fRklMRVMgcmVhbGx5IGNvcnJlY3Q/wqAgVGhlc2UgYXJlIHRoZSBnZW5lcmF0ZWQgKG5v
bi0uaW4pIGZpbGVzLA0KPj4+IHJhdGhlciB0aGFuIHRoZSAuaW4gZmlsZXMgdGhlbXNlbHZl
cy7CoCBHRU5fRklMRVMgZnJvbSB2MSB3b3VsZCBzZWVtIHRvDQo+Pj4gYmUgYSBiZXR0ZXIg
Zml0Lg0KPj4NCj4+IEkgd2FudGVkIHRvIG1ha2UgY2xlYXIgdGhpcyBpcyByZWxhdGVkIHRv
ICouaW4gZmlsZXMuIEFuZCBJTUhPIEdFTl9GSUxFUw0KPj4gd2FzIHRvbyBnZW5lcmljIG9u
IGEgc2Vjb25kIHRob3VnaHQuDQo+Pg0KPj4gR0VORVJBVEVEX0ZST01fSU5fU1VGRklYRURf
RklMRVMgc2VlbXMgYSBsaXR0bGUgYml0IGNsdW1zeS4gOy0pDQo+PiBTZXJpb3VzbHksIGlm
IHlvdSBoYXZlIGFueSBiZXR0ZXIgbmFtZSwgSSdkIGJlIGhhcHB5IHRvIHVzZSBpdC4NCj4g
DQo+IEdFTl9QT0RfRklMRVMsIHNlZWluZyB0aGV5J3JlIGFsbCAqLnBvZD8NCg0KRm9yIHRo
aXMgY2FzZSwgbWF5YmUuIE9UT0ggaW4gY2FzZSBzb21lb25lIGFkZHMgYSAucG9kbWFuIGZp
bGUgd2UnZCBuZWVkDQp0byByZW5hbWUgYWdhaW4uDQoNCkFuZCBJIHRoaW5rIHVzaW5nIHRo
ZSBzYW1lIG1ha2UgdmFyaWFibGUgbmFtZSBpbiBhbGwgTWFrZWZpbGVzIG5lZWRpbmcgdG8N
CnNwZWNpZnkgKi5pbiBkZXJpdmVkIGZpbGVzIHdvdWxkIGJlIHByZWZlcmFibGUuDQoNCk1h
eWJlIElOX1RBUkdFVFM/DQoNCg0KSnVlcmdlbg0K
--------------OPXftXlBhMLkZpx9kiPh1s9q
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------OPXftXlBhMLkZpx9kiPh1s9q--

--------------SRc8k92vSgHgqu2ZRE1SJflO--

--------------MA660uVfzbH9uhSV7LWYR7xk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkbG0EFAwAAAAAACgkQsN6d1ii/Ey8t
uwf/S4KhWNd3Iy9EH+6uoLVDmonFPWXUM7OccFGOt+XyujoRa7kola6R3j9MEz3pcHFneONBKUY0
gSerX6Jihauby/mQLzBeGPwNvCnSbMkQP8ODEfkuqwk8dOUdBU9O+14eKG6XwD9iFrFOJDes26sW
KqHmjLRQdk6K63GUQSyGOhgdsJXvKnC88UAZ+yUFF30RGNXi2z0MoMf0v9WE0YLOocH2gfzBVvdO
4EddhoNAKDKR9gXUXxmXUnwIgSVBlwNmTtDS7Vg4Lw2eI+rYXYzRvOywWOBvL1G7H+Qwr4JUrQ5h
uFOxcPsyUCv3CJmxGXETl/nFMMnejyuRp2K0Rry6EQ==
=7i2t
-----END PGP SIGNATURE-----

--------------MA660uVfzbH9uhSV7LWYR7xk--

