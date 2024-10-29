Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B209B48DC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 13:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827330.1241921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kvr-0005Hq-8z; Tue, 29 Oct 2024 12:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827330.1241921; Tue, 29 Oct 2024 12:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kvr-0005FR-5p; Tue, 29 Oct 2024 12:02:43 +0000
Received: by outflank-mailman (input) for mailman id 827330;
 Tue, 29 Oct 2024 12:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t5kvp-0005DR-R1
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 12:02:41 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b08dff5f-95ed-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 13:02:37 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so51895295e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 05:02:37 -0700 (PDT)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b8c394sm12303253f8f.90.2024.10.29.05.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 05:02:36 -0700 (PDT)
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
X-Inumbo-ID: b08dff5f-95ed-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIwOGRmZjVmLTk1ZWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjAzMzU3LjU4MTYxNiwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730203357; x=1730808157; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFnCILIVjACx8sBier9Yj00iF+wMwReIBMNHJQqvMl4=;
        b=ZxlekTIBW6PM+56j1B03dMJz6qCBRixPDr0fy1NI8mAzFpat+90nBVn/1HCu5H1RQT
         s8Df2zo8oecFeXNTCDBaZzkZFVLnk2aDH6hPl7EdzAq+eF0nNFGEAFEdCdx3MlSGNdgw
         /QQmXhbj20m5XvJso8Il58fG6VVgz0gkVlCvngzCTf4ZP1D2NUsLx7av0szx219XxBFt
         aqN19v6panl4hIURkwlLMk5pMHP4CVkPOoUpvnameCIg3s9IrXr3+d5cI1k+t/Om4QT5
         toDNyuZ7HVC2thzYD4phiPjoHbkj8vzXNwAjpgSkcfM+Qc4hqWxh5xatsYd4VPZaY3as
         a9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203357; x=1730808157;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XFnCILIVjACx8sBier9Yj00iF+wMwReIBMNHJQqvMl4=;
        b=jsSAFryrkfAzmfkhVeaodUgsxwO/f1o6jgx9p5ZY/mrSbbuuvP7BZdpnftvOc8PDbb
         pBwIP0onOaK6VSXo7ogxEQT/0QfMCp9k0znfTN3zob01fo4gMJXRDgCq/rfY+bJwl0WG
         NpSdzFd1eMMuggePBQVXyDzTOsvURvS/jEEBUoPWXkQYt92lkelR4pynpKHS8SjY4H7v
         vkVnrpaJfO2ypmbquqvz9psPVu3H8Gu2b5wWZTgHyiARee372rvxobNSLTb3RWojp8Hk
         Pu4ljfREf2Rl3BO5PNKz2S+//4FgeX04dDJlcHPsZWDq0gAwDl2Hlmp4fIsqc9fRoVmz
         Xm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSYx8psR6Qv3mw0lYH/YjmoCVEZbXxYQ86mAlG/jZyeo64IfFmK8hqW2TEz0EXU1+7YPNwg5QQlNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxs9KRnHH0A34A5JFhnvtWoGjVy6btT41fGo100Z0e7jXzsPQkR
	rIu14QRYgrzHCPOXHi3cCghzHIxB/fxD2cw4EjZmVzZvwGd0SREdE1Xppwmms4E=
X-Google-Smtp-Source: AGHT+IGRbhNbS/1ylyz50TNflcHIJW9DdT3tqH44fzh9z2T0FpFsfv6UuRv4Iht5y9W62M02Epz4nQ==
X-Received: by 2002:a5d:45c5:0:b0:37d:50e1:b3d3 with SMTP id ffacd0b85a97d-3806113d05cmr8961478f8f.20.1730203356717;
        Tue, 29 Oct 2024 05:02:36 -0700 (PDT)
Message-ID: <b13cc450-f032-44e2-bbbe-bdc98d4b7050@suse.com>
Date: Tue, 29 Oct 2024 13:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Mini-OS PATCH] Add missing symbol exports for grub-pv
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Natanael Copa <ncopa@alpinelinux.org>
References: <20241029114158.17231-1-jgross@suse.com> <ZyDL9fGtcouw9bar@begin>
 <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>
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
In-Reply-To: <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RjVuIJ53nUAUEc0vUbWLp8Md"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RjVuIJ53nUAUEc0vUbWLp8Md
Content-Type: multipart/mixed; boundary="------------3JBa1iMNSSyIkVx6OH90Hrms";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Natanael Copa <ncopa@alpinelinux.org>
Message-ID: <b13cc450-f032-44e2-bbbe-bdc98d4b7050@suse.com>
Subject: Re: [Mini-OS PATCH] Add missing symbol exports for grub-pv
References: <20241029114158.17231-1-jgross@suse.com> <ZyDL9fGtcouw9bar@begin>
 <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>
In-Reply-To: <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>

--------------3JBa1iMNSSyIkVx6OH90Hrms
Content-Type: multipart/mixed; boundary="------------HztX5xitV05JcOfxQr3Ml5VO"

--------------HztX5xitV05JcOfxQr3Ml5VO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMTAuMjQgMTM6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI5LzEwLzIw
MjQgMTE6NTAgYW0sIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4+IEp1ZXJnZW4gR3Jvc3Ms
IGxlIG1hci4gMjkgb2N0LiAyMDI0IDEyOjQxOjU4ICswMTAwLCBhIGVjcml0Og0KPj4+IEdy
dWItcHYgbmVlZHMgc3RhcnRfaW5mb191bmlvbiBhbmQgcGh5c190b19tYWNoaW5lX21hcHBp
bmcgdG8gYmUNCj4+PiBhY2Nlc3NpYmxlLiBFeHBvcnQgYm90aCBzeW1ib2xzLg0KPj4+DQo+
Pj4gRml4ZXM6IDMzNDExYTExZjg0OCAoIk1pbmktT1M6IGhpZGUgYWxsIHN5bWJvbHMgbm90
IGV4cG9ydGVkIHZpYSBFWFBPUlRfU1lNQk9MUygpIikNCj4+PiBSZXBvcnRlZC1ieTogTmF0
YW5hZWwgQ29wYSA8bmNvcGFAYWxwaW5lbGludXgub3JnPg0KPj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTYW11
ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlvbi5vcmc+DQo+IA0KPiBDb21t
aXR0ZWQuDQo+IA0KPiBKdXJnZW4sIHdoYXQgZG8geW91IHdhbnQgdG8gZG8gd2l0aCB1cGRh
dGluZyA0LjE5P8KgIERvbid0IHdlIG5lZWQgdG8NCj4gZm9yayBhIDQuMTkgYnJhbmNoIHRv
IGF2b2lkIHRoZSBDT05GSUdfWEMgY2hhbmdlID8NCg0KWWVzLCBJIHRoaW5rIHRoaXMgaXMg
dGhlIHdheSB0byBnby4NCg0KDQpKdWVyZ2VuDQo=
--------------HztX5xitV05JcOfxQr3Ml5VO
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

--------------HztX5xitV05JcOfxQr3Ml5VO--

--------------3JBa1iMNSSyIkVx6OH90Hrms--

--------------RjVuIJ53nUAUEc0vUbWLp8Md
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcgztsFAwAAAAAACgkQsN6d1ii/Ey8F
FAf/bAuN2wgSmytgXq9j5iByb4qW/IzWibU/mJb8ELH1R7R46EuRkVT0BRmKitnmnn4DTkYAjhwu
4UO11CBssxpSA5j9nYkBSf5xQdrqJ6lyLsaFoTJO/AlQzerz3O4L2Viu65Ey8inz+py+Omyvqnsk
BMtVssLaWN1Wjq4LxG1FEvPymfon2R9qjwFofDb074TfeAa0XJdk0LgPW9bOyxD3+AQj6h9wqClo
JHHandlpUT5DPkdXdsoiassCr9dJDPCFcqT3a1qHtsflF2o1PUJmbS7Yl/jlXLJkWuYERj1FEwbM
QDTbZoOGvqziirHfPWU6kTu9YCfJoc/7ZSQ6fNZ+Ug==
=/qI5
-----END PGP SIGNATURE-----

--------------RjVuIJ53nUAUEc0vUbWLp8Md--

