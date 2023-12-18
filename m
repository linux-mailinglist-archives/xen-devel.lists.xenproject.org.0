Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5DD816B8E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655856.1023701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBBX-0000nH-O7; Mon, 18 Dec 2023 10:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655856.1023701; Mon, 18 Dec 2023 10:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBBX-0000ko-L9; Mon, 18 Dec 2023 10:49:19 +0000
Received: by outflank-mailman (input) for mailman id 655856;
 Mon, 18 Dec 2023 10:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFBBW-0000ki-Da
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:49:18 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d12800-9d93-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:49:16 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e2786e71fso1951393e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:49:16 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a195f0a000000b0050e38f8ba2esm241016lfb.273.2023.12.18.02.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:49:15 -0800 (PST)
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
X-Inumbo-ID: 16d12800-9d93-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702896556; x=1703501356; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kfl3xyUQgtnl0J3d2lYhaR3oNiOESEkZ9aSw9+9YdVY=;
        b=Cv5eVK8ljVVl6LvVQbYW43PIM5Q5tZBhPzWbez2WadQS5zAeU9BoLjGlPgr7uwqD2T
         dfuRcgxTtWF80plqC1PMBlVIMtR8gdO/Mi0XPTMGGohSEt5uBIzT3AoNCZ+uNQmkitEr
         1LL7UTlghruXT/inn2zyACcBs4ym9rhNKqeU4cSIV5wclq8mPElO6SVrmKLmbQD0f1eN
         xxqwLxDOkBMf9HYZtsVMykjIkzDG/Nl9seew+wHKHz0lnuwjYxp1+uy/IPz1VQHlgcOP
         i4GZ8yxaBX1dZiFjOpvt+u68tPGdi1xJiR14RFWLRs3ppuKJIohysIrrBA+Dww8TE3tK
         WNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896556; x=1703501356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kfl3xyUQgtnl0J3d2lYhaR3oNiOESEkZ9aSw9+9YdVY=;
        b=IiQsmytTUMHKqovi1x+MwLuZ6UlC5Sl9sirufqb/oLlJsgSzMQAQ6DoC3i7gF7Qi2o
         kit80NhI8pBJJAd/97bjDLNeocNylhweMWKCuT0UClrj+YwIjta+nhD65cEXPV5BAxP9
         hdfbaPzaeamjBliR5QZdevQn8EsvC/tncTQptQKOiaTNV7bwESYlSg+dYRi0AVDOdSZV
         Q5xJWu4us3y0t/PTVpGxYnDoHujxRFSJwmoU6NE+f6n/fEb83WeVucr0AVMiTdl9whtG
         MRXVANKXJDw2vEOlxRJNOqRQlJ1x7lZ1a2SujsrFC4o16JYL8F/ljFIepeWc0Q/iWawV
         Gk7A==
X-Gm-Message-State: AOJu0YwopG3G+cZ+/nfaZKjcLyLfSTWeEDu49wfsGxvFGJ6fDlA+FpZz
	+oMq0noPdGT9KDC1k4BFP1Y=
X-Google-Smtp-Source: AGHT+IF2K4Eo08ieZCU5IzlvqIa7inNWQZ47AQLtqbtMTdHDnMrLbyCv0HpCaBKnocfTcKLGZ+edlQ==
X-Received: by 2002:ac2:46f3:0:b0:50e:24c4:6080 with SMTP id q19-20020ac246f3000000b0050e24c46080mr1474356lfo.7.1702896555882;
        Mon, 18 Dec 2023 02:49:15 -0800 (PST)
Message-ID: <a46dee8dc5f15beb8c01f84b6363f6d7763e0ede.camel@gmail.com>
Subject: Re: [PATCH v2 33/39] xen/riscv: add minimal stuff to
 asm/processor.h to build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:49:14 +0200
In-Reply-To: <c431a7ac-ac4d-4de2-969a-ad2acf1a7aee@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <11f177882b74c60233626075a69bdd00d3da2311.1700761381.git.oleksii.kurochko@gmail.com>
	 <c431a7ac-ac4d-4de2-969a-ad2acf1a7aee@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 17:04 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/processor.h
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -12,6 +12,9 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > +/* TODO: need to be implemeted */
> > +#define get_processor_id() 0
>=20
> Please don't re-introduce this - it was just recently dropped from
> the
> code base.
Thanks for remind me that. I'll drop it in the next version.

>=20
> > @@ -53,6 +56,18 @@ struct cpu_user_regs
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pregs;
> > =C2=A0};
> > =C2=A0
> > +/* TODO: need to implement */
> > +#define cpu_to_core(_cpu)=C2=A0=C2=A0 (0)
> > +#define cpu_to_socket(_cpu) (0)
>=20
> No need for leading underscores here.
Sure. Thanks.
>=20
> > +static inline void cpu_relax(void)
> > +{
> > +	int dummy;
> > +	/* In lieu of a halt instruction, induce a long-latency
> > stall. */
> > +	__asm__ __volatile__ ("div %0, %0, zero" : "=3Dr" (dummy));
>=20
> Any reason for this, when Arm's is just barrier(), and apparently
> they got
> away with this quite fine? Also isn't this causing a division by
> zero,
> which I'd expect to cause some kind of exception? (Terminology-wise
> I'm of
> course biased by x86, where "halt instruction" wouldn't be suitable
> to use
> here. But if that terminology is fine on RISC-V, then obviously no
> objection.)
It was based on Linux kernel code:
https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/vdso/=
processor.h#L9

But looks I missed barrier()...
Probably it will be better update cpu_relax() to:

	/* Encoding of the pause instruction */
	__asm__ __volatile__ (".4byte 0x100000F");

	barrier();

~ Oleksii

