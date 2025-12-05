Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01ACA788D
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178889.1502566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUfL-0002Rj-Sn; Fri, 05 Dec 2025 12:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178889.1502566; Fri, 05 Dec 2025 12:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUfL-0002Pe-QB; Fri, 05 Dec 2025 12:12:03 +0000
Received: by outflank-mailman (input) for mailman id 1178889;
 Fri, 05 Dec 2025 12:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vRUfJ-0002PY-S5
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:12:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a3894f0-d1d3-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 13:12:00 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so23162965e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 04:12:00 -0800 (PST)
Received: from ?IPV6:2003:e5:8721:bb00:9139:4e25:a543:997?
 (p200300e58721bb0091394e25a5430997.dip0.t-ipconnect.de.
 [2003:e5:8721:bb00:9139:4e25:a543:997])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792afd3b31sm82489555e9.0.2025.12.05.04.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 04:11:59 -0800 (PST)
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
X-Inumbo-ID: 9a3894f0-d1d3-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764936720; x=1765541520; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l466TeRE3JDujUVCUiJTo233ZhMxU+QEINR4U1qwOwU=;
        b=QPKs9e5zjVlIhm4yaQHKru0QEotN3QnX1qrTa6+s+v4DK53FK8shhdVu8SzovlLokY
         0y8C1oqXQkHHTlsghT6Fd8Uv61YvD6fYJ93RhpFQXZLYOLDNXLv0L554dmdBR8R+WmlF
         9bjJwfmI/QyVxinvWG8TP9neLLIcVg5XNdSG9w+XnaKMQxYyQv9z3yy8c30xcFPLwdsk
         DLkd3jCZgYDOpmYjyAGBxNbSMthOmEXdWsf/xuhe3LXTqZq1h+hhXtdVKsVx1l605lzt
         5mlh+e03ook8zD3KK85utrraKRgGUtpozW7ssq4Vjfe5hcJg6bcQtS/ZiFbfIhg7VdAZ
         OAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936720; x=1765541520;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l466TeRE3JDujUVCUiJTo233ZhMxU+QEINR4U1qwOwU=;
        b=rJ4XAaVG7geNz7Zceb2X4wk2LO/5n8b3uM2udaApzJqnoq2fBJRVLdOdL7dLV3D6TP
         FfAC/gAxW0s6mjxkG2QYoC+6akvpRjC40LisklZMpBYdt4oTmu0LRdR4TfNePguYd27d
         m2hQP4n0pMx31HtG3iKreCy5F/1wXhNmtLVL/GOUzTwpVRExMRiTazTxmjBQrmaf99oJ
         czHhwO1FriV0aNMDKBpMP4Z+vaL0k0uVHdU5uCmwbbDvlg8uM1M54qw4rOF3IOcCOzjX
         5mrWlYznZo3jOENTpByivyCUixQyCn9J87VuO13K3UeXUkLqeN8OFYXdHHdCjCE+dakX
         VjVg==
X-Forwarded-Encrypted: i=1; AJvYcCWup4LZUdQlW7JrH3cY+SBLC9hwqzmJsqfL2uA11TWneJ1fw+zKBmJW6VE9OFjvhICm0TuWThq+AbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykkV8EpEVyhQuWFZKwyUOwZNh3ZykNJCmoaf46q3DrS8JUWKW8
	hKQjQifdRrOPSXhJuLfvGbOyCqw8yswqy90vmGvmgGPE8UHWOK1HC3s91F+Gc5uJmN0=
X-Gm-Gg: ASbGncukMUoZ9lUuKzqaBQIrmM+CtXT3nhCL4OSRq43dk/IXaYpAAxqJOqfXdjrSFOX
	IdnD7MJJYeqGc2D8bSJIP75Z3h20BgrJgRyPHfHNzzKyFkNVps+EEY38awfdUx4T/uPaIJlOkdS
	oehHm9hQnjoryPJSbKrbaXgpo6AWeMbC0xTSpptCkrEIU+EMm2sahny/HD4KbBLsNbs07T93glu
	cmuUR9ut2dm8/nDKiJOYP1wOjri6aI+aY42UV30/PyIGewndlgm13sZohTihiPAQ6B+KC6w4rTu
	ifCeTB9boAwJDeOABxTocIpFWLJ0eOzXLMEwyJFjQis/EevDgZIAbLEwG5ACN5WMntIdpse2m73
	Nrt4+lelA16sLGIZt8Mss1J7chYxK3y4x+xyxIDRtHwqNlGWXe4xaJd1epb3ddrI32GSWLwSP+b
	7vhTJ3UbSBy0jCpg277Y6aonsyUi7o2XnQVxMKCixfdSAnfotmCC6UbippbSXXxiIU8DheOYcTt
	YiMIQto4GwMcr9lK7lL6i5LGndz9fiiaut7I3+V5A7P0i0=
X-Google-Smtp-Source: AGHT+IErXnWBV5r/bFog1snaLf1gmdNCwTK5LcBHzQYz7SnvUX7U+xF3zvcJLW47pt9Jl75nClYioQ==
X-Received: by 2002:a05:600c:4693:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-4792aee38c7mr95341615e9.11.1764936720159;
        Fri, 05 Dec 2025 04:12:00 -0800 (PST)
Message-ID: <4172f899-cd7a-4181-8da4-34bcd982437a@suse.com>
Date: Fri, 5 Dec 2025 13:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/hypfs: Enclose HYPFS_DIR_INIT var parameter in
 parentheses
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20251205115000.49568-1-michal.orzel@amd.com>
 <20251205115000.49568-4-michal.orzel@amd.com>
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
In-Reply-To: <20251205115000.49568-4-michal.orzel@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------35Bv0t5zgSZgrkJ0kFmaxn52"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------35Bv0t5zgSZgrkJ0kFmaxn52
Content-Type: multipart/mixed; boundary="------------TtWWuSmaPmga00UJ3eWlvO5H";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Message-ID: <4172f899-cd7a-4181-8da4-34bcd982437a@suse.com>
Subject: Re: [PATCH 3/3] xen/hypfs: Enclose HYPFS_DIR_INIT var parameter in
 parentheses
References: <20251205115000.49568-1-michal.orzel@amd.com>
 <20251205115000.49568-4-michal.orzel@amd.com>
In-Reply-To: <20251205115000.49568-4-michal.orzel@amd.com>

--------------TtWWuSmaPmga00UJ3eWlvO5H
Content-Type: multipart/mixed; boundary="------------iBlelGyqAynXCU03sd3POwmE"

--------------iBlelGyqAynXCU03sd3POwmE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTIuMjUgMTI6NTAsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4gVGhlIHZhciBwYXJh
bWV0ZXIgaXMgbGF0ZXIgb24gZXhwYW5kZWQgYW5kIHJlZmVyZW5jZWQgYnkgTElTVF9IRUFE
X0lOSVQNCj4gYW5kIHNoYWxsIGJlIGVuY2xvc2VkIGluIHBhcmVudGhlc2VzLiBUaGlzIHJl
c29sdmVzIE1JU1JBIEMgUjIwLjcNCj4gdmlvbGF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------iBlelGyqAynXCU03sd3POwmE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------iBlelGyqAynXCU03sd3POwmE--

--------------TtWWuSmaPmga00UJ3eWlvO5H--

--------------35Bv0t5zgSZgrkJ0kFmaxn52
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkyzA8FAwAAAAAACgkQsN6d1ii/Ey9W
Igf+PebJhst5ELox4l7yw8Iviw9qDTvVOstS7QONB36MBte2da9MWqAcEUKc4NYtCyvgtj+dMTEm
iCX1G/ID+sJC2cix6I8nWLLU+hWOYhq1Rvvckr4uf1BfS1IvxQ6hzbjqsd//O4GUG5UBnZuD4aJy
g8kVMCUtrqWpGQykuO6EU9y6BGL6/H6hyGe98GkLxQ2oljN7IDNAxGJcRY0YC9uv9VH35XJxC1pQ
7vg9B6RB37wEjrRUy23HbDLv1MJm3pV0ehzfv13FJlpk7E6liYG5njMqacr0Wg0NrVYb38LICj0N
d7fu0g9DrNbvmV6InLpqofM7MNeu2YdKkKPv8thTGw==
=rPUH
-----END PGP SIGNATURE-----

--------------35Bv0t5zgSZgrkJ0kFmaxn52--

