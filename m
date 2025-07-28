Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C06B13C1E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061572.1427181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOKh-0004nk-3q; Mon, 28 Jul 2025 13:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061572.1427181; Mon, 28 Jul 2025 13:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOKh-0004mD-19; Mon, 28 Jul 2025 13:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1061572;
 Mon, 28 Jul 2025 13:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugOKf-0004iz-DK
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:56:01 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97270aac-6bba-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:55:59 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae0dd7ac1f5so898508166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:55:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af63589cc5asm419134366b.32.2025.07.28.06.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:55:58 -0700 (PDT)
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
X-Inumbo-ID: 97270aac-6bba-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753710959; x=1754315759; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SE8wMlSzWh+yENpWvllFMIZRpH1fSkvD6Z6lwDD6DHs=;
        b=a58DaXFmOguzAtSYp0rHFeWmk4hEjo+pPprWj+9wNP2gjARDZYMZY4P9/bmDu+WrrR
         L9+z3LGg+IjM5FgPIEJRsy7Ws6eGFYSeWZAQg+wkIAk1tw2tnvwHxj7sOLV5gkewA0O9
         zfStmjmEbWH9HuEdTDThjDO/dgY0sKa5D0MvtJsXr0eu1HyOCyFogW3vt7IMM1jlMDJi
         4UkGQOuXYgXmhRyF+LzEamCC3Zh9/7uKhuhlH+T+ATMt9M6xfP4vl5vhmckM8nkuwAs5
         sieguEHILGoOBw9r1XpK6Eyap1Er37ZV/cUQzoUWVCTCmgY0B3z6ws725ReUY8weCI0T
         DYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710959; x=1754315759;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SE8wMlSzWh+yENpWvllFMIZRpH1fSkvD6Z6lwDD6DHs=;
        b=tQyG5V5MLoSRTjoo7+DAo/L5MIQeWTEqmCSGnKc+iv7i7Ktkqq2eX8mRe5zGVyIWfG
         3z0vPKAvPUvx21oQKunF3sBumaiH1xwskpTbOhpGLl5S/WsuBCU/71R1ROJ9WZjIPaf7
         uIpEqnQTDaXVHkbhFDRN+p6w4+BrbHCDHtKD/Dp7qKb61RgeGls5lDPLX2YJbGCsrctL
         80Hcfij5tuOSJ+aGjD+JCsL5sR3NoemFkzYYeUqfYXDC84z3NkW5TREOhwnlPgXRDi3s
         4JcUNV/MiotPSj4CjqHg4aTmVlD5oW3YpB9/yr9lIEiUkkLhY9+m66JdqqmLkCV6cTNk
         NAYg==
X-Forwarded-Encrypted: i=1; AJvYcCWIo0fs4r3tBkti1uL/FXPs12VWc/EMplskxA3DY/KjrsurwdiqX9fS3QmXYam5puYn4h7OA8RzsLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlcfpO8Xeo8N63sp5dD7G5c6ICNF58bL3HYeCp9d2AnsO8Ctx+
	hPbyIJNcH3yJzlAan3C4QZVsimfCb1j+itqARFF/wmbb9y1jddOA25lvuPXC9+V5eT/OcGZovW6
	O5mV7EWY=
X-Gm-Gg: ASbGnctg1xk7xuI0WnJIciosGXHb9gJAGJPFLANdNej48cFpkJJQryDLA9XvgCPautJ
	xo/xT2h3IZvx21tVbob9UvYC5wNr0DsZHbBNgTuFVAEfWGNd2oF6//mLWv6nK/1iECDh4kAO5Bb
	R0HECwNgvrjajVkANDDlZACFgvWuwRVvsXPOTya51aElDWAZeIemLK1w1K3ANooUwaK0/I+DZuy
	7BfF72sAwJ1rQvxa5MGxNCaitukkve9LVLEGXxQeATQ/Spt98HP2wQwKM8nXqbJnR5qSbOMCH1H
	Iqx9zcUMJSzyeIHMf8Yfik7ty4oXiWbolcJAWUBv1eqvI27wlKGla3wT4AyDprXURfPny+uqK4I
	0EpgsNHdzShhXhokG4tDPApdNqPaQCuHFQnRv8foX14TXFukL/J4dN10Pevs/+mHBcdQB1ZzLtw
	nXyRD9wsQX5vluOzIF5M18ReI2p+Pm958w/cBjc2TIfQ==
X-Google-Smtp-Source: AGHT+IEhpcODgtIc523ciilCaqUhTj2CSN2ET7BL9/2hS3/NzQmpptgFVGQzi5biwkV0GKNIsPWCtA==
X-Received: by 2002:a17:906:d54a:b0:ae0:ce90:4b6c with SMTP id a640c23a62f3a-af619815afcmr1401693566b.49.1753710958671;
        Mon, 28 Jul 2025 06:55:58 -0700 (PDT)
Message-ID: <a6576dce-83c1-4321-978b-02e5d04b3e95@suse.com>
Date: Mon, 28 Jul 2025 15:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] tools/xenstored: Rename dom0_domid to
 store_domid
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-10-jason.andryuk@amd.com>
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
In-Reply-To: <20250725235858.666813-10-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9hNj1UWsFYtKYnR6rWSroe6p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9hNj1UWsFYtKYnR6rWSroe6p
Content-Type: multipart/mixed; boundary="------------JLvPw1CeH0j10FK0QPaLySlC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <a6576dce-83c1-4321-978b-02e5d04b3e95@suse.com>
Subject: Re: [PATCH v5 09/11] tools/xenstored: Rename dom0_domid to
 store_domid
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-10-jason.andryuk@amd.com>
In-Reply-To: <20250725235858.666813-10-jason.andryuk@amd.com>

--------------JLvPw1CeH0j10FK0QPaLySlC
Content-Type: multipart/mixed; boundary="------------UxMI1a6XnmZ3tq78smzJpna3"

--------------UxMI1a6XnmZ3tq78smzJpna3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjUgMDE6NTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFRoZSBkb20wX2Rv
bWlkIHZhcmlhYmxlIGlzIG1pc25hbWVkIGFuZCBjb25mbGF0ZXMgcHVycG9zZXMuICBJZiB3
ZSBoYXZlDQo+IHhlbnN0b3JlZCBydW5uaW5nIGluIGEgTGludXggZG9tYWluIHRoYXQgaXMg
bm90IGRvbTAsIHRoaXMgdmFyaWFibGUNCj4gY29udHJvbHMgdGhlIGxvb2t1cCBvZiAvcHJv
Yy94ZW4veHNkX2t2YSBhbmQgdGhlIGV2ZW50IGNoYW5uZWwuDQo+IA0KPiBSZW5hbWUgdG8g
c3RvcmVfZG9taWQgdG8gYmV0dGVyIHNob3cgaXRzIHB1cnBvc2UuDQo+IA0KPiBPbmUgaW1w
bGljYXRpb24gb2YgdGhpcyBjaGFuZ2UgaXMgdGhhdCB0aGUgeGVuc3RvcmUgZG9tYWluIGlz
IG5vdA0KPiBwcml2aWxlZ2VkIGJ5IHZpcnR1ZSBvZiBjb25zaWRlcmluZyBzdG9yZV9kb21p
ZCBhcyBwcml2aWxlZ2VkLg0KPiANCj4gZG9tYWluX2lzX3VucHJpdmlsZWdlZCgpIHJlbW92
ZXMgdGhlIGRvbTBfZG9taWQvc3RvcmVfZG9taWQgY2hlY2ssIHNvDQo+IHhlbnN0b3JlIGRv
bWFpbiBpcyBubyBsb25nZXIgY29uc2lkZXJlZCBwcml2aWxlZ2VkLg0KPiANCj4gb25lYXJn
X2RvbWFpbigpIGlzIHVwZGF0ZWQgdG8gcmV0dXJuIEVJTlZBTCBmb3Igc3RvcmVfZG9taWQg
b3IgcHJpdl9kb21pZA0KPiB0byBtYWludGFpbiB0aGUgYWJpbGl0eSB0byBjYWxsIFhTX1JF
U1VNRS4NCj4gDQo+IHhlbmJ1c19tYXN0ZXJfZG9taWQoKSBpcyByZW1vdmVkIHdpdGggc3Rv
cmVfZG9taWQgYmVpbmcgdXNlZCBpbnN0ZWFkLg0KPiANCj4gQWRkIGEgZGVzY3JpcHRpb24g
b2YgdGhlIC1tLy0tbWFzdGVyLWRvbWlkIG9wdGlvbnMgd2hpbGUNCj4gZG9pbmcgdGhpcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1k
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cg0KDQpKdWVyZ2VuDQo=
--------------UxMI1a6XnmZ3tq78smzJpna3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------UxMI1a6XnmZ3tq78smzJpna3--

--------------JLvPw1CeH0j10FK0QPaLySlC--

--------------9hNj1UWsFYtKYnR6rWSroe6p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHgW4FAwAAAAAACgkQsN6d1ii/Ey9v
1gf/d2eNf/dyeOUs545RshYFqazdV0CbQg7z4sKth3nAnxytNlp6eu/rxhIcnZEj7HNsK2ebuHn5
k9Aap7bHRmUOatJ/1oNom+7RTI7m0d8EVeDGpIb8/oUwL/nlCtWQrlYgJlvllXD0ZRvyCMROQrK3
q/4ZaZX57Ej+IkfRbG8q+MVFXicPxSITRTrMlxmhN5QwaD2TeQap/2AZq12i18DwgqAlKwtGLQs3
hODboGDL0SjCszqXh11RYbAxAqotTQ3v5teZ/4efwqVD6WSUI7yO/f3tW9RAgtSigmi6IB9zRIwE
q4Hzl9zscL57aMBCMj6TyL+823mlO3A9C2F0dsqrtg==
=eIEP
-----END PGP SIGNATURE-----

--------------9hNj1UWsFYtKYnR6rWSroe6p--

