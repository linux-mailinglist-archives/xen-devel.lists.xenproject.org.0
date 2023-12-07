Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5868084C9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649669.1014468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAng-0004HH-C5; Thu, 07 Dec 2023 09:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649669.1014468; Thu, 07 Dec 2023 09:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAng-0004Ez-9Q; Thu, 07 Dec 2023 09:36:08 +0000
Received: by outflank-mailman (input) for mailman id 649669;
 Thu, 07 Dec 2023 09:36:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBAnf-0004Et-IE
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:36:07 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b0d5527-94e4-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:36:05 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54c1cd8d239so928503a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 01:36:05 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 dg11-20020a0564021d0b00b0054cb66d7669sm551709edb.11.2023.12.07.01.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 01:36:04 -0800 (PST)
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
X-Inumbo-ID: 0b0d5527-94e4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701941765; x=1702546565; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OuH198nXPiUO2AVQVCwloRa1PPvxSz5YuMHJSO7PiFQ=;
        b=Hfb1vtXpT3FWxGA+rNvsRo9/Gg7ikMm5Zs2TTE3qdQwTZllZTvAhfGJm0xJWklpdk8
         D21GVUEyhw7SoeXdele+voMv+9DPfU25eqEhoh7EqRUTPWm6IWTyNMbg+3A7wMx91LEh
         eiTcH0zisz/gG4F3nv4CCwYCMnw5k3glgLufIxV0QQ5WAIi5RI3BYLfHAsMvOxX6nv4+
         Q0JoZgKTlcaB35RzkXmwoT5bI/EM55CZyUPOyH4rmsfNWgmWR9Z4nVjCUWwvJZnvXCmT
         WnAH2hJMQ2AFbhKhXQf4x4L4H65moU5wt5PkLws3U8qaQ0caTIoOYKFOeR9CACOfYrjm
         eUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701941765; x=1702546565;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuH198nXPiUO2AVQVCwloRa1PPvxSz5YuMHJSO7PiFQ=;
        b=IlsspGdFQDjOxH1ToAgy89RPN2P9q1xRmHugjiS2NL1HpU/bGK9p/w96a2JyX4Yy2/
         crq2DmxsbkRxm+TEuVZyxsGdu0YQm5+V1weQuOUXP58Clmd6UoCkEOhfqTHcSPPb90hQ
         Myi1h8W9Ax0QHRIHg/jcPNzDAezxKsFHSiXhxVi2jdxcq6mUT9poiBXkgvAg2kiYIfV1
         XPOyqqpTOfZS0CBM/gpVE9Hi18/6aG9EW67ASot4HYJVNxSwrB/+CSRB2o/mYOpS2FUl
         5dmeCg/Y7YWYt/5zTScSF9zFgw8z1N/sTXM94/ZnSTvqwqCpvcpoO+0VwpArljBKG4ey
         cBZA==
X-Gm-Message-State: AOJu0YzWbtqJ8Z7HcjD1GnCx6S7UIZQmwYXqJJKAu1kE/dVkUHjzhyLm
	zVC40dKIbdKIrwQwxNsm5cA=
X-Google-Smtp-Source: AGHT+IGcmMWXuniL/phHqsXe7fS5KMFMV24FqW4bRkL34B5ChqtlkVvwGiHZZZKagtFiLI2zMBE/NQ==
X-Received: by 2002:a50:d7d6:0:b0:548:68a3:618e with SMTP id m22-20020a50d7d6000000b0054868a3618emr677096edj.9.1701941764750;
        Thu, 07 Dec 2023 01:36:04 -0800 (PST)
Message-ID: <ed7a390de9d84909a2c479411120c6ab9a5ba987.camel@gmail.com>
Subject: Re: [PATCH v2 02/39] xen/riscv: use some asm-generic headers
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Dec 2023 11:36:03 +0200
In-Reply-To: <3d7b5337-7a0c-472c-8416-453194e8c38d@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <90beae5dfa2bc4c27108ca4dea630306dfdfe81f.1700761381.git.oleksii.kurochko@gmail.com>
	 <3d7b5337-7a0c-472c-8416-453194e8c38d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-12-05 at 16:40 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Some headers are the same as asm-generic verions of them
> > so use them instead of arch-specific headers.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> assuming ...
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/Makefile
> > @@ -0,0 +1,14 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +generic-y +=3D altp2m.h
> > +generic-y +=3D device.h
> > +generic-y +=3D div64.h
> > +generic-y +=3D hardirq.h
> > +generic-y +=3D hypercall.h
> > +generic-y +=3D iocap.h
> > +generic-y +=3D monitor.h
> > +generic-y +=3D numa.h
> > +generic-y +=3D paging.h
> > +generic-y +=3D percpu.h
> > +generic-y +=3D random.h
> > +generic-y +=3D softirq.h
> > +generic-y +=3D vm_event.h
>=20
> ... these headers are indeed all going to appear.
Thanks.

Only 4 (div64.h, monitor.h, numa.h, softirq.h) of them aren't appearing
in staging. It only needs some ACKs from Arm and PPC maintainers.

But if something changes, I'll update riscv/include/asm/Makefile

~ Oleksii

