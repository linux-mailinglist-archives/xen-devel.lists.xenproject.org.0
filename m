Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8ABC0842
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 09:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138577.1474245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v62QM-0003gn-Oa; Tue, 07 Oct 2025 07:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138577.1474245; Tue, 07 Oct 2025 07:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v62QM-0003ep-Lv; Tue, 07 Oct 2025 07:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1138577;
 Tue, 07 Oct 2025 07:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xa6/=4Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v62QK-0003eh-LW
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 07:47:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecf2a1da-a351-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 09:47:51 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so4987064f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 00:47:51 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f02a8sm24679373f8f.39.2025.10.07.00.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 00:47:50 -0700 (PDT)
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
X-Inumbo-ID: ecf2a1da-a351-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759823271; x=1760428071; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k/p5ADZ2lv1Ra1rAUAPzE5QTwOBMFVb5bRE4x81ZObQ=;
        b=CcxhG/z8drO5m44Afph7enptYlve0yXCQuRGnzNQyBswsQed4gVXR/PzGv19W8WjRZ
         lXtgQbypu4OnKBzjHsg5wVyUgVOmabfjT6vZd5oC7yW/7HgY4LCbDA7lkzLMWBMx9TZz
         G3blKD7aY1e8F5lf6zTW6vQZT9eMbTDaw2lZ+IRAoUb1/MbwyzFEoAFfE9d0m1654VOu
         jkEszJkNp3+SiliC6QIA0EoHdXseTeTH2G61jyFMX4fuNt1AyDmP+7oUk68sG8ut7XpV
         DmHt1WQikGJlUQT6fpldabyfk+2l+Dja9hkpkUv9+JUFmmNPxEJQIx84sknwRBok0VZZ
         PCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759823271; x=1760428071;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/p5ADZ2lv1Ra1rAUAPzE5QTwOBMFVb5bRE4x81ZObQ=;
        b=ZupkGqAugMhGqRn43QOqU5CnXN2qV8arAl0q9aVj49yOnmZBi25qYnZRtil+FbzOL5
         H5APNmexGtldEtk3wVKj+BaD/wqdfBAPFMpjc/w92rMS7NhN5fG5m9s4ZVizhcx8rBM+
         AM65UdEox11XbIDyozLIp0h4lZwBnOx6+vqeq0XN0dN+gW8l6HRj/FLR7QrgrFgq4no2
         Y3cbDM3VOHpizSB3AqjSlOtRglOic8vMu5vY9Axe3fpONnZNXy4ExNyc64INhmp1kstP
         60WP3B7uuaaukW+SOwPPJDH4Tx0JqFOG7MIaAkLGOSS9c4iGM5HMCWgzQ1TCdoJe7ujM
         U2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXrFSxT/SAOswzNlMQ0Rb+16i5jiNF76q+2vEFWxFYu5qdXNP/fQHxoYIuU0iF1BpYyxluW8ER2mM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4ILLYuMyDfBangnuUU0uLb+ofKM1sBkCFeJks+jnUauwMTMBc
	3pyCX9cLxLz5eqjuSYYbjUu+WcHl6tElHghPRIyWiOj50T+pxnJOiU0W3zRkAKQ2oO4=
X-Gm-Gg: ASbGncvYyHoKC+6UbPs4tvew6q0L7c+taN+s6Yd1iHkgit3mwTk/3sgA9zK7SXOtowi
	jlBmcf1TjnbgKNEh3vSQSXkmB7A8Bsn8AtL80UpUi9zdIxizyIO9xaKjJcWAXS1DQzpwCRnr4v3
	6S6mV7dF0U4cv060ReFk1y+wOPJTHdBJ+wkvoEIspuBOOi2IFtNU6X8NsD22/b/j8ZptLwpZdJF
	L4leTHaPo1PrH7kcn4ca1FC0n4fvVRUYZLrDwT1X6D6SHfhGya6LQyxlgrMcqsjOetQLz4B9bu8
	dOt3Vnyi7ywGeH19z3EBJ3Zit/Lty1IFD3mPLblcFXSKhI0Ci7Rmy45RSAcHk6/VVtv2jPkCRDL
	iNjZCfdKvtPK3N0A/NUzcr5eIz1UXv2O6a5ez/jCMkhQifq1A/SlS4jesTcqcoqvQ1RAZKusRhi
	QcfdbNyl67k8ucMrGQLWpOatXlZHZHtNXtJ0F5UBkHJiJj2lUkS12zmenMEt/eJM2GPfY7
X-Google-Smtp-Source: AGHT+IF7j7vgadOKluBSN0/KXTiMPvXegbfquXD7I/Hv3CcEjCs6Sc9oBKKDinDjZBC8ijVyIMq0Yg==
X-Received: by 2002:a05:6000:310d:b0:3eb:a237:a051 with SMTP id ffacd0b85a97d-425671c1ba2mr9319409f8f.58.1759823270615;
        Tue, 07 Oct 2025 00:47:50 -0700 (PDT)
Message-ID: <c8b3c9ea-8c6c-4ec2-b01f-df3f8f487a8c@suse.com>
Date: Tue, 7 Oct 2025 09:47:48 +0200
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
In-Reply-To: <20251006185553.GY3245006@noisy.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kV0mAlugWKvTu66dwLdSIAs6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kV0mAlugWKvTu66dwLdSIAs6
Content-Type: multipart/mixed; boundary="------------ZACIU0EGJTA0jVCHyCq5ivyT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 xen-devel@lists.xenproject.org
Message-ID: <c8b3c9ea-8c6c-4ec2-b01f-df3f8f487a8c@suse.com>
Subject: Re: [PATCH v3 15/21] x86/xen: Drop xen_irq_ops
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-16-jgross@suse.com>
 <20251006185553.GY3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20251006185553.GY3245006@noisy.programming.kicks-ass.net>

--------------ZACIU0EGJTA0jVCHyCq5ivyT
Content-Type: multipart/mixed; boundary="------------XyJh0KFbIzewTUdUA9FxJ1fL"

--------------XyJh0KFbIzewTUdUA9FxJ1fL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTAuMjUgMjA6NTUsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiBPbiBNb24sIE9j
dCAwNiwgMjAyNSBhdCAwOTo0NjowMEFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gSW5zdGVhZCBvZiBoYXZpbmcgYSBwcmUtZmlsbGVkIGFycmF5IHhlbl9pcnFfb3BzIGZv
ciBYZW4gUFYgcGFyYXZpcnQNCj4+IGZ1bmN0aW9ucywgZHJvcCB0aGUgYXJyYXkgYW5kIGFz
c2lnbiBlYWNoIGVsZW1lbnQgaW5kaXZpZHVhbGx5Lg0KPiANCj4gU2FtZSBjb21tZW50IGZv
ciB0aGUgbmV4dCBmZXcgcGF0Y2hlczsgdGhpcyBjaGFuZ2Vsb2cgaXMgYSBsaXR0bGUgbGln
aHQNCj4gb24gKndoeSouIEkgbWVhbiwgSSBkb24ndCBtaW5kIHRoZSBjaGFuZ2UsIGJ1dCBz
dXBwb3NlZGx5IHdlIHNob3VsZA0KPiBqdXN0aWZ5IHRoaW5ncyBhdCBsZWFzdCBhIGxpdHRs
ZSwgcmlnaHQ/IDotKQ0KDQpXb3VsZCB5b3UgYmUgZmluZSB3aXRoIHRoZSBmb2xsb3dpbmcg
YWRkaXRpb246DQoNCiAgIFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gb2YgcmVkdWNpbmcgdGhl
IHBhcmF2aXJ0IGluY2x1ZGUgaGVsbCBieQ0KICAgc3BsaXR0aW5nIHBhcmF2aXJ0LmggaW50
byBtdWx0aXBsZSBtb3JlIGZpbmUgZ3JhaW5lZCBoZWFkZXIgZmlsZXMsDQogICB3aGljaCB3
aWxsIGluIHR1cm4gcmVxdWlyZSB0byBzcGxpdCB1cCB0aGUgcHZfb3BzIHZlY3RvciBhcyB3
ZWxsLg0KICAgRHJvcHBpbmcgdGhlIHByZS1maWxsZWQgYXJyYXkgbWFrZXMgbGlmZSBlYXNp
ZXIgZm9yIG9ianRvb2wgdG8NCiAgIGRldGVjdCBtaXNzaW5nIGluaXRpYWxpemVycyBpbiBt
dWx0aXBsZSBwdl9vcHNfIGFycmF5cy4NCg0KDQpKdWVyZ2VuDQo=
--------------XyJh0KFbIzewTUdUA9FxJ1fL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------XyJh0KFbIzewTUdUA9FxJ1fL--

--------------ZACIU0EGJTA0jVCHyCq5ivyT--

--------------kV0mAlugWKvTu66dwLdSIAs6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjkxaUFAwAAAAAACgkQsN6d1ii/Ey8E
Cwf9Gcgfd1x4B7+Mo8ZdGuhc8lobyDPfpsiiCxXV+e8HlqHCwlRpw7VCHX10o6HhZJ9pdozRxQLh
FADvUd1bszJv8JAcGdyHv3c7TrX0MPni1OrYMBP9qez7n4UP0UHoo0lnlEkiAWxvfA2jepD2ffRY
E1/0uyIf0HXFoYuchbP7msyGdX0vXdT7kQ7diYRzKK7v9SbMP3rEGnMgMs9MlCfz+PglDqtr6ugF
pcPZC7EBnvqy/BRIs0RU17uSl6n/Tk6B+bi/Ds7iQSbdgG6kp6AQiX00okJ6wVxkKbC5QYor3QsU
hF7Fw0gqJugqiYIPBs9lTnZcafQQZta9753tkHgJyw==
=FFyy
-----END PGP SIGNATURE-----

--------------kV0mAlugWKvTu66dwLdSIAs6--

