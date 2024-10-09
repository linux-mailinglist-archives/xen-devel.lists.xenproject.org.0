Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88616995F43
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 07:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813706.1226703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syPct-00063X-JD; Wed, 09 Oct 2024 05:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813706.1226703; Wed, 09 Oct 2024 05:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syPct-00060w-Fn; Wed, 09 Oct 2024 05:52:47 +0000
Received: by outflank-mailman (input) for mailman id 813706;
 Wed, 09 Oct 2024 05:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syPcs-00060q-Hq
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 05:52:46 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b431cf30-8602-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 07:52:44 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42cc43454d5so51511265e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 22:52:44 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430d70b4331sm8819965e9.36.2024.10.08.22.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 22:52:43 -0700 (PDT)
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
X-Inumbo-ID: b431cf30-8602-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728453164; x=1729057964; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TsQOfODHHlQU5eyeZ3cemrRZcoCIqaAuTYlchJlEMKY=;
        b=O+MKgnIxvTroQNczSTM7obb5UXrfFQVZG7K96D9GZqC3b92HNiXd/q7bYppBMwUUU1
         eyKgL9mImc9xftxLQWyV45O0j9iPkc0BKqXegDpTTf4x2z+v3YW0KVXL4PnjETakkgAj
         2AqE4PrHIhtV6HffPEheobsQqkYpbIVwpUQiXxpymfTaVb53YcXsiS9FGaW2dBPAYTFZ
         J3S72FMdqVJl8G3pXC8qH6irdlNqqjBHcUvMld+VNPgIQf31YFfdCnd88j+qpbANJ7+n
         6wps1ROZ8LGqxuppVa74O9sJQ5AHvvFHsIII1oaPX+uyfbF9//mD32uRlxwxa3rh3O7R
         lUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728453164; x=1729057964;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsQOfODHHlQU5eyeZ3cemrRZcoCIqaAuTYlchJlEMKY=;
        b=sXvKQpzRoa7Cioe6oGmS1lys/pUaJWKOOTYH67S1yVCsHoHm9EeGKQfXwOmIM7K2FV
         d1m5mdiKpv12zo63pXhHkoJ3vkVDC+8KyCukHKWe2rPSBJ7Ipt1XO8HAcMHihifAuo22
         4j1rwiBnw50p5MqZSPCL1n4TFAIfmWT4L4nD4687PfZjJpXlA59CjRCOKegDbBW3gp/I
         /CylUOhVgeAC9nNER8X7Lx3zvQDSZl+VFD2BxNxw+D4A0zfBqFG91KxvfH7h4IJShLTV
         Yo7LsKKBjsz6/1RKj5FUwsh8JYbKT5uGmN4yULldwIIKZi4Xx5+z+W6kD/uuQOBz+bff
         4gXw==
X-Gm-Message-State: AOJu0YwgqPC+p6Clh+QDVB8KWwNeDwfb6/J1VP+fohH4h31TxXZ0LV3Z
	JKIH6tJx2LnAuFF5WJejyznM2taGH/2EgmRDhyoawB5ONcIKAuH16xJk9j6Rehw=
X-Google-Smtp-Source: AGHT+IGu1jIlV7daEINHtbgCulKouILOFVjvB8LAGt09kj93iY42vqENlerO2mMOhrvp+EHx0ZchMA==
X-Received: by 2002:a05:600c:1f0d:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-430ccf4f894mr8919465e9.16.1728453163707;
        Tue, 08 Oct 2024 22:52:43 -0700 (PDT)
Message-ID: <be58ccad-157c-45ed-a513-dd64d74ded77@suse.com>
Date: Wed, 9 Oct 2024 07:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.12-rc2: xen-privcmd cannot be loaded in domU anymore
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <ZwXQKzubX9Dj_vhc@mail-itl>
 <BL1PR12MB58498966A7308B5CB6CBE86DE77F2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58498966A7308B5CB6CBE86DE77F2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iJu862XPNsD6yZD5Mxi0k7O5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iJu862XPNsD6yZD5Mxi0k7O5
Content-Type: multipart/mixed; boundary="------------cVF1wHqUxlnKCCKxHtp0vwSZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <be58ccad-157c-45ed-a513-dd64d74ded77@suse.com>
Subject: Re: Linux 6.12-rc2: xen-privcmd cannot be loaded in domU anymore
References: <ZwXQKzubX9Dj_vhc@mail-itl>
 <BL1PR12MB58498966A7308B5CB6CBE86DE77F2@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB58498966A7308B5CB6CBE86DE77F2@BL1PR12MB5849.namprd12.prod.outlook.com>

--------------cVF1wHqUxlnKCCKxHtp0vwSZ
Content-Type: multipart/mixed; boundary="------------lTbdyacaX0oSkIBFaTQc1QXx"

--------------lTbdyacaX0oSkIBFaTQc1QXx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMTAuMjQgMDU6NDEsIENoZW4sIEppcWlhbiB3cm90ZToNCj4gT24gMjAyNC8xMC85
IDA4OjM2LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+PiBIaSwNCj4+
DQo+PiBJdCBsb29rcyBsaWtlIHhlbi1wcml2Y21kIG5vdyBkZXBlbmRzIG9uIHhlbi1wY2li
YWNrLCBhbmQgdGhlIGxhdHRlcg0KPj4gKGV4cGVjdGVkbHkpIGZhaWxzIHRvIGxvYWQgaW4g
ZG9tVSB3aXRoIC1FTk9ERVYuIEJ1dCB0aGF0IHByZXZlbnRzDQo+PiBsb2FkaW5nIHhlbi1w
cml2Y21kIHRvby4gQW5kIHRoYXQncyBiYWQuDQo+IFNvcnJ5IGZvciBpbnRyb2R1Y2luZyB0
aGF0IGFuZCB0aGFuayB5b3UgZm9yIHJlcG9ydGluZyBpdC4NCj4gDQo+IE1heWJlIHRoYXQg
ZGVwZW5kZW5jeSBjYW4gYmUgcmVtb3ZlZC4NCj4gSSB1c2VkIGl0IHRvIHBhc3MgdGhlIGNv
bWJpbmF0aW9uIG9mIGNvbXBpbGF0aW9uKENPTkZJR19YRU5fUFJJVkNNRD15ICYmIENPTkZJ
R19YRU5fUENJREVWX0JBQ0tFTkQ9bSkuDQo+IEJ1dCBmcm9tIG15IHBhdGNoLCAiSVNfUkVB
Q0hBQkxFKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpIiBpcyBlbm91Z2guIEFuZCBJIGhh
dmUgdGVzdGVkIGxvY2FsbHkganVzdCBub3cuDQo+IEp1ZXJnZW4gYW5kIFN0ZWZhbm8sIHdo
YXQncyB5b3VyIG9waW5pb24/DQoNClBsZWFzZSBzZW5kIGEgcGF0Y2guIDotKQ0KDQoNCkp1
ZXJnZW4NCg0K
--------------lTbdyacaX0oSkIBFaTQc1QXx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lTbdyacaX0oSkIBFaTQc1QXx--

--------------cVF1wHqUxlnKCCKxHtp0vwSZ--

--------------iJu862XPNsD6yZD5Mxi0k7O5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcGGioFAwAAAAAACgkQsN6d1ii/Ey/F
Egf/TOthEStmJuqBb7RSuBrm28miKlFNFEtV2DeQaQ6XM+x3Lh2sB2hebZi9UeFjZfgQnKwJyUOz
6TJ/Bt/Vm7ZesqDaHuA9ZhAjtnbJ87PLaj318exAwFfLgtj1UrIFFTXGSGyKraRM97OC5zMBwBNP
V/jZKVy96Lr8nfEehlhGlpl3GVStxSufABtRZr4upQuskqMJow1WU2ry8J0CDz98IcJKskSQ1shv
KX45K8moiM2H85fCicauN7gMcBeUA9ksALVmq6d6sB6R0R/VLtZ7hH+9tZNnciBPx/CKZ6fXrZfx
4BcHRApfnL7SVz8s3+GhkMNg1EQG/4aHfowax9HbTQ==
=Kr7u
-----END PGP SIGNATURE-----

--------------iJu862XPNsD6yZD5Mxi0k7O5--

