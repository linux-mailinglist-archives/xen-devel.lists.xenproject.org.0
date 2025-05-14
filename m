Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8C7AB707B
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 17:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984464.1370602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFERz-00021Q-GE; Wed, 14 May 2025 15:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984464.1370602; Wed, 14 May 2025 15:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFERz-0001zo-DH; Wed, 14 May 2025 15:55:19 +0000
Received: by outflank-mailman (input) for mailman id 984464;
 Wed, 14 May 2025 15:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2kKl=X6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uFERx-0001zi-Re
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 15:55:17 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d43f66be-30db-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 17:55:16 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5fc8c68dc9fso6767402a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 08:55:16 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192cc449sm950899866b.20.2025.05.14.08.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 08:55:15 -0700 (PDT)
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
X-Inumbo-ID: d43f66be-30db-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747238116; x=1747842916; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ryo/5460jXyba+2N6cmiEE74Onl1UW5ECCK42iBOj64=;
        b=CcfhEd0Dkk+gYYnA+djBdSVS3NhyrRbZA6s6uajcKXEP3P+nPwXa2GjSI8HG86GKDJ
         XxSHHfToRf1SUQ9bL7piRSnr44blxSg8++Fq9qvXs1+FS704CcJIXncsKtRWTjupiG9b
         jdbwNlLEOSh30L4MQKBJEBfw0sjxQBij+Yi+nbXZnvRzqxA2Ia2T2Ef4Jk3zUX72zHSV
         K3DYQrerYZD+95IU3BcK2NJUS6L4F7CIqWJjb9vQvA8C1smG4UD3iH1t/KGmx65ivxLY
         m9EjpOSgs5QOKlJW1VUzNuB5ddBHZ/nvDxipeZMeF1+6BoGHnjyEiZTy8jQc1vqAgmRb
         tl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238116; x=1747842916;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ryo/5460jXyba+2N6cmiEE74Onl1UW5ECCK42iBOj64=;
        b=mINUSzZcmowQ7+dzvzx7Lf0xy1j6ZA+cmsJI62JlkAvOIXgjlt2t74Mr5irqXzq8wM
         tMH0Hxn3xkdmAJlk2Zb1gIaGl5p4tB648hnuvfCn9PyXruIgdnKMVN2FPiQ8vKFvUhYf
         1w+0aUn8h9GcbLGNkrLPX2s3aQTuhRwgMwPoVj+vBA8hi7ezAIgAJ4Pveo8VNRdOb6nz
         x5dgy0/Oq9TKp2h+up/R4Emmc1Qc06TZenEy0lK7tRFCcRwUSmrCupWjZz/6y5OWbl/l
         T386JcOhxgkSZW/tOPVMiT+uSO5IqtjPs+QnP+f8A4W88RH0IZJXTEqEdZGP70pdjSIO
         f0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWVyGmpgQw7hAxWlWRhOfe2NQ2GmZ8g18vjAGzSvb7l0WYSoSgwlXCISFAiPgtTfAL/0WwXW88mK8M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJE4DCO1+Kkp6L5cw5G7rELWZvSD7BhsHOzezSlWg/E22G/Lwl
	GvVc9TA9JgFwN8pw/Q/RIXCq7cwZs0iCje0AdV/sWSE0XZaL4oIWlbQlK10U76w=
X-Gm-Gg: ASbGncsbXyHaxDiPOqsR9Q6Ro3jp+Hvs1HSo9Ws4hqN7cbi1EAbPoAtfh1Xpz5ajX3D
	ICwsUWdlCN0MUBV35imq/i3D/p18gML18JQp3j8fZJDXVGUbTWFvMH7OaWRmz6dLHxMOo/LZNeV
	UxYt+w+1JeCArPhRWCuSDEvM2nukiJB4x9us3EdhrbzYAkyoy8Y2PxN8R760h8loJfOBv2fLTgC
	U5EpfxI3TaPegDCwqJr2Hh84H6yRqyh4qIXo5ZkbHe6rYbNRxUXc2Yn3JY2gGgkwhTtF8tGab4J
	JaDEUeUGjQFXrnJ0sw6DdLUvL9YiXVyjGrqNwRhTARehFL0iwCqb5/ewInImPX5yS8FqMt5+c27
	4b1VF+iMerzXnJNeVaXCZloPyOBhwWnI87iOBfKc1WJq5mulCh1qzmBgl03f4nDft1XmNgePLpf
	Rq
X-Google-Smtp-Source: AGHT+IHh182S4qNrzpec68cB0pQSx8HaaxuNG0Bm4xeTqtlXZzaRN237QiP3XSyy3bxxeKHYt1bRNA==
X-Received: by 2002:a17:907:168a:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad4f752d0b6mr375090966b.48.1747238116072;
        Wed, 14 May 2025 08:55:16 -0700 (PDT)
Message-ID: <203ec9a5-01cc-4d5a-bb47-054d4a7f41a3@suse.com>
Date: Wed, 14 May 2025 17:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: enable XEN_UNPOPULATED_ALLOC as part of xen.config
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250514092037.28970-1-roger.pau@citrix.com>
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
In-Reply-To: <20250514092037.28970-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0m6ZejlMWcAxvEGCTIVoj8jX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0m6ZejlMWcAxvEGCTIVoj8jX
Content-Type: multipart/mixed; boundary="------------Xh7Zg4lQ3ytXl0jkpXXQoIrG";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <203ec9a5-01cc-4d5a-bb47-054d4a7f41a3@suse.com>
Subject: Re: [PATCH] xen: enable XEN_UNPOPULATED_ALLOC as part of xen.config
References: <20250514092037.28970-1-roger.pau@citrix.com>
In-Reply-To: <20250514092037.28970-1-roger.pau@citrix.com>

--------------Xh7Zg4lQ3ytXl0jkpXXQoIrG
Content-Type: multipart/mixed; boundary="------------rV35Z4Fn70QA3DmRJ7r0OHqR"

--------------rV35Z4Fn70QA3DmRJ7r0OHqR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDUuMjUgMTE6MjAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gUFZIIGRvbTAg
aXMgdXNlbGVzcyB3aXRob3V0IFhFTl9VTlBPUFVMQVRFRF9BTExPQywgYXMgb3RoZXJ3aXNl
IGl0IHdpbGwNCj4gdmVyeSBsaWtlbHkgYmFsbG9vbiBvdXQgYWxsIGRvbTAgbWVtb3J5IHRv
IG1hcCBmb3JlaWduIGFuZCBncmFudCBwYWdlcy4NCj4gDQo+IEVuYWJsZSBpdCBieSBkZWZh
dWx0IGFzIHBhcnQgb2YgeGVuLmNvbmZpZy4gIFRoaXMgYWxzbyByZXF1aXJlcyBlbmFibGlu
Zw0KPiBNRU1PUllfSE9UUkVNT1ZFIGFuZCBaT05FX0RFVklDRS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZp
ZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4N
Cg==
--------------rV35Z4Fn70QA3DmRJ7r0OHqR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rV35Z4Fn70QA3DmRJ7r0OHqR--

--------------Xh7Zg4lQ3ytXl0jkpXXQoIrG--

--------------0m6ZejlMWcAxvEGCTIVoj8jX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgkvOMFAwAAAAAACgkQsN6d1ii/Ey9g
LggAkkh8UL8M1FJdEcLDvHyLfK23UDnyDuZyQXhhAzD1AlK+NrmN7ip8dkQ+Z38nAPa+j3ZrPqfE
hIidDa72iZBdCM/u4o9zdI+CF7U6vlRUjt2Euf1GANxJ1xEvhckKfUDCM8SxmRdm3WcgkcScK+ey
8F/5RiY2S2CREkikeQvIenq8FhOR2i3pGhDsE3I0eyVFVlKthhlA5w8IIJzHkf/70v6YMc/9nINm
JOKLK0Qg2ADNF7aMAA09ZVi+0JApPs6vSI4OZCrxB/q0gz03AmC9xE31MsqiKXYnedHUeGM3djwW
mk7Ce/z4aakxotnZ7REsSe5wtYy3NrOOoLJjbZEGKw==
=376d
-----END PGP SIGNATURE-----

--------------0m6ZejlMWcAxvEGCTIVoj8jX--

