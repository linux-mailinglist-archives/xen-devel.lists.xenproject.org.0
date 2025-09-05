Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF222B44C6F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 05:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111177.1459991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuNMG-0002Fo-RN; Fri, 05 Sep 2025 03:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111177.1459991; Fri, 05 Sep 2025 03:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuNMG-0002Cl-Mp; Fri, 05 Sep 2025 03:43:28 +0000
Received: by outflank-mailman (input) for mailman id 1111177;
 Fri, 05 Sep 2025 03:43:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iOkq=3Q=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uuNMF-0002Ce-Cg
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 03:43:27 +0000
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 749e2de6-8a0a-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 05:43:16 +0200 (CEST)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e94d678e116so1909009276.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 20:43:16 -0700 (PDT)
Received: from [10.138.34.110]
 (h96-60-249-169.cncrtn.broadband.dynamic.tds.net. [96.60.249.169])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e9bbdf57cc0sm2793700276.13.2025.09.04.20.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 20:43:13 -0700 (PDT)
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
X-Inumbo-ID: 749e2de6-8a0a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757043795; x=1757648595; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2zQhNvAcIHUkjaejeDu6urO9HeyOmYI1JdYTW0V/6oU=;
        b=TFKyB0tmDI3fRicnCm4hOmQXBFd8ZY1jTDj3m+OCQmYPPpENuVPiCoNv1/cDnFq8bo
         vonRyO6QYKaqnqzJZgQPxz1dDEBXToLJtDZjhNfMn03z6d4X4PwcPKPlHinqi62bmyvG
         L9S8s927RDxZQZwEKnT4VTNCF40ON5UKRKS1gitWW/mem/tLlxqiHjalCSVtyQPibuTB
         Rhj+UB2LSWsSTLhYiYKV62OlT0sC0lu4YHXAH2XHTzshJJg/kQm1c04xcGv5JlFnov68
         CMeY4Yuda9TCr1wtiYwEe/FZf6FL7qPzIM5rCOcdoWObErldIM+o4GBTS2PTmvdwCjSB
         6iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757043795; x=1757648595;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2zQhNvAcIHUkjaejeDu6urO9HeyOmYI1JdYTW0V/6oU=;
        b=hOSqwMx2+igg0oIIG7HB2BFI1aGobgERJpTHddobuYtYyvtCbUTi/7xYJAoKJS/Irh
         PJ30a09UrbluWiyLCBOqhM6POJ07tIKP2A4hwpfGCEVMUt1SuAHnqhiaFLcnEURmSXVl
         HC6nzmNoPTHOhOWiZoP3ikt3U37FJOFFySGPtLvGwH5ScYU1LX6iRZucka+GnEvkfl9U
         Adyq9QX9RKcuVeCKSef1kQXNyLw7GOBl01CWYMLrC4lS5sDpKvYuFi2J29RNcCxADsfS
         EuK0rdFP3+QsBPOeHhqpLtmo7kULt1VUBtbZgTS7v3tZXSCndsyjIWEcIMeWbp/Ylt2U
         4WMA==
X-Forwarded-Encrypted: i=1; AJvYcCV7xQG78UEKPXcZUeSH8+dz5MvDcpmaRHhKzIk3u104ipNSsJudO2ruRRmUFClMUcOkc2BC/cprf9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxU4OwxlCNlJaSM4oA7AQWYnFABu6ZFN1214eCLXdtCFIIDjXve
	iZe28NZkPXIAdM9YeYFfxuPWNhBuE6td2tg/NevxRGoyxsT6OT49aqC0MsyedUxv
X-Gm-Gg: ASbGncvhCBFmfkkOlw3mxxEe/LNiW2N4n02uqsK1qABPyL/oM/yGNLkcoNHftecKJXm
	zOErlWeD6VVcoFQu/fjMKDfUgOPsnXr6cjHUJsA4uscRVXhLDunOkptx1YJnyGcOxf7GrTu6PIL
	gP84nk3gGbsZg/ZIW3l/OyC36U1Ds+glmNq/rBuzY+80sisPApzEyxA+BOTeE+7OlDApLYvs6JM
	Q1SThmhWzU9tp3bADx2OVi5lPR2VcaSAgQMfe/9dv6xV7AYAdD2XQ7z44EqdPi2iF6TdeFoThyW
	ydNvgzbzhz7iEjBi87PcKi14EVPQ9qrcxuy8DPujF2EauKtWJ+sNJ9KJX7kucK5zG6weipvqMTW
	KZqSbh4TO7CmWSaMPXhDUA3A/8QJ7EQyz7OOxKZLYYzq14qCmiWzRtEUkOrWgTu1nv689QCborn
	Zt6HO25HT9oQpsTejfEwkStDJj/lnvBRRhGG29GgAuqjEeUw==
X-Google-Smtp-Source: AGHT+IFbcywim/ULfHO/sn87UU4dLggomtkc8jsuIJQ1l1Jw8gj1yKhtsqyk1CSkx1R1/iv719bTOA==
X-Received: by 2002:a25:8684:0:b0:e97:55f4:3ed3 with SMTP id 3f1490d57ef6-e98a5828076mr19183633276.28.1757043795268;
        Thu, 04 Sep 2025 20:43:15 -0700 (PDT)
Message-ID: <5a6bf835-6c87-4e1d-adfb-a932fa1d7581@gmail.com>
Date: Thu, 4 Sep 2025 23:43:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20250806094929.293658-4-grygorii_strashko@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0I9vwDPw0jL26fHBaNe0sM2c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0I9vwDPw0jL26fHBaNe0sM2c
Content-Type: multipart/mixed; boundary="------------gP1rC7XyTbFWFX13NBMyz0eO";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Message-ID: <5a6bf835-6c87-4e1d-adfb-a932fa1d7581@gmail.com>
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-4-grygorii_strashko@epam.com>

--------------gP1rC7XyTbFWFX13NBMyz0eO
Content-Type: multipart/mixed; boundary="------------IwzRKAGR9ZilgszFKbC2Z0QT"

--------------IwzRKAGR9ZilgszFKbC2Z0QT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/6/25 05:49, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>=20
> Now Arm64 AArch32 guest support is always enabled and built-in while no=
t
> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
> support might not be needed (Arm64 AArch32 is used quite rarely in embe=
dded
> systems). More over, when focusing on safety certification, AArch32 rel=
ated
> code in Xen leaves a gap in terms of coverage that cannot really be
> justified in words. This leaves two options: either support it (lots of=

> additional testing, requirements and documents would be needed) or comp=
ile
> it out.
>=20
> Hence, this patch introduces basic support to allow make Arm64
> AArch32 guest support optional. The following changes are introduced:
>=20
> - Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable=

>   Arm64 AArch32 guest support (default y)
>=20
> - Introduce is_aarch32_enabled() helper which accounts Arm64 HW capabil=
ity
>   and CONFIG_ARM64_AARCH32 setting
>=20
> - Introduce arm64_set_domain_type() to configure Arm64 domain type in
>   unified way instead of open coding (d)->arch.type, and account
>   CONFIG_ARM64_AARCH32 configuration.
>=20
> - toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 i=
s
>   disabled.
>=20
> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>   AArch32 is disabled.
>=20
> - Set Arm64 domain type to DOMAIN_64BIT by default.
>   - the Arm Xen boot code is handling this case properly already;
>   - for toolstack case the XEN_DOMCTL_set_address_size hypercall handli=
ng
>     updated to forcibly configure domain type regardless of current dom=
ain
>     type configuration, so toolstack behavior is unchanged.
>=20
> With CONFIG_ARM64_AARCH32=3Dn the Xen will reject AArch32 guests (kerne=
ls) if
> configured by user in the following way:
> - Xen boot will fail with panic during dom0 or dom0less domains creatio=
n
> - toolstack domain creation will be rejected due to xc_dom_compat_check=
()
>   failure.
>=20
> Making Arm64 AArch32 guest support open further possibilities for build=

> optimizations of Arm64 AArch32 guest support code.
>=20
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
> - use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 s=
upport
> - rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work w=
ith any
>   initial domain type set (32bit or 64 bit)
> - fix comments related to macro parameters evaluation issues
> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>   AArch32 is disabled
>=20
>  xen/arch/arm/Kconfig                    |  7 ++++
>  xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++--=

>  xen/arch/arm/arm64/domctl.c             | 16 +++++----
>  xen/arch/arm/arm64/vsysreg.c            |  9 +++++
>  xen/arch/arm/domain.c                   |  9 +++++
>  xen/arch/arm/domain_build.c             | 21 +++--------
>  xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
>  xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
>  xen/arch/arm/setup.c                    |  2 +-
>  9 files changed, 119 insertions(+), 26 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a0c816047427..bf6dd73caf73 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
>  	help
>  	  This option enables PCI device passthrough
> =20
> +config ARM64_AARCH32
> +	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTE=
D
> +	depends on ARM_64
> +	default y
> +	help
> +	  This option enables AArch32 Guests on ARM64.
> +
>  endmenu
Why UNSUPPORTED?  A safety-certified build of Xen should only be using
security-supported features.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------IwzRKAGR9ZilgszFKbC2Z0QT
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

--------------IwzRKAGR9ZilgszFKbC2Z0QT--

--------------gP1rC7XyTbFWFX13NBMyz0eO--

--------------0I9vwDPw0jL26fHBaNe0sM2c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmi6XEwACgkQszaHOrMp
8lOMaxAAkFg4L8d7fVNX/HCDNBpDZ1ZZcMeM7100zkxBBHoacHgcG7Pd+TgnwPV9
cqjlVPCKsLmeB/M8CVeu5qn4GvYJeF4x0OarNt/LwVJIxwtiZBZ2v8uFdygy6kXA
6QGKx+FQl9ES6GCAnRhIbZyOi7tpn1tMEI/QYGpPfsNK9YZ3o8Mg9y7/GHxyCGca
ixTEgbBbVJ7pHPhpA3qrEII3IM9bAgNalVdMmiB/kzZLbw03tMKKrtgLcLjfzLTt
+DUtThg/hTTH7Ulec7LDEfvOGV36qAfYWdwviQiVf7gvOoNmJokFSfhNObk2QYTL
w5geqQsWtKiTzHIr6FNYVKV6tlImIHotsBq99A8xHPoPmLuruZq+9jWQ9iNESJhe
VNaXv6F2xTkACdfbMZELwE6Zh9m9KscutE38eqzPgu6oHllPXU4Q/GI5Ev0Lw8tu
5s0bEHtdLAMMRo3hdPtv73kAD8NAEHdAZYLGm6JQmiVXzsxluzI2IhkKqfRp3Z9j
8OBBlJ1A6XAI6KRqT1LvzvSdg/cmXcAUStpoPB65kizwwibLr2dxvdugyA6OkzZN
yBGZ0/i3cyqRRdUJpUT1Wc/cYor1J5l/UWv6/yrPfpVzEaK+YbxOj+JxXz87KhxU
z6Hx3WeDj7Vqku1Gfvbqvdz1nRDe7iYud7WdjGxY6DMKO7+Kf98=
=gX/d
-----END PGP SIGNATURE-----

--------------0I9vwDPw0jL26fHBaNe0sM2c--

