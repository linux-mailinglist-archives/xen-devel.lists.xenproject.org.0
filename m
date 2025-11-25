Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1AAC83B29
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 08:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171712.1496721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNnMw-0003Cx-Hz; Tue, 25 Nov 2025 07:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171712.1496721; Tue, 25 Nov 2025 07:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNnMw-00039y-Ec; Tue, 25 Nov 2025 07:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1171712;
 Tue, 25 Nov 2025 07:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNnMu-0002hW-OU
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 07:21:44 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64646632-c9cf-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 08:21:42 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-644fcafdce9so7954335a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 23:21:42 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-645363ac97esm14657410a12.1.2025.11.24.23.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 23:21:42 -0800 (PST)
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
X-Inumbo-ID: 64646632-c9cf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764055302; x=1764660102; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tKwQtvo2kA6pbhi0moD2oEZCzg5OE0GMyGB3VW/p8HI=;
        b=ajdti5SOCona12kvfyAcNA9L4BJzQFy4itvzjncmyaiBLGlCRXrv4nt6OT1fbs/bA3
         1cSSmi+Z8AUoLAfi4BxjprT/nGhBX3CfSCLtYVCK80U49ezYrMbN0aLQUmDPXk6zBwxv
         urE3h+9rhWSxPL054Gy+EvkjHV+NU+NfSBaHYrUvijX/RpETmJKKauCzkESoP0CuBQhe
         daY26S2diS+xaZSvsvxfT0uTrBB7Zk9x3A3EoXhZvd5GUBh702QGiJ0OZ0KgGuo5nUaV
         zX31fQw8/X618kA3Eawf6Uh9VYkDM9gvI2R1LBhGMUW0PmOW1GnUChbXwUhEVNytXeg2
         fOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764055302; x=1764660102;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKwQtvo2kA6pbhi0moD2oEZCzg5OE0GMyGB3VW/p8HI=;
        b=c7T6p7qehSDqI8mA0HbmLfmRrrTttYc2wgrGRgaYqssOswUqAHoVISZ8EsiQf4TkaV
         f2IzmUtC8XyCjm2+pYoaQpsnJt9rm8be3cWEf+Hu+T6QNvfJYAmCFzAMuvXXZR+6cW9E
         edIefO/dkD1z204qg9afnfsrFGqle0xSuUFS30V0Lfq6Sayj97YD3bsw+pAjNxhYLOda
         D++9n5c0qA37jtKXyofT2ba8wvlo3SaraWCvOetewZmKN8p8mkd4MYyU/t2jJ/8BG3Op
         7YG82g1ZgvlBtEonnsiQqq7KcQiXqTm42yKb01tyRIAugttxSfK6Y8huOTvfgOFj6Xni
         oa0A==
X-Forwarded-Encrypted: i=1; AJvYcCUe2leSbRxMsRLZC+W+HJMGpuPsqZ9lRBJPDpGL1cHXf/qTmgaJ/mBqXeFPhuRkj/qwIcqtTDFEEJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7JzP+VZvpky15WBVR87XjDVwC+aVyDFmUAgqG8pRJyPDw03if
	4YcjdmGo1HFtznl0Ifwx7YQPKnyGdG10vCFSmm+7WXymuIWA4JSM9R88HzZBjqaoWac=
X-Gm-Gg: ASbGncuSzzFXvuVTfjiP4le3NCjnUndq9cPPiAZdUYMxR+1Iw9qqLEzHJ6pw5iI51Bs
	+P47uXeN8VoKlX/NDXxxDTsHrxS2dnf7sKAyKb9gzMTcDqI4yUQEW0LQjfEV+uuJ0GPI1Q1FBoj
	AF5j5MyB0fnH4YH/yP4vXphKa9ju4hIXX5WFIwPi/fLGyjgz7+1atk8Z9nbkvNRS4X9BZjIL+tH
	l7wPiDlkgofis2rEKeIqKUemFIfJlbYjc23FlAQU+FjI1aeINGdmTnG4VgjVRpwnssg0BaLSmjC
	5apqWlAwClw6SBxK8hgZQQJ5WQQ5fmgUS2ujSRPYSVt7LrgNAXVevFxYp+45+KfSmSMyjBamlzY
	V8oSxd54yBrcKaF+whrtDB9Oh0vFkBshTvvf7yEnfR+v4tHcp/gzY2jMtjF1Sdn6rJBVRi/p1ZA
	rfXai6oxwD7XrLB3Ux7s/aTtxWoZWDbCybFB1z5DcRkOn+tlWIAw8mM8JBVDi8fnPuLiCKTIQJ5
	jBUGlCrDTzx6+nLm1bR3Cj4sp/kSOBoTpsxxcw=
X-Google-Smtp-Source: AGHT+IHOcI96gJFABqTRFiEbJaP+UMBk7KLITLOl5+OPFPBDzwY7O2c4CAaVQSRnuBMtqr+NbwpIYQ==
X-Received: by 2002:a05:6402:35c3:b0:643:804a:fb63 with SMTP id 4fb4d7f45d1cf-645eb25737cmr1418104a12.9.1764055302362;
        Mon, 24 Nov 2025 23:21:42 -0800 (PST)
Message-ID: <28827046-6a07-49b4-be4c-a23a71129179@suse.com>
Date: Tue, 25 Nov 2025 08:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/2] xenstored: Add newline to error message
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20251124223533.31613-1-jason.andryuk@amd.com>
 <20251124223533.31613-3-jason.andryuk@amd.com>
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
In-Reply-To: <20251124223533.31613-3-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gWAcAHNBl1HoaFEkzaa1iZh7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gWAcAHNBl1HoaFEkzaa1iZh7
Content-Type: multipart/mixed; boundary="------------SBrAvkBlVK9pGnxnN0Mzoqjw";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <28827046-6a07-49b4-be4c-a23a71129179@suse.com>
Subject: Re: [XEN][PATCH 2/2] xenstored: Add newline to error message
References: <20251124223533.31613-1-jason.andryuk@amd.com>
 <20251124223533.31613-3-jason.andryuk@amd.com>
In-Reply-To: <20251124223533.31613-3-jason.andryuk@amd.com>

--------------SBrAvkBlVK9pGnxnN0Mzoqjw
Content-Type: multipart/mixed; boundary="------------5J0gBt0fcU2WQtFdgZE62v30"

--------------5J0gBt0fcU2WQtFdgZE62v30
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjUgMjM6MzUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFVubGlrZSBiYXJm
KCksIHhwcmludGYoKSBkb2VzIG5vdCBhZGQgYSBuZXdsaW5lLiAgQWRkIG9uZS4NCj4gDQo+
IEZpeGVzOiBlNWIwYTk0MDU1NzEgKCJ0b29scy94ZW5zdG9yZWQ6IEF1dG8taW50cm9kdWNl
IGRvbWFpbnMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRy
eXVrQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------5J0gBt0fcU2WQtFdgZE62v30
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------5J0gBt0fcU2WQtFdgZE62v30--

--------------SBrAvkBlVK9pGnxnN0Mzoqjw--

--------------gWAcAHNBl1HoaFEkzaa1iZh7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmklWQUFAwAAAAAACgkQsN6d1ii/Ey8h
lgf8Coq6LUJYk9G3M0KzhvIsxEFhQ9qknLxdnj+2gfU2DJwYmNDfRu0Qh5y1jnizmFI1JIv9TE4m
C/hJAzdGGV0KQTRhOOyfPF6GvOfkXPFCJgCTdt0U2D7SlHRp0HA49FnFt6B0IhsKhX12d1U31QMB
9C1v5Ia3BmU5FsW5oKNjg2xyvObWFCJLPq86GE7e0ymK/7tkzNlik1kCIPyWbHnwrpRV5wxkkFbn
/5p/bJT0y9TyAAvAH/+wslqKYjW9FlzFtB/0aothmzs1X/6cnuVGPKmGXdmuWkOPb71cEMBkI0c9
i1ObKh6OaG7BfXLaiwd1dqqLkjRgOhuBvajV3MbrDw==
=6Rk1
-----END PGP SIGNATURE-----

--------------gWAcAHNBl1HoaFEkzaa1iZh7--

