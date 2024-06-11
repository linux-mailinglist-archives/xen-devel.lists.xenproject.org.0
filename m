Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B0903916
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 12:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738265.1144974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGyvx-0001aH-M9; Tue, 11 Jun 2024 10:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738265.1144974; Tue, 11 Jun 2024 10:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGyvx-0001Yh-JP; Tue, 11 Jun 2024 10:40:57 +0000
Received: by outflank-mailman (input) for mailman id 738265;
 Tue, 11 Jun 2024 10:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGyvv-0001X2-Oq
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 10:40:55 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 135d08b3-27df-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 12:40:53 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-795fb13b256so142144385a.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 03:40:53 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b0908287f9sm2068136d6.119.2024.06.11.03.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 03:40:51 -0700 (PDT)
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
X-Inumbo-ID: 135d08b3-27df-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718102452; x=1718707252; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r8a1AXtM0wZIJDy65EK2bmDa1peS7KgyN303R6Jr3pM=;
        b=Huue/vMogZhplHB55ITXaYGVAHg6pLB/Qu9jlxgoa002G5Hwu0BBwgiat12ZUmewhG
         tR7wtB0bIwYZEaQQBO+jgoyJ3nQtBrVf5bw0iI3mZHBCTJwp9/IfcwSG/NBJtMlrRi7d
         aBO+3SbtbFTcmqUmaC0saosxu7+n8Deid6Kkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102452; x=1718707252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8a1AXtM0wZIJDy65EK2bmDa1peS7KgyN303R6Jr3pM=;
        b=PZAcYs1Vf7a7pAzV4YlsD/Q2kwITuOa+cEr3FnFu3PGnSy7+0yiAwAW2lyesTYlV01
         VCuBXq3GnNIIcv9tls84WO96ROi4tdt1Hb1QQnlWk23zvlLS2DKcrvpky97T3bslnqYz
         VSFKJjT/6Hn43MHhtLK1LoQbmh7dMd+hcgCyB3CKHapz2SyvumRbEg4DopT8yDk9cIfT
         7UFzkKk03dQIyvpCr+6pDKiMEOYw8C6ITbEEqmxhH1ksFHGmYxXgsXC4FIrHnnWfYwK1
         LnS+D4AQxlQVB16dvZk44dZpkMpfu0XB0K/MHnmcFjLDkrImYXaIzNvfhxMlwnnqSduu
         NJBQ==
X-Gm-Message-State: AOJu0YxXV00RIGPxBGI4qcjhrHKn/y88Gp8mtxrWpr+rP6q3e1gAxjPn
	xpLY15Swgu78J91NrrBDGut4rlr9X0PWe67lUJ2g89yWvVJ8Nz70uXi8s6ikHdc=
X-Google-Smtp-Source: AGHT+IFUX0JmgVH31R8bjU4n4qqzVICfX2TxGlZjuLmvfGKyDt6fSAfrFLugGhgOwh/lwIs4t+sHMg==
X-Received: by 2002:a05:6214:3d08:b0:6b0:732f:b91b with SMTP id 6a1803df08f44-6b089f7056dmr46105886d6.26.1718102451611;
        Tue, 11 Jun 2024 03:40:51 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:40:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <ZmgpsZJ4afLd1Fc3@macbook>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>

On Wed, May 22, 2024 at 05:39:03PM +0200, Marek Marczykowski-Górecki wrote:
> In some cases, only few registers on a page needs to be write-protected.
> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> PBA table (which doesn't need to span the whole table either), although
> in the latter case the spec forbids placing other registers on the same
> page. Current API allows only marking whole pages pages read-only,
> which sometimes may cover other registers that guest may need to
> write into.
> 
> Currently, when a guest tries to write to an MMIO page on the
> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> from userspace (like, /dev/mem), it will try to fixup by updating page
> tables (that Xen again will force to read-only) and will hit that #PF
> again (looping endlessly). Both behaviors are undesirable if guest could
> actually be allowed the write.
> 
> Introduce an API that allows marking part of a page read-only. Since
> sub-page permissions are not a thing in page tables (they are in EPT,
> but not granular enough), do this via emulation (or simply page fault
> handler for PV) that handles writes that are supposed to be allowed.
> The new subpage_mmio_ro_add() takes a start physical address and the
> region size in bytes. Both start address and the size need to be 8-byte
> aligned, as a practical simplification (allows using smaller bitmask,
> and a smaller granularity isn't really necessary right now).
> It will internally add relevant pages to mmio_ro_ranges, but if either
> start or end address is not page-aligned, it additionally adds that page
> to a list for sub-page R/O handling. The list holds a bitmask which
> qwords are supposed to be read-only and an address where page is mapped
> for write emulation - this mapping is done only on the first access. A
> plain list is used instead of more efficient structure, because there
> isn't supposed to be many pages needing this precise r/o control.
> 
> The mechanism this API is plugged in is slightly different for PV and
> HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> it's already called for #PF on read-only MMIO page. For HVM however, EPT
> violation on p2m_mmio_direct page results in a direct domain_crash() for
> non hardware domains.  To reach mmio_ro_emulated_write(), change how
> write violations for p2m_mmio_direct are handled - specifically, check
> if they relate to such partially protected page via
> subpage_mmio_write_accept() and if so, call hvm_emulate_one_mmio() for
> them too. This decodes what guest is trying write and finally calls
> mmio_ro_emulated_write(). The EPT write violation is detected as
> npfec.write_access and npfec.present both being true (similar to other
> places), which may cover some other (future?) cases - if that happens,
> emulator might get involved unnecessarily, but since it's limited to
> pages marked with subpage_mmio_ro_add() only, the impact is minimal.
> Both of those paths need an MFN to which guest tried to write (to check
> which part of the page is supposed to be read-only, and where
> the page is mapped for writes). This information currently isn't
> available directly in mmio_ro_emulated_write(), but in both cases it is
> already resolved somewhere higher in the call tree. Pass it down to
> mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.
> 
> This may give a bit more access to the instruction emulator to HVM
> guests (the change in hvm_hap_nested_page_fault()), but only for pages
> explicitly marked with subpage_mmio_ro_add() - so, if the guest has a
> passed through a device partially used by Xen.
> As of the next patch, it applies only configuration explicitly
> documented as not security supported.
> 
> The subpage_mmio_ro_add() function cannot be called with overlapping
> ranges, and on pages already added to mmio_ro_ranges separately.
> Successful calls would result in correct handling, but error paths may
> result in incorrect state (like pages removed from mmio_ro_ranges too
> early). Debug build has asserts for relevant cases.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Shadow mode is not tested, but I don't expect it to work differently than
> HAP in areas related to this patch.
> 
> Changes in v4:
> - rename SUBPAGE_MMIO_RO_ALIGN to MMIO_RO_SUBPAGE_GRAN
> - guard subpage_mmio_write_accept with CONFIG_HVM, as it's used only
>   there
> - rename ro_qwords to ro_elems
> - use unsigned arguments for subpage_mmio_ro_remove_page()
> - use volatile for __iomem
> - do not set mmio_ro_ctxt.mfn for mmcfg case
> - comment where fields of mmio_ro_ctxt are used
> - use bool for result of __test_and_set_bit
> - do not open-code mfn_to_maddr()
> - remove leftover RCU
> - mention hvm_hap_nested_page_fault() explicitly in the commit message
> Changes in v3:
> - use unsigned int for loop iterators
> - use __set_bit/__clear_bit when under spinlock
> - avoid ioremap() under spinlock
> - do not cast away const
> - handle unaligned parameters in release build
> - comment fixes
> - remove RCU - the add functions are __init and actual usage is only
>   much later after domains are running
> - add checks overlapping ranges in debug build and document the
>   limitations
> - change subpage_mmio_ro_add() so the error path doesn't potentially
>   remove pages from mmio_ro_ranges
> - move printing message to avoid one goto in
>   subpage_mmio_write_emulate()
> Changes in v2:
> - Simplify subpage_mmio_ro_add() parameters
> - add to mmio_ro_ranges from within subpage_mmio_ro_add()
> - use ioremap() instead of caller-provided fixmap
> - use 8-bytes granularity (largest supported single write) and a bitmap
>   instead of a rangeset
> - clarify commit message
> - change how it's plugged in for HVM domain, to not change the behavior for
>   read-only parts (keep it hitting domain_crash(), instead of ignoring
>   write)
> - remove unused subpage_mmio_ro_remove()
> ---
>  xen/arch/x86/hvm/emulate.c      |   2 +-
>  xen/arch/x86/hvm/hvm.c          |   4 +-
>  xen/arch/x86/include/asm/mm.h   |  25 +++-
>  xen/arch/x86/mm.c               | 273 +++++++++++++++++++++++++++++++++-
>  xen/arch/x86/pv/ro-page-fault.c |   6 +-
>  5 files changed, 305 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index ab1bc516839a..e98513afc69b 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2735,7 +2735,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>          .write      = mmio_ro_emulated_write,
>          .validate   = hvmemul_validate,
>      };
> -    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
> +    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
>      struct hvm_emulate_ctxt ctxt;
>      const struct x86_emulate_ops *ops;
>      unsigned int seg, bdf;
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 9594e0a5c530..73bbfe2bdc99 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2001,8 +2001,8 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>          goto out_put_gfn;
>      }
>  
> -    if ( (p2mt == p2m_mmio_direct) && is_hardware_domain(currd) &&
> -         npfec.write_access && npfec.present &&
> +    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
> +         (is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, gla)) &&
>           (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
>      {
>          rc = 1;
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 98b66edaca5e..d04cf2c4165e 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -522,9 +522,34 @@ extern struct rangeset *mmio_ro_ranges;
>  void memguard_guard_stack(void *p);
>  void memguard_unguard_stack(void *p);
>  
> +/*
> + * Add more precise r/o marking for a MMIO page. Range specified here
> + * will still be R/O, but the rest of the page (not marked as R/O via another
> + * call) will have writes passed through.
> + * The start address and the size must be aligned to MMIO_RO_SUBPAGE_GRAN.
> + *
> + * This API cannot be used for overlapping ranges, nor for pages already added
> + * to mmio_ro_ranges separately.
> + *
> + * Since there is currently no subpage_mmio_ro_remove(), relevant device should
> + * not be hot-unplugged.
> + *
> + * Return values:
> + *  - negative: error
> + *  - 0: success
> + */
> +#define MMIO_RO_SUBPAGE_GRAN 8
> +int subpage_mmio_ro_add(paddr_t start, size_t size);
> +#ifdef CONFIG_HVM
> +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla);
> +#endif
> +
>  struct mmio_ro_emulate_ctxt {
>          unsigned long cr2;
> +        /* Used only for mmcfg case */
>          unsigned int seg, bdf;
> +        /* Used only for non-mmcfg case */
> +        mfn_t mfn;
>  };
>  
>  int cf_check mmio_ro_emulated_write(
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index d968bbbc7315..dab7cc018c3f 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -150,6 +150,17 @@ bool __read_mostly machine_to_phys_mapping_valid;
>  
>  struct rangeset *__read_mostly mmio_ro_ranges;
>  
> +/* Handling sub-page read-only MMIO regions */
> +struct subpage_ro_range {
> +    struct list_head list;
> +    mfn_t mfn;
> +    void __iomem *mapped;
> +    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
> +};
> +
> +static LIST_HEAD(subpage_ro_ranges);
> +static DEFINE_SPINLOCK(subpage_ro_lock);
> +
>  static uint32_t base_disallow_mask;
>  /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
>  #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
> @@ -4910,6 +4921,265 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return rc;
>  }
>  
> +/*
> + * Mark part of the page as R/O.
> + * Returns:
> + * - 0 on success - first range in the page
> + * - 1 on success - subsequent range in the page
> + * - <0 on error
> + *
> + * This needs subpage_ro_lock already taken.
> + */
> +static int __init subpage_mmio_ro_add_page(
> +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)

Nit: parameters here seem to be indented differently than below.

> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    unsigned int i;
> +
> +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }

AFAICT you could put the search logic into a separate function and use
it here, plus in subpage_mmio_ro_remove_page(),
subpage_mmio_write_emulate() and subpage_mmio_write_accept() possibly.

> +    if ( !entry )
> +    {
> +        /* iter == NULL marks it was a newly allocated entry */
> +        iter = NULL;
> +        entry = xzalloc(struct subpage_ro_range);
> +        if ( !entry )
> +            return -ENOMEM;
> +        entry->mfn = mfn;
> +    }
> +
> +    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
> +    {
> +        bool oldbit = __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
> +                                        entry->ro_elems);
> +        ASSERT(!oldbit);
> +    }
> +
> +    if ( !iter )
> +        list_add(&entry->list, &subpage_ro_ranges);
> +
> +    return iter ? 1 : 0;
> +}
> +
> +/* This needs subpage_ro_lock already taken */
> +static void __init subpage_mmio_ro_remove_page(
> +    mfn_t mfn,
> +    unsigned int offset_s,
> +    unsigned int offset_e)
> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    unsigned int i;
> +
> +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    if ( !entry )
> +        return;
> +
> +    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
> +        __clear_bit(i / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems);
> +
> +    if ( !bitmap_empty(entry->ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN) )
> +        return;
> +
> +    list_del(&entry->list);
> +    if ( entry->mapped )
> +        iounmap(entry->mapped);
> +    xfree(entry);
> +}
> +
> +int __init subpage_mmio_ro_add(
> +    paddr_t start,
> +    size_t size)
> +{
> +    mfn_t mfn_start = maddr_to_mfn(start);
> +    paddr_t end = start + size - 1;
> +    mfn_t mfn_end = maddr_to_mfn(end);
> +    unsigned int offset_end = 0;
> +    int rc;
> +    bool subpage_start, subpage_end;
> +
> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> +        size = ROUNDUP(size, MMIO_RO_SUBPAGE_GRAN);
> +
> +    if ( !size )
> +        return 0;
> +
> +    if ( mfn_eq(mfn_start, mfn_end) )
> +    {
> +        /* Both starting and ending parts handled at once */
> +        subpage_start = PAGE_OFFSET(start) || PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +        subpage_end = false;

Given the intended usage of this, don't we want to limit to only a
single page?  So that PFN_DOWN(start + size) == PFN_DOWN/(start), as
that would simplify the logic here?

Mostly asking because I think for the usage of XHCI the registers that
need to be marked RO are all inside the same page, and hence would
like to avoid introducing logic to handle multipage ranges if that's
not tested at all.

> +    }
> +    else
> +    {
> +        subpage_start = PAGE_OFFSET(start);
> +        subpage_end = PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +    }
> +
> +    spin_lock(&subpage_ro_lock);

Do you really need the lock if modifications can only happen during
init?  Xen initialization is single threaded, so you can likely avoid
the lock during boot.

> +
> +    if ( subpage_start )
> +    {
> +        offset_end = mfn_eq(mfn_start, mfn_end) ?
> +                     PAGE_OFFSET(end) :
> +                     (PAGE_SIZE - 1);
> +        rc = subpage_mmio_ro_add_page(mfn_start,
> +                                      PAGE_OFFSET(start),
> +                                      offset_end);
> +        if ( rc < 0 )
> +            goto err_unlock;
> +        /* Check if not marking R/W part of a page intended to be fully R/O */
> +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> +                                                  mfn_x(mfn_start)));

I think it would be better if this check was done ahead, and an error
was returned.  I see no point in delaying the check until the region
has already been registered.

> +    }
> +
> +    if ( subpage_end )
> +    {
> +        rc = subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
> +        if ( rc < 0 )
> +            goto err_unlock_remove;
> +        /* Check if not marking R/W part of a page intended to be fully R/O */
> +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> +                                                  mfn_x(mfn_end)));
> +    }
> +
> +    spin_unlock(&subpage_ro_lock);
> +
> +    rc = rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end));
> +    if ( rc )
> +        goto err_remove;
> +
> +    return 0;
> +
> + err_remove:
> +    spin_lock(&subpage_ro_lock);
> +    if ( subpage_end )
> +        subpage_mmio_ro_remove_page(mfn_end, 0, PAGE_OFFSET(end));
> + err_unlock_remove:
> +    if ( subpage_start )
> +        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), offset_end);
> + err_unlock:
> +    spin_unlock(&subpage_ro_lock);
> +    return rc;
> +}
> +
> +static void __iomem *subpage_mmio_map_page(
> +    struct subpage_ro_range *entry)
> +{
> +    void __iomem *mapped_page;
> +
> +    if ( entry->mapped )
> +        return entry->mapped;
> +
> +    mapped_page = ioremap(mfn_to_maddr(entry->mfn), PAGE_SIZE);
> +
> +    spin_lock(&subpage_ro_lock);
> +    /* Re-check under the lock */
> +    if ( entry->mapped )
> +    {
> +        spin_unlock(&subpage_ro_lock);
> +        if ( mapped_page )
> +            iounmap(mapped_page);
> +        return entry->mapped;
> +    }
> +
> +    entry->mapped = mapped_page;
> +    spin_unlock(&subpage_ro_lock);
> +    return entry->mapped;
> +}
> +
> +static void subpage_mmio_write_emulate(
> +    mfn_t mfn,
> +    unsigned int offset,
> +    const void *data,
> +    unsigned int len)
> +{
> +    struct subpage_ro_range *entry;
> +    volatile void __iomem *addr;
> +
> +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(entry->mfn, mfn) )
> +        {
> +            if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
> +            {
> + write_ignored:
> +                gprintk(XENLOG_WARNING,
> +                        "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
> +                        mfn_x(mfn), offset, len);
> +                return;
> +            }
> +
> +            addr = subpage_mmio_map_page(entry);

Given the very limited usage of this subpage RO infrastructure, I
would be tempted to just map the mfn when the page is registered, in
order to simplify the logic here.  The only use-case we have is XHCI,
and further usage of this are likely to be limited to similar hardware
that's shared between Xen and the hardware domain.

> +            if ( !addr )
> +            {
> +                gprintk(XENLOG_ERR,
> +                        "Failed to map page for MMIO write at 0x%"PRI_mfn"%03x\n",
> +                        mfn_x(mfn), offset);
> +                return;
> +            }
> +
> +            switch ( len )
> +            {
> +            case 1:
> +                writeb(*(const uint8_t*)data, addr);
> +                break;
> +            case 2:
> +                writew(*(const uint16_t*)data, addr);
> +                break;
> +            case 4:
> +                writel(*(const uint32_t*)data, addr);
> +                break;
> +            case 8:
> +                writeq(*(const uint64_t*)data, addr);
> +                break;
> +            default:
> +                /* mmio_ro_emulated_write() already validated the size */
> +                ASSERT_UNREACHABLE();
> +                goto write_ignored;
> +            }
> +            return;
> +        }
> +    }
> +    /* Do not print message for pages without any writable parts. */
> +}
> +
> +#ifdef CONFIG_HVM
> +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> +{
> +    unsigned int offset = PAGE_OFFSET(gla);
> +    const struct subpage_ro_range *entry;
> +
> +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> +        if ( mfn_eq(entry->mfn, mfn) &&
> +             !test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
> +        {
> +            /*
> +             * We don't know the write size at this point yet, so it could be
> +             * an unaligned write, but accept it here anyway and deal with it
> +             * later.
> +             */
> +            return true;

For accesses that fall into the RO region, I think you need to accept
them here and just terminate them?  I see no point in propagating
them further in hvm_hap_nested_page_fault().

Thanks, Roger.

