Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF8C5C969
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 11:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162400.1490056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJr59-000806-1w; Fri, 14 Nov 2025 10:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162400.1490056; Fri, 14 Nov 2025 10:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJr58-0007xT-VW; Fri, 14 Nov 2025 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1162400;
 Fri, 14 Nov 2025 10:31:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJr57-0007xN-Cq
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 10:31:05 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03292a91-c145-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 11:31:00 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4775638d819so10460085e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 02:31:00 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778c8a9456sm83391575e9.15.2025.11.14.02.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 02:30:59 -0800 (PST)
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
X-Inumbo-ID: 03292a91-c145-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763116259; x=1763721059; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4XTyr1X5g+kIeBZj9JdNZ/buVbiw85bDIPMzT1dQ5g=;
        b=WJg7SpOxWvPCBsM0e65hFKfIipA8xdc1YUtriW4IOB9HMmE5BiXUI8DTBiNQY8yEGk
         cJ/JTcH4shjXxfIJAca6JCQO1TNRfr8kRWvn58+RPEO8MvUBXumyuo/JevZaDq/0qH/z
         Otxn0kHXbYJI+xeZQ/qG01B8fwBNBy2tt7O8nS8HXG+KOCqzs9Kl92f+Sz48TV9Og+x4
         TUh1uQPho5eHsoE0fdvorkQy5lyyCfPXRtQzY6TFhRUQKC0eGp4AzyQzD3zgWBK+Qt7o
         lgagvQ64X6gVK5bL3ev9++OfrmOr8bstI5FpMvxE/Hb7eLpJNVQgY7M8fFVJVqiqEVD3
         a7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763116259; x=1763721059;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4XTyr1X5g+kIeBZj9JdNZ/buVbiw85bDIPMzT1dQ5g=;
        b=BfOsIHczdTVvrlYfosNhE7VYUnph+wAhETuXnKFHY0qphrOPwhbE0BxHh3kF9FbInG
         dQY9izRy6t2C3olu9s9wApQb14hvksmJUTzXP5Fv9jupqi+PyIEGHGn1C3wtJ6e0su3a
         z97PoQf03iFb3AC6dJhSgvjNk37MK9XRZoe0FMjpfCr11/bY4iiNQzNt5rxosCaUm7bl
         Wd/fM2i/Jx371p8pEtY+h6gYVlBXK3fgKxLreJKOyHmwgw4DLf5f4JaTLNS6jiV3yGpm
         dXFYCsZVbcOkA5623q8XuNHTjaR43p/9EkT7IybiBO2vMIGLGeeE6KMK9k/9jwlmb1dP
         Nnnw==
X-Forwarded-Encrypted: i=1; AJvYcCUUlGN59+ut5mwpt3mffZXCvtLEe3hLbrkkXEqdMr+GOpDAA5iDeAoU75/WqsTt5dsCS7hZeqz4Ns4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyuu4VkVIVHHWLAVMVBaSkSC+8dTWHwWuQ1qYB+eLcHInQGhYSa
	JHEBUmr3LG/uYeRxny1I5Ajvp34Hp0UMZoje57NjF4/AwKdNmPf/KWjS0au1SNxbeYo=
X-Gm-Gg: ASbGncv/cVVqg1OjrM30ZtvhBP+T2Rn4FFNsBrqgcMpz+VMYXn2gF35HDDcHS/3YyqA
	bDnEnyjY37lUTSoM2PCdS5dJ1x6ZFZpCnpaSoFlXzgP9dlHh0TBNoHUXxBn1Lx6m+7vNbKoiaCS
	IiThI4zce9TK9BIAAA9+gDN8ypQu0eARCiKUg8GMKmYEq3QiTJi8cfXsnNXAnp1FZ7AndJbLMR/
	UVpQUd3mrQC4DidGsWVRIFTnpGu+9C5Duz2VtZ6TPm83Bnqcg1J44NIwrq/UnS/KO17wKxtD7gE
	g6jBe4oW6E1Ww46bOD3WZidsWGQq/9frWiuKwgfueSH8K6bqzqot6W/zA2t7LEHvOsBeiXoallZ
	BsY3qFsj/0IjfdIbO8G3d3dL0i0UbwOah4CSKXAIoHFNI/XqW3m5EV7G+vgHR3Ru+Xq+JWd8Olj
	g9yxIxzEbkbSgwskHgSXmXoVHCWmgGJVx0Sf4uMliJYHqPGfOiQUVjl/4repANsNNSDu6sL2pOc
	fh7/CPauiKbraAPkKTmlODMRSC1fRfI+xaAZMA1RkCHtRWcow==
X-Google-Smtp-Source: AGHT+IGLRkq7AR6foWz/NxVZOn39SbSF5tmr0epwVsPn7nJoDvuq2dXw1SbrCJcg8JDpU4nrAoNTdQ==
X-Received: by 2002:a05:600c:3b19:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-4778fe68378mr22128845e9.11.1763116259368;
        Fri, 14 Nov 2025 02:30:59 -0800 (PST)
Message-ID: <d8821c62-f075-4ff3-b538-e5ee300141b0@suse.com>
Date: Fri, 14 Nov 2025 11:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-5-jgross@suse.com>
 <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
 <5bb5c2d8-53bd-4669-9238-6ae8ab8d349c@suse.com>
 <870d7330-5563-4c45-8a45-03734e75d92b@citrix.com>
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
In-Reply-To: <870d7330-5563-4c45-8a45-03734e75d92b@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PZLLrvF7rDr27I6gTBkCYNC1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PZLLrvF7rDr27I6gTBkCYNC1
Content-Type: multipart/mixed; boundary="------------M0G8WCJinJoSo0B3WlYN9zHT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Message-ID: <d8821c62-f075-4ff3-b538-e5ee300141b0@suse.com>
Subject: Re: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-5-jgross@suse.com>
 <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
 <5bb5c2d8-53bd-4669-9238-6ae8ab8d349c@suse.com>
 <870d7330-5563-4c45-8a45-03734e75d92b@citrix.com>
In-Reply-To: <870d7330-5563-4c45-8a45-03734e75d92b@citrix.com>
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

--------------M0G8WCJinJoSo0B3WlYN9zHT
Content-Type: multipart/mixed; boundary="------------MgMECj8KC11SpExay2YBSNYf"

--------------MgMECj8KC11SpExay2YBSNYf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjUgMjA6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEzLzExLzIw
MjUgNTowMiBwbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxMy4xMS4yMDI1IDE3OjU5
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMS4xMS4yMDI1IDE3OjE5LCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOg0KPj4+PiAtLS0gYS9jb25maWcvUGF0aHMubWsuaW4NCj4+Pj4gKysr
IGIvY29uZmlnL1BhdGhzLm1rLmluDQo+Pj4+IEBAIC0yMCwxMCArMjAsNyBAQCBsaWJleGVj
ZGlyICAgICAgICAgICAgICAgOj0gQGxpYmV4ZWNkaXJADQo+Pj4+ICAgZGF0YXJvb3RkaXIg
ICAgICAgICAgICAgIDo9IEBkYXRhcm9vdGRpckANCj4+Pj4gICBtYW5kaXIgICAgICAgICAg
ICAgICAgICAgOj0gQG1hbmRpckANCj4+Pj4gICBkb2NkaXIgICAgICAgICAgICAgICAgICAg
Oj0gQGRvY2RpckANCj4+Pj4gLWR2aWRpciAgICAgICAgICAgICAgICAgICA6PSBAZHZpZGly
QA0KPj4+PiAgIGh0bWxkaXIgICAgICAgICAgICAgICAgICA6PSBAaHRtbGRpckANCj4+Pj4g
LXBkZmRpciAgICAgICAgICAgICAgICAgICA6PSBAcGRmZGlyQA0KPj4+IFF1ZXN0aW9uIGlz
IHdoZXRoZXIgd2UncmUgbWlzdGFrZW5seSBub3QgcmVzcGVjdGluZyBpbiBwYXJ0aWN1bGFy
IHRoaXMgb25lLA0KPj4+IGZvciB0aGUgKi5wZGYgd2UgY3JlYXRlLiBGb3IgYWxsIHRoZSBv
dGhlcnMgSSBhZ3JlZSB0aGVyZSdzIG5vIChwcmVzZW50IG9yDQo+Pj4gcG90ZW50aWFsKSB1
c2UuIEkgbm90aWNlIHRob3VnaCB0aGF0IGRvY3MvTWFrZWZpbGUgY2xlYW5zIGUuZy4gKi5k
dmkNCj4+PiBuZXZlcnRoZWxlc3MuDQo+PiBBY3R1YWxseSwgSSBjYW4ndCBzcG90IGEgdXNl
IG9mIGh0bWxkaXIgZWl0aGVyLCB3aGVuIGxpa2VseSB3ZSBzaG91bGQgcmVzcGVjdA0KPj4g
dGhhdCBvbmUsIHRvby4NCj4gDQo+IEJlc2lkZXMgdGhlIG1hbnBhZ2VzLCBub3RoaW5nIGdl
bmVyYXRlZCBpbiBkb2NzLyBpcyByZWFsbHkgZml0IHRvDQo+IHBhY2thZ2UgZm9yIGVuZCB1
c2Vycy7CoCBUaGVyZSdzIG5vIGNvaGVyZW50IHN0cnVjdHVyZSwgc29tZSBvZiBpdCBpcw0K
PiBzdHJhaWdodCBicmFpbmR1bXBzIGZyb20gZGV2ZWxvcGVycy4NCj4gDQo+IGRvY2RpciBp
cyBvbmx5IHVzZWQgYnkgdGhlIHt1bix9aW5zdGFsbC1odG1sIHRhcmdldHMgKG9wZW5jb2Rp
bmcNCj4gaHRtbGRpciksIGFuZCB0aGUgcm0gaW4gdGhlIGluc3RhbGwgdGFyZ2V0IGlzIGZ1
cnRoZXIgZXZpZGVuY2UgdG8gdGhlDQo+IHVuc3VpdGFiaWxpdHkgb2Ygd2hhdCdzIHRoZXJl
Lg0KPiANCj4gSSdkIGdvIHNvIGZhciBhcyB0byBzdWdnZXN0IHdlIHNob3VsZCBkcm9wIGlu
c3RhbGwtaHRtbCwgZXhjZXB0IHRoYXQgaXQNCj4gd291bGQgYnJlYWsgdGhlIGdlbmVyYXRp
b24gb2YgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS8NCg0KSSB0aGlu
ayBJJ2xsIGxlYXZlIGZ1cnRoZXIgY2xlYW51cCBmb3IgYW5vdGhlciBwYXRjaC4NCg0KQXMg
eW91IHNhaWQsIGRvY2RpciBpcyBiZWluZyB1c2VkIHJpZ2h0IG5vdyBhbmQgaHRtbGRpciBj
b3VsZCBiZSB1c2VkIGluDQpjYXNlIHRoZSBvcGVuIGNvZGluZyB2aWEgZG9jZGlyIGlzIGJl
aW5nIGNsZWFuZWQgdXAuDQoNCg0KSnVlcmdlbg0K
--------------MgMECj8KC11SpExay2YBSNYf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MgMECj8KC11SpExay2YBSNYf--

--------------M0G8WCJinJoSo0B3WlYN9zHT--

--------------PZLLrvF7rDr27I6gTBkCYNC1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkXBOIFAwAAAAAACgkQsN6d1ii/Ey8+
zgf+PAQnakVtsCAFtvvOiMxxGShuS8vWuMODPMrAXfV+bK1Uv11mXnutEWqWSGSO3QmuTXGf+vu1
sWBGx332qauvoaF+Pfzj827cgzYjJ4IMjwhZh2msD4BSAQnonzgo8+Lw2Ck/Gd/6sTwCsqy+hd0w
rilR+244svy+3OwLvgMHYqPFa17LoKkWgI93zOHhTo4CmM6/cfbhLi5wwmAQOHcFpV082RbmK/JW
ypn3MHl6uEJzdA0AJVfdhgtMRKoSASnYylshMWpoqdws2OAy+g/4WVpT3PnA84kuU3B5WGFEIvhT
9yQ0u3UsJ5xomVoPEF+QxQ9JcwUMAY/2xSKBb4imsA==
=ayam
-----END PGP SIGNATURE-----

--------------PZLLrvF7rDr27I6gTBkCYNC1--

