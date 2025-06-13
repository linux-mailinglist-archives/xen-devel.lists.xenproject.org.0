Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4633AD98C6
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 01:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015062.1393018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQE4p-0003P3-19; Fri, 13 Jun 2025 23:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015062.1393018; Fri, 13 Jun 2025 23:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQE4o-0003M6-UG; Fri, 13 Jun 2025 23:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1015062;
 Fri, 13 Jun 2025 23:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aAEG=Y4=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uQE4m-0003J0-VZ
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 23:44:49 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6330ab61-48b0-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 01:44:47 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7c5a88b34a6so268501085a.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 16:44:47 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8ee3f72sm233527285a.94.2025.06.13.16.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 16:44:44 -0700 (PDT)
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
X-Inumbo-ID: 6330ab61-48b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749858286; x=1750463086; darn=lists.xenproject.org;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV/OO/PkeIKV0keaBXKCAM7xZJJwqctUj/lozsMmipw=;
        b=F3B+AUvijdQGC8JB2zB3pLpOW6PXo4OzgZdsjtq1+k+89pNSpXp92dJMASay0OYvUI
         5SBuFnqTGc2BVqymsMZ3ZqTdiiOhSWhLLwiSmNAQtrnWrCHm83gaY9DZveMII5yiVP98
         ZlKeAWArQ6XyRALHKP85WEWTwxtHWhg2ZJBlqnuaNCTKnkgUMG+VslsXcxTgNUyWo0Yb
         vUVF+SMMfQzyWAZKMoskQbIYJzqygzqCpmewgOqgvfwarvZZ6cxydKbbWX41UXAmk9iF
         19E332JDfWARlfIip8aiRblf3lI5aNgbR2VgWOYQOpq/ef4F6fzSOjd6ZiddZ36h+skL
         MDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749858286; x=1750463086;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NV/OO/PkeIKV0keaBXKCAM7xZJJwqctUj/lozsMmipw=;
        b=k+0WKhxGb+0kcyXcuO2KlYSGMkSq7lwwukXsDpd0/uWNbcKaFWXqqtXf8XTjlHM19y
         tiA7cHdBg0LwqxyrR9hKg0OjkUpfB9xLn/TAPuSV2Md6dp4WSasFJamI9PPNokV2GnFx
         br121lapPCzuLyzWIeR5tP1MXBzmULoUWF6TRYuh2OnAdUacCPhwW2gdQ6HOydC+d0d2
         074814MmF6gJEIoAj6kK9Zama3HKYAA5wdntjGxLNtcDLDVBpwrxYwULPHYmEuPMh3nD
         /FK2ShZ6WgiaJvwAbjX3tFCCcoh9YyO0RToWr4I9YHJ0fd+13JQhTuAboxhwRG7XZTKC
         txEw==
X-Forwarded-Encrypted: i=1; AJvYcCXq5mf8d+OxY7oTEWpMaqHLuHI3dtr3x7KuezHYcZiUVUyriAoi2yKR3LqX+CDDoRoifaNv9tz+/G0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzB2rvrMzHLDWL5NS+iIxu1pT/Ra5UBQPP2s5i6RExFRTg2oeXr
	IzJGsnWC2SJhTo5rQYlXRyITXQpwQtI0O4OLm308pDTeQHP/GgZO7tYGFWXqxKyq
X-Gm-Gg: ASbGncts8Q0l+sCgqOyHRC0JFsch3U60hdKLEtYFCJUHv5u7+Fd0KyL0fWI3tSPhspc
	9bYEB/wHnOmpGp0CCsW6cdt+qSSGR2fxRuKToElY2ZJXrHmKi3reyXZgzhc0vAuJ6siQDekopkI
	2zI8Kt3ovQhPPEr1XIJ5In5i24W4wy+Q8Yodo7Z1Fssm7rtnDaaPBy66H3bwqzfmLcxo1mfvFZS
	ay2Jcb7VX+/EuAgzv2enTiqFNHR7jlDoP1hCXOegQTVyML7GEqSbVOtEQTZQAhKUIVfkGWCuGpY
	hoOtpSrjLPfOh10QRTSPbqOSpAYXLMcYAz+sVPnDnkDzi8rFU5i0ATOGgDvs8zfXLMs=
X-Google-Smtp-Source: AGHT+IHwRLRc+vN8A+iZZ//nt+Kh2QxbnKDMfIPcQmi6cRDhSEV4OTnx+VgYRqsn0fio6e3Cky3qEg==
X-Received: by 2002:a05:620a:44d0:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d3c6c0c751mr213292185a.1.1749858285723;
        Fri, 13 Jun 2025 16:44:45 -0700 (PDT)
Message-ID: <adb2c0c6-d49b-4421-90ca-bd7be1b7dd10@gmail.com>
Date: Fri, 13 Jun 2025 19:44:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-4-jason.andryuk@amd.com>
 <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com>
 <alpine.DEB.2.22.394.2506131536510.8480@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Subject: Re: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
In-Reply-To: <alpine.DEB.2.22.394.2506131536510.8480@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dG6Ag4Qzkc2OajInCuZQmtwP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dG6Ag4Qzkc2OajInCuZQmtwP
Content-Type: multipart/mixed; boundary="------------aUxdAcqKkwq0YgpZigNs09WE";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Message-ID: <adb2c0c6-d49b-4421-90ca-bd7be1b7dd10@gmail.com>
Subject: Re: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-4-jason.andryuk@amd.com>
 <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com>
 <alpine.DEB.2.22.394.2506131536510.8480@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506131536510.8480@ubuntu-linux-20-04-desktop>

--------------aUxdAcqKkwq0YgpZigNs09WE
Content-Type: multipart/mixed; boundary="------------h9XBH6XZNYsVjMpfnm9Lt0px"

--------------h9XBH6XZNYsVjMpfnm9Lt0px
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6/13/25 18:47, Stefano Stabellini wrote:
> On Wed, 11 Jun 2025, Jan Beulich wrote:
>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>> To add more flexibility in system configuration add the new
>>> DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.
>>>
>>> Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  Th=
is
>>> will enable running device model emulators (QEMU) from the assigne
>>> domain for multiple target domains.
>>>
>>> Stubdoms assign target allowing the stubdom to serve as the device
>>> model for a single domain.  This new flag allows the single domain to=

>>> provide emulators for multiple guests.
>>>
>>> The specific scenario is a disaggregated system with the hardware dom=
ain
>>> providing device models for muitple guest domains.
>>
>> Why the hardware domain? Unless a DM also needs access to some of the
>> physical hardware, it ought to run in a separate domain. Conceivably
>> such a domain could service multiply guests, so maybe the "single
>> target" concept presently used for stubdom simply needed extending?
>=20
> Not necessarily. While it is possible to have driver domains, it is not=

> the default configuration.
>=20
> In a default configuration, the hardware domain gets all the hardware b=
y
> default and therefore will also run the PV backends and Virtio backends=
=2E
> The Virtio backends require DM hypercalls. Let me elaborate further.
>=20
> In the datacenter, we have Dom0 typically with all the hardware, the
> backends (PV and Virtio), and also the toolstack. Then all other domain=
s
> are created dynamically by the toolstack. Driver domains are possible
> but not very common.
>=20
> In automotive/embedded, the total number of domains is static, so we ca=
n
> create them using dom0less. We don't need the toolstack to create VMs.
> Also, we have safety concerns, so we want to take away as much
> privileges as possible from Dom0. This is easy because thanks to
> dom0less, we don't need the toolstack and we don't need to create VMs
> dynamically.
>=20
> So the model is that Dom0 becomes the hardware domain: it has all the
> drivers and backends but it is not privileged in the sense of
> creating/destroying other VMs. If a user wants to have Dom0 "super
> powers", they can create an optional Control Domain. The Control Domain=

> is expected to be tiny, such as XTF or Zephyr. It will have the ability=

> that Dom0 used to have but without the drivers. From a privilege
> perspective, the Control Domain could create additional VMs, but in
> automotive/embedded it is not expected to be a use-case because the
> total number of VMs is still static.=20
>=20
> So your point about driver domains. Yes, one can have driver domains th=
e
> same way that one can have driver domains in the datacenter but it is
> not the default. The new default for embedded is what I described above=

> and I think it is a very widely applicable concept across industries:
> automotive, industrial, robotics, etc. and also across vendors: AMD,
> Xilinx, Renesas, EPAM, ARM, etc.

I think the benefits of this are much reduced as long as the hardware
domain is not strongly isolated from the other domains, in the sense that=

the hardware domain being able to compromise other domains is not
considered a security vulnerability.  Specifically, in safety-critical
scenarios the hardware domain (which, to the best of my understanding,
generally runs Linux) must not be able to compromise any of the safety-
critical domains.

This is, of course, achievable, but my understanding is that it isn't
something guaranteed by upstream Xen.  Rather, each user must ensure
it by assigning any hardware that could compromise Xen to the control
domain or a quarantine domain.

Could this be included in documentation?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------h9XBH6XZNYsVjMpfnm9Lt0px
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

--------------h9XBH6XZNYsVjMpfnm9Lt0px--

--------------aUxdAcqKkwq0YgpZigNs09WE--

--------------dG6Ag4Qzkc2OajInCuZQmtwP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmhMt+UACgkQszaHOrMp
8lNhkA/8DTe52735Pu75RiEKYfK/1lUwSBo4Z8o6HbQ+LC0CdphCl7PN/ClbW3tK
oT3OtUvp/9XU94zR08EAl/aoH24FhYzVTV3au4Q2WVjAfUcIk6jAdab3yEOWxyDt
ZtKeHqCMViRX3pbQbfSAC7xrsQxHwvP5UarqmgYPS170Bmv/jXF5aClzSr0Fy2AT
MpSKa+nBDj3d0mz2azmngcMnsWHGyrNBFlm9ADmCGkPyVSpMGkg0l2mOmpygMl28
Z116cFMji8zgqA+p0OeSdaOV+MutlawdqPE2HQT8U+4sDFy/WbkjKYhy/OLOnUlb
Fywq+vedKVNbYFj6j8ef75hMNEIB7imcaJKqC82IG1R37WAnOgdzCrmI1fS9TdDO
iQGiwlb/WJzj/wFMnIu2hm/0w7HXKnNl/ESkJrEZHIidQ6ze3DU/SlHP2jn7h6Q+
2XTV8dCkNTrogeaRd3TNgAtdzAIbNQPvpwd/PboPlRr7Nl4KitQKmQhWwqTgObL4
cwMVx+YUX5RUs+C7KgdfFxC3zR8LzYwKItEGG9vEaCPZ1xFca2JFmBT2cFDC/b+H
cflsHARvNpGRL/isNdahAKhutILggQRjuUfmWooLAuF0Vq8E1+qEUD4HKP7x4LuS
kpxn16/DhZtLXqqFqrWtFBDs/vlYIUmK6/E+Em4ler+HVqbDO9M=
=94MW
-----END PGP SIGNATURE-----

--------------dG6Ag4Qzkc2OajInCuZQmtwP--

