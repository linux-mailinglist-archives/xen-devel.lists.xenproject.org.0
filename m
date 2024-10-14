Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9384F99C266
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 10:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818494.1231807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0G0k-0000hR-LW; Mon, 14 Oct 2024 08:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818494.1231807; Mon, 14 Oct 2024 08:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0G0k-0000eX-IM; Mon, 14 Oct 2024 08:01:02 +0000
Received: by outflank-mailman (input) for mailman id 818494;
 Mon, 14 Oct 2024 08:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pOqc=RK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t0G0j-0000eR-3U
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 08:01:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 734636b2-8a02-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 10:01:00 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-431291b27f1so14923335e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 01:01:00 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6bd3dcsm10695540f8f.42.2024.10.14.01.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:00:58 -0700 (PDT)
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
X-Inumbo-ID: 734636b2-8a02-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728892859; x=1729497659; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XNQBOXa00l12tm2HgL7kt+gkawGCI340Njq+8N376K0=;
        b=Fhw+WKrkSMAcDAyIbOhKlp7KyqbjjocC5fQEeQ1cSLEoj9+1qQ6zwszfVb22hm271a
         emYHu6XCcCgJdoA8sxFqDL3fkd4Ag+oxqYBtKrJYH++nIdHg7+PWRiaMt9FBdEQDi1dg
         WO19dDUKdaS4JjcXdj/ZvSTI/VaE95F8PMIaVdfeZ5ap+Th46U3eO0ZSpU9m36UpeQid
         8vLO9cnQQCoBYO9+Z770kZwehj7XlM9lTIbS+TdmpwoDZvZOSdcdON4t4EZWuXfLT2kb
         uk93Ux38D9Q5G1o4QBLwz4nWNM9AujpCtXbD7wQtmnwclkHz8I2Tfp6vDxnCxzExf/iQ
         r5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892859; x=1729497659;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNQBOXa00l12tm2HgL7kt+gkawGCI340Njq+8N376K0=;
        b=RolBO40zYvtE3AyMG4MjW/o29bC+DSYPKhlPWDd7aZsVPJxeQ+PYMiCOyy9SgsgpDI
         JwBVMxONiPQhtrTg3degNOzFxVutKLecDLxKSXAJtdMFgFCC7JVSEByDsnBWL+g5kG7d
         /LYYuedpr21yP5i1vLhgd8PbKeJPHN4abmAsVNpoFijZCOe2BRMqZJGjiCbK38gFiVH1
         VFzn4YfdC6nwP3liriDMZ/tzNGERruuAsz8tfrCqzxI5S4F8fVayOdwjHpAvDZ5SNvci
         GITA8UArCw1IzLT5PHll8bmutzTbSHlLv3U1CGbfrFqw7tibOxKcFUwenTyIuSaxEUJa
         0CXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8K26Vn1r6GJwDN3ONkhFs7IPr32B7OvhW7f1R6Gw4+q0T2+rRzAXFoIps6MocznDGFWVmkRCYNgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUhrDwsfi76dveii4qmG9umyZdtkf2F3KTYxnAax0rdWI34IjP
	f9xJ3CIojql+vhAbxRZUROJqKCGMg1Vi+69+aJfGL3X80CW11Is/fJ5bYfDRjnE=
X-Google-Smtp-Source: AGHT+IG4luhqi0qksARaX6YCF/pcjzG1wv29T0lgZZVcznicHK3B94jDWxQ+b29UJ8/EX+2giHxlNg==
X-Received: by 2002:adf:e582:0:b0:37d:446a:9e60 with SMTP id ffacd0b85a97d-37d54df4d49mr8096017f8f.0.1728892859369;
        Mon, 14 Oct 2024 01:00:59 -0700 (PDT)
Message-ID: <ea126b93-add2-415a-8a51-5b55ffcdd21e@suse.com>
Date: Mon, 14 Oct 2024 10:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: increment domctl interface version
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
 <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
 <2082c6ea-c778-444f-ad5f-15f25b87ba10@suse.com>
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
In-Reply-To: <2082c6ea-c778-444f-ad5f-15f25b87ba10@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9mveKoi6B8MKDQx0FRueG6sP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9mveKoi6B8MKDQx0FRueG6sP
Content-Type: multipart/mixed; boundary="------------wbXeGerDoKHqbdcbcMRRBz06";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <ea126b93-add2-415a-8a51-5b55ffcdd21e@suse.com>
Subject: Re: [PATCH] xen/public: increment domctl interface version
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
 <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
 <2082c6ea-c778-444f-ad5f-15f25b87ba10@suse.com>
In-Reply-To: <2082c6ea-c778-444f-ad5f-15f25b87ba10@suse.com>
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

--------------wbXeGerDoKHqbdcbcMRRBz06
Content-Type: multipart/mixed; boundary="------------qQNQ1cbDDKYKG149gZbN0hXh"

--------------qQNQ1cbDDKYKG149gZbN0hXh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTAuMjQgMDk6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4xMC4yMDI0
IDA5OjM2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTQuMTAuMjQgMDk6MTQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE0LjEwLjIwMjQgMDk6MDYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IFRoZSByZWNlbnQgYWRkaXRpb24gb2YgdGhlIFhFTl9ET01DVExf
ZHRfb3ZlcmxheSBmdW5jdGlvbiB3YXMgbWlzc2luZw0KPj4+PiB0aGUgcmVsYXRlZCB1cGRh
dGUgb2YgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiwgYXMgaXQgaGFzIGJlZW4gdGhl
DQo+Pj4+IGZpcnN0IGludGVyZmFjZSBjaGFuZ2Ugb2YgdGhlIDQuMjAgcmVsZWFzZSBjeWNs
ZS4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDRjNzMzODczYjVjMiAoInhlbi9hcm06IEFkZCBYRU5f
RE9NQ1RMX2R0X292ZXJsYXkgYW5kIGRldmljZSBhdHRhY2htZW50IHRvIGRvbWFpbnMiKQ0K
Pj4+DQo+Pj4gSSdtIGNvbmZ1c2VkOiBUaGF0IGNoYW5nZSAoYSkgcHJlLWRhdGVzIHRoZSBi
cmFuY2hpbmcgb2YgNC4yMCBhbmQgKGIpDQo+Pj4gYnVtcGVkIHRoZSB2ZXJzaW9uIC4uLg0K
Pj4+DQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4+PiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4+Pj4gQEAgLTIxLDcgKzIxLDcgQEAN
Cj4+Pj4gICAgI2luY2x1ZGUgImh2bS9zYXZlLmgiDQo+Pj4+ICAgICNpbmNsdWRlICJtZW1v
cnkuaCINCj4+Pj4gICAgDQo+Pj4+IC0jZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZF
UlNJT04gMHgwMDAwMDAxNw0KPj4+PiArI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9W
RVJTSU9OIDB4MDAwMDAwMTgNCj4+Pg0KPj4+IC4uLiBmcm9tIDB4MTYgdG8gMHgxNy4gQW5k
IGZvciBubyBhcHBhcmVudCByZWFzb24sIGFzIHBsYWluIGFkZGl0aW9ucyBkb24ndA0KPj4+
IHJlcXVpcmUgYSBidW1wLiBEaWQgeW91IG1heWJlIG1lYW4gdG8gcmVmZXJlbmNlIGEgZGlm
ZmVyZW50IGNvbW1pdD8NCj4+DQo+PiBPaCwgaW5kZWVkLiBJIHdhbnRlZCB0byByZWZlcmVu
Y2UgZDZlOWEyYWFiMzllLg0KPj4NCj4+IEFuZCByZWdhcmRpbmcgdG8gInBsYWluIGFkZGl0
aW9ucyBkb24ndCByZXF1aXJlIGEgYnVtcCI6IDRjNzMzODczYjVjMiBkaWQNCj4+IGEgcGxh
aW4gYWRkaXRpb24gYW5kIGJ1bXBlZCB0aGUgdmVyc2lvbi4NCj4gDQo+IFJpZ2h0LCBoZW5j
ZSB3aHkgSSBzYWlkICJmb3Igbm8gYXBwYXJlbnQgcmVhc29uIi4NCg0KVGhlcmUgc2VlbXMg
dG8gYmUgYSBsYWNrIG9mIGRvY3VtZW50YXRpb24gaW4gdGhpcyByZWdhcmQuDQoNCkp1bGll
biBleHBsaWNpdGx5IGFza2VkIGZvciB0aGUgYnVtcCBmb3IgdGhhdCBhZGRpdGlvbi4NCg0K
SSdtIGZpbmUgd2l0aCBkcm9wcGluZyBteSBwYXRjaCBpZiBvdGhlcnMgYWdyZWUgdGhhdCB0
aGUgYnVtcCBpc24ndCBuZWVkZWQuDQpJbiB0aGF0IGNhc2UgSSdsbCBzZW5kIGFub3RoZXIg
b25lIGFkZGluZyBhIGNvbW1lbnQgZm9yIHRoZSBtZWNoYW5pY3Mgb2YNCmludGVyZmFjZSB2
ZXJzaW9uIGJ1bXAgaW4gZG9tY3RsLmggYW5kIHN5c2N0bC5oLg0KDQoNCkp1ZXJnZW4NCg0K

--------------qQNQ1cbDDKYKG149gZbN0hXh
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

--------------qQNQ1cbDDKYKG149gZbN0hXh--

--------------wbXeGerDoKHqbdcbcMRRBz06--

--------------9mveKoi6B8MKDQx0FRueG6sP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcMz7oFAwAAAAAACgkQsN6d1ii/Ey/x
9wf+P5AdT129eG6fs7WXonFAkgkmQ38NsGp8nWPazWqyTz1BJsW7AZ118QYQWm2HvvkBzeJs8nbn
aSW2+llBbt2kn9s9ISod5imth12gDn1SEkbd+tHHkCAaIkGS9eMX1ZxXT+Ge2hvCHLgoX1TNxytk
VqOKaB/pE7xhJbDJcznVRIp2cpmaT67JEgVPZ+ZuVomGURvGMsUacwoKMkZw57glURijTFWGSX3R
EfymQZj21+h11VBGPBdsb47i4H+uHr6EtklD/7Ylv8T0aue3hluAFUB70FRrcQ4hytfekwq0igKN
G/YQYbGQj4NJ6gPDZhPXIo6cztRJelvUahyXZN/pIA==
=+72I
-----END PGP SIGNATURE-----

--------------9mveKoi6B8MKDQx0FRueG6sP--

