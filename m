Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC3ABABF1
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 20:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988452.1373232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGMdJ-0000lK-Kw; Sat, 17 May 2025 18:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988452.1373232; Sat, 17 May 2025 18:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGMdJ-0000jQ-GS; Sat, 17 May 2025 18:51:41 +0000
Received: by outflank-mailman (input) for mailman id 988452;
 Sat, 17 May 2025 18:51:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=05QO=YB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uGMdH-0000jJ-VV
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 18:51:40 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6027304-334f-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 20:51:37 +0200 (CEST)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-ad51ba0af48so479022266b.0
 for <xen-devel@lists.xenproject.org>; Sat, 17 May 2025 11:51:37 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498747sm329295866b.137.2025.05.17.11.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 May 2025 11:51:36 -0700 (PDT)
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
X-Inumbo-ID: f6027304-334f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747507897; x=1748112697; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=esvr8R6WEoSrZXgQlzfaTrT/BDn5P1ZhexoSJKjzt7M=;
        b=JM8ILaJj7x0uz/2Y/JJoS91/Ii3GgdedOrNpMJeZNnUqnHNLIuSXKT0IplvOm4GZnc
         ayZa2HmMTCXAh5nczsRtbuD6sWjDdzcXb8eHicEBGpt7CCxYrPz9/EmWRCY5N9VMf/57
         OxA9it7vZFBdd7+XTCuDE+dImSp5lMT2cNmdNU/FMOvmk+sPW9MH2qpZMJuyr5uAAguE
         bjfyL79dlzgicswN7IzWTGyRlXRlP79KX1tsvzBhuVUlDcEIdy5sb5IXwJ1jf7gqd57t
         hnVZIKkX8XtB6E9PXHNtfqLGnBLNU60zdTuSSbbcucLMXk/Am7hE+VJChVtqedwNZO48
         KVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747507897; x=1748112697;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esvr8R6WEoSrZXgQlzfaTrT/BDn5P1ZhexoSJKjzt7M=;
        b=C9Y/c6Whk+9oXGgvXH0e/sfO8s461RZojZZFKoI4j0XaoDx9mad+slRT0+cFnfRY6D
         IgX4EN0TfYqQaVLKqzqiYMBFFnjD6yLBYI+T6+zrp4Sby1+EjXocpCOpcBZQ513RCVk3
         4b4gPcFNtgPl/MnfO2WCw7QmIANJoCij8T8q5FhnbPbIVIAleID/L4mT8hbRmZV3QW+1
         4nfkrLwneYz5vMCn42kmOz7Q7j3gLQgn4t+7Bgj6WvJj3ocZiGCwjH7FR8QsKq5uo0qU
         WTLd2RnvdOHjV6xmrJAj8JxSuUesd7TkTxdR0S/pkbIOWdNmMgZzWZm0idwnNPQ8K3Va
         vX0w==
X-Forwarded-Encrypted: i=1; AJvYcCWXI76VCOyzeLOFZGf79BPcSBp7r+razKgi5QXboPuE2VIDxKex+WonUYM1f1jgk/r4hhzZWDrLpHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynwgTiGaB9Vk5FiRpHPkx2zUm0wSE65C8vtt+yB1thhu3TbGXl
	0TaAQZtjUYcio9U9tF0XYZYiah2sXmI/dzmZhrRwicXtU51aAOiS/BAzGe8f9Lz69Wo=
X-Gm-Gg: ASbGncuxjsoi0sEyq/7ewmzNckjphK5+Wb4+uqu2LqIMCOPBtBSU+X5JYwCkoSvsZ8H
	wtsHPvNk7IHvr5XDgfsQmHE2Xm/jb/aljwKYbQZMIkS5WsZ++ghqAvaD8R4pBWdPt5oWkh3v2ed
	9JK9mPrIPQMRTHab1g+qcXYz4tn0pQbh6tDZpNXoA/+yVi4QYREDohGYQ+NkXpUPEpIGTDQWLMS
	uWiNd/nqnlHtxe2s59j8ro/PAcSPazs/KzJHmdmt6zDTirynzPGnvnldEzB68gUY/w4obM0MGs7
	BnDUmIDgaRsTDJ/jM6M9K+TUYa8uKEkusVSaJZyoca4xTTLTn+rO8UGWyD28er4OftAgCZb4wBL
	bnvAtir/D9QZpw9nB5jU8pM3/5ZuY1tbQas66Ywuf86Iu8CHoFPtiIGMob+ysV9XmmnoAjzDWdO
	iY93AG/1dVIf0=
X-Google-Smtp-Source: AGHT+IFEF2Q0UxOZnJlm+Ccp+4eTz4P200IBb4VqMusjriDU43pbgoKygbxgSW1mEWMO0YQml7o1iw==
X-Received: by 2002:a17:907:7e9c:b0:ad5:11a2:f95e with SMTP id a640c23a62f3a-ad52f1a09b1mr739087266b.5.1747507896600;
        Sat, 17 May 2025 11:51:36 -0700 (PDT)
Message-ID: <5f76fa30-53cf-4cdd-9201-5fd525573858@suse.com>
Date: Sat, 17 May 2025 20:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1A 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 peterz@infradead.org, boris.ostrovsky@oracle.com, dan.carpenter@linaro.org,
 rafael@kernel.org, lenb@kernel.org
References: <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
 <20250517165713.935384-1-xin@zytor.com>
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
In-Reply-To: <20250517165713.935384-1-xin@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wYlEYju0WXW3nEzZsQVz5sqK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wYlEYju0WXW3nEzZsQVz5sqK
Content-Type: multipart/mixed; boundary="------------npkniPAj3lZU17c0YJiIJgOs";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 peterz@infradead.org, boris.ostrovsky@oracle.com, dan.carpenter@linaro.org,
 rafael@kernel.org, lenb@kernel.org
Message-ID: <5f76fa30-53cf-4cdd-9201-5fd525573858@suse.com>
Subject: Re: [PATCH v1A 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
References: <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
 <20250517165713.935384-1-xin@zytor.com>
In-Reply-To: <20250517165713.935384-1-xin@zytor.com>

--------------npkniPAj3lZU17c0YJiIJgOs
Content-Type: multipart/mixed; boundary="------------llwv3cxcMOeLkriHHzdPWzyR"

--------------llwv3cxcMOeLkriHHzdPWzyR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDUuMjUgMTg6NTcsIFhpbiBMaSAoSW50ZWwpIHdyb3RlOg0KPiB4ZW5fcmVhZF9t
c3Jfc2FmZSgpIGN1cnJlbnRseSBwYXNzZXMgYW4gdW5pbml0aWFsaXplZCBhcmd1bWVudCBl
cnIgdG8NCj4geGVuX2RvX3JlYWRfbXNyKCkuICBCdXQgYXMgeGVuX2RvX3JlYWRfbXNyKCkg
bWF5IG5vdCBzZXQgdGhlIGFyZ3VtZW50LA0KPiB4ZW5fcmVhZF9tc3Jfc2FmZSgpIGNvdWxk
IHJldHVybiBlcnIgd2l0aCBhbiB1bnByZWRpY3RhYmxlIHZhbHVlLg0KPiANCj4gVG8gZW5z
dXJlIGNvcnJlY3RuZXNzLCBpbml0aWFsaXplIGVyciB0byAwIChyZXByZXNlbnRpbmcgc3Vj
Y2VzcykNCj4gaW4geGVuX3JlYWRfbXNyX3NhZmUoKS4NCj4gDQo+IERvIHRoZSBzYW1lIGlu
IHhlbl9yZWFkX21zcigpLCBldmVuIGVyciBpcyBub3QgdXNlZCBhZnRlciBiZWluZyBwYXNz
ZWQNCj4gdG8geGVuX2RvX3JlYWRfbXNyKCkuDQo+IA0KPiBGaXhlczogZDgxNWRhODRmZGQw
ICgieDg2L21zcjogQ2hhbmdlIHRoZSBmdW5jdGlvbiB0eXBlIG9mIG5hdGl2ZV9yZWFkX21z
cl9zYWZlKCkiDQo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QGxpbmFyby5vcmc+DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRl
dmVsL2FCeE5JX1EwLU1odEJTWkdAc3RhbmxleS5tb3VudGFpbi8NCj4gU2lnbmVkLW9mZi1i
eTogWGluIExpIChJbnRlbCkgPHhpbkB6eXRvci5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------llwv3cxcMOeLkriHHzdPWzyR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------llwv3cxcMOeLkriHHzdPWzyR--

--------------npkniPAj3lZU17c0YJiIJgOs--

--------------wYlEYju0WXW3nEzZsQVz5sqK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgo2rYFAwAAAAAACgkQsN6d1ii/Ey/y
1gf+OIrTmR24006WFmEsHRhFAD+Rxh+DPGsuFdt+zPIvZT46MPLR0SQ9a4Xugs+lkkjnEnwBQ4Gp
sCkPjxXliS8bO+w203UixwqIvyYXSTVMhdl0kvgEBcDobMfbPQExTR0iGja6kQyiy/Oyhz1/MmWe
sKSteetLIxXWLruF/qFh0yxi8QLgDs8vkNY5eTA9Vzx0iGItISRn3u5v/qpmW1Cz9+sSEeihfULy
t6Q9miXwajrovQR3tn4+NBKOaF4oRnM74lrohRFAJRHj46vmMRqkO8n1WkLV5c6KsjSyh4102Mh3
J0gYZzleGWsaA7/Q2Xb8VT4ECuTX+pTYeMtzNV74hA==
=t71+
-----END PGP SIGNATURE-----

--------------wYlEYju0WXW3nEzZsQVz5sqK--

