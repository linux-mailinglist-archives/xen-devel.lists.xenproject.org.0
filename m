Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8B9F692F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860512.1272528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvUW-0001jV-B4; Wed, 18 Dec 2024 14:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860512.1272528; Wed, 18 Dec 2024 14:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvUW-0001he-7u; Wed, 18 Dec 2024 14:57:36 +0000
Received: by outflank-mailman (input) for mailman id 860512;
 Wed, 18 Dec 2024 14:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fISF=TL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNvUU-0001hP-AG
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:57:34 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 673c8f52-bd50-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 15:57:30 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa1e6ecd353so902163466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 06:57:30 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ab5077sm5485822a12.17.2024.12.18.06.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 06:57:29 -0800 (PST)
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
X-Inumbo-ID: 673c8f52-bd50-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734533849; x=1735138649; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XhzGeo4oqoNOgqgC0vx9o2pyKCL8/bwBJyFRCefXgJA=;
        b=L+8o2xAPOtimFQgOEdr9SoBoNiZu+KUR825Ls4bwdEz4p/7EVrADT+5b/lCjrMcN+r
         XTrlqKc2Ju8DpuJkqNmke927LBNNJcunQwf2vLz0UUh2eMDdelQ7W+wliKa+8CVASRmg
         cnzlzzHRKEVC93dvrY28OsmSCD2vIuCAmBUNOYqyAS2+eGQ4dk1ttUdzi4U92IByT9xV
         DXdRRiqhUpShPoTjRl2QOlueYV4XOGsKOw2h6dUb0XQZ6yfF8hBla4AYHsyIG4o8onxo
         V90RoJ7o3wuPn3SzDK4xGpX9eozKZu6JhqYF2XJfxNJhUCt/tnGtDPeGdL0vZ0rjUBsJ
         +EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533849; x=1735138649;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhzGeo4oqoNOgqgC0vx9o2pyKCL8/bwBJyFRCefXgJA=;
        b=D3GM0uh8iGofRUSXaZOPd1JoOZmMlrra1TKQhWE5rJ/DI4AKR5dYoxflncxyVGlLmZ
         iOFL9A4ZWZVVD5ArkAnXhVxNsYT9CUCpu/AlP4hbO/iGaJPQhXbUmPwsCD55SCdmf1KZ
         EElySJ99q2hwDWE/XaUO/7GvJ/94R2GaWQtKH7pAJtoPkfzn2tz5pQQMuqGLnRrZEe8z
         ojXuQerILDmIiCREdeTF4z6ZQCOYXmInX8RXcJ20CEGY/Kwb/ELuMvuCX8pilxGe1FEY
         Cnoqd1vQzLGtodJZsliXFJI8e/cb1mIObLvsqbeZNh6uxUvh+lL0T73LBTmtexUSosYe
         m9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCURKyBN2RS76LH/zrkhCkeufiH5PTb0F101TTmq+KCdnuQKJSeQSsSalnX/LSPdzL1s2vBaOAM3xDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5/QDnyW0x7dc7HbLAPeBFB6bIwcu18XkBJeouksKcZc5FrZy8
	MfAWpeXCbqbWgnthf1US0n5SIo3NU9n0v53X1VTcBIL8RqfW14FGC6RGZN74Hsk=
X-Gm-Gg: ASbGncuSGGxZ5ZiNKrqikArfgkkHKN2Bu+cXOkp0GT4gUgmoBzK0+f7WzRbmxJuj94z
	Fq46yJjh8pw7VquIUkfJl9cyeAf1SYJVGXoaRJDMH0eKJR9g/BEl5DA3e6Xa6+SslZgcJcHsgV4
	RNpjFrdxbJ0izB+cCbXWa0La5vx+FHJyarOggl2JieCEF10vlxzj0oU7VytewOUroXDHlgaUyK9
	ooihIxyT/W9odEwHz9LstxzAzCbUxDzLN7z/2IjTd7V4d5BIft0UiPhwaSaDmQD9ISo/HJRuUA8
	XmijtBRdq+8qhIbBYc/SL3w0nRq3UbmXCL2wPcOZKEIc34mUuRanQoaVP0/aH9nDHzN+131CK8W
	GEWOM+g==
X-Google-Smtp-Source: AGHT+IHUCNdnqvum6EYV7Xed4kEu7GbOxjQJaYPVHBcDqNps/hNJZ0pVAfTrkGfUMgHFM2VMAw7Smg==
X-Received: by 2002:a05:6402:3814:b0:5d3:ff93:f5f9 with SMTP id 4fb4d7f45d1cf-5d7ee3b6194mr7735353a12.20.1734533849381;
        Wed, 18 Dec 2024 06:57:29 -0800 (PST)
Message-ID: <eedddc27-feb9-42e5-a078-3a0c6f43d4ed@suse.com>
Date: Wed, 18 Dec 2024 15:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: Untangle credit2 vs cpu_nr_siblings()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20241218124900.60886-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241218124900.60886-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4PoHlfyIT00FO0qBQQCTx0Ga"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4PoHlfyIT00FO0qBQQCTx0Ga
Content-Type: multipart/mixed; boundary="------------hurtdKyja73I8o3Itj3kvF3p";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <eedddc27-feb9-42e5-a078-3a0c6f43d4ed@suse.com>
Subject: Re: [PATCH] xen/sched: Untangle credit2 vs cpu_nr_siblings()
References: <20241218124900.60886-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241218124900.60886-1-andrew.cooper3@citrix.com>
Autocrypt-Gossip: addr=JBeulich@suse.com; keydata=
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

--------------hurtdKyja73I8o3Itj3kvF3p
Content-Type: multipart/mixed; boundary="------------ZW02jYcg6TbVqeDm0g7pTEWB"

--------------ZW02jYcg6TbVqeDm0g7pTEWB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTIuMjQgMTM6NDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IENyZWRpdDIgaGFz
IG5vIGJ1aXNuZXNzIGluY2x1ZGluZyBhc20vY3B1ZmVhdHVyZS5oIG9yIGFzbS9wcm9jZXNz
b3IuaC4NCj4gDQo+IFRoaXMgd2FzIGNhdXNlZCBieSBhIGJhZCBvcmlnaW5hbCBhYnN0cmFj
dGlvbiwgYW5kIGFuIGV2ZW4gbGVzcyB3aXNlIGF0dGVtcHQNCj4gdG8gZml4IHRoZSBidWls
ZCBvbiBteSBiZWhhbGYuICBJdCBpcyBhbHNvIHRoZSBzb2xlIHJlYXNvbiB3aHkgUFBDIGFu
ZCBSSVNDLVYNCj4gbmVlZCBjcHVmZWF0dXJlLmggaGVhZGVyLg0KPiANCj4gV29yc3Qgb2Yg
YWxsLCBjcHVfZGF0YVtjcHVdLng4Nl9udW1fc2libGluZ3MgZG9lc24ndCBldmVuIGhhdmUg
dGhlIHNhbWUNCj4gbWVhbmluZyBiZXR3ZWVuIHZlbmRvcnMgb24geDg2IENQVVMuDQo+IA0K
PiBJbXBsZW1lbnQgY3B1X25yX3NpYmxpbmdzKCkgbG9jYWxseSBpbiBjcmVkaXQyLmMsIGxl
YXZpbmcgYmVoaW5kIGEgVE9ETy4gIERyb3ANCj4gdGhlIHN0dWIgZnJvbSBlYWNoIGFyY2hp
dGVjdHVyZS4NCj4gDQo+IEZpeGVzOiA4ZTJhYTc2ZGMxNjcgKCJ4ZW46IGNyZWRpdDI6IGxp
bWl0IHRoZSBtYXggbnVtYmVyIG9mIENQVXMgaW4gYSBydW5xdWV1ZSIpDQo+IEZpeGVzOiBh
ZDMzYTU3M2MwMDkgKCJ4ZW4vY3JlZGl0MjogRml4IGJ1aWxkIGZvbGxvd2luZyBjL3MgOGUy
YWE3NmRjICh0YWtlIDIpIikNCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------ZW02jYcg6TbVqeDm0g7pTEWB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ZW02jYcg6TbVqeDm0g7pTEWB--

--------------hurtdKyja73I8o3Itj3kvF3p--

--------------4PoHlfyIT00FO0qBQQCTx0Ga
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdi4tgFAwAAAAAACgkQsN6d1ii/Ey8f
/ggAgDO2VlJKZDM7K137nvqrCxhW10QOChSraZ2krmAcuKS6D0qwtQ7cjyC6nrZn97P4Z1OsPHiP
9MUdPObnGjYpDPPG45hicjzhNNIs4p/K48SXyoYB96MUT0h6ZEaRZ0shpm0Co7zOpbI8aQo7T94F
XYSfDniMchharX38Jrlo2zzzhe35PwvcETKwoCmBWvo+9PlgEcLD9MswbqIdf8+05jsKbtperdzO
BKs8Q0kuFiyZcbToh0SFwHDuC3J2h2jjiQQDRUMhRjMsVkgl1UQkJ+gpYEw2ErhT+BqMvL3wr6eL
uCN/Nyf/RuiqqakqPhdF9lRMLukGkMbqJt4i9aMe/A==
=6Rzz
-----END PGP SIGNATURE-----

--------------4PoHlfyIT00FO0qBQQCTx0Ga--

