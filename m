Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98343677A81
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 13:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482796.748500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvYJ-0007FM-I4; Mon, 23 Jan 2023 12:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482796.748500; Mon, 23 Jan 2023 12:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvYJ-0007Ct-Ek; Mon, 23 Jan 2023 12:03:55 +0000
Received: by outflank-mailman (input) for mailman id 482796;
 Mon, 23 Jan 2023 12:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pJvYH-0007Cn-M9
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 12:03:53 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffc96085-9b15-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 13:03:50 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id e3so10547065wru.13
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 04:03:51 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 l29-20020adfa39d000000b002bf95500254sm6470342wrb.64.2023.01.23.04.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:03:50 -0800 (PST)
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
X-Inumbo-ID: ffc96085-9b15-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dJyG60Emt0d9opA5oYTuh+ei5Kgic0d6ECamgZhcveE=;
        b=AwVUvxs3UWuv6cqzLYmGUUoIzGxAiPCmbLvG16Ra31vELrZw7rAtK1r4qSSQsMdyEx
         UEyvnbOkHZ7UTB56qljZTyWHXwfFd8OIYOoBR2BIbT0VhjNe6gIYGldSJQ04eMqr12c4
         X5xRce2KUv7Uq3j8moTiuGt4z2CzShISoVY2Gj93lfhFFCOppelBgnVQ93nmeZxecMFf
         u80y0+QNFuyGYGh/jf0yHIZelPzFMsppnbNw1Vj+hf2nD+LgjBsKVwz2y2TK2H7WQ92n
         95ASv4eVkfE1BhQtzXZA4ItKU5FUQFgwrjrIfiw96dkyp/8mfBbfdOl5VyYpgrgavRNS
         rZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJyG60Emt0d9opA5oYTuh+ei5Kgic0d6ECamgZhcveE=;
        b=Qm8AtbybkzQC5JdbC3qFGylo+MFsiQ89/ADMduovS6D3mh513CtF5+lQB5NCyuSbvM
         CCCNryiJan818lRSPmfbOfVDCtawUNek4SNV8t13ijw6spaUE6o6AIZC1XMcDoPN106A
         BYuoSln2gNnB1NJra9phZ7SAn3loEIAGZMdHzVqkWFZVaL8kMRre2AfSna1cSIpiDceI
         V9N1ANSAuAM+N3Jhg2/L60EF+reRUt8YrU2ZHvqmHZo7HU5EixWGpBEf7OrRyakvmJQj
         F+ccsz8hRWRSWUx3w673h9VitdmxGOJOFNb6BXp2EPayEsoAaJsSTF6LcowqsSzGswr6
         AngQ==
X-Gm-Message-State: AFqh2kqHkOwigX5AYYJAfAe3a+BmI0KXRWBc3e5qbBp/3kJ8IegigTm3
	NUebXhtjf9glz9DgHCKN/sI=
X-Google-Smtp-Source: AMrXdXvzVvY0sSc6mychZYQRLA7WRw8pSOy5305CVWHutTLEMk/W7xMy6zaOarHbOgClZwR4f6+S2w==
X-Received: by 2002:a05:6000:608:b0:28f:29b3:1a7f with SMTP id bn8-20020a056000060800b0028f29b31a7fmr25567498wrb.36.1674475430694;
        Mon, 23 Jan 2023 04:03:50 -0800 (PST)
Message-ID: <bb6b85f147d5d7933532fb27f78fa93ce6209b22.camel@gmail.com>
Subject: Re: [PATCH v1 06/14] xen/riscv: introduce exception context
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
Date: Mon, 23 Jan 2023 14:03:49 +0200
In-Reply-To: <fd276566-6b7d-ea64-a90a-a0c198ccf36c@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <00ecc26833738377003ad21603c198ae4278cfd3.1674226563.git.oleksii.kurochko@gmail.com>
	 <fd276566-6b7d-ea64-a90a-a0c198ccf36c@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-20 at 15:54 +0000, Andrew Cooper wrote:
> On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/include/asm/processor.h
> > b/xen/arch/riscv/include/asm/processor.h
> > new file mode 100644
> > index 0000000000..5898a09ce6
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -0,0 +1,114 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*****************************************************************
> > *************
> > + *
> > + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
> > + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
> > + * Copyright 2023 (C) Vates
> > + *
> > + */
> > +
> > +#ifndef _ASM_RISCV_PROCESSOR_H
> > +#define _ASM_RISCV_PROCESSOR_H
> > +
> > +#include <asm/types.h>
> > +
> > +#define RISCV_CPU_USER_REGS_zero=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0
> > +#define RISCV_CPU_USER_REGS_ra=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1
> > +#define RISCV_CPU_USER_REGS_sp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2
> > +#define RISCV_CPU_USER_REGS_gp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 3
> > +#define RISCV_CPU_USER_REGS_tp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 4
> > +#define RISCV_CPU_USER_REGS_t0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5
> > +#define RISCV_CPU_USER_REGS_t1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6
> > +#define RISCV_CPU_USER_REGS_t2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 7
> > +#define RISCV_CPU_USER_REGS_s0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 8
> > +#define RISCV_CPU_USER_REGS_s1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 9
> > +#define RISCV_CPU_USER_REGS_a0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 10
> > +#define RISCV_CPU_USER_REGS_a1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 11
> > +#define RISCV_CPU_USER_REGS_a2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 12
> > +#define RISCV_CPU_USER_REGS_a3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 13
> > +#define RISCV_CPU_USER_REGS_a4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 14
> > +#define RISCV_CPU_USER_REGS_a5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 15
> > +#define RISCV_CPU_USER_REGS_a6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 16
> > +#define RISCV_CPU_USER_REGS_a7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 17
> > +#define RISCV_CPU_USER_REGS_s2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 18
> > +#define RISCV_CPU_USER_REGS_s3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 19
> > +#define RISCV_CPU_USER_REGS_s4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 20
> > +#define RISCV_CPU_USER_REGS_s5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 21
> > +#define RISCV_CPU_USER_REGS_s6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 22
> > +#define RISCV_CPU_USER_REGS_s7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 23
> > +#define RISCV_CPU_USER_REGS_s8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 24
> > +#define RISCV_CPU_USER_REGS_s9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 25
> > +#define RISCV_CPU_USER_REGS_s10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 26
> > +#define RISCV_CPU_USER_REGS_s11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 27
> > +#define RISCV_CPU_USER_REGS_t3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 28
> > +#define RISCV_CPU_USER_REGS_t4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 29
> > +#define RISCV_CPU_USER_REGS_t5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 30
> > +#define RISCV_CPU_USER_REGS_t6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 31
> > +#define RISCV_CPU_USER_REGS_sepc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 32
> > +#define RISCV_CPU_USER_REGS_sstatus=C2=A0=C2=A0=C2=A0=C2=A0 33
> > +#define RISCV_CPU_USER_REGS_pregs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
34
> > +#define RISCV_CPU_USER_REGS_last=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 35
>=20
> This block wants moving into the asm-offsets infrastructure, but I
> suspect they won't want to survive in this form.
>=20
> edit: yeah, definitely not this form.=C2=A0 RISCV_CPU_USER_REGS_OFFSET is
> a
> recipe for bugs.
>=20
Thanks for the recommendation I'll take it into account during a work
on new version of the patch series.

> > +
> > +#define RISCV_CPU_USER_REGS_OFFSET(x)=C2=A0=C2=A0 ((RISCV_CPU_USER_REG=
S_##x)
> > * __SIZEOF_POINTER__)
> > +#define RISCV_CPU_USER_REGS_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > RISCV_CPU_USER_REGS_OFFSET(last)
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +/* On stack VCPU state */
> > +struct cpu_user_regs
> > +{
> > +=C2=A0=C2=A0=C2=A0 register_t zero;
>=20
> unsigned long.
Why is it better to define them as \unsigned long' instead of
register_t?
>=20
> > +=C2=A0=C2=A0=C2=A0 register_t ra;
> > +=C2=A0=C2=A0=C2=A0 register_t sp;
> > +=C2=A0=C2=A0=C2=A0 register_t gp;
> > +=C2=A0=C2=A0=C2=A0 register_t tp;
> > +=C2=A0=C2=A0=C2=A0 register_t t0;
> > +=C2=A0=C2=A0=C2=A0 register_t t1;
> > +=C2=A0=C2=A0=C2=A0 register_t t2;
> > +=C2=A0=C2=A0=C2=A0 register_t s0;
> > +=C2=A0=C2=A0=C2=A0 register_t s1;
> > +=C2=A0=C2=A0=C2=A0 register_t a0;
> > +=C2=A0=C2=A0=C2=A0 register_t a1;
> > +=C2=A0=C2=A0=C2=A0 register_t a2;
> > +=C2=A0=C2=A0=C2=A0 register_t a3;
> > +=C2=A0=C2=A0=C2=A0 register_t a4;
> > +=C2=A0=C2=A0=C2=A0 register_t a5;
> > +=C2=A0=C2=A0=C2=A0 register_t a6;
> > +=C2=A0=C2=A0=C2=A0 register_t a7;
> > +=C2=A0=C2=A0=C2=A0 register_t s2;
> > +=C2=A0=C2=A0=C2=A0 register_t s3;
> > +=C2=A0=C2=A0=C2=A0 register_t s4;
> > +=C2=A0=C2=A0=C2=A0 register_t s5;
> > +=C2=A0=C2=A0=C2=A0 register_t s6;
> > +=C2=A0=C2=A0=C2=A0 register_t s7;
> > +=C2=A0=C2=A0=C2=A0 register_t s8;
> > +=C2=A0=C2=A0=C2=A0 register_t s9;
> > +=C2=A0=C2=A0=C2=A0 register_t s10;
> > +=C2=A0=C2=A0=C2=A0 register_t s11;
> > +=C2=A0=C2=A0=C2=A0 register_t t3;
> > +=C2=A0=C2=A0=C2=A0 register_t t4;
> > +=C2=A0=C2=A0=C2=A0 register_t t5;
> > +=C2=A0=C2=A0=C2=A0 register_t t6;
> > +=C2=A0=C2=A0=C2=A0 register_t sepc;
> > +=C2=A0=C2=A0=C2=A0 register_t sstatus;
> > +=C2=A0=C2=A0=C2=A0 /* pointer to previous stack_cpu_regs */
> > +=C2=A0=C2=A0=C2=A0 register_t pregs;
>=20
> Stale comment?=C2=A0 Also, surely this wants to be cpu_user_regs *pregs; =
?
>=20
Not really.
Later it would be introduced another one structure:
	struct pcpu_info {
	...
		struct cpu_user_regs *stack_cpu_regs;
	...
	};
And stack_cpu_regs will be updated during context saving before jump to
__handle_exception:

    	/* new_stack_cpu_regs.pregs =3D old_stack_cpu_res */
    	REG_L   t0, RISCV_PCPUINFO_OFFSET(stack_cpu_regs)(tp)
    	REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(pregs)(sp)
    	/* Update stack_cpu_regs */
    	REG_S   sp, RISCV_PCPUINFO_OFFSET(stack_cpu_regs)(tp)
And I skipped this part as pcpu_info isn't used anywhere now but
reserve some place for pregs in advance.

> > +};
> > +
> > +static inline void wait_for_interrupt(void)
>=20
> There's no point writing out the name in longhand for a wrapper
> around a
> single instruction.
>=20
Will change it to "... wfi(void)"
> ~Andrew


