Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88CA8580D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 11:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946922.1344652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Ahs-0007pl-1Y; Fri, 11 Apr 2025 09:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946922.1344652; Fri, 11 Apr 2025 09:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Ahr-0007nO-US; Fri, 11 Apr 2025 09:29:51 +0000
Received: by outflank-mailman (input) for mailman id 946922;
 Fri, 11 Apr 2025 09:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u3Ahq-0007nI-Ro
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 09:29:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83d01bb8-16b7-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 11:29:49 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so9465765e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 02:29:49 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2066d109sm82132595e9.20.2025.04.11.02.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 02:29:48 -0700 (PDT)
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
X-Inumbo-ID: 83d01bb8-16b7-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744363789; x=1744968589; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xw7y2ZbJNMHY4Qaqdel+SPmJophdt1UZc+CLz7qArRw=;
        b=Epm5ai+1gAQEZ2psKBUnlkcX1ocPA9ZbxVCxmVjMJJ5xbaH9FB/PCJUV9C4IPB8DIE
         FNSRKGIRr0RAFPVX+7G4JoSk8x4A0WXQQXcbEJfCh8QeiQew/5fjweDynPvGpX+Kda63
         xDBE+i4BUEWBs86pYVATN85AlSXt1/dM3Oz+cMZFws79YlooBOyOKFymYlRMqnXc7H+B
         u7VLhm/RudGkL0G+g5itAPZ0I5zAi6KOuVZbG9eN4h6M+1ynkSXEY1qzmN3HK9s2/ZpM
         H9eonQ1S3kI+dPBo/nj1MkG/oxqb1WTG4mKs3eQgikwCZ6NS2cHaSrjHAPRECABH7rPL
         Pp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363789; x=1744968589;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xw7y2ZbJNMHY4Qaqdel+SPmJophdt1UZc+CLz7qArRw=;
        b=PU7Hyt7KShnlT4rlffKC9ZPcWJTtpf9kwzxHpaH+mMyNR9HkrQjlJrd0hy6ym1MARk
         7+Mwv/GKwhIJ9sBtuUUpisIIuBLqBCtMrUin5o0Q+QEnL2ZWlCp91VEEVui501TZwcb4
         5ULEU4h0R5q1deD0nm1MDjfuSQ3XJnf9fMU4qv21EFAlOXR5qrCtsIO0MlAJRvoAVg6O
         VS70Vmd8uSS4TOE2GtIg1MK3WBsniK2RouSPLbXDOIoWcz2KGeJPlNLQ5OXfS/6AT3yV
         8L1cGs04e7wmRCNTDAOmDy0Fj8OxoSGpp/AaA6DRTMT7i9OnBY2x04saqxcZciLf9xHd
         r35g==
X-Forwarded-Encrypted: i=1; AJvYcCUZYSx+iXfaLcUCkosAPr7QVc2oNHDP0D1TB25V7bsqkXboZvq2v427nDKW853Ml7nndvppJ6B/QL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymqtJKZ90YVTiC5LlfwJ9DYGNzmkIyF0vpRSmc8toxFULRhBFw
	5LKEBxDiLfSeffb/ClJ7FCKqmzIbm95NbxMLBCvhdbybjc1DB3wvFe5m96XhfyE=
X-Gm-Gg: ASbGnct2HUlR81XYBOTR21Npo03zlGLWquDloxco0G3SvjnmlUtudPxwQTVQdgtt6R9
	/FAmTzvTP5Q2jaxOF1zBiLzhzEO4Udv8GIs+iIufZ2Ejo6WCeWH9r35BrtS7hYqNDjVwgf0xwNW
	RS1EZhGqJ9sAtXt3vOKqch6bzPiNsl/ZrM2lEQdTEgkrlOdK3gZogfTq3EYknCeXzOgcD1QL/kr
	q5lLm02LAk5RBxNiT4VNDFjA/uHEovztyZIGGg81OWgJyYWNmxrEjnWDCp2G8/nmXA2/Ws/JF/W
	Uu54R0WcX8u7U6qAU+M8W+VcIuG6vntMnDL1Rvsh9zwio95L+UMw28aIUTQ1X31tXXXl1tMzYR9
	EIZhfVM55ypjYZWFOn7KTWaNAz9F1pXYBX9NbhZ1gEZYtZutwD0VgcnWu65R/nBivoA==
X-Google-Smtp-Source: AGHT+IElufFrnnzqSB0PtxMAgswouCla1lM+q/8FV/fkCvJ6aJx7inwZZ0+DnezGFrDyr6qU8qxPAg==
X-Received: by 2002:a05:600c:34ca:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43f3a928afamr15119175e9.1.1744363788950;
        Fri, 11 Apr 2025 02:29:48 -0700 (PDT)
Message-ID: <ff39455a-7fa8-48c1-ba43-33ea4992f6e1@suse.com>
Date: Fri, 11 Apr 2025 11:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix __xen_hypercall_setfunc
To: Ingo Molnar <mingo@kernel.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Xin Li (Intel)" <xin@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20250410193106.16353-1-jason.andryuk@amd.com>
 <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com> <Z_jgauFyTTKgVnJy@gmail.com>
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
In-Reply-To: <Z_jgauFyTTKgVnJy@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RHBV3EgP100oFynY0u0d2TlZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RHBV3EgP100oFynY0u0d2TlZ
Content-Type: multipart/mixed; boundary="------------b0qcQdaqeWFQOGn2gv9udLxI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Xin Li (Intel)" <xin@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <ff39455a-7fa8-48c1-ba43-33ea4992f6e1@suse.com>
Subject: Re: [PATCH] x86/xen: Fix __xen_hypercall_setfunc
References: <20250410193106.16353-1-jason.andryuk@amd.com>
 <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com> <Z_jgauFyTTKgVnJy@gmail.com>
In-Reply-To: <Z_jgauFyTTKgVnJy@gmail.com>

--------------b0qcQdaqeWFQOGn2gv9udLxI
Content-Type: multipart/mixed; boundary="------------7ExAisI929g7VtcYG7RiCDfH"

--------------7ExAisI929g7VtcYG7RiCDfH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDQuMjUgMTE6MjcsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IE9uIDEwLjA0LjI1IDIx
OjMxLCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4+IEh5cGVyY2FsbCBkZXRlY3Rpb24gaXMg
ZmFpbGluZyB3aXRoIHhlbl9oeXBlcmNhbGxfaW50ZWwoKSBjaG9zZW4gZXZlbiBvbg0KPj4+
IGFuIEFNRCBwcm9jZXNzb3IuICBMb29raW5nIGF0IHRoZSBkaXNhc3NlbWJseSwgdGhlIGNh
bGwgdG8NCj4+PiB4ZW5fZ2V0X3ZlbmRvcigpIHdhcyByZW1vdmVkLg0KPj4+DQo+Pj4gVGhl
IGNoZWNrIGZvciBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQ1BVSUQpIHdhcyB1c2VkIGFz
IGEgcHJveHkgZm9yDQo+Pj4gdGhlIHg4Nl92ZW5kb3IgaGF2aW5nIGJlZW4gc2V0LiAgV2hl
bg0KPj4+IENPTkZJR19YODZfUkVRVUlSRURfRkVBVFVSRV9DUFVJRD15ICh0aGUgZGVmYXVs
dCB2YWx1ZSksIERDRSBlbGltaW5hdGVzDQo+Pj4gdGhlIGNhbGwgdG8geGVuX2dldF92ZW5k
b3IoKS4gIEFuIHVuaW5pdGlhbGl6ZWQgdmFsdWUgMCBtZWFucw0KPj4+IFg4Nl9WRU5ET1Jf
SU5URUwsIHNvIHRoZSBJbnRlbCBmdW5jdGlvbiBpcyBhbHdheXMgcmV0dXJuZWQuDQo+Pj4N
Cj4+PiBSZW1vdmUgdGhlIGlmIGFuZCBhbHdheXMgY2FsbCB4ZW5fZ2V0X3ZlbmRvcigpIHRv
IGF2b2lkIHRoaXMgaXNzdWUuDQo+Pj4NCj4+PiBGaXhlczogM2QzN2Q5Mzk2ZWIzICgieDg2
L2NwdWZlYXR1cmVzOiBBZGQge1JFUVVJUkVELERJU0FCTEVEfSBmZWF0dXJlIGNvbmZpZ3Mi
KQ0KPj4+IFN1Z2dlc3RlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNv
bT4NCj4+DQo+PiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPiANCj4gV2FubmEgbWVyZ2UgdGhpcyB2aWEgdGhlIFhlbiB0cmVlLCBvciBzaG91bGQg
aXQgZ28gdG8geDg2L3VyZ2VudD8NCj4gDQo+IFRoZSBidWcgd2FzICpjYXVzZWQqIGJ5IHRo
ZSB4ODYgdHJlZSBzbyB3ZSdkIGJlIGdsYWQgdG8gbWVyZ2UsDQo+IGJ1dCB5b3VyIGNhbGwu
DQoNCng4Ni91cmdlbnQgaXMgZmluZSBmb3IgbWUuDQoNCg0KSnVlcmdlbg0K
--------------7ExAisI929g7VtcYG7RiCDfH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------7ExAisI929g7VtcYG7RiCDfH--

--------------b0qcQdaqeWFQOGn2gv9udLxI--

--------------RHBV3EgP100oFynY0u0d2TlZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmf44QsFAwAAAAAACgkQsN6d1ii/Ey/i
OwgAhvq9IJ6hGqT22xNA4UxEtOWR/s8phFv6811pajj6SZo7vNwNlhQoI/Yv+/VXL+8GuKUZzYSC
1nrM1mI/xuogOp7VGce6SvL6i9lkDfBjSrgqwj7Awq9VJenyKm1J0vA9Sk+qSrILD4flAc8ftOj4
iyrHGtxfOeD3ArjWW0BtC7ws1EKB8TBiE687d5l18/7pnlPZpjvBSZ8Y0zdi266ofhQGo54Bndm9
DtecTrXsfpbEBBtJIAv4oZetvoNEh4KrlYb0dOBXtwcPPa9gxkq/gx4uyBcXlDgsEqkPIwvK4RdW
6zeKIisw9fA3EItfpjMRX5pCnhOgh5hpbW+EeffqSQ==
=bZay
-----END PGP SIGNATURE-----

--------------RHBV3EgP100oFynY0u0d2TlZ--

