Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6DAAD75D2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 17:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013241.1391749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjlc-0003mY-Jt; Thu, 12 Jun 2025 15:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013241.1391749; Thu, 12 Jun 2025 15:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjlc-0003jw-Gb; Thu, 12 Jun 2025 15:23:00 +0000
Received: by outflank-mailman (input) for mailman id 1013241;
 Thu, 12 Jun 2025 15:22:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvSM=Y3=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uPjla-0003jq-GI
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 15:22:58 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d77731c-47a1-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 17:22:56 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7d094d1fd7cso139708585a.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 08:22:56 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8dc92c3sm52760985a.22.2025.06.12.08.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 08:22:54 -0700 (PDT)
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
X-Inumbo-ID: 1d77731c-47a1-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749741775; x=1750346575; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mUsBhFWy36x6Vn4SHsP5OuEL3fuIZymSm2+gVVVvs00=;
        b=Vj3jhrvGL6KGIIHJYNJroHmrfOVjcGzY6PJRw1bSLauDqjSAqc5REf1rG+F6GPCLcj
         QNOne7b1ppBJHD7U6Qd+zNlExRfPO60+wzipCFb9i0nUyD0nAGoLqp/QHnqKMuBZGCXY
         ojcAZ7er+YSjQzQ/fzs4nrIta9vBHtLRxnFHN4XuQ8N3qfT3ypuugiAeZSR8LegXzceM
         cdMu31vMjgtrPwBIrf/FCDMuMWwo+Cuq17opbLr6O8oKQO6cKteIFrOIfxPsNShnB/ga
         4adChszaZT0WImoY8Am9AlXXjQkD9g35QfpMhjJHUFPi4y4vYvKCeCJ3J2JSGNucyVbH
         Gv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741775; x=1750346575;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUsBhFWy36x6Vn4SHsP5OuEL3fuIZymSm2+gVVVvs00=;
        b=gVaFHPGqvDqhMncWMltZnUt3/tAJxBLvY+be/d6K6K7Qs5cgtKOk8Ttbt9GuFfy3NT
         kz78ZQ+ucNZnqGcElBzr261hcffYsPEdQB/nyujoK454JuKVbw7AAA4qOQFpeIZ6RStx
         Y+Gk7RYqK1IE2cQwF8Xsn6aTM7V3TkxTFp8sS+GvpvboR+2tE34t6QJe6lGyQ/ARxc0K
         5qX5idHzrPvliiZ94FoV1zAvX2TIq9kyaD32S7ohbCoS4Rbvqtw2r2TuRezwkBRs5ebb
         t1Ew2M8n7IrlqXX/NoFaU2BRvUEu4AkrNI7uRj4n/Z83GgpgksUQxXW/HpNijV355CFK
         NNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAwq9JzkJbrpqGh2Ho0pY6JQq6Tn0zkkOTxd9VwoBHVfs0RNc52+valu0nwtHiZbPK3QEdns1u+zg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPawFUrcGZ9zIcWZN2bAiFQD9StOmi554YQwpqnWCJOrBE9ebc
	DiyQ9IIBfjQtnII3eRoeVlkgfsYrQaA8J3BMK8g9GM6zO8ss7KGpRhN5
X-Gm-Gg: ASbGncvuX/5M2ZgjU9aZiSQJflacZlektUHmgAZmFXmaTwZndVd5pDp+XL6HMDF+cfZ
	WA8O5zGRpcZQXPMSlLpLdFsXg9JXbCxUnU0aWbUnGEslNMrA7QbGrhcWwYnjDXdolU4tyzwIiK3
	k76Std9avJWh9ovuYBps7Y9MdovS/JZo1vNyihj/gWGPdrCAUtEYbdB3/8t1LKc0KlqA2gQZSSQ
	st0oGY+RBo4XjxejWnL8U+F5gw5MtnOghcsF9Eio5jwEPHA3nUkZ6i83rBuexXE7ytx6rv0p1Dn
	ysGQ6K3kOGDgS2Ei/4Pkr4n24Zw+QocPwa9xCabXzeTPzYb71yU46/M1sCW88AX/ACcTiwkvghG
	cEg==
X-Google-Smtp-Source: AGHT+IHGj2W0Y9dgpQZ5nQgC7Ridrl4+EIfLPnyRaO3LogVm36MCIe+AQ+JhWa00i4iW9zj+fo+rLw==
X-Received: by 2002:a05:620a:25d3:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7d3b29f099bmr555679885a.15.1749741774952;
        Thu, 12 Jun 2025 08:22:54 -0700 (PDT)
Message-ID: <842eb63e-cd20-4c0f-9f25-9d9c2a5457b1@gmail.com>
Date: Thu, 12 Jun 2025 11:22:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Trammell Hudson <hudson@trmm.net>,
 Ross Lagerwall <ross.lagerwall@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z18kng6eo8ZvktkXYjDuEZMl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z18kng6eo8ZvktkXYjDuEZMl
Content-Type: multipart/mixed; boundary="------------D9ZKRkWnidZC6bnnEe9nSMHd";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Trammell Hudson <hudson@trmm.net>,
 Ross Lagerwall <ross.lagerwall@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <842eb63e-cd20-4c0f-9f25-9d9c2a5457b1@gmail.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
In-Reply-To: <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
Autocrypt-Gossip: addr=jgross@suse.com; keydata=
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
Autocrypt-Gossip: addr=marmarek@invisiblethingslab.com; keydata=
 xsBNBE5j9EwBCACbYHjxDrxFAY3n1x9KBFvjzkG1qFSTVBnH4vpD/5Na4sZq4uDDMUCjivrm
 MzbWYaivYj96BygdOiw7PWxYrhuW0b2WYOeGudZyApgFz42g458s78EciuhgfuWBlxr8dOEN
 /9ueVFHcvtZmDbHhMVPcQ0O7gwh0JmwkOsf7P7WAfYXsQlhO/EBRrNXR0Je+GEpYADhRktxX
 h1d3Iz+oKYuwHioLX8ovoAT4+peOuecWUSpUWebpDbTR5i7NRP3PIblB4KzWJa2kh/f3mx4v
 SRGnHn+BfX42xSe0X7Ktl4Xf+KNq9Wkcjk2CZP57hV2v4pO0ZUOXD7IhlZtnfNj67WjdABEB
 AAHNPU1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
 bmdzbGFiLmNvbT7CwHoEEwEIACQCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AFAll+l7cC
 GQEACgkQ24/THMrX1yw6kAgAiKiUhzAPXZj5ndqiQDl8u8PUK34SupLzYNMJOCBw5Wh+CPHe
 XYlQUwfULWxmzjiWCzzWDx2X/ONsYdRGKDKMqG5srOSWe1IYXv00MEutGsK+m/hmC5mqi/97
 DVNZ1VtKj5WW79IsI0/7ueHsQYNNrXyOfZvKsRE8VIUJ0tNfLFDFlNpq9jONuF+GviMWxrA5
 FoVaGmjh63xC0fOQYqhP2v8dbYS4B6bO5NZKI2cTHb9Li2iY0e7wIoNgvqgtR3Iv2U2Ry0yL
 D3mNQhwyxcWChexlymjfqLEZwKqaIOo57HOpt7OA+bMg6MvkdUTjNWf2GE6fqCcALjcToJ3L
 NDc1KM7ATQROY/RMAQgAtRWgUZ5mOy+c/qzmiVnxqDkiOJjmnIh3Pn+OqCtjcrTyPI9eVc06
 uH30Jkco0soLiG/UgwVw4XwBlm95j9n6TSUms4mPBh1YiR1hBjsjYwn8zp/Ue9xWk1N6E14H
 aj55GxmS2H3YIlOXfQLr0X3RHsmKixTOKyisrYlJu71FmettDFV7CgMXy1Bc1LbAE08asvAS
 ShHFdRiRRtkuVHvY/Ebq9L54kOxtlI6ahrflMcT0YCMON5oe4GgQRh3p2uy+d/LS2bgRcQST
 IebErj8x0lM271f97GvxV/ypHo7XVIDI5FX1u31Agzx3HQr035GHt4HV4/GVCz+V4xt4BonB
 tQARAQABwsBfBBgBAgAJBQJOY/RMAhsMAAoJENuP0xzK19cs5MgH/jWLXil2Ud4TdtWnBxc+
 2/QZZk2JCssc1PgWNzvH5wH7U+8lGSlUK8ZMOqrrF8C5rX0+xEn7deSrsZChIOnUFo8rhCZK
 y/mBV+FhkMj24FZZ0n8w3eF4KF2t68Pt+AvMjxQHwxAMdf3QftgQhD0qYkt/28eedUQ+jwz6
 kipc4qUQmqTEViQRPa3WAnKgNDQUDUwNruzthfGvHUjllf7zbPI8gkbARM0KlTkLikc9u+Ni
 VMbJTiGPB7YHyw2MIPq1n+mhSPAyXE6CVBnYkonQ7P3SLZssxC3PIarV+DTU68umQB3pfrfF
 7hMcAY5csWrK9/x/Zz4RUfgN6Q3HLrSp9UQ=

--------------D9ZKRkWnidZC6bnnEe9nSMHd
Content-Type: multipart/mixed; boundary="------------hDr5RUQi30MQZh0ETQ5E4wWV"

--------------hDr5RUQi30MQZh0ETQ5E4wWV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6/12/25 06:06, Jan Beulich wrote:
> On 12.06.2025 01:58, Andrew Cooper wrote:
>> 2) Pre-boot DMA Protection.  Microsoft consider this a platform featur=
e
>> requiring OEM enablement, and do not consider its absence to be a Secu=
re Boot
>> vulnerability.  But, it is less clear what the policy ought to be for =
Xen
>> booting on a capable system and failing to do a correct live-handover =
of the
>> IOMMU across ExitBootServices().
>=20
> Shouldn't this be another TODO item at the bottom? We don't support yet=
 taking
> over when the IOMMUs are already enabled, do we?

Dasharo supports leaving the IOMMU enabled when transferring to the OS, a=
nd
this message was sent from a Qubes OS box booted in this configuration.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------hDr5RUQi30MQZh0ETQ5E4wWV
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------hDr5RUQi30MQZh0ETQ5E4wWV--

--------------D9ZKRkWnidZC6bnnEe9nSMHd--

--------------Z18kng6eo8ZvktkXYjDuEZMl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmhK8McACgkQszaHOrMp
8lOa0g//S9KXBVIRR5G5TJm0bUihSW5kpXvB7QZ86PSCXg4t7s69iNiTqXjzbxYd
Oplfo1hU12eR57ZiiOe1W009giWBFaB0gCp6bNP/a2JUxcs0AFCQF58aMR/9RL38
oUfbR708RRAL91apxmDgnktdRviFNMKQ5IAq/D2RaIaBXQlDoc1RR0pixIh4XGpq
2Rps0J+YmOvKvlpgSFkzsn6tZbpboY9iPoLPq8/jNNLZTWrHwMcXV2zq53NefZ5K
F5d4phw+QjHX/fNS5zlyG1KsgAZjG2vupi78rtvpoIoew5yryx87Do3ma8elTjgz
7y4YuamrFpbwwhDgXM9lcH0ax5pwqb80M5ToY0Tw8XyZ1De41CQUjET3Dir1Qci5
fxEFf2/iYW1wBOZ+mjmD/Z6rdJ8uzFE1GkuY0LnIidc2/Xz7Yc2Rzrcc8wgs7XFF
aIy2wj2ayRnn6nyS+NE3+JGwiX0W9EX1JNrrGmXPw8rkSAZcO1nah9abiAFhetdg
9Jzz7zcFYi7+TCzib8LbeK6HEgSnr9yjcssJ0V/392claGqtCvGR09XrgrZPoqSN
+BkpGDYo4uxYEpNoEb3uz7YWihkMzRYR7kBum2xPa0lG/bAbK0ZZ3enfi13Z0jFU
BHE3VdzxbcxPaxun00l34mqsKNHJPVpfpVZa4+TA2+UPnI7Jbpw=
=rgLd
-----END PGP SIGNATURE-----

--------------Z18kng6eo8ZvktkXYjDuEZMl--

