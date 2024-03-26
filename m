Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE288CC99
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 20:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698196.1089649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpC3t-00049j-Fl; Tue, 26 Mar 2024 19:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698196.1089649; Tue, 26 Mar 2024 19:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpC3t-00047s-Bd; Tue, 26 Mar 2024 19:02:17 +0000
Received: by outflank-mailman (input) for mailman id 698196;
 Tue, 26 Mar 2024 19:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AKuY=LA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rpC3s-00047k-GG
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 19:02:16 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aef4a9d-eba3-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 20:02:13 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso707244366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 12:02:13 -0700 (PDT)
Received: from [172.20.10.2] (public-gprs369548.centertel.pl. [37.47.74.205])
 by smtp.gmail.com with ESMTPSA id
 ef7-20020a17090697c700b00a474df4cda5sm3503810ejb.167.2024.03.26.12.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 12:02:12 -0700 (PDT)
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
X-Inumbo-ID: 5aef4a9d-eba3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711479733; x=1712084533; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6kwv/k7oQgPWypCKyfa0Rg16DfxZ8s4+mjKEOz4Eh8c=;
        b=SWXUlAc+JpX1l7b9HaQduw+EAVxF+hW1bpWfh/FI8iz+o4ifitvnY96EL4ZH1nRttM
         wkv9LGciT2zQI5WNswd9s4/WnkylRByRH0TEUceTvbUhwgJrLSstn33/8UpQBfyFJIut
         BG9KWs11gvS/iPszobZzmD3+gwg/xS4pc/xEyD3nL9n6QnxbKF89k7+eOgNrSh8PVrQa
         LcjeeQcMJhKO8Z7Qd5p21VNlscq5XizbTk2Jom7VZ9RsN4uTRksrrxL2AXgStzdu2neq
         Ay2nnxj1EiAwjc/5mh8hgmWw8893YU3hlPrRORo23s93Wb9enbHOWU8Y2LzfhMb78r71
         tvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711479733; x=1712084533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kwv/k7oQgPWypCKyfa0Rg16DfxZ8s4+mjKEOz4Eh8c=;
        b=edXUb2ROuQ/VeyzlhOAmLg69TGXFUwjX7X8z4AZfPqP02jj4f2nAdB3MwqSvf9OP0C
         RJIBSNf2cI30H5lkrvJ+QIZn2qDFHFFnhS6zMzqpwA8Nt501l/R735rG/mEd7iua/IGw
         DdVUkN/BxOx16VXLUXjXebthVwrUy1MXpWKQCnGNw5WI1RQ/OeFgGog/RqL9lIRsS3c5
         2+LihAAY/QYlxRNGqFDqHxwHvIj32o+Xz4F2ar2m2ibqIEJLbi5EYmmnsg6H4YMHpYls
         KePGTB/oQ4F/iElTV5HAlBYW6OTd+kP2yLr0eVjnXmL0zY4G7z26XONXCxbYH+Biu42s
         vHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtEL3PlE/exlVMFgPUPIk7nZvr/YBoScwegh9hjSFepLtlBdFBdpr7sUkgjCisUocQ1Wp3UWTmv5edDlaldCb5Zi0mx/3R2Im+yzFn7PQ=
X-Gm-Message-State: AOJu0YykfnvkF4ySyC9fEai28haMPz22qKzDEvqw0cJ3UTTWmrIZFG9M
	BrX4HVeRzl+k20k2AGx0ItzmCYx6qKUxgU9doNrukjK7hrwwFClH
X-Google-Smtp-Source: AGHT+IFtr91q2nm2bDIdkjl9YqMo4+3iNDzj1EtCEvxT4y1yvjBBr6riJ0YobALsfWS3XSCHxowGPg==
X-Received: by 2002:a17:906:6d91:b0:a47:669:d0f2 with SMTP id h17-20020a1709066d9100b00a470669d0f2mr8734393ejt.50.1711479732443;
        Tue, 26 Mar 2024 12:02:12 -0700 (PDT)
Message-ID: <38de6dd8e9555fe4b573f9c2134a618a60c224df.camel@gmail.com>
Subject: Re: [PATCH v6 10/20] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 26 Mar 2024 20:02:10 +0100
In-Reply-To: <1a440fbf-f37c-41fe-b31c-0afe0fd77c8e@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <22ee9c8cc62c76cfb799fed800636e7c8bf25a17.1710517542.git.oleksii.kurochko@gmail.com>
	 <78a86041-72e2-410f-b6a7-212656b0dba3@suse.com>
	 <cdcf3531a94110d73b9ec60eedf74784b923248c.camel@gmail.com>
	 <1a440fbf-f37c-41fe-b31c-0afe0fd77c8e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-03-25 at 09:18 +0100, Jan Beulich wrote:
> On 22.03.2024 13:25, Oleksii wrote:
> > On Thu, 2024-03-21 at 14:03 +0100, Jan Beulich wrote:
> > > On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > > > + */
> > > > +static always_inline void read_atomic_size(const volatile void
> > > > *p,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *res,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 switch ( size )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 case 1: *(uint8_t *)res =3D readb(p); break;
> > > > +=C2=A0=C2=A0=C2=A0 case 2: *(uint16_t *)res =3D readw(p); break;
> > > > +=C2=A0=C2=A0=C2=A0 case 4: *(uint32_t *)res =3D readl(p); break;
> > > > +=C2=A0=C2=A0=C2=A0 case 8: *(uint32_t *)res=C2=A0 =3D readq(p); br=
eak;
> > >=20
> > > Nit: Excess blank before =3D.
> > >=20
> > > Also - no #ifdef here to be RV32-ready?
> > Because there is #ifdef RV32 in io.h for readq().
>=20
> There you'd run into __raw_readq()'s BUILD_BUG_ON(), afaict even for
> 1-, 2-, or 4-byte accesses. That's not quite what we want here.
Do you mean that if someone will redefine readq() in another way and
not wrap it by #ifdef RV32? Except this I am not sure that there is an
issue as it will be still a compilation error, so anyway it will be
needed to provide an implementation for __raw_readq().

One of the reason why I decided to wrap with #ifdef RV32 in io.h to not
go over the source code and add wrapping. Also for some code it will be
needed to rewrite it. For example, I am not sure that I can add #ifdef
inside macros, f.e.:
   #define write_atomic(p, x)                              \
   ({                                                      \
       typeof(*(p)) x__ =3D (x);                             \
       switch ( sizeof(*(p)) )                             \
       {                                                   \
       case 1: writeb(x__, p); break;                      \
       case 2: writew(x__, p); break;                      \
       case 4: writel(x__, p); break;                      \
       case 8: writeq(x__, p); break;                      \
       default: __bad_atomic_size(); break;                \
       }                                                   \
       x__;                                                \
   })

>=20
> > > > +/*
> > > > + * First, the atomic ops that have no ordering constraints and
> > > > therefor don't
> > > > + * have the AQ or RL bits set.=C2=A0 These don't return anything,
> > > > so
> > > > there's only
> > > > + * one version to worry about.
> > > > + */
> > > > +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)=C2=A0 \
> > > > +static inline=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > > > +void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
> > > > +{=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile (=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 amo" #asm=
_op "." #asm_type " zero, %1, %0"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+A" (v->counter)=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (I)=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > >=20
> > > Btw, I consider this pretty confusing. At the 1st and 2nd glance
> > > this
> > > looks like a mistake, i.e. as if i was meant. Imo ...
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" );=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +
> > > > +/*
> > > > + * Only CONFIG_GENERIC_ATOMIC64=3Dy was ported to Xen that is
> > > > the
> > > > reason why
> > > > + * last argument for ATOMIC_OP isn't used.
> > > > + */
> > > > +#define ATOMIC_OPS(op, asm_op, I)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ATOMIC_OP (op, asm_op, =
I, w, int,=C2=A0=C2=A0 )
> > > > +
> > > > +ATOMIC_OPS(add, add,=C2=A0 i)
> > > > +ATOMIC_OPS(sub, add, -i)
> > > > +ATOMIC_OPS(and, and,=C2=A0 i)
> > > > +ATOMIC_OPS( or,=C2=A0 or,=C2=A0 i)
> > > > +ATOMIC_OPS(xor, xor,=C2=A0 i)
> > >=20
> > > ... here you want to only pass the (unary) operator (and leaving
> > > that
> > > blank
> > > is as fine as using +).
> > I agree that a game with 'i' and 'I' looks confusing, but I am not
> > really understand what is wrong with using ' i' here. It seems that
> > preprocessed macros looks fine:
> > =C2=A0=C2=A0 static inline void atomic_add(int i, atomic_t *v) { asm vo=
latile
> > ( "=C2=A0=20
> > =C2=A0=C2=A0 amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "=
r" (i)
> > :
> > =C2=A0=C2=A0 "memory" ); }
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 static inline void atomic_sub(int i, atomic_t *v) { asm vo=
latile
> > ( "=C2=A0=20
> > =C2=A0=C2=A0 amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "=
r" (-
> > i) :
> > =C2=A0=C2=A0 "memory" ); }
>=20
> I didn't question the pre-processed result being correct. Instead I
> said
> that I consider the construct confusing to the reader, for looking as
> if
> there was a mistake (in the case of the letter i used). Note also in
> particular how the macro invocations need to be in sync with the
> macro
> implementation, for lower case i being used both in the macro and in
> its
> invocations. Anything parameterized would better be fully so, at the
> very least to avoid, as said, confusion. (Having macros depend on
> context at their use sites _may_ be okay for local helper macros, but
> here we're talking about a not even private header file.)
I am not sure then I understand how mentioning '+i' will help
significantly remove confusion.

>=20
> > > > +/* This is required to provide a full barrier on success. */
> > > > +static inline int atomic_add_unless(atomic_t *v, int a, int u)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int prev, rc;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile (
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.w=C2=A0=C2=A0=C2=
=A0=C2=A0 %[p],=C2=A0 %[c]\n"
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 beq=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 %[p],=C2=A0 %[u], 1f\n"
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 add=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 %[rc], %[p], %[a]\n"
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.w.rl=
=C2=A0 %[rc], %[rc], %[c]\n"
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez=C2=
=A0=C2=A0=C2=A0=C2=A0 %[rc], 0b\n"
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCV_FULL_BARRIER
> > >=20
> > > With this and no .aq on the load, why the .rl on the store?
> > It is something that LKMM requires [1].
> >=20
> > This is not fully clear to me what is so specific in LKMM, but
> > accoring
> > to the spec:
> > =C2=A0=C2=A0 Ordering Annotation Fence-based Equivalent
> > =C2=A0=C2=A0 l{b|h|w|d|r}.aq=C2=A0=C2=A0=C2=A0=C2=A0 l{b|h|w|d|r}; fenc=
e r,rw
> > =C2=A0=C2=A0 l{b|h|w|d|r}.aqrl=C2=A0=C2=A0 fence rw,rw; l{b|h|w|d|r}; f=
ence r,rw
> > =C2=A0=C2=A0 s{b|h|w|d|c}.rl=C2=A0=C2=A0=C2=A0=C2=A0 fence rw,w; s{b|h|=
w|d|c}
> > =C2=A0=C2=A0 s{b|h|w|d|c}.aqrl=C2=A0=C2=A0 fence rw,w; s{b|h|w|d|c}
> > =C2=A0=C2=A0 amo<op>.aq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 amo<op>; fence r,rw
> > =C2=A0=C2=A0 amo<op>.rl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 fence rw,w; amo<op>
> > =C2=A0=C2=A0 amo<op>.aqrl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fen=
ce rw,rw; amo<op>; fence rw,rw
> > =C2=A0=C2=A0 Table 2.2: Mappings from .aq and/or .rl to fence-based
> > equivalents.
> > =C2=A0=C2=A0 An alternative mapping places a fence rw,rw after the exis=
ting=20
> > =C2=A0=C2=A0 s{b|h|w|d|c} mapping rather than at the front of the
> > =C2=A0=C2=A0 l{b|h|w|d|r} mapping.
>=20
> I'm afraid I can't spot the specific case in this table. None of the
> stores in the right column have a .rl suffix.
Yes, it is expected.

I am reading this table as (f.e.) amo<op>.rl is an equivalent of fence
rw,w; amo<op>. (without .rl)=20

>=20
> > =C2=A0=C2=A0 It is also safe to translate any .aq, .rl, or .aqrl annota=
tion
> > into
> > =C2=A0=C2=A0 the fence-based snippets of
> > =C2=A0=C2=A0 Table 2.2. These can also be used as a legal implementatio=
n of
> > =C2=A0=C2=A0 l{b|h|w|d} or s{b|h|w|d} pseu-
> > =C2=A0=C2=A0 doinstructions for as long as those instructions are not a=
dded
> > to
> > =C2=A0=C2=A0 the ISA.
> >=20
> > So according to the spec, it should be:
> > =C2=A0sc.w ...
> > =C2=A0RISCV_FULL_BARRIER.
> >=20
> > Considering [1] and how this code looks before, it seems to me that
> > it
> > is safe to use lr.w.aq/sc.w.rl here or an fence equivalent.
>=20
> Here you say "or". Then why dos the code use sc.?.rl _and_ a fence?
I confused this line with amo<op>.aqrl, so based on the table 2.2 above
s{b|h|w|d|c}.aqrl is transformed to "fence rw,w; s{b|h|w|d|c}", but
Linux kernel decided to strengthen it with full barrier:
   -              "0:\n\t"
   -              "lr.w.aqrl  %[p],  %[c]\n\t"
   -              "beq        %[p],  %[u], 1f\n\t"
   -              "add       %[rc],  %[p], %[a]\n\t"
   -              "sc.w.aqrl %[rc], %[rc], %[c]\n\t"
   -              "bnez      %[rc], 0b\n\t"
   -              "1:"
   +               "0:     lr.w     %[p],  %[c]\n"
   +               "       beq      %[p],  %[u], 1f\n"
   +               "       add      %[rc], %[p], %[a]\n"
   +               "       sc.w.rl  %[rc], %[rc], %[c]\n"
   +               "       bnez     %[rc], 0b\n"
   +               "       fence    rw, rw\n"
   +               "1:\n"
As they have the following issue:
   implementations of atomics such as atomic_cmpxchg() and
   atomic_add_unless() rely on LR/SC pairs,
   which do not give full-ordering with .aqrl; for example, current
   implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
   below to end up with the state indicated in the "exists" clause.

>=20
> > But in general it ( a combination of fence, .aq, .rl ) can be
> > considered as the same things in this context, so it is possible to
> > leave this function as is to be synced here with Linux kernel.
>=20
> In turn I also don't understand this. Yes, the excess .rl certainly
> doesn't render things unsafe. But what's the purpose of the .rl?
> That's
> what my original question boiled down to.
I don't know, either. As I mentioned before, it is enough ( in my
opinion ) to have a FULL barrier or .aq,.rl or .aqrl/.aqrl ( if it
needed to be strengthened) like it was done before in Linux.
It seems to me it is LKMM specific that they need more to be more
strengthened as it RISC-V Memory model requires because:
"sc.w ; fence rw, rw" does not guarantee that all previous reads and
writes finish before the sc itself is globally visible, which might
matter if the sc is unlocking a lock or something.

Despite of the fact, for compare-and-swap loops, RISC-V international
recommends lr.w.aq/lr.d.aq followed by sc.w.rl/sc.d.rl ( as it was
implemeted before in Linux kernel ) I am okay just for safety reasons
and for the reason I mentioned at the last sentence of previous
paragraph to strengthen implementations with fences.

~ Oleksii
>=20
> Jan
>=20
> > [1]
> > https://lore.kernel.org/lkml/1520274276-21871-1-git-send-email-parri.an=
drea@gmail.com
> > /
> >=20
> > ~ Oleksii
>=20


