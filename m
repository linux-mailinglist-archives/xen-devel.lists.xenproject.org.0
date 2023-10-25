Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18327D6DF5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622923.970207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveT3-0002lR-4K; Wed, 25 Oct 2023 14:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622923.970207; Wed, 25 Oct 2023 14:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveT3-0002iQ-17; Wed, 25 Oct 2023 14:02:41 +0000
Received: by outflank-mailman (input) for mailman id 622923;
 Wed, 25 Oct 2023 14:02:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JND=GH=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1qveT1-0002iJ-3J
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:02:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26efb7ad-733f-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:02:37 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so9396588a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 07:02:37 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r29-20020a50d69d000000b0053e408aec8bsm9780876edi.6.2023.10.25.07.02.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Oct 2023 07:02:35 -0700 (PDT)
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
X-Inumbo-ID: 26efb7ad-733f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698242556; x=1698847356; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfV08W1Cv+VacfTgS2fpzVIUmw5/narETvsqfYLa6+I=;
        b=iNCIzDY0yLvQc2REdFY1UX8G1tP5NGcynyW+LZz6Ly9VVTnDNAtGRyQwraChyjbWvG
         Zc2zliz+3TeCMVEFQqSLjsvc6ZkGMeqe6v+Rk1ZbVU43zVB9TSDh3CYfjuEFwI8oKIjs
         PVE96eU45cg/ka8wjWWBFCf0flTxr/dfXyVIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698242556; x=1698847356;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfV08W1Cv+VacfTgS2fpzVIUmw5/narETvsqfYLa6+I=;
        b=ebNQopqjFFje+tHtZHelY39zClwF73UQ4kB/pLWaJclm23fNjMemabEkvzEvfOOOig
         VqA0WJjPfxuDZwp71GqIie+xQMu+cQKNL9V5p4wURcDi6zCRBx+28Hl9oTLziTTEInet
         ZXXakFWbv8P5ReOXfUbnXjIYTSp2V4dZcCXu9M/awu2ZR4szaqWAkKV3Jh14UsenX/XO
         Tsi0pg2HG7GtckZgD/XUJ5DemByVrR2c53sFSAkqo5aDBPuGvKhcU8SWE+u5xM75a8N7
         4F20K/VkASQLiZc+I+H6WZIRmHECsduVKOesrxvROCV7KhGjBtl2p/RVGbleVHa6e07K
         kS3A==
X-Gm-Message-State: AOJu0Yx7r8+FNCN0vkx5PClGVNgsrhe+TFWzG4T3UF2Y3SW+gBAuFRWj
	wua2Dr1dqK8l1ReQENhAXsJlYA==
X-Google-Smtp-Source: AGHT+IFJ8SFs8t2UOGOxLX4kqP2R4zHAG+zQTxlj7ac1EQN13MqflpQWcNUxMiXqGigD9WmyQaA6kw==
X-Received: by 2002:a50:cd03:0:b0:53e:7d91:611f with SMTP id z3-20020a50cd03000000b0053e7d91611fmr11910723edi.11.1698242556467;
        Wed, 25 Oct 2023 07:02:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when
 compiling OCaml C stubs
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
Date: Wed, 25 Oct 2023 15:02:34 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <531503CD-6082-43FE-92AF-FFB9B829B5C5@cloud.com>
References: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
To: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)



> On 25 Oct 2023, at 14:52, Edwin T=C3=B6r=C3=B6k =
<edvin.torok@citrix.com> wrote:
>=20
> From: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>=20
> The code currently uses GCC to compile OCaml C stubs directly,
> and although in most cases this works, it is not entirely correct.
>=20
> This will fail if the OCaml runtime has been recompiled to use and =
link with ASAN for example
> (or other situations where a flag needs to be used consistently in =
everything that is linked into the same binary).
>=20
> Use the OCaml compiler instead, which knows how to invoke the correct =
C compiler with the correct flags,
> and append the Xen specific CFLAGS to that instead.
>=20
> Drop the explicit -fPIC and -I$(ocamlc -where): these will now be =
provided by the compiler as needed.
>=20
> Use -verbose so we see the actuall full C compiler command line =
invocation done by the OCaml compiler.
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>

Acked-by: Christian Lindig <christian.lindig@cloud.com>

I like using the OCaml compiler to compile stubs as it knows how to =
handle C files and will invoke the C compiler with the correct flags. =
However, this is the kind of change that would be good to have tested on =
all supported platforms. I therefore invite comments from those who =
maintain the build process.

=E2=80=94 C



