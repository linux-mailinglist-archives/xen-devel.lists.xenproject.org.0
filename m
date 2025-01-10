Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40477A09378
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869716.1281175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWG0Z-0000GW-N4; Fri, 10 Jan 2025 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869716.1281175; Fri, 10 Jan 2025 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWG0Z-0000Eu-K6; Fri, 10 Jan 2025 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 869716;
 Fri, 10 Jan 2025 14:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWG0Y-0008To-26
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:29:06 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eb1ce8a-cf5f-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 15:29:05 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso415083166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:29:05 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99083fbd7sm1703370a12.73.2025.01.10.06.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:29:04 -0800 (PST)
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
X-Inumbo-ID: 3eb1ce8a-cf5f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736519345; x=1737124145; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t7GH8zDE64afytORyeioFULV1nHRsT7BDsc4aRA2bpQ=;
        b=Hfeo1ER0Q0J+03j/QqR2CSv8QpUafSppoUaxErZePEWVZJwIu3rUorefs/OgR5VzRd
         nh2+Y9KiDqGDN6lJdE2zZ+CIAsmbUhokfowfUzO+Gr/I1fJaejOPm6HVwr8QglnvDLec
         XsQA4xHSKu9x5gqVrpYGNepWcEpSNxwV9ubi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736519345; x=1737124145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7GH8zDE64afytORyeioFULV1nHRsT7BDsc4aRA2bpQ=;
        b=iBhKDZsiCFKPkfnctn1bDHC/txWiDMis7m+4Sq43nE8UByPfOvg8wUx0kVe4+mxVdK
         D3BJ1CHd7g1odfoqfvtuu15G6PIzgVRFpPSB4KD9x4nWeo8t4/M6UP6+Jm5wmFlot9nV
         gPuHQE2ugH1cthV2o9LmslLCD+qsfUhWZ+VMehPuZjxmYsQWoKr45TQDumN6FrDCEiaP
         AMo6BFfK9A7Z7ZCy+rMenwTa19iaqMSbP8JoZy3mSyuuQSIbqoJjdlyJsWFmg0/0hrwl
         /bMFCTDbgDiRQwSpOP8XXcGzZrJDB345jNyN2wvcqbMTW0hGUc6jcgejiyclNtPShVVE
         kCkA==
X-Gm-Message-State: AOJu0Yz9vAlzGOrGgNtJ84tZgqFnMLATG5hLWMzhbZOjSHv4KPC7d6Rh
	Ju7FsEFY8lC2svKUbEjWaZc4hevbpsQvYTGxw4JqB3UMuZCYm5avDoCgSD55RpU=
X-Gm-Gg: ASbGncsNSeWozMemnRvHjfhC91bEOLAxwDiVLxOeKRr4SDi4IMHWeQTP0t2dwjVKtB/
	Y/uYI6jqhZ63XZGD9w+u5kVnFBA09luFvMoDXyufaLXtTqmkoHvF1k2lpYh7CXJ5ek1j/f8XYsU
	dA30EaCjgHgoaopTbcgc7qdSZc8xmDZSytIBaj9d/Q7FK1J5tCI0TbwP1V1nBkn103lrn5vqUty
	n+Sf2GMviYOsSpeFyAnXm0QaW0RZpphv11o85mWJJjEEXX1qXL4XYel8Tm4fZs4K9A=
X-Google-Smtp-Source: AGHT+IH8z3nw7Uw5PniYGS+wJaEBWc6x1PYAbUzaopy8H3g0c0ZLhU3ZvlIgd5l7gCyQ+3t5zBtYwg==
X-Received: by 2002:a17:907:7fa7:b0:aa6:423c:8514 with SMTP id a640c23a62f3a-ab2abc94ef2mr878732366b.40.1736519344666;
        Fri, 10 Jan 2025 06:29:04 -0800 (PST)
Date: Fri, 10 Jan 2025 15:29:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/18] x86/pv: introduce function to populate
 perdomain area and use it to map Xen GDT
Message-ID: <Z4Eur-PNej2JQAm_@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-5-roger.pau@citrix.com>
 <D6XGAK96L261.324ZJ1U3UO8LF@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D6XGAK96L261.324ZJ1U3UO8LF@cloud.com>

On Thu, Jan 09, 2025 at 09:55:44AM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > The current code to update the Xen part of the GDT when running a PV guest
> > relies on caching the direct map address of all the L1 tables used to map the
> > GDT and LDT, so that entries can be modified.
> >
> > Introduce a new function that populates the per-domain region, either using the
> > recursive linear mappings when the target vCPU is the current one, or by
> > directly modifying the L1 table of the per-domain region.
> >
> > Using such function to populate per-domain addresses drops the need to keep a
> > reference to per-domain L1 tables previously used to change the per-domain
> > mappings.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/domain.c                | 11 +++-
> >  xen/arch/x86/include/asm/desc.h      |  6 +-
> >  xen/arch/x86/include/asm/mm.h        |  2 +
> >  xen/arch/x86/include/asm/processor.h |  5 ++
> >  xen/arch/x86/mm.c                    | 88 ++++++++++++++++++++++++++++
> >  xen/arch/x86/smpboot.c               |  6 +-
> >  xen/arch/x86/traps.c                 | 10 ++--
> >  7 files changed, 113 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 1f680bf176ee..0bd0ef7e40f4 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -1953,9 +1953,14 @@ static always_inline bool need_full_gdt(const struct domain *d)
> >  
> >  static void update_xen_slot_in_full_gdt(const struct vcpu *v, unsigned int cpu)
> >  {
> > -    l1e_write(pv_gdt_ptes(v) + FIRST_RESERVED_GDT_PAGE,
> > -              !is_pv_32bit_vcpu(v) ? per_cpu(gdt_l1e, cpu)
> > -                                   : per_cpu(compat_gdt_l1e, cpu));
> > +    ASSERT(v != current);
> 
> For this assert, and others below. IIUC, curr_vcpu == current when we're
> properly switched. When we're idling current == idle and curr_vcpu == prev_ctx.
> 
> Granted, calling this in the middle of a lazy idle loop would be weird, but
> would it make sense for PT consistency to use curr_vcpu here...

Hm, this function is called in a very specific context, and the assert
intends to reflect that.  TBH I could just drop it, as
populate_perdomain_mapping() will DTRT also when v == current. The
expectation for the context is also that current == curr_vcpu.

Note however that if v == current we would need a flush after the
populate_perdomain_mapping() call, since populate_perdomain_mapping()
doesn't perform any flushing of the modified entries.  The main
purpose of the ASSERT() is to notice this.

> > +
> > +    populate_perdomain_mapping(v,
> > +                               GDT_VIRT_START(v) +
> > +                               (FIRST_RESERVED_GDT_PAGE << PAGE_SHIFT),
> > +                               !is_pv_32bit_vcpu(v) ? &per_cpu(gdt_mfn, cpu)
> > +                                                    : &per_cpu(compat_gdt_mfn,
> > +                                                               cpu), 1);
> >  }
> >  
> >  static void load_full_gdt(const struct vcpu *v, unsigned int cpu)
> > diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
> > index a1e0807d97ed..33981bfca588 100644
> > --- a/xen/arch/x86/include/asm/desc.h
> > +++ b/xen/arch/x86/include/asm/desc.h
> > @@ -44,6 +44,8 @@
> >  
> >  #ifndef __ASSEMBLY__
> >  
> > +#include <xen/mm-frame.h>
> > +
> >  #define GUEST_KERNEL_RPL(d) (is_pv_32bit_domain(d) ? 1 : 3)
> >  
> >  /* Fix up the RPL of a guest segment selector. */
> > @@ -212,10 +214,10 @@ struct __packed desc_ptr {
> >  
> >  extern seg_desc_t boot_gdt[];
> >  DECLARE_PER_CPU(seg_desc_t *, gdt);
> > -DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);
> > +DECLARE_PER_CPU(mfn_t, gdt_mfn);
> >  extern seg_desc_t boot_compat_gdt[];
> >  DECLARE_PER_CPU(seg_desc_t *, compat_gdt);
> > -DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);
> > +DECLARE_PER_CPU(mfn_t, compat_gdt_mfn);
> >  DECLARE_PER_CPU(bool, full_gdt_loaded);
> >  
> >  static inline void lgdt(const struct desc_ptr *gdtr)
> > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> > index 6c7e66ee21ab..b50a51327b2b 100644
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -603,6 +603,8 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> >  int create_perdomain_mapping(struct domain *d, unsigned long va,
> >                               unsigned int nr, l1_pgentry_t **pl1tab,
> >                               struct page_info **ppg);
> > +void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
> > +                                mfn_t *mfn, unsigned long nr);
> >  void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> >                                 unsigned int nr);
> >  void free_perdomain_mappings(struct domain *d);
> > diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
> > index d247ef8dd226..82ee89f736c2 100644
> > --- a/xen/arch/x86/include/asm/processor.h
> > +++ b/xen/arch/x86/include/asm/processor.h
> > @@ -243,6 +243,11 @@ static inline unsigned long cr3_pa(unsigned long cr3)
> >      return cr3 & X86_CR3_ADDR_MASK;
> >  }
> >  
> > +static inline mfn_t cr3_mfn(unsigned long cr3)
> > +{
> > +    return maddr_to_mfn(cr3_pa(cr3));
> > +}
> > +
> >  static inline unsigned int cr3_pcid(unsigned long cr3)
> >  {
> >      return IS_ENABLED(CONFIG_PV) ? cr3 & X86_CR3_PCID_MASK : 0;
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 3d5dd22b6c36..0abea792486c 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -6423,6 +6423,94 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
> >      return rc;
> >  }
> >  
> > +void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
> > +                                mfn_t *mfn, unsigned long nr)
> > +{
> > +    l1_pgentry_t *l1tab = NULL, *pl1e;
> > +    const l3_pgentry_t *l3tab;
> > +    const l2_pgentry_t *l2tab;
> > +    struct domain *d = v->domain;
> > +
> > +    ASSERT(va >= PERDOMAIN_VIRT_START &&
> > +           va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> > +    ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
> > +
> > +    /* Use likely to force the optimization for the fast path. */
> > +    if ( likely(v == current) )
> 
> ... and here? In particular I'd expect using curr_vcpu here means...

I'm afraid not, this is a trap I've fallen originally when doing this
series, as I indeed had v == curr_vcpu here (and no
sync_local_execstate() call).

However as a result of an interrupt, a call to sync_local_execstate()
might happen, at which point the previous check of v == curr_vcpu
becomes stale.

> > +    {
> > +        unsigned int i;
> > +
> > +        /* Ensure page-tables are from current (if current != curr_vcpu). */
> > +        sync_local_execstate();
> 
> ... this should not be needed.

As kind of mentioned above, this is required to ensure the page-tables
are in-sync with the vCPU in current, and cannot change as a result of
an interrupt triggering a call to sync_local_execstate().

Otherwise the page-tables could change while or after the call to
populate_perdomain_mapping(), and the mappings could end up being
created on the wrong page-tables.

Thanks, Roger.

