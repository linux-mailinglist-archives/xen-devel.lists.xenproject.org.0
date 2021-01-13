Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5782F52A8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66704.118580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlBB-0002z9-R9; Wed, 13 Jan 2021 18:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66704.118580; Wed, 13 Jan 2021 18:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlBB-0002ym-NO; Wed, 13 Jan 2021 18:47:37 +0000
Received: by outflank-mailman (input) for mailman id 66704;
 Wed, 13 Jan 2021 18:47:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzlBA-0002yh-OC
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:47:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlB8-0002Ga-PV; Wed, 13 Jan 2021 18:47:34 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlB8-0006fI-Cy; Wed, 13 Jan 2021 18:47:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=+rDl2XS2wYMW2ZqOTkQwH5k1lCvWIPGzO3x0+6aDeaM=; b=C7DzdpOnFM2p7yh8rPYcO1J3i0
	ywAZdaBlbR4FTSlX0HNZxpeKCzj+1RuY4SZFcxRheknE53ntnPJQLiqnel6vHNz7tkriwzb9DZ/gI
	hsy1HMucC2Ol9jZGBmid4bmofAK1AhOa/pUhg4vGKnb7Nk4OzwUwQvWlx6s01FOqptQg=;
Subject: Re: [PATCH v2 1/2] include: don't use asm/page.h from common headers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <b2368cb9-5c9a-3e85-c048-383825cc5efe@suse.com>
 <ea286f72-6f30-58ef-fe53-b29df89fcc2a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7da66ee7-eac5-c54e-68ba-f7abd085a079@xen.org>
Date: Wed, 13 Jan 2021 18:47:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ea286f72-6f30-58ef-fe53-b29df89fcc2a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 12:37, Jan Beulich wrote:
> Doing so limits what can be done in (in particular included by) this per-
> arch header. Abstract out page shift/size related #define-s, which is all
> the respective headers care about. Extend the replacement / removal to
> some x86 headers as well; some others now need to include page.h (and
> they really should have before).
> 
> Arm's VADDR_BITS gets dropped altogether: Its current value is clearly
> wrong for 64-bit, but the constant also isn't used anywhere right now.
> 
> While Arm used vaddr_t in PAGE_OFFSET(), this use is compatible with
> that of unsigned long in the new common implementation.
> 
> Also drop the dead PAGE_FLAG_MASK at this occasion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v2: Have just a single PAGE_OFFSET(). Rename per-arch headers to
>      page-bits.h. Drop VADDR_BITS altogether for Arm.
> 
> --- a/xen/arch/arm/arm64/lib/clear_page.S
> +++ b/xen/arch/arm/arm64/lib/clear_page.S
> @@ -14,6 +14,8 @@
>    * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include <xen/page-size.h>
> +
>   /*
>    * Clear page @dest
>    *
> --- a/xen/include/asm-arm/config.h
> +++ b/xen/include/asm-arm/config.h
> @@ -176,11 +176,6 @@
>   #define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
>   #define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
>   
> -#define PAGE_SHIFT              12
> -#define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> -#define PAGE_MASK           (~(PAGE_SIZE-1))
> -#define PAGE_FLAG_MASK      (~0)
> -
>   #define NR_hypercalls 64
>   
>   #define STACK_ORDER 3
> --- a/xen/include/asm-arm/current.h
> +++ b/xen/include/asm-arm/current.h
> @@ -1,6 +1,7 @@
>   #ifndef __ARM_CURRENT_H__
>   #define __ARM_CURRENT_H__
>   
> +#include <xen/page-size.h>
>   #include <xen/percpu.h>
>   
>   #include <asm/processor.h>
> --- a/xen/include/asm-arm/page.h
> +++ b/xen/include/asm-arm/page.h
> @@ -2,21 +2,11 @@
>   #define __ARM_PAGE_H__
>   
>   #include <public/xen.h>
> +#include <xen/page-size.h>
>   #include <asm/processor.h>
>   #include <asm/lpae.h>
>   #include <asm/sysregs.h>
>   
> -#ifdef CONFIG_ARM_64
> -#define PADDR_BITS              48
> -#else
> -#define PADDR_BITS              40
> -#endif
> -#define PADDR_MASK              ((1ULL << PADDR_BITS)-1)
> -#define PAGE_OFFSET(ptr)        ((vaddr_t)(ptr) & ~PAGE_MASK)
> -
> -#define VADDR_BITS              32
> -#define VADDR_MASK              (~0UL)
> -
>   /* Shareability values for the LPAE entries */
>   #define LPAE_SH_NON_SHAREABLE 0x0
>   #define LPAE_SH_UNPREDICTALE  0x1
> --- /dev/null
> +++ b/xen/include/asm-arm/page-bits.h
> @@ -0,0 +1,12 @@
> +#ifndef __ARM_PAGE_SHIFT_H__
> +#define __ARM_PAGE_SHIFT_H__
> +
> +#define PAGE_SHIFT              12
> +
> +#ifdef CONFIG_ARM_64
> +#define PADDR_BITS              48
> +#else
> +#define PADDR_BITS              40
> +#endif
> +
> +#endif /* __ARM_PAGE_SHIFT_H__ */
> --- a/xen/include/asm-x86/current.h
> +++ b/xen/include/asm-x86/current.h
> @@ -8,8 +8,8 @@
>   #define __X86_CURRENT_H__
>   
>   #include <xen/percpu.h>
> +#include <xen/page-size.h>
>   #include <public/xen.h>
> -#include <asm/page.h>
>   
>   /*
>    * Xen's cpu stacks are 8 pages (8-page aligned), arranged as:
> --- a/xen/include/asm-x86/desc.h
> +++ b/xen/include/asm-x86/desc.h
> @@ -1,6 +1,8 @@
>   #ifndef __ARCH_DESC_H
>   #define __ARCH_DESC_H
>   
> +#include <asm/page.h>
> +
>   /*
>    * Xen reserves a memory page of GDT entries.
>    * No guest GDT entries exist beyond the Xen reserved area.
> --- a/xen/include/asm-x86/fixmap.h
> +++ b/xen/include/asm-x86/fixmap.h
> @@ -12,7 +12,7 @@
>   #ifndef _ASM_FIXMAP_H
>   #define _ASM_FIXMAP_H
>   
> -#include <asm/page.h>
> +#include <xen/page-size.h>
>   
>   #define FIXADDR_TOP (VMAP_VIRT_END - PAGE_SIZE)
>   #define FIXADDR_X_TOP (XEN_VIRT_END - PAGE_SIZE)
> --- a/xen/include/asm-x86/guest/hyperv-hcall.h
> +++ b/xen/include/asm-x86/guest/hyperv-hcall.h
> @@ -20,12 +20,12 @@
>   #define __X86_HYPERV_HCALL_H__
>   
>   #include <xen/lib.h>
> +#include <xen/page-size.h>
>   #include <xen/types.h>
>   
>   #include <asm/asm_defns.h>
>   #include <asm/fixmap.h>
>   #include <asm/guest/hyperv-tlfs.h>
> -#include <asm/page.h>
>   
>   static inline uint64_t hv_do_hypercall(uint64_t control, paddr_t input_addr,
>                                          paddr_t output_addr)
> --- a/xen/include/asm-x86/guest/hyperv-tlfs.h
> +++ b/xen/include/asm-x86/guest/hyperv-tlfs.h
> @@ -10,8 +10,8 @@
>   #define _ASM_X86_HYPERV_TLFS_H
>   
>   #include <xen/bitops.h>
> +#include <xen/page-size.h>
>   #include <xen/types.h>
> -#include <asm/page.h>
>   
>   /*
>    * While not explicitly listed in the TLFS, Hyper-V always runs with a page size
> --- a/xen/include/asm-x86/io.h
> +++ b/xen/include/asm-x86/io.h
> @@ -3,7 +3,6 @@
>   
>   #include <xen/vmap.h>
>   #include <xen/types.h>
> -#include <asm/page.h>
>   
>   #define readb(x) (*(volatile uint8_t  *)(x))
>   #define readw(x) (*(volatile uint16_t *)(x))
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -6,6 +6,7 @@
>   #include <xen/spinlock.h>
>   #include <xen/rwlock.h>
>   #include <asm/io.h>
> +#include <asm/page.h>
>   #include <asm/uaccess.h>
>   #include <asm/x86_emulate.h>
>   
> --- a/xen/include/asm-x86/page.h
> +++ b/xen/include/asm-x86/page.h
> @@ -2,15 +2,7 @@
>   #define __X86_PAGE_H__
>   
>   #include <xen/const.h>
> -
> -/*
> - * It is important that the masks are signed quantities. This ensures that
> - * the compiler sign-extends a 32-bit mask to 64 bits if that is required.
> - */
> -#define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> -#define PAGE_MASK           (~(PAGE_SIZE-1))
> -#define PAGE_FLAG_MASK      (~0)
> -#define PAGE_OFFSET(ptr)    ((unsigned long)(ptr) & ~PAGE_MASK)
> +#include <xen/page-size.h>
>   
>   #define PAGE_ORDER_4K       0
>   #define PAGE_ORDER_2M       9
> --- /dev/null
> +++ b/xen/include/asm-x86/page-bits.h
> @@ -0,0 +1,26 @@
> +#ifndef __X86_PAGE_SHIFT_H__
> +#define __X86_PAGE_SHIFT_H__
> +
> +#define L1_PAGETABLE_SHIFT      12
> +#define L2_PAGETABLE_SHIFT      21
> +#define L3_PAGETABLE_SHIFT      30
> +#define L4_PAGETABLE_SHIFT      39
> +#define PAGE_SHIFT              L1_PAGETABLE_SHIFT
> +#define SUPERPAGE_SHIFT         L2_PAGETABLE_SHIFT
> +#define ROOT_PAGETABLE_SHIFT    L4_PAGETABLE_SHIFT
> +
> +#define PAGETABLE_ORDER         9
> +#define L1_PAGETABLE_ENTRIES    (1 << PAGETABLE_ORDER)
> +#define L2_PAGETABLE_ENTRIES    (1 << PAGETABLE_ORDER)
> +#define L3_PAGETABLE_ENTRIES    (1 << PAGETABLE_ORDER)
> +#define L4_PAGETABLE_ENTRIES    (1 << PAGETABLE_ORDER)
> +#define ROOT_PAGETABLE_ENTRIES  L4_PAGETABLE_ENTRIES
> +
> +#define SUPERPAGE_ORDER         PAGETABLE_ORDER
> +#define SUPERPAGE_PAGES         (1 << SUPERPAGE_ORDER)
> +
> +/* These are architectural limits. */
> +#define PADDR_BITS              52
> +#define VADDR_BITS              48
> +
> +#endif /* __X86_PAGE_SHIFT_H__ */
> --- a/xen/include/asm-x86/uaccess.h
> +++ b/xen/include/asm-x86/uaccess.h
> @@ -6,7 +6,6 @@
>   #include <xen/errno.h>
>   #include <xen/prefetch.h>
>   #include <asm/asm_defns.h>
> -#include <asm/page.h>
>   
>   #include <asm/x86_64/uaccess.h>
>   
> --- a/xen/include/asm-x86/x86_64/page.h
> +++ b/xen/include/asm-x86/x86_64/page.h
> @@ -2,31 +2,8 @@
>   #ifndef __X86_64_PAGE_H__
>   #define __X86_64_PAGE_H__
>   
> -#define L1_PAGETABLE_SHIFT      12
> -#define L2_PAGETABLE_SHIFT      21
> -#define L3_PAGETABLE_SHIFT      30
> -#define L4_PAGETABLE_SHIFT      39
> -#define PAGE_SHIFT              L1_PAGETABLE_SHIFT
> -#define SUPERPAGE_SHIFT         L2_PAGETABLE_SHIFT
> -#define ROOT_PAGETABLE_SHIFT    L4_PAGETABLE_SHIFT
> -
> -#define PAGETABLE_ORDER         9
> -#define L1_PAGETABLE_ENTRIES    (1<<PAGETABLE_ORDER)
> -#define L2_PAGETABLE_ENTRIES    (1<<PAGETABLE_ORDER)
> -#define L3_PAGETABLE_ENTRIES    (1<<PAGETABLE_ORDER)
> -#define L4_PAGETABLE_ENTRIES    (1<<PAGETABLE_ORDER)
> -#define ROOT_PAGETABLE_ENTRIES  L4_PAGETABLE_ENTRIES
> -#define SUPERPAGE_ORDER         PAGETABLE_ORDER
> -#define SUPERPAGE_PAGES         (1<<SUPERPAGE_ORDER)
> -
>   #define __XEN_VIRT_START        XEN_VIRT_START
>   
> -/* These are architectural limits. Current CPUs support only 40-bit phys. */
> -#define PADDR_BITS              52
> -#define VADDR_BITS              48
> -#define PADDR_MASK              ((_AC(1,UL) << PADDR_BITS) - 1)
> -#define VADDR_MASK              ((_AC(1,UL) << VADDR_BITS) - 1)
> -
>   #define VADDR_TOP_BIT           (1UL << (VADDR_BITS - 1))
>   #define CANONICAL_MASK          (~0UL & ~VADDR_MASK)
>   
> --- a/xen/include/xen/gdbstub.h
> +++ b/xen/include/xen/gdbstub.h
> @@ -20,8 +20,8 @@
>   #ifndef __XEN_GDBSTUB_H__
>   #define __XEN_GDBSTUB_H__
>   
> +#include <xen/page-size.h>
>   #include <asm/atomic.h>
> -#include <asm/page.h>
>   
>   #ifdef CONFIG_CRASH_DEBUG
>   
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -26,7 +26,6 @@
>   #include <xen/mm.h>
>   #include <xen/rwlock.h>
>   #include <public/grant_table.h>
> -#include <asm/page.h>
>   #include <asm/grant_table.h>
>   
>   #ifdef CONFIG_GRANT_TABLE
> --- /dev/null
> +++ b/xen/include/xen/page-size.h
> @@ -0,0 +1,18 @@
> +#ifndef __XEN_PAGE_SIZE_H__
> +#define __XEN_PAGE_SIZE_H__
> +
> +#include <xen/const.h>
> +#include <asm/page-bits.h>
> +
> +/*
> + * It is important that the masks are signed quantities. This ensures that
> + * the compiler sign-extends a 32-bit mask to 64 bits if that is required.
> + */
> +#define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> +#define PAGE_MASK           (~(PAGE_SIZE-1))
> +#define PAGE_OFFSET(ptr)   ((unsigned long)(ptr) & ~PAGE_MASK)
> +
> +#define PADDR_MASK          ((_AC(1,ULL) << PADDR_BITS) - 1)
> +#define VADDR_MASK          (~_AC(0,UL) >> (BITS_PER_LONG - VADDR_BITS))
> +
> +#endif /* __XEN_PAGE_SIZE__ */
> --- a/xen/include/xen/pfn.h
> +++ b/xen/include/xen/pfn.h
> @@ -1,7 +1,7 @@
>   #ifndef __XEN_PFN_H__
>   #define __XEN_PFN_H__
>   
> -#include <asm/page.h>
> +#include <xen/page-size.h>
>   
>   #define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
>   #define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -2,7 +2,7 @@
>   #define __XEN_VMAP_H__
>   
>   #include <xen/mm.h>
> -#include <asm/page.h>
> +#include <xen/page-size.h>
>   
>   enum vmap_region {
>       VMAP_DEFAULT,
> 

-- 
Julien Grall

