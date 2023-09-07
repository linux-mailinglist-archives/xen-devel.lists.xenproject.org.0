Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4407797333
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 17:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597465.931706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGYX-00006e-Aa; Thu, 07 Sep 2023 15:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597465.931706; Thu, 07 Sep 2023 15:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGYX-0008VT-7R; Thu, 07 Sep 2023 15:04:29 +0000
Received: by outflank-mailman (input) for mailman id 597465;
 Thu, 07 Sep 2023 15:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeGYW-0008U0-2K
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 15:04:28 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6b354ca-4d8f-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 17:04:27 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50098cc8967so1699183e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 08:04:27 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a197514000000b004fe4811d382sm3198696lfe.85.2023.09.07.08.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 08:04:26 -0700 (PDT)
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
X-Inumbo-ID: d6b354ca-4d8f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694099067; x=1694703867; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PsGeEBZD5fkpPxEuJMHrpoyUlRrVKLXJy2EDOlpQayQ=;
        b=aXpdvyncDxvQIOttBippaXtDbZ+lQbkezCZ0nAwgx68MuZDFJoaNPaenchdKnqlAnE
         Wp66K4hutZFF/ccbVVkYOQE8jd32sY4Y29DEZPXOPiRqArlH2iRgLMR3SGxC556htZx4
         ww8Qcpn1A+63Lgvdzl1M+Ybf/w+GK7agCs4rOakR+W7vuqbHH5fJsOzO+8SPYqISEK8V
         iHj3mPF1qsg9BcmwW/Q7qewVEA4nM/zBv21zfTvQruPOuiAFP9xZ06r+ba5IbYR5lzuG
         WoXua6qv5tc1dGccCH34lYJ5wbBYLn9Lw9P3E80t1U62d8gRRFAjT0NYiOv4BbZB9/mw
         G64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694099067; x=1694703867;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsGeEBZD5fkpPxEuJMHrpoyUlRrVKLXJy2EDOlpQayQ=;
        b=Q/63yI8wQUKs4T2ASpvXwuDYcdK61bZ09DyavvsHzJ7jwHlXgtGl2+ZXBtgjPGI7BU
         0rdkCfIZ4J0+GhunaQmcGRNUrtcKMslyvce3oiQPwYQ5MpGTPSxxLP6lgA+l2q9ONFfD
         MLUv7INEZpHoBUJnW1PxhFA9HeXvbe8a+IYoo9UuETtpyHR6+LeMPyjsgBZJ4SikeZIF
         IOuOFBixLligyPk+IPZ2qufiq2sIaGKsACT1D/p6LPGYwVhlm4o/5vmcJsHVdVqFbezU
         TzCMWR2RV0MI35s/zxLXOlZftHMjM1TMfFHiEfP5vll3UiMHx0SozP32emeOke56bZNJ
         7IYQ==
X-Gm-Message-State: AOJu0Yy+QNciEnYUdln+ocIXiA6D7lnDmFUF5Nm/Rj8nfJM5XoaFsa4Z
	nNxLSo1N8A6YAiSU9o4zTIs=
X-Google-Smtp-Source: AGHT+IHNhzwfOxZxBcujRNIWUv5tnC/NYTOz4+OTzaxpf7cQnhWl6EtWoEcQacJuhQK/bC1cJvYjrg==
X-Received: by 2002:ac2:51ab:0:b0:4ff:8f1b:8ccf with SMTP id f11-20020ac251ab000000b004ff8f1b8ccfmr4401719lfk.21.1694099066676;
        Thu, 07 Sep 2023 08:04:26 -0700 (PDT)
Message-ID: <5ae173e2f1e99de589b9d8e3ff93439f03c3d933.camel@gmail.com>
Subject: Re: [PATCH v6 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
 <anthony.perard@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
  Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>,  xen-devel@lists.xenproject.org
Date: Thu, 07 Sep 2023 18:04:25 +0300
In-Reply-To: <CABfawhk00MNJ4nyzfDyoJq9w=3TyHzwDXOosXrOD-n-nrZRnig@mail.gmail.com>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
	 <47e12756edfefdb5ff1112ae6b78ae95baadbbef.1694078544.git.oleksii.kurochko@gmail.com>
	 <687a1039-5f8d-bee2-50ce-1fa80ef31f19@suse.com>
	 <dd922527db03b445d0a2de6113a92ccc1dbb60f1.camel@gmail.com>
	 <CABfawhk00MNJ4nyzfDyoJq9w=3TyHzwDXOosXrOD-n-nrZRnig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-09-07 at 10:53 -0400, Tamas K Lengyel wrote:
> On Thu, Sep 7, 2023 at 9:46=E2=80=AFAM Oleksii <oleksii.kurochko@gmail.co=
m>
> wrote:
> >=20
> > On Thu, 2023-09-07 at 11:59 +0200, Jan Beulich wrote:
> > > On 07.09.2023 11:32, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/vm_event.h
> > > > @@ -0,0 +1,55 @@
> > > > +/* SPDX-License-Identifier:=C2=A0 GPL-2.0-only */
> > > > +/*
> > > > + * vm_event.h: stubs for architecture specific vm_event
> > > > handling
> > > > routines
> > > > + *
> > > > + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> > >=20
> > > Tamas is the maintainer of these files (no matter where they
> > > live),
> > > so
> > > please make sure to Cc him in order to get his ack.
> > Thanks. I'll add him to CC.
>=20
> Sent ack on v5 of the patch.
Thank you.

~ Oleksii

