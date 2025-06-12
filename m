Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D87AD6426
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 02:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012250.1390770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPVOW-0007Oa-CW; Thu, 12 Jun 2025 00:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012250.1390770; Thu, 12 Jun 2025 00:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPVOW-0007LT-8u; Thu, 12 Jun 2025 00:02:12 +0000
Received: by outflank-mailman (input) for mailman id 1012250;
 Thu, 12 Jun 2025 00:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvSM=Y3=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uPVOU-0007LN-Ia
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 00:02:10 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b835d81-4720-11f0-a307-13f23c93f187;
 Thu, 12 Jun 2025 02:02:09 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4a58e0b26c4so6344791cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 17:02:09 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a72475b774sm3258331cf.32.2025.06.11.17.02.06
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 17:02:06 -0700 (PDT)
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
X-Inumbo-ID: 7b835d81-4720-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749686528; x=1750291328; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IirsFKR2KGHzCVoiPPxC4rjmPNxAn0Z1MtiZz0+qkyM=;
        b=gYFiRnOxpsA0HSYAyMKeYmBUFNCn9BevfXRrTguk1wNW9w39sxFTHFKD+ziyiOW8rJ
         JaZ2b42FFNATcQa4EsrC5B1z5ORL0bhcbNjtkHtafBX4A7ziK9y3/XhlgTTUyluUJrCQ
         UwK34UJNaG4LdXBh/ZowOv7DDivnJDIkhChUBEVQh9pnFJDAIot53MWupMhtmBzqQOZP
         iX79odRvze+QqJ3wLEtO4XAUm88tzHZQZINyXZaLk7x3DNdyR6bKSo+gLgYrRfHkiK4L
         NOmkMNylmt+3qpmPHlo9gH6UXtSgMM4hsBnLiV0JaulzMUGPQijSreQZDg4J58cGQZJl
         Dl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749686528; x=1750291328;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IirsFKR2KGHzCVoiPPxC4rjmPNxAn0Z1MtiZz0+qkyM=;
        b=hCby2kLQLi11YuBLK6WL5Nib5wtfQk3hqP4mfEyF3RmaDTZ44ft/tGbgUHGUQKGwyN
         5hV6kaVhnM2RCv6hqevpTN6gaQC1f8+TVmqpSYZqnaqwuyWKxu8za/FjvPaKOcVomeU7
         Keg7nguA7u3N5WqIAF/9gTMEApXf6nJsxvt0BS3Ku70acrvImhNL1IKoRk6+JB4q3gH8
         FS9uFoBYZf9gy7YC0jP9JsWzGuoxCPBz4x2O/JkM8XmbPLKQHLO65/My0otyggc2Em8k
         yhcVdS3AO/ku9IttP3VBXLvAemAvHg15TI+KtswD5ijp8JlIEbLBUUvjKhME7ZU0dAnr
         CHHw==
X-Gm-Message-State: AOJu0YxIQg3zo9gmKPBuMtJfPpNaOcFLNmHWY/pgFYkvwBaPZT8zbtEy
	PKgWC9ptwAZY5+ySsvnLCN2TFdqJSRvHN4bDha/OVu3u0Hsd5p2qTtoqxlTGbw==
X-Gm-Gg: ASbGncuUES9mnejtZlIjSxEfAa4AylaFxPMrg1xWy4vIMoiOWo6l5hvp0BgBk68RGuj
	GKreg9HGZ4Y3usU6wXDRsOcnKYcgO8cTsV/p7bNWGqKLP+zOyOZoVohs2y2OFvV1R0X7WMdZPmn
	6jE3fEtJBvFMsv9D83h5Ky4jsOWSYKfuowa7Aj3tg60ZbHFfpKSccVDPkLjh9aF/LdES+pKCZEj
	X0i7K/dnBzwN6QDgFuopr1n0DhaxUKf9Qj29gaxHJFx8uet2tfBV61cvk+UMhFuZlJe0idtLfFg
	g0+IP7/lmsSDkenCY6rcQY4EW8aGuUs0MoHVA4rr7zUZnVf8sTWzfYJPjOJNYKdkRihY3xzJf5b
	fBw==
X-Google-Smtp-Source: AGHT+IF4xobj1VWQ1mt/pBPifGEnielR+WiaIhYDoaAYE/uFDByZnN6gsDGVmw2b7gyOfbmllrTOzQ==
X-Received: by 2002:ac8:6f0c:0:b0:4a2:719b:1238 with SMTP id d75a77b69052e-4a7228eccc1mr27066111cf.12.1749686527610;
        Wed, 11 Jun 2025 17:02:07 -0700 (PDT)
Message-ID: <70bb6971-2e61-4788-a44c-635b2070255d@gmail.com>
Date: Wed, 11 Jun 2025 20:02:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: xen-devel@lists.xenproject.org
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20250611235851.167385-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OimbzeVUm0WiME0J0ubnZ5tN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OimbzeVUm0WiME0J0ubnZ5tN
Content-Type: multipart/mixed; boundary="------------hxwS10Iz5cdlVgj6EKb6kEDa";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <70bb6971-2e61-4788-a44c-635b2070255d@gmail.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250611235851.167385-1-andrew.cooper3@citrix.com>

--------------hxwS10Iz5cdlVgj6EKb6kEDa
Content-Type: multipart/mixed; boundary="------------Vcj05XZj5Uy2HAspGQMVG8ok"

--------------Vcj05XZj5Uy2HAspGQMVG8ok
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6/11/25 19:58, Andrew Cooper wrote:
> Written to be solution and deployment neutral in order to focus on the
> technology itself.  This policy is intended to work as well for UKI as =
for the
> "classic server setup" approach.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: security@xen.org
> CC: Juergen Gross <jgross@suse.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Trammell Hudson <hudson@trmm.net>
> CC: Ross Lagerwall <ross.lagerwall@cloud.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> CC: Kevin Lampis <kevin.lampis@cloud.com>
>=20
> A rendered version is available at:
>   https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/=
uefi-secure-boot.html
>=20
> Obviously RFC at this point.  It's worth saying that XenServer is inten=
ding to
> use Shim and get a signature from Microsoft, retaining all exiting feat=
ures
> such as Livepatching and Kexec crash reporting.
>=20
> This trails off into more TODOs towards the end.  Individual tasks shou=
ld
> expand on the start made and resulting conversation from this thread.  =
As a
> reminder, the target audience for this doc is an administrator running =
a Xen
> deployment, but who is not necesserily a developer.
>=20
> Several things are hard to express and want further discussion.  Sugges=
tions
> welcome:
>=20
> 1) Content of CONFIG_CMDLINE and the various CONFIG_*_DEFAULT options. =
 Xen is
> not going to be issuing XSAs for "downstream chose an unsafe configurat=
ion,
> then signed and deployed the result", yet Xen probably should be on the=
 hook
> for bad "default ..." settings in Kconfig.
>=20
> 2) Pre-boot DMA Protection.  Microsoft consider this a platform feature=

> requiring OEM enablement, and do not consider its absence to be a Secur=
e Boot
> vulnerability.  But, it is less clear what the policy ought to be for X=
en
> booting on a capable system and failing to do a correct live-handover o=
f the
> IOMMU across ExitBootServices().
>=20
> 3) The AMD microcode signature vulnerability.  While it's not Xen's bug=
 per
> say, it's clearly a Secure Boot bypass because we do offer microcode lo=
ading
> capabilties to userspace, and malicious userspace can load an unauthori=
sed
> microcode which allows them to read/write physical memory and bypass fu=
rther
> signature checks.
>=20
> 4) Userspace Hypercalls.  To anyone who isn't already aware, /dev/xen/p=
rivcmd
> in the various Unicies is a giant priv-esc hole, as root userspace can
> e.g. issue direct memory hypercalls behind the back of an (intentionall=
y)
> oblivious kernel, and cannot be handwaved away as "it's fine because it=
's
> root" under Secure Boot.  It's not a Xen vuln (Xen *does* audit pointer=
s in
> guest hypercalls), but it is a guest kernel vuln because of failing to
> correctly audit hypercall parameters.  However, it does require substan=
tial
> changes in Xen in order to allow guest kernels to do something half-way=
 safe.
> ---
>  docs/admin-guide/index.rst            |   1 +
>  docs/admin-guide/uefi-secure-boot.rst | 134 ++++++++++++++++++++++++++=

>  2 files changed, 135 insertions(+)
>  create mode 100644 docs/admin-guide/uefi-secure-boot.rst
>=20
> diff --git a/docs/admin-guide/index.rst b/docs/admin-guide/index.rst
> index 54e6f65de347..e7895ee95001 100644
> --- a/docs/admin-guide/index.rst
> +++ b/docs/admin-guide/index.rst
> @@ -5,4 +5,5 @@ Admin Guide
> =20
>  .. toctree::
>     introduction
> +   uefi-secure-boot
>     microcode-loading
> diff --git a/docs/admin-guide/uefi-secure-boot.rst b/docs/admin-guide/u=
efi-secure-boot.rst
> new file mode 100644
> index 000000000000..0e0f50143892
> --- /dev/null
> +++ b/docs/admin-guide/uefi-secure-boot.rst
> @@ -0,0 +1,134 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +UEFI Secure Boot
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +UEFI Secure Boot is a verification mechanism, intended to ensure that =
only
> +code trusted by the platform can run.  This is to prevent malicious co=
de from
> +hijacking the system.  Secure Boot requires that all privileged code b=
e
> +signed, and that there is a trust relationship with the platform; i.e.=
 code
> +which is not signed by a key enrolled in platform must not run privile=
ged.
> +
> +Within the Xen architecture, Xen, the :term:`control domain` and
> +:term:`hardware domain` share responsibility for running and administe=
ring the
> +platform.  This makes their kernels privileged as far as Secure Boot i=
s
> +concerned.
> +
> +When Secure Boot is active in the platform, privileged code is require=
d to not
> +run any untrusted code (i.e. not run any code for which there is not a=
 good
> +signature), and is required not to allow this restriction to be bypass=
ed
> +(e.g. by command line request).
> +
> +
> +Support in Xen
> +--------------
> +
> +There are multiple ways to achieve this security goal, with differing
> +tradeoffs for the eventual system.
> +
> +On one end of the spectrum is the Unified Kernel Image.  e.g. Xen is b=
undled
> +with the dom0 kernel and init-ramdisk, with an embedded command line, =
and with
> +livepatching and kexec compiled out, and suitably signed.  The signatu=
re is
> +checked by the bootloader and, as this covers all the privileged code,=
 Xen
> +doesn't need to perform further checks itself.
> +
> +On the other end of the spectrum is maintaining the features of existi=
ng
> +deployments.  e.g. Xen needs signature checking capabilities for the d=
om0
> +kernel, livepatches and kexec kernels, and needs to allow the use of s=
afe
> +command line options while disallowing unsafe ones.
> +
> +It is important to remember that Xen is one piece of the larger platfo=
rm,
> +where every piece depends on the correct functioning of all earlier pi=
eces.  A
> +product supporting Secure Boot requires a holistic approach involving =
all
> +components in the system.  It is not sufficient to consider Xen in iso=
lation.
> +
> +.. TODO: Move "In Progress" tasks here as they become ready
> +
> +Security Scope
> +--------------
> +
> +Vulnerabilities impacting Secure Boot require a fixed component to be =
produced
> +and distributed, the vulnerable component to be revoked, and the revoc=
ation
> +distributed to platforms.
> +
> +The following principles and guidelines indicate where Secure Boot dif=
fers
> +from more traditional security models, and the situations in which ext=
ra
> +remediation may be necessary.
> +
> +Principles
> +^^^^^^^^^^
> +
> + * Privileged code shall include Xen and the kernel(s) of the control =
and
> +   hardware domain (both, if they're split).  While there is a privile=
ge split
> +   here in Xen's regular security model, they are equal from Secure Bo=
ot's
> +   point of view.
> +
> + * Root or ADMIN in userspace is unprivileged from Secure Boot's point=
 of
> +   view, and must not be able to alter the enforcement policy or load =
unsigned
> +   code even by e.g. editing a configuration file and rebooting.
> +
> +Within Scope
> +^^^^^^^^^^^^
> +
> +The following types of issue require remediation and revocation of vul=
nerable
> +binaries.
> +
> + * Any failure to apply enforcements even against traditionally-privil=
eged
> +   userspace, including failure to authenticate new code to run and fa=
ilure to
> +   handle revocations properly.
> +
> + * Any Out-of-Bounds write capable of altering the enforcement policy,=
 or
> +   capable of bypassing enforcement, e.g. by corrupting the running co=
de.
> +
> +Out of Scope
> +^^^^^^^^^^^^
> +
> +While typically a security issue in their own rights, these issues do =
not
> +constitute a Secure Boot vulnerability, and do not require special
> +remediation.
> +
> + * Denial of Service vulnerabilities.
> +
> + * Out-of-Bounds reads.
> +
> +The Xen Security Team will endeavour to produce XSAs for all violation=
s of
> +this security policy, including identifying them specifically as requi=
ring
> +further remediation by downstreams.
> +
> +
> +In Progress
> +-----------
> +
> +.. warning::
> +
> +   The following work is still in progress.  It is provisional, and no=
t
> +   security supported yet.
> +
> +
> +Secure Boot Advanced Targeting
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +SBAT is a recovation scheme for Secure Boot enabled components, using =
a
> +generation based scheme.  See `Shim SBAT.md
> +<https://github.com/rhboot/shim/blob/main/SBAT.md>`_ for full details.=

> +
> +Upstream Xen provides the infrastructure to embed SBAT metadata in
> +``xen.efi``, but does not maintain a generation number itself.  Downst=
reams
> +are expected to maintain their own generation numbers.
> +
> +
> +Lockdown Mode
> +^^^^^^^^^^^^^
> +
> +A mode which causes the enforcement of the properties necessary to con=
form to
> +the Secure Boot specification.  Lockdown Mode is forced active when Se=
cure
> +Boot is active in the platform, but may be activated independently too=
 for
> +development purposes with the ``lockdown`` command line option.
> +
> +TODO
> +^^^^
> +
> + * Command Line
> + * Livepatching
> + * Kexec
> + * Userspace hypercalls

This is so much more reasonable than Linux's policy.  I wonder how often =
Linux
would need to revoke if it followed a policy like this.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------Vcj05XZj5Uy2HAspGQMVG8ok
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

--------------Vcj05XZj5Uy2HAspGQMVG8ok--

--------------hxwS10Iz5cdlVgj6EKb6kEDa--

--------------OimbzeVUm0WiME0J0ubnZ5tN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmhKGPkACgkQszaHOrMp
8lO+7A/9FgDcFJUlaCE9Pah/GDgkCdjheoh3tlRfsVM/rCMYKMVzw5jWLprc7Ct6
5/gpHuui+WO3RtNoBJm/3K+WekD2zcSh+tBQMzfPAwl+dQegIe4drwrUJbA1lJJX
s9Liw17XHu51WbSB5VFEJUSjTQMd73cuZIU/jW/cFYQY8iG02It//IxexOui+vp+
qoKdUGhOFUrNoHWdYdMjHU+EFuAWvGXdB3pbvRyu69asEv7TxF99/TwkERXyxa6V
xSBdp3TvUDr3wsWLI1C290sG8Ir0U8OZ9U/3j/nzlFkHqQ2UIPXvygcKxsojwxBR
bonTUhqQFvnmboSLVHcE4zYqrcG/HwBJtLwp84gstiqZ53MFj47Gnna7izD2dqVc
Cv7TEHpAVtUIg8EIpkDL7I2g/4HzWhJsqKjJtQ290/Kt8YKtvHkkGy9C3NS5qEwO
Zi7xP1OXm3IP2RiS8alQDFB4LZdBImjCFij4nFKY9WRxNNS7ReZwrhvUOEiuvuaP
GRpF+9BXQJZk0FDndUZjdSfqQSI2On7hsFJ6bPU+pWCKvaZV0iXJ9MOw6SBuK4Tv
gRq9SZGU9GgyFV3A6dy2o95EKSZ/rDlhi1gINJ0G5YoNWzIpQqu0NAD/MZW3Ja4B
15pUHu01Ksme9Masiqif17bdMsESbL9IM58lst8c29AmWDdyCKw=
=40Yu
-----END PGP SIGNATURE-----

--------------OimbzeVUm0WiME0J0ubnZ5tN--

