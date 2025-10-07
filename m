Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D7BC1044
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 12:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138654.1474298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v64x5-0007qZ-FX; Tue, 07 Oct 2025 10:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138654.1474298; Tue, 07 Oct 2025 10:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v64x5-0007o9-Cn; Tue, 07 Oct 2025 10:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1138654;
 Tue, 07 Oct 2025 10:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xa6/=4Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v64x4-0007o3-1b
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 10:29:50 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d17c501-a368-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 12:29:48 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso49334375e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 03:29:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa57320easm9757245e9.0.2025.10.07.03.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 03:29:47 -0700 (PDT)
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
X-Inumbo-ID: 8d17c501-a368-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759832988; x=1760437788; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2eWusZcNpKtVq5dW80GDrMQQTVeegrdo963Cy6rWQoU=;
        b=RN2/XS642qoBCI1UvGHxPHL2bgMspFuIR0lVr5SP9JGJ7oGxtuHTFbLz0MOPFRaRam
         lGVExrHAd60bWWa4KFEwGh7SeJq8e9bQ43uszsmmGgkT5XJ/0Qokhq0hRhIpeRIiWa2F
         20Jm/LqQ6Kkkru+h5GeAGEEaF75CdFWWCFAztyagM1lFZtDbXf/v8T0QRQdZgItNhzV5
         NjOiz16fCoODPWowsmWQ7LLKFXChx8TYP0hnXKBcCnTFj3nFVgQmnVkVhN9yGn7/YEXX
         WZeHUUqD42B5IWuB6c9KRTzs1oow/PjNInXsrIg7qsXiryQZ46l/2swOWn6XKAVbsxFd
         Cv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832988; x=1760437788;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eWusZcNpKtVq5dW80GDrMQQTVeegrdo963Cy6rWQoU=;
        b=gWRf5WslIfzuaQu19sK7r2rv1dMpsZt4rUO451dVs/VlK6a2Hv/xLbTGSjsrgZfE5D
         qUC7nrgGI8Foyj5xSyp5jzpd7QHn6MG3ChY16YmjrAsSIkEx8285TpJeLgN+SL8h739q
         cNTR65yCxcXembvilpAT50cAuu7FtsNu7wZe9uPmA27avGVXXx7U+YHXwWJb/dFhw66R
         5ufUoY5jJknL/9TZoZykMLfQnPcDtN/PeKjTs2A8yKeebkFWww1RppFx7baSYqMJqai2
         pgKiEG0F+juJPMKcEY/duZ30xVXeqTX16u+I6Y+jF8NiHf8h90V24rKQU0xj0RClYJEV
         3NXw==
X-Forwarded-Encrypted: i=1; AJvYcCX4pVMy950C3w7jBmU7Io/BXCiZu6PvBcMW9HS/4lk5giFoOM4WaZJ/V0xjb8j33J8BeM6qz1QJzaU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0CpkNfhFhX98oRh+w9rTv2RL4HfrMosYPPRd0n499K9gAMr8l
	qV/7YPy9bbdaWNrVl/j+R5J7B4UwabSNNKN86FLBtUMTB8EM1l6fodjea4k9ewZzEVo=
X-Gm-Gg: ASbGnctZuQFtWsjH7bkOhVYMSiXR2ptBCebpP8tTobKBW1Fisf2eFkvlIS/iHMqAftc
	kbFEvUr30u3C24UVBNPVa63IS2Su+mKIC5tYc4cu+3d/xu9Qvc5EuIrnLkWistEfbQ0OFsDRWJC
	S2OSP01b7wVKR6KdlnCzykiEJFpV1XZGbeoKvpx03M+PK6aeKOieIxCS0Y8TY1L1YC9mMhY2Mqz
	bX0hdLu45Wa94xstHcNniMgEL6FbsBsbAdLLMXiPOelGNzOxc4Ex53PtqStPXk9g598hPdK2m4q
	55twIMq1RZ7jJl6YtHyfXXWGgDh3j9cmBDtR3LGG4fulA7FKZmI+1/6EbRYK+m5nF+db1wThzEW
	EN4acARrDjddwSD/yMxJer0GE2AoHMxgoU43tmIq0HwgigD2+5EKwh8dmDKPsL/RyMMq8ftoKlx
	rpvxgD2sr9/iU1fM2nZG3N9nL1LCmaR/ljKlkpJI1IFpDwY/9cfjxNapGpQ5Ei0nkUgO1L
X-Google-Smtp-Source: AGHT+IFa2wmYvLfiKrxFBSn1h4B2BMRTb9cpqLeRxxPX1xSIeF3qD23om02py09WujSEWEu+IDw9Hw==
X-Received: by 2002:a05:600c:8718:b0:46e:45f7:34fc with SMTP id 5b1f17b1804b1-46e711447d0mr95661935e9.29.1759832988302;
        Tue, 07 Oct 2025 03:29:48 -0700 (PDT)
Message-ID: <471cefb9-538b-478c-89ec-53ee0e6308b1@suse.com>
Date: Tue, 7 Oct 2025 12:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/21] x86/xen: Drop xen_irq_ops
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-16-jgross@suse.com>
 <20251006185553.GY3245006@noisy.programming.kicks-ass.net>
 <c8b3c9ea-8c6c-4ec2-b01f-df3f8f487a8c@suse.com>
 <20251007102106.GE3245006@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20251007102106.GE3245006@noisy.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U1jBHiYTk2zlPK0TSvoBtxCg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U1jBHiYTk2zlPK0TSvoBtxCg
Content-Type: multipart/mixed; boundary="------------YTRlFEGN0io5KG2aajn7lFXI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 xen-devel@lists.xenproject.org
Message-ID: <471cefb9-538b-478c-89ec-53ee0e6308b1@suse.com>
Subject: Re: [PATCH v3 15/21] x86/xen: Drop xen_irq_ops
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-16-jgross@suse.com>
 <20251006185553.GY3245006@noisy.programming.kicks-ass.net>
 <c8b3c9ea-8c6c-4ec2-b01f-df3f8f487a8c@suse.com>
 <20251007102106.GE3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20251007102106.GE3245006@noisy.programming.kicks-ass.net>

--------------YTRlFEGN0io5KG2aajn7lFXI
Content-Type: multipart/mixed; boundary="------------MyW1CCs8heR21w9nT0Sq8wSZ"

--------------MyW1CCs8heR21w9nT0Sq8wSZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTAuMjUgMTI6MjEsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiBPbiBUdWUsIE9j
dCAwNywgMjAyNSBhdCAwOTo0Nzo0OEFNICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
Pj4gT24gMDYuMTAuMjUgMjA6NTUsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPj4+IE9uIE1v
biwgT2N0IDA2LCAyMDI1IGF0IDA5OjQ2OjAwQU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+IEluc3RlYWQgb2YgaGF2aW5nIGEgcHJlLWZpbGxlZCBhcnJheSB4ZW5faXJx
X29wcyBmb3IgWGVuIFBWIHBhcmF2aXJ0DQo+Pj4+IGZ1bmN0aW9ucywgZHJvcCB0aGUgYXJy
YXkgYW5kIGFzc2lnbiBlYWNoIGVsZW1lbnQgaW5kaXZpZHVhbGx5Lg0KPj4+DQo+Pj4gU2Ft
ZSBjb21tZW50IGZvciB0aGUgbmV4dCBmZXcgcGF0Y2hlczsgdGhpcyBjaGFuZ2Vsb2cgaXMg
YSBsaXR0bGUgbGlnaHQNCj4+PiBvbiAqd2h5Ki4gSSBtZWFuLCBJIGRvbid0IG1pbmQgdGhl
IGNoYW5nZSwgYnV0IHN1cHBvc2VkbHkgd2Ugc2hvdWxkDQo+Pj4ganVzdGlmeSB0aGluZ3Mg
YXQgbGVhc3QgYSBsaXR0bGUsIHJpZ2h0PyA6LSkNCj4+DQo+PiBXb3VsZCB5b3UgYmUgZmlu
ZSB3aXRoIHRoZSBmb2xsb3dpbmcgYWRkaXRpb246DQo+Pg0KPj4gICAgVGhpcyBpcyBpbiBw
cmVwYXJhdGlvbiBvZiByZWR1Y2luZyB0aGUgcGFyYXZpcnQgaW5jbHVkZSBoZWxsIGJ5DQo+
PiAgICBzcGxpdHRpbmcgcGFyYXZpcnQuaCBpbnRvIG11bHRpcGxlIG1vcmUgZmluZSBncmFp
bmVkIGhlYWRlciBmaWxlcywNCj4+ICAgIHdoaWNoIHdpbGwgaW4gdHVybiByZXF1aXJlIHRv
IHNwbGl0IHVwIHRoZSBwdl9vcHMgdmVjdG9yIGFzIHdlbGwuDQo+PiAgICBEcm9wcGluZyB0
aGUgcHJlLWZpbGxlZCBhcnJheSBtYWtlcyBsaWZlIGVhc2llciBmb3Igb2JqdG9vbCB0bw0K
Pj4gICAgZGV0ZWN0IG1pc3NpbmcgaW5pdGlhbGl6ZXJzIGluIG11bHRpcGxlIHB2X29wc18g
YXJyYXlzLg0KPiANCj4gWWVzLCB0aGF0J2xsIGRvLiBUaGUgbGF0dGVyIGJlaW5nIHRoZSBt
YWluIHJlYXNvbiBpbiB0aGlzIGNhc2UsIHJpZ2h0Pw0KWWVzLg0KDQoNCkp1ZXJnZW4NCg==

--------------MyW1CCs8heR21w9nT0Sq8wSZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MyW1CCs8heR21w9nT0Sq8wSZ--

--------------YTRlFEGN0io5KG2aajn7lFXI--

--------------U1jBHiYTk2zlPK0TSvoBtxCg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjk65sFAwAAAAAACgkQsN6d1ii/Ey8h
kwf8DMv6TrAfRDqkPlGigKAPtzs+D+AMKXnwnufPoI9OHHcnbakkMxxuivzJhEuIapKEK5ZbSIZX
lq+044LMMvHd4md4tqEWxfCvbFbnMSMWaGbDhcQtEYpxCoKn0vf36a5uwiHGI5EZPOWoirWPAwkh
k+a749JwjiESx8Fe8qMwyBe1GQ5Rk98MyXuDz4F/0XhEMB/9Q5GMsNces73ZNGKc/YtfQtWzVcmp
l68PEO9NZMWsAfnk20gKvv9pZRAHnbFWrOXCh8yQsAtTCR1/8u0eE1CBw8MRG387UgITlayzN6wY
Bh9z2fEMyhPqwdpj7t5tt7H3Oijra5Cg8GhjS7Snww==
=9asZ
-----END PGP SIGNATURE-----

--------------U1jBHiYTk2zlPK0TSvoBtxCg--

