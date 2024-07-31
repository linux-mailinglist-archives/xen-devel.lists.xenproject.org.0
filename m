Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF82942B67
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 12:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768418.1179204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ68N-0003Cg-Fi; Wed, 31 Jul 2024 10:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768418.1179204; Wed, 31 Jul 2024 10:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ68N-0003A4-D3; Wed, 31 Jul 2024 10:00:39 +0000
Received: by outflank-mailman (input) for mailman id 768418;
 Wed, 31 Jul 2024 10:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8n5P=O7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZ68M-00036h-9b
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 10:00:38 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbdae474-4f23-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 12:00:36 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so12337194e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 03:00:36 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19dc4sm2150406e87.221.2024.07.31.03.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 03:00:35 -0700 (PDT)
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
X-Inumbo-ID: bbdae474-4f23-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722420036; x=1723024836; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lflpAgmWCCSwIrZR6/0U2fHK01ooOxuX985VkJBiB3U=;
        b=eO3lf/2N2qJ2/Ox2OOZUYLRdxPDeZdm3x7N08lmJIJJD/upEn2F3sDT+1LhhSiC288
         yaacdc0wvd5S92/7fUPKT444qA4mZndgcdoFqseveDWds9W6SSmzG04KO1HCl+2Ynt9i
         YMue8Dsm5mYQEqwZ8poeGcLMQ4JsueAEiPzEufIVMatybry2s4PuLHg6t9k1q66qylyk
         bTi/kedtyaaPgYa4iJDNivTSji+UDbFNC8t4OG2gy7whs9vteu1Ulzz7NkmhMyK9nKFh
         srHiwiQvDdScPZKf1toEmBd3FvDjbuCZb69NVdVMhetS7ImDYuUYnTr9GDaC6MdNGsfn
         VFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722420036; x=1723024836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lflpAgmWCCSwIrZR6/0U2fHK01ooOxuX985VkJBiB3U=;
        b=ZSWjczYTLHX7ddTn0GXFn31hbkwIViQC1BLFlu13zjM/cpqpUB03xVNXv/AGbyxPJc
         pV+tMGeL5P5oc2k5Hgbsa2sEbJkJHUI20PPPcJ85CXPp20eLSJDkDSf6NLA69m33a5aV
         d9AbGwYZIAbWd36StLMIa6/ddTSizVNDu5zuPH0IkoJRtnGhj3zM2icUVn8h0W6VY3NV
         P949wdisRk7VOQNfsO82D/bRC5GyawL4zJDxR7BtXdldbn21cG8B/1asmL5YtzPDGJIH
         NpM9C1ZxpebiVpm4nqoKtTz35fQzA+nH/Ykn14BM98TT9z5BDmOUJUCirh9ZnmaXcK63
         pQ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXAr3GFWoPsF9rK2TVhksY8JiCYLoN7ZPLd5qjGI0GW4QtfqXjKaGfh/Nejabz6R60WrWsz0hsFLH5PJRfFonPpQPkkUZr8ydqxarIJjOY=
X-Gm-Message-State: AOJu0YwjqrJ10ZTxGFSrbivScf6NXxURBEhezrFtxIT55wkTINoBhd9S
	2fxkTy5VQeMdBFoGgnW3XCsQTuUvrz2R7s5xlKGTPF2vIGs4e1ho
X-Google-Smtp-Source: AGHT+IEeGfamhHQCI8DmVBCEqIgWHQw3MPX50YVhl+cNsuhuKr7pm+jmhUu6ohtHMSGAyG2JAvKQ5Q==
X-Received: by 2002:ac2:43d2:0:b0:52f:cd03:a823 with SMTP id 2adb3069b0e04-5309b2cac8cmr11622466e87.45.1722420035589;
        Wed, 31 Jul 2024 03:00:35 -0700 (PDT)
Message-ID: <60d1fbab4c94feb7e0bf88d0a3b2499f2f8baca4.camel@gmail.com>
Subject: Re: [PATCH v3 5/9] xen/riscv: introduce asm/pmap.h header
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 31 Jul 2024 12:00:34 +0200
In-Reply-To: <36944f26-1180-4eaa-aa5d-3186e65faeb8@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <11b5487659a9c76793e520c108cd92c6c84b908d.1721834549.git.oleksii.kurochko@gmail.com>
	 <3359e37e-eaae-49ca-80a5-2bf70b9b46c7@suse.com>
	 <78effb178b1ffe7ccb1714a13157e94f5e816b01.camel@gmail.com>
	 <6c2ebc9e-cc0d-4139-80a2-4d7025989a9e@suse.com>
	 <035f836a53966194048df5b720b94a78b0a490ae.camel@gmail.com>
	 <36944f26-1180-4eaa-aa5d-3186e65faeb8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-30 at 14:15 +0200, Jan Beulich wrote:
> On 30.07.2024 13:39, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-07-30 at 09:56 +0200, Jan Beulich wrote:
> > > On 29.07.2024 18:22, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Mon, 2024-07-29 at 16:29 +0200, Jan Beulich wrote:
> > > > > On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > > > > > --- /dev/null
> > > > > > +++ b/xen/arch/riscv/include/asm/pmap.h
> > > > > > @@ -0,0 +1,33 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > > +#ifndef ASM_PMAP_H
> > > > > > +#define ASM_PMAP_H
> > > > > > +
> > > > > > +#include <xen/bug.h>
> > > > > > +#include <xen/mm.h>
> > > > > > +#include <xen/page-size.h>
> > > > > > +
> > > > > > +#include <asm/fixmap.h>
> > > > > > +#include <asm/flushtlb.h>
> > > > > > +#include <asm/system.h>
> > > > > > +
> > > > > > +static inline void arch_pmap_map(unsigned int slot, mfn_t
> > > > > > mfn)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slot];
> > > > > > +=C2=A0=C2=A0=C2=A0 pte_t pte;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVIS=
OR_RW);
> > > > > > +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > > > > > +}
> > > > >=20
> > > > > Perhaps add a comment to clarify why it's safe to omit a TLB
> > > > > flush
> > > > > here.
> > > > > Note that arch_pmap_unmap() having one is a necessary but not
> > > > > sufficient
> > > > > condition to that. In principle hardware may also cache
> > > > > "negative"
> > > > > TLB
> > > > > entries; I have no idea how RISC-V behaves in this regard, or
> > > > > whether
> > > > > that aspect is actually left to implementations.
> > > > what do you mean by "negative" TLB? an old TLB entry which
> > > > should
> > > > be
> > > > invalidated?
> > >=20
> > > No, I mean TLB entries saying "no valid translation here". I.e.
> > > avoiding
> > > recurring walks of something that was once found to have no
> > > translation.
> > But we can't modify an existent entry because we have
> > "ASSERT(!pte_is_valid(*entry))" in pmap_map() function and we are
> > doing
> > TLB flush during pmap_unmap().
>=20
> You _always_ modify an existing entry. That may be a not-present one,
> but
> that's still an entry. And that's part of why I think you still
> didn't
> understand what I said. A particular implementation, if permitted by
> the
> spec, may very well put in place a TLB entry when the result of a
> page
> walk was a non-present entry. So ...
>=20
> > So when we will be in pmap_map() we are
> > sure that there is no TLB entry for the new pte.
>=20
> ..., can you point me at the part of the spec saying that such
> "negative"
> TLB entries are not permitted?
I double-checked the spec and it seems to me you are right and it could
be an issue. Absense of "negative" TLB entrues will be guaranted only
in the case when Svvptc extension is present (
https://github.com/riscv/riscv-svvptc/blob/main/svvptc.adoc?plain=3D1#L85
):
   Depending on the microarchitecture, some possible ways to facilitate
   implementation of Svvptc include: not having any address-translation
   caches, not
   storing Invalid PTEs in the address-translation caches, automatically
   evicting
   Invalid PTEs using a bounded timer, or making address-translation
   caches
   coherent with store instructions that modify PTEs.

If the mentioned above extension isn't present. Also there is the
following words in the spec=20
(=C2=A0https://github.com/riscv/riscv-isa-manual/blob/main/src/supervisor.a=
doc?plain=3D1#L1213
):
   For the special cases of increasing the permissions on a leaf PTE and
   changing an invalid
   PTE to a valid leaf, software may choose to execute the SFENCE.VMA
   lazily. After
   modifying the PTE but before executing SFENCE.VMA, either the new or
   old permissions
   will be used. In the latter case, a page-fault exception might occur,
   at which point software
   should execute SFENCE.VMA in accordance with the previous bullet point.

Probably in the future we will need also similar to work Linux kernel
does:
https://patchwork.kernel.org/project/linux-mips/cover/20240131155929.169961=
-1-alexghiti@rivosinc.com/

So I'll add flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE)
in arch_pmap_map.

~ Oleksii

