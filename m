Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E764B44712
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110889.1459894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGNM-0006UV-UB; Thu, 04 Sep 2025 20:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110889.1459894; Thu, 04 Sep 2025 20:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGNM-0006S8-RM; Thu, 04 Sep 2025 20:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1110889;
 Thu, 04 Sep 2025 20:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x0Uc=3P=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uuGNL-0006S2-MH
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:16:07 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc064b6d-89cb-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:16:05 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e96ee32f86bso1691551276.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 13:16:05 -0700 (PDT)
Received: from [10.138.34.110]
 (h96-60-249-169.cncrtn.broadband.dynamic.tds.net. [96.60.249.169])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e9bbe05caf7sm2552164276.18.2025.09.04.13.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 13:16:03 -0700 (PDT)
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
X-Inumbo-ID: fc064b6d-89cb-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757016964; x=1757621764; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1k1lpYZuAqu4iz5Acx22WmfknhU7xGNoe09fZSn97o=;
        b=eNOmMQT21QluU0UbXMCkgCU3SgZafcJkNjZf79VTPkeVitCR1kDnu/sv8FMrBOoCSv
         s7UeXShri9s7Nfg0loBu+CSNg8Gg1Iq/wHhtOJ9qLxraq6hk5xP22cdLEtfWUT0W/re7
         z8Rc3dTnpAU+V8EFG843K8d1VTGOIlxgeBwZbMJNN/VKSsY3/0kAx/Npj8i5zHGUw2Us
         OSJOwLMPIPF62uDhZnPsxdx3oBM4dk7876/QVoHgQDfVEzaqqYOE1BVGyxf0Stwpphvc
         OZMEdlDGwH0MVhI2VpDMqcdOKeIVkF/O6xpUutxe1JOUfBl0fuLnP0qgJKjuM0fqgk+4
         MQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757016964; x=1757621764;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1k1lpYZuAqu4iz5Acx22WmfknhU7xGNoe09fZSn97o=;
        b=dEewyNQykWzpRnkPvtUCsm+W8jOmbNuG1HFXtMeXt8ID3oj10hhhPCPt0sYqqlZUf+
         +bkuaSAg9OpPU3eHJTlgdIJYuKzqYP/uOVfXmSlbogsUe//kvWgWgFEkCRFnUy4KpaTL
         4aCtUUvlA5g1ABVlXd10l/kxXUYv7vr7HcENGG4fEoyIwmu2dCVkXL+/fi/kHbTRnfGZ
         ZjnN0lXnrAL+7jhFjD4RsE2oyquFnGrnTrwWfAcTQ4qnW2aSFxitmrvI+C9JlgF1v1Yt
         bYoR5aowzv5RQ5KnwCzAbZCeHppAGhmioWt0fQX6GDf854wbbfMZSCgrNGISW5xzIwWX
         894Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOjc9LlccSLgUa/M722tv5yCE+vb42PRONhxEYhpApaTTjQg+/m+mkjLD3QugPq0kLSuQPyPVXp3M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycHS/UCKGOq6/M2PWnS/q33y1PQ/rgO/m3Ju2Lb754qy++HvvU
	GDenA/zS/HNlKMVTlChqJJiycg34tL4oXNXEXX9SFn/CKhImz2MkMiq7
X-Gm-Gg: ASbGnctLfgUXcuZAC9nZD1EZwgQOpzkSuBjG/0ArO9B2mC5nz/LN2O3JVeB1hNEpZ/e
	ZrPEAKN54BJI+ymfhj54MgiwPX8M3gfWIDfeKavQ70z45neEUYNhri93n3R1qaiorChVa1XysYP
	NSu5Zc9Nk2BTVunptFJLnu4gZl/6ggiMQKRl/oyxBtfJYUfAcebvlp/jL1ob7V86iQUh/iAy2yN
	NuKesNOJSTzgqedvowSoeOtPatJ3IcjVQZijnJPuz3DTunXMz2eQtV00ni6a26BRTY37I0Z4bxg
	6FVHCVxa/deFy/gdaWxBtV62TdoZIPc4vGYjGRudLs3Mo98CM2OiYjFcA/psM6U/xXy3L3v0VwH
	PbgPW74gpzD3KeGteG0WczLJg55Oq4QKYxXh7HhJQ5e+vIahTrgf5KBqeq95AUrbVnhXu4GZgxR
	Fm30xvK5xBdoJN8oJ197FpB83oRpO3B/pkbbs=
X-Google-Smtp-Source: AGHT+IEQ6QpDFY00OJTcHDsZe1WTRw9DiYaC0dp4ClZOE6GYH7FgsYFa4Oh6myK/B3hrR63vP03Mkw==
X-Received: by 2002:a05:6902:722:b0:e9d:6f90:4ea2 with SMTP id 3f1490d57ef6-e9d6f906b97mr3317218276.41.1757016964039;
        Thu, 04 Sep 2025 13:16:04 -0700 (PDT)
Message-ID: <4bfee720-f117-4ac5-8cf8-8d9e718f6694@gmail.com>
Date: Thu, 4 Sep 2025 16:15:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/4] xen/domain: domain ID allocation
To: dmukhin@xen.org, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>
References: <20250829232132.3460081-1-dmukhin@ford.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20250829232132.3460081-1-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fGDeXpi1SQjm1isRPik0W30H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fGDeXpi1SQjm1isRPik0W30H
Content-Type: multipart/mixed; boundary="------------VK0TclJNYd1AGnbUk6dwDcHa";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: dmukhin@xen.org, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>
Message-ID: <4bfee720-f117-4ac5-8cf8-8d9e718f6694@gmail.com>
Subject: Re: [PATCH v17 0/4] xen/domain: domain ID allocation
References: <20250829232132.3460081-1-dmukhin@ford.com>
In-Reply-To: <20250829232132.3460081-1-dmukhin@ford.com>
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

--------------VK0TclJNYd1AGnbUk6dwDcHa
Content-Type: multipart/mixed; boundary="------------dtq6rM3YkqTpyjNH1vW088nB"

--------------dtq6rM3YkqTpyjNH1vW088nB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/29/25 19:21, dmukhin@xen.org wrote:
> Patch 1 introduces new domid_{alloc,free} calls.
> Patch 2 is a prep change for domain ID allocator test.
> Patch 3 introduces some basic testing for domain ID allocator.
> Patch 4 adjusts create_dom0() messages (use %pd).
>=20
> Link to v16: https://lore.kernel.org/xen-devel/20250812223024.2364749-1=
-dmukhin@ford.com/
> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/2012378054
>=20
> Denis Mukhin (4):
>   xen/domain: unify domain ID allocation
>   tools/include: move xc_bitops.h to xen-tools/bitops.h
>   tools/tests: introduce unit tests for domain ID allocator
>   xen/domain: update create_dom0() messages
>=20
>  .../xen-tools/bitops.h}                       | 16 +++-
>  tools/libs/ctrl/xc_misc.c                     | 13 +--
>  tools/libs/guest/xg_dom_elfloader.c           |  1 -
>  tools/libs/guest/xg_dom_hvmloader.c           |  1 -
>  tools/libs/guest/xg_private.h                 |  2 +-
>  tools/libs/guest/xg_sr_common.h               |  2 -
>  tools/tests/Makefile                          |  1 +
>  tools/tests/domid/.gitignore                  |  2 +
>  tools/tests/domid/Makefile                    | 88 +++++++++++++++++
>  tools/tests/domid/harness.h                   | 54 +++++++++++
>  tools/tests/domid/test-domid.c                | 95 +++++++++++++++++++=

>  xen/arch/arm/domain_build.c                   | 13 ++-
>  xen/arch/x86/setup.c                          | 11 ++-
>  xen/common/Makefile                           |  1 +
>  xen/common/device-tree/dom0less-build.c       | 15 +--
>  xen/common/domain.c                           |  2 +
>  xen/common/domctl.c                           | 43 ++-------
>  xen/common/domid.c                            | 95 +++++++++++++++++++=

>  xen/include/xen/domain.h                      |  3 +
>  xen/lib/find-next-bit.c                       |  5 +
>  20 files changed, 397 insertions(+), 66 deletions(-)
>  rename tools/{libs/ctrl/xc_bitops.h =3D> include/xen-tools/bitops.h} (=
84%)
>  create mode 100644 tools/tests/domid/.gitignore
>  create mode 100644 tools/tests/domid/Makefile
>  create mode 100644 tools/tests/domid/harness.h
>  create mode 100644 tools/tests/domid/test-domid.c
>  create mode 100644 xen/common/domid.c

Would it make sense to support virtualizing the domain ID space?
That would allow the toolstack to only allow a domain to communicate
with other domains of its choosing, rather than with any domain XSM
permits.  This would also allow avoiding domain ID reuse problems,
because a virtual domain ID would stay valid even after the domain
it refers to no longer exists.  It would need to be explicitly released
by the guest kernel before it could refer to a different domain.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------dtq6rM3YkqTpyjNH1vW088nB
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

--------------dtq6rM3YkqTpyjNH1vW088nB--

--------------VK0TclJNYd1AGnbUk6dwDcHa--

--------------fGDeXpi1SQjm1isRPik0W30H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmi583sACgkQszaHOrMp
8lOjTg/+LyCf1NTwzeWd4/3LxkSgwtOdaTEUN5y+XiR7pb3F4PU7sILOpsogpPeu
+eQK715qqREW1vtqnSan6TVLUqEq+g7qi9cUv7neNnn9fB9Jwf8lcEmRmscoSKl4
m6tT5YgJ7DF6NOwXEMYqKa/HQviE+VZffA1y35jdIBpPtVSB1KbhVS6c1PntyA4G
EiBRJIHx8kppx7HLVeEN6k8upGKMJM6iaXUoxUMAJ5E37PXk1e1wOiAbheu7Nab/
efbaWBmPrFSsK2TQBxW1lCyWpbe3rXU8oaANZ3N770vnpNZIMlRiVhYJVZH4wfhb
Pqg0e5/792SvfsWHFig720BH1VNpgRfQ0tQAaABwxJjwnXzochqKJ7r907G3PvL5
6KVmE0tXcaoG35i7UXEgSJ2vMIDFOR7/IAmiZxR/E3eYxcxm9+5VP7eyh0P90m1n
fkc1fPSNXmaiwWSUWL20PKQItvAcGUetsIqlC0P8jqaG+G9ZbwpSJytWf10oHGYP
Do2dRLSYIxtjswanas7mmjO3Z2BsgiuBL4yxsw81LRDhIsh52bFX7rkCHUyK6ZAY
rld/lp6mwvo1GpafgsrP5Oq848+0Frd3df0uXTWwDpc0n3gB7GUiZNguytOi3IwI
fED/96xZZFaZy5M0FKPmtpf3IMSwcKae4WakuTcW0n8Aqny7o30=
=sFsa
-----END PGP SIGNATURE-----

--------------fGDeXpi1SQjm1isRPik0W30H--

