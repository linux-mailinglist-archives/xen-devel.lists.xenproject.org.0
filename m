Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3D0BD2E34
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 14:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142310.1476497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HEM-0000cR-VC; Mon, 13 Oct 2025 12:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142310.1476497; Mon, 13 Oct 2025 12:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HEM-0000b1-SX; Mon, 13 Oct 2025 12:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1142310;
 Mon, 13 Oct 2025 12:00:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v8HEL-0000au-Rq
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 12:00:45 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f99d1d2-a82c-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 14:00:44 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e4473d7f6so26331295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 05:00:44 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489accbsm207642235e9.14.2025.10.13.05.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 05:00:43 -0700 (PDT)
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
X-Inumbo-ID: 3f99d1d2-a82c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760356844; x=1760961644; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/dxqBAuMFz/4ObPFc+VeEyW8NSDE0MktALoHnbWSUek=;
        b=gxV+5ECfLp+scxMa8xkQxdNYhv3W343ORamsCdqV0uHdJmjHsyPVgyeAs5jdqJK4Pl
         j4Qi/LNaORH0JsCPWvdpMuYVoXWoMAf7n3xP9IL/yNuuMGJgFNwtnRCd4/Vhbf8z4qaM
         9U1eJYXrM7jdlkdftYqEbmLpQXKZSzCUSwxpbambIkUFfDWGb8yij8kh+Gugqsq6MfFQ
         Kl9lD7mddwZ1Yb/4oMX+MkubPPERSX5i8OKd/8qxeTw/7ZHlJZ4vYG73fvSkOlT8UJB0
         K2VIHqM4awVz2Hlk/AXf6qLAm2AFP+v1Es/gK+zWNVBHv59PE6pkDFWcSNTdsTVEp6Dt
         8Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760356844; x=1760961644;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/dxqBAuMFz/4ObPFc+VeEyW8NSDE0MktALoHnbWSUek=;
        b=uBRgFgbJvswITo3O8GP4wFbp+1vhLaWpw4+gZEN8TNoQzfkCMcWotbhcLHBcjFKoib
         kpTJ9cxSViLpKg3lZLhWQ9tolsq3YJyGKcjad4qjo5MHrG0GZNX4re6i8L1fMSvFbDcF
         RhUnOacdcdYu320OLTzAjdxXqChuRJcj6T+TeiZNOmJGt4RuFZNEazFgNFFop9AdxeS9
         73kc9QQEuF7PDh3rzAr7hGsPlQoVHW0IjoD1DlwKUmQY2pIV9OeLR6EfQcTt8kaqlGXQ
         Ky3TR4YOyRi75Hj0JL3heNa50yvkGXHoGSpDYtDpgpJgR7gGax+ZATjTf+g2xKeglHkk
         NJmA==
X-Forwarded-Encrypted: i=1; AJvYcCUaPrV9BZhcvQYUMKJy4VGqJT5RjvqzHn8lPpszyw/x9bN773FrforqqZ70DuaTjpmqqjfanL001ns=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yys6HdXtGp+wiTxK/8UTUe6tS1FMZOwNTxDm8FTRvXNvlD6fnS1
	pK4s1ILcjKPvGc8vp/VJ73PCa7GDG6hJHClwq+y4T53Md0FCbq/5yfbg0dt4W1ZT+zk=
X-Gm-Gg: ASbGnctzyox1iE8IDF3aUQqXRe5raS/S/dv1gwrxDhLovksG5NOzUrplD5DZslVF5ty
	StL+tJmU2cijM2E0zXaPquk48NEG89EwrHXDMb15TrbyTvlK78jIzXEWS1oalTFePIg7s+6g8XI
	PbGM0lRsMtVmy1D84Zh+g68FhdegbYYiy6Ri8feC4udCGdNk0MmftIYXmtUhfOBFSOq2U6IZcbK
	6JA4SWp0L6P/vW7F+xDDwGfeJGjZ3/6WDS2Iq71MNbdPqpowZ8R25WTEeEtNHnKKzyzOdxMaBjZ
	+wsRCXQYQgh9I5DbBhCfcoewHURZu7Yd2ScoN47eTJgK7PmGpZdvl2RqiiuN+6/yq9ELcmRdrgW
	8XwDIP/HJRVoqWYZtf2niN9qkqOimYgqUSoRmc2kzeSMm+rTvPOCWhV5uUKo7frIdw4elLE5luw
	FxdHcqhuAAtiFor/lVxt31BZbo40drSFGFYnkUFDHSqsugMOSqdz22HG0KrD6cmGs=
X-Google-Smtp-Source: AGHT+IGocgXogRM7akcTSK1xrQE9tVgR+Nty1WOVCqdVeCe6O8qvzxmQNwZZ3oohkfEaftJ6wP49/A==
X-Received: by 2002:a05:600c:4510:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-46fa9a8f2e1mr144516785e9.7.1760356844293;
        Mon, 13 Oct 2025 05:00:44 -0700 (PDT)
Message-ID: <cf834c9b-4c2b-4851-a2c0-5885b3cf1fda@suse.com>
Date: Mon, 13 Oct 2025 14:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/xen/xenbus: Replace deprecated strcpy in
 xenbus_transaction_end
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-hardening@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20251013115129.30304-2-thorsten.blum@linux.dev>
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
In-Reply-To: <20251013115129.30304-2-thorsten.blum@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vMnIqwKGSJE0PqZfv8VIdFz0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vMnIqwKGSJE0PqZfv8VIdFz0
Content-Type: multipart/mixed; boundary="------------1E9wWmb0SvyhzfRDWrCDwsNl";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-hardening@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <cf834c9b-4c2b-4851-a2c0-5885b3cf1fda@suse.com>
Subject: Re: [PATCH v2] drivers/xen/xenbus: Replace deprecated strcpy in
 xenbus_transaction_end
References: <20251013115129.30304-2-thorsten.blum@linux.dev>
In-Reply-To: <20251013115129.30304-2-thorsten.blum@linux.dev>

--------------1E9wWmb0SvyhzfRDWrCDwsNl
Content-Type: multipart/mixed; boundary="------------RRK0hufaSRgt4jr4TufFezF4"

--------------RRK0hufaSRgt4jr4TufFezF4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjUgMTM6NTEsIFRob3JzdGVuIEJsdW0gd3JvdGU6DQo+IHN0cmNweSgpIGlz
IGRlcHJlY2F0ZWQ7IGlubGluZSB0aGUgcmVhZC1vbmx5IHN0cmluZyBpbnN0ZWFkLiBGaXgg
dGhlDQo+IGZ1bmN0aW9uIGNvbW1lbnQgYW5kIHVzZSBib29sIGluc3RlYWQgb2YgaW50IHdo
aWxlIHdlJ3JlIGF0IGl0Lg0KPiANCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAv
bGludXgvaXNzdWVzLzg4DQo+IFNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPHRob3Jz
dGVuLmJsdW1AbGludXguZGV2Pg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------RRK0hufaSRgt4jr4TufFezF4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RRK0hufaSRgt4jr4TufFezF4--

--------------1E9wWmb0SvyhzfRDWrCDwsNl--

--------------vMnIqwKGSJE0PqZfv8VIdFz0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjs6esFAwAAAAAACgkQsN6d1ii/Ey+O
9wf9GdcUf4z3v+VEm53GypvPg2UeLJ4HA5tDBSxJ4YwSi+yZksUoxZn3cvSygw9qwfajvNldPUmQ
rtlg0lLPlqorVV9ieTri3ERw7DGytVRjh6Us/KAbV28LK68ePMzRhl33yu0wkgBgY2k7n8l9yQaW
C+YJU/VQFsqqLHPvYKkaIngNtVENbVdp37eYBbqlejnoYWlHTPmzzBXavo5nVpLfQcjX9v9GMXKF
S+a3ClBkUFP6JYMcdnv3V9cXOVHX+aEO0PPv+73AkZNr4jLRhMwHBhG3lrs6EasYK1QILG3Oo3HS
XwHUOLJp+KwZprNsNcZQp3/Zzyk4KusunKrc7dOflQ==
=rMBF
-----END PGP SIGNATURE-----

--------------vMnIqwKGSJE0PqZfv8VIdFz0--

