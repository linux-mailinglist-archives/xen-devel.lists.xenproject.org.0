Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23E74D0A3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561098.877414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImeL-0006VI-MN; Mon, 10 Jul 2023 08:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561098.877414; Mon, 10 Jul 2023 08:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImeL-0006Sw-JL; Mon, 10 Jul 2023 08:53:41 +0000
Received: by outflank-mailman (input) for mailman id 561098;
 Mon, 10 Jul 2023 08:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbMe=C4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qImeK-0006Sk-EY
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:53:40 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b3db50-1eff-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 10:53:38 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso6458425e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 01:53:38 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a056512024b00b004fb76751156sm1611076lfo.157.2023.07.10.01.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:53:37 -0700 (PDT)
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
X-Inumbo-ID: 42b3db50-1eff-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688979217; x=1691571217;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8A25Ofh6EHiYPaglhgbe/Nue8Bthl09YvlTGHT+WidQ=;
        b=r3cL5DrBW4wyLMJm62QRRWASPNN4j1SSrtf8CyyhhMewqDZeON2nWfQEiFFeHH0I99
         Zn9s51RND+fY0J7SqoeH3O6d+zPYwqVIy0BCvwtKHJpZbpf19hUE8wVYLd4QQdM6gXob
         +T+nCUBgXfnR11rINI/o1PGJzV112hkkqUMbvF42W0W+ZI4DrpmWTGksMAJcQg3u/ulr
         fqXOyt49erKENcSgOKdjI91kFLdpANelBZQdzLHYSYqJwImnW/naLiekA4dJbVCJI/xJ
         L6XlBWO1/0wR+BB+xi0kCT9wJ09hnKuy5YjEttpTfZ68ZCkV5SlaX5l6mok3ZeICIKO3
         A8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979217; x=1691571217;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8A25Ofh6EHiYPaglhgbe/Nue8Bthl09YvlTGHT+WidQ=;
        b=djzeJISoLevX+qoa56d/n5p9Gy8sKO97nLPtE6XRN42OQquUPK8jq8rXxXoW9gggn6
         pkB0wDqzBW8DytOZ9VkrRBHhO6c7fwrIk2Ku3susqLUaq0WAvaC16ER3s5X/qYE/jb8J
         KjPfyEl2ON3QDqXPfihHjgkoIrl8U1P7R8PQX7Raw0M2vj/7achtMwOupaMuhJj6IpKL
         jO9fzdH9YxKdZ0ivbS1R72FYrIvGtJhkNKxtzuRQr5MEUIlt92EcmqdK4Ih/MrmLtxjI
         hNMijlyVH+vkAKVIlQ9Cco6HVzqwTGQ4TO7u7ta3/oGe8Fkye/p2R4W+2QCHIsAz0pYp
         6KwQ==
X-Gm-Message-State: ABy/qLZVx6aVFKqlgeP0ERw0zYDwuWt4UVsoRgehh6RE819I78Yuvhb0
	I/HfPs5mdvhwA27r4VPSvBzzqHcMacI=
X-Google-Smtp-Source: APBJJlH4zg1sJNwuNMQo06FaGv+koEmh/bMz9qR+toc7LsD87NpEhQceFbx7QEcohn8MF/JyiLmhag==
X-Received: by 2002:a19:691e:0:b0:4f9:5718:70b0 with SMTP id e30-20020a19691e000000b004f9571870b0mr8359227lfc.41.1688979217439;
        Mon, 10 Jul 2023 01:53:37 -0700 (PDT)
Message-ID: <9e6fdb4f946b804ae102069825b0f56a3997a4dc.camel@gmail.com>
Subject: Re: [PATCH v2 4/6] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 10 Jul 2023 11:53:36 +0300
In-Reply-To: <69699edb-78b2-336c-15f5-2b243257852e@suse.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
	 <21d8ce65f718bc10c2213688f79cf5f978bcaf16.1687178053.git.oleksii.kurochko@gmail.com>
	 <67df28ad-060e-07d5-acf2-02c3cd5f0b96@suse.com>
	 <1edb0c61a8ef64bb47809049252e9ad7b19f4bbe.camel@gmail.com>
	 <69699edb-78b2-336c-15f5-2b243257852e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-07-07 at 12:51 +0200, Jan Beulich wrote:
> On 07.07.2023 12:37, Oleksii wrote:
> > On Thu, 2023-07-06 at 13:35 +0200, Jan Beulich wrote:
> > > On 19.06.2023 15:34, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/include/asm/config.h
> > > > +++ b/xen/arch/riscv/include/asm/config.h
> > > > @@ -1,3 +1,5 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +
> > > > =C2=A0#ifndef __RISCV_CONFIG_H__
> > > > =C2=A0#define __RISCV_CONFIG_H__
> > > > =C2=A0
> > >=20
> > > Unrelated change?
> > It=C2=A0 should be part of [PATCH v2 5/6] xen/riscv: introduce identity
> > mapping.
>=20
> Hmm, here we're discussing "[PATCH v2 4/6] xen/riscv: introduce
> identity
> mapping". I'm confused, I guess.
Sorry for confusion. i meant the patch: [PATCH v2 5/6] xen/riscv: add
SPDX tags.

>=20
> > > > --- a/xen/arch/riscv/mm.c
> > > > +++ b/xen/arch/riscv/mm.c
> > > > @@ -25,6 +25,12 @@ unsigned long __ro_after_init phys_offset;
> > > > =C2=A0#define LOAD_TO_LINK(addr) ((unsigned long)(addr) -
> > > > phys_offset)
> > > > =C2=A0#define LINK_TO_LOAD(addr) ((unsigned long)(addr) +
> > > > phys_offset)
> > > > =C2=A0
> > > > +/*
> > > > + * Should be removed as soon as enough headers will be merged
> > > > for
> > > > inclusion of
> > > > + * <xen/lib.h>.
> > > > + */
> > > > +#define ARRAY_SIZE(arr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(sizeof(arr) /
> > > > sizeof((arr)[0]))
> > > > +
> > > > =C2=A0/*
> > > > =C2=A0 * It is expected that Xen won't be more then 2 MB.
> > > > =C2=A0 * The check in xen.lds.S guarantees that.
> > > > @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
> > > > =C2=A0 *
> > > > =C2=A0 * It might be needed one more page table in case when Xen
> > > > load
> > > > address
> > > > =C2=A0 * isn't 2 MB aligned.
> > > > + *
> > > > + * (CONFIG_PAGING_LEVELS - 1) page tables are needed for
> > > > identity
> > > > mapping.
> > > > =C2=A0 */
> > > > -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> > > > +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 +
> > > > 1)
> > >=20
> > > How come the extra page (see the comment sentence in context)
> > > isn't
> > > needed for the identity-mapping case?
> > It is needed to allocate no more than two 'nonroot' page tables (L0
> > and
> > L1 in case of Sv39 ) as page 'root' table ( L2 in case of Sv39 ) is
> > always re-used.
> >=20
> > The same ( only 'nonroot' page tables might be needed to allocate )
> > works for any MMU mode.
>=20
> Of course, but if you cross a 2Mb boundary you'll need 2 L0 tables.
Yes, in the case of crossing a 2Mb boundary, it will require 2 L0
tables.

Then, the number of required page tables is needed depending on Xen
size and load address alignment. Because for each 2Mb, we need a new L0
table.

Sure, this is not needed now ( as in xen.lds.S, we have a Xen size
check ), but if someone increases Xen size binary to 4Mb, then the
amount of page tables should be updated too.
Should we take into account that?

>=20
> > > > @@ -255,25 +262,30 @@ void __init noreturn noinline
> > > > enable_mmu()
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 csr_write(CSR_SATP,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PFN_DOWN((unsigned long)stage1_pgtbl_root) |
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 RV_STAGE1_MODE << SATP_MODE_SHIFT);
> > > > +}
> > > > =C2=A0
> > > > -=C2=A0=C2=A0=C2=A0 asm volatile ( ".p2align 2" );
> > > > - mmu_is_enabled:
> > > > -=C2=A0=C2=A0=C2=A0 /*
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Stack should be re-inited as:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * 1. Right now an address of the stack is=
 relative to
> > > > load
> > > > time
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 addresses what will c=
ause an issue in case of load
> > > > start
> > > > address
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 isn't equal to linker=
 start address.
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * 2. Addresses in stack are all load time=
 relative which
> > > > can
> > > > be an
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 issue in case when lo=
ad start address isn't equal to
> > > > linker
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 start address.
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * We can't return to the caller because t=
he stack was
> > > > reseted
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * and it may have stash some variable on =
the stack.
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Jump to a brand new function as the sta=
ck was reseted
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +void __init remove_identity_mapping(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *pgtbl;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int index, xen_index;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_addr =3D LINK_TO_LOAD(_start=
);
> > > > =C2=A0
> > > > -=C2=A0=C2=A0=C2=A0 switch_stack_and_jump((unsigned long)cpu0_boot_=
stack +
> > > > STACK_SIZE,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 cont_after_mmu_is_enabled);
> > > > +=C2=A0=C2=A0=C2=A0 for ( pgtbl =3D stage1_pgtbl_root, i =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i <=3D (CON=
FIG_PAGING_LEVELS - 1);
> > >=20
> > > i < CONFIG_PAGING_LEVELS ? But maybe it would be easier for i to
> > > start
> > > at CONFIG_PAGING_LEVELS and be decremented, simplifying ...
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i++ )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index =3D pt_index(CONF=
IG_PAGING_LEVELS - 1 - i,
> > > > load_addr);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_index =3D pt_index(=
CONFIG_PAGING_LEVELS - 1 - i,
> > > > XEN_VIRT_START);
> > >=20
> > > ... these two expressions?
> > It makes sense. I'll update this part of the code.
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( index !=3D xen_ind=
ex )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pgtbl[index].pte =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > Is this enough? When load and link address are pretty close (but
> > > not
> > > overlapping), can't they share a leaf table, in which case you
> > > need
> > > to clear more than just a single entry? The present overlap check
> > > looks to be 4k-granular, not 2M (in which case this couldn't
> > > happen;
> > > IOW adjusting the overlap check may also be a way out).
> > At the start of setup_initial_pagetables() there is a code which
> > checks
> > that load and link address don't overlap:
> >=20
> > =C2=A0=C2=A0=C2=A0 if ( (linker_start !=3D load_start) &&
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (linker_start <=3D loa=
d_end) && (load_start <=3D linker_end) )
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("(XEN) linker a=
nd load address ranges
> > overlap\n");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die();
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > So the closest difference between load and link address can be 4kb.
> > Otherwise load and link address ranges are equal ( as we can't map
> > less
> > then 4kb).
> >=20
> > Let's take concrete examples:
> > =C2=A0 Load address range is=C2=A0=C2=A0 0x8020_0000 - 0x8020_0FFF
> > =C2=A0 Linker address range is 0x8020_1000 - 0x8020_1FFF
> > =C2=A0 MMU mode: Sv39 ( so we have 3 page tables )
> >=20
> > =C2=A0 So we have:
> > =C2=A0=C2=A0=C2=A0 * L2 index =3D 2, L1 index =3D 1, L0 index =3D 0 for=
 load address
> > =C2=A0=C2=A0=C2=A0 * L2 index =3D 2, L1 index =3D 1, L0 index =3D 1 for=
 linker address
> > =C2=A0 Thereby we have two different L0 tables for load and linker
> > address=20
> > ranges.
> > =C2=A0 And it looks like it is pretty safe to remove only one L0 index
> > that
> > was used for identity mapping.
> >=20
> > Is it possible that I missed something?
>=20
> Looks as if you are thinking of only a Xen which fits in 4k. The code
> here wants to cope with Xen getting quite a bit bigger.

Yeah, I missed that when I tried to come up with an example.

So it will probably be more universal if we recursively go through the
whole identity mapping and unmap each pte individually.

