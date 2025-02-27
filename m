Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36388A482F7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898244.1306826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfpl-0003E3-IE; Thu, 27 Feb 2025 15:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898244.1306826; Thu, 27 Feb 2025 15:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfpl-0003By-FX; Thu, 27 Feb 2025 15:29:57 +0000
Received: by outflank-mailman (input) for mailman id 898244;
 Thu, 27 Feb 2025 15:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=91Tp=VS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tnfpj-0003Bs-86
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 15:29:55 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b01c3095-f51f-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 16:29:53 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-439950a45daso7325025e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 07:29:52 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5710ebsm61247035e9.26.2025.02.27.07.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 07:29:51 -0800 (PST)
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
X-Inumbo-ID: b01c3095-f51f-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740670191; x=1741274991; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Or2S1BxI2J4T6rUeUCechS9x46+OBNBRa9Xv5USJ24g=;
        b=WDlBqvlveW5pMQwYyeCVNgSpXv7112l7i6V8oKGOomXQZOimQdGYioz5YV0xpRzbqk
         1ksPYouc4m2MgfkUOytdoHQ11x8CPz/zbGCzh6lx1WaXu2H6xLIW40slDiY+YZVTPRSM
         aF0x+zfgGp3ON7B1yFxwyCEXuOJPWGabJKXdybdw/QP+WRINn6x6yw+wdZXCXn8Phg8j
         2dlkU42WTRPWxF1D1DCFUJG9uJMzCQSjKYPR7Vyq3YS/jDO5d9Gkco1xrI593AEcm0Jp
         CdFelOEqktDkRuF4u7EcRPg/8VyUlmRRyIfmtVP+OE7MhOakYaqdZPJ+KbwpcOi7tVwA
         yYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740670191; x=1741274991;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or2S1BxI2J4T6rUeUCechS9x46+OBNBRa9Xv5USJ24g=;
        b=UirlJS5r8wClNKL2NzRRzTQlYw6F+Egzo5QXtX13yLowoVFN6FsU/KOluWVoDBSZLR
         CkG5WXc+eZu0iqxg2wPn7HtAK/zvgDMRijmx8tEEnnM8AlLnUB1/WnrKvMTDIPqy3T+z
         e5hp2D2i4FyPoCfJzh3Myz9A/91tDUOVHzXWgFM7Pt02SZSVtsbasyBQZlUNbcllNnIl
         D18RnL4WEo64B3epiWW/bX27Nepho0TMzdx+hhn7OmF91s5Thorks9UorTVgDrCeOlVf
         Bx7WfIxJ3Dn6TBcC89okAuBOHqE8Ltb8fqzLfNLHpqxy3OJIZ7xuEIh1z1aLIthDujym
         Fjyw==
X-Forwarded-Encrypted: i=1; AJvYcCV/XLueSRSlFldwtdv+cllrz2DgCIa+X1OYBFvnDODCFxWsUqEW4HNjQeQlKSItSkdDyNoS8pgr/GM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIneWARLkWsjsd27XNbPP4S07op7LuJViK+fmbJUFXuW/ysWrz
	4uBj3nWa4hu5FgBidPLRg+3YNRD8HIfsVGK9Pq7yJYfrpPzw6FmQx8t19CymQgI=
X-Gm-Gg: ASbGncsBfpb/SqTbmcqFUmZZEDFj4vKitlsxqp46CHFSHhaonrSgGiTI4/8qWNgiMmF
	ydkKkxfJGksi5Jfm/vVbYSDNsohF1DU/KsoD/FtRjYuFBAqHHln218A9Yz+E0jLl4wzyF0rcv+b
	+8NAd95q3PUMnaQJof+f017gEmA6rLBY3+oDRcUGoHJSzRL9duRKnBu5UDMBDbfIBWB1QhfWrhR
	6h+WMUltycjQE9oEF1XQLB5dP1+i5YT6OcMWGXiS7lV5QXQxMNuI18Mh1bZMdmu55VUrKP5jJ4x
	heg1TnGcG8V7UmL+tZY8s3lAzAcOZeRoofMEisno5B4CQ3rCFNQCmRVXBrdq8svt4AZdri/PCSw
	hzFqGeTnMO8yr5hjdqQQBJ4JsSo7ydYFZz1F7cn9bgIds2Faj
X-Google-Smtp-Source: AGHT+IGH10U3HyZQcpCiisEuijVuw2MOgcBfgz1zzdVm0lxcjFU8PN77WNGtsIcXGRFK59YQ6Qwlog==
X-Received: by 2002:a05:6000:4026:b0:38d:e3e2:27e5 with SMTP id ffacd0b85a97d-390cc5f5cc8mr9793609f8f.5.1740670191455;
        Thu, 27 Feb 2025 07:29:51 -0800 (PST)
Message-ID: <03c90be4-7546-42cf-be5d-3fd6bcf20849@suse.com>
Date: Thu, 27 Feb 2025 16:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Add support for XenServer 6.1 platform device
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20250225140400.23992-1-frediano.ziglio@cloud.com>
 <20250227145016.25350-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250227145016.25350-1-frediano.ziglio@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yA7AouVOlM5ktrrfJTheyd6D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yA7AouVOlM5ktrrfJTheyd6D
Content-Type: multipart/mixed; boundary="------------8ZEcR8NSrsXN84ey7Sr6gk1B";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Message-ID: <03c90be4-7546-42cf-be5d-3fd6bcf20849@suse.com>
Subject: Re: [PATCH v2] xen: Add support for XenServer 6.1 platform device
References: <20250225140400.23992-1-frediano.ziglio@cloud.com>
 <20250227145016.25350-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250227145016.25350-1-frediano.ziglio@cloud.com>

--------------8ZEcR8NSrsXN84ey7Sr6gk1B
Content-Type: multipart/mixed; boundary="------------i3L8E5rkH9J0WAm0l6tsHHi4"

--------------i3L8E5rkH9J0WAm0l6tsHHi4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDIuMjUgMTU6NTAsIEZyZWRpYW5vIFppZ2xpbyB3cm90ZToNCj4gT24gWGVuU2Vy
dmVyIG9uIFdpbmRvd3MgbWFjaGluZSBhIHBsYXRmb3JtIGRldmljZSB3aXRoIElEIDIgaW5z
dGVhZCBvZg0KPiAxIGlzIHVzZWQuDQo+IA0KPiBUaGlzIGRldmljZSBpcyBtYWlubHkgaWRl
bnRpY2FsIHRvIGRldmljZSAxIGJ1dCBkdWUgdG8gc29tZSBXaW5kb3dzDQo+IHVwZGF0ZSBi
ZWhhdmlvdXIgaXQgd2FzIGRlY2lkZWQgdG8gdXNlIGEgZGV2aWNlIHdpdGggYSBkaWZmZXJl
bnQgSUQuDQo+IA0KPiBUaGlzIGNhdXNlcyBjb21wYXRpYmlsaXR5IGlzc3VlcyB3aXRoIExp
bnV4IHdoaWNoIGV4cGVjdHMsIGlmIFhlbg0KPiBpcyBkZXRlY3RlZCwgdG8gZmluZCBhIFhl
biBwbGF0Zm9ybSBkZXZpY2UgKDU4NTM6MDAwMSkgb3RoZXJ3aXNlIGNvZGUNCj4gd2lsbCBj
cmFzaCBkdWUgdG8gc29tZSBtaXNzaW5nIGluaXRpYWxpemF0aW9uIChzcGVjaWZpY2FsbHkg
Z3JhbnQNCj4gdGFibGVzKS4gU3BlY2lmaWNhbGx5IGZyb20gZG1lc2cNCj4gDQo+ICAgICAg
UklQOiAwMDEwOmdudHRhYl9leHBhbmQrMHgyOS8weDIxMA0KPiAgICAgIENvZGU6IDkwIDBm
IDFmIDQ0IDAwIDAwIDU1IDMxIGQyIDQ4IDg5IGU1IDQxIDU3IDQxIDU2IDQxIDU1IDQxIDg5
IGZkDQo+ICAgICAgICAgICAgNDEgNTQgNTMgNDggODMgZWMgMTAgNDggOGIgMDUgN2UgOWEg
NDkgMDIgNDQgOGIgMzUgYTcgOWEgNDkgMDINCj4gICAgICAgICAgICA8OGI+IDQ4IDA0IDhk
IDQ0IDM5IGZmIGY3IGYxIDQ1IDhkIDI0IDA2IDg5IGMzIGU4IDQzIGZlIGZmIGZmDQo+ICAg
ICAgICAgICAgNDQgMzkNCj4gICAgICBSU1A6IDAwMDA6ZmZmZmJhMzRjMDFmYmM4OCBFRkxB
R1M6IDAwMDEwMDg2DQo+ICAgICAgLi4uDQo+IA0KPiBUaGUgZGV2aWNlIDIgaXMgcHJlc2Vu
dGVkIGJ5IFhhcGkgYWRkaW5nIGRldmljZSBzcGVjaWZpY2F0aW9uIHRvDQo+IFFlbXUgY29t
bWFuZCBsaW5lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJlZGlhbm8gWmlnbGlvIDxmcmVk
aWFuby56aWdsaW9AY2xvdWQuY29tPg0KDQpBY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------i3L8E5rkH9J0WAm0l6tsHHi4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------i3L8E5rkH9J0WAm0l6tsHHi4--

--------------8ZEcR8NSrsXN84ey7Sr6gk1B--

--------------yA7AouVOlM5ktrrfJTheyd6D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfAhO4FAwAAAAAACgkQsN6d1ii/Ey9f
5wf9HV/lZMWX0xsB+MafliORx3rBgJOGFut1zjcx0JFDHLfg2rLT6VmFPvhFd4ECcqxXFQ3Yv5pQ
PQUn9KLbsRY3QUlmp/GcHVZHyhlaDlTKwud/CcEAeVQWATqD4bWDtNeUWnffrJEJDxV/hX8geYaR
cvIAP83Bl51liDw8DIzLoxvFBS6OUSN5Y2jhc5cDP5XGH40QKJxHDMDKm3XMcimjRhpsnpTCPiZA
b/ev9kOM0FLVV5quTrreH10kCRy5i4cHMRp51awwEp4BRhf215699BfqBt/ZQFg1nl4bkRlcY1eu
pzTukrc5dNF5VwsnhQ7qeEPrbwnk+gPVAlvqOv1Z3Q==
=X8qy
-----END PGP SIGNATURE-----

--------------yA7AouVOlM5ktrrfJTheyd6D--

