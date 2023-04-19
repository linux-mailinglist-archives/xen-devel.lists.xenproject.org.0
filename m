Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB46E7B0F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523480.813564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp81l-0004Ls-CO; Wed, 19 Apr 2023 13:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523480.813564; Wed, 19 Apr 2023 13:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp81l-0004J9-8c; Wed, 19 Apr 2023 13:39:17 +0000
Received: by outflank-mailman (input) for mailman id 523480;
 Wed, 19 Apr 2023 13:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RA+/=AK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pp81j-0004J1-Cy
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:39:15 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 929858f8-deb7-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 15:39:14 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2a8b766322bso27992341fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Apr 2023 06:39:13 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j25-20020a19f519000000b004edc6067affsm950399lfb.8.2023.04.19.06.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 06:39:12 -0700 (PDT)
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
X-Inumbo-ID: 929858f8-deb7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681911553; x=1684503553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QX0N3D0hQrUbD4jeZe1Gbsve/yRImx9bQlJw/URsiQg=;
        b=o+4sqYUO2JQ/IA15VCmMSNc5qQsfRh2ipHK+953vItL4eBgPgzhVeH0hF7Z5CKFJzF
         OkidxC1b8ULHJkwD5Qr06U9KVUUYIGyFuNx0Qkr/XLuJQHel8xZQzXQtncb7leeFJmna
         KuRukHTVRoAHMQgoqV3Qi+IuQVGMdVw5zdo1VK6DpgNmt7Mpj2d991Doa4ceaUsbCibm
         UotF86LnSmuuaupWwgAd0p8ZRZWQPaz5xln9FKImbDSdSHFv74ED1LSXod6JH7TFWuSO
         CfisceeARYxYludS8AJnTZWU8wYIEKyHi+zlSY4LUs4ryKwZwnxhVvRqJz0YONWjYTpp
         hZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681911553; x=1684503553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QX0N3D0hQrUbD4jeZe1Gbsve/yRImx9bQlJw/URsiQg=;
        b=He2CJO7UVbzDAKX7Z44d8sTk+0WaAo7IhGdIBCHU/AiwbzNkZT4m90KUhNt4G4/VLB
         Htn9PqgBiX8Jk/MMB0RcLwsGu2xvMyUEiZCABMzrbY237kUP2+8SHaNidpirazczrFhA
         7id38x6aF0JY/NEDTwBI2jFCt8MiJCF3YBfxmmMbRN1c6dVrsgys45LsC6PVSrKjws4Z
         ogCMatDqWj5Q1N+yVsrXgjbfU6kwFjI1AfU0uKlCDAX5dRXdcu9Ybe6ivCOgP931BpG2
         Wkt3CoJzz7j1iN9Q/wy6Mwc2bFj0u8lb0NRl5GkevSEjBERS1xzqDpw/Ul/MQMaUrAMV
         Yi4g==
X-Gm-Message-State: AAQBX9eYnkdcF3l6iouHSnHMicEud2krYFvEAbYmtKzV0BnCP0bnkJQg
	CxWQL05Du6a/NSQa24/o6og=
X-Google-Smtp-Source: AKy350aPeBtJqKa95LeXOxot5gZMEtPdZ/2PMrQULjnztZGIWWEaLCDOIqY8snx0oTIMQT8W/tUG5Q==
X-Received: by 2002:ac2:5147:0:b0:4ec:8cad:3c39 with SMTP id q7-20020ac25147000000b004ec8cad3c39mr4028033lfd.61.1681911553119;
        Wed, 19 Apr 2023 06:39:13 -0700 (PDT)
Message-ID: <7934f6b1545f161f876755ed1ab7ce5364220a83.camel@gmail.com>
Subject: Re: [PATCH v4 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Apr 2023 16:39:12 +0300
In-Reply-To: <1cd40a12-7030-ec0d-dae7-e60132c2989c@suse.com>
References: <cover.1680882176.git.oleksii.kurochko@gmail.com>
	 <50ed83073ccb440fb651070de8b0abebd3888b43.1680882176.git.oleksii.kurochko@gmail.com>
	 <1cd40a12-7030-ec0d-dae7-e60132c2989c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Jan,

On Mon, 2023-04-17 at 13:50 +0200, Jan Beulich wrote:
> On 07.04.2023 17:48, Oleksii Kurochko wrote:
> > The idea was taken from xvisor but the following changes
> > were done:
> > * Use only a minimal part of the code enough to enable MMU
> > * rename {_}setup_initial_pagetables functions
> > * add an argument for setup_initial_mapping to have
> > =C2=A0 an opportunity to make set PTE flags.
> > * update setup_initial_pagetables function to map sections
> > =C2=A0 with correct PTE flags.
> > * Rewrite enable_mmu() to C.
> > * map linker addresses range to load addresses range without
> > =C2=A0 1:1 mapping. It will be 1:1 only in case when
> > =C2=A0 load_start_addr is equal to linker_start_addr.
> > * add safety checks such as:
> > =C2=A0 * Xen size is less than page size
> > =C2=A0 * linker addresses range doesn't overlap load addresses
> > =C2=A0=C2=A0=C2=A0 range
> > * Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
> > * change PTE_LEAF_DEFAULT to RW instead of RWX.
> > * Remove phys_offset as it is not used now
> > * Remove alignment=C2=A0 of {map, pa}_start &=3D XEN_PT_LEVEL_MAP_MASK(=
0);
> > =C2=A0 in=C2=A0 setup_inital_mapping() as they should be already aligne=
d.
> > =C2=A0 Make a check that {map_pa}_start are aligned.
> > * Remove clear_pagetables() as initial pagetables will be
> > =C2=A0 zeroed during bss initialization
> > * Remove __attribute__((section(".entry")) for
> > setup_initial_pagetables()
> > =C2=A0 as there is no such section in xen.lds.S
> > * Update the argument of pte_is_valid() to "const pte_t *p"
> > * Add check that Xen's load address is aligned at 4k boundary
> > * Refactor setup_initial_pagetables() so it is mapping linker
> > =C2=A0 address range to load address range. After setup needed
> > =C2=A0 permissions for specific section ( such as .text, .rodata, etc )
> > =C2=A0 otherwise RW permission will be set by default.
> > * Add function to check that requested SATP_MODE is supported
> >=20
> > Origin: git@github.com:xvisor/xvisor.git 9be2fdd7
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0 * use GB() macros instead of defining SZ_1G
> > =C2=A0 * hardcode XEN_VIRT_START and add comment (ADDRESS_SPACE_END + 1
> > - GB(1))
>=20
> Perhaps in a separate patch, may I ask that you add - like x86 and
> Arm
> have it - a block comment to config.h laying out virtual address
> space
> use? Knowing what is planned to be put where (even if just vaguely,
> i.e.
> keeping open the option of changing the layout) is likely going to
> help
> with figuring whether this is a good placement.
>=20
> Such a comment could then also be accompanied by mentioning that
> virtual address space really "wraps" at certain boundaries (due to
> the
> upper address bits simply being ignored). For an x86 person like me
> this is certainly unexpected / unusual behavior.
>=20
Sure, it makes sense. I'll add that to new version of the patch series.

> > =C2=A0 * remove unnecessary 'asm' word at the end of #error
> > =C2=A0 * encapsulate pte_t definition in a struct
> > =C2=A0 * rename addr_to_ppn() to ppn_to_paddr().
> > =C2=A0 * change type of paddr argument from const unsigned long to
> > paddr_t
> > =C2=A0 * pte_to_paddr() update prototype.
> > =C2=A0 * calculate size of Xen binary based on an amount of page tables
> > =C2=A0 * use unsgined int instead of 'uint32_t' instead of uint32_t as
> > =C2=A0=C2=A0=C2=A0 their use isn't warranted.
> > =C2=A0 * remove extern of bss_{start,end} as they aren't used in mm.c
> > anymore
> > =C2=A0 * fix code style
> > =C2=A0 * add argument for HANDLE_PGTBL macros instead of curr_lvl_num
> > variable
> > =C2=A0 * make enable_mmu() as noinline to prevent under link-time
> > optimization
> > =C2=A0=C2=A0=C2=A0 because of the nature of enable_mmu()
> > =C2=A0 * add function to check that SATP_MODE is supported.
> > =C2=A0 * update the commit message
> > =C2=A0 * update setup_initial_pagetables to set correct PTE flags in on=
e
> > pass
> > =C2=A0=C2=A0=C2=A0 instead of calling setup_pte_permissions after
> > setup_initial_pagetables()
> > =C2=A0=C2=A0=C2=A0 as setup_initial_pagetables() isn't used to change p=
ermission
> > flags.
> > ---
> > Changes in V3:
> > =C2=A0- update definition of pte_t structure to have a proper size of
> > pte_t
> > =C2=A0=C2=A0 in case of RV32.
> > =C2=A0- update asm/mm.h with new functions and remove unnecessary
> > 'extern'.
> > =C2=A0- remove LEVEL_* macros as only XEN_PT_LEVEL_* are enough.
> > =C2=A0- update paddr_to_pte() to receive permissions as an argument.
> > =C2=A0- add check that map_start & pa_start is properly aligned.
> > =C2=A0- move=C2=A0 defines PAGETABLE_ORDER, PAGETABLE_ENTRIES, PTE_PPN_=
SHIFT
> > to
> > =C2=A0=C2=A0 <asm/page-bits.h>
> > =C2=A0- Rename PTE_SHIFT to PTE_PPN_SHIFT
> > =C2=A0- refactor setup_initial_pagetables: map all LINK addresses to
> > LOAD addresses
> > =C2=A0=C2=A0 and after setup PTEs permission for sections; update check=
 that
> > linker
> > =C2=A0=C2=A0 and load addresses don't overlap.
> > =C2=A0- refactor setup_initial_mapping: allocate pagetable 'dynamically=
'
> > if it is
> > =C2=A0=C2=A0 necessary.
> > =C2=A0- rewrite enable_mmu in C; add the check that map_start and
> > pa_start are
> > =C2=A0=C2=A0 aligned on 4k boundary.
> > =C2=A0- update the comment for setup_initial_pagetable funcion
> > =C2=A0- Add RV_STAGE1_MODE to support different MMU modes
> > =C2=A0- set XEN_VIRT_START very high to not overlap with load address
> > range
> > =C2=A0- align bss section
> > ---
> > Changes in V2:
> > =C2=A0* update the commit message:
> > =C2=A0* Remove {ZEROETH,FIRST,...}_{SHIFT,MASK, SIZE,...} and
> > =C2=A0=C2=A0 introduce instead of them XEN_PT_LEVEL_*() and LEVEL_*
> > =C2=A0* Rework pt_linear_offset() and pt_index based on=C2=A0
> > XEN_PT_LEVEL_*()
> > =C2=A0* Remove clear_pagetables() functions as pagetables were zeroed
> > during
> > =C2=A0=C2=A0 .bss initialization
> > =C2=A0* Rename _setup_initial_pagetables() to setup_initial_mapping()
> > =C2=A0* Make PTE_DEFAULT equal to RX.
> > =C2=A0* Update prototype of setup_initial_mapping(..., bool writable) -=
>
> > =C2=A0=C2=A0 setup_initial_mapping(..., UL flags)=C2=A0=20
> > =C2=A0* Update calls of setup_initial_mapping according to new prototyp=
e
> > =C2=A0* Remove unnecessary call of:
> > =C2=A0=C2=A0 _setup_initial_pagetables(..., load_addr_start, load_addr_=
end,
> > load_addr_start, ...)
> > =C2=A0* Define index* in the loop of setup_initial_mapping
> > =C2=A0* Remove attribute "__attribute__((section(".entry")))" for
> > setup_initial_pagetables()
> > =C2=A0=C2=A0 as we don't have such section
> > =C2=A0* make arguments of paddr_to_pte() and pte_is_valid() as const.
> > =C2=A0* make xen_second_pagetable static.
> > =C2=A0* use <xen/kernel.h> instead of declaring extern unsigned long
> > _stext, 0etext, _srodata, _erodata
> > =C2=A0* update=C2=A0 'extern unsigned long __init_begin' to 'extern uns=
igned
> > long __init_begin[]'
> > =C2=A0* use aligned() instead of
> > "__attribute__((__aligned__(PAGE_SIZE)))"
> > =C2=A0* set __section(".bss.page_aligned") for page tables arrays
> > =C2=A0* fix identatations
> > =C2=A0* Change '__attribute__((section(".entry")))' to '__init'
> > =C2=A0* Remove phys_offset as it isn't used now.
> > =C2=A0* Remove alignment=C2=A0 of {map, pa}_start &=3D
> > XEN_PT_LEVEL_MAP_MASK(0); in
> > =C2=A0=C2=A0 setup_inital_mapping() as they should be already aligned.
> > =C2=A0* Remove clear_pagetables() as initial pagetables will be
> > =C2=A0=C2=A0 zeroed during bss initialization
> > =C2=A0* Remove __attribute__((section(".entry")) for
> > setup_initial_pagetables()
> > =C2=A0=C2=A0 as there is no such section in xen.lds.S
> > =C2=A0* Update the argument of pte_is_valid() to "const pte_t *p"
> > ---
> >=20
> > =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0xen/arch/riscv/include/asm/config.h=C2=A0=C2=A0=C2=A0 |=C2=A0 12 =
+-
> > =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 9 +
> > =C2=A0xen/arch/riscv/include/asm/page-bits.h |=C2=A0 10 +
> > =C2=A0xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 65 +++++
> > =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 319
> > +++++++++++++++++++++++++
> > =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
> > =C2=A0xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A09 files changed, 432 insertions(+), 1 deletion(-)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/mm.h
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/page.h
> > =C2=A0create mode 100644 xen/arch/riscv/mm.c
> >=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 443f6bf15f..956ceb02df 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,5 +1,6 @@
> > =C2=A0obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> > =C2=A0obj-y +=3D entry.o
> > +obj-y +=3D mm.o
> > =C2=A0obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > =C2=A0obj-y +=3D sbi.o
> > =C2=A0obj-y +=3D setup.o
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index 763a922a04..0cf9673558 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -39,12 +39,22 @@
> > =C2=A0=C2=A0 name:
> > =C2=A0#endif
> > =C2=A0
> > -#define XEN_VIRT_START=C2=A0 _AT(UL, 0x80200000)
> > +#ifdef CONFIG_RISCV_64
> > +#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 -
> > GB(1)) */
> > +#else
> > +#error "RV32 isn't supported"
> > +#endif
> > =C2=A0
> > =C2=A0#define SMP_CACHE_BYTES (1 << 6)
> > =C2=A0
> > =C2=A0#define STACK_SIZE PAGE_SIZE
> > =C2=A0
> > +#ifdef CONFIG_RISCV_64
> > +#define RV_STAGE1_MODE SATP_MODE_SV39
> > +#else
> > +#define RV_STAGE1_MODE SATP_MODE_SV32
> > +#endif
> > +
> > =C2=A0#endif /* __RISCV_CONFIG_H__ */
> > =C2=A0/*
> > =C2=A0 * Local variables:
> > diff --git a/xen/arch/riscv/include/asm/mm.h
> > b/xen/arch/riscv/include/asm/mm.h
> > new file mode 100644
> > index 0000000000..e16ce66fae
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -0,0 +1,9 @@
> > +#ifndef _ASM_RISCV_MM_H
> > +#define _ASM_RISCV_MM_H
> > +
> > +void setup_initial_pagetables(void);
> > +
> > +void enable_mmu(void);
> > +void cont_after_mmu_is_enabled(void);
> > +
> > +#endif /* _ASM_RISCV_MM_H */
> > diff --git a/xen/arch/riscv/include/asm/page-bits.h
> > b/xen/arch/riscv/include/asm/page-bits.h
> > index 1801820294..0879a527f2 100644
> > --- a/xen/arch/riscv/include/asm/page-bits.h
> > +++ b/xen/arch/riscv/include/asm/page-bits.h
> > @@ -1,6 +1,16 @@
> > =C2=A0#ifndef __RISCV_PAGE_BITS_H__
> > =C2=A0#define __RISCV_PAGE_BITS_H__
> > =C2=A0
> > +#ifdef CONFIG_RISCV_64
> > +#define PAGETABLE_ORDER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (9)
> > +#else /* CONFIG_RISCV_32 */
> > +#define PAGETABLE_ORDER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (10)
> > +#endif
> > +
> > +#define PAGETABLE_ENTRIES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << PA=
GETABLE_ORDER)
> > +
> > +#define PTE_PPN_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 10
> > +
> > =C2=A0#define PAGE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12 /* 4 KiB Pages */
> > =C2=A0#define PADDR_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 56 /* 44-bit PPN */
> > =C2=A0
> > diff --git a/xen/arch/riscv/include/asm/page.h
> > b/xen/arch/riscv/include/asm/page.h
> > new file mode 100644
> > index 0000000000..30406aa614
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -0,0 +1,65 @@
> > +#ifndef _ASM_RISCV_PAGE_H
> > +#define _ASM_RISCV_PAGE_H
> > +
> > +#include <xen/const.h>
> > +#include <xen/types.h>
> > +
> > +#define VPN_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((unsigned
> > long)(PAGETABLE_ENTRIES - 1))
> > +
> > +#define XEN_PT_LEVEL_ORDER(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 ((lvl) * PAGET=
ABLE_ORDER)
> > +#define XEN_PT_LEVEL_SHIFT(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 (XEN_PT_LEVEL_=
ORDER(lvl) +
> > PAGE_SHIFT)
> > +#define XEN_PT_LEVEL_SIZE(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_AT(padd=
r_t, 1) <<
> > XEN_PT_LEVEL_SHIFT(lvl))
> > +#define XEN_PT_LEVEL_MAP_MASK(lvl)=C2=A0 (~(XEN_PT_LEVEL_SIZE(lvl) -
> > 1))
> > +#define XEN_PT_LEVEL_MASK(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (VPN_MASK=
 <<
> > XEN_PT_LEVEL_SHIFT(lvl))
> > +
> > +#define PTE_VALID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0, UL)
> > +#define PTE_READABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1, UL)
> > +#define PTE_WRITABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2, UL)
> > +#define PTE_EXECUTABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3, UL)
> > +#define PTE_USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4, UL)
> > +#define PTE_GLOBAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(5, UL)
> > +#define PTE_ACCESSED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(6, UL)
> > +#define PTE_DIRTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(7, UL)
> > +#define PTE_RSW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (BIT(8, =
UL) | BIT(9, UL))
> > +
> > +#define PTE_LEAF_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> > PTE_WRITABLE)
> > +#define PTE_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID)
> > +
> > +/* Calculate the offsets into the pagetables for a given VA */
> > +#define pt_linear_offset(lvl, va)=C2=A0=C2=A0 ((va) >>
> > XEN_PT_LEVEL_SHIFT(lvl))
> > +
> > +#define pt_index(lvl, va) pt_linear_offset(lvl, (va) &
> > XEN_PT_LEVEL_MASK(lvl))
> > +
> > +/* Page Table entry */
> > +typedef struct {
> > +#ifdef CONFIG_RISCV_64
> > +uint64_t pte;
> > +#else
> > +uint32_t pte;
> > +#endif
> > +} pte_t;
>=20
> Please indent both field declarations accordingly.
>=20
> > +#define addr_to_pte(x) (((x) >> PTE_PPN_SHIFT) << PAGE_SHIFT)
>=20
> This still looks to be converting _to_ an address, not to PTE layout,
> ...
>=20
> > +/* Shift the VPN[x] or PPN[x] fields of a virtual or physical
> > address
> > + * to become the shifted PPN[x] fields of a page table entry */
> > +#define ppn_to_paddr(x) (((x) >> PAGE_SHIFT) << PTE_PPN_SHIFT)
>=20
> ... while this converts an address (not a ppn) to PTE layout (not a
> paddr). Getting the names of these helpers right is crucial for easy
> following of any code using them. To be honest, I'll stop reviewing
> here, because the names being wrong is just going to be too
> confusing.
You are right the names are confusing and should be renamed.
Thanks.

~ Oleksii


