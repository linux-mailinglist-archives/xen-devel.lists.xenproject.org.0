Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215499C413D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 15:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833933.1249181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVj5-00087T-5u; Mon, 11 Nov 2024 14:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833933.1249181; Mon, 11 Nov 2024 14:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVj5-00085l-2r; Mon, 11 Nov 2024 14:49:11 +0000
Received: by outflank-mailman (input) for mailman id 833933;
 Mon, 11 Nov 2024 14:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KwgS=SG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tAVj3-00085f-3N
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 14:49:09 +0000
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 191ab6e2-a03c-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 15:49:05 +0100 (CET)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a9eb3794a04so703697566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 06:49:05 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee06b9d62sm597895066b.0.2024.11.11.06.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 06:49:04 -0800 (PST)
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
X-Inumbo-ID: 191ab6e2-a03c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2NDIiLCJoZWxvIjoibWFpbC1lajEteDY0Mi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE5MWFiNmUyLWEwM2MtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzM2NTQ1LjMxOTU3NCwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731336545; x=1731941345; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o0vfGEVzVUOBN55zKhNxfxzr412mUBu1aXaIhJROpSo=;
        b=eOUDTpXQYpjdoYIeZuL8xv1UK3xUDrJLkes32trEsSx9jEuCBvQyWqjOP/T01gcyMX
         iCZxH0P9f1GkEZsaLsb3cQW9aZoCotivdcUgAU22JJdSFr/j8H72rD2NJYjC9tUayoPT
         92zrlMsUSm0DbgQb4VbTS+OX1IyzUuEjdtpkAZ6APD29YE/Nd2spe2Yp7GcWJeJ/Y37w
         jYnVidte2vzirp5VgdOagwZkVdREkcpxe+JOwuuhKnIOWnzQktofWLkmEQx8FGsCRAEn
         2wdCZbc0k/g52xe6KkaIGy5h+3Fn1gCDbNEMMq/b2u1VntbjG/gAQV3yW3u591WTiK82
         biCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731336545; x=1731941345;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0vfGEVzVUOBN55zKhNxfxzr412mUBu1aXaIhJROpSo=;
        b=C/C4EqMJhDNB9wHshMb0iO0ggPMVQQz3T0vdavtAexiiV87W0NVwmDlKdCaEDYTsbD
         PefeL/UWXpUB0/paxICeqZQ2wRFGIBq35oKFIKy+YK6rAPmZ3AqFh9W84KbNr2mpbHTS
         WxAuzars1l6UWCblwNGTX+8LRnedlTszQ0td/489SzQdbUBFb4zzqtPZMpdsCwXnmmeV
         ltJYcIn5qfD6pBtaFZaZ4DnIbX5RhMtPxy+bV7rwlTluawEV38A1uYAQCKhPk2YNb2OK
         5Qz52H4BMSOeRIgU5yM/zaHrCKJBgEvsg1rJ2OjUgYfQgAie0mj3mG1SyK4Et0LPLC0Q
         +8cA==
X-Gm-Message-State: AOJu0Yxh60SjKp9zmrEfHcEACSQpPFKS4uSHijhobzlK/gGRPoSIarzW
	K5QYoTacA8SmNNME+de8ceBUXjbgUM4kplki6nxYfLP9dNJ1HuUe77wxn28W38I=
X-Google-Smtp-Source: AGHT+IGxdlSv6rkXi22laSmfV6ypazA3bEeDiVsc+rH1tDExMUapUYBzK9FwBb9AkH1JzvAwtMqOBQ==
X-Received: by 2002:a17:907:368a:b0:a99:f605:7f1b with SMTP id a640c23a62f3a-a9ef002345dmr1177610066b.60.1731336544689;
        Mon, 11 Nov 2024 06:49:04 -0800 (PST)
Message-ID: <9e3938c5-e89c-4df8-9e09-0d5c1ccc65c7@suse.com>
Date: Mon, 11 Nov 2024 15:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] tools/libs/evtchn: Drop assert()s referencing
 MiniOS's main_thread
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20241111143101.996733-1-andrew.cooper3@citrix.com>
 <36b7aa89-c87d-40a1-b721-9fa21ff9c2cc@suse.com>
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
In-Reply-To: <36b7aa89-c87d-40a1-b721-9fa21ff9c2cc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r6tgKdMfm9HboHS4IEfBghY5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r6tgKdMfm9HboHS4IEfBghY5
Content-Type: multipart/mixed; boundary="------------lj4fy0auZz6p8CnrletEKrtK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <9e3938c5-e89c-4df8-9e09-0d5c1ccc65c7@suse.com>
Subject: Re: [PATCH for-4.18] tools/libs/evtchn: Drop assert()s referencing
 MiniOS's main_thread
References: <20241111143101.996733-1-andrew.cooper3@citrix.com>
 <36b7aa89-c87d-40a1-b721-9fa21ff9c2cc@suse.com>
In-Reply-To: <36b7aa89-c87d-40a1-b721-9fa21ff9c2cc@suse.com>
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

--------------lj4fy0auZz6p8CnrletEKrtK
Content-Type: multipart/mixed; boundary="------------byoCM5NfSo1VWYrZsQjJSi0j"

--------------byoCM5NfSo1VWYrZsQjJSi0j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMTEuMjQgMTU6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4xMS4yMDI0
IDE1OjMxLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gVGhpcyBicmVha3MgdGhlIGJ1aWxk
IHdpdGggZGVidWcgYWN0aXZlLCBhcyBtYWluX3RocmVhZCBpcyBub3QgYW4gZXhwb3NlZA0K
Pj4gc3ltYm9sLg0KPj4NCj4+IFRoaXMgaXMgYSBtaW5pbWFsIHZlcnNpb24gb2YgY29tbWl0
IGJjNGZlOTRhNjlkNCAoInRvb2xzL2xpYnMvZXZ0Y2huOiByZXBsYWNlDQo+PiBhc3NlcnQo
KXMgaW4gc3R1YmRvbSB3aXRoIHByb3BlciBsb2NraW5nIikuICBJdCBsZWF2ZXMgTWluaU9T
IG5vIHdvcnNlIG9mZg0KPj4gd2l0aCByZXNwZWN0IHRvIHRocmVhZCBzYWZldHkuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4NCj4+IC0tLQ0KPj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4N
Cj4+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pg0KPj4gU3BlY3Vs
YXRpdmUgZml4LiAgR2l0bGFiIGlzIGEgbGl0dGxlIGJ1c3kgcmlnaHQgbm93Og0KPj4NCj4+
ICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5keWhocC94ZW4v
LS9waXBlbGluZXMvMTUzNjU5Nzc1Mw0KPiANCj4gQXNzdW1pbmcgaXQgaGVscHM6DQo+IEFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBDb25zaWRl
cmluZyB0aGF0IDQuMTggcHJlLWRhdGVzIHRoZSBleHBvcnQgcmVzdHJpY3Rpb25zLCBJJ20g
YSBsaXR0bGUgcHV6emxlZA0KPiB0aG91Z2guIEFuZCBpbmRlZWQgYTQwMGRkNTE3MDY4Njc1
NjVlZDEzODJiMjNkMzQ3NWJiMzA2NjhjMiBpcyBhIDQuMTkgY29tbWl0Ow0KPiB0aGUgdXBk
YXRlIG9mIHRoZSBtYWluIHRyZWUgYnJhbmNoICgzYzgxNDU3YWEzMzgpIHNob3VsZCBoYXZl
IHVzZWQNCj4gZmYxM2RhYmQzMDk5Njg3OTIxMTQ1YTVlM2U5NjBiYTgzMzdlNzQ4OCBpbnN0
ZWFkLCBpZiBJJ20gbm90IG1pc3Rha2VuLg0KDQpJIGFncmVlIHdpdGggdGhhdC4NCg0KDQpK
dWVyZ2VuDQo=
--------------byoCM5NfSo1VWYrZsQjJSi0j
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------byoCM5NfSo1VWYrZsQjJSi0j--

--------------lj4fy0auZz6p8CnrletEKrtK--

--------------r6tgKdMfm9HboHS4IEfBghY5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcyGV8FAwAAAAAACgkQsN6d1ii/Ey/8
vAf/abjgIqkOnUeTe4Gb13wSZw88sljvPBJYSXXGKGb3tneEntIi5rp9UVIpHGDG7j+Ql3G0XkBB
c0k3E4N4Ch3fc1st4DnO7XdcvMclaF1y++byKNl3Ht5USRPck1/Mr2CRR7c7tYLjWcHPiBKNCvZw
cHpoCwdiJKX0fSnJTBKNCxA+S064QQfYFxx0vJSVe9lWqzvG5w1A4qOKxux57JoP5W0+E9txsElR
TW/YJCdmZq6KfRLh9LzClIsak2o9+1l9etqE1wyQJxQgkcihBMj9G7KRzaLklTBkZZ1+pWt2HpIt
XOofXNj5c7xV/ziuz6YS4zBrYa4ewPu3WjGezRj5Aw==
=wC6O
-----END PGP SIGNATURE-----

--------------r6tgKdMfm9HboHS4IEfBghY5--

