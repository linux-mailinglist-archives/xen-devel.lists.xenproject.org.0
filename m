Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A664FB13450
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061011.1426549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugGkd-0006jo-Om; Mon, 28 Jul 2025 05:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061011.1426549; Mon, 28 Jul 2025 05:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugGkd-0006iM-Lw; Mon, 28 Jul 2025 05:50:19 +0000
Received: by outflank-mailman (input) for mailman id 1061011;
 Mon, 28 Jul 2025 05:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugGkc-0006iG-5Q
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:50:18 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd5501d-6b76-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 07:50:16 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso202426a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 27 Jul 2025 22:50:16 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61547365e1esm525434a12.68.2025.07.27.22.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jul 2025 22:50:15 -0700 (PDT)
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
X-Inumbo-ID: bcd5501d-6b76-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753681816; x=1754286616; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yy3nZuGq8qR1AB6FgEUmLolMIC6+w8f1sZf8QwzfrJs=;
        b=De2CGwGgJhEcO/YEx/ADVZEMpo/kpIqHakxG6JDWceqP21Ry8RANXyBMyZQulYsN7J
         SRIGjUK0RQeu9m2hPKbPHuX+KvyRuKUJN9cs0EktDmFR7VQ5NKQ0GTUuO30WPueC6ibn
         qEiJFYCfsWasNlj3rdYBiQ2TvWfLRR1f4rsWG5mzsMsNbxRQ4e6W/J8rlZ0znWrNNPMl
         KjudWMs6YMh5HIsKRMGrBJFjhpEOtQsBSbXZibz1sO1R4bL7L/OMbLMDaMSz7+sS+z37
         vVBMRIShORjMVvOgRtHw7wrK4vizIP0GtnmUNtJDQaUBwJfF1H5UoM9WQ+U/kIGKGY5r
         S2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753681816; x=1754286616;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yy3nZuGq8qR1AB6FgEUmLolMIC6+w8f1sZf8QwzfrJs=;
        b=ltNPfXqDfjAMDq2jcGAhVvLWOeuObzJ/g+31ghj6uz9fvGhVL4KK0xLHGpaQ5hK748
         TcyWnOEjszejKAoWRWHDktbcfTu6GVF6cw4NhL78WQx/9O469xRy2Yq5uiF0Y+s+18FJ
         oEeMOuWYoMturHpW2JJO9o1DZtwqyNkrSkXV9doJUEH/ox5ozwoHXiGZ9nuQE/KPDekB
         wNQHtG7IWjVHlY2nHSOgS6ohkSp56QAlFk5Q7fWmY5PVix0KmxlsolxYV/dSKK2Dmpgk
         HCu1hHO1fIgbfb8BsNts4eY1FgKAmCy5erh+zWnIQyD+udsbz2knA+8kleUjGTjo9QbJ
         TUSA==
X-Forwarded-Encrypted: i=1; AJvYcCULFILIqr5waJ6/n3aOKmlUsFwPrC8A7pgk4CrkeSc0559OOLBcqGe6V3DfMNhKazGZwL7c0IAxpuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzryBTfY8nXo2qlCR/E7zjX9WzqkoXN6W7XEchuInTo9uABbgll
	dHK0KyRrQ30i1IAlsr20wi9GATPO/ahhTSlRtRT8uGqsCEoX6PKBPKOvJ7oLe79Gipw=
X-Gm-Gg: ASbGncs6jaUAj7REu8NRZNNqyRyldCJxk8aAXJgI8pIUkTecIGmsT1//wPfob+0YIq+
	GgTXmJ6+MFb4ZC33Ynhe3YnKb93Gfk8gx3W9ssO8hur2NQpI0b4dD6cWqVyD1zajwKbRBO3Pbl/
	Sb/Q4fLUe+86AUfwzCE0tGKnwubs5eBUA8xjwyJp2904kCR9jBSQSVW7yMBTCFM+8D4JUd+OPSl
	9T0m6xLsDw+olmQ9BwhcX9MII7Oy3bP8tdJNMQsOh90lWV1ZEzcjASUhtsETwD09L39yfQNygGH
	4GHz23CdXsDu9BWPHT7qz3EieYLnHXvTSzsNhTHqyGiaNMq1HBvj+i6+Akn8OAJGvWAm2mFQG3B
	rlh7YxG3HG4MwmRBAeDTXknzVhghqkpF+Qs/gQkUsad4eD5XEEwR/3xs6rWWsP1q6E8vg6rKXxm
	LIachSoRtb8CBN6lUcOasLS0HiUouXVfTiEX9mm5cDiA==
X-Google-Smtp-Source: AGHT+IFUWqf3830quVxUL8hVIjSZXSHywxeif2zmueMG2O1SuGM8/vNVbHfFW/xLAoz54tobBp4iQQ==
X-Received: by 2002:a05:6402:848:b0:612:b67d:c2ae with SMTP id 4fb4d7f45d1cf-614f1d5ec0amr10129675a12.16.1753681816068;
        Sun, 27 Jul 2025 22:50:16 -0700 (PDT)
Message-ID: <d9d19009-0597-4c5c-8214-ce6593f5330a@suse.com>
Date: Mon, 28 Jul 2025 07:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Rename xenmem_reservation_increase to
 xenmem_populate_physmap
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <d3bdb968d720db655314fd7d7c7c4bc181395cee.1753438001.git.teddy.astie@vates.tech>
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
In-Reply-To: <d3bdb968d720db655314fd7d7c7c4bc181395cee.1753438001.git.teddy.astie@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C3qkq0I3uXSbOgUuHBpQzxCY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C3qkq0I3uXSbOgUuHBpQzxCY
Content-Type: multipart/mixed; boundary="------------l22mQKsefhb5kG10sdtMw4yQ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <d9d19009-0597-4c5c-8214-ce6593f5330a@suse.com>
Subject: Re: [PATCH] xen: Rename xenmem_reservation_increase to
 xenmem_populate_physmap
References: <d3bdb968d720db655314fd7d7c7c4bc181395cee.1753438001.git.teddy.astie@vates.tech>
In-Reply-To: <d3bdb968d720db655314fd7d7c7c4bc181395cee.1753438001.git.teddy.astie@vates.tech>

--------------l22mQKsefhb5kG10sdtMw4yQ
Content-Type: multipart/mixed; boundary="------------Sj06gw5JNU09uN5grsdBQchS"

--------------Sj06gw5JNU09uN5grsdBQchS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMTI6MTIsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiB4ZW5tZW1fcmVzZXJ2
YXRpb25faW5jcmVhc2UgY3VycmVudGx5IGNhbGxzIFhFTk1FTV9wb3B1bGF0ZV9waHlzbWFw
Lg0KPiBSZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIGF2b2lkIGNvbmZ1c2lvbiB3aXRoIFhFTk1F
TV9pbmNyZWFzZV9yZXNlcnZhdGlvbi4NCg0KSG1tLCBJJ20gbm90IGNvbnZpbmNlZCB0aGlz
IGlzIGEgZ29vZCBtb3ZlLg0KDQp4ZW5tZW1fcmVzZXJ2YXRpb25faW5jcmVhc2UoKSBoYXMg
dGhlIGNvdW50ZXJwYXJ0IHhlbm1lbV9yZXNlcnZhdGlvbl9kZWNyZWFzZSgpLA0Kd2hpY2gg
c2hvdWxkbid0IGNoYW5nZSBpdHMgbmFtZS4NCg0KU28gZm9yIHRoZSBjYWxsZXIgdGhlIG5h
bWluZyBpcyBjb25zaXN0ZW50LiBJdCBpcyBqdXN0IHRoZSBpbXBsZW1lbnRhdGlvbiB3aGlj
aA0KaXMgdXNpbmcgYSBkaWZmZXJlbnQgaHlwZXJjYWxsLiBJTU8gc3VjaCBhIGRldGFpbCBz
aG91bGQgbm90IGJlIHByb3BhZ2F0ZWQgdG8NCmhpZ2hlciBsb2dpY2FsIGxldmVscy4NCg0K
DQpKdWVyZ2VuDQo=
--------------Sj06gw5JNU09uN5grsdBQchS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Sj06gw5JNU09uN5grsdBQchS--

--------------l22mQKsefhb5kG10sdtMw4yQ--

--------------C3qkq0I3uXSbOgUuHBpQzxCY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHD5cFAwAAAAAACgkQsN6d1ii/Ey/d
Xgf/QrubaF3UJhhQMTrGqMVAGJbhVQqbu3BQbSEnJqJvAll0EOv39rtgWW0Ro6FJLhwqIPjmaA3N
GxdlVe5kyhpcunu76Hp34BgIT0Ecth5O4obDhhZnIMvqny7sRnlFJXcmp/7pRANIgxOwS2HNtIvZ
y55HFBAPXzrps8fwO0/4Kc29FGsAKLzKp6N+sDxskcTRTRy1JK5LB5xJfcjfOe+z9kCCSSmuZTle
6FhjPYU6PAjLp43JL83xaI2TNug9mcIJZRe7dkeqK0rxwHz51x0DzInJxrp90hgxBltO+WbaPslS
bX+4MyXsQvovgwYIfQNu1LlWF5rsgVphFMPUEW4uqg==
=2cmz
-----END PGP SIGNATURE-----

--------------C3qkq0I3uXSbOgUuHBpQzxCY--

