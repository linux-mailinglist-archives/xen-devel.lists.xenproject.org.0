Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A267AB8503
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 13:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985265.1371190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFWq3-00068v-Uk; Thu, 15 May 2025 11:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985265.1371190; Thu, 15 May 2025 11:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFWq3-00066L-Rg; Thu, 15 May 2025 11:33:23 +0000
Received: by outflank-mailman (input) for mailman id 985265;
 Thu, 15 May 2025 11:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PE/n=X7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uFWq2-00066F-9v
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 11:33:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6776e12a-3180-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 13:33:21 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso130919866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 04:33:21 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197463e2sm1104637266b.108.2025.05.15.04.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 04:33:20 -0700 (PDT)
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
X-Inumbo-ID: 6776e12a-3180-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747308800; x=1747913600; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/uPC8op9eqfgshTJO3VMTtIZaMAGH6UK0WN0vRIaoxw=;
        b=TprzGvc2S+n8A17ALwg6VpoEK4eAzo5ZzvaVVTuixYTrtJtpmpSbfXYneqWi7znEaW
         UgQuvKsK6IzrUTpvV+qYsZjjLYmgpa2tWpwI09kPNVITqOtXH4ulTV4TZRR2TAf9YsY4
         N+4wHTavuYgigvlZoRR/xoYSin9AoW2W+e2gMFVTm+DbK8nSvk0PDHDm+WVLc8SLWZo/
         uyzn5zVxFlu0h41tkLAgn2pFT76h5971Dul1cEPj340lTubTNg61bn1wCvhrXfitidY9
         MM3PC6scZYQuF/WJZZP+Lgfy8dL4p0ihKEfQOkZj9YPD66W15im+u74UGcBCtY6i41HP
         LrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308800; x=1747913600;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/uPC8op9eqfgshTJO3VMTtIZaMAGH6UK0WN0vRIaoxw=;
        b=pm8XBpjBVj0YQa4cZYJZotN7vny0kmCscHxUax/7sa7BO6FEceQOuvNXYuXiMiMaV0
         0RQBU0HHIS7BogFOdsNuOoWvfaioj39wjaLf3Kcei7aYocgXVZdF+1HyOyvmtwFrcsRZ
         +mxog/6NLIlmwFa6PwS1LeM7Zf3aJZ6eY40vZ4S33qLY2jN22NEwnKh3tlTl37VsWjvV
         ufvDHvmTvDVWSeG21pUWGqXarkq3IIr/X+HO+s4u4F2LPCYJktYgljXU6l1FUDMOnsq7
         f7I+GOyWtjttPE8tPjUomZ/oNHRru08qkmipV4FkkeXXjznLRY8YK6Mx2YBtwyS0scJP
         wp8w==
X-Forwarded-Encrypted: i=1; AJvYcCX5GwPNzYxy93ISNVceXh8YX/ORvkAgIWheV9ZiYbODgx80VN5WcGY2Ww+S8urRg5bqhbOXEhgU2Cc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHDK+4N3BGqUcUranJblk7zRA3u98FF+YDRp8KCdjmHYIUbttt
	1rNYp1vfuHKOp5Snx72X1lwc0+fug0fkEKaBHiSEH9x7ptHRC8JT8Vjo+fXH490=
X-Gm-Gg: ASbGncsN5pUx36AxGVFFvG85zbypywHMqv0rLP0JwsoN+eF0FaGlYmCg0GSBSel0rgb
	9D3sYHanX7YVEYZ4OtK4kYkS1RBFI0S2ODlQkR2yUlgO5n/KjUn7HcJMUGQ8+ZVbyR4pY6KBr/j
	/w4sDzZ4SHaKtBQrEojqzxgd4caGfUSuvYz4f9sTdEpuBjZ735hc2GzcJBmLbVfkepCVdTIjbrM
	CkqW+vYBCtH27AJ7NPEWb5C2s0sj2YCnxMjU8WRKmhTHBVQPsuT/72xO8rrHavVZB0pxt39F59h
	FXu/99vRySYOCYzSUOhV/V69Iu8NH4a7ybTkR4TgyhDjQLnzHIovENJKQQQWuavBdMN4HQUHsPG
	mQ5s+cl1Y+UgpeMBQhPlghmWAAgOB1An83XrDaW2yyED+mIXq/45WDj81lE13TVodMx07YZmDTE
	MH
X-Google-Smtp-Source: AGHT+IHlGVedvpqU0DF0OZhYlDd8LjUzHMxDqxeKfjY7SYS5goDcj5zWvFEkZaJCi2ymr6WdWH6jRA==
X-Received: by 2002:a17:907:60cc:b0:ad4:d069:324b with SMTP id a640c23a62f3a-ad4f70fba45mr731369166b.10.1747308800472;
        Thu, 15 May 2025 04:33:20 -0700 (PDT)
Message-ID: <212b2be3-5841-4e7f-84d7-4b3653054481@suse.com>
Date: Thu, 15 May 2025 13:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2dPoy037AoV5uWm6Nw8JM3Na"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2dPoy037AoV5uWm6Nw8JM3Na
Content-Type: multipart/mixed; boundary="------------y5MlRn3dT02iY3thmAEmeFaC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
Message-ID: <212b2be3-5841-4e7f-84d7-4b3653054481@suse.com>
Subject: Re: [PATCH] xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
References: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>

--------------y5MlRn3dT02iY3thmAEmeFaC
Content-Type: multipart/mixed; boundary="------------k87NbxI1LBnN02LDBuwpuKIA"

--------------k87NbxI1LBnN02LDBuwpuKIA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDUuMjUgMjM6NTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJvbTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gDQo+
IGRtX29wIGh5cGVyY2FsbHMgbWlnaHQgY29tZSBmcm9tIHVzZXJzcGFjZSBhbmQgcGFzcyBt
ZW1vcnkgYWRkcmVzc2VzIGFzDQo+IHBhcmFtZXRlcnMuIFRoZSBtZW1vcnkgYWRkcmVzc2Vz
IHR5cGljYWxseSBjb3JyZXNwb25kIHRvIGJ1ZmZlcnMNCj4gYWxsb2NhdGVkIGluIHVzZXJz
cGFjZSB0byBob2xkIGV4dHJhIGh5cGVyY2FsbCBwYXJhbWV0ZXJzLg0KPiANCj4gT24gQVJN
LCB3aGVuIENPTkZJR19BUk02NF9TV19UVEJSMF9QQU4gaXMgZW5hYmxlZCwgdGhleSBtaWdo
dCBub3QgYmUNCj4gYWNjZXNzaWJsZSBieSBYZW4sIGFzIGEgcmVzdWx0IGlvcmVxIGh5cGVy
Y2FsbHMgbWlnaHQgZmFpbC4gU2VlIHRoZQ0KPiBleGlzdGluZyBjb21tZW50IGluIGFyY2gv
YXJtNjQveGVuL2h5cGVyY2FsbC5TIHJlZ2FyZGluZyBwcml2Y21kX2NhbGwNCj4gZm9yIHJl
ZmVyZW5jZS4NCj4gDQo+IEZvciBwcml2Y21kX2NhbGwsIExpbnV4IGNhbGxzIHVhY2Nlc3Nf
dHRicjBfZW5hYmxlIGJlZm9yZSBpc3N1aW5nIHRoZQ0KPiBoeXBlcmNhbGwgdGhhbmtzIHRv
IGNvbW1pdCA5Y2YwOWQ2OGI4OWEuIFdlIG5lZWQgdG8gZG8gdGhlIHNhbWUgZm9yDQo+IGRt
X29wLiBUaGlzIHJlc29sdmVzIHRoZSBwcm9ibGVtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gRml4
ZXM6IDljZjA5ZDY4Yjg5YSAoImFybTY0OiB4ZW46IEVuYWJsZSB1c2VyIGFjY2VzcyBiZWZv
cmUgYSBwcml2Y21kDQo+IGh2YyBjYWxsIikNCj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnDQoN
CkknbSBub3QgYW4gQXJtIHNwZWNpYWxpc3QsIGJ1dCBsb29raW5nIGF0IHRoZSBzdXJyb3Vu
ZGluZyBjb2RlIHRoaXMNCnNlZW1zIHRvIGJlIGNvcnJlY3QuDQoNClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------k87NbxI1LBnN02LDBuwpuKIA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------k87NbxI1LBnN02LDBuwpuKIA--

--------------y5MlRn3dT02iY3thmAEmeFaC--

--------------2dPoy037AoV5uWm6Nw8JM3Na
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgl0P8FAwAAAAAACgkQsN6d1ii/Ey9y
9gf/Q9/eu+UxUlKAd28X7c6Fc1sPSNE6RyrAYzJaD0oVh8qFklBk4lzk4U8aDHndUYIgEfLRCdwC
ijJfQAApS6wm1ef5ryzET4AV8St1ZDe8mM9vdMq/Qypu1+vKtvKEJyHajPkr+C0IKtdIqmDe8h3B
+r66WqJaFWMZ9j5ViL7wTx0wDa3BKPXzGzIVU3uwnP0jzeemEFnPjwKKDV3A8xpNx1dbF9ajTQQI
DEskoh6X+JYoBCemAeyiqF1G2WGxHcrpaIg6PiKeye8bKIETZl1Gb0opKFMpzbAC1Vr2cqSFFN62
wlOuP2L/MpQWBXZLQkLCjaglGRRfK7PqGot+u+eZWw==
=p318
-----END PGP SIGNATURE-----

--------------2dPoy037AoV5uWm6Nw8JM3Na--

