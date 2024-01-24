Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072C83AC92
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 15:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671074.1044201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSegG-0007nj-9m; Wed, 24 Jan 2024 14:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671074.1044201; Wed, 24 Jan 2024 14:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSegG-0007kW-70; Wed, 24 Jan 2024 14:56:44 +0000
Received: by outflank-mailman (input) for mailman id 671074;
 Wed, 24 Jan 2024 14:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSegE-0007kQ-Kf
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 14:56:42 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8777ff7-bac8-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 15:56:41 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55790581457so7606323a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 06:56:41 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a056402434500b00559c6000835sm9800167edc.5.2024.01.24.06.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 06:56:40 -0800 (PST)
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
X-Inumbo-ID: c8777ff7-bac8-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706108201; x=1706713001; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+c/BDb31XKSwE0whlvOisVCRxCOXwfcFgXAHAi0ZIE8=;
        b=YKW2YZhF7q2u4AlAD7tiiDHMLnDaEW1T5jTxwiRiarklM5DdWg5uL9Ne6X+2GnFn1b
         7E/KbyshSnJJs959TQ4rLfKJnOzZioUJY2kWEyV8xjhPzDmFrDb1pO9uqFAdxRIb6Wbs
         2WLC3BTi2L7LAfzzfyu2AMo5E+dxCKWgx0c4+dB54jhAnalvW2FDj4eJ14EFA/7pLXWc
         L8H8/ZuA96XXRxukmHbn0rLE0Jgvbldn6vkC4G5HTJdPmnyC0bEfJPaOVYR2muycFEyD
         6XvJmIv8vzQNoQPSD1kPdupBexMnTvIeQdETveGLiZHRLkovKFURwSt2JkPt8LtamPai
         NNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706108201; x=1706713001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+c/BDb31XKSwE0whlvOisVCRxCOXwfcFgXAHAi0ZIE8=;
        b=b7+5ubT4zV1/mvyKF1lxdrgpFNNAj7wXDdnAdAhIOyM8CtL4j+Hkb2C8NsR1WxW0kJ
         0clnPtSI4wFTDDgAL6MPtSYY+NktUM7RR6kOdzrmppbWZrVxw9MR0oxIr45srrebNXOb
         THP59ieOtJpvoDOnXqe0Vi81qCdOW29AJyJk0NEE0Jv7sLTIl0rGqAKZK5CaDsu7Lv8I
         ypR1k2UUN0MJFhC77EAmpA3KrzpjQouE2SLc3sVBeVskbQeKvOPQA2TfRxFvBjQeyRda
         2d7MZZDfu8yRJijYkLugoNQS5H9poHU9UKt8DyiBRvChpU59ToHG+NFvDpx1R2J2a1OB
         dRvw==
X-Gm-Message-State: AOJu0Yyab7hd6nln4WdxTaYS+vM53HI8rdN6jjt2oX+cQrAMG7s6znNT
	X42K8GU/9IZwdTtbVa92fKQSb8GlUfYF6BCfcZzTFl/tDF9GcINQ
X-Google-Smtp-Source: AGHT+IHWztJc0AGhbYy5Kwt5bF1eUg6cfW6oIOWHRwDeDs8MTKbm8FzJs4gJPeLYsioJg0honBXerg==
X-Received: by 2002:a05:6402:1c0e:b0:558:d960:e2e7 with SMTP id ck14-20020a0564021c0e00b00558d960e2e7mr1809627edb.40.1706108200798;
        Wed, 24 Jan 2024 06:56:40 -0800 (PST)
Message-ID: <e14ec7b9a6341732927bb4b4849afa76b5780f5b.camel@gmail.com>
Subject: Re: [PATCH v3 15/34] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 16:56:39 +0200
In-Reply-To: <e15ab025-d677-429b-abc4-9de23546b32c@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
	 <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
	 <92d7caf20a37b68dce7676812c2780bc2fbc00cf.camel@gmail.com>
	 <6aa39fac-fef6-47ce-8c27-4941d83c138a@suse.com>
	 <d7f89e6f4aae5c8cfa5215bd893b62a3d542ce4c.camel@gmail.com>
	 <d33fe182-8283-4552-bc0e-3eac90f20d31@suse.com>
	 <b0c23db4b8162e5859347a582b43050c1601c10b.camel@gmail.com>
	 <e15ab025-d677-429b-abc4-9de23546b32c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-24 at 12:19 +0100, Jan Beulich wrote:
> On 24.01.2024 10:23, Oleksii wrote:
> > On Tue, 2024-01-23 at 14:30 +0100, Jan Beulich wrote:
> > > On 23.01.2024 13:24, Oleksii wrote:
> > > > On Tue, 2024-01-23 at 11:30 +0100, Jan Beulich wrote:
> > > > > On 23.01.2024 11:21, Oleksii wrote:
> > > > > > On Mon, 2024-01-22 at 17:56 +0100, Jan Beulich wrote:
> > > > > > > On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/xen/arch/riscv/include/asm/fence.h
> > > > > > > > @@ -0,0 +1,13 @@
> > > > > > > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > > > > > > +#ifndef _ASM_RISCV_FENCE_H
> > > > > > > > +#define _ASM_RISCV_FENCE_H
> > > > > > > > +
> > > > > > > > +#ifdef CONFIG_SMP
> > > > > > > > +#define RISCV_ACQUIRE_BARRIER		"\tfence r ,
> > > > > > > > rw\n"
> > > > > > > > +#define RISCV_RELEASE_BARRIER		"\tfence rw,=C2=A0
> > > > > > > > w\n"
> > > > > > > > +#else
> > > > > > > > +#define RISCV_ACQUIRE_BARRIER
> > > > > > > > +#define RISCV_RELEASE_BARRIER
> > > > > > > > +#endif
> > > > > > >=20
> > > > > > > Do you really care about the !SMP case? On x86 at least
> > > > > > > we
> > > > > > > stopped
> > > > > > > special-
> > > > > > > casing that configuration many years ago (the few cases
> > > > > > > where
> > > > > > > for
> > > > > > > typically
> > > > > > > build reasons it matters, using CONFIG_NR_CPUS is
> > > > > > > sufficient). If
> > > > > > > you
> > > > > > > care
> > > > > > > about it, there needs to be somewhere you actually
> > > > > > > #define
> > > > > > > CONFIG_SMP.
> > > > > > Can't we use instead of CONFIG_SMP - CONFIG_NR_CPUS?
> > > > >=20
> > > > > You can. Question is whether there's a point in doing so. Do
> > > > > you
> > > > > expect people to actually want to run Xen on single-CPU
> > > > > systems?
> > > > > They're generally not overly well suited for virtualization
> > > > > ...
> > > > Just to clarify.
> > > >=20
> > > > Do you mean physically single based CPU?
> > > > Then I don't expect to run Xen on such systems and it is not
> > > > nesessary
> > > > to define *_BARRIER in this case. Should we have to add build
> > > > error
> > > > notification that we don't support single-CPU systems in this
> > > > header?
> > > >=20
> > > > If you are speaking about we have ,let it be, 4 CPUs and only 1
> > > > CPU
> > > > is
> > > > currently supported by Xen then it still makes sense.
> > >=20
> > > No, that's still not what I mean. The question is: Is it useful
> > > for
> > > you
> > > to _special case_ the NR_CPUS=3D1 case? Or is it instead simpler to
> > > handle
> > > NR_CPUS=3D1 the same as NR_CPUS>1 (accepting less than ideal
> > > performance,
> > > on the basis that in reality nobody's expected to use such in
> > > production
> > > anyway)?
> > NR_CPUS=3D1 sometimes is useful for debugging. At least, at the start
> > I
> > used that several times, but ITBO I don't remember when I used that
> > case after SMP support was added and context_switch() was fixed.
>=20
> And "sometimes is useful for debugging" warrants introducing special
> cases? I've not suggested disallowing that configuration. I'm merely
> asking whether it isn't easier to have the barriers there at all
> times. Just like on x86 we now leave the LOCK prefixes in place at
> all times.
I misunderstood your initial suggestion. In this case we can always
have the barriers. I'll drop then #ifdef CONFIG_SMP.

Thanks for clarification.

~ Oleksii
>=20
> > Probably, I misunderstand the real idea of NR_CPUS. Does NR_CPUS
> > represent a number of logical CPUs which can be different from
> > physical
> > amount of CPU?
>=20
> No.
>=20
> Jan


