Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC5963F26
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 10:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785552.1195034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjatu-0000Or-6G; Thu, 29 Aug 2024 08:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785552.1195034; Thu, 29 Aug 2024 08:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjatu-0000Ly-3Y; Thu, 29 Aug 2024 08:53:06 +0000
Received: by outflank-mailman (input) for mailman id 785552;
 Thu, 29 Aug 2024 08:53:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LPGY=P4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjatr-0000Ls-Ot
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 08:53:03 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f5a3d0-65e4-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 10:53:01 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef27bfd15bso3958171fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 01:53:01 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f61519548fsm1214691fa.138.2024.08.29.01.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 01:52:59 -0700 (PDT)
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
X-Inumbo-ID: 18f5a3d0-65e4-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724921581; x=1725526381; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3pAeqYcXGKMwmvhFqpwMfbF2m53XROhpyAYtZoIZ/Ts=;
        b=JQatCZKk9QFejoa7RDtq0RcJQxn8I0N1QPcXUB8sCvyc/QNfydDvfnEeLvQLLRCbNz
         mgr5f1jfp0P/uArBxHj/BC4CdyBGHfIW1HP6huG8r/o9S+6ofEc5IFsMrEhtKQ4vu7F9
         dhDu6cs0pFlsL8Eu4kdzNLYinXEmacJEGkYHw7BWABPOqr+Uu4R722OXxcbe7Y9q24//
         7otfRgLmeB1BayMN0MkhLcj0YmnDIdZ8fyQyxWDMDdHudOobRoud0m+tGs0RaVjUtIz1
         dKT5uXACBuOVTj/WLxR9VOKzbKbX52vg1RNauGlc3Z5WSUbbrwepixB/1Rjm9xDR/XAF
         pudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921581; x=1725526381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3pAeqYcXGKMwmvhFqpwMfbF2m53XROhpyAYtZoIZ/Ts=;
        b=srgz9lkKWQ+YHLSK2yH97fuyWnTI5QyE8fSzrJEIctqGe2wlY1T23qHx0ex+roE5VG
         FL/n2gwtBTkA1lusL75LoFZtYQdbdkoB3P4s4upKUgCPM8Z/fWHTNMQ1tEHeRHpMo/2N
         3nkjI7RaeU0xKVkaDjoBCjqSZe/bdNKigB4Yl4zC4GEypQ2PP49aMCML5DWSIqdRNjUV
         LpEP2MVcAIJ4gUsIxulANXmRHtrGBq+cBPrku46JlYNTth2iGPxV06XHWcXC4EcknAaH
         V5I/ls3UeBK40CzrTo7EU88txVo711bX6E1B5kjxqHyYXTm68X37f4etNnlnolUVKTos
         lqpA==
X-Forwarded-Encrypted: i=1; AJvYcCV9t3b7A4aPjz8b3dwvr1y+UGixbHyprxNjiS1Zx6h4gO6UowtkV7N6hVjbEwRECYHuorpkqZcCGSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydZ4IJdPrY67eWlaH2JDVoiiClXHf60VCA5y5GFMs/Ehpzyenj
	2GOAagnWiCRbhcB/rKReTj2ySCq/efQ7Rg51BRMpm49zgbn9iyGZ
X-Google-Smtp-Source: AGHT+IFomjk60ayFYhj5yurQ5SKHmHhdEuzl2MovCnhlR4rEjMUlT2c2/1gwTvJv8TUXNecNCmSRpQ==
X-Received: by 2002:a05:651c:210d:b0:2f3:f690:17f3 with SMTP id 38308e7fff4ca-2f610889e5bmr16730641fa.31.1724921580344;
        Thu, 29 Aug 2024 01:53:00 -0700 (PDT)
Message-ID: <8cdeec70558a45597700d3ecf86aa4612348a50a.camel@gmail.com>
Subject: Re: [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 29 Aug 2024 10:52:59 +0200
In-Reply-To: <45f1305f-2c2c-4b1c-8377-f98dbc5dbe53@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <5140f9eb3d1cb0b69e3b1cbbcce6167ff8d59e4c.1724256026.git.oleksii.kurochko@gmail.com>
	 <0f9fb47c-91d1-4ee9-b6bf-1d491339e904@suse.com>
	 <3f52a19ea90fa8e70d7bf0055fe39a2be721c129.camel@gmail.com>
	 <45f1305f-2c2c-4b1c-8377-f98dbc5dbe53@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-08-28 at 11:42 +0200, Jan Beulich wrote:
> On 28.08.2024 11:21, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-27 at 12:06 +0200, Jan Beulich wrote:
> > > On 21.08.2024 18:06, Oleksii Kurochko wrote:
> > > > In Xen, memory-ordered atomic operations are not necessary,
> > >=20
> > > This is an interesting statement.
> > I looked at the definition of build_atomic_{write,read}() for other
> > architectures and didn't find any additional memory-ordered
> > primitives
> > such as fences.
> >=20
> > > I'd like to suggest that you at least
> > > limit it to the two constructs in question, rather than stating
> > > this
> > > globally for everything.
> > I am not sure that I understand what is "the two constructs". Could
> > you
> > please clarify?
>=20
> {read,write}_atomic() (the statement in your description is, after
> all,
> not obviously limited to just those two, yet I understand you mean to
> say what you say only for them)
Yeah, I re-read commit message after your reply and now I can see that
is not really clear.

>=20
> > > > based on {read,write}_atomic() implementations for other
> > > > architectures.
> > > > Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
> > > > {read,write}{b,w,l,q}(), allowing the caller to decide if
> > > > additional
> > > > fences should be applied before or after {read,write}_atomic().
> > > >=20
> > > > Change the declaration of _write_atomic() to accept a 'volatile
> > > > void *'
> > > > type for the 'x' argument instead of 'unsigned long'.
> > > > This prevents compilation errors such as:
> > > > 1."discards 'volatile' qualifier from pointer target type,"
> > > > which
> > > > occurs
> > > > =C2=A0 due to the initialization of a volatile pointer,
> > > > =C2=A0 e.g., `volatile uint8_t *ptr =3D p;` in _add_sized().
> > >=20
> > > I don't follow you here.
> > This issue started occurring after the change mentioned in point 2
> > below.
> >=20
> > I initially provided an incorrect explanation for the compilation
> > error
> > mentioned above. Let me correct that now and update the commit
> > message
> > in the next patch version. The reason for this error is that after
> > the
> > _write_atomic() prototype was updated from _write_atomic(...,
> > unsigned
> > long, ...) to _write_atomic(..., void *x, ...), the write_atomic()
> > macro contains x_, which is of type 'volatile uintX_t' because ptr
> > has
> > the type 'volatile uintX_t *'.
>=20
> While there's no "ptr" in write_atomic(), I think I see what you
> mean. Yet
> at the same time Arm - having a similar construct - gets away without
> volatile. Perhaps this wants modelling after read_atomic() then,
> using a
> union?
The use of a union could be considered as a solution. For now, I think
I will just update write_pte() to avoid this issue and and minimize
changes in this patch.

>=20
> > > > 2."incompatible type for argument 2 of '_write_atomic'," which
> > > > can
> > > > occur
> > > > =C2=A0 when calling write_pte(), where 'x' is of type pte_t rather
> > > > than
> > > > =C2=A0 unsigned long.
> > >=20
> > > How's this related to the change at hand? That isn't different
> > > ahead
> > > of
> > > this change, is it?
> > This is not directly related to the current change, which is why I
> > decided to add a sentence about write_pte().
> >=20
> > Since write_pte(pte_t *p, pte_t pte) uses write_atomic(), and the
> > argument types are pte_t * and pte respectively, we encounter a
> > compilation issue in write_atomic() because:
> >=20
> > _write_atomic() expects the second argument to be of type unsigned
> > long, leading to a compilation error like "incompatible type for
> > argument 2 of '_write_atomic'."
> > I considered defining write_pte() as write_atomic(p, pte.pte), but
> > this
> > would fail at 'typeof(*(p)) x_ =3D (x);' and result in a compilation
> > error 'invalid initializer' or something like that.
> >=20
> > It might be better to update write_pte() to:
> > =C2=A0=C2=A0 /* Write a pagetable entry. */
> > =C2=A0=C2=A0 static inline void write_pte(pte_t *p, pte_t pte)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_atomic((unsigned long *)p, p=
te.pte);
> > =C2=A0=C2=A0 }
> > Then, we wouldn't need to modify the definition of write_atomic()
> > or
> > change the type of the second argument of _write_atomic().
> > Would it be better?
>=20
> As said numerous times before: Whenever you can get away without a
> cast,
> you should avoid the cast. Here:
>=20
> static inline void write_pte(pte_t *p, pte_t pte)
> {
> =C2=A0=C2=A0=C2=A0 write_atomic(&p->pte, pte.pte);
> }
>=20
> That's one of the possible options, yes. Yet, like Arm has it, you
> may
> actually want the capability to read/write non-scalar types. If so,
> adjustments to write_atomic() are necessary, yet as indicated before:
> Please keep such entirely independent changes separate.
I quickly checked that there is only one instance where write_atomic()
is used for a scalar type in the Arm code. I think it would be better
to update RISC-V's write_pte() and not modify write_atomic(), at least
for now.

Thanks.

~ Oleksii

