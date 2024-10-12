Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A523A99B21B
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2024 10:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817531.1231505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szXU1-0003mv-Hu; Sat, 12 Oct 2024 08:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817531.1231505; Sat, 12 Oct 2024 08:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szXU1-0003l6-Da; Sat, 12 Oct 2024 08:28:17 +0000
Received: by outflank-mailman (input) for mailman id 817531;
 Sat, 12 Oct 2024 08:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1szXU0-0003kx-53
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2024 08:28:16 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec2eeba3-8873-11ef-99a2-01e77a169b0f;
 Sat, 12 Oct 2024 10:28:14 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d4ba20075so1633841f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 12 Oct 2024 01:28:14 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7f2c1esm5729802f8f.109.2024.10.12.01.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Oct 2024 01:28:12 -0700 (PDT)
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
X-Inumbo-ID: ec2eeba3-8873-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728721693; x=1729326493; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4J8ofNBT+jlUTF2l15uYi7Npqa/12p42Lw5bSB4TPvg=;
        b=DuT9ao94ZUdEjQAloOSVdk7Bmaz5KZP1aCTb7G43GrmqhkEgUQMdYEEdfxvtKi4U96
         DSCwRp7gTR/mnv+IOt5s2rqJ4W9ccbbLiAL7ajCnh3yruq0Pmv2NX0AL6MA4KLNtCdQZ
         QdC+7DH+LCia4vT4aqKtIc9oIxax/8dzWAu2wJtFQL+GqqRI6MzaamWmTSk81+47jCUb
         wXFl8wxJrkQbw4/QgYiVw47mtLaDZYZ8dn7ao3xocxQgOZ2MSMiUbdb9T/Xp/qAGVd3/
         RDnKM1FOSy6GOhgRPtiSTNMEWKFU03y5MEvh6farpXgK2tTXZ0I5FMEenpVZJ1MZFmsT
         sqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728721693; x=1729326493;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4J8ofNBT+jlUTF2l15uYi7Npqa/12p42Lw5bSB4TPvg=;
        b=ndzIWpxaANfJELsgGGWcjQkn5qe3ED2qC64TyJ7ae5/73uSOaKN2sn5EvOxHpKLt/v
         eQYLSpGO5bt0xwfW6derAFHbALfjwqF1XxA70EEHk6RQVixyc6PW/eXVoypXhqLhGTvQ
         aB5rWtZw+JuM/KzovqYYmZ2wmhkepqvEKi6QQ1aYbNuMGQxjwEPW/XFyqduy6n/h8KtB
         oNZ7u2B5+H3+DTde78I7UKBVvs8ARr//rJ+bv0ICCB8JnIc++1V0WbkM6symiAttD9Js
         EJVTPnZ5AYbOZAuX/jxWQ+5onOmW60jGinSUv8xfbZyb2V44X3AC4S0rbxcowp2lHP0y
         gQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtgBN8CELOEQyxEx+usZe3CXRduwpPHXuS+CfvTLPjHZdlGFt4xbA4K3CeIX57lXAfHMRgoauLol8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf8V9Te3CX/VwFYFaiV1IdRmwASbnk+IhfSZ8p4ENDyR/7wnS5
	WOPZlIIkS3RTRf457KdXrdh/lr6B6xPia30pSKuDTA2mofoCWnPkoY0XF1z2g3OGsGwhkj1AU5D
	y
X-Google-Smtp-Source: AGHT+IH4wmwASKqEo/IHfuhAp3IcVLIY4vvlxJmhAuBe1EmgXjZItVS6Ltly6r0gI3XA0sLSpmAYqQ==
X-Received: by 2002:a5d:5351:0:b0:37d:4870:dedf with SMTP id ffacd0b85a97d-37d551d3fc5mr3784657f8f.19.1728721692943;
        Sat, 12 Oct 2024 01:28:12 -0700 (PDT)
Message-ID: <894abb0c-5ff4-4f86-9ecd-2e44907a39e9@suse.com>
Date: Sat, 12 Oct 2024 10:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
 <BL1PR12MB58499172314E76D9A9278746E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <BL1PR12MB5849C20650902FE3935BEC2AE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <075ce655-e871-4a3d-a550-7363bc4a165f@suse.com>
 <BL1PR12MB5849B929E9D01076059C739DE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849B929E9D01076059C739DE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CL0FgEzEZsRg8nAKKN4UUTJ0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CL0FgEzEZsRg8nAKKN4UUTJ0
Content-Type: multipart/mixed; boundary="------------lL0TMuz20RbslIt9gxK27WO1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <894abb0c-5ff4-4f86-9ecd-2e44907a39e9@suse.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
 <BL1PR12MB58499172314E76D9A9278746E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <BL1PR12MB5849C20650902FE3935BEC2AE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <075ce655-e871-4a3d-a550-7363bc4a165f@suse.com>
 <BL1PR12MB5849B929E9D01076059C739DE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5849B929E9D01076059C739DE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>

--------------lL0TMuz20RbslIt9gxK27WO1
Content-Type: multipart/mixed; boundary="------------mxVcTNCWp075btDOFJhwH1J0"

--------------mxVcTNCWp075btDOFJhwH1J0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTAuMjQgMDg6NTAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4gT24gMjAyNC8xMC8x
MiAxMzo0OCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDEyLjEwLjI0IDA0OjM2LCBD
aGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNC8xMC8xMiAxMDoyMiwgQ2hlbiwgSmlx
aWFuIHdyb3RlOg0KPj4+PiBPbiAyMDI0LzEwLzExIDIwOjA2LCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOg0KPj4+Pj4gT24gMTEuMTAuMjQgMDU6NDIsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+
Pj4+IENvbW1pdCAyZmFlNmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRkIG5ldyBzeXNjYWxs
IHRvIGdldCBnc2kgZnJvbSBkZXYiKQ0KPj4+Pj4+IGFkZHMgYSB3ZWFrIHJldmVyc2UgZGVw
ZW5kZW5jeSB0byB0aGUgY29uZmlnIFhFTl9QUklWQ01EIGRlZmluaXRpb24sIHRoYXQNCj4+
Pj4+PiBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4tcHJpdmNtZCBjYW4ndCBiZSBsb2FkZWQgb24g
ZG9tVSwgYmVjYXVzZSBkZXBlbmRlbnQNCj4+Pj4+PiB4ZW4tcGNpYmFjayBpc24ndCBhbHdh
eXMgYmUgbG9hZGVkIHN1Y2Nlc3NmdWxseSBvbiBkb21VLg0KPj4+Pj4+DQo+Pj4+Pj4gVG8g
c29sdmUgYWJvdmUgcHJvYmxlbSwgcmVtb3ZlIHRoYXQgZGVwZW5kZW5jeSwgYW5kIGRvIG5v
dCBjYWxsDQo+Pj4+Pj4gcGNpc3R1Yl9nZXRfZ3NpX2Zyb21fc2JkZigpIGRpcmVjdGx5LCBp
bnN0ZWFkIGFkZCBhIGhvb2sgaW4NCj4+Pj4+PiBkcml2ZXJzL3hlbi9hcGNpLmMsIHhlbi1w
Y2liYWNrIHJlZ2lzdGVyIHRoZSByZWFsIGNhbGwgZnVuY3Rpb24sIHRoZW4gaW4NCj4+Pj4+
PiBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3NpIGNhbGwgdGhhdCBob29rLg0KPj4+Pj4+
DQo+Pj4+Pj4gRml4ZXM6IDJmYWU2YmI3YmUzMiAoInhlbi9wcml2Y21kOiBBZGQgbmV3IHN5
c2NhbGwgdG8gZ2V0IGdzaSBmcm9tIGRldiIpDQo+Pj4+Pj4gUmVwb3J0ZWQtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1k
LmNvbT4NCj4+Pj4+DQo+Pj4+PiBVbmZvcnR1bmF0ZWx5IEknbSBzZWVpbmcgYSBidWlsZCBi
cmVha2FnZSBmb3IgdGhlIDMyLWJpdCB4ODYgYnVpbGQuDQo+Pj4gQ291bGQgeW91IHBsZWFz
ZSBhdHRhY2ggdGhlIGxpbmsgb3Igc3RlcHM/DQo+Pj4gVGhlbiBJIGNhbiByZXByb2R1Y2Ug
aXQsIGFuZCB2YWxpZGF0ZSBpdCBsb2NhbGx5IHdpdGggbmV3IGNoYW5nZXMuDQo+Pg0KPj4g
SSdtIHVzaW5nIHRoZSBhdHRhY2hlZCBrZXJuZWwgY29uZmlnLg0KPiBUaGFua3MsIEkgY2Fu
IHJlcHJvZHVjZSB0aGUgMzItYml0IGJ1aWxkIGVycm9yIGxvY2FsbHkuDQo+IEFuZCB0aGlz
ICJBZGQgc3R1YnMgZm9yIHhlbl9hY3BpX3JlZ2lzdGVyX2dldF9nc2lfZnVuYyBhbmQgeGVu
X2FjcGlfZ2V0X2dzaV9mcm9tX3NiZGYgd2hlbiAiIUNPTkZJR19YRU5fRE9NMCIgaW4gYWNw
aS5oLCBsaWtlIHRoZSBvdGhlciBmdW5jdGlvbnMgaW4gdGhhdCBmaWxlIGRvLiIgY2FuIGZp
eCBpdC4NCj4gSXMgaXQgb2theT8NCg0KRmluZSB3aXRoIG1lLg0KDQoNCkp1ZXJnZW4NCg0K

--------------mxVcTNCWp075btDOFJhwH1J0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mxVcTNCWp075btDOFJhwH1J0--

--------------lL0TMuz20RbslIt9gxK27WO1--

--------------CL0FgEzEZsRg8nAKKN4UUTJ0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcKMxsFAwAAAAAACgkQsN6d1ii/Ey8Y
RQf/bCfxdHN7w9BDH+qs+M7S5nnNGbLp/sfuzJC3Z17ZpylvzkIhylp6olmd5OQyXc+jHAgb3VGp
vZfVSxfnH2UxS5MPSVY2Swpq6U8lEltccSDmS8FjPpCduTdMjq3Yt35vNo4qsgipSrOUg4rA5vHK
cMU4RIaMpg23+x1L6FXJ23+cgD/a+KfzB4YlxQlrf8sD2tO4PvN/lKzPGtOsDQ0spGZZGtW+7YcE
Wk749oGZaxj/DomWAIZhx7Z93MpKNFk0BJftGBANx/3JRdssb+p3oGM13G1/NBvOfY5MmUibx3Ed
F1aSnvZcH2iTeI1So1q9ZXqlDpPWJmGRS+3syKRQSw==
=mm+3
-----END PGP SIGNATURE-----

--------------CL0FgEzEZsRg8nAKKN4UUTJ0--

