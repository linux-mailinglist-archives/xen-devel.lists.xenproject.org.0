Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D16B35A32
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 12:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094295.1449619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqr5d-0005sv-Sm; Tue, 26 Aug 2025 10:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094295.1449619; Tue, 26 Aug 2025 10:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqr5d-0005qZ-Q3; Tue, 26 Aug 2025 10:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1094295;
 Tue, 26 Aug 2025 10:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uqr5b-0005qT-R3
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 10:39:43 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f96ccacb-8268-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 12:39:42 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61c325a4d83so4292416a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 03:39:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c316f4e10sm6724132a12.29.2025.08.26.03.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 03:39:41 -0700 (PDT)
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
X-Inumbo-ID: f96ccacb-8268-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756204781; x=1756809581; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aubxpbk2XtBhI4C5/n2BXN9jWVxK0FlxNqKl7ieYfbQ=;
        b=PgEOv8ZvCy3wKFn+2iTYEZAiHmlTcXkwndg+TjP/PWuV/7tk/cQtxaU09VjVBT4u7A
         cg0zwkhjnLK+6LpB5G28dyWWpUiC/Ce+/Y0epMJvv7/4Gkx1DDqNOGU+KjSGbDJi4RkW
         TUPThZiVrNLnLp8CDMk6nXe6Ug/mOKvJzYTV5GKf47mEYQq77ufDmo5bMGKQebl12PSC
         GL657bWyU+O8AQMz9RmvbaWldao4LyaFp0UHR6hgG2HMNyq7M7hvnPZZtL8KtEjRxz9A
         BT99VOBgnRub34V38iHA+JQ7Xg6uVY7LogHibA9ePJDCwgdB+AH0dgDkc3Hbs4JFYbpu
         rzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756204781; x=1756809581;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aubxpbk2XtBhI4C5/n2BXN9jWVxK0FlxNqKl7ieYfbQ=;
        b=wD1ZPNRPEzVPUOZ5ZxzgNDOUcZdzjAbAgqZ+FScirI0qHvFSroD46K1uBaX8bcylHx
         Kk9sYrHMlOP/thhbM5/QcCZthMVanR3bLqW7yfm9Qo6f3ipK0dvdsMc4ToOMfHmsawVN
         R/lU+bhfkuUEtvxdsIxvjB3g42JFuHxnAVFBn5zD6pcWmwDGiCNsDWIW9i24zrL7xnNf
         yWwidp6+vU+WWzrRHIXqKCsjvBwZgzYjik7mdK9au84VOa+w0dwERQAKY0JLOyvh+GL4
         zfPtO/oqdUoEtc/Az0FDXtrt1TPlUUx0OKk7oKbbinS2++xAWdwBU5Id01EGUDVzr89J
         ClpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxIpcwn3/PZJJMQTD+tsDcanM6TCIxz0JufX+iMh4a4J0kAff1t5KHXJMv03Z2gjp9sQpHg97BO88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNXMfHoafnCkcFtTSrpiEaE9sInUUH2GK0URskufNikLbL27+5
	p2ZBnlP+XSPesAokv8DtrrzkPcuuPdhg3NaNS+pQegLj8bOCdQbAMeC7zXcvK8YszAs=
X-Gm-Gg: ASbGncsBrDOMTJflnaA8wJAd/QZ9KVNwN2JJ5ygTrFBSZGte6x1hKkCEROeOoXsXEgw
	lxaypz/iBcvSf0pswD0hxcUom7RdR8K0X30j6t5TYANRNePq2reuMWWBUL0EVX4ApLjAPWHqZk8
	7hiGAla4llwx6uT/53y/9hfLpsGaXCZg8Lj/01JW1Cgf0GhjSTHIRF6eKkUB/jm56M9afdxf6BN
	sXcBmH4SbsVskdNVWNRo1+WIBZk5vDYpxA833HUrctpc9GaGtnQME/o+y5GMGG//ZPid521acGj
	F/QEMuh7mPhY4xp3+4zTcjL2+XjD9YRtz1MkCUbshtcb5KPKWirYrn2jRzAmy7w/3gUdcDTEOsb
	57QPJXM+ARvMfFHflhAH03y323FxGd7nqvq/odYDr6Z/OZa+e/bJ/IpST/OEpt0bu9twQv9iGKK
	DxZpNu8sLt29eFxwy1bZhoNkhFVW0HDFVL2A6K9YjQSkWsvjtpTh2JKjvJAQ==
X-Google-Smtp-Source: AGHT+IGTJ6kJcviN3gx0SsZhG3FYbsFiWuwc5ckYBN7HeTxHud9HajgH67qiuZuS9+NG+NFwi7i4Zg==
X-Received: by 2002:a05:6402:1d49:b0:61c:926e:24fd with SMTP id 4fb4d7f45d1cf-61c926e25dfmr1488413a12.34.1756204781534;
        Tue, 26 Aug 2025 03:39:41 -0700 (PDT)
Message-ID: <6eb60b62-bd3a-4a64-9665-fc911cc7d869@suse.com>
Date: Tue, 26 Aug 2025 12:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-6-jgross@suse.com>
 <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com>
 <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com>
 <2365af70-d36f-4663-b819-59d886936ef5@zytor.com>
 <8a82946a-6c3e-41d1-b3bd-be164dc6eeba@suse.com>
 <7047440a-0419-4982-961b-46f9b90a86e9@zytor.com>
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
In-Reply-To: <7047440a-0419-4982-961b-46f9b90a86e9@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RsLXUU2C1CGvpLiam006QHyM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RsLXUU2C1CGvpLiam006QHyM
Content-Type: multipart/mixed; boundary="------------qvfxUhM9j5tB42NwHbcTZLzf";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6eb60b62-bd3a-4a64-9665-fc911cc7d869@suse.com>
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-6-jgross@suse.com>
 <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com>
 <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com>
 <2365af70-d36f-4663-b819-59d886936ef5@zytor.com>
 <8a82946a-6c3e-41d1-b3bd-be164dc6eeba@suse.com>
 <7047440a-0419-4982-961b-46f9b90a86e9@zytor.com>
In-Reply-To: <7047440a-0419-4982-961b-46f9b90a86e9@zytor.com>

--------------qvfxUhM9j5tB42NwHbcTZLzf
Content-Type: multipart/mixed; boundary="------------yvNIYITvDlrd0dF2hWkwHAja"

--------------yvNIYITvDlrd0dF2hWkwHAja
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDguMjUgMDM6NTQsIFhpbiBMaSB3cm90ZToNCj4gT24gNi8xMS8yMDI1IDU6NTgg
QU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJJ20ganVzdCBkb2luZyBhIFYyIG9mIG15
IHNlcmllcywgYnV0IHRoaXMgdGltZSBpbmNsdWRpbmcgdGhlIGFkZGl0aW9uYWwNCj4+IHN1
cHBvcnQgb2YgdGhlIG5vbi1zZXJpYWxpemluZyBhbmQgaW1tZWRpYXRlIGZvcm1zLiBMZXRz
IHNlZSBob3cgdGhpcyB3aWxsDQo+PiBsb29rIGxpa2UuIEkgd2lsbCBkcm9wIHVzaW5nIHRo
ZSBFQVhfRURYXyogbWFjcm9zLCBidXQgZHVlIHRvIHRoZSByZWFzb24NCj4+IG1lbnRpb25l
ZCBhYm92ZSBJIHdvbid0IHN3aXRjaCB0byB5b3VyIHZhcmlhbnQgY29tcGxldGVseS4NCj4g
DQo+IEhpIEp1ZXJnZW4sDQo+IA0KPiBEbyB5b3UgaGF2ZSBhbnkgdXBkYXRlIG9uIHRoaXM/
DQoNCkkndmUgYmVlbiB2ZXJ5IGJ1c3kgd2l0aCBvdGhlciBzdHVmZiAoZG93bnN0cmVhbSwg
c2VjdXJpdHksIC4uLikuDQoNCkluIGJldHdlZW4gSSd2ZSBiZWVuIHdvcmtpbmcgb24gdGhl
IHNlcmllcy4gSSBob3BlIHRvIHBvc3QgaXQgc29tZSB0aW1lIGluDQpTZXB0ZW1iZXIuDQoN
Cg0KSnVlcmdlbg0K
--------------yvNIYITvDlrd0dF2hWkwHAja
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------yvNIYITvDlrd0dF2hWkwHAja--

--------------qvfxUhM9j5tB42NwHbcTZLzf--

--------------RsLXUU2C1CGvpLiam006QHyM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmitjuwFAwAAAAAACgkQsN6d1ii/Ey/W
VAf/bjOTfxBU5Ic3yxL8cIuWVKFrTuMx8Ynv73k4yHoMT//hTOT0Zeu6iqflODNSpNHcSDDpylbo
u5sZa0LLFzmKhpQGLF8+5RsnWrYCqMNydpYVbs9vCXf9VOl/QDrKBXIUo4KBzrhIIO6+SLzc1HcV
UrVnidE37h8kuKWvIgPTrHdzP81NAg3Nq/AMLccIGowCHmFAWjo49D9x57tfTirIZH3KzZzSYKeQ
/LjQtYhJx5bIQQ/fNns+bkx/uKUVAElX0VUf/B7KaPmsE3zg4hV/w/KDixyfeJFJNHthxrffaSH6
qSKMNizNhEdUMq2TEBSIu9QA7VukkUKXXVuaPop1lA==
=J7f0
-----END PGP SIGNATURE-----

--------------RsLXUU2C1CGvpLiam006QHyM--

