Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3418A6CE27
	for <lists+xen-devel@lfdr.de>; Sun, 23 Mar 2025 08:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924887.1327851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twFKg-0004eY-DW; Sun, 23 Mar 2025 07:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924887.1327851; Sun, 23 Mar 2025 07:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twFKg-0004cA-Ax; Sun, 23 Mar 2025 07:01:18 +0000
Received: by outflank-mailman (input) for mailman id 924887;
 Sun, 23 Mar 2025 07:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VYxF=WK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1twFKf-0004aL-3P
 for xen-devel@lists.xenproject.org; Sun, 23 Mar 2025 07:01:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aee14a1-07b4-11f0-9ffa-bf95429c2676;
 Sun, 23 Mar 2025 08:01:12 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so628363266b.0
 for <xen-devel@lists.xenproject.org>; Sun, 23 Mar 2025 00:01:12 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efda474bsm467657066b.183.2025.03.23.00.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Mar 2025 00:01:11 -0700 (PDT)
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
X-Inumbo-ID: 9aee14a1-07b4-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742713272; x=1743318072; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHylGmy1hZq8oyAxYKWbcNc4NdU3bjaXgkTsVQDhfq8=;
        b=HfnqOn5B+bF+kILoxCcrmxf+oEijlWro1KasaMxHjZKtzRf3/s07zV2/MrL6I6fN5J
         CIQW6Lm1jb07S/wwa4LQeAo9T08ixw3D6sbff8YcrKZQ0lAk7W2lTjx/9JqCDW5FMDKT
         MNo+fLEUv3hMZyfVBtsP3ckvcPjHUxuFaHhbhStnAyOwQ2mKzmj3WqP8UVoj9+Gu/aE4
         lVXK5aED74f7Xo9jsVyXzY6mhwE9J/MZpPLkmEfD6wbPoRlKYPRBLSZaXtciYmYABwOb
         GtYTemJ2WrrigYVDkUNgy6UPukM4av1habmJ41yll0g89N2qXAgauV3spRi3o7roebOq
         xkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742713272; x=1743318072;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SHylGmy1hZq8oyAxYKWbcNc4NdU3bjaXgkTsVQDhfq8=;
        b=oJa4absSAL4ly6IMkHVNBPrCtALz+850hHBqDVySEaY4XcUa8yj/682D6YoMgmg8Mk
         ctlU4jJNvHBQZxi3TP0rlQ5RAcoKVrOF6vCFcIzww6grD4zxlC7GaQaJeqzk4kvHQBuv
         SRc0nSql8Bghs6KfOODO6Xv12iZAfS91Y8eB0QZ7ZcT9l9wtBpxdv60v8McN5dE99KUP
         c5L9/pxWc0iKdeuFpVoHoafJMLNyUQ1efhSGEB4DeH0w5pptfOkhVS3l7MxhaKyzj+66
         GLAKhIIMW5MPM/NR3sPtzCGhy8a//+dfxshDWb/wgh1ekKV/+chP1k1aqEoWFMxLRE0Z
         jRQw==
X-Forwarded-Encrypted: i=1; AJvYcCX8IKKxyGa+Q3q1mIxMF2eIPwJCGjbO8SR24MdR0sz1o13gbUTBs20XwOiaIGeLKXV9jlU5906HA90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyN4eMs0DFF7oU163GzjTpna/drqVz7zdOmAgSpIYkQpCejnIu8
	VbPrKpbVkl0tHpvMTGWpQnOv2cfhMBHVN40j7drMf6ZWUF8wg9Fi26U44hoiVH+TU7QvgbTWYlj
	rZwayXQ==
X-Gm-Gg: ASbGncvYot6Fm8NUi2bVr9XLzws+6k2PZXjLyhyMTXiAS9Tu7A98XjLy8BKK0tCC52b
	3MHKPETlezDjOlQNm3nN/2yCKrPfeFExwi4T18+QC69ZECEaTVZ2G0LFzuLpWGSXi5pXtBc22pC
	K/Rru8LJWwJGMTXZW/eIIVKyKQ/3cwhRY+wNgOq+m4FGQKdH5VPHBVpGeFzgHoOi5WaZUgJn9LY
	pB59e4CAzN3i/p9c8b9R6wPBc0yRU45KLHkefj5bJVS7jnpJm/xJ87I/BYFfy9wnzmVA4HZPRRT
	6CwUgPeGq4XeR3MMcnq7QvY7SpVkg39J+8ku3si9qQ79VUQXnh+nWPHZHooIq3z6YfKS1OWC4xc
	/WFtW0yFyVnS+8kbjWXmFrQiBUe9l1zf8ZGL+QTZvXCC0eWUSHu5sS0Lp577Eape4wioCnQ==
X-Google-Smtp-Source: AGHT+IHUQEOJgV47eh6ImeTE51P0FTy0iVFK0PtLgfjhj68ojCO1ChABigECnLZdyYPHsDVrTSKbhA==
X-Received: by 2002:a17:907:958a:b0:ac1:e45f:9c71 with SMTP id a640c23a62f3a-ac3f00b7260mr821885366b.1.1742713271779;
        Sun, 23 Mar 2025 00:01:11 -0700 (PDT)
Message-ID: <98f92f1f-c1e9-4955-9d04-e31b7e99be29@suse.com>
Date: Sun, 23 Mar 2025 08:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20250321092451.17309-1-jgross@suse.com> <Z99NnhfppCVOP_7C@begin>
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
In-Reply-To: <Z99NnhfppCVOP_7C@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ov7BKYoL1OR330RAoMbHOmhN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ov7BKYoL1OR330RAoMbHOmhN
Content-Type: multipart/mixed; boundary="------------50GtZsWh6kbaI8e8RsWzcchH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Message-ID: <98f92f1f-c1e9-4955-9d04-e31b7e99be29@suse.com>
Subject: Re: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
References: <20250321092451.17309-1-jgross@suse.com> <Z99NnhfppCVOP_7C@begin>
In-Reply-To: <Z99NnhfppCVOP_7C@begin>

--------------50GtZsWh6kbaI8e8RsWzcchH
Content-Type: multipart/mixed; boundary="------------k5vYLtH0Ws1Zw0X044ySPUip"

--------------k5vYLtH0Ws1Zw0X044ySPUip
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjUgMDA6NTQsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSGVsbG8sDQo+
IA0KPiBKdWVyZ2VuIEdyb3NzLCBsZSB2ZW4uIDIxIG1hcnMgMjAyNSAxMDoyNDozOSArMDEw
MCwgYSBlY3JpdDoNCj4+IEFkZCBiYXNpYyBrZXhlYyBzdXBwb3J0IHRvIE1pbmktT1MgZm9y
IHJ1bm5pbmcgaW4geDg2IFBWSCBtb2RlLg0KPiANCj4gSSBhbSB3b25kZXJpbmcgaWYgeW91
IGhhZCBjb25zaWRlcmVkIHVzaW5nIGxpYnhjIHRvIGltcGxlbWVudCB0aGlzPw0KPiBUaGUg
b3JpZ2luYWwgcHYtZ3J1YjEgaXMgZG9pbmcgaXQgKHhlbi9zdHViZG9tL2dydWIva2V4ZWMu
YykNCg0KVGhlIGxpYnhjIChvciBtb3JlIHByZWNpc2U6IGxpYnhlbmd1ZXN0KSB1c2FnZSBp
cyBuZWVkZWQgdGhlcmUgb25seSBmb3INCmNvbnN0cnVjdGlvbiBvZiB0aGUgUFYgc3BlY2lm
aWMgcGFydHMgbGlrZSB0aGUgaW5pdGlhbCBwYWdlIHRhYmxlcyBhbmQNCnRoZSBwMm0gbWFw
LiBUaGUgbWFpbiBrZXhlYyBmdW5jdGlvbmFsaXR5IGFzIEkgbmVlZCBpdCBmb3IgUFZIIHN0
dWJkb20NCmlzIGluIGdydWIgaXRzZWxmLg0KDQpBZGRpdGlvbmFsbHkgSSd2ZSB3b3JrZWQg
aGFyZCB0byBnZXQgcmlkIG9mIG5vbi1zdGFibGUgWGVuIGxpYnJhcmllcyBpbg0KWGVuc3Rv
cmUtc3R1YmRvbS4gQWRkaW5nIHRoZW0gYWdhaW4ganVzdCBhZnRlciByZW1vdmFsIHdvdWxk
IGJlIHdlaXJkLg0KDQoNCkp1ZXJnZW4NCg==
--------------k5vYLtH0Ws1Zw0X044ySPUip
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------k5vYLtH0Ws1Zw0X044ySPUip--

--------------50GtZsWh6kbaI8e8RsWzcchH--

--------------Ov7BKYoL1OR330RAoMbHOmhN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmffsbYFAwAAAAAACgkQsN6d1ii/Ey/N
hgf+M+Fq3eNeWSvmD8p4/hGDu97CFmlbeo3I80ntpjsjFkFO9pGcQquP/PtNhHkgjgHakNJueBIs
OaMCIN8eh3KsxduAX09ySfUVvfnfcgArXV8uIh73pQyzYjU9MF5I9LbtTrGH3qtlfYLL3PYolVSJ
YXK4Vfn82HxGwUOvC+3UTl2AXBYvM7KombhLeKPu1CkX8tsfZWgpqFG5n1HUDaJroWqWIxi400F7
zqP1AEVelYkrf/cj3Qa/mxGvwber1WWxOY+B8G6rC6hA2yuMZ3yIwgpd0j4PjxHuiSoH/k/s6z4w
RiMlKsVjexA7bPW1+YUs98PGDfLA+iWPNVLilog7qQ==
=2HmH
-----END PGP SIGNATURE-----

--------------Ov7BKYoL1OR330RAoMbHOmhN--

