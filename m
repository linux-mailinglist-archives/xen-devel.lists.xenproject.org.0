Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161529C7725
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 16:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835849.1251706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFJ4-00037C-9z; Wed, 13 Nov 2024 15:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835849.1251706; Wed, 13 Nov 2024 15:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFJ4-000351-6Y; Wed, 13 Nov 2024 15:29:22 +0000
Received: by outflank-mailman (input) for mailman id 835849;
 Wed, 13 Nov 2024 15:29:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K+ao=SI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tBFJ3-00034v-Al
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 15:29:21 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b622d0b-a1d4-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 16:29:17 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d5aedd177so4070823f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 07:29:16 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97fe6csm18497604f8f.31.2024.11.13.07.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 07:29:15 -0800 (PST)
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
X-Inumbo-ID: 0b622d0b-a1d4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmMiLCJoZWxvIjoibWFpbC13cjEteDQyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBiNjIyZDBiLWExZDQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTExNzU3LjAxNTMwOSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731511756; x=1732116556; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mSVQJH1yt7q9LFPVAtdVQL8MTIPW9HMJ7CorM3tokrE=;
        b=GKoKqSBQWjNRlUNGTS/QYEzogaXvMYPbMhOfpqLBZivKdY3CHzMicPgiQHfCiOMqC2
         hZ33BBarxIZqwKq50dufjYlEEIPYxtpwcRZE/TdJ3Jn86g2ZR5VNlXuCJz1DCqE3F9BJ
         CXACZdE/XKcF93jXrZC3CJbsm2SxCiPatLPdy8fb1z3gohR899RV00vEPvYWE3A0ldDI
         ajCBdq+oSHTE30V9hieSA8KLFtauxqIbziRPJGgoiDhbzMS2LEJJwNeD6v6RyStEUFrt
         4c0uLAC7hMiLjJzcWMhkvFpu1OwrxniKdLuFCIZmI5vLQ/pKa2/Cn2GPWE8DB5ZhUdvc
         d2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731511756; x=1732116556;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSVQJH1yt7q9LFPVAtdVQL8MTIPW9HMJ7CorM3tokrE=;
        b=VlL7X2s+6o7EgiKTF51ywSsSl1EAGavQYglqbERSi7D/BMwKfQqtbiyWnXmxJwbbSo
         6wy/y2iTr6dYTlKH/mA+xuDjU8MuYKG9JwoUuh+STdLseXP9dneTVu/cJPFmmc1cNkLU
         6dDNbKpcGSW+r6Ptb4dpY1Ip0uuZtfvsruwOMq17v0AwdXi75Z9Wo8eHJGt/OObc/Nly
         PpSB0vXrsF/rszBAxrGP8n8Mr+TKhWnePnVTXoQdaxxvqerb6yRbG3M3nbh/XDoDXPqM
         Ww7sKjeiAUtPCFH+YmnTl5HeRg3tpF2ZwTI7BfBIdTeA7QvSrJj2FfjwrMGiyGVg7Grv
         vnkg==
X-Forwarded-Encrypted: i=1; AJvYcCX95ox4yrmDX4HPtoLmeSt4JdGVr1gEN6AkrajmuMrHHOmCytQdCvaCNSX68MP2HLfzijOvgcZfPr0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh0IJmFTRI0vsBBqSBJqxpA8EFUKNadUlBAnVYKzmgSfrV0Zzw
	TRcjaFRel0swRsQDXPvI/wvQiutSoD3k6u7M7eWLvaFgLxi2vTA1wwcCVrsjr9w=
X-Google-Smtp-Source: AGHT+IGY7lOy0hVBRZR7OZlkbyZzx2TynSXgCPTQjFeySh8U1Hv+71MWq3cG2aTJkM6CxcgeVF+ALQ==
X-Received: by 2002:a05:6000:154e:b0:37d:395a:bb7 with SMTP id ffacd0b85a97d-3820df673f1mr2832850f8f.31.1731511756218;
        Wed, 13 Nov 2024 07:29:16 -0800 (PST)
Message-ID: <103dd682-cfb6-4f61-bced-f4e742813232@suse.com>
Date: Wed, 13 Nov 2024 16:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.1
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
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
In-Reply-To: <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nWf2o558Yn5fD9NIhJLq4TWR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nWf2o558Yn5fD9NIhJLq4TWR
Content-Type: multipart/mixed; boundary="------------90vIA0flD9xtYM0eTkg02hbr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Message-ID: <103dd682-cfb6-4f61-bced-f4e742813232@suse.com>
Subject: Re: preparations for 4.19.1
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
In-Reply-To: <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
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

--------------90vIA0flD9xtYM0eTkg02hbr
Content-Type: multipart/mixed; boundary="------------cRT0fGeinvyo8sdM9uQ1ykkV"

--------------cRT0fGeinvyo8sdM9uQ1ykkV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjQgMTY6MjAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEyLzExLzIw
MjQgMTowMCBwbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBBbGwsDQo+Pg0KPj4gdGhlIHJl
bGVhc2UgaXMgZHVlIGJ5IHRoZSBlbmQgb2YgdGhlIG1vbnRoLiBQbGVhc2UgcG9pbnQgb3V0
IGJhY2twb3J0cyB5b3UgZmluZA0KPj4gbWlzc2luZyBmcm9tIHRoZSByZXNwZWN0aXZlIHN0
YWdpbmcgYnJhbmNoLCBidXQgd2hpY2ggeW91IGNvbnNpZGVyIHJlbGV2YW50Lg0KPiANCj4g
TG9va2luZyBvdmVyIHRoZSBYZW5TZXJ2ZXIgcGF0Y2hxdWV1ZToNCg0KLi4uDQoNCj4gVGhl
c2UgYXJlIGEgU0lHUElQRSBidWdmaXggd2hpY2ggaGFwcGVuIHRvIGFsc28gaGF2ZSBhIHBl
cmYNCj4gaW1wcm92ZW1lbnQuwqAgSSBjYW50IHJlbWVtYmVyIGlmIHdlIGRpc2N1c3NlZCBi
YWNrcG9ydGluZyB0aGVtIGJlZm9yZS4NCj4gKEp1ZXJnZW4vQW50aG9ueT8pDQo+IA0KPiA0
MmRiMmRlYjVlNzY6IHRvb2xzL2xpYnhzOiBGaXggbGVuZ3RoIGNoZWNrIGluIHhzX3RhbGt2
KCkNCj4gZTJhOTNiZWQ4YjllOiB0b29scy9saWJ4czogUmV3b3JrIHhzX3RhbGt2KCkgdG8g
dGFrZSB4c2Rfc29ja21zZyB3aXRoaW4NCj4gdGhlIGlvdmVjDQo+IGYwNTBjMDNjZTJhZDog
dG9vbHMvbGlieHM6IFJhdGlvbmFsaXNlIHRoZSBkZWZpbml0aW9uIG9mIHN0cnVjdCB4c19o
YW5kbGUNCj4gMDQ2ZWZlNTI5ZTgyOiB0b29scy9saWJ4czogVHJhY2sgd2hldGhlciB3ZSdy
ZSB1c2luZyBhIHNvY2tldCBvciBmaWxlDQo+IGViYWViMGM2NGE2ZDogdG9vbHMvbGlieHM6
IFVzZSB3cml0ZXYoKS9zZW5kbXNnKCkgaW5zdGVhZCBvZiB3cml0ZSgpDQo+IGExN2I2ZGI5
YjAwNzogdG9vbHMvbGlieHM6IFN0b3AgcGxheWluZyB3aXRoIFNJR1BJUEUNCg0KSSdkIHRh
a2UgdGhlc2UsIGFzIHBsYXlpbmcgd2l0aCBzaWduYWxzIGJlaGluZCB0aGUgYmFjayBvZiBh
IGxpYnJhcnkgdXNlcg0KaXMgc29tZXRoaW5nIHdoaWNoIHNob3VsZCBiZSBmaXhlZC4NCg0K
DQpKdWVyZ2VuDQo=
--------------cRT0fGeinvyo8sdM9uQ1ykkV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cRT0fGeinvyo8sdM9uQ1ykkV--

--------------90vIA0flD9xtYM0eTkg02hbr--

--------------nWf2o558Yn5fD9NIhJLq4TWR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB4BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmc0xcsFAwAAAAAACgkQsN6d1ii/Ey+y
Ygf3W75WQ2TKg7JqZOOs6EPWZlpPqbBZvwnsVOGzysPCBf558lMM4/5gpz+nuOUhY47ENttsSmUl
l4uZmjYp0awBjNMU3GXw42ZJF+VIHGnH6UZq5B3jP35RPIlaGTIi6+n9/R51OLlAKEco7QNZmF/6
uPDruIwrDJi3yG0CvS/szfElaXQGQYl3MoN8shJFF3VZZD97mBr5h9pcYp6dPepgx1cWC1lCw2tN
z4ni9Ey3bYd8K99EIZ/zUlbnZK8aHfOIsHqgsDBtECyJVeITnl2js42AGzKHsUuID58A1l8tI+jE
GWX0xfrL+ndtvL7S8imD4e0+ZQdmTL9K1upi+S3P
=PNly
-----END PGP SIGNATURE-----

--------------nWf2o558Yn5fD9NIhJLq4TWR--

