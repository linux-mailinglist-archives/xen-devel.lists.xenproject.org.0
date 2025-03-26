Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68CBA71BB3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928145.1330902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTXI-0002pT-Fy; Wed, 26 Mar 2025 16:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928145.1330902; Wed, 26 Mar 2025 16:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTXI-0002mL-CL; Wed, 26 Mar 2025 16:23:24 +0000
Received: by outflank-mailman (input) for mailman id 928145;
 Wed, 26 Mar 2025 16:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Vdm=WN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txTXG-0002m9-Jc
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:23:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a186572b-0a5e-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 17:23:20 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so231175e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 09:23:20 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f59d0sm6704105e9.28.2025.03.26.09.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 09:23:19 -0700 (PDT)
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
X-Inumbo-ID: a186572b-0a5e-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743006200; x=1743611000; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ikWFyzOIyUJDK1ElzRZcpxigu5fxIKNjWhMuB1+P57E=;
        b=cSyEdylNRxcqDYg+5DKZ21m24K2szXGekjjFBIXVE2XM6ad8n/hKQsZw33Ldr+wwa7
         PpeqJBPQEbWzXHfCcDCAKO44VeXBzqIJKuaj7RkBLmdYZaagmfNCzDHIk7xQ13ZQxnj6
         qz9EtkGEzq0KaU0ZpAxRcFTbNhVxYyXvrF51wriBmnIxHiXlA94b8UVnFggJNh3PskPJ
         LZTpmMu5oya+f6QrC3ILqcig/TkpvNv9dkREbvyr63vwvp5rWVSy4lX7Dx2T7223/DZb
         JmB/h4slQNJiT+RotleeS4ioDC4XFTTil02yrfxCzcxckBBYnJStrGOPstgNUvTuGtth
         HahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006200; x=1743611000;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikWFyzOIyUJDK1ElzRZcpxigu5fxIKNjWhMuB1+P57E=;
        b=nURDPrADkc6JN8Pfug/HiWf+6SNI028RslhQs5pHFPl7ItqQquykVVIjMxBx6zDWiZ
         edaNdVE0lNQw+PGssnAXNOEoWaZcTiMmm8ffCaytmk6EbYdUqe42IOF6Mxc3rzx19OmN
         CTTckz4rJf+bATR6fW6fzEDeBRQJzdAPwva7m3XZFO9omcJhECr2EyoJpWaD2Rbv2i3Y
         a8YRLLk3L+CRWsoXWQwxk7CkWd+GJf7G6IeqrLrudJTyCB7rDaPdx5Yrgsl3WGH5CA27
         YFOTPu7DNPRnxE0EZtbK1gnluA2U+5P2h0a7zalkK4LHfR7S4cMzMxHuUBhl4TrXwzG2
         rDuw==
X-Forwarded-Encrypted: i=1; AJvYcCU5mVLQ13MBs35GBnywkXj+SKL90DgbqFu5rOZxU1TeBhYay9c57GstZzkpCoKD8TR/8H7Jh1d/1ZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt9j7hhF0Au87YP2xmMPK9R76VOZisA5nYbPrjNcSizQko4Nk9
	IGI2M658S2NGQJyO+qlAzX5mJPvoN01rPeyGoFFbe3KTTBIWuaxkAE61Oje0wcc=
X-Gm-Gg: ASbGncs4iqzErocuA9HpFlrDl23QyZC+j2eILlYNxHvVju4HjcS13Tn5f4RwqCKVFpV
	89A42kv3iFP2sGPUGAEsgDblrzir3FuxAWU41QApDXsQK0xo4qlvNfX4FTzy4A1rEXEPIsgvKVN
	WNknvqYw13/Gz2E4zljkW2WVZX2LOoGgoO7Qz2wmb56J2lk6ZOzJnKSJ6eTOAPgG0GJFremZgbQ
	vPcSN9yl5sluQ1tT9KQIE/k3zpTUaFfBnbYC6n8+dTsqVeG5cNWjCBuLU3ctACC4PbbgzbKcGlm
	IILlRhfmBn21OqnjNmdXIMs5qMyKbs0fF4bbucWCmhhnacbhQ7S+UZPjkOKzlJdkKlCWr7AGtrs
	TSlvb2ZgYg5WEZL5lmcybDvwPciamMuW2qm35wJutFFn8Eql0dsmGogPYKb77dPZQ3xYjfBAYTT
	XQy054
X-Google-Smtp-Source: AGHT+IF9I5VX4v9bNzzoRB68EwiwSZ5mxNXGVh/aPzhQxlWC5EhA0viVW2/gUpw9y0o+GUcTwv53tg==
X-Received: by 2002:a05:600c:3b93:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43d84f5b77bmr932805e9.6.1743006199671;
        Wed, 26 Mar 2025 09:23:19 -0700 (PDT)
Message-ID: <2b9ef8b1-8390-4985-9e4d-a7d6e0e05909@suse.com>
Date: Wed, 26 Mar 2025 17:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] docs: remove qemu-traditional support from
 documentation
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-3-jgross@suse.com>
 <39593610-1bd4-4319-9429-7cffeadd0da7@citrix.com>
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
In-Reply-To: <39593610-1bd4-4319-9429-7cffeadd0da7@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EWN0TZrAKsehARAeiNfUCbtr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EWN0TZrAKsehARAeiNfUCbtr
Content-Type: multipart/mixed; boundary="------------H3TabwSuTnutUBw0wBNhjTBx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <2b9ef8b1-8390-4985-9e4d-a7d6e0e05909@suse.com>
Subject: Re: [PATCH 2/6] docs: remove qemu-traditional support from
 documentation
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-3-jgross@suse.com>
 <39593610-1bd4-4319-9429-7cffeadd0da7@citrix.com>
In-Reply-To: <39593610-1bd4-4319-9429-7cffeadd0da7@citrix.com>
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

--------------H3TabwSuTnutUBw0wBNhjTBx
Content-Type: multipart/mixed; boundary="------------wEE4O1GhRLf2R4QlT31zxQCj"

--------------wEE4O1GhRLf2R4QlT31zxQCj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDMuMjUgMTc6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI2LzAzLzIw
MjUgNDowNCBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS9kb2Nz
L21pc2MveGVuc3RvcmUtcGF0aHMucGFuZG9jIGIvZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhz
LnBhbmRvYw0KPj4gaW5kZXggYTYwNGY2YjFjNi4uNTgzZTk3N2I2NSAxMDA2NDQNCj4+IC0t
LSBhL2RvY3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MNCj4+ICsrKyBiL2RvY3MvbWlz
Yy94ZW5zdG9yZS1wYXRocy5wYW5kb2MNCj4+IEBAIC02MzQsNyArNjM0LDcgQEAgUGF0aCBp
biB4ZW5zdG9yZSB0byB0aGUgYmFja2VuZCwgbm9ybWFsbHkNCj4+ICAgDQo+PiAgIFRydXN0
d29ydGh5IGNvcHkgb2YgL2xvY2FsL2RvbWFpbi8kRE9NSUQvYmFja2VuZC8kS0lORC8kREVW
SUQvJE5PREUuDQo+PiAgIA0KPj4gLSMjIyMgL2xpYnhsLyRET01JRC9kbS12ZXJzaW9uICgi
cWVtdV94ZW4ifCJxZW11X3hlbl90cmFkaXRpb25hbCIpID0gW24sSU5URVJOQUxdDQo+PiAr
IyMjIyAvbGlieGwvJERPTUlEL2RtLXZlcnNpb24gKCJxZW11X3hlbiIpID0gW24sSU5URVJO
QUxdDQo+PiAgIA0KPj4gICBUaGUgZGV2aWNlIG1vZGVsIHZlcnNpb24gZm9yIGEgZG9tYWlu
Lg0KPj4gICANCj4gDQo+IEFzIGEgc3BlYyBvZiB3aGF0IG1pZ2h0IGxpYWJseSBiZSBmb3Vu
ZCBpbiB4ZW5zdG9yZSwgdGhpcyBwcm9iYWJseQ0KPiBzaG91bGRuJ3QgcmVtb3ZlICJxZW11
X3hlbl90cmFkaXRpb25hbCIgZW50aXJlbHkuwqAgUGVyaGFwcyBhbiBleHRyYQ0KPiBzZW50
ZW5jZSBzYXlpbmcgInFlbXVfeGVuX3RyYWRpdGlvbmFsIiBpcyBhIHNpbmNlLXJlbW92ZWQg
ZG0tdmVyc2lvbj8NCg0KRmluZSB3aXRoIG1lLg0KDQoNCkp1ZXJnZW4NCg==
--------------wEE4O1GhRLf2R4QlT31zxQCj
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------wEE4O1GhRLf2R4QlT31zxQCj--

--------------H3TabwSuTnutUBw0wBNhjTBx--

--------------EWN0TZrAKsehARAeiNfUCbtr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfkKfYFAwAAAAAACgkQsN6d1ii/Ey8G
TAf9E42J/oiR4NNi+XieTOpLz/6wJ8pH/Mva6MR2v8HlnyKbZ1y44myiXG2+OvlTTNrBQWo3a7zy
Oe92EM3HeDX2+vJwys07tpgyF9aUxhNnyFND59LZZ2sgcWAUzGJ9VWP658Lz3MJfohnxjwkTmXuH
n8b5lDhPLIyVfEcnCoJG7l8Be1O84SFK7b/BYQeQBF8iMBKO737X97pxt3rpj8uXi1CvojaMFSdw
G/vKLI/3qlQpWVwXCoZgmB4SrLXlge70cvFxmDJp/GebIL8oCXiwL+/AoCLNaUffIMwdE7cpxQ4I
pOUaJ8EkhuQRmCIyC4sy5ix2QIqnuxDhA/xR+8Yelg==
=7Btn
-----END PGP SIGNATURE-----

--------------EWN0TZrAKsehARAeiNfUCbtr--

