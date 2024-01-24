Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC983A541
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 10:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670835.1043890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZTa-0007O5-RX; Wed, 24 Jan 2024 09:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670835.1043890; Wed, 24 Jan 2024 09:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZTa-0007Lr-Nk; Wed, 24 Jan 2024 09:23:18 +0000
Received: by outflank-mailman (input) for mailman id 670835;
 Wed, 24 Jan 2024 09:23:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSZTZ-0007AZ-6z
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 09:23:17 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33f177ec-ba9a-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 10:23:15 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a310f4b3597so45614966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 01:23:15 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 hy7-20020a1709068a6700b00a280944f775sm15232251ejc.153.2024.01.24.01.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 01:23:14 -0800 (PST)
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
X-Inumbo-ID: 33f177ec-ba9a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706088195; x=1706692995; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q2iakNn+EEOiV5rOhMK/NZwK16rBRN56Kv/2r6MIdvM=;
        b=Qy/ci3YC6fjXSNRPnMbwELccad3+DRvhrt4obXfvPC7pz5Qyo/Hdc47weCHPnFihTi
         R3TOXD0JyJjHFHpejPXiyqAbPc8CX3BztpqZy2h3FQ1SyHiQrRtxMsIp4F6FWtqjOY/P
         m14clqsCAa1Tr1GlsZL8LrtkHZyjWqUYFyUGeAv8gNL80rrMGMfrQa39TCvBZ4H8EfqJ
         WoDieX8vRwro+G5FjUl67lDaJFSArf81tZTZ0OEaU3Zy6foD/Q+EgFdK016mhnQyFd7o
         CyaxM2GQwR+qznAtu51iL0TJrOghCb5HHCwVS+dxJG8Y/kdTAXhPaqQRDWHLrYmWGu9f
         9cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088195; x=1706692995;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2iakNn+EEOiV5rOhMK/NZwK16rBRN56Kv/2r6MIdvM=;
        b=HuEDVeaDC75J3DG8dKuzvbLQHMLWrA+C5yQLaUTvphf+Di9xMNM02yBDDMbQ311AZQ
         nI4Nj4MtzgIJIuPPWjDypR4rLIBJ9o7I3j6gtaTdFNm+Rs2XyvzB9HzAFS/OEFeq311S
         lTZjo2hvOmzF2qEgxQCcC+LjVW1MqQMErLU5HeMvADBGHbeu/MJZK6AVtK7IjGA3j9kd
         YulwOJLVcvOTvcIwq8WsXuJAoAPa9vop14Gqlqj69djHkT9DOYjPG6lWjKnVVN22Bg16
         T+gTvlMB2q9mqmC08bspZBk4avBo8kkm6X108JV9oaqwirUbdKbvsxGQPGvi5jQmlQAL
         SNOg==
X-Gm-Message-State: AOJu0Ywm0RJUg1T9RYJqrv2lyxNh/1zYY7hRhVKSCWJa6b0QInDIuMH5
	H9REjYv/eCHVBtVJMHZcJjUSu7dtczByF2iccQlJh1G3W7sDcEsb
X-Google-Smtp-Source: AGHT+IH0OaQwllYiup9B7T8Xnl3urN8fel4PAc4WEJjXtu1sOLGUIuSl/lN8UqPmxDKzUVsYNlXD+g==
X-Received: by 2002:a17:906:57ce:b0:a30:d4f2:1603 with SMTP id u14-20020a17090657ce00b00a30d4f21603mr735516ejr.15.1706088194692;
        Wed, 24 Jan 2024 01:23:14 -0800 (PST)
Message-ID: <b0c23db4b8162e5859347a582b43050c1601c10b.camel@gmail.com>
Subject: Re: [PATCH v3 15/34] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 11:23:13 +0200
In-Reply-To: <d33fe182-8283-4552-bc0e-3eac90f20d31@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
	 <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
	 <92d7caf20a37b68dce7676812c2780bc2fbc00cf.camel@gmail.com>
	 <6aa39fac-fef6-47ce-8c27-4941d83c138a@suse.com>
	 <d7f89e6f4aae5c8cfa5215bd893b62a3d542ce4c.camel@gmail.com>
	 <d33fe182-8283-4552-bc0e-3eac90f20d31@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 14:30 +0100, Jan Beulich wrote:
> On 23.01.2024 13:24, Oleksii wrote:
> > On Tue, 2024-01-23 at 11:30 +0100, Jan Beulich wrote:
> > > On 23.01.2024 11:21, Oleksii wrote:
> > > > On Mon, 2024-01-22 at 17:56 +0100, Jan Beulich wrote:
> > > > > On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > > > > > --- /dev/null
> > > > > > +++ b/xen/arch/riscv/include/asm/fence.h
> > > > > > @@ -0,0 +1,13 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > > > > +#ifndef _ASM_RISCV_FENCE_H
> > > > > > +#define _ASM_RISCV_FENCE_H
> > > > > > +
> > > > > > +#ifdef CONFIG_SMP
> > > > > > +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
> > > > > > +#define RISCV_RELEASE_BARRIER		"\tfence rw,=C2=A0 w\n"
> > > > > > +#else
> > > > > > +#define RISCV_ACQUIRE_BARRIER
> > > > > > +#define RISCV_RELEASE_BARRIER
> > > > > > +#endif
> > > > >=20
> > > > > Do you really care about the !SMP case? On x86 at least we
> > > > > stopped
> > > > > special-
> > > > > casing that configuration many years ago (the few cases where
> > > > > for
> > > > > typically
> > > > > build reasons it matters, using CONFIG_NR_CPUS is
> > > > > sufficient). If
> > > > > you
> > > > > care
> > > > > about it, there needs to be somewhere you actually #define
> > > > > CONFIG_SMP.
> > > > Can't we use instead of CONFIG_SMP - CONFIG_NR_CPUS?
> > >=20
> > > You can. Question is whether there's a point in doing so. Do you
> > > expect people to actually want to run Xen on single-CPU systems?
> > > They're generally not overly well suited for virtualization ...
> > Just to clarify.
> >=20
> > Do you mean physically single based CPU?
> > Then I don't expect to run Xen on such systems and it is not
> > nesessary
> > to define *_BARRIER in this case. Should we have to add build error
> > notification that we don't support single-CPU systems in this
> > header?
> >=20
> > If you are speaking about we have ,let it be, 4 CPUs and only 1 CPU
> > is
> > currently supported by Xen then it still makes sense.
>=20
> No, that's still not what I mean. The question is: Is it useful for
> you
> to _special case_ the NR_CPUS=3D1 case? Or is it instead simpler to
> handle
> NR_CPUS=3D1 the same as NR_CPUS>1 (accepting less than ideal
> performance,
> on the basis that in reality nobody's expected to use such in
> production
> anyway)?
NR_CPUS=3D1 sometimes is useful for debugging. At least, at the start I
used that several times, but ITBO I don't remember when I used that
case after SMP support was added and context_switch() was fixed.

Probably, I misunderstand the real idea of NR_CPUS. Does NR_CPUS
represent a number of logical CPUs which can be different from physical
amount of CPU?
If yes, then what I wrote above it was about physical CPU and then in
context of logical CPUs I don't need a special case when NR_CPUS=3D1.

~ Oleksii


