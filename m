Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5135237F7FD
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 14:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126931.238515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhAVH-000301-Au; Thu, 13 May 2021 12:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126931.238515; Thu, 13 May 2021 12:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhAVH-0002xx-7t; Thu, 13 May 2021 12:31:47 +0000
Received: by outflank-mailman (input) for mailman id 126931;
 Thu, 13 May 2021 12:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yjCE=KI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lhAVF-0002xn-Pe
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 12:31:45 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1bc68ad-0aa7-4d85-a81a-d9aa0fa3b086;
 Thu, 13 May 2021 12:31:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4DCVh463
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 14:31:43 +0200 (CEST)
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
X-Inumbo-ID: e1bc68ad-0aa7-4d85-a81a-d9aa0fa3b086
ARC-Seal: i=1; a=rsa-sha256; t=1620909103; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XBmFXqyxGQ8GQH5iC5Q6xG1UOXr5Z7938HnZxNoOZ/aMkOGUu3f2aFScHtAL/S/0bU
    ofrVi+Gl5osryZnHm9ttd5Bg7gEX2Rv4naENqmBeHXS3xSG4Uiv1/Y8RFOLhpKWTIM44
    qckDqjtiH38aOmcCUdwDv9q/yHNAMLcrwiV7O+J9s4CUpEQYxmg8hr6QP1F/B7WnB84c
    HqiDbO9+8yG7V8OG7SqbCUPqAwnQP481Yd+wft4yr9ZY/k/eyhD6FVavbaQBYS7QURBD
    ocW/JelnTOfYUnHhhn3o+CG6VzsjI/GkNmEeyhCF8Iivth98R4WbVQS9px27m71gTR2S
    sY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620909103;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Zbe/lMiu4/b4x4nohzl46IEZIM8SA3++CKWwgzokx7I=;
    b=tyxImOWsW9nM7kL5vmVP0NztaBBje5dp7JI+Eu4q3f5StDilsLpeQ3Iy3fgIWMdcVa
    1N1SpxFaIHezQdG+EwufA2hHy/T6SI6B35m8H/BKWqrgnjidNnv9g7VPXUEhJzBo/gIh
    p9y2UlygdTYei1YFzhl/p9cpjgvJSgi0JfWZubrqJvUF9b0hMbMq8Lg9/q5yex75QzPG
    /tIpQyUxeDMpfgfasDj04cvCjcL4BvkUzPTZ76ZSAN3M6GxWBA+hys0aTd03o7HVf2Jm
    2FjMRvDs/oQ955vkgIJHim+IKlZAJIWwrC1Zx5esL9N+PCG88BxdJ03oK7jjOUszgo9F
    pOkw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620909103;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Zbe/lMiu4/b4x4nohzl46IEZIM8SA3++CKWwgzokx7I=;
    b=A+nmomBNrj20bEIPw7s0bRIThGiLGzy1XXiyxU6Wh/kEmex03stPlyuNffkZs600B3
    MeisrMzPvI1UiMEQka6lRe7yTRJUefDbZ39agkVWlxV50uHfP4oLaFLAWwgSu6vqAaPi
    9CM/AJP35tQFzfhMCOmHi6uo1s0GrvlB2M8LhdDlkBhLxJmW2p55fizKSXKkXNZWHTQF
    HpQaf3wcvGgXBoQZiuN4E16uygVtfsYVtsTL2Dvdm0K+qoKbhjWfqDqx0+LJy7iJJv1Y
    8xDHwOU8uInZzn3JpaNbuE4zIOkhu3MzQI2eQYrfHZwQMF3mPhYaV5bDdBeY4qsRVgrz
    BdiA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Thu, 13 May 2021 14:31:41 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210513143141.6dfbd8a0.olaf@aepfle.de>
In-Reply-To: <389f9d76-ed23-f8ee-6081-322699d7e816@citrix.com>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
	<378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
	<20210513142229.2d2aa0b4.olaf@aepfle.de>
	<389f9d76-ed23-f8ee-6081-322699d7e816@citrix.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8noblC+NTZiRCZpp_Z071AL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8noblC+NTZiRCZpp_Z071AL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 May 2021 13:29:32 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Can we first establish whether this box really does, or does not, have NX=
 ?

According to lscpu of a native boot: no.

Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-7
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             2
NUMA node(s):          2
Vendor ID:             AuthenticAMD
CPU family:            16
Model:                 2
Model name:            Quad-Core AMD Opteron(tm) Processor 2356
Stepping:              3
CPU MHz:               2300.057
BogoMIPS:              4600.11
Virtualization:        AMD-V
L1d cache:             64K
L1i cache:             64K
L2 cache:              512K
L3 cache:              2048K
NUMA node0 CPU(s):     0,2,4,6
NUMA node1 CPU(s):     1,3,5,7
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge=
 mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall mmxex
t fxsr_opt pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl nons=
top_tsc cpuid extd_apicid pni monitor cx16 popcnt lahf_lm cmp_
legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs =
hw_pstate vmmcall npt lbrv svm_lock

Olaf

--Sig_/8noblC+NTZiRCZpp_Z071AL
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCdHC0ACgkQ86SN7mm1
DoB0og//WFzLztUALrmuohki2Y87cf3CZVS2TDpkIu7rivDEiHhkLwh9LRUqLvMf
LzxT7gl/u774CrJ/IxvFMCKyiFTJgc5JE7qIRDJ8Be4GhH4/9rqxy5Zlp8yvHpLh
7ypA9aY+R6ZUFqvLALvlXMO/8wTQ2VWjeNZVyVRFOfEl8IAdzcx5gVvY3t+raOyk
SmsMAdAZIS7BTTtoIVbxDEX+EthvA3sz8K1YeiTNChC185JUvpKxrH4zhjoVVKEX
vutNA+34ENapuH/7pbkC9mj1MCZQwmV6bOhDH8zY+UtxuGuf5TZ7GGQojEch+Bwv
edzg1ZIsVBCHKadYe76KrCVSFsm/wFOMAM4kTF/dmEpzRTJH5H0dniL/2rAhbry/
NkCFNY5WsKjaZL3WNOlrsw5cY6MxMdw8+psvlqCybicNKBooDqPcA+gHnBmRyBPt
aF3zKg4LdOfmEc9dH3CE91zn33BQ7LDAb2OC9jubG4LqmR+MrGe+02ZnVovaQS2R
JPmQS5RJDOxxQmBaFSMaGCXBIi5neZSpR+fuqvjvYTbBGQBXHGvGyf2SQB5PwZ4i
KhPcN/MRFa2L/E2IsgADiigRmdypbkSYF9X/2yqhuZJzYhKNPxOY39oZKhlJiaYB
AYBLb0zfSSSoQXuKagXytDQLFM9n/3RwVVoEI6w84Ec1isPiKbk=
=kQIC
-----END PGP SIGNATURE-----

--Sig_/8noblC+NTZiRCZpp_Z071AL--

