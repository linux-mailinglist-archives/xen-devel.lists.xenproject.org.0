Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF081CD1C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 17:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659658.1029363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGiSE-0000Jg-Az; Fri, 22 Dec 2023 16:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659658.1029363; Fri, 22 Dec 2023 16:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGiSE-0000Gh-7Q; Fri, 22 Dec 2023 16:32:54 +0000
Received: by outflank-mailman (input) for mailman id 659658;
 Fri, 22 Dec 2023 16:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGiSD-0000Gb-D1
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 16:32:53 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe29324-a0e7-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 17:32:51 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e2d00f99cso2360347e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 08:32:51 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o17-20020ac24c51000000b0050e67a7ec9fsm288604lfk.144.2023.12.22.08.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 08:32:49 -0800 (PST)
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
X-Inumbo-ID: bfe29324-a0e7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703262770; x=1703867570; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DBGsffFZM5C4jvUXyCzocMM6KosqewTy0SI6Yddg4ao=;
        b=E9ws776fMDlgonjxxIlMjIJbIdTEmvC+kj4cF7+TrHRma3KTuB8TmkWL8E9G+5aTEi
         y2IOLwRRo7GmartqSI11yH7JC6e9vFKABP4qwrJ4FxeQZf33FKz1VN8xcM9p6U404yd+
         WggAhVmC1e3Asc+KuK9xvSZF9ab0cg48/C/TH9gK3HA5KlIwfABE/rX3olzM9pRVQIuy
         URp1wmtIxgdqGevZOrPMmxHEjO73uXvwrA9qJC3lBkLcDd4OMwr5y5vzro3UT+Yq7j85
         HD9iOfw2HXskYq7yy2Vb66b5qEKiTXaOEUNjTqzaNHfCZnqXXPIf2M8k3JR0pMCBcVMz
         QePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703262770; x=1703867570;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBGsffFZM5C4jvUXyCzocMM6KosqewTy0SI6Yddg4ao=;
        b=mlYE4Z+/NJO1kEb51QhPckwa6Kr+t9QDRvRRgqnGjDjKp4++VWE6AEJcvN6Fgr6Bej
         2UsKpzIo1etH/g79qdOxvS8bsdwMgP76d2ZSm18P5eUUc7plH6kqwO0sQVFVOmbniOKh
         aDj/ngcnv45diisCAso2QIVS897phRcqPEH6e1peoYunaigu+LeuK8zBc00Czbbzem5a
         4xXyHkvXBKy6CHeL/sVsrylZD5VJJjttsQmFWRPKPXAc8Qhq76d8GEoQ49jIuwtVZ+LD
         JwgzAmosydCkU7VLsXCmSOFB24godCqqz4pNqI5m8OByWb3MdtKJNR2/9VWDWn/iaFfP
         tAWA==
X-Gm-Message-State: AOJu0YxvgHMXDE6giRfP/Jwzy3Zsy2BVIwAELcKlhMuV4HdhpFxy/vXN
	y277FjvkgniWYShT3CHLKrPxRWUWCZA=
X-Google-Smtp-Source: AGHT+IGKbdyKvEjamKsJV7aBWD6h6rKJ216TCdAilVGdpwqq91bmtzRgzvd5/hMs7absMqrn4gP4Zg==
X-Received: by 2002:ac2:4e43:0:b0:50b:c57e:1418 with SMTP id f3-20020ac24e43000000b0050bc57e1418mr734079lfr.16.1703262770263;
        Fri, 22 Dec 2023 08:32:50 -0800 (PST)
Message-ID: <3231bf55d5da1d3e1eb03a43759932d8ebcca8de.camel@gmail.com>
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
Date: Fri, 22 Dec 2023 18:32:48 +0200
In-Reply-To: <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2023-12-22 at 17:13 +0200, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
> =C2=A0- update the commit message
> =C2=A0- introduce DIRECTMAP_VIRT_START.
> =C2=A0- drop changes related pfn_to_paddr() and paddr_to_pfn as they were
> remvoe in
> =C2=A0=C2=A0 [PATCH v2 32/39] xen/riscv: add minimal stuff to asm/page.h =
to
> build full Xen
> =C2=A0- code style fixes.
> =C2=A0- drop get_page_nr=C2=A0 and put_page_nr as they don't need for tim=
e
> being
> =C2=A0- drop CONFIG_STATIC_MEMORY related things
> =C2=A0- code style fixes
> ---
> Changes in V2:
> =C2=A0- define stub for arch_get_dma_bitsize(void)
> ---
> =C2=A0xen/arch/riscv/include/asm/config.h |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0 | 248
> ++++++++++++++++++++++++++++
> =C2=A02 files changed, 250 insertions(+)
>=20
> diff --git a/xen/arch/riscv/include/asm/config.h
> b/xen/arch/riscv/include/asm/config.h
> index fb9fc9daaa..400309f4ef 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -67,6 +67,8 @@
> =C2=A0
> =C2=A0#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 -
> GB(1)) */
> =C2=A0
> +#define DIRECTMAP_VIRT_START=C2=A0=C2=A0=C2=A0 SLOTN(200)
> +
> =C2=A0#define FRAMETABLE_VIRT_START=C2=A0=C2=A0 SLOTN(196)
> =C2=A0#define FRAMETABLE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GB(3)
> =C2=A0#define FRAMETABLE_NR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (FRAMETABLE_SIZE /
> sizeof(*frame_table))
> diff --git a/xen/arch/riscv/include/asm/mm.h
> b/xen/arch/riscv/include/asm/mm.h
> index 57026e134d..14fce72fde 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -3,8 +3,251 @@
> =C2=A0#ifndef _ASM_RISCV_MM_H
> =C2=A0#define _ASM_RISCV_MM_H
> =C2=A0
> +#include <public/xen.h>
> +#include <xen/pdx.h>
> +#include <xen/types.h>
> +
> +#include <asm/page.h>
> =C2=A0#include <asm/page-bits.h>
> =C2=A0
> +#define paddr_to_pdx(pa)=C2=A0=C2=A0=C2=A0 mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)=C2=A0=C2=A0 pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)=C2=A0=C2=A0=C2=A0 _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)=C2=A0=C2=A0 pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)=C2=A0=C2=A0=C2=A0 _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 maddr_to_mfn(virt_to_mad=
dr((vaddr_t)va))
> +#define vmap_to_page(va)=C2=A0=C2=A0=C2=A0 mfn_to_page(vmap_to_mfn(va))
> +#define paddr_to_pdx(pa)=C2=A0=C2=A0=C2=A0 mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)=C2=A0=C2=A0 pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)=C2=A0=C2=A0=C2=A0 _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)=C2=A0=C2=A0 pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)=C2=A0=C2=A0=C2=A0 _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 maddr_to_mfn(virt_to_mad=
dr((vaddr_t)va))
> +#define vmap_to_page(va)=C2=A0=C2=A0=C2=A0 mfn_to_page(vmap_to_mfn(va))
> +
> +#define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
> +#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) |
> DIRECTMAP_VIRT_START))
> +
> +/* Convert between Xen-heap virtual addresses and machine frame
> numbers. */
> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> +#define __mfn_to_virt(mfn) maddr_to_virt((paddr_t)(mfn) <<
> PAGE_SHIFT)
> +
> +/* Convert between Xen-heap virtual addresses and page-info
> structures. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +=C2=A0=C2=A0=C2=A0 BUG();
> +=C2=A0=C2=A0=C2=A0 return NULL;
> +}
> +
> +/*
> + * We define non-underscored wrappers for above conversion
> functions.
> + * These are overriden in various source files while underscored
> version
> + * remain intact.
> + */
> +#define virt_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 __virt_to_mfn(va)
> +#define mfn_to_virt(mfn)=C2=A0=C2=A0=C2=A0 __mfn_to_virt(mfn)
> +
> +struct page_info
> +{
> +=C2=A0=C2=A0=C2=A0 /* Each frame can be threaded onto a doubly-linked li=
st. */
> +=C2=A0=C2=A0=C2=A0 struct page_list_entry list;
> +
> +=C2=A0=C2=A0=C2=A0 /* Reference count and various PGC_xxx flags and fiel=
ds. */
> +=C2=A0=C2=A0=C2=A0 unsigned long count_info;
> +
> +=C2=A0=C2=A0=C2=A0 /* Context-dependent fields follow... */
> +=C2=A0=C2=A0=C2=A0 union {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is in use: ((count_in=
fo & PGC_count_mask) !=3D 0). */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Ty=
pe reference count and various PGT_xxx flags and
> fields. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsig=
ned long type_info;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } inuse;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is on a free list: ((=
count_info & PGC_count_mask) =3D=3D
> 0). */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * Index of the first *possibly* unscrubbed page in
> the buddy.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * One more bit than maximum possible order to
> accommodate
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * INVALID_DIRTY_IDX.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> +#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long first_dirty:MAX_ORDER + 1;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* Do TLBs need flushing for safety before next page
> use? */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bool need_tlbflush:1;
> +
> +#define BUDDY_NOT_SCRUBBING=C2=A0=C2=A0=C2=A0 0
> +#define BUDDY_SCRUBBING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> +#define BUDDY_SCRUB_ABORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long scrub_state:2;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long val;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } fre=
e;
> +
> +=C2=A0=C2=A0=C2=A0 } u;
> +
> +=C2=A0=C2=A0=C2=A0 union {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is in use, but not as=
 a shadow. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Ow=
ner of this page (zero if page is anonymous). */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t domain *domain;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } inuse;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is on a free list. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Or=
der-size of the free chunk this page is the head
> of. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsig=
ned int order;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } free;
> +
> +=C2=A0=C2=A0=C2=A0 } v;
> +
> +=C2=A0=C2=A0=C2=A0 union {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Timestamp from 'TLB c=
lock', used to avoid extra safety
> flushes.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Only valid for: a) fr=
ee pages, and b) pages with zero
> type count
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t tlbflush_timestamp;
> +=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0 uint64_t pad;
> +};
> +
> +#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> +
> +/* PDX of the first page in the frame table. */
> +extern unsigned long frametable_base_pdx;
> +
> +/* Convert between machine frame numbers and page-info structures.
> */
> +#define mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> \
> +=C2=A0=C2=A0=C2=A0 (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx=
))
> +#define page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> \
> +=C2=A0=C2=A0=C2=A0 pdx_to_mfn((unsigned long)((pg) - frame_table) +
> frametable_base_pdx)
> +
> +static inline void *page_to_virt(const struct page_info *pg)
> +{
> +=C2=A0=C2=A0=C2=A0 return mfn_to_virt(mfn_x(page_to_mfn(pg)));
> +}
> +
> +/*
> + * Common code requires get_page_type and put_page_type.
> + * We don't care about typecounts so we just do the minimum to make
> it
> + * happy.
> + */
> +static inline int get_page_type(struct page_info *page, unsigned
> long type)
> +{
> +=C2=A0=C2=A0=C2=A0 return 1;
> +}
> +
> +static inline void put_page_type(struct page_info *page)
> +{
> +}
> +
> +static inline void put_page_and_type(struct page_info *page)
> +{
> +=C2=A0=C2=A0=C2=A0 put_page_type(page);
> +=C2=A0=C2=A0=C2=A0 put_page(page);
> +}
> +
> +/*
> + * RISC-V does not have an M2P, but common code expects a handful of
> + * M2P-related defines and functions. Provide dummy versions of
> these.
> + */
> +#define INVALID_M2P_ENTRY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (~0U=
L)
> +#define SHARED_M2P_ENTRY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (~0UL - 1UL)
> +#define SHARED_M2P(_e)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((_e) =3D=3D SHARED_M2P_ENTRY)
> +
> +/* Xen always owns P2M on RISC-V */
> +#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn);
> } while (0)
> +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> +
> +#define PDX_GROUP_SHIFT (16 + 5)
> +
> +static inline unsigned long domain_get_maximum_gpfn(struct domain
> *d)
> +{
> +=C2=A0=C2=A0=C2=A0 BUG();
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static inline long arch_memory_op(int op,
> XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +=C2=A0=C2=A0=C2=A0 BUG();
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +/*
> + * On RISCV, all the RAM is currently direct mapped in Xen.
> + * Hence return always true.
> + */
> +static inline bool arch_mfns_in_directmap(unsigned long mfn,
> unsigned long nr)
> +{
> +=C2=A0=C2=A0=C2=A0 return true;
> +}
> +
> +#define PG_shift(idx)=C2=A0=C2=A0 (BITS_PER_LONG - (idx))
> +#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> +
> +#define PGT_none=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P=
G_mask(0, 1)=C2=A0 /* no special uses of this
> page=C2=A0=C2=A0 */
> +#define PGT_writable_page PG_mask(1, 1)=C2=A0 /* has writable
> mappings?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +#define PGT_type_mask=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 1)=C2=A0 /* Bit=
s 31 or
> 63.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +
> + /* Count of uses of this frame as its current type. */
> +#define PGT_count_width=C2=A0=C2=A0 PG_shift(2)
> +#define PGT_count_mask=C2=A0=C2=A0=C2=A0 ((1UL<<PGT_count_width)-1)
> +
> +/*
> + * Page needs to be scrubbed. Since this bit can only be set on a
> page that is
> + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> + */
> +#define _PGC_need_scrub=C2=A0=C2=A0 _PGC_allocated
> +#define PGC_need_scrub=C2=A0=C2=A0=C2=A0 PGC_allocated
> +
> +//=C2=A0 /* Cleared when the owning guest 'frees' this page. */
> +#define _PGC_allocated=C2=A0=C2=A0=C2=A0 PG_shift(1)
> +#define PGC_allocated=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 1)
> +=C2=A0 /* Page is Xen heap? */
> +#define _PGC_xen_heap=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(2)
> +#define PGC_xen_heap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 2)
> +/* Page is broken? */
> +#define _PGC_broken=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(7)
> +#define PGC_broken=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, =
7)
> + /* Mutually-exclusive page states: { inuse, offlining, offlined,
> free }. */
> +#define PGC_state=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mas=
k(3, 9)
> +#define PGC_state_inuse=C2=A0=C2=A0 PG_mask(0, 9)
> +#define PGC_state_offlining PG_mask(1, 9)
> +#define PGC_state_offlined PG_mask(2, 9)
> +#define PGC_state_free=C2=A0=C2=A0=C2=A0 PG_mask(3, 9)
> +// #define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D
> PGC_state_##st)
> +
> +/* Count of references to this frame. */
> +#define PGC_count_width=C2=A0=C2=A0 PG_shift(9)
> +#define PGC_count_mask=C2=A0=C2=A0=C2=A0 ((1UL<<PGC_count_width)-1)
> +
> +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D
> PGC_state_##st)
> +
> +#define _PGC_extra=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(10=
)
> +#define PGC_extra=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mas=
k(1, 10)
> +
> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> +#define is_xen_heap_mfn(mfn) \
> +=C2=A0=C2=A0=C2=A0 (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn))=
)
> +
> +#define is_xen_fixed_mfn(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 ((mfn_to_maddr(mfn) >=3D virt_to_maddr(&_start)) &&=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0 (mfn_to_maddr(mfn) <=3D virt_to_maddr((vaddr_t)=
_end - 1)))
> +
> +#define page_get_owner(_p)=C2=A0=C2=A0=C2=A0 (_p)->v.inuse.domain
> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain =3D (_d))
> +
> +/* TODO: implement */
> +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
> +
> +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> +
> +#define domain_set_alloc_bitsize(d) ((void)0)
> +#define domain_clamp_alloc_bitsize(d, b) (b)
> +
> +#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
I missed saving these changes. It should be _pfn -> pfn_. (Just a
reminder for me).

Sorry for the inconvenience.

> +
> =C2=A0extern unsigned char cpu0_boot_stack[];
> =C2=A0
> =C2=A0void setup_initial_pagetables(void);
> @@ -17,4 +260,9 @@ unsigned long calc_phys_offset(void);
> =C2=A0
> =C2=A0void turn_on_mmu(unsigned long ra);
> =C2=A0
> +static inline unsigned int arch_get_dma_bitsize(void)
> +{
> +=C2=A0=C2=A0=C2=A0 return 32; /* TODO */
> +}
> +
> =C2=A0#endif /* _ASM_RISCV_MM_H */


