Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8A989CDE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807126.1218386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBt0-0005GA-9Y; Mon, 30 Sep 2024 08:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807126.1218386; Mon, 30 Sep 2024 08:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBt0-0005DS-5u; Mon, 30 Sep 2024 08:36:06 +0000
Received: by outflank-mailman (input) for mailman id 807126;
 Mon, 30 Sep 2024 08:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svBsy-0005DM-Va
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:36:05 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067bdcfe-7f07-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 10:36:02 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5398e58ceebso1331351e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:36:02 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5389fcd17cesm1169310e87.0.2024.09.30.01.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 01:36:00 -0700 (PDT)
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
X-Inumbo-ID: 067bdcfe-7f07-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727685361; x=1728290161; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sp7poEAYrJLEEHex3Yy0eGdRtvdjXpaOkKq0wWBEji0=;
        b=C7+A3Cf5khCTATYomtNQQ4wZB6WMCMaRqviCPXtOhrtlKjasujZji/oYFwVOCx5H0k
         QXM0Lauv4T3QlxdQWNwI4Dc92Z4ze8M68t+GAu6Bpd33ZlxDpWalf4HBLryGnjVXmr3A
         FMS3uiyvRxx0vAiTz+krQ+VpdAQRm3MyEvx/DA9GATr+Nng6JNJbbg6nbB4fTOnbfCnp
         w0OhHDsFq/dOL7Vvp4DWmwRZpfFfCFCaZIPD04Uaw1vTzdPKH/5/hladPpv+zBiQsuOW
         La5oueeinmzX8f5NfZGDAIIMnjHHKXYc/Ut+ZY4UpzS+fdzdjCzCgNPmdV4vHlHK6sLM
         odNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685361; x=1728290161;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sp7poEAYrJLEEHex3Yy0eGdRtvdjXpaOkKq0wWBEji0=;
        b=XXNDY4wvlXvvZlCGXORLF+g5PjaO9urZYPQzGgWcYdjBZNbHcCPmPhcdhHJ9AV+NSF
         33YZv76DZKDsufjued9f4rZ2a5IUXl6eMSA2jx5UxLniEbLb2dwyCwYA0/hUTwvh6AH3
         Oe5CQRLolg+gKc3AIWhIvQi2VYa0dP4b5nI/9GX4SmGnL5RNJDfc0YJe5VgS39Gurq4w
         VxxZQTBzfc/+AweyD/YNB3oIz585sZjjsXCVhmeVuICKiKl7ubxJlYQZclysl/zZYLt2
         jVOFsJaZqVKMS+TQWUTNU6vwCI+rBer/0mNJ2V21MqvaFX53D0FZcZU5pboWvDvS1IlN
         SZHA==
X-Gm-Message-State: AOJu0YzvvrHC/c8Wo5RFoRUkD3svXvRmCpPj9YrvcU/MRL8HKnP+tCnh
	/OPcxqrokSjLnEzT0ULg7UcXTGPvVqbTZiXwCZuNCLBAV7yLQ4lo8Rzqmg==
X-Google-Smtp-Source: AGHT+IGyx0SVZnMz3e0aIAyE1Tsqj7h9OUjRX7T+pSCWrb0cF53vsABV+pQd/JZJsL7mze/9v9Mdmg==
X-Received: by 2002:a05:6512:224a:b0:536:7ba7:496d with SMTP id 2adb3069b0e04-5389eee07e9mr4006314e87.11.1727685360527;
        Mon, 30 Sep 2024 01:36:00 -0700 (PDT)
Message-ID: <9c25f63ab5c4d726c40969ddb5c19edc44564d7d.camel@gmail.com>
Subject: Re: [PATCH v8 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Mon, 30 Sep 2024 10:35:59 +0200
In-Reply-To: <ead52f68ce47d55a78e2062aa4ef4d8675258091.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
	 <ead52f68ce47d55a78e2062aa4ef4d8675258091.1727449154.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Missed to add revision log:

---
Changes in V8:
 - drop PTE_LEAF_MASK.
 - update the comment above pte_is_table(): drop table number and use
   just "the encoding of the permission bits".
 - declare pte_is_table() as static.
 - drop const from the argument of pte_is_table
 - drop the "const" comment before the argument of pte_is_mapping().
 - update the comment above ASSERT() in pte_is_mapping() to : See
pte_is_table().
 - drop "const" from the return type of get_root_page().
 - update the comment above "pt_check_entry()".
 - start the comment with capital letter.
 - update the way how PTE_ACCESS_MASK bits are cleared before being
updated by
   the value in flags.
 - use dprintk() instead of printk() in riscv/pt.c
 - introduce XEN_TABLE_MAP_NONE and XEN_TABLE_MAP_NOMEM instead of
XEN_TABLE_MAP_FAILED
   and correspondingly update part of the code of pt_next_level()'s
return value
   handling in pt_update_entry.
 - update type of virt to vaddr_t for pt_update_entry()
---
Changes in V7:
 - rename PTE_XWV_BITS to PTE_LEAF_MASK.
 - drop PTE_XWV_MASK, PTE_RWX_MASK.
 - introduce PTE_ACCESS_MASK.
 - update the ASSERT and the comment about it in pte_is_mapping().
 - add the same ASSERT as in pte_is_mapping() to pte_is_table().
 - update the comment above pte_is_table().
 - use PTE_ACCESS_MASK inside pte_is_{table,mapping} instead of
encoding
   access bit explicitly.
 - define SATP_PPN_MASK using SATP{32,64}_PPN.
 - drop inclusion of #include <xen/mm-frame.h> in riscv/pt.c as
xen/mm.h is
   included.
 - use pfn_to_paddr() in get_root_page() instead of open-coding of
pfn_to_paddr().
 - update if the comment and the if (...) in pt_update_entry() above
the check
   in case of pt_next_level() returns XEN_TABLE_MAP_FAILED.
 - update the the comment above pt_update(): drop unecessary mentioning
of INVALID_MFN
   and blanks inside parentheses.
 - drop "full stops" in printk().
 - correct the condition in ASSERT() in map_pages_to_xen().
 - clear permission bits before updating the permissions in
pt_update_entry().
---
Changes in V6:
 - update the commit message.
 - correct the comment above flush_tlb_range_va().
 - add PTE_READABLE to the check of pte.rwx permissions in
   pte_is_mapping().
 - s/printk/dprintk in pt_check_entry().
 - drop unnecessary ASSERTS() in pt_check_entry().
 - drop checking of PTE_VALID flags in /* Sanity check when removing
   a mapping */ because of the earlier check.
 - drop ASSERT(flags & PTE_POPULATE) in /* Sanity check when populating
the page-table */
   section as in the earlier if it is checked.
 - pt_next_level() changes:
   - invert if ( alloc_tbl ) condition.
   - drop local variable ret.
 - pt_update_entry() changes:
   - invert definition of alloc_tbl.
   - update the comment inside "if ( rc =3D=3D XEN_TABLE_MAP_FAILED )".
   - drop else for mentioned above if (...).
   - clear some PTE flags before update.
 - s/xen_pt_lock/pt_lock
 - use PFN_DOWN() for vfn variable definition in pt_update().
 - drop definition of PTE_{R,W,X}_MASK.
 - introduce PTE_XWV_BITS and PTE_XWV_MASK() for convenience and use
them in if (...)
   in pt_update().
 - update the comment above pt_update().
 - change memset(&pte, 0x00, sizeof(pte)) to pte.pte =3D 0.
 - add the comment above pte_is_table().
 - add ASSERT in pte_is_mapping() to check the cases which are reserved
for future
   use.
---
Changes in V5:
 - s/xen_{un}map/{un}map
 - introduce PTE_SMALL instead of PTE_BLOCK.
 - update the comment above defintion of PTE_4K_PAGES.
 - code style fixes.
 - s/RV_STAGE1_MODE > SATP_MODE_SV48/RV_STAGE1_MODE > SATP_MODE_SV39
around
   DECLARE_OFFSETS macros.
 - change type of root_maddr from unsgined long to maddr_t.
 - drop duplicated check ( if (rc) break ) in pt_update() inside while
cycle.
 - s/1U/1UL
 - put 'spin_unlock(&xen_pt_lock);' ahead of TLB flush in pt_update().
 - update the commit message.
 - update the comment above ASSERT() in map_pages_to_xen() and also
update
   the check within ASSERT() to check that flags has PTE_VALID bit set.
 - update the comment above pt_update() function.
 - add the comment inside pt_check_entry().
 - update the TLB flushing region in pt_update().
 - s/alloc_only/alloc_tbl
---
Changes in V4:
 - update the commit message.
 - drop xen_ prefix for functions: xen_pt_update(),
xen_pt_mapping_level(),
   xen_pt_update_entry(), xen_pt_next_level(), xen_pt_check_entry().
 - drop 'select GENERIC_PT' for CONFIG_RISCV. There is no GENERIC_PT
anymore.
 - update implementation of flush_xen_tlb_range_va and
s/flush_xen_tlb_range_va/flush_tlb_range_va
 - s/pte_get_mfn/mfn_from_pte. Others similar definitions I decided not
to touch as
   they were introduced before and this patter of naming such type of
macros will be applied
   for newly introduced macros.
 - drop _PAGE_* definitions and use analogues of PTE_*.
 - introduce PTE_{W,X,R}_MASK and drop PAGE_{XN,W,X}_MASK. Also drop
_PAGE_{*}_BIT
 - introduce PAGE_HYPERVISOR_RX.
 - drop unused now l3_table_offset.
 - drop struct pt_t as it was used only for one function. If it will be
needed in the future
   pt_t will be re-introduced.
 - code styles fixes in pte_is_table(). drop level argument from t.
 - update implementation and prototype of pte_is_mapping().
 - drop level argument from pt_next_level().
 - introduce definition of SATP_PPN_MASK.
 - isolate PPN of CSR_SATP before shift by PAGE_SHIFT.
 - drop set_permission() functions as it is not used more then once.
 - update prototype of pt_check_entry(): drop level argument as it is
not used.
 - pt_check_entry():
   - code style fixes
   - update the sanity check when modifying an entry
   - update the sanity check when when removing a mapping.
 - s/read_only/alloc_only.
 - code style fixes for pt_next_level().
 - pt_update_entry() changes:
   - drop arch_level variable inisde pt_update_entry()
   - drop convertion near virt to paddr_t in DECLARE_OFFSETS(offsets,
virt);
   - pull out "goto out inside first 'for' cycle.
   - drop braces for 'if' cases which has only one line.
   - ident 'out' label with one blank.
   - update the comment above alloc_only and also definition to take
into
     account  that if pte population was requested or not.
   - drop target variable and rename arch_target argument of the
function to
     target.
 - pt_mapping_level() changes:
   - move the check if PTE_BLOCK should be mapped on the top of the
function.
   - change int i to unsigned int and update 'for' cycle
correspondingly.
 - update prototye of pt_update():
   - drop the comment  above nr_mfns and drop const to be consistent
with other
     arguments.
   - always flush TLB at the end of the function as non-present entries
can be put
     in the TLB.
   - add fence before TLB flush to ensure that PTEs are all updated
before flushing.
 - s/XEN_TABLE_NORMAL_PAGE/XEN_TABLE_NORMAL
 - add a check in map_pages_to_xen() the mfn is not INVALID_MFN.
 - add the comment on top of pt_update() how mfn =3D INVALID_MFN is
considered.
 - s/_PAGE_BLOCK/PTE_BLOCK.
 - add the comment with additional explanation for PTE_BLOCK.
 - drop defintion of FIRST_SIZE as it isn't used.
---
Changes in V3:
 - new patch. ( Technically it is reworked version of the generic
approach
   which I tried to suggest in the previous version )
---

~ Oleksii

On Fri, 2024-09-27 at 18:33 +0200, Oleksii Kurochko wrote:
> Implement map_pages_to_xen() which requires several
> functions to manage page tables and entries:
> - pt_update()
> - pt_mapping_level()
> - pt_update_entry()
> - pt_next_level()
> - pt_check_entry()
>=20
> To support these operations, add functions for creating,
> mapping, and unmapping Xen tables:
> - create_table()
> - map_table()
> - unmap_table()
>=20
> Introduce PTE_SMALL to indicate that 4KB mapping is needed
> and PTE_POPULATE.
>=20
> In addition introduce flush_tlb_range_va() for TLB flushing across
> CPUs after updating the PTE for the requested mapping.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0xen/arch/riscv/include/asm/flushtlb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 9 +
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 80 ++++
> =C2=A0xen/arch/riscv/include/asm/riscv_encoding.h |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 -
> =C2=A0xen/arch/riscv/pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 421
> ++++++++++++++++++++
> =C2=A07 files changed, 515 insertions(+), 9 deletions(-)
> =C2=A0create mode 100644 xen/arch/riscv/pt.c
>=20
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 6832549133..a5eb2aed4b 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,6 +1,7 @@
> =C2=A0obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> =C2=A0obj-y +=3D entry.o
> =C2=A0obj-y +=3D mm.o
> +obj-y +=3D pt.o
> =C2=A0obj-$(CONFIG_RISCV_64) +=3D riscv64/
> =C2=A0obj-y +=3D sbi.o
> =C2=A0obj-y +=3D setup.o
> diff --git a/xen/arch/riscv/include/asm/flushtlb.h
> b/xen/arch/riscv/include/asm/flushtlb.h
> index f4a735fd6c..43214f5e95 100644
> --- a/xen/arch/riscv/include/asm/flushtlb.h
> +++ b/xen/arch/riscv/include/asm/flushtlb.h
> @@ -5,12 +5,21 @@
> =C2=A0#include <xen/bug.h>
> =C2=A0#include <xen/cpumask.h>
> =C2=A0
> +#include <asm/sbi.h>
> +
> =C2=A0/* Flush TLB of local processor for address va. */
> =C2=A0static inline void flush_tlb_one_local(vaddr_t va)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ( "sfence.vma %0" :: "r" (va) : "me=
mory" );
> =C2=A0}
> =C2=A0
> +/* Flush a range of VA's hypervisor mappings from the TLB of all
> processors. */
> +static inline void flush_tlb_range_va(vaddr_t va, size_t size)
> +{
> +=C2=A0=C2=A0=C2=A0 BUG_ON(!sbi_has_rfence());
> +=C2=A0=C2=A0=C2=A0 sbi_remote_sfence_vma(NULL, va, size);
> +}
> +
> =C2=A0/*
> =C2=A0 * Filter the given set of CPUs, removing those that definitely
> flushed their
> =C2=A0 * TLB since @page_timestamp.
> diff --git a/xen/arch/riscv/include/asm/mm.h
> b/xen/arch/riscv/include/asm/mm.h
> index a0bdc2bc3a..ce1557bb27 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -42,6 +42,8 @@ static inline void *maddr_to_virt(paddr_t ma)
> =C2=A0#define virt_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 __virt_to_mfn(va)
> =C2=A0#define mfn_to_virt(mfn)=C2=A0=C2=A0=C2=A0 __mfn_to_virt(mfn)
> =C2=A0
> +#define mfn_from_pte(pte) maddr_to_mfn(pte_to_paddr(pte))
> +
> =C2=A0struct page_info
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Each frame can be threaded onto a doubly-link=
ed list. */
> diff --git a/xen/arch/riscv/include/asm/page.h
> b/xen/arch/riscv/include/asm/page.h
> index eb79cb9409..89fa290697 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -21,6 +21,11 @@
> =C2=A0#define XEN_PT_LEVEL_MAP_MASK(lvl)=C2=A0 (~(XEN_PT_LEVEL_SIZE(lvl) =
- 1))
> =C2=A0#define XEN_PT_LEVEL_MASK(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (VPN_M=
ASK <<
> XEN_PT_LEVEL_SHIFT(lvl))
> =C2=A0
> +/*
> + * PTE format:
> + * | XLEN-1=C2=A0 10 | 9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reserved for SW=C2=A0=C2=A0 D=C2=A0=C2=A0 A=C2=A0=C2=A0 G=C2=A0=C2=A0 U=C2=
=A0=C2=A0 X=C2=A0=C2=A0 W=C2=A0=C2=A0 R=C2=A0=C2=A0 V
> + */
> =C2=A0#define PTE_VALID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0, UL)
> =C2=A0#define PTE_READABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1, UL)
> =C2=A0#define PTE_WRITABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2, UL)
> @@ -34,15 +39,49 @@
> =C2=A0#define PTE_LEAF_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> PTE_WRITABLE)
> =C2=A0#define PTE_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID)
> =C2=A0
> +#define PAGE_HYPERVISOR_RO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (PTE_VALID | PTE_READABLE)
> =C2=A0#define PAGE_HYPERVISOR_RW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> PTE_WRITABLE)
> +#define PAGE_HYPERVISOR_RX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> PTE_EXECUTABLE)
> =C2=A0
> =C2=A0#define PAGE_HYPERVISOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_HYPERVISOR_RW
> =C2=A0
> +/*
> + * The PTE format does not contain the following bits within itself;
> + * they are created artificially to inform the Xen page table
> + * handling algorithm. These bits should not be explicitly written
> + * to the PTE entry.
> + */
> +#define PTE_SMALL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(10, UL)
> +#define PTE_POPULATE=C2=A0=C2=A0=C2=A0 BIT(11, UL)
> +
> +#define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE |
> PTE_EXECUTABLE)
> +
> =C2=A0/* Calculate the offsets into the pagetables for a given VA */
> =C2=A0#define pt_linear_offset(lvl, va)=C2=A0=C2=A0 ((va) >>
> XEN_PT_LEVEL_SHIFT(lvl))
> =C2=A0
> =C2=A0#define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) & VPN_MASK=
)
> =C2=A0
> +#define PAGETABLE_ORDER_MASK ((_AC(1, U) << PAGETABLE_ORDER) - 1)
> +#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) &
> PAGETABLE_ORDER_MASK)
> +
> +#if RV_STAGE1_MODE > SATP_MODE_SV39
> +#error "need to to update DECLARE_OFFSETS macros"
> +#else
> +
> +#define l0_table_offset(va) TABLE_OFFSET(pt_linear_offset(0, va))
> +#define l1_table_offset(va) TABLE_OFFSET(pt_linear_offset(1, va))
> +#define l2_table_offset(va) TABLE_OFFSET(pt_linear_offset(2, va))
> +
> +/* Generate an array @var containing the offset for each level from
> @addr */
> +#define DECLARE_OFFSETS(var, addr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 const unsigned int var[] =3D {=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l0_table_offset(addr),=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l1_table_offset(addr),=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l2_table_offset(addr),=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 }
> +
> +#endif
> +
> =C2=A0/* Page Table entry */
> =C2=A0typedef struct {
> =C2=A0#ifdef CONFIG_RISCV_64
> @@ -68,6 +107,47 @@ static inline bool pte_is_valid(pte_t p)
> =C2=A0=C2=A0=C2=A0=C2=A0 return p.pte & PTE_VALID;
> =C2=A0}
> =C2=A0
> +/*
> + * From the RISC-V spec:
> + *=C2=A0=C2=A0 The V bit indicates whether the PTE is valid; if it is 0,=
 all
> other bits
> + *=C2=A0=C2=A0 in the PTE are don=E2=80=99t-cares and may be used freely=
 by software.
> + *
> + *=C2=A0=C2=A0 If V=3D1 the encoding of PTE R/W/X bits could be find in =
"the
> encoding
> + *=C2=A0=C2=A0 of the permission bits" table.
> + *
> + *=C2=A0=C2=A0 The encoding of the permission bits table:
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X W R Meaning
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0 0 Pointer to next level of page tab=
le.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0 1 Read-only page.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 1 0 Reserved for future use.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 1 1 Read-write page.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 0 0 Execute-only page.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 0 1 Read-execute page.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 0 Reserved for future use.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 1 Read-write-execute page.
> + */
> +static inline bool pte_is_table(pte_t p)
> +{
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * According to the spec if V=3D1 and W=3D1 then=
 R also needs to be
> 1 as
> +=C2=A0=C2=A0=C2=A0=C2=A0 * R =3D 0 is reserved for future use ( look at =
the Table 4.5 ) so
> check
> +=C2=A0=C2=A0=C2=A0=C2=A0 * in ASSERT that if (V=3D=3D1 && W=3D=3D1) then=
 R isn't 0.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * PAGE_HYPERVISOR_RW contains PTE_VALID too.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 ASSERT(((p.pte & PAGE_HYPERVISOR_RW) !=3D (PTE_VALID =
|
> PTE_WRITABLE)));
> +
> +=C2=A0=C2=A0=C2=A0 return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) =3D=
=3D PTE_VALID);
> +}
> +
> +static inline bool pte_is_mapping(pte_t p)
> +{
> +=C2=A0=C2=A0=C2=A0 /* See pte_is_table() */
> +=C2=A0=C2=A0=C2=A0 ASSERT(((p.pte & PAGE_HYPERVISOR_RW) !=3D (PTE_VALID =
|
> PTE_WRITABLE)));
> +
> +=C2=A0=C2=A0=C2=A0 return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MAS=
K);
> +}
> +
> =C2=A0static inline void invalidate_icache(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h
> b/xen/arch/riscv/include/asm/riscv_encoding.h
> index 58abe5eccc..e31e94e77e 100644
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -164,6 +164,7 @@
> =C2=A0#define SSTATUS_SD			SSTATUS64_SD
> =C2=A0#define SATP_MODE			SATP64_MODE
> =C2=A0#define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
> +#define SATP_PPN_MASK			SATP64_PPN
> =C2=A0
> =C2=A0#define HGATP_PPN			HGATP64_PPN
> =C2=A0#define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
> @@ -174,6 +175,7 @@
> =C2=A0#define SSTATUS_SD			SSTATUS32_SD
> =C2=A0#define SATP_MODE			SATP32_MODE
> =C2=A0#define SATP_MODE_SHIFT			SATP32_MODE_SHIFT
> +#define SATP_PPN_MASK			SATP32_PPN
> =C2=A0
> =C2=A0#define HGATP_PPN			HGATP32_PPN
> =C2=A0#define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index b8ff91cf4e..e8430def14 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -369,12 +369,3 @@ int destroy_xen_mappings(unsigned long s,
> unsigned long e)
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> =C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> =C2=A0}
> -
> -int map_pages_to_xen(unsigned long virt,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> -{
> -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> -=C2=A0=C2=A0=C2=A0 return -1;
> -}
> diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
> new file mode 100644
> index 0000000000..a5552a4871
> --- /dev/null
> +++ b/xen/arch/riscv/pt.c
> @@ -0,0 +1,421 @@
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/pmap.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/flushtlb.h>
> +#include <asm/page.h>
> +
> +static inline mfn_t get_root_page(void)
> +{
> +=C2=A0=C2=A0=C2=A0 paddr_t root_maddr =3D pfn_to_paddr(csr_read(CSR_SATP=
) &
> SATP_PPN_MASK);
> +
> +=C2=A0=C2=A0=C2=A0 return maddr_to_mfn(root_maddr);
> +}
> +
> +/*
> + * Sanity check a page table entry about to be updated as per an
> (MFN,flags)
> + * tuple.
> + * See the comment about the possible combination of (mfn, flags) in
> + * the comment above pt_update().
> + */
> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int
> flags)
> +{
> +=C2=A0=C2=A0=C2=A0 /* Sanity check when modifying an entry. */
> +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) =
)
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modifying a=
n invalid entry. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(entry) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprin=
tk(XENLOG_ERR, "Modifying invalid entry is not
> allowed\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n false;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modifying a=
 table entry */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_table(entry) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprin=
tk(XENLOG_ERR, "Modifying a table entry is not
> allowed\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n false;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 /* Sanity check when inserting a mapping */
> +=C2=A0=C2=A0=C2=A0 else if ( flags & PTE_VALID )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We don't allow replac=
ing any valid entry.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that the functio=
n pt_update() relies on this
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * assumption and will s=
kip the TLB flush (when Svvptc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * extension will be rat=
ified). The function will need
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to be updated if the =
check is relaxed.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_valid(entry) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( =
pte_is_mapping(entry) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR, "Changing MFN for valid PTE is
> not allowed (%#"PRI_mfn" -> %#"PRI_mfn")\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_x(mfn_from=
_pte(entry)), mfn_x(mfn));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR, "Trying to replace table with
> mapping\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n false;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 /* Sanity check when removing a mapping. */
> +=C2=A0=C2=A0=C2=A0 else if ( !(flags & PTE_POPULATE) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We should be here with an =
invalid MFN. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(mfn_eq(mfn, INVALID_MF=
N));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow removing a =
table */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_table(entry) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprin=
tk(XENLOG_ERR, "Removing a table is not
> allowed\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n false;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 /* Sanity check when populating the page-table. No ch=
eck so far.
> */
> +=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We should be here with an =
invalid MFN */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(mfn_eq(mfn, INVALID_MF=
N));
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return true;
> +}
> +
> +static pte_t *map_table(mfn_t mfn)
> +{
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * During early boot, map_domain_page() may be u=
nusable. Use the
> +=C2=A0=C2=A0=C2=A0=C2=A0 * PMAP to map temporarily a page-table.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if ( system_state =3D=3D SYS_STATE_early_boot )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return pmap_map(mfn);
> +
> +=C2=A0=C2=A0=C2=A0 return map_domain_page(mfn);
> +}
> +
> +static void unmap_table(const pte_t *table)
> +{
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * During early boot, map_table() will not use m=
ap_domain_page()
> +=C2=A0=C2=A0=C2=A0=C2=A0 * but the PMAP.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if ( system_state =3D=3D SYS_STATE_early_boot )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmap_unmap(table);
> +=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unmap_domain_page(table);
> +}
> +
> +static int create_table(pte_t *entry)
> +{
> +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> +=C2=A0=C2=A0=C2=A0 void *p;
> +=C2=A0=C2=A0=C2=A0 pte_t pte;
> +
> +=C2=A0=C2=A0=C2=A0 if ( system_state !=3D SYS_STATE_early_boot )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page_info *pg =3D allo=
c_domheap_page(NULL, 0);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pg =3D=3D NULL )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n -ENOMEM;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn =3D page_to_mfn(pg);
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn =3D alloc_boot_pages(1, 1=
);
> +
> +=C2=A0=C2=A0=C2=A0 p =3D map_table(mfn);
> +=C2=A0=C2=A0=C2=A0 clear_page(p);
> +=C2=A0=C2=A0=C2=A0 unmap_table(p);
> +
> +=C2=A0=C2=A0=C2=A0 pte =3D pte_from_mfn(mfn, PTE_TABLE);
> +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +#define XEN_TABLE_MAP_NONE 0
> +#define XEN_TABLE_MAP_NOMEM 1
> +#define XEN_TABLE_SUPER_PAGE 2
> +#define XEN_TABLE_NORMAL 3
> +
> +/*
> + * Take the currently mapped table, find the corresponding entry,
> + * and map the next table, if available.
> + *
> + * The alloc_tbl parameters indicates whether intermediate tables
> should
> + * be allocated when not present.
> + *
> + * Return values:
> + *=C2=A0 XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
> + *=C2=A0 was empty, or allocating a new page failed.
> + *=C2=A0 XEN_TABLE_NORMAL: next level or leaf mapped normally
> + *=C2=A0 XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
> + */
> +static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int
> offset)
> +{
> +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> +
> +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> +
> +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !alloc_tbl )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n XEN_TABLE_MAP_NONE;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( create_table(entry) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n XEN_TABLE_MAP_NOMEM;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if ( pte_is_mapping(*entry) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return XEN_TABLE_SUPER_PAGE;
> +
> +=C2=A0=C2=A0=C2=A0 mfn =3D mfn_from_pte(*entry);
> +
> +=C2=A0=C2=A0=C2=A0 unmap_table(*table);
> +=C2=A0=C2=A0=C2=A0 *table =3D map_table(mfn);
> +
> +=C2=A0=C2=A0=C2=A0 return XEN_TABLE_NORMAL;
> +}
> +
> +/* Update an entry at the level @target. */
> +static int pt_update_entry(mfn_t root, vaddr_t virt,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mfn_t mfn, unsigned int target,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned int flags)
> +{
> +=C2=A0=C2=A0=C2=A0 int rc;
> +=C2=A0=C2=A0=C2=A0 unsigned int level =3D HYP_PT_ROOT_LEVEL;
> +=C2=A0=C2=A0=C2=A0 pte_t *table;
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * The intermediate page table shouldn't be allo=
cated when MFN
> isn't
> +=C2=A0=C2=A0=C2=A0=C2=A0 * valid and we are not populating page table.
> +=C2=A0=C2=A0=C2=A0=C2=A0 * This means we either modify permissions or re=
move an entry,
> or
> +=C2=A0=C2=A0=C2=A0=C2=A0 * inserting brand new entry.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * See the comment above pt_update() for an addi=
tional
> explanation about
> +=C2=A0=C2=A0=C2=A0=C2=A0 * combinations of (mfn, flags).
> +=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 bool alloc_tbl =3D !mfn_eq(mfn, INVALID_MFN) || (flag=
s &
> PTE_POPULATE);
> +=C2=A0=C2=A0=C2=A0 pte_t pte, *entry;
> +
> +=C2=A0=C2=A0=C2=A0 /* convenience aliases */
> +=C2=A0=C2=A0=C2=A0 DECLARE_OFFSETS(offsets, virt);
> +
> +=C2=A0=C2=A0=C2=A0 table =3D map_table(root);
> +=C2=A0=C2=A0=C2=A0 for ( ; level > target; level-- )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pt_next_level(alloc_tb=
l, &table, offsets[level]);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc =3D=3D XEN_TABLE_MAP_=
NOMEM )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =
=3D -ENOMEM;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
out;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc =3D=3D XEN_TABLE_MAP_=
NONE )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =
=3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto =
out;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc !=3D XEN_TABLE_NORMAL=
 )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break=
;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if ( level !=3D target )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "%s: Shattering superpage is not supported\n",
> __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -EOPNOTSUPP;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 entry =3D table + offsets[level];
> +
> +=C2=A0=C2=A0=C2=A0 rc =3D -EINVAL;
> +=C2=A0=C2=A0=C2=A0 if ( !pt_check_entry(*entry, mfn, flags) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> +
> +=C2=A0=C2=A0=C2=A0 /* We are removing the page */
> +=C2=A0=C2=A0=C2=A0 if ( !(flags & PTE_VALID) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * There is also a check=
 in pt_check_entry() which check
> that
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mfn=3DINVALID_MFN
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte =3D 0;
> +=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We are inserting a mapping=
 =3D> Create new pte. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfn_eq(mfn, INVALID_MFN=
) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =
=3D pte_from_mfn(mfn, PTE_VALID);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else /* We are updating the p=
ermission =3D> Copy the current
> pte. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =
=3D *entry;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.p=
te &=3D ~PTE_ACCESS_MASK;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* update permission accordin=
g to the flags */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=3D (flags & PTE_ACC=
ESS_MASK) | PTE_ACCESSED |
> PTE_DIRTY;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> +
> +=C2=A0=C2=A0=C2=A0 rc =3D 0;
> +
> + out:
> +=C2=A0=C2=A0=C2=A0 unmap_table(table);
> +
> +=C2=A0=C2=A0=C2=A0 return rc;
> +}
> +
> +/* Return the level where mapping should be done */
> +static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned
> long nr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int flags)
> +{
> +=C2=A0=C2=A0=C2=A0 unsigned int level =3D 0;
> +=C2=A0=C2=A0=C2=A0 unsigned long mask;
> +=C2=A0=C2=A0=C2=A0 unsigned int i;
> +
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Use a larger mapping than 4K unless the calle=
r specifically
> requests
> +=C2=A0=C2=A0=C2=A0=C2=A0 * 4K mapping
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if ( unlikely(flags & PTE_SMALL) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return level;
> +
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Don't take into account the MFN when removing=
 mapping (i.e
> +=C2=A0=C2=A0=C2=A0=C2=A0 * MFN_INVALID) to calculate the correct target =
order.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * `vfn` and `mfn` must be both superpage aligne=
d.
> +=C2=A0=C2=A0=C2=A0=C2=A0 * They are or-ed together and then checked agai=
nst the size of
> +=C2=A0=C2=A0=C2=A0=C2=A0 * each level.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * `left` ( variable declared in pt_update() ) i=
s not included
> +=C2=A0=C2=A0=C2=A0=C2=A0 * and checked separately to allow superpage map=
ping even if it
> +=C2=A0=C2=A0=C2=A0=C2=A0 * is not properly aligned (the user may have as=
ked to map 2MB +
> 4k).
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 mask =3D !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
> +=C2=A0=C2=A0=C2=A0 mask |=3D vfn;
> +
> +=C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL; i !=3D 0; i-- )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !(mask & (BIT(XEN_PT_LEV=
EL_ORDER(i), UL) - 1)) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (nr >=3D BIT(XEN_PT_LEVEL_ORDER(i), UL)) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 level=
 =3D i;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return level;
> +}
> +
> +static DEFINE_SPINLOCK(pt_lock);
> +
> +/*
> + * If `mfn` equals `INVALID_MFN`, it indicates that the following
> page table
> + * update operation might be related to either:
> + *=C2=A0=C2=A0 - populating the table (PTE_POPULATE will be set addition=
aly),
> + *=C2=A0=C2=A0 - destroying a mapping (PTE_VALID=3D0),
> + *=C2=A0=C2=A0 - modifying an existing mapping (PTE_VALID=3D1).
> + *
> + * If `mfn` !=3D INVALID_MFN and flags has PTE_VALID bit set then it
> means that
> + * inserting will be done.
> + */
> +static int pt_update(vaddr_t virt, mfn_t mfn,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns, uns=
igned int flags)
> +{
> +=C2=A0=C2=A0=C2=A0 int rc =3D 0;
> +=C2=A0=C2=A0=C2=A0 unsigned long vfn =3D PFN_DOWN(virt);
> +=C2=A0=C2=A0=C2=A0 unsigned long left =3D nr_mfns;
> +=C2=A0=C2=A0=C2=A0 const mfn_t root =3D get_root_page();
> +
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * It is bad idea to have mapping both writeable=
 and
> +=C2=A0=C2=A0=C2=A0=C2=A0 * executable.
> +=C2=A0=C2=A0=C2=A0=C2=A0 * When modifying/creating mapping (i.e PTE_VALI=
D is set),
> +=C2=A0=C2=A0=C2=A0=C2=A0 * prevent any update if this happen.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && (flags & PTE_WRITABLE) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (flags & PTE_EXECUTABLE=
) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "Mappings should not be both Writeable and
> Executable\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if ( !IS_ALIGNED(virt, PAGE_SIZE) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "The virtual address is not aligned to the page-
> size\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 spin_lock(&pt_lock);
> +
> +=C2=A0=C2=A0=C2=A0 while ( left )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order, level;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 level =3D pt_mapping_level(vf=
n, mfn, left, flags);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D XEN_PT_LEVEL_ORDER(=
level);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(left >=3D BIT(order, U=
L));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pt_update_entry(root, =
vfn << PAGE_SHIFT, mfn, level,
> flags);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break=
;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfn +=3D 1UL << order;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfn_eq(mfn, INVALID_MFN=
) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn =
=3D mfn_add(mfn, 1UL << order);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 left -=3D (1UL << order);
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /* Ensure that PTEs are all updated before flushing *=
/
> +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> +
> +=C2=A0=C2=A0=C2=A0 spin_unlock(&pt_lock);
> +
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Always flush TLB at the end of the function a=
s non-present
> entries
> +=C2=A0=C2=A0=C2=A0=C2=A0 * can be put in the TLB.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * The remote fence operation applies to the ent=
ire address
> space if
> +=C2=A0=C2=A0=C2=A0=C2=A0 * either:
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 - start and size are both 0, or
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 - size is equal to 2^XLEN-1.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * TODO: come up with something which will allow=
 not to flash
> the entire
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address s=
pace.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 flush_tlb_range_va(0, 0);
> +
> +=C2=A0=C2=A0=C2=A0 return rc;
> +}
> +
> +int map_pages_to_xen(unsigned long virt,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> +{
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Ensure that flags has PTE_VALID bit as map_pa=
ges_to_xen() is
> supposed
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to create a mapping.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Ensure that we have a valid MFN before procee=
ding.
> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0 * If the MFN is invalid, pt_update() might misi=
nterpret the
> operation,
> +=C2=A0=C2=A0=C2=A0=C2=A0 * treating it as either a population, a mapping=
 destruction,
> +=C2=A0=C2=A0=C2=A0=C2=A0 * or a mapping modification.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 ASSERT(!mfn_eq(mfn, INVALID_MFN) && (flags & PTE_VALI=
D));
> +
> +=C2=A0=C2=A0=C2=A0 return pt_update(virt, mfn, nr_mfns, flags);
> +}


