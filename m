Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24089FF7E9
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 11:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863827.1275203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTIJh-0007HJ-Hx; Thu, 02 Jan 2025 10:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863827.1275203; Thu, 02 Jan 2025 10:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTIJh-0007F0-D8; Thu, 02 Jan 2025 10:20:37 +0000
Received: by outflank-mailman (input) for mailman id 863827;
 Thu, 02 Jan 2025 10:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDYY=T2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tTIJg-0007Et-FP
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 10:20:36 +0000
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [2a00:1450:4864:20::544])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33d61b89-c8f3-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 11:20:34 +0100 (CET)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5d8c1950da7so7125124a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 02:20:34 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f3f9sm18151725a12.23.2025.01.02.02.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 02:20:33 -0800 (PST)
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
X-Inumbo-ID: 33d61b89-c8f3-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735813234; x=1736418034; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqdjTliz8x0JI3A+pL7Jh6qth4xpjv9uL/9jYPDsECU=;
        b=RzyNz8WPve3vWBWm9Gxkz2jMSQmm4kib4j1hvyx5ACXg14Zgen2Hf2VEYLFdAUheig
         CqYMTJ2TjSMLvUPlKc9+e+7xMLTEz8bdaKH/ChBAySv4HaPNLQ597j8F37zmZpNsmXb1
         XtNdX4xmKVVpaLUXlGf9gIMa5tC+6KMNQYyLk6UDRghVDRkk9rLCGK8GGoOzIjgr3fR0
         X0qGvS5ID9ePDA+pIXioE47gEaqqT1d5xcZFTfj2zP+wkjeEzF8qsd1fri/v1KcYUMbo
         RRIuWncrBAecZ2L5FF9Fmboqfokbw/ilTn15yUI3+kRYD8ymExyFdN/hryjNJMPUysAW
         umWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735813234; x=1736418034;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sqdjTliz8x0JI3A+pL7Jh6qth4xpjv9uL/9jYPDsECU=;
        b=vSUAItO4FZVNidiLyZOj7gCEacrWqN+cYsfp+PcdJ0GZXAiNBnem8JbU1l3YbdiGRM
         LJF/wj3Dj16tt3uIj2ewkHNVRBqMf9DjtbZpWQUX5H68Md/wdBT0QENhHT4vV9hOqiQD
         pFlcfCuP4XL8GuC8MeuGKFVcqNNrJbXp06Uyjdfj16CS+EAzwLBUdBgnEOB3af6w+D2s
         9LE/PsMyNP1svZiscAiKdLEQRrhSRUVK2AcUVPWAnxdI69I+YxMQhg8xdWisBBnxSJaL
         EWGKhv2ym1gbk3KLrT9AxbVXOtavlhg+z7rrC/d67yB1DnUugA2JaC+2/pVq8AbQjhzv
         nBeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlOiGO7Z3/Kzt9obgURD651NxST9K5fDJ9rKL7/EmD+9EzzftzHBRFnfwiKG6skgEpAyUgCXb/j3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUa29vKhsYYdhQRrrHCB5UmbVortkWQbVELfTjRqcHQhKtdzcW
	5fw2J7yYE15T6ALZXldJpuQBdBs/0ieqLmMSdJ29bmXtWptLfHrsVCFxlhoPxok=
X-Gm-Gg: ASbGncv8mheQFYkrnV/9viFKq7xQERnuvNp/qNfnyk04hABZ+8h4v/7ID84BN5ckkvV
	QhTp8QsJcnr87sYzanRoxAnt4SCFSSAXH5TRlFOJakpmkQ/R2DMiCPLIiM3YEUM/SsGnNRNlOce
	VMhQUWqJuPevJN3R+Q4vydHH7sYmlfP90KtEJGNsNAEjwZpk+Rd8VYgLbW1MPC95/gtpBEyxw+f
	BtQX0zdGsrltVe2jeju70uJStow3Gb3i1wIhqYVT5Yx6gi20tbWrGj5DcS+qR+sGl3ZVJP0CfFS
	KPpeTX32IWCMF7hqdVIyujhGyaAESaiTyefTklu5uKEFYCIq+8cYp7jVb26ut611AohyyudRS8f
	mu2NvHA==
X-Google-Smtp-Source: AGHT+IGOWn7PGjKu5Yn+MqKdOPzsT9+UWzhIl5aKvGCaWrw7hnGYDX/oGmBqQBULIqsJTPh9dznG0A==
X-Received: by 2002:a05:6402:43cf:b0:5d3:e79b:3b4c with SMTP id 4fb4d7f45d1cf-5d81de38c50mr37442495a12.31.1735813233856;
        Thu, 02 Jan 2025 02:20:33 -0800 (PST)
Message-ID: <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
Date: Thu, 2 Jan 2025 11:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
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
In-Reply-To: <Z2RGfpJkO0z_nKV6@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZkX4YxmtK5HygRFUTkc1C7v6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZkX4YxmtK5HygRFUTkc1C7v6
Content-Type: multipart/mixed; boundary="------------yuBunEU0GVh5ayJqrIURRbiN";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
References: <Z2RGfpJkO0z_nKV6@mail-itl>
In-Reply-To: <Z2RGfpJkO0z_nKV6@mail-itl>

--------------yuBunEU0GVh5ayJqrIURRbiN
Content-Type: multipart/mixed; boundary="------------0REdhiNXmo7DuFBjcIssxewK"

--------------0REdhiNXmo7DuFBjcIssxewK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTIuMjQgMTc6MTQsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBJdCBjcmFzaGVzIG9uIGJvb3QgbGlrZSBiZWxvdywgbW9zdCBvZiB0
aGUgdGltZXMuIEJ1dCBzb21ldGltZXMgKHJhcmVseSkNCj4gaXQgbWFuYWdlcyB0byBzdGF5
IGFsaXZlLiBCZWxvdyBJJ20gcGFzdGluZyBmZXcgb2YgdGhlIGNyYXNoZXMgdGhhdCBsb29r
DQo+IGRpc3RpbmN0bHkgZGlmZmVyZW50LCBpZiB5b3UgZm9sbG93IHRoZSBsaW5rcywgeW91
IGNhbiBmaW5kIG1vcmUgb2YNCj4gdGhlbS4gSU1ITyBpdCBsb29rcyBsaWtlIHNvbWUgbWVt
b3J5IGNvcnJ1cHRpb24gYnVnIHNvbWV3aGVyZS4gSSB0ZXN0ZWQNCj4gYWxzbyBMaW51eCA2
LjEzLXJjMiBiZWZvcmUsIGFuZCBpdCBoYWQgdmVyeSBzaW1pbGFyIGlzc3VlLg0KDQouLi4N
Cg0KPiANCj4gRnVsbCBsb2c6DQo+IGh0dHBzOi8vb3BlbnFhLnF1YmVzLW9zLm9yZy90ZXN0
cy8xMjI4NzkvbG9nZmlsZT9maWxlbmFtZT1zZXJpYWwwLnR4dA0KDQpJIGNhbiByZXByb2R1
Y2UgYSBjcmFzaCB3aXRoIDYuMTMtcmM1IFBWIGRvbTAuDQoNCldoYXQgaXMgcmVhbGx5IGlu
dGVyZXN0aW5nIGluIHRoZSBsb2dzOiBtb3N0IGNyYXNoZXMgc2VlbSB0byBoYXBwZW4gcmln
aHQNCmFmdGVyIGEgbW9kdWxlIGJlaW5nIGxvYWRlZCAoaW4gbXkgcmVwcm9kdWNlciBpdCB3
YXMgcmlnaHQgYWZ0ZXIgbG9hZGluZw0KdGhlIGZpcnN0IG1vZHVsZSkuDQoNCkkgbmVlZCB0
byBnbyB0aHJvdWdoIHRoZSA2LjEzIGNvbW1pdHMsIGJ1dCBJIHRoaW5rIEkgcmVtZW1iZXIg
aGF2aW5nIHNlZW4NCmEgcGF0Y2ggb3B0aW1pemluZyBtb2R1bGUgbG9hZGluZyBieSB1c2lu
ZyBsYXJnZSBwYWdlcyBmb3IgYWRkcmVzc2luZyB0aGUNCmxvYWRlZCBtb2R1bGVzLiBNYXli
ZSB0aGUgY2FzZSBvZiBubyBsYXJnZSBwYWdlcyBiZWluZyBhdmFpbGFibGUgaXNuJ3QNCmhh
bmRsZWQgcHJvcGVybHkuDQoNCg0KSnVlcmdlbg0K
--------------0REdhiNXmo7DuFBjcIssxewK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0REdhiNXmo7DuFBjcIssxewK--

--------------yuBunEU0GVh5ayJqrIURRbiN--

--------------ZkX4YxmtK5HygRFUTkc1C7v6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd2aHEFAwAAAAAACgkQsN6d1ii/Ey/U
Twf/WwTf7BYpogEIyx/Ef91ONjfUyvMKTdeOSRlgTy+TaknGRXSqBGRRPiWqGh4CO8swlvkWRia/
KinUPQgCgemylAdqAnNp2dhri3mK5dtN5Zzy+PS8HtY6Z02UKTunOMTlASEp/LYYz00ksIhI8CMW
IRf9AKypPDDhAMvA1OuLCDMIUEvDJckAzh2DbjAKEHxvy/iG/Ju3C0kCVaZ+/nAuOnH+idnbaehd
YOWQNirsvBOTiBUsNIlfzP0JUJ0cNUNK7zmrxYbl18hLbgcf/DRdueWIG5Z84G5xYP8/ULHsU9Sc
cbI4e9cyC6L4vaHEDzduLJjfpxz3GkJ+0feR0YgCAQ==
=v6B9
-----END PGP SIGNATURE-----

--------------ZkX4YxmtK5HygRFUTkc1C7v6--

