Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155899C17C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 09:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818472.1231788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0FdF-0003cs-KF; Mon, 14 Oct 2024 07:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818472.1231788; Mon, 14 Oct 2024 07:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0FdF-0003Zj-GF; Mon, 14 Oct 2024 07:36:45 +0000
Received: by outflank-mailman (input) for mailman id 818472;
 Mon, 14 Oct 2024 07:36:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pOqc=RK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t0FdD-0003XD-UD
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 07:36:43 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e0cf98d-89ff-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 09:36:41 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4311c285bc9so26532605e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 00:36:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431183065e2sm113281125e9.28.2024.10.14.00.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 00:36:40 -0700 (PDT)
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
X-Inumbo-ID: 0e0cf98d-89ff-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728891401; x=1729496201; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+sBSVuPLJ20tVRvgkv06vWPbnqFZqvw+qpGFZd/NRyQ=;
        b=CV24jwoatD8mIoD91M6U4457jpkW20RCjWq5xHFEWLDPSHz004CsMyAzCgDE7SUpMn
         imQQryDJJLIo1ceU4hIjjXHfGEkYEBSlwkdI+ZFWc5k4Ge76NDcr/v9Y3ZpVKvwRxVMA
         pv0ja8aKDXLKokzIgzuEu8rxK6o1eC/t0UNCmweASzIn4bzjWXYkgBcGXt4IdXwvDQBv
         rX1yNmcFJM/CYMdv+13/A5PKzR7t5AvOYZ4O1mEthAvFbHhksMqNj33gE611/9lvHdDl
         xjXXlSE23aaSX5d2Lhnew+FOTovOOlVraRNVsqdk7EJ8YiBFH+nQ458y2UzjLYnvHmMj
         27/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728891401; x=1729496201;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sBSVuPLJ20tVRvgkv06vWPbnqFZqvw+qpGFZd/NRyQ=;
        b=xJoNpZ7mKYBpaxM/edPKwtbyeT5nVNi4aa9PCWCpYmE9tjYmxJK1SX3TrtztNDXiAg
         5a6vaqEXw0KM9uGrnhUN7ObgGQTZkbpkmCin3PxQ+ooZGq0g8bY1tdyJKudzat3poCqi
         s99z/dmkDPXzVxQecDla9W2peA3hsISla6GAmYlUZhFmyOtSTY6w1dSP87eymF0BxzNz
         d+L9mTInNwyMrOJQtKszuoqo5WZiatLi7I2eIYO8UPCw+K+TC2nKno5/pvDdRaIUaOnA
         LzDKV/zTv0dU0FRjwrIInZwZK3XhOwo8U6Nr7ysgkb/dbB+8T0PJydna1um8dqQD+bEP
         qdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV5cHZvmdRhq36+dOGlbs5afuzAoPMlnwzDNuEOCAIkHf84LOl8k4rQY7qKNvUcCtLRlN6+7N+BWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7LR5M+wkC5BqEqicTTthgV6goQx3+Kw/xazIsKOPMAwBCgR8v
	/9LZgSvRGzRls0wZwXbAj+ngxT3MNPcfafTQIU8AFCoa8gIZIktQfDBa1h0t1nE=
X-Google-Smtp-Source: AGHT+IGAL1n0Q8j3Z87kxQcGPIoqMGobiehpZtuwfki0qzJXnkzVqYdpZz51WCz0AH+oKNesSjHXDQ==
X-Received: by 2002:a05:600c:3b0f:b0:42c:bc04:58a5 with SMTP id 5b1f17b1804b1-4311df56bfemr87223155e9.33.1728891401137;
        Mon, 14 Oct 2024 00:36:41 -0700 (PDT)
Message-ID: <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
Date: Mon, 14 Oct 2024 09:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: increment domctl interface version
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
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
In-Reply-To: <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YGkhLj2citCEbA0ngcfiijNa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YGkhLj2citCEbA0ngcfiijNa
Content-Type: multipart/mixed; boundary="------------YruYDS9u2K0006bQCyGIAFo0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
Subject: Re: [PATCH] xen/public: increment domctl interface version
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
In-Reply-To: <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
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

--------------YruYDS9u2K0006bQCyGIAFo0
Content-Type: multipart/mixed; boundary="------------amDs0RraUuZmPewZdXRHoWOZ"

--------------amDs0RraUuZmPewZdXRHoWOZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTAuMjQgMDk6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4xMC4yMDI0
IDA5OjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIHJlY2VudCBhZGRpdGlvbiBv
ZiB0aGUgWEVOX0RPTUNUTF9kdF9vdmVybGF5IGZ1bmN0aW9uIHdhcyBtaXNzaW5nDQo+PiB0
aGUgcmVsYXRlZCB1cGRhdGUgb2YgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiwgYXMg
aXQgaGFzIGJlZW4gdGhlDQo+PiBmaXJzdCBpbnRlcmZhY2UgY2hhbmdlIG9mIHRoZSA0LjIw
IHJlbGVhc2UgY3ljbGUuDQo+Pg0KPj4gRml4ZXM6IDRjNzMzODczYjVjMiAoInhlbi9hcm06
IEFkZCBYRU5fRE9NQ1RMX2R0X292ZXJsYXkgYW5kIGRldmljZSBhdHRhY2htZW50IHRvIGRv
bWFpbnMiKQ0KPiANCj4gSSdtIGNvbmZ1c2VkOiBUaGF0IGNoYW5nZSAoYSkgcHJlLWRhdGVz
IHRoZSBicmFuY2hpbmcgb2YgNC4yMCBhbmQgKGIpDQo+IGJ1bXBlZCB0aGUgdmVyc2lvbiAu
Li4NCj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4+ICsrKyBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4gQEAgLTIxLDcgKzIxLDcgQEANCj4+
ICAgI2luY2x1ZGUgImh2bS9zYXZlLmgiDQo+PiAgICNpbmNsdWRlICJtZW1vcnkuaCINCj4+
ICAgDQo+PiAtI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAw
MTcNCj4+ICsjZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAx
OA0KPiANCj4gLi4uIGZyb20gMHgxNiB0byAweDE3LiBBbmQgZm9yIG5vIGFwcGFyZW50IHJl
YXNvbiwgYXMgcGxhaW4gYWRkaXRpb25zIGRvbid0DQo+IHJlcXVpcmUgYSBidW1wLiBEaWRp
IHlvdSBtYXliZSBtZWFuIHRvIHJlZmVyZW5jZSBhIGRpZmZlcmVudCBjb21taXQ/DQoNCk9o
LCBpbmRlZWQuIEkgd2FudGVkIHRvIHJlZmVyZW5jZSBkNmU5YTJhYWIzOWUuDQoNCkFuZCBy
ZWdhcmRpbmcgdG8gInBsYWluIGFkZGl0aW9ucyBkb24ndCByZXF1aXJlIGEgYnVtcCI6IDRj
NzMzODczYjVjMiBkaWQNCmEgcGxhaW4gYWRkaXRpb24gYW5kIGJ1bXBlZCB0aGUgdmVyc2lv
bi4NCg0KDQpKdWVyZ2VuDQo=
--------------amDs0RraUuZmPewZdXRHoWOZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------amDs0RraUuZmPewZdXRHoWOZ--

--------------YruYDS9u2K0006bQCyGIAFo0--

--------------YGkhLj2citCEbA0ngcfiijNa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcMyggFAwAAAAAACgkQsN6d1ii/Ey9S
4AgAmtXaZkPnHdDd2vLwAuefMGURzskh3HUQCNfrmRojY4FMqK5rqGaMPSX9BpOCnPMoOo8qFlMy
/fhW6UnXFibXhbsTe5g/QTQW/+1UZPoCHkAh26RrXh7HZWS2AudKBQAuboAOGP9ERQmXnQ5wIzMy
w+X3/RlM7ic4S1LFN4eJuTTSfojx5O9RiI2iFtzE+NyEVzvDuqdRIpcpKcHDKxA35ai5lXD0tVmv
prpDwW2on39yq1zkPnJ3WbWBuMnywShifjDO3C4Rdgowyq3J2/C7YPHYRRpu+Mig028NzrlTdhmb
+5CCh7A6cKuuQBJLlZu9fDjpkG0hX0cNh5D9BGt4DA==
=OC3w
-----END PGP SIGNATURE-----

--------------YGkhLj2citCEbA0ngcfiijNa--

