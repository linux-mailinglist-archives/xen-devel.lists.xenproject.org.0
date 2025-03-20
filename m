Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613D9A6A8AD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922251.1326143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGzJ-0005Ex-Ej; Thu, 20 Mar 2025 14:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922251.1326143; Thu, 20 Mar 2025 14:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGzJ-0005Cw-BX; Thu, 20 Mar 2025 14:35:13 +0000
Received: by outflank-mailman (input) for mailman id 922251;
 Thu, 20 Mar 2025 14:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=496r=WH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvGzH-0005Ci-ND
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:35:11 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 870009b9-0598-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 15:35:10 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso201460266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 07:35:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5eb57bc6f1dsm3703505a12.50.2025.03.20.07.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 07:35:09 -0700 (PDT)
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
X-Inumbo-ID: 870009b9-0598-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742481310; x=1743086110; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qiDGJOjRspOG1dsG/Ez+kBfM8VbVgfzROzDT+mwZ0w4=;
        b=JHt0yF8Uw0yp5nw0S0FH5Zr/stqbKN2kVfse8pjJ0XUFDgz178qxXJ7qpjMli8PNIj
         tun7rPYuqXjvA/4BO20Xe0SNiFZ1rTO3BfZAmQj5bfIprH3znHBgroeeo2QfDM5ZABHr
         Z+5AcdP1WAr22LImNs+DIHQCTppFW9ACUeHCJB2PtXx1TWxGe+IIoHJMywDqgEyZbX5D
         Gf8I1Ezqh9d8xDsg4dfR4MLu5FHJIf9QN8xSiDl98ZpIfJrMAKeKH8kRDh+e9d2urCYl
         l3aQLfQNZ8ik4y6h6CJ+dLCLUQMOGbvxuF0Y3xp1gQY5xVT3IL2w0qJWCwqDCAPGGlHx
         un7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481310; x=1743086110;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qiDGJOjRspOG1dsG/Ez+kBfM8VbVgfzROzDT+mwZ0w4=;
        b=uoIkBMosXnuBMQXHG9zQmivht6/JfHfOvLKomsG820IbjhKtIfnyOE13FeorfbDPJX
         Vfr7zIY9VMIPlSRjLXIPqPp36V9SBzqKzBRW7QKADy/WfcvCG4STJQyy8GeJ0ZXxRx4n
         mfRqjIV9BVyVI3cSTpZxIopWdQz/T4t7G3ruRCPnUIkOX5cPxoYAgnUA+sCqbih3tmzp
         k6/Fc4p1pDoe22htRt3ElQQ+SRw+eHaMQKualRk+6w0S6HJl1tGOEzA+Hhh6PF3LsZSq
         /jBYcM0bRhVfl2XkdVXx9jeSr+0b4+xBB5J7INQCGxhhRLJ2eb/lCPbCgM9kyHJnK1vl
         UfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW85D7wavdUH+tvuo66O7pIHjbLsdV7DvBx29dJwJ28MseBzR8UB1Du6HdpEn67tinIGbXaEgpgqII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxENXiQzL45xgWlirbCcAmPySoBrkfHyWWTsn7aXi2Kqt4MYvSb
	m3DnD43/DuJhkckp5ray/m7gZCSsJ/nzQhAcGSplbjLiLRGEahGVZ1H0ScHPw9E=
X-Gm-Gg: ASbGnctOLJG4bVPYFdjSXw6rUTH+x0L86D6F108ATkXilQvE+Je4TnN6W7cResw0L0w
	aYi7PPNUVrzUiiF2hGRAF1b6GaMBkx3p6kKUsAzpKLn0RRBbWZCcEaI8UXpZkT2lANUuinLkkop
	golgDaGah2VeAJ6sFLgoSb+nsTzrlBei6ykTwf8zDjypEurv1HfFA2PK5y8LLPFpE9NF09j7ME4
	NIJ383xzlPaRxAOyooBcUqqB9A1B47OW9tuiZFM4dMZRJJBBzoN2YfXRjYAqk/H6lNVKINeEypO
	XOdEMb7EtTRlW+pp0pCP0M0rVHQeeMx4dE/R2nr1aeM6CCSUAssRh1WJgPSbRw6HKe0FBNZiUzF
	OKGECyR0dbMfo3eZrw1cO6tky8w2+09AHjLOrAJjiGhEFqfq6C1a1kzr0fdPx9X3IfZwEBw==
X-Google-Smtp-Source: AGHT+IG1mxbC1SeMzPWOf318cq6YNfrp0TIf+qslkBF46wDnG7JPUnRKBPXOelvRo7lXYpVr+S0TLg==
X-Received: by 2002:a17:907:c810:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ac3b7a9677dmr804082966b.3.1742481309993;
        Thu, 20 Mar 2025 07:35:09 -0700 (PDT)
Message-ID: <ed35e0d0-898f-4e74-9a7c-24871d0d606c@suse.com>
Date: Thu, 20 Mar 2025 15:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 1/2] 9pfs: add fstat file operation hook
To: Jason Andryuk <jason.andryuk@amd.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
References: <20250320074924.8080-1-jgross@suse.com>
 <20250320074924.8080-2-jgross@suse.com>
 <c8cb581e-7d6d-4f0b-abb5-f94f0c50fcac@amd.com>
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
In-Reply-To: <c8cb581e-7d6d-4f0b-abb5-f94f0c50fcac@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YhfWdGX0olAEptpoR3tggdZo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YhfWdGX0olAEptpoR3tggdZo
Content-Type: multipart/mixed; boundary="------------pmnZMVhCwA0VcU3KyloI08Jl";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
Message-ID: <ed35e0d0-898f-4e74-9a7c-24871d0d606c@suse.com>
Subject: Re: [MINI-OS PATCH 1/2] 9pfs: add fstat file operation hook
References: <20250320074924.8080-1-jgross@suse.com>
 <20250320074924.8080-2-jgross@suse.com>
 <c8cb581e-7d6d-4f0b-abb5-f94f0c50fcac@amd.com>
In-Reply-To: <c8cb581e-7d6d-4f0b-abb5-f94f0c50fcac@amd.com>

--------------pmnZMVhCwA0VcU3KyloI08Jl
Content-Type: multipart/mixed; boundary="------------ZwvVlxsP7cqFF3CpivCKIU0m"

--------------ZwvVlxsP7cqFF3CpivCKIU0m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDMuMjUgMTU6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDMt
MjAgMDM6NDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgYSBmaWxlIG9wZXJhdGlv
bnMgZnN0YXQgaG9vayB0byB0aGUgOXBmcyBmcm9udGVuZC4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4gDQo+PiBA
QCAtOTUwLDYgKzk1MiwzMiBAQCBzdGF0aWMgaW50IHdyaXRlXzlwZnMoc3RydWN0IGZpbGUg
KmZpbGUsIGNvbnN0IHZvaWQgKmJ1ZiwgDQo+PiBzaXplX3QgbmJ5dGVzKQ0KPj4gwqDCoMKg
wqDCoCByZXR1cm4gcmV0Ow0KPj4gwqAgfQ0KPj4gK3N0YXRpYyBpbnQgZnN0YXRfOXBmcyhz
dHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHN0YXQgKmJ1ZikNCj4+ICt7DQo+PiArwqDCoMKg
IHN0cnVjdCBmaWxlXzlwZnMgKmY5cGZzID0gZmlsZS0+ZmlsZWRhdGE7DQo+PiArwqDCoMKg
IHN0cnVjdCBwOV9zdGF0IHN0YXQ7DQo+PiArwqDCoMKgIGludCByZXQ7DQo+PiArDQo+PiAr
wqDCoMKgIHJldCA9IHA5X3N0YXQoZjlwZnMtPmRldiwgZjlwZnMtPmZpZCwgJnN0YXQpOw0K
Pj4gK8KgwqDCoCBpZiAoIHJldCApDQo+PiArwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDC
oCBlcnJubyA9IEVJTzsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLTE7DQo+PiArwqDC
oMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAgYnVmLT5zdF9tb2RlID0gKHN0YXQucWlkWzBdID09
IFFJRF9UWVBFX0RJUikgPyBTX0lGRElSIDogU19JRlJFRzsNCj4+ICvCoMKgwqAgYnVmLT5z
dF9tb2RlID0gc3RhdC5tb2RlICYgMDc3NzsNCj4gDQo+IEkgdGhpbmsgeW91IHdhbnQgYHw9
IHN0YXQubW9kZSAmIDB4Nzc3YCBoZXJlLg0KDQpJbmRlZWQuIFRoYW5rcyBmb3IgY2F0Y2hp
bmcgdGhpcyBvbmUuDQoNCg0KSnVlcmdlbg0K
--------------ZwvVlxsP7cqFF3CpivCKIU0m
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ZwvVlxsP7cqFF3CpivCKIU0m--

--------------pmnZMVhCwA0VcU3KyloI08Jl--

--------------YhfWdGX0olAEptpoR3tggdZo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfcJ50FAwAAAAAACgkQsN6d1ii/Ey8U
Kgf/ROrqjRvkOwUOfZz3iZT0LZquFHADC5RQTO0qM8jLVkR7ofbuipGo5SseukcfFeH/z8XfT555
/fDiA4FScCgXfmSJSnn4e9SICK3N9FZ3pVtYxHeC6sxpQDqpaC/cuI0s65YvzHVmBo3+tkwX6zX2
XAAsgYqfobXHZdkaXe5QqbLMd4HHlHJIGelPmEAytA1jNzaLgUVCqnDHOYQIxxg+FTWPJR8/rKtH
1QV8N8kCZhH+a3yjFQ10GniRGxEQgtgszlqooZDR0ICd+aJT0KxU54GiwYFapiTUiKVJGyPG7Dun
m0W2QbyLcIDA4luHLRGVLIrOtUBj5289T7U3l/WWdw==
=apt+
-----END PGP SIGNATURE-----

--------------YhfWdGX0olAEptpoR3tggdZo--

