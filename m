Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF5D1CA89
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 07:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202488.1518030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfuHa-0004fB-EP; Wed, 14 Jan 2026 06:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202488.1518030; Wed, 14 Jan 2026 06:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfuHa-0004cC-Ao; Wed, 14 Jan 2026 06:23:06 +0000
Received: by outflank-mailman (input) for mailman id 1202488;
 Wed, 14 Jan 2026 06:23:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J70X=7T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vfuHY-0004c6-Nb
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 06:23:04 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79e2705a-f111-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 07:23:02 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b872f1c31f1so330347766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 22:23:01 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8?
 (2a00-12d0-af5b-2f01-96c4-9745-9e8c-b1e8.ip.tng.de.
 [2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b876e9ac655sm11050666b.6.2026.01.13.22.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 22:22:59 -0800 (PST)
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
X-Inumbo-ID: 79e2705a-f111-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768371780; x=1768976580; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zgKiXIITRssYELTSQGgiSfajJrINKY+aywKjeRICw+M=;
        b=bY3+n4cHIygVZXvyQUHWBgh75gEJkkEMSn0B3GsbXH8riNUpmtR3S0/gQnWXhWQBJZ
         pHEcslFv4Ny+EFDaRY6rjiihziQDGDvkByeNTJA9VeuVclVu/HXuemZ6JfaSOnY+EFKP
         XgkOlxsIsGEX1GfopHs+kRL4wRP5yRM+BKtwQG/7eEBlilKjYpFcIDCZ4RrsyIMwtJao
         6D0LIcFgMsHTv+FI2Lk/zaVHo0g4/HdtXOciFrwT3tji9gfO90CNTk4UzAVfcqQPqz8M
         euBljnoX4uzRWTH7LAC07sf1lepb9AHpf9QvB0aAIfe73r8ZKY/b+/sY2oRfNBu9vJDB
         vz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768371780; x=1768976580;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgKiXIITRssYELTSQGgiSfajJrINKY+aywKjeRICw+M=;
        b=dRQJzufa8Bk1TsH6XeLrt0Fr9tFUydoqQIZRpDKzIqNparqNf27xEpIlBgQXxC+sBw
         rtLiYmMSQAyrznl/8qITYuorJ/4YFIICbScV7Pc8ntD1lLsvSBbAM2P4daXp5fNMzh7E
         F3jlozh6x3vO5dRAyX1vIIVMZUF3+v2Iv3CZjMbH5bjvV9hy9xTJWLuXT6jEwnOg1Yk7
         yV6cjvUTL9jm20EvXoMAcxishFHVEglWnUqdLDhztISavlkqsr2T7jMD9IvwakVDbLgD
         rnGQsl8Xbfx1CYaZW6XUohOrOQHLVauCzjvz6s/VNY1muhq7VDkXKFEcc6qM1fnRw8YE
         Rb0A==
X-Forwarded-Encrypted: i=1; AJvYcCW6uU0rinu0wd2JUm7lvUu2fntsoyNQR8g9zNyRpcxCZrOqKabCyAuKcZqE3f4iNMCPLhoIYeH4lFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5mCpEdg00HP8C3DInr8jVjWQQ+/b9Mko/6+pRVDJP4UhilG+I
	uRLDM3WicN/XxXd8Yf0y5MikRoWfEwaMSjRhk11+AuJyeQVXfLXEul4r8LPpIyS5xug=
X-Gm-Gg: AY/fxX6oLJhbfSt1taCnjD8b7smWKsuhcVUWo6EfNduhb5zXZNsyIScgRq5AzBLQwvx
	JglbNAWyxor8kfeb/1HamYwdEksDmDodP6YxSTWSf8HI7GNtum9CpgH9mj5TZqJICXTJp6JbBhx
	JeUPRsrg0JPgBTpVoUen4p/TNliHUIp74EdBHQ581fMhw43g0qnKk9ylJdx9o0KHeBsJ0uZH4tC
	ogPRfKBk8OTPsxpv1IrF3s+7bS93uPSscdMP7yfRsuOo6yn+/E/gocd2Ev1PB7WAm7Cwj538nQy
	6hKQfBNm2aEVhRWBhzNwJguyRcG6xz25S/SMENNjDj7efdAMiWw8ZF5jyPmfugvJOvtOa/cvKbL
	uVTID0MFCmxeY55vNdkQGhBpxRO4PAFyeRLelhOvn083GwVbAoXKea+YNq/9b8G77UGzhK4j6fb
	WPmAecQTae0DTxIzQ3NF4QUWzCoghEgtwSeFpX0gF+kJpDBxq+EeCDXd+0spg2uka8pVqXvklJu
	+2s5ZRE9VrdxYCZ8zd+02Oj37/owajXFcfrfR4=
X-Received: by 2002:a17:906:d54f:b0:b86:ecb2:f4da with SMTP id a640c23a62f3a-b8760fe2186mr133209566b.21.1768371780423;
        Tue, 13 Jan 2026 22:23:00 -0800 (PST)
Message-ID: <9c9a8c75-57c3-48a6-b781-0aef368453a2@suse.com>
Date: Wed, 14 Jan 2026 07:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: introduce xen_console_io option
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com
References: <alpine.DEB.2.22.394.2601131522540.992863@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601131522540.992863@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BxzB6l1rEtd0e0hY5JiqLh0R"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BxzB6l1rEtd0e0hY5JiqLh0R
Content-Type: multipart/mixed; boundary="------------X9iQhCeMHKAVpO0nvmfbZsjS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com
Message-ID: <9c9a8c75-57c3-48a6-b781-0aef368453a2@suse.com>
Subject: Re: [PATCH v3] xen: introduce xen_console_io option
References: <alpine.DEB.2.22.394.2601131522540.992863@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2601131522540.992863@ubuntu-linux-20-04-desktop>

--------------X9iQhCeMHKAVpO0nvmfbZsjS
Content-Type: multipart/mixed; boundary="------------tS2qcCSBNLROX0WXnD5RQhvm"

--------------tS2qcCSBNLROX0WXnD5RQhvm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDEuMjYgMDA6MjQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gWGVuIGNh
biBzdXBwb3J0IGNvbnNvbGVfaW8gaHlwZXJjYWxscyBmb3IgYW55IGRvbWFpbnMsIG5vdCBq
dXN0IGRvbTAsDQo+IGRlcGVuZGluZyBvbiBERUJVRyBhbmQgWFNNIHBvbGljaWVzLiBUaGVz
ZSBoeXBlcmNhbGxzIGNhbiBiZSB2ZXJ5IHVzZWZ1bA0KPiBmb3IgZGV2ZWxvcG1lbnQgYW5k
IGRlYnVnZ2luZy4NCj4gDQo+IEludHJvZHVjZSBhIGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0
aW9uIHhlbl9jb25zb2xlX2lvIHRvIGVuYWJsZSB0aGUNCj4gdXNhZ2Ugb2YgY29uc29sZV9p
byBoeXBlcmNhbGxzIGZvciBhbnkgZG9tYWluIHVwb24gcmVxdWVzdC4gV2hlbg0KPiB4ZW5f
Y29uc29sZV9pbyBpcyBub3Qgc3BlY2lmaWVkLCB0aGUgY3VycmVudCBiZWhhdmlvciBpcyBy
ZXRhaW5lZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------tS2qcCSBNLROX0WXnD5RQhvm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tS2qcCSBNLROX0WXnD5RQhvm--

--------------X9iQhCeMHKAVpO0nvmfbZsjS--

--------------BxzB6l1rEtd0e0hY5JiqLh0R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlnNkMFAwAAAAAACgkQsN6d1ii/Ey8k
hggAnLRObFgpjg+ppDbbjs69CoCSQhp+mLcRF7ropjxnDRLmFD2QTrMFyJQJzPKUUyzfof7PqTSf
F1++Uwx7tvX+de68mW25YGe2IaZqYTCCAiZY5dSplSI7VI46xqxNk4uYNqCqxiuP8ZiMYQeYRyiX
Q03nX3PV+Qf2l2ZdfHVmQjk6rC36GhEfbU+EeWrIHvgBZI3Oi9OvusGoIcfvxD0wvqpInnDulzG6
3CLp4sQuyIrC988jdoud2CubPHLy4R0V++zVX2aVtl8cCK3lAUz7czHM5Nqa4XwdIBgADZlOoc6C
bA6+c1O93AgARn1r8d6OQ7wt0+qj7OYpz1yNKAvWDw==
=tuxk
-----END PGP SIGNATURE-----

--------------BxzB6l1rEtd0e0hY5JiqLh0R--

