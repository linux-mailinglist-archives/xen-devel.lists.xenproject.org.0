Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93351A8943C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952075.1347636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aCr-0002bi-7O; Tue, 15 Apr 2025 06:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952075.1347636; Tue, 15 Apr 2025 06:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aCr-0002ZF-4Q; Tue, 15 Apr 2025 06:55:41 +0000
Received: by outflank-mailman (input) for mailman id 952075;
 Tue, 15 Apr 2025 06:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pN+4=XB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u4aCq-0002Rv-GW
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:55:40 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4317dd2-19c6-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 08:55:39 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso838374666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:55:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1999d96sm1025891866b.0.2025.04.14.23.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:55:38 -0700 (PDT)
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
X-Inumbo-ID: a4317dd2-19c6-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744700139; x=1745304939; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH1iHo0oVHEl3wNf7M0lyymD0sny8Au9BwF+SaQ+0yY=;
        b=KVzF1daEwl9ka49pThLhdHI+NWKa0YNW64+4PLTP2YIO8q+eqrMI4810xRqOTuLSQi
         1cC5Z6SkIebGWXGJKecCsZxxK1xP4LaWEOcegCHvh5O3Ko/ocM3RIcYgvKFYHRtWh/gk
         zR4gwGliwWxmgLCOQ4BExU73Ek7vFKrOo3lljyhUz8zFQarGZSfbl/VE4m5ibASx3PPC
         gtJM6yvFINO/2MWXdyWqHtZplD55s4lv905o9bUc4mdpt1iHW7F6DEqfEAok+AFDnPzP
         CRXUOF0QalyI+wegMHebnTwAxPO4k5rRRuuHBV2mSbCYFsSnhnY3XfoHK2HjOKznpJCK
         8Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700139; x=1745304939;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mH1iHo0oVHEl3wNf7M0lyymD0sny8Au9BwF+SaQ+0yY=;
        b=LW0AkV0aa7O8cB94HloX4vche77mNtC6/NYFe76JhWMOQwLAItL4vQ3zd0AnxD0AOf
         iZlozSUqlcpvybp/AxJaAgV8EaB9kenQJTGensJYCojbhGPTKrtjgN3+Lix3H+eHdIWk
         I5ahEyQRw2JDPKqbuW5xHdbvEfCkmMGMzAk5jS9W2SfY0CcG2bb+/KOvnVJchA17PBA1
         30QrwdYj0POAISoDKN98vMoU1bZ0ADvITF2LDKbbqgE77MW7E94F6QnTwWO30FcqZ9Z5
         MQki7bYvUgo2De9+Hyc56yVVQkJIIkE8jFHkbn6gJaE6vaC5rxHPQR5vKOU+f18KWhB0
         XPhw==
X-Forwarded-Encrypted: i=1; AJvYcCVdcToBbRS63caHR3ES9eP8XBkoaDoQBzx1CDgAC5XiUtZZBR+YR+YYkwAiUfkDvy6ID/WZIluqIbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFNxMesQJa8xaUpX0sYWFxM38mujrmzcWmYQOzDmhZAM/fuP7U
	ROlVez89IVidQMGi8rJL4iGv8n+fhy8UXeqMZzjmKkLLvexRzKXFi7phvHG4FM4=
X-Gm-Gg: ASbGnct/DGi/UIqPRWQs14I2vu78Lj/Xksv80DT5f/+A62Zgcfbkv9DkD+cIApoIcJg
	it5oujP1aeMao4ersZFRyEfmdIz1LXSzMlsO+E/mHY795A5eImTDwRtcmwKcrIJga5LJ2Y93eX9
	//9U0LvTZ5RwMN83tfxSQUv9IrE2IiEHAFfldhLug7AvB/O7Uc4aa6DfDhOjtifSg1X9tLulBDA
	oLlBdgB3VpI/hDDIiRIDiblIPoJ86Hb4hAptAGf9FTJkPklhDRInscptkr3GJhSv0UKynR1PRkC
	7IjhFzjGbZLxP+IApsOqTtvAKY8/EG0lP+JlmA5pPCVZCjUd0ck6jmZFeWJ9W02YXDsJEKKbfee
	Sou9zwhZlVYQ2sNQopC7TT50zqJ2MSPTQ5Eerrgiyvb98Dr1MNPKPXDKwWpwrTcvC/g==
X-Google-Smtp-Source: AGHT+IHfwJashPa+nqtOMRp7LD73ka/YQaxjrS0ijQc96PctD+DEkKhFe9nYhZU4EUJUkHAUKH06Sw==
X-Received: by 2002:a17:907:60d4:b0:ac8:16fb:a291 with SMTP id a640c23a62f3a-acad34869edmr1535103466b.18.1744700139191;
        Mon, 14 Apr 2025 23:55:39 -0700 (PDT)
Message-ID: <49dc22ee-ad72-4c01-bab9-37f405e947d6@suse.com>
Date: Tue, 15 Apr 2025 08:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-6.15-rc2/drivers/xen/balloon.c:346: Possible int/long mixup
To: David Binderman <dcb314@hotmail.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
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
In-Reply-To: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wY5A2zixIF1bIvSO7tvogJP6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wY5A2zixIF1bIvSO7tvogJP6
Content-Type: multipart/mixed; boundary="------------L80Zs1i0UKD0f1eNCgIODbzW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Binderman <dcb314@hotmail.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <49dc22ee-ad72-4c01-bab9-37f405e947d6@suse.com>
Subject: Re: linux-6.15-rc2/drivers/xen/balloon.c:346: Possible int/long mixup
References: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB1021776B93FEF6D425C7223389CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>

--------------L80Zs1i0UKD0f1eNCgIODbzW
Content-Type: multipart/mixed; boundary="------------rNOgDUQkUSyo2kvvHmbYIPcQ"

--------------rNOgDUQkUSyo2kvvHmbYIPcQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDQuMjUgMTk6NTcsIERhdmlkIEJpbmRlcm1hbiB3cm90ZToNCj4gSGVsbG8gdGhl
cmUsDQo+IA0KPiBTdGF0aWMgYW5hbHlzZXIgY3BwY2hlY2sgc2F5czoNCj4gDQo+IGxpbnV4
LTYuMTUtcmMyL2RyaXZlcnMveGVuL2JhbGxvb24uYzozNDY6MjQ6IHN0eWxlOiBpbnQgcmVz
dWx0IGlzIGFzc2lnbmVkIHRvIGxvbmcgdmFyaWFibGUuIElmIHRoZSB2YXJpYWJsZSBpcyBs
b25nIHRvIGF2b2lkIGxvc3Mgb2YgaW5mb3JtYXRpb24sIHRoZW4geW91IGhhdmUgbG9zcyBv
ZiBpbmZvcm1hdGlvbi4gW3RydW5jTG9uZ0Nhc3RBc3NpZ25tZW50XQ0KPiANCj4gU291cmNl
IGNvZGUgaXMNCj4gDQo+ICAgICAgdW5zaWduZWQgbG9uZyBpLCBzaXplID0gKDEgPDwgb3Jk
ZXIpOw0KPiANCj4gTWF5YmUgYmV0dGVyIGNvZGU6DQo+IA0KPiAgICAgIHVuc2lnbmVkIGxv
bmcgaSwgc2l6ZSA9ICgxVUwgPDwgb3JkZXIpOw0KPiANCg0KV2hpbGUgSSBhZ3JlZSB0aGlz
IHdvdWxkIGJlIGJldHRlciwgdGhlcmUgaXMgbm8gcmVhbCBmYWlsdXJlIHBvc3NpYmxlDQpo
ZXJlLiBGb3IgdGhpcyB0byBjYXVzZSBwcm9ibGVtcyB5b3UnZCBuZWVkIHRvIGhvdHBsdWcg
MTZUQiBvZiBtZW1vcnkNCmluIG9uZSBzaW5nbGUgYmxvY2suDQoNCk5ldmVydGhlbGVzcyB0
aGFua3MgZm9yIHRoZSBub3RpY2UuDQoNCg0KSnVlcmdlbg0K
--------------rNOgDUQkUSyo2kvvHmbYIPcQ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rNOgDUQkUSyo2kvvHmbYIPcQ--

--------------L80Zs1i0UKD0f1eNCgIODbzW--

--------------wY5A2zixIF1bIvSO7tvogJP6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmf+AuoFAwAAAAAACgkQsN6d1ii/Ey/n
kQf/ZtJmR+LeWcIyGU04l61IaqpD67A1ASh+lM+EKBzUAzhmQ1zp2W3s3OPlg/altaQuRys/XNX9
J7R0fhFKlHT8ihOiIIF4uIcaqICAKKiivrxH6yFyWnn1dPyPiz1Xe4C/GmFjagfj/xcCVkymIwgx
6gL51sENPyqbLNzK+sOHDgZOBXfqAaiAl+B1RYtu1HXh9tk8YWbEXkAXXye15VHkYG9urOkZY4f6
oanrsUNR3844AB1SJQ73cKRzv+v/EVXsgqPRTmdII4Ei6jMs2HCiHPKhko1v12yxz1r44JiTjJ4v
eOhfStPjwByvrCJ3+QPg9G/d0fsEXkpc82MZ5sUR+g==
=KJKF
-----END PGP SIGNATURE-----

--------------wY5A2zixIF1bIvSO7tvogJP6--

