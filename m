Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A73A749E8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 13:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930588.1333195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8yY-0004P1-3l; Fri, 28 Mar 2025 12:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930588.1333195; Fri, 28 Mar 2025 12:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8yY-0004MV-0V; Fri, 28 Mar 2025 12:38:18 +0000
Received: by outflank-mailman (input) for mailman id 930588;
 Fri, 28 Mar 2025 12:38:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dgi5=WP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ty8yV-0004MK-RV
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 12:38:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84068047-0bd1-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 13:38:14 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so334721f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 05:38:14 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fba4b4fsm27043775e9.1.2025.03.28.05.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 05:38:13 -0700 (PDT)
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
X-Inumbo-ID: 84068047-0bd1-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743165493; x=1743770293; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1PQwPvaNHawbSOSV/o2upXupCKnh1HXAi0RshoHTmsw=;
        b=JTniqaB6oIsSB3DUxLbH0OO27R+Vxc1OjGtfmH/4a9yPziujMWVEe4KKalZ7gC/bs2
         anZhJkVILf75SCFkgyaVL2zzkWPbFPCm8dFWqAqi54F45SVnf4TlhJjoekRlsnAJQ7FO
         7QNmdK98B32ZfMAOOvC7Bq0BjCce89pV/GDlANnI0JnvY+YyPqzQjHp400wK/anctydQ
         QWZ60UtDqexBYxiJm7Uz4ZrHqNTLJCI1Jrt2hSTcLe4KxEVCkX2Ob9INDQIdO3ZiAqwk
         YOyRhsZIsvqgxkQC544KbQm6vwr8K39zgCdGTAIsOswyugWbttvQwBLBq8cbXdOMbYU4
         mQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165493; x=1743770293;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PQwPvaNHawbSOSV/o2upXupCKnh1HXAi0RshoHTmsw=;
        b=jMNmFsdq8ArT/9dv/bHYJiJELx80fWZk97jFaZYqjNnvMHxS7Kd2No5STn8/osz30H
         nBEELKO7S6L8T69aX5M9B3zGzwHeuvggZPh9rIlLDY7Drqn6EY8e4o+xE8VI2aEwshmC
         iwYdvOBrviePppTOnyDpmZmA7x6JUgPgyd3OG0Hb9fAOR9hJJLviCZ3t7hN3+pm/Rej2
         bv400sXllEV0Shie64F3jCG2FXnZeAlWs00GZ00qsdkk00ilAUIvjkeC0ZjHvtFpIOZi
         L6/wdRn4NDxFKDvvOSwdl/Nmx8kR09O5Qa7OZ/JIaW44Do7KnJU8Zqf8Qmf2lYROkA1w
         xLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnNDuAR/POnr58XqHFZTbi50Hi+Q8WUmf9TX0rMhMgJZUQi4zhi3n4Uce9ewaGHjz2DzUNZksoMrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi7GKZenqQtANQtRDmYrZYXDlI1QUGSsPRCrLt8F7RHB60CTaK
	3GLfTlfasl07j7/bOizUT2xbaTbZpjofm3WCjhuOkoDswLJpbqszpINQPcyWVAQ=
X-Gm-Gg: ASbGnctRT0nhAzCXcq2sqlgWQDSPBuT55CPA9xk9bu9kS/56oyIjEtTRihFqJI3FbEl
	RNLPQDaFQXhIJPpNESEhDNDBGFfzE3aAE1JZEUBVT7LCWuuPIawMMwqcdJNev1SpQntEZp3Or5g
	QCfag/6/oQfHhkaWVGXpjD8oEJr5V/YQAoG5TVnJPp1jD1i8vvhYOfUWgrrx5EZzPQluLNciZMc
	fa/DMT9yFxE2Q+PQv7bVlNkouu5EKNABam2tYRKPt4sFopyZC5TRXsLrvnW81IUN2DVGFm0UPZ+
	RLLr227TDRMP3kgaAx+hglJKwe1dlSxxbLBVsRiqQxMk590IxpGV39qLm0TsxEZsO1bgwao7Oms
	BXwaxDIUSFRe98l3pIYZUtelsmRC0iNH0DKu7YCGoKJ8ZK/+nd02Ihf4S49Cb+yf9EYFVKA==
X-Google-Smtp-Source: AGHT+IHpySXXZDStYWDSD4Y65OJSkYprrpr9CxzhXXWs+JYdZYHGbeIZVlV1G4Nb2Ulwyq/BYh4JVA==
X-Received: by 2002:a05:6000:1a89:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39ad175c942mr6961992f8f.33.1743165493374;
        Fri, 28 Mar 2025 05:38:13 -0700 (PDT)
Message-ID: <b19a556d-468f-4977-bd41-605ff1678b6e@suse.com>
Date: Fri, 28 Mar 2025 13:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] xenbus: add module description
To: Arnd Bergmann <arnd@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250328113302.2632353-1-arnd@kernel.org>
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
In-Reply-To: <20250328113302.2632353-1-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------040ftg9aw11gGC5hb0SQqvWg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------040ftg9aw11gGC5hb0SQqvWg
Content-Type: multipart/mixed; boundary="------------dwMA83tFU6Zx80eOJ7CAvl5Y";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Arnd Bergmann <arnd@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <b19a556d-468f-4977-bd41-605ff1678b6e@suse.com>
Subject: Re: [PATCH] [v2] xenbus: add module description
References: <20250328113302.2632353-1-arnd@kernel.org>
In-Reply-To: <20250328113302.2632353-1-arnd@kernel.org>

--------------dwMA83tFU6Zx80eOJ7CAvl5Y
Content-Type: multipart/mixed; boundary="------------ofE2oOH0kwc4nwGs3XofANxW"

--------------ofE2oOH0kwc4nwGs3XofANxW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDMuMjUgMTI6MzIsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IA0KPiBNb2R1bGVzIHdpdGhvdXQgYSBkZXNj
cmlwdGlvbiBub3cgY2F1c2UgYSB3YXJuaW5nOg0KPiANCj4gV0FSTklORzogbW9kcG9zdDog
bWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiBkcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3Byb2JlX2Zyb250ZW5kLm8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------ofE2oOH0kwc4nwGs3XofANxW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ofE2oOH0kwc4nwGs3XofANxW--

--------------dwMA83tFU6Zx80eOJ7CAvl5Y--

--------------040ftg9aw11gGC5hb0SQqvWg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfmmDQFAwAAAAAACgkQsN6d1ii/Ey/w
IAf/aQQ0DKf1oG1iJP/7FHVt4qSp3xBpY48+BqqnjS7et/xvCQoxqNNydEmyRdPkjOfByRqH23lP
1pTNu4Pe5i8vbNTuEeE84QnPXvDiaIscCpgi0aZwqS0uAnyUZAupx3idh6PWcl7ki6I8amVVdyNr
Pv7ppRBOaeRPJzSEiiEkE/KGfdCnRRuHntmhuMIDqegmcmOOKxGxYS80YHg6nFuY/P4s/RRxk6s4
LFBSLtpnIzLwdZhG3IWlaGUepuoLt1KNxnKXm71ahCv3OtKAHk4ruE+OkgBUaP15BKsp9rN8sCHF
j74KrsEnzwtwOUEcvH4qD05yvrhbJ/XLrTw4+EF2Og==
=/yWW
-----END PGP SIGNATURE-----

--------------040ftg9aw11gGC5hb0SQqvWg--

