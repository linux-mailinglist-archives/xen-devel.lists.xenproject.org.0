Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A5C4C357
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:53:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdiUU-0003eZ-Fc; Wed, 19 Jun 2019 21:51:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9VwC=US=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hdiUT-0003eU-0z
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:51:37 +0000
X-Inumbo-ID: 6857b0a2-92dc-11e9-8980-bc764e045a96
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6857b0a2-92dc-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 21:51:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p26so1467482edr.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=4xMuCa+mvo1EaKiHs3v9ZeEFz4BkFeviDwaPR8/rmkY=;
 b=mDU2Rm2SbzJ8o1iCdcVgn+k9CdpvmNlnIcG2014yjZ3DIOknatFKKgiq4AYSPVulzw
 k6aQwFpiEOcxKEgkjdqh7FnraiHeU3EY2EpfYjgzz3r03fmJTFQoyDxOd8o3pxoMTFJ+
 oDQx7mJNFuZy4bKaqVBQ+p+/sN3/dpHBDUvwoSB2+qOdxJuJPfunZmdjJ5T01RhoowC3
 9zKocPyO74RqcJWPVvvcIKWjnOkejVvIRMBLb3GCvMDv1fBF3/LaT5AtGiVl9KJ0S0kR
 klfUrkFY5uuOtiPqkz8zBk16x3qyccj70iA88cfoJteOAycoC1hQg62HjwhWU9Kqg6WV
 yhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=4xMuCa+mvo1EaKiHs3v9ZeEFz4BkFeviDwaPR8/rmkY=;
 b=eGWBQQ5xHYlOET3baOybpx0sVr2gy3SQK8TXiLQzOLGkEQ6e6Aui8EqmV0ySH6vB8V
 6GRH0515+/SN8xK5czVI4bzVeCcM1T0Z5l7BPZUkQ+daSDYMNOm94ntaE7vg7bH641hS
 Csk4Nw+Z/b67pj0kpH1Ptz+skswECZoxCFyXcPVC45Ltu2DdYHEbdSySXRL5bxMf12xW
 VHu+XdSAEGtrYBHZ8gwE8LZigIbSnOzS9BKKZckL0B7OA05zfOVsvBZwYegzcrDFh5j7
 pWSZMIZ3bHrI/V+REd5H2413ZbD8bKjJLn9nlkXkZi2++6sfCNwGsZyjG0A887ZA1tk0
 SxJA==
X-Gm-Message-State: APjAAAXf8QwPb3bt3+9JGXJC3yGgCTuN1k0QJhOxTsR3/V5Yx5HLn9RC
 hlJY4DhA3AsDdJ6FnQksDD4aA5cVOWY=
X-Google-Smtp-Source: APXvYqz7NHhK2+yvF0u1Jb2UZTFQf6ZBPj4i6+bf5ZiOQE3x+Krxx/n8nghjmOhIeqjrNMv0J5o2qQ==
X-Received: by 2002:a50:eac6:: with SMTP id u6mr27849006edp.83.1560981094653; 
 Wed, 19 Jun 2019 14:51:34 -0700 (PDT)
Received: from ?IPv6:2001:16b8:66da:e100:1e4b:d6ff:fef9:46e6?
 (200116b866dae1001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:66da:e100:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id e33sm6140077eda.83.2019.06.19.14.51.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 14:51:33 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
 <45406dbd-4aa1-8852-475e-1c37c93a7fa3@gmail.com>
 <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fbe53d36-7027-2a97-72eb-2776e8fd6700@gmail.com>
Date: Wed, 19 Jun 2019 23:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0167685662362510677=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0167685662362510677==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KYF0fGJcpo4QknqiJQ4HKN7JyKAXwiKqX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KYF0fGJcpo4QknqiJQ4HKN7JyKAXwiKqX
Content-Type: multipart/mixed; boundary="ok8BfPq2rYtdtEdnWHmWWUyaUafUlQP3Y";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: Julien Grall <julien.grall@arm.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <fbe53d36-7027-2a97-72eb-2776e8fd6700@gmail.com>
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
 <45406dbd-4aa1-8852-475e-1c37c93a7fa3@gmail.com>
 <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
In-Reply-To: <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>

--ok8BfPq2rYtdtEdnWHmWWUyaUafUlQP3Y
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 6/19/19 5:32 PM, Julien Grall wrote:
> Hi,
>=20
> On 19/06/2019 16:27, Andrii Anisov wrote:
>>
>>
>> On 19.06.19 18:06, Julien Grall wrote:
>>> Lastly, please clean-up the code and send the patch on xen-devel. I
>>> will have a closer look at that time. Feel free to ping me on IRC if
>>> you have any doubt how to proceed.
>>
>> About the code: I think omap5_init_secondary() must be moved to the
>> platform code (omap5.c).
>=20
> Well omap5.c is C code... You can't call C in the boot process at least=

> until the MMU is on and we fully setup the processor.
I don't understand this since init_secondary is installed in C code,
isn't it? (in omap5.c:omap5_smp_init())

--=20
Regards, Denis Obrezkov


--ok8BfPq2rYtdtEdnWHmWWUyaUafUlQP3Y--

--KYF0fGJcpo4QknqiJQ4HKN7JyKAXwiKqX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXQquZAAKCRD7iQsTJJ7s
+WFBAP9EzVfO2CIdu3plA+c5HiTRoVaBkZqOLg+Vm4Vw9zWjcgEA8IkZVn1Xru6+
7GFmxTOllRqN0pWisXIy+EB6TScpmVE=
=QQ6g
-----END PGP SIGNATURE-----

--KYF0fGJcpo4QknqiJQ4HKN7JyKAXwiKqX--


--===============0167685662362510677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0167685662362510677==--

