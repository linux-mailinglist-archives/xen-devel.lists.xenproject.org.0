Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA33B13BA1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061525.1427122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugO6q-0000Is-Qp; Mon, 28 Jul 2025 13:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061525.1427122; Mon, 28 Jul 2025 13:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugO6q-0000G4-Nh; Mon, 28 Jul 2025 13:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1061525;
 Mon, 28 Jul 2025 13:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugO6o-0000Fy-Qo
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:41:42 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978a76fb-6bb8-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:41:41 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae3cd8fdd77so926210266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:41:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a6600bsm415271966b.74.2025.07.28.06.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:41:40 -0700 (PDT)
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
X-Inumbo-ID: 978a76fb-6bb8-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753710100; x=1754314900; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hIMYhKZwO/dxenmgr4JkdJGZJBh8WCjhJ+UAW9vb98Q=;
        b=AMc35HXf9a27sjhWNA21QoLd7xKblWPaz2IrxzgLopKUUZWVuy1ZnAiDAaG6x7gi/M
         BqwSeTEYQeuX0qcsjDNWm5PFrH4mgQV0we0HU9BkMW9s4jtovc/xmgGt9NrUS4YXS/xS
         TnRK9DDSIf0igCq2Dpm1BRA8FiElbRocyZaEdfuzcusYFtak4FKD9VnnGzJd2/546vZZ
         BJ4by5IJmuHCnpPX5PBemnYoXqdb59IViVDaHiOHwrvInjPdF57y8ccT40GfwHCWn7gQ
         20r/Xb5Aljj7RMOprej/1macVpN9F+eFzeN62EmOzSUQ1YkuPAjfF4zJlrN1/3AQ3mJD
         osgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710100; x=1754314900;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIMYhKZwO/dxenmgr4JkdJGZJBh8WCjhJ+UAW9vb98Q=;
        b=gQLPW70kSYFmO98fe/Ga7T1VbPQxJv/FUfYRdPRh4qQAgOZ+1cnUhSXJ9I1oAsbsRb
         eemm+zhundAzLzzRweYZWYBIoT7fTlv1AWgVR0Z8drP04nvjJSJAZ2rTnfzkX/Pg3OZ8
         tFTB3PZDm3kmFaeUgJVrTZr7DKTaWsEeUWEL41JUEfn+VI0y5CjRUufeeLBeYpufQceW
         YXUafsl6GTxO46VKkRw+52/9ZUGHZFxr1kwD0F4DOqMh7pKGKcIzw7Yi9ybZ3pN2hDmU
         bYmvcAlZ8JwMmrFNOlLkTmInwXszzGGUkaimvFw9sZ210kHRoZo9FXrU+6Me/uu0TtbL
         YmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0oEjDUcumDt8XqgsbUE4w3tDocPSE4LE8J4+edAHBTSqBvLntf/BCS0q0IHMZXJ+odyBZfc8CEWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQefL/coR3qR/cy+psCpK+y+2fHH/6ed4hCM43ENBFwrxDeYEH
	QNqSmtkSET4RyqB5eWptI4+DPPK3lnQjjqPHG8oHDaAsRIGBLpEZwz+SrpqT5hvvsgU=
X-Gm-Gg: ASbGncu+WaBEyEPDQJNERG/IguIVbwHWguy6JYNGboB3J4lzjI2yFEWNFuFMZeiUstB
	QOzOy/9mZWq5RbC8Q235icBC5+vLu7tWfKKB3OerVmB2fOJ55hVDcvrxjXZpV6FsXv9TVix9TfI
	//FyZJsESq/B3Kq6tcXabqM0QkmIyZPVYPnJDw/Ouf/vMfs/j2J5bAYo/AeQxz1WLU3YK5Ww0zP
	GNpQ66R9asZtwHYJAzMoSLecSWikOBDWVaSy/+zBQlfx+GTPHsMvuWY1x9GSt7Adw2t/8Ry4vv+
	iSZ6xKBRlDaqYgHuVV9dkvguIZXPqij8swvZ6BvdV4JK2WCnD5FPLNw2eZmgrW5E75u+Wjrs4wS
	Nwx6I3RmExwtoJJdKh8E161rD+fFpYP7z3TpyPFvyhHVLtIybomk70Lt2LvdbI+ADI1JJMRw77R
	3HGpqkwSf9q22QHFPb1/PnUSzLowpoPwPEb5QXm/Cr9pOIvQDTNF2u
X-Google-Smtp-Source: AGHT+IHacrAMokw6TgyArVgrm39ElZjfCJ8SauB3qkhyDDhm4gulolH2qyLF2DnoLXNTsLasIN1qQA==
X-Received: by 2002:a17:906:6a2a:b0:af2:42e8:ad92 with SMTP id a640c23a62f3a-af61f11955cmr1388172466b.61.1753710100318;
        Mon, 28 Jul 2025 06:41:40 -0700 (PDT)
Message-ID: <705b65e0-5c82-4a9e-9737-08ed3f88c34b@suse.com>
Date: Mon, 28 Jul 2025 15:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] tools/xenstored: Add get_domain_evtchn() to find
 evtchn
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-7-jason.andryuk@amd.com>
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
In-Reply-To: <20250725235858.666813-7-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gKTdcQ0W0v4ZUWZPmx3jQRwL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gKTdcQ0W0v4ZUWZPmx3jQRwL
Content-Type: multipart/mixed; boundary="------------AQVjSTpv6ADdzD0u27GDivxP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <705b65e0-5c82-4a9e-9737-08ed3f88c34b@suse.com>
Subject: Re: [PATCH v5 06/11] tools/xenstored: Add get_domain_evtchn() to find
 evtchn
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-7-jason.andryuk@amd.com>
In-Reply-To: <20250725235858.666813-7-jason.andryuk@amd.com>

--------------AQVjSTpv6ADdzD0u27GDivxP
Content-Type: multipart/mixed; boundary="------------7Ukp7CigZyKNQ6RcuVM4wQQ5"

--------------7Ukp7CigZyKNQ6RcuVM4wQQ5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjUgMDE6NTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IEFkZCBoZWxwZXJz
IHRvIGxvb2t1cCB0aGUgZXZlbnQgY2hhbm5lbCBmb3IgYSBkb21pZC4gIFRoaXMgaGlkZXMg
c29tZQ0KPiBvZiB0aGUgZGlmZmVyZW5jZXMgYmV0d2VlbiBkb20wIGFuZCBzdHViZG9tIHhl
bnN0b3JlZC4gIEVhY2ggdmVyc2lvbg0KPiBkZWZpbmVzIGl0cyBvd24uDQo+IA0KPiBJdCBo
aWdobGlnaHRzIHRoZSBkaWZmZXJlbnQgbWVhbmluZ3MgYmV0d2VlbiBnZXRfeGVuYnVzX2V2
dGNobigpIGluIGENCj4gc3R1YmRvbSwgd2hlcmUgaXQgbG9va3MgdXAgZG9tMCdzIGV2ZW50
IGNoYW5uZWwsIGFuZCBkb20wLCB3aGVyZSBpdA0KPiBsb29rcyB1cCB0aGUgbG9jYWwgZXZl
bnQgY2hhbm5lbC4NCj4gDQo+IGdldF9kb21haW5fZXZ0Y2huKCkgcmVwbGFjZXMgZ2V0X3hl
bmJ1c19ldnRjaG4oKSwgYW5kDQo+IGdldF94ZW5idXNfZXZ0Y2huKCkgaXMgcmVtb3ZlZCBm
cm9tIG1pbmlvcy5jIGFzIGl0IGlzIGlubGluZWQgaW4gdGhlIG5ldw0KPiBmdW5jdGlvbi4N
Cj4gDQo+IFRoZSBkZWZhdWx0IHJldHVybiAwIHdpbGwgYmUgZmluZSBhcyBhbnkgb3RoZXIg
YXV0by1pbnRyb2R1Y2VkIGRvbWFpbg0KPiB3aWxsIG5lZWRzIHRoZSBldmVudCBjaGFubmVs
IHBvcHVsYXRlZCBpbiB0aGUgZ3JhbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBB
bmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------7Ukp7CigZyKNQ6RcuVM4wQQ5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------7Ukp7CigZyKNQ6RcuVM4wQQ5--

--------------AQVjSTpv6ADdzD0u27GDivxP--

--------------gKTdcQ0W0v4ZUWZPmx3jQRwL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHfhMFAwAAAAAACgkQsN6d1ii/Ey9g
8ggAmW8uu3QFnSLqAMIO/tPaB+UAOMOmbgdrtWs/ZJN71a9RXhYIDVrIiNWm3/vIV5Sv46VTqWuo
1JIzTnD1gW48TwpRNkywq93jDS+qOvoFyB4IoLxuGdgTcFRI5tg4WPphoeaHt0al9Dy/Y6SryvhV
YJFWUaUt42UvDqz7x1kxBBBYv99EiWE4w/PqjFMouuUKIKgRbcuCS7w1OJrZOmGSNZzHxpxcK6x2
6kkMHzv4GIloS/jQMfeIEVmpombA0Oou9shwk4rDXzJ3dbmVzNCib4qRwrX8LFcNW3a0U0tK+QyK
7xyRfhOj3cv9LlEUVVqR64YX3XmoLiORo8QgsCowhA==
=qmje
-----END PGP SIGNATURE-----

--------------gKTdcQ0W0v4ZUWZPmx3jQRwL--

