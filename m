Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537EC64401
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163835.1490895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyt3-00072K-Pk; Mon, 17 Nov 2025 13:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163835.1490895; Mon, 17 Nov 2025 13:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyt3-000700-M6; Mon, 17 Nov 2025 13:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1163835;
 Mon, 17 Nov 2025 13:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vKyt2-0006zr-8g
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:03:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f0bc4d-c3b5-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 14:03:11 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47755de027eso30027835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 05:03:11 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b617sm25868738f8f.31.2025.11.17.05.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:03:10 -0800 (PST)
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
X-Inumbo-ID: c4f0bc4d-c3b5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763384590; x=1763989390; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PX8DVLhAzj+IMyI7KQqW/GlGHYIN1QtGf80VOt1J51k=;
        b=X8npdW84N8ChARFAzDnifW/y6KbjQZbPPUm+c4S4sv2ridRvl7+Wm0+cEQ1SG5whrg
         29p1uNPW3x3e1w4sgukuOJmGoUjBgOiYrtyDQ3/xVZBzg/6yhUXKe2CcT8xnnqIr4hVz
         EJnuvgZ8DerXMMXgQ0X4paOIQ2vjdt+wxvwuKd5eDeExmlOAQ1BpjvaSTKtWiC+4ArgO
         B4aL66QQNaTddtvSSLwoHPDYCZcmjFO19WTxNgIahmsnoOEetEHETRCxWM19MWxvKikg
         sO5GTQ4qKEn/Vmp4+M308cGIEuN8hOSMsXxTk7tNOvpASzOsqowXd25DOqkUJLoNuX8t
         epjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384590; x=1763989390;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PX8DVLhAzj+IMyI7KQqW/GlGHYIN1QtGf80VOt1J51k=;
        b=blkpz84QzgHw255XABxv444ls6loNnOaeYG+DRHw9PtOvzCIZPegCgHPLR4tg85ol6
         aRHutrzBUb3QGZpSrsyEM5Ycp5UYf/KYjbyrtmXTbAInxmMWFaKRd8x7A2SIMS1mBJBP
         NmAlSqYSPUyNqwYo8Lj3BGNDuHmf5TvBhm+38JCOekfoAQgdDPdjtKtsVkW0rFmhRcyw
         OQgpDtPGLcDCsa/1PHr1BcrLZVpfUArYh733akxYXRi23LkIdaaaC9KVhZ+ahBjHCMZw
         5YYynQ+R4U04ddPF1J7aQA0Ls9OLKdJiLTB+X+hRU9uKAsuZVerweAnoClk/XpQ+PZIn
         9q+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXQE6IKaS17f4KjLijRfprOGHfj/TWs+EfFLM+W5n9nOxKY2M6sWSHnaXGztCDKwF+YET5bV2y84k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7reTij7jhvg/plJWkdh3tqrc69zNyAcUMmIBsm1YlQZkhPV12
	IEsDBMU8GbyEVGQDwNPsV5BffpGccIHMF0jwShyg+ld2KX9MbM7dXnE7Jl/NqysdeEU=
X-Gm-Gg: ASbGncuzoZsCTpkd/VQgnsNgmv3PdezftkIY5jglozfNkRtaXdT1BYO3AvM1/Z8Si84
	nPK3bo6EUur3qR6a1TPKMCE27G8+Antll06tQylml8uCUq28bLYlPwN4e6JlxNfjy/KDSoks20x
	Zasuh0QA9XedHAhKIo+3sy2lqm/e+18MoeSJvSc5n/ejPvlHFaN26IEJNBehaYN2EbL/+q1Uuxo
	oQ4+G4i7231qbPzkatnBXkY3ahpJq7d+BaXrumQ1LJqb2ZzHyxZgke6s7seY2wHKf9WiosuqAeC
	SohhlW5+oN+EX5cVeqNB/cEN+YLjh0Z9e66tzFLxbja12G3vArM5pHZVLAACo6hYS8YbsgG9Z/p
	Cn2haSI0V/r6Pmw8PW1AqgRYYmpk5iUmp5G6LsyF8MFSRRJ/x5koHJxAHAoiQA4emeECJaT8w+G
	FfdcAl1+wzrlEJqm4fa7QMpKSE3uszQ2YMopO8jQpqflRGvALr3xV/uJITWxyesmJQcatKdBUdj
	fddckJjb1hkF3XBZJacKxBlEAKhoJLMuHCqM+htAQ84M+4z6g==
X-Google-Smtp-Source: AGHT+IFloL/fYoYeC7VPsGU1S1jX1qdV3DkkLHgMiF9JaJ+8JWU1OZIFTyiaJL4OcU5nrf0RRZwaLA==
X-Received: by 2002:a05:600c:1986:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-4778fe41be4mr111125005e9.7.1763384590274;
        Mon, 17 Nov 2025 05:03:10 -0800 (PST)
Message-ID: <8b2e64a9-c4a3-4b0e-9b9f-3176f44dc249@suse.com>
Date: Mon, 17 Nov 2025 14:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
 <88e6b9d8-21b6-4b37-97fc-d35b90ed9b49@suse.com>
 <c1b9bfb6-8ff8-4f60-953a-0f23818b5f95@suse.com>
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
In-Reply-To: <c1b9bfb6-8ff8-4f60-953a-0f23818b5f95@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------or3nJCuJEyH1aO325Ecv7cPq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------or3nJCuJEyH1aO325Ecv7cPq
Content-Type: multipart/mixed; boundary="------------i5b22Q0HRqVeX10PiI6iMDbE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <8b2e64a9-c4a3-4b0e-9b9f-3176f44dc249@suse.com>
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
 <88e6b9d8-21b6-4b37-97fc-d35b90ed9b49@suse.com>
 <c1b9bfb6-8ff8-4f60-953a-0f23818b5f95@suse.com>
In-Reply-To: <c1b9bfb6-8ff8-4f60-953a-0f23818b5f95@suse.com>
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

--------------i5b22Q0HRqVeX10PiI6iMDbE
Content-Type: multipart/mixed; boundary="------------VV0ZDA0GiNTVuVk0bKDhiAzL"

--------------VV0ZDA0GiNTVuVk0bKDhiAzL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTEuMjUgMTM6NTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMS4yMDI1
IDEzOjM3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMTEuMjUgMTM6MjQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE0LjExLjIwMjUgMTM6NTQsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDE0LjExLjI1IDEyOjQyLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4+Pj4gT24gMTQvMTEvMjAyNSAxMTozMiBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvQ29uZmlnLm1rIGIvQ29uZmlnLm1rDQo+Pj4+Pj4gaW5k
ZXggZTE1NTZkZmJmYS4uZDIxZDY3OTQ1YSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9Db25maWcu
bWsNCj4+Pj4+PiArKysgYi9Db25maWcubWsNCj4+Pj4+PiBAQCAtMTU5LDYgKzE1OSwxOSBA
QCBkZWZpbmUgbW92ZS1pZi1jaGFuZ2VkDQo+Pj4+Pj4gICAgIAlpZiAhIGNtcCAtcyAkKDEp
ICQoMik7IHRoZW4gbXYgLWYgJCgxKSAkKDIpOyBlbHNlIHJtIC1mICQoMSk7IGZpDQo+Pj4+
Pj4gICAgIGVuZGVmDQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICtQQVRIX0ZJTEVTIDo9IFBhdGhz
DQo+Pj4+Pj4gK0lOQ19GSUxFUyA6PSAkKGZvcmVhY2ggZiwgJChQQVRIX0ZJTEVTKSwgJChY
RU5fUk9PVCkvY29uZmlnLyQoZikubWspDQo+Pj4+Pj4gKw0KPj4+Pj4+ICtpbmNsdWRlICQo
SU5DX0ZJTEVTKQ0KPj4+Pj4+ICsNCj4+Pj4+PiArQlVJTERfTUFLRV9WQVJTIDo9ICQoZm9y
ZWFjaCBmLCAkKFBBVEhfRklMRVMpLCAkKHNoZWxsIGF3ayAnJCQyID09ICI6PSIgeyBwcmlu
dCAkJDE7IH0nICQoWEVOX1JPT1QpL2NvbmZpZy8kKGYpLm1rLmluKSkNCj4+Pj4+PiArDQo+
Pj4+Pj4gKyMgUmVwbGFjZSBAeHh4QCBtYXJrZXJzIGluICQoMSkuaW4gd2l0aCAkKHh4eCkg
dmFyaWFibGUgY29udGVudHMsIHdyaXRlIHRvICQoMSkNCj4+Pj4+PiArZGVmaW5lIGFwcGx5
LWJ1aWxkLXZhcnMNCj4+Pj4+PiArICQoMSk6ICQoMSkuaW4NCj4+Pj4+PiArCXNlZCAkJChm
b3JlYWNoIHYsICQkKEJVSUxEX01BS0VfVkFSUyksIC1lICdzI0AkJCh2KUAjJCQoJCQodikp
I2cnKSA8JCQ8ID4kJEANCj4+Pj4+PiArZW5kZWYNCj4+Pj4+DQo+Pj4+PiBTaG91bGRuJ3Qg
dGhpcyB3cml0ZSB0byBhIHRtcCBmaWxlLCBhbmQgdXNlIG1vdmUtaWYtY2hhbmdlZD/CoCBN
b3N0IG9mDQo+Pj4+PiB0aGUgdGltZSB0aGUgbWFya2VycyB3b24ndCBoYXZlIGNoYW5nZWQs
IGFuZCB3ZSdsbCB3YW50IHRvIHNob3J0IGNpcmN1aXQNCj4+Pj4+IGRlcGVuZGVudCBydWxl
cy4NCj4+Pj4NCj4+Pj4gSSBjYW4gc2VlIHRoaXMgYmVpbmcgYW4gYWR2YW50YWdlIHdoZW4g
ZS5nLiBnZW5lcmF0aW5nIGhlYWRlciBmaWxlcywgYXMNCj4+Pj4gdGhvc2UgYmVpbmcgZ2Vu
ZXJhdGVkIGFnYWluIHdvdWxkIHBvdGVudGlhbGx5IGNhdXNlIGxvdHMgb2YgcmVidWlsZHMu
DQo+Pj4+DQo+Pj4+IEluIHRoaXMgY2FzZSBJIGNhbiBoYXJkbHkgc2VlIGFueSBjYXNlIHdo
ZXJlIG1ha2Ugd291bGRuJ3QgZG8gdGhlIHJpZ2h0DQo+Pj4+IHRoaW5nIGFscmVhZHkuIEVp
dGhlciB0aGUgKi5pbiBmaWxlIGlzIG5ld2VyIHRoYW4gdGhlIGdlbmVyYXRlZCBmaWxlIGR1
ZQ0KPj4+PiB0byBhIGdpdCB1cGRhdGUgb3IgYSBtYW51YWwgZWRpdCwgc28gbWFrZSB3aWxs
IHJlZ2VuZXJhdGUgdGhlIHRhcmdldCAoYW5kDQo+Pj4+IHRoaXMgaXMgd2hhdCB3ZSB3YW50
KSwgb3IgdGhlICouaW4gZmlsZSBoYXNuJ3QgY2hhbmdlZCwgc28gbWFrZSB3b24ndA0KPj4+
PiByZWdlbmVyYXRlIHRoZSBmaWxlIGFzIGl0IGlzIG5ld2VyIHRoYW4gdGhlICouaW4gZmls
ZSBhbHJlYWR5Lg0KPj4+Pg0KPj4+PiBPciBkaWQgSSBtaXNzIHNvbWUgYXNwZWN0Pw0KPj4+
DQo+Pj4gQXJlbid0IHNvbWUgb2YgdGhlIGdlbmVyYXRlZCBmaWxlcyBNYWtlZmlsZSBmcmFn
bWVudHM/IFRoZW0gYmVpbmcgcmUtZ2VuZXJhdGVkDQo+Pg0KPj4gTm8uDQo+Pg0KPj4gTWFu
LXBhZ2VzLCBzaGVsbCBzY3JpcHRzIGFuZCBzb21lIE9jYW1sIGZpbGVzIChvbmUgY29uZmln
IGZpbGUgYW5kIG9uZSAubWwgZmlsZSwNCj4+IHdoaWNoIGlzIHNpbWlsYXIgdG8gYW4gaW5j
bHVkZSBmaWxlIEkgYmVsaWV2ZSkuDQo+Pg0KPj4+IG1lYW5zIG1ha2UgcmUtaW52b2tpbmcg
aXRzZWxmLCB3aGljaCBjb3VsZCBiZSBhdm9pZGVkIGlmIHRoZSBjb250ZW50cyBkb24ndA0K
Pj4+IHJlYWxseSBjaGFuZ2UuIChUaGlzIGlzbid0IGp1c3QgYSBwZXJmb3JtYW5jZSBjb25j
ZXJuOyB0aGlzIHJlLWludm9jYXRpb24gaGFzDQo+Pj4gYmVlbiB0aGUgc291cmNlIG9mLCB3
ZWxsLCBzdXJwcmlzaW5nIGJlaGF2aW9yIGluIGNlcnRhaW4gY2FzZXMuKQ0KPj4NCj4+IEkg
c3RpbGwgZG9uJ3Qgc2VlIGEgY2FzZSB3aGVyZSBtYWtlIHdvdWxkIGNvbnNpZGVyIHJlYnVp
bGRpbmcgdGhlIGZpbGUgZnJvbQ0KPj4gaXRzIC5pbiBmaWxlIHdpdGhvdXQgdGhlIC5pbiBm
aWxlIGhhdmluZyBjaGFuZ2VkLCB0aHVzIHJlc3VsdGluZyBpbiB0aGUgYnVpbHQNCj4+IGZp
bGUgdG8gY2hhbmdlLCB0b28uDQo+IA0KPiBBcyBBbmRyZXcgaW5kaWNhdGVkLCBQYXRocy5t
ayBtaWdodCBoYXZlIGNoYW5nZWQsIHNvIGF0IHRoZSB2ZXJ5IGxlYXN0IGFuDQo+IGV4cGxp
Y2l0IGRlcGVuZGVuY3kgd291bGQgbmVlZCBhZGRpbmcuIEJ1dCBhcyBhbGx1ZGVkIHRvIGVs
c2V3aGVyZSwgSSdtIG5vdA0KDQpZZXMsIGFuZCBJIHNhaWQgdGhhdCBhbHJlYWR5Lg0KDQo+
IHF1aXRlIGNvbnZpbmNlZCBQYXRocy5tayBzaG91bGQgYmUgaGFyZC1jb2RlZCBhcyB0aGUg
c29sZSBzb3VyY2Ugb2YgcGF0dGVybnMNCj4gaW4gQ29uZmlnLm1rLiBBdCB0aGUgcG9pbnQg
ZnVydGhlciBzdWNoIGZpbGUgY29tZSBpbnRvIHBsYXksIGRlYWxpbmcgd2l0aCB0aGUNCj4g
ZGVwZW5kZW5jaWVzIG1pZ2h0IGdldCBpbnRlcmVzdGluZyAvIGNsdW1zeS4NCg0KU2VlIG15
IGFuc3dlciB0byB5b3VyIG5leHQgcmVwbHkuDQoNCj4gDQo+PiBXZWxsLCB3aXRoIG9uZSBw
cm9iYWJseSB2ZXJ5IHJhcmUgZXhjZXB0aW9uOiBpbiBjYXNlIGENCj4+IGRpZmZlcmVudCBA
bWFya2VyQCBpcyB1c2VkIGluIHRoZSAuaW4gZmlsZSwgYnV0IHdpdGhvdXQgY2hhbmdpbmcg
dGhlIHJlc3VsdGluZw0KPj4gZmlsZSBkdWUgdG8gb2xkIGFuZCBuZXcgbWFya2VyIHJlc3Vs
dGluZyBpbiB0aGUgc2FtZSBvdXRwdXQuDQo+Pg0KPj4gSW4gY2FzZSB3ZSByZWFsbHkgY2Fy
ZSBhYm91dCBzdWNoIGNhc2VzLCB3ZSBzaG91bGQgdGhpbmsgYWJvdXQgdXNpbmcNCj4+IG1v
dmUtaWYtY2hhbmdlZCBldmVyeXdoZXJlLCBhcyBlLmcuIGJ1aWxkaW5nIGEgcHJvZ3JhbSB3
aXRoICRIT1NUQ0MgY291bGQNCj4+IHJlc3VsdCBpbiBhbiB1bmNoYW5nZWQgYmluYXJ5IGV2
ZW4gd2l0aCBzb3VyY2UgZmlsZXMgaGF2aW5nIGNoYW5nZWQsIGFuZCB0aGUNCj4+IHJlc3Vs
dGluZyBwcm9ncmFtIGNvdWxkIGJlIHVzZWQgdG8gZ2VuZXJhdGUgb3RoZXIgZmlsZXMgLi4u
DQo+IA0KPiBGb3Igc29tZSBvZiB0aGUgY2FzZXMgdGhpcyBtaWdodCBhY3R1YWxseSBiZSB3
b3J0aHdoaWxlLiBJdCBhbGwgZGVwZW5kcyBvbg0KPiBob3cgbXVjaCBvZiBhIGtub2NrLW9u
IGVmZmVjdCB0aGUgcmUtYnVpbGRpbmcgb2YgYSBwYXJ0aWN1bGFyIGZpbGUgaGFzLg0KDQpB
cyBsb25nIGFzIHRoZSBlZmZlY3QgaXMgbm90IFdST05HICh3aGljaCBpc24ndCB0aGUgY2Fz
ZSB3aXRoIG15IHBhdGNoIHNlcmllcyksDQpJIHRoaW5rIHdlIGhhdmUgdG8gY29uc2lkZXIg
aG93IG9mdGVuIHRoaXMgd291bGQgYmUgdGhlIGNhc2UuDQoNCk9wdGltaXppbmcgdGhlIGJ1
aWxkIHRpbWUgZm9yIG9uZSBjYXNlIGluIDEwLjAwMCBidWlsZHMgKGFuZCBJIHRoaW5rIHRo
ZSByYXRpbw0KaW4gdGhlIGNhc2Ugb2YgbXkgc2VyaWVzIGlzIGV2ZW4gbW9yZSBleHRyZW1l
KSB3aGlsZSBtYWtpbmcgdGhlIGJ1aWxkIHRpbWUgZXZlbg0Kb25seSBhIHRpbnkgYml0IGxv
bmdlciBmb3IgYWxsIHRoZSBvdGhlciBjYXNlcyBpcyBhIGJhZCBpZGVhIElNSE8uIEFuZCB0
aGUgYnVpbGQNCnRpbWUgd2lsbCBiZSBzbG93ZXIgd2l0aCB1c2luZyBhIHRtcCBmaWxlIGFu
ZCBpbnZva2luZyB0aGUgbW92ZS1pZi1jaGFuZ2VkDQptYWNyby4NCg0KDQpKdWVyZ2VuDQo=

--------------VV0ZDA0GiNTVuVk0bKDhiAzL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------VV0ZDA0GiNTVuVk0bKDhiAzL--

--------------i5b22Q0HRqVeX10PiI6iMDbE--

--------------or3nJCuJEyH1aO325Ecv7cPq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkbHQ0FAwAAAAAACgkQsN6d1ii/Ey87
dwf/ZTxhIjkUts7GBMrDtl8lBWw4x0XRN4vhUjZT1hyYovc0tBQbgtGWZFPUqHlDSqrNvSQV8uV3
XnT4dCebGpkKws7Omuw/SlXY+tJYeqFJOdHVxeAjU/z9+PPTF3BknoeiN2m97JtoqzI+Rr5t1K0a
jTprTMmpY1loi8ln0qCAGCMkhYHjjtILPVkpTWGtLPXIowHaZaORshj3/mIesJ8BznSSP/U+3J6n
IS8VXb85SMmj4VGb69Jjb++4UtiX9RIiZ9/STQSKFcoKc/dxtkUC9wU2tVOZrUINfHVJCgXPH2Ok
RiZzHrymNQ73b07LrA556yvt5qW6S+dvOVQdIZ2mXg==
=UvXS
-----END PGP SIGNATURE-----

--------------or3nJCuJEyH1aO325Ecv7cPq--

