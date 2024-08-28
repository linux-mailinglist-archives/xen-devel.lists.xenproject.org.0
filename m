Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB2A962343
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784576.1193962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjErj-0006M1-1F; Wed, 28 Aug 2024 09:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784576.1193962; Wed, 28 Aug 2024 09:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEri-0006Ju-UZ; Wed, 28 Aug 2024 09:21:22 +0000
Received: by outflank-mailman (input) for mailman id 784576;
 Wed, 28 Aug 2024 09:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3BgB=P3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjErh-0006Jd-QD
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:21:21 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e33643f2-651e-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 11:21:20 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-533462b9428so10940875e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:21:20 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea890casm2081999e87.273.2024.08.28.02.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:21:19 -0700 (PDT)
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
X-Inumbo-ID: e33643f2-651e-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724836880; x=1725441680; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yVhCExET/kebc+rRmphVPpv9/7BZVIPY12/mf3K7teQ=;
        b=m/faE54tzrylUjuZju0F9l2SurHVWbXen73LE1vW13FVk+00HuVkjNGXP7gkGqg/dl
         FrYDit2MYIHUgiTTvICqFW6XKucS3/oryEB42TX72J4jqcA2RZaFnbF6cms6gUnlaM20
         p//TxC0UFhhq2ne8Dvjp/jDtYGzgr6TAZbqwOCPUuIZcusOyOnF0ZnyQSVuXv5QD3uzk
         /L1kRwHSNlrg08v35IHrZ2FoNFb2J6L/j7T8r0QfGkaqxK1sGe5Q3MtMG0Rrrhu7e1Jc
         EOVFsU4E/TVemTP75gWQQGE2V0hhnuLxZeL3vKCnTT9Zf6zkVHy/5GpCGL+jUldqR+D6
         AE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724836880; x=1725441680;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVhCExET/kebc+rRmphVPpv9/7BZVIPY12/mf3K7teQ=;
        b=QsKzr0nRVyTdQPIbm8R5Ye47WsskFNQU71LJEfbk8p9EjxyIwtR6kZUcAumdlx2eGJ
         6cz15Pn8C7T7/Nka2Nq6X+z+GAA0u3otR/oav2SWJ4kK4EjS3rbzUCuOsWDzXrF7vIoe
         96FbBVJX9ZAnRpzUTXGF0M5oMgBmIJMcszEKe+r/UL2vP0u6TTczXTDLlE/rxaLLJXo+
         rL1oiBgYh8OeVAzJXWYzEXUQOZZYO0kTuFMu7b4SZfgKPHZJhe20GAT8JLIV4L2JCU0g
         al+T+9Yy9Ma+Ex2/DKucDEWnpqJd8RZoyBcSVK6z/Lr4UTF7NrFOVeQgqzJB61lS1LuT
         0Pbw==
X-Forwarded-Encrypted: i=1; AJvYcCU92v4X/oS9O5y7+a0+aOsN2q3SWw6rZ+OjLZcW0DfNxCgKAMq8m6emfKrEzLDqq2NcIBbSpsBakCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGYBjYCXA1vIgOelR9l2kK6N2GJgqKq8kJZ7FrSG54TyYap13P
	hZTcMm5Lp79FQWhQpj8NNSDm/GJIykhuIbvmCYNdxgZcJxOVv23x
X-Google-Smtp-Source: AGHT+IFUVYX2u4C/MWOEMV/kjkcNgdltvxJjyZBuMNZegV7YXF4QGn892JEnss/Ep32d5sPSAzkFyg==
X-Received: by 2002:a05:6512:4017:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-5343888a7c4mr13568555e87.51.1724836879476;
        Wed, 28 Aug 2024 02:21:19 -0700 (PDT)
Message-ID: <3f52a19ea90fa8e70d7bf0055fe39a2be721c129.camel@gmail.com>
Subject: Re: [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 28 Aug 2024 11:21:18 +0200
In-Reply-To: <0f9fb47c-91d1-4ee9-b6bf-1d491339e904@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <5140f9eb3d1cb0b69e3b1cbbcce6167ff8d59e4c.1724256026.git.oleksii.kurochko@gmail.com>
	 <0f9fb47c-91d1-4ee9-b6bf-1d491339e904@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-27 at 12:06 +0200, Jan Beulich wrote:
> On 21.08.2024 18:06, Oleksii Kurochko wrote:
> > In Xen, memory-ordered atomic operations are not necessary,
>=20
> This is an interesting statement.
I looked at the definition of build_atomic_{write,read}() for other
architectures and didn't find any additional memory-ordered primitives
such as fences.

> I'd like to suggest that you at least
> limit it to the two constructs in question, rather than stating this
> globally for everything.
I am not sure that I understand what is "the two constructs". Could you
please clarify?

>=20
> > based on {read,write}_atomic() implementations for other
> > architectures.
> > Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
> > {read,write}{b,w,l,q}(), allowing the caller to decide if
> > additional
> > fences should be applied before or after {read,write}_atomic().
> >=20
> > Change the declaration of _write_atomic() to accept a 'volatile
> > void *'
> > type for the 'x' argument instead of 'unsigned long'.
> > This prevents compilation errors such as:
> > 1."discards 'volatile' qualifier from pointer target type," which
> > occurs
> > =C2=A0 due to the initialization of a volatile pointer,
> > =C2=A0 e.g., `volatile uint8_t *ptr =3D p;` in _add_sized().
>=20
> I don't follow you here.
This issue started occurring after the change mentioned in point 2
below.

I initially provided an incorrect explanation for the compilation error
mentioned above. Let me correct that now and update the commit message
in the next patch version. The reason for this error is that after the
_write_atomic() prototype was updated from _write_atomic(..., unsigned
long, ...) to _write_atomic(..., void *x, ...), the write_atomic()
macro contains x_, which is of type 'volatile uintX_t' because ptr has
the type 'volatile uintX_t *'.

Therefore, _write_atomic() should have its second argument declared as
volatile const void *. Alternatively, we can consider updating
write_atomic() to:
   #define write_atomic(p, x)                              \
   ({                                                      \
       typeof(*(p)) x_ =3D (x);                              \
       _write_atomic(p, (const void *)&x_, sizeof(*(p)));  \
   })
Would this be a better approach?Would it be better?

> It's the other argument of write_atomic() that
> has ptr passed there.
Probably the thing mentioned above it is what you mean here. I wasn't
sure that I understand this sentence correctly.

>=20
> > 2."incompatible type for argument 2 of '_write_atomic'," which can
> > occur
> > =C2=A0 when calling write_pte(), where 'x' is of type pte_t rather than
> > =C2=A0 unsigned long.
>=20
> How's this related to the change at hand? That isn't different ahead
> of
> this change, is it?
This is not directly related to the current change, which is why I
decided to add a sentence about write_pte().

Since write_pte(pte_t *p, pte_t pte) uses write_atomic(), and the
argument types are pte_t * and pte respectively, we encounter a
compilation issue in write_atomic() because:

_write_atomic() expects the second argument to be of type unsigned
long, leading to a compilation error like "incompatible type for
argument 2 of '_write_atomic'."
I considered defining write_pte() as write_atomic(p, pte.pte), but this
would fail at 'typeof(*(p)) x_ =3D (x);' and result in a compilation
error 'invalid initializer' or something like that.

It might be better to update write_pte() to:
   /* Write a pagetable entry. */
   static inline void write_pte(pte_t *p, pte_t pte)
   {
       write_atomic((unsigned long *)p, pte.pte);
   }
Then, we wouldn't need to modify the definition of write_atomic() or
change the type of the second argument of _write_atomic().
Would it be better?

>=20
> > --- a/xen/arch/riscv/include/asm/atomic.h
> > +++ b/xen/arch/riscv/include/asm/atomic.h
> > @@ -31,21 +31,17 @@
> > =C2=A0
> > =C2=A0void __bad_atomic_size(void);
> > =C2=A0
> > -/*
> > - * Legacy from Linux kernel. For some reason they wanted to have
> > ordered
> > - * read/write access. Thereby read* is used instead of read*_cpu()
> > - */
> > =C2=A0static always_inline void read_atomic_size(const volatile void *p=
,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *res,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 switch ( size )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 case 1: *(uint8_t *)res =3D readb(p); break;
> > -=C2=A0=C2=A0=C2=A0 case 2: *(uint16_t *)res =3D readw(p); break;
> > -=C2=A0=C2=A0=C2=A0 case 4: *(uint32_t *)res =3D readl(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 1: *(uint8_t *)res =3D readb_cpu(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 2: *(uint16_t *)res =3D readw_cpu(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 4: *(uint32_t *)res =3D readl_cpu(p); break;
> > =C2=A0#ifndef CONFIG_RISCV_32
> > -=C2=A0=C2=A0=C2=A0 case 8: *(uint32_t *)res =3D readq(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 8: *(uint32_t *)res =3D readq_cpu(p); break;
> > =C2=A0#endif
> > =C2=A0=C2=A0=C2=A0=C2=A0 default: __bad_atomic_size(); break;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -58,15 +54,16 @@ static always_inline void
> > read_atomic_size(const volatile void *p,
> > =C2=A0})
> > =C2=A0
> > =C2=A0static always_inline void _write_atomic(volatile void *p,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long x, unsigned
> > int size)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 volatile void *x,
>=20
> If this really needs to become a pointer, it ought to also be
> pointer-
> to-const. Otherwise it is yet more confusing which operand is which.
Sure. I will add 'const' if the prototype of _write_atomic() won't use
'unsigned long' for x argument.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int size)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 switch ( size )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 case 1: writeb(x, p); break;
> > -=C2=A0=C2=A0=C2=A0 case 2: writew(x, p); break;
> > -=C2=A0=C2=A0=C2=A0 case 4: writel(x, p); break;
> > +=C2=A0=C2=A0=C2=A0 case 1: writeb_cpu(*(uint8_t *)x, p); break;
> > +=C2=A0=C2=A0=C2=A0 case 2: writew_cpu(*(uint16_t *)x, p); break;
> > +=C2=A0=C2=A0=C2=A0 case 4: writel_cpu(*(uint32_t *)x, p); break;
> > =C2=A0#ifndef CONFIG_RISCV_32
> > -=C2=A0=C2=A0=C2=A0 case 8: writeq(x, p); break;
> > +=C2=A0=C2=A0=C2=A0 case 8: writeq_cpu(*(uint64_t *)x, p); break;
>=20
> Of course you may not cast away const-ness then. You also be casting
> away volatile-ness, but (as per above) I question the need for
> volatile
> on x.
I added an explanation about this earlier in the message. Let's discuss
whether volatile is needed there or not.

If I should not cast away the const and volatile qualifiers, then I
need to update the prototypes of writeX_cpu()?

~ Oleksii

