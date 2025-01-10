Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6652A093BF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869744.1281206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGFi-0005PZ-Cr; Fri, 10 Jan 2025 14:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869744.1281206; Fri, 10 Jan 2025 14:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGFi-0005Nn-9b; Fri, 10 Jan 2025 14:44:46 +0000
Received: by outflank-mailman (input) for mailman id 869744;
 Fri, 10 Jan 2025 14:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWGFg-0005Nh-P2
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:44:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7d081b-cf61-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 15:44:42 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa69107179cso420933866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:44:42 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9562e9bsm174346966b.106.2025.01.10.06.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:44:41 -0800 (PST)
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
X-Inumbo-ID: 6d7d081b-cf61-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736520282; x=1737125082; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HItyJwYzwWv1aKF+MfvXpMBK2lb5hFQpOOyO9Mxzdag=;
        b=DCd9NN6TDcy2b7/nEPDMHMniPMvSa8PeG7u+CdGgSyiW3DfuR5mYNvv2WqT9Ln0Cof
         Ug/C6j0XW+Ajtm/d4hRUG2Qd4FJpNg79izfrysvnHtW8vxfjKQQjGmGJ7zMRTgggc0Jo
         qfJVuqc1v3k1UeanmKeNgmmovr3yWKNVjh/bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736520282; x=1737125082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HItyJwYzwWv1aKF+MfvXpMBK2lb5hFQpOOyO9Mxzdag=;
        b=OnPWQohlkUg4i7HB/2Qb8wBvwizspXOq5M/GVQZE0zfPMwVdZ5ypOGUxjyC5HL13vP
         uzWw6xoB7j09Zxw2emgcKwSPZHa08j+r0kYBLGgEGXTjMlQJmw0NPK7GPcO1EHfHFxTN
         MTmtH+MOVwsCnStg9nevD0X9hx2GSb4PK+69+DxE75GInDLB9azVdnlIZKcDf7xHWZDg
         IxJJkfJd4chUnlSJHFD4S/nHKmxDU8rboX0X8Xv1GnAZpR0GBU6plP6r7lpy1OderhPm
         l8bTjZViknqHJD/S0u+lpo2ursm7fMAdoZKZLP5wpY/tZyQWsktBNFK+ildNIHf15cyS
         wAHw==
X-Gm-Message-State: AOJu0YzR+sJUy+UJFazANP5DhKo8rPVkqyKE0Ji4qOSJJkJbty4QvsYW
	QlSGfUTZ+c+XGp9UI2q0vPV4lN4fQJVZiijdyUKtxOZjnzTjlISzL5rYQH3nmBc=
X-Gm-Gg: ASbGnct3zdcgbGFb0QTOEd2sTgZw9BpfpmUH8URCC3MxumsXUESZBrKsbMgfQFVs2h4
	uvM/2ee/zQ6mp5i32jxpHA+CH3fyp7q+yXVug/gWPa1vFf45XOin/hSAE9i5gbmgvR3wMbX2Ygl
	2FMSIE51WCrwtTzGIh2yT9M3+qtaIr2prcbSrExemFOQXM92G2fQOy6+I9BsLljKAV2+l11HdS3
	rKJz5WCV1XZ5xM1Iuo6X5n5B3TXAorsw08fMxY5f0kn3K5/FbB8wfLoohUIQh8yd1U=
X-Google-Smtp-Source: AGHT+IGdsFUacA3FSvLpjIwIa+cW5xMcQBSRuUNUw0dRL0Ot/VyT65vyNLL/M8TbTV0TjHtmz3SBiA==
X-Received: by 2002:a17:907:c0c:b0:aae:8490:9429 with SMTP id a640c23a62f3a-ab2ab6fd4c3mr761680766b.34.1736520282275;
        Fri, 10 Jan 2025 06:44:42 -0800 (PST)
Date: Fri, 10 Jan 2025 15:44:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 07/18] x86/pv: update guest LDT mappings using the
 linear entries
Message-ID: <Z4EyWLde4lHH-2Sm@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-8-roger.pau@citrix.com>
 <D6XM7OP0SQPB.3U12X09JAPKU3@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D6XM7OP0SQPB.3U12X09JAPKU3@cloud.com>

On Thu, Jan 09, 2025 at 02:34:05PM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > The pv_map_ldt_shadow_page() and pv_destroy_ldt() functions rely on the L1
> > table(s) that contain such mappings being stashed in the domain structure, and
> > thus such mappings being modified by merely updating the require L1 entries.
> >
> > Switch pv_map_ldt_shadow_page() to unconditionally use the linear recursive, as
> > that logic is always called while the vCPU is running on the current pCPU.
> >
> > For pv_destroy_ldt() use the linear mappings if the vCPU is the one currently
> > running on the pCPU, otherwise use destroy_mappings().
> >
> > Note this requires keeping an array with the pages currently mapped at the LDT
> > area, as that allows dropping the extra taken page reference when removing the
> > mappings.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/include/asm/domain.h   |  2 ++
> >  xen/arch/x86/pv/descriptor-tables.c | 19 ++++++++++---------
> >  xen/arch/x86/pv/domain.c            |  4 ++++
> >  xen/arch/x86/pv/mm.c                |  3 ++-
> >  4 files changed, 18 insertions(+), 10 deletions(-)
> >
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> > index b79d6badd71c..b659cffc7f81 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -523,6 +523,8 @@ struct pv_vcpu
> >      struct trap_info *trap_ctxt;
> >  
> >      unsigned long gdt_frames[FIRST_RESERVED_GDT_PAGE];
> > +    /* Max LDT entries is 8192, so 8192 * 8 = 64KiB (16 pages). */
> > +    mfn_t ldt_frames[16];
> >      unsigned long ldt_base;
> >      unsigned int gdt_ents, ldt_ents;
> >  
> > diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
> > index 5a79f022ce13..95b598a4c0cf 100644
> > --- a/xen/arch/x86/pv/descriptor-tables.c
> > +++ b/xen/arch/x86/pv/descriptor-tables.c
> > @@ -20,28 +20,29 @@
> >   */
> >  bool pv_destroy_ldt(struct vcpu *v)
> >  {
> > -    l1_pgentry_t *pl1e;
> > +    const unsigned int nr_frames = ARRAY_SIZE(v->arch.pv.ldt_frames);
> >      unsigned int i, mappings_dropped = 0;
> > -    struct page_info *page;
> >  
> >      ASSERT(!in_irq());
> >  
> >      ASSERT(v == current || !vcpu_cpu_dirty(v));
> >  
> > -    pl1e = pv_ldt_ptes(v);
> > +    destroy_perdomain_mapping(v, LDT_VIRT_START(v), nr_frames);
> >  
> > -    for ( i = 0; i < 16; i++ )
> > +    for ( i = 0; i < nr_frames; i++ )
> 
> nit: While at this, can the "unsigned int" be moved here too?

I don't mind much, but I also don't usually do such changes as I think
it adds more noise.

> >      {
> > -        if ( !(l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) )
> > -            continue;
> > +        mfn_t mfn = v->arch.pv.ldt_frames[i];
> > +        struct page_info *page;
> >  
> > -        page = l1e_get_page(pl1e[i]);
> > -        l1e_write(&pl1e[i], l1e_empty());
> > -        mappings_dropped++;
> > +        if ( mfn_eq(mfn, INVALID_MFN) )
> > +            continue;
> 
> Can it really be disjoint? As in, why "continue" and not "break"?. Not that it
> matters in the slightest, and I prefer this form; but I'm curious.

I think so?  The PV guest LDT is populated as a result of page-faults,
so if the guest only happens to use segment descriptors that are on
the third page, the second page might not be mapped?

The continue was there already, and I really didn't dare to change
this, neither asked myself much.  Assumed due to how the guest LDT is
mapped on a page-fault basis it could indeed be disjointly mapped.

> >  
> > +        v->arch.pv.ldt_frames[i] = INVALID_MFN;
> > +        page = mfn_to_page(mfn);
> >          ASSERT_PAGE_IS_TYPE(page, PGT_seg_desc_page);
> >          ASSERT_PAGE_IS_DOMAIN(page, v->domain);
> >          put_page_and_type(page);
> > +        mappings_dropped++;
> >      }
> >  
> >      return mappings_dropped;
> > diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> > index 7e8bffaae9a0..32d7488cc186 100644
> > --- a/xen/arch/x86/pv/domain.c
> > +++ b/xen/arch/x86/pv/domain.c
> > @@ -303,6 +303,7 @@ void pv_vcpu_destroy(struct vcpu *v)
> >  int pv_vcpu_initialise(struct vcpu *v)
> >  {
> >      struct domain *d = v->domain;
> > +    unsigned int i;
> >      int rc;
> >  
> >      ASSERT(!is_idle_domain(d));
> > @@ -311,6 +312,9 @@ int pv_vcpu_initialise(struct vcpu *v)
> >      if ( rc )
> >          return rc;
> >  
> > +    for ( i = 0; i < ARRAY_SIZE(v->arch.pv.ldt_frames); i++ )
> > +        v->arch.pv.ldt_frames[i] = INVALID_MFN;
> > +
> 
> I think it makes more sense to move this earlier so ldt_frames[] is initialised
> even if pv_vcpu_initialise() fails. It may be benign, but it looks like an
> accident abount to happen.

Right, pv_destroy_gdt_ldt_l1tab() doesn't care at all about the
contents of ldt_frames[], but it will be safe to do change the
ordering in pv_vcpu_initialise().

Thanks, Roger.

