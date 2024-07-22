Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F268B9392F1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762257.1172398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwSE-0001cO-Pm; Mon, 22 Jul 2024 17:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762257.1172398; Mon, 22 Jul 2024 17:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwSE-0001ae-Lx; Mon, 22 Jul 2024 17:04:06 +0000
Received: by outflank-mailman (input) for mailman id 762257;
 Mon, 22 Jul 2024 17:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urmM=OW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sVwSD-0001aO-30
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:04:05 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65492a72-484c-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 19:04:03 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f01e9f53ebso1773631fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 10:04:02 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef9b5fd2fsm1036465e87.150.2024.07.22.10.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:04:01 -0700 (PDT)
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
X-Inumbo-ID: 65492a72-484c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721667842; x=1722272642; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uSPi2blhOVCVd814q7L01w/lpkrB4JIQ5mtsfOghN88=;
        b=eQ3Tb9hU5dq5lt3HVcYRZ1kMHovczrduKC4sAI32uzrM0NiWFyUlTrNnnN8RKfj2rz
         snunWPEP1zUhPWmBfHRS3QrZms28SWW99Hj4VjtReKa+2ngShqGWksLc9RKnMz4f80Pe
         zaVkWv/T972NINiANSSI4RuJJXdA7F0BVWcsw7T0xeOJWmKhdlQc0Clv4g1/2KgwGrSP
         FY1iqzfVbJyfU9DD2nB/nPTFcEqm98B7ivbwS9UWD73NWixEIcfvAtKdfuzIxyTUwgBM
         BZsAVx2Y/CBf7E5etsjObXHB3bHQTh/Qnl/NhJVjsRtrp9hAySnX+N9GgiFuFJHxPeye
         ZK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721667842; x=1722272642;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSPi2blhOVCVd814q7L01w/lpkrB4JIQ5mtsfOghN88=;
        b=VH1ZA2II2UaHe4DUf4FJoLoZ0UN3qmCBMr3xNLhMG505U79VsJCj1ayHGsKS8Vfj1P
         ijDzoobOZxf10Y4rtK5FEXVkaGmgArYKM/g/J/xnYfr1QXUVS16H4iwt/G9u875+e5jg
         14qArS/N7gGhmsLL/5HuL+ApPEwxGURFxuZEh75uLQA0cg/Y7yuiANhG3BRDk8yHCE7r
         ufIbHavvIteBEcHVhPFcuBEzthmr6ZMZ3ieHJmUegagM/BD/MuK0SkeRxpG9jc3Y0+aE
         YkklB+juU1aUZjUtTlMP66dQG5BMjQJradKWMNY92kEay8jfiwAEiFfJbSezmD5nGbqt
         bcEg==
X-Forwarded-Encrypted: i=1; AJvYcCVlHUcCLsul46J5uj9RfrbJUzDW0JzRUhHW0kuSVNZFB/AKQ67i06DeI9EpHYf3qersGrO/sXbIN259A4dRSuzUblL6hK01Z5WJcc8xMmE=
X-Gm-Message-State: AOJu0YzKIt7zyo1GuazpfE/JNho9fky9sLpnK47HyTRcaInNpuURajG6
	IPSgGzuc6iuUJuSJkhU0RdOoEc+MEoYLt6NujtLypYzuuDO/wFez
X-Google-Smtp-Source: AGHT+IGm9yR+X9Di6ofWr2QwO4C+lVdOa1xP65QVpT/K7IXvFs4PyG35VwCta5D0QJDLKc2r0ic43g==
X-Received: by 2002:a05:6512:1245:b0:52f:c14e:2533 with SMTP id 2adb3069b0e04-52fc14e2678mr1553688e87.48.1721667841595;
        Mon, 22 Jul 2024 10:04:01 -0700 (PDT)
Message-ID: <215dd01dee2d793e371feab3a42c9d9c51252b03.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2024 19:04:00 +0200
In-Reply-To: <53e2a88b-8d2d-477a-84cb-5b44af365dbe@suse.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
	 <16648c6c-416d-4205-8d16-38c006251bb9@suse.com>
	 <26a45d85fa22a696b629e602e87d5d95626b77f0.camel@gmail.com>
	 <53e2a88b-8d2d-477a-84cb-5b44af365dbe@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-22 at 17:25 +0200, Jan Beulich wrote:
> On 22.07.2024 16:36, Oleksii wrote:
> > On Mon, 2024-07-22 at 14:42 +0200, Jan Beulich wrote:
> > > On 12.07.2024 18:22, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/include/asm/config.h
> > > > +++ b/xen/arch/riscv/include/asm/config.h
> > > > @@ -74,11 +74,20 @@
> > > > =C2=A0#error "unsupported RV_STAGE1_MODE"
> > > > =C2=A0#endif
> > > > =C2=A0
> > > > +#define XEN_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(2)
> > > > +#define XEN_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (XEN_VIRT_START + XEN_SIZE)
> > > > +
> > > > +#define BOOT_FDT_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0 XEN_VIRT_END
> > > > +#define BOOT_FDT_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(4)
> > > > +
> > > > =C2=A0#define DIRECTMAP_SLOT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 509
> > > > =C2=A0#define DIRECTMAP_SLOT_START=C2=A0=C2=A0=C2=A0 200
> > > > =C2=A0#define DIRECTMAP_VIRT_START=C2=A0=C2=A0=C2=A0 SLOTN(DIRECTMA=
P_SLOT_START)
> > > > =C2=A0#define DIRECTMAP_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (SLOTN(DIRECTMAP_SLOT_END) -
> > > > SLOTN(DIRECTMAP_SLOT_START))
> > > > =C2=A0
> > > > +#define FIXMAP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (BOOT_FDT_VIRT_START +
> > > > BOOT_FDT_VIRT_SIZE)
> > > > +#define FIXMAP_ADDR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (FIXMAP_BASE + (n) *
> > > > PAGE_SIZE)
> > >=20
> > > Why exactly do you insert this here, and not adjacent to
> > > BOOT_FDT_VIRT_*,
> > > which it actually is adjacent with?
> > I tried to follow alphabetical order.
>=20
> Oh, X before B (just making fun) ... Anyway, my take here is that
> sorting
> by address is going to be more helpful.
>=20
> > > > --- a/xen/arch/riscv/mm.c
> > > > +++ b/xen/arch/riscv/mm.c
> > > > @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
> > > > =C2=A0pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > > > =C2=A0stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES]=
;
> > > > =C2=A0
> > > > +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > > > +xen_fixmap[PAGETABLE_ENTRIES];
> > >=20
> > > Any reason this cannot be static?
> > It will be used by pmap:
> > =C2=A0=C2=A0 static inline void arch_pmap_map(unsigned int slot, mfn_t =
mfn)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slot]=
;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte;
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE=
_HYPERVISOR_RW);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEAF_DEFAULT;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > =C2=A0=C2=A0 }
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 static inline void arch_pmap_unmap(unsigned int slot)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte);
> > =C2=A0=C2=A0 }
>=20
> Yet as asked there - shouldn't that be set_fixmap() and
> clear_fixmap()?
It should be, I'll rework that in the next patch version.

~ Oleksii

