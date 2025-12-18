Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AE8CCAD8D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 09:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189310.1510106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW9H6-0000qj-AI; Thu, 18 Dec 2025 08:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189310.1510106; Thu, 18 Dec 2025 08:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW9H6-0000nc-76; Thu, 18 Dec 2025 08:22:16 +0000
Received: by outflank-mailman (input) for mailman id 1189310;
 Thu, 18 Dec 2025 08:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2jZQ=6Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vW9H4-0000nV-EQ
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 08:22:14 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a791dd36-dbea-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 09:22:13 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6492e78ce07so400740a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 00:22:13 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29?
 (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de.
 [2003:e5:8704:4800:66fd:131f:60bd:bc29])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585d403dsm1794469a12.11.2025.12.18.00.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 00:22:12 -0800 (PST)
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
X-Inumbo-ID: a791dd36-dbea-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766046132; x=1766650932; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wxp4u7xQNpXdg/Ydyg/VRGwAJBzd6AMFHiYDiAM6LjU=;
        b=Z90LCJaHzJ9a5zmvkiLE7mU8RPovHbUW9XyA9rAXSugl6YbehxjQHUVuJZDcBSgYx6
         FK6HNPLhd3fbu1dz6c0+CsKnnW1fy7PxYcIAZSU/5eAanb2MoOZ0DnZhccj89H3R9cGb
         nJrKIuF4UQYAeELGV6UeygcafT0f7dPw0WS647fuePvhGQA7SRrlWLrZ5gsNgaez/ES4
         DvQmYlojv3RAoegSOb5c/Cun4D0lvXlOvTfz0GAwb0PXPviquSPYdWKiVI2Zcs6JFrli
         /7At4eT29dSoic3KK3tXrZTansl97Ap0neHxKxd4WbE2iTLBO8hLc7R2uHqf7lvF+h6l
         XFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766046132; x=1766650932;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxp4u7xQNpXdg/Ydyg/VRGwAJBzd6AMFHiYDiAM6LjU=;
        b=W50GUWowRkB1qGE2LSR6B6pPcrvjvZHK8UZn5vO0ZFzW/rmJZ0RCDKHSofYCKbP1YQ
         ULfn8MjWLCa0ZMezkdquLqNHtLGoSDKE7KjePPp6kEuNp9CDcEAmvrRkIAyaCcc61R/F
         DglIp/0Vixf0cJN98rsEc5H9SRXLyB/rxPlVUao6G0NyLqhfZ/yRSTUHnUHUehlC5krW
         zw2gRrMcHXDAU/P7TLUxqkQ6KyBDiYPqbOeyMWUtSoRck1KTZejNDoa73qa2gAiTcXLS
         W7C9G722RLluqB4zPF4WfxkUpdAc8Rcs+f/WszGdJh/CU1j+UdPIgLDBAW0aUO+NhDhr
         WKZg==
X-Forwarded-Encrypted: i=1; AJvYcCXslRn5FmN6/I3jM4n1fW5SyVkDoEtyiIGW/daJagqznxThYosadd75E80yPB6IhzlBuNCUu1dVWOQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcdqGiSK6cb0ohJIKrpGzy4rsvqLO8BL6TNU3TbyzgyBdCeP55
	MB/WJDTNFdaROtxUM+atwfqw8yGJjj8pj4JyK+IpY1w/Xufp20VexnR4wj+yIZ3H6fY=
X-Gm-Gg: AY/fxX6gdS3DeTZNHW8+zhRKXVhAA37R21D7faFHTRKJEJQfl+OTaZ8KZScALkBrTOE
	iK3rHCCqCMc3drl4FiOWapD5NpIQTrzUOB5ZSj2m3V9IQr4oiTKdbgCZBKOtaFTb95T7RlmBmuy
	tNZJ0xOhbAquI4cdyhEK0aznX//MD0y8dn7gbsiXcsKluUeNWti22ONcA2OTSkcPY+95oIyewxP
	oKtOxZjh/A21Nsx9AuJhUL1vMyHEOfDOeDI246af1RnSWam/bLtiedtLdkgzJtPRmP1teoBTLiO
	Ixqu9WkgU8kOMLuncgx9O+b66s9JuvHMgkjvuF7CnrtAThvMfDChhdZaRhumaBObYrUKxa0dzad
	3jAcns6mzI5WOXFAsXcC+bfUbr6G9l0WoK+cnQaGg1G1Ho4pZYEH2swrmBMTz2kTUlHBCEQpTyZ
	9j2UXT7QGaNOFP+Iz3YOQ9XLkTG6cBTyhtReYIm+B6H1MuJGw/9GJKNGOe9rwHS/UeXMd1A5US2
	feavyC98dG9OLcJUcCGObMAh7UwV5avFb1QZjP15jlt5Tfa8Q==
X-Google-Smtp-Source: AGHT+IGOQhjN3zuvj92TNNMTPzXquoB0TWa2kZteaV6l+gNr8Hw96mHRbUrRh/vK+P84rnHKRxun0Q==
X-Received: by 2002:a05:6402:4410:b0:64b:622b:cd1e with SMTP id 4fb4d7f45d1cf-64b622bd022mr1183900a12.28.1766046132364;
        Thu, 18 Dec 2025 00:22:12 -0800 (PST)
Message-ID: <91bf5405-0258-4ce3-bc12-1df819317542@suse.com>
Date: Thu, 18 Dec 2025 09:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/24] xen/domctl: wrap vcpu_affinity_domctl() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-11-Penny.Zheng@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h4JosMsHk0d6GPjW1o0ahR7y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h4JosMsHk0d6GPjW1o0ahR7y
Content-Type: multipart/mixed; boundary="------------BopRlHZN12IJgUGAqXFMxcpc";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <91bf5405-0258-4ce3-bc12-1df819317542@suse.com>
Subject: Re: [PATCH v5 10/24] xen/domctl: wrap vcpu_affinity_domctl() with
 CONFIG_MGMT_HYPERCALLS
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-11-Penny.Zheng@amd.com>
In-Reply-To: <20251212040209.1970553-11-Penny.Zheng@amd.com>

--------------BopRlHZN12IJgUGAqXFMxcpc
Content-Type: multipart/mixed; boundary="------------IjFjvnQW8bcDvBldyn5FoQzd"

--------------IjFjvnQW8bcDvBldyn5FoQzd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjUgMDU6MDEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiBGdW5jdGlvbiB2Y3B1
X2FmZmluaXR5X2RvbWN0bCgpIGlzIHJlc3BvbnNpYmxlIGZvcg0KPiBYRU5fRE9NQ1RMX3tn
ZXR2Y3B1YWZmaW5pdHksc2V0dmNwdWFmZmluaXR5fSBkb21jdGwtb3AsIGFuZCBzaGFsbCBi
ZQ0KPiB3cmFwcGVkIHdpdGggQ09ORklHX01HTVRfSFlQRVJDQUxMUy4gT3RoZXJ3aXNlIGl0
IHdpbGwgYmVjb21lIHVucmVhY2hhYmxlDQo+IGNvZGVzIHdoZW4gTUdNVF9IWVBFUkNBTExT
PW4sIGFuZCBoZW5jZSB2aW9sYXRpbmcgTWlzcmEgcnVsZSAyLjEuDQo+IFRyYWNraW5nIGl0
cyBjYWxsaW5nIGNoYWluLCB2Y3B1YWZmaW5pdHlfcGFyYW1zX2ludmFsaWQoKSBhbHNvIG5l
ZWRzDQo+IHdyYXBwaW5nIHRvbw0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcg
PFBlbm55LlpoZW5nQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------IjFjvnQW8bcDvBldyn5FoQzd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IjFjvnQW8bcDvBldyn5FoQzd--

--------------BopRlHZN12IJgUGAqXFMxcpc--

--------------h4JosMsHk0d6GPjW1o0ahR7y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlDubMFAwAAAAAACgkQsN6d1ii/Ey/3
cQgAkJWOSwaT9sj2yHAnhsZ2SRRGfZxYeo3f0BfKhAx0OBd8LIJYfiMh9bcCNPZgr5vcD8PYMNjn
Khu61d1wTlGgA/FslqLRwHdWkmcI33Fu45Ew2jcqkJIwdWBLJZW6+MuFNK6O4qDDbg20DdN37Klq
YSKV+j4NKuMCxCKImK/HcKXYj+K8Vwd0QXgWQDSKP/uo/o4yw/ClYO3ixYI3tAavN4OdLQBRcLR2
wKjloYa0hYQAh3TU9G+PEUvg010D4kltZ5fRhwFPy0Uqw3xGRwFQ3dAmXBqntN0B/ZeoFznZPXuT
Ztpzl6z2E1EhNMKjoI3JOOiunc0YpawPHnY1BxuFLg==
=Nc70
-----END PGP SIGNATURE-----

--------------h4JosMsHk0d6GPjW1o0ahR7y--

