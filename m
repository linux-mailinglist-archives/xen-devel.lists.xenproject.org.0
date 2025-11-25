Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5921C842F7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 10:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171785.1496807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNpB1-0007DR-0U; Tue, 25 Nov 2025 09:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171785.1496807; Tue, 25 Nov 2025 09:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNpB0-0007AJ-Tp; Tue, 25 Nov 2025 09:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1171785;
 Tue, 25 Nov 2025 09:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNpB0-0007AD-BL
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 09:17:34 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91e9f578-c9df-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 10:17:32 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64149f78c0dso7999653a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 01:17:31 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654ff3962sm1549137766b.50.2025.11.25.01.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 01:17:30 -0800 (PST)
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
X-Inumbo-ID: 91e9f578-c9df-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764062251; x=1764667051; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DblU7WUYqenNC5gbwyAe0d/156hInG31dj4Pu5n/AFs=;
        b=Vkc+zaP5YbnBWM5ywAsxSFyaOvXxrcJxe3C3XDeVnM9WMVVDJsOmTOGugjKjWLmEQN
         K8VzImXpHj2FEQy0eSH2lLmyEov2Pli9J/f57pCvEP6DZxpAiiBZXr90Ucd2QMZn8+rl
         0vCPT+NEfna8RyWJ448Fe3yO6S4HEx/RhQ65HS1IgppMGdzWEFvainrkrlk9noqtuj1t
         KQzrMfZs4idLbqcJkZDyofS/g+jzNxbZwYqmaYGlHZQwtA/DEGJ8zhtzON8D4P6nKY5N
         ht4sBQ4Ph1v51e5JEO8PrUeoSHs+uMQ+KW10cH19eqU/90ufX0+VP/bw40bUDWUPsrpq
         81oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764062251; x=1764667051;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DblU7WUYqenNC5gbwyAe0d/156hInG31dj4Pu5n/AFs=;
        b=aAa712b1qZkRQyu9hPnZOVjCkiRczUQ/QQdwTasGGTQ6AvEsya+z9baL+MGpvDhq2j
         1K/ArABuZRZumhgeesIj63nEiQ3YW90JG3GGTCb9Bq0DvX+ogRTYiZA7eS7eAOiRMDja
         lukUqv5gait0dfxbWARY0QyAiRjsTZ4+bu5UZ6uYbz8rJ5TPLFoeWyIjjJoWyVZ12+C6
         nxOzqmfK3Sl3VUeKiejW+RBLR7RHgWH7hYLT/tWRpmHHDuhF7tc33qPklwsnPmfw/pj7
         wEgdYRVK5tUP9619bq/dPbZIDBl9s+EmCkeP3lxhKqjbbwOgCQHjtBf5Wbo7yOz/RSQG
         x3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUobs6JCV6XaPdJHptY3L8nX5WvY73GpscqcEbKnNOerIQdCCWOPFp31Kjiq+hV93We0pLD+w0XCuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxBydFmdBdGV89ZaaOMZFxlJlGrgxaZkZFCAuWYNm+oXM5EkBM
	4NdBDqDhjEd568nTnDU92+7wU5ebgaPd6DgW9wlADuAHOZ73Q4lOGwtuZZUJRKUNqzE=
X-Gm-Gg: ASbGncsDtmec9fNPjnbjxZMrzVCOyZFKVahhIDSmpGWUvQ/L8ygORNFlkhrEzIxtGqL
	cLJL+u3j+EbZyOi4S4VrlkFqjxVVnqZZ6SFsomEIpdsT/f/OEd8Tz4wfDTWOF0bo9APh+/cQwYx
	Crh6uP3emZKd6GOg5NIhiPdpvltYNYd0AHN5eEAIOoFGTpiHRLArM8VrBibq486KD+3epAhlz2C
	ASvUjGGPR1tYnVNwE9YnQvSrK/w4gkHnlOiPnc3vGurrNp4e7bw6loWVVPw95j/uPDI8HBF67SJ
	LxWPR4tz/prnd5MvzIC2meoetVvyjart/7dAYiPVTxwa/KRiRO7WmVbKC5k8OViQ3Jsts7dUXUG
	mPcUmm+7MdU5OWgvqbzluPfEplZfezcPZIOjV8OpaDHmFXAa4kbih0LcCO+0KAbj24gaMvrj/Yb
	hVPTbPh0ojHke3LnayIMRi+8Mue4Al+Wh5uHpD9UeQz9y1UKMeMLzoh9qGt+yQZS7QAeMgk2x6s
	f0aClKCLwgSWMJoBqs0idOrNNLa/hJwsY65oPU=
X-Google-Smtp-Source: AGHT+IFyZZll8ZH/X/RHYVs7ZZtmUyQVueTHDs2Ri/wN+lzTNJv7gm1MLFAYD1MIYm+MVMJ5iPtiUA==
X-Received: by 2002:a17:907:9484:b0:b70:7e10:4f4b with SMTP id a640c23a62f3a-b76715abd4cmr1596027366b.18.1764062250586;
        Tue, 25 Nov 2025 01:17:30 -0800 (PST)
Message-ID: <04c3cb47-0903-4043-bb5f-2b7c94283abe@suse.com>
Date: Tue, 25 Nov 2025 10:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xenbus: Rename helpers to freeze/thaw/restore
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-3-jason.andryuk@amd.com>
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
In-Reply-To: <20251119224731.61497-3-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------57IcpzrsqfbZ54h5MuD8p7nZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------57IcpzrsqfbZ54h5MuD8p7nZ
Content-Type: multipart/mixed; boundary="------------Hd0k0oqX4TC4GyjIjl9m3xYH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <04c3cb47-0903-4043-bb5f-2b7c94283abe@suse.com>
Subject: Re: [PATCH 2/2] xenbus: Rename helpers to freeze/thaw/restore
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-3-jason.andryuk@amd.com>
In-Reply-To: <20251119224731.61497-3-jason.andryuk@amd.com>

--------------Hd0k0oqX4TC4GyjIjl9m3xYH
Content-Type: multipart/mixed; boundary="------------rzRzCmwEt0GHPJavvVtuKEEF"

--------------rzRzCmwEt0GHPJavvVtuKEEF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjUgMjM6NDcsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFJlbmFtZSB0aGUg
eGVuYnVzIGhlbHBlcnMgY2FsbGVkIGZyb20gdGhlIC5mcmVlemUsIC50aGF3LCBhbmQgLnJl
c3RvcmUNCj4gcG0gb3BzIHRvIGhhdmUgbWF0Y2hpbmcgbmFtZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoNClJldmll
d2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K

--------------rzRzCmwEt0GHPJavvVtuKEEF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rzRzCmwEt0GHPJavvVtuKEEF--

--------------Hd0k0oqX4TC4GyjIjl9m3xYH--

--------------57IcpzrsqfbZ54h5MuD8p7nZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkldCkFAwAAAAAACgkQsN6d1ii/Ey9O
nwgAmv4zMMgavDmtuWcAANSAl/hNg2v5osqb8brPVqRk8H8kUBLqncJN1RMUm0UApuhhO+FQA/0N
LZAb4GqgNAFFAPw6V9heb7O0divlnSwcoEShyAXbs7YX3xgCo2yD5jw6RjXXTzYMgJX7IpcznJ1g
BiSFI/kKAbNRMpwBWUnAotZ61nZA+QDGZLuwoUpMsSrM7cZGmcqQFsvXOsBmDLjG1dDphxpuOpQm
qxED01uhcmJ257Xn4RmzH4xnOj6mIKXkfuC7ibKw1JiBLc1gAO/MZVV8+98U1Aylh4DTWwNsn/wi
meFiMMlpLjG0G1sN8OA1wbh7zxiccbFPJxP9qy6ywg==
=SeVn
-----END PGP SIGNATURE-----

--------------57IcpzrsqfbZ54h5MuD8p7nZ--

