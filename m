Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7088A3A2FF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892099.1301110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQcc-0006XJ-J6; Tue, 18 Feb 2025 16:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892099.1301110; Tue, 18 Feb 2025 16:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQcc-0006UB-G2; Tue, 18 Feb 2025 16:38:58 +0000
Received: by outflank-mailman (input) for mailman id 892099;
 Tue, 18 Feb 2025 16:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkQca-0006Su-No
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:38:56 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6c78f49-ee16-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:38:54 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2fc33aef343so7725490a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:38:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98d3b80sm12263624a91.17.2025.02.18.08.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:38:51 -0800 (PST)
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
X-Inumbo-ID: d6c78f49-ee16-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739896732; x=1740501532; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PcQ64fu0fpAV925y5XdgFgTUsrmPkkB0YePEMx7fwg=;
        b=rNuU3CYcaTDCiK9jZWBOpq6uUkek06LTCYY186UODJQgtInIgtgqq8/D8CysWXTc2f
         iSIuZBtGPXfkxJ4rJIshBCITDB99EzTfGslxBrfsTUcUPbco7VbWyQKIZ95cTsQSJCAQ
         1dTe4H4Y0NeuKJouhX1h6tSj2XW1JNxam28a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896732; x=1740501532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PcQ64fu0fpAV925y5XdgFgTUsrmPkkB0YePEMx7fwg=;
        b=KmRcnKt1Z1G0iHp1O9QxqWuc2cUkT2Noi7K1HN+Mfg3OJe+sT3g8FMy4Z5y/QQ9Pq3
         mjW8dNl5WypVmtXwCZ2r1FHdN/rw4/egSFUxhJIoMUCZYJVfXzsy6sHxps9zVdVEdhZ8
         OGHzgpI/R9xLZVNjFiQMr0UHXghppSf20CKPUovdinPxtn59/d5rrj+u7AMLRbW+FPdy
         AVz0zoIH0vd9sc7dv0UBvfLSt2jJq9cvazIO/7zWNQZ57jqoZsxGFq8dMKnlp5NDtZ4Y
         MS5MlUjKL5YmT9BFBJl5jZZhlYYxVaPrDALFXkNuZP70+eIkVD8dnqPVKGcGCqtPVHax
         6okQ==
X-Forwarded-Encrypted: i=1; AJvYcCUREyhc9xEsv8kcA4se2jBMTrQ7+7GqGM8s8YDMzMot+ZBshDzdg61e+7/V4A45bZTFeeZvc0e4fd8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHVh7zpai/brhsmTVVpMhrpIQHLvydM5p6j/DlL9JyRRheZhiU
	6t5auSWGmmbu9pxOBDUjnaQ32CymCUKOpL2jLvcj1GanLJNWy9qHXRtI23+KrR4=
X-Gm-Gg: ASbGncshh1dToL0UbgKgmnFexeyubQ72Cvl8DyHu3uDY33QHdc+dq0byQEYP9s20163
	Iuz0MdC6CMCejNsqcIR/grwTSGkfnF/Zr2NG2Q+QtRd/YxmPMW1ljOvCIFx8DHMuEP7wPRrilIR
	Tyd/t6Xmam9Vv5Rp36Pz5r5v00TOwBQoOKLPFgZ2LAnGAKWeLiWaE2fO0fd0x8bGf5bQX2xB/Zz
	J2iYrX0pCQc0YwVX2R2YFWgTUKRDQMViZxb+CCG/rkUn6Z4663ZcvTg3gcqyXXzeroPXnqUCpea
	F/hvI4XIuvzytLGsNEHS
X-Google-Smtp-Source: AGHT+IHSPA9QkYy1Hg2Ogz73vW09e2HA1RGi3X5cCJKgCOZ35lDOZtjLdII1ajmVRRf8QJM5AeMGnw==
X-Received: by 2002:a17:90b:278b:b0:2f2:8bdd:cd8b with SMTP id 98e67ed59e1d1-2fcb5ac05f1mr85877a91.29.1739896732549;
        Tue, 18 Feb 2025 08:38:52 -0800 (PST)
Date: Tue, 18 Feb 2025 17:38:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/iommu: account for IOMEM caps when populating
 dom0 IOMMU page-tables
Message-ID: <Z7S3l_AWEGrW57VH@macbook.local>
References: <20250217141602.64014-1-roger.pau@citrix.com>
 <20250217141602.64014-2-roger.pau@citrix.com>
 <19888001-ceac-44a8-8d14-cb0dd6d19b2c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19888001-ceac-44a8-8d14-cb0dd6d19b2c@suse.com>

On Tue, Feb 18, 2025 at 04:32:33PM +0100, Jan Beulich wrote:
> On 17.02.2025 15:16, Roger Pau Monne wrote:
> > The current code in arch_iommu_hwdom_init() kind of open-codes the same
> > MMIO permission ranges that are added to the hardware domain ->iomem_caps.
> > Avoid this duplication and use ->iomem_caps in arch_iommu_hwdom_init() to
> > filter which memory regions should be added to the dom0 IOMMU page-tables.
> > 
> > This should result in no change in the memory regions that end up identity
> > mapped in the domain IOMMU page tables.
> > 
> > Note the IO-APIC and MCFG page(s) must be set as not accessible for a PVH
> > dom0, otherwise the internal Xen emulation for those ranges won't work.
> > This requires an adjustment in dom0_setup_permissions().
> > 
> > Also the special casing of E820_UNUSABLE regions no longer needs to be done
> > in arch_iommu_hwdom_init(), as those regions are already blocked in
> > ->iomem_caps and thus would be removed from the rangeset as part of
> > ->iomem_caps processing in arch_iommu_hwdom_init().
> 
> Only almost: ->iomem_caps has them removed only for addresses 1Mb and up.

Right, but we would like to have parity between IOMMU and CPU
page-tables, and hence should also allow IOMMU to map unusable regions
below 1Mb if the CPU is also allowed to map them.  I can tweak the
commit message to note this is done on purpose.

> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -552,7 +552,8 @@ int __init dom0_setup_permissions(struct domain *d)
> >      for ( i = 0; i < nr_ioapics; i++ )
> >      {
> >          mfn = paddr_to_pfn(mp_ioapics[i].mpc_apicaddr);
> > -        if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
> > +        if ( is_hvm_domain(d) ||
> > +             !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
> >              rc |= iomem_deny_access(d, mfn, mfn);
> >      }
> 
> The original code used has_vioapic() and had a comment. At least one of#
> the two would better be transplanted here, I think.

I can indeed switch to has_vioapic() and keep the comment.

> > @@ -593,6 +594,22 @@ int __init dom0_setup_permissions(struct domain *d)
> >              rc |= rangeset_add_singleton(mmio_ro_ranges, mfn);
> >      }
> >  
> > +    /* For PVH dom0 prevent access to MCFG, it's emulated by Xen. */
> > +    if ( is_hvm_domain(d) )
> > +    {
> > +        for ( i = 0; i < pci_mmcfg_config_num; i++ )
> > +        {
> > +            const unsigned long s =
> > +                PFN_DOWN(pci_mmcfg_config[i].address) +
> > +                PCI_BDF(pci_mmcfg_config[i].start_bus_number, 0, 0);
> > +            const unsigned long e =
> > +                PFN_DOWN(pci_mmcfg_config[i].address) +
> > +                PCI_BDF(pci_mmcfg_config[i].end_bus_number, ~0, ~0);
> > +
> > +            rc |= iomem_deny_access(d, s, e);
> > +        }
> > +    }
> 
> Similarly here, the original code used has_vpci() and also had a comment.
> Is there actually a strong reason to replace the original MCFG code?

Hm, I see, I could tweak vpci_subtract_mmcfg() to remove the regions
from ->iomem_cap instead of open-coding here.

> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -320,6 +320,26 @@ static int __hwdom_init cf_check map_subtract(unsigned long s, unsigned long e,
> >      return rangeset_remove_range(map, s, e);
> >  }
> >  
> > +struct handle_iomemcap {
> > +    struct rangeset *r;
> > +    unsigned long last;
> > +};
> > +static int __hwdom_init cf_check map_subtract_iomemcap(unsigned long s,
> > +                                                       unsigned long e,
> > +                                                       void *data)
> > +{
> > +    struct handle_iomemcap *h = data;
> > +    int rc = 0;
> > +
> > +    if ( h->last != s )
> > +        rc = rangeset_remove_range(h->r, h->last, s - 1);
> > +
> > +    /* Be careful with overflows. */
> > +    h->last = max(e + 1, e);
> 
> What overflow could occur here? Addresses are limited to 52 bits; frame
> numbers are limited to 40 bits. And ->iomem_caps starts out with a range
> ending at the last address permitted by paddr_bits.

I was misremembering ->iomem_caps being initialized as [0, ~0UL] for
dom0, but that's not the case.  I can indeed drop the max() here.

> > @@ -475,22 +488,13 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >      if ( rc )
> >          panic("IOMMU failed to remove Xen ranges: %d\n", rc);
> >  
> > -    /* Remove any overlap with the Interrupt Address Range. */
> > -    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> > +    iomem.r = map;
> > +    rc = rangeset_report_ranges(d->iomem_caps, 0, ~0UL, map_subtract_iomemcap,
> > +                                &iomem);
> > +    if ( !rc && iomem.last < ~0UL )
> > +        rc = rangeset_remove_range(map, iomem.last, ~0UL);
> 
> Similarly here I'm wondering about the upper bound of ~0UL. Is this just
> to be on the safe side? And/or just because it's simpler than calculating
> the actual upper bound?

I could use the actual upper bound, as we already use it a bit below
in:

    /* Remove any regions past the last address addressable by the domain. */
    rc = rangeset_remove_range(map, PFN_DOWN(1UL << domain_max_paddr_bits(d)),
                               ~0UL);

However using ~0UL is also correct for the purposes here.

> No ranges above the system physical address width
> should ever be entered into the rangeset. Kind of as an implication
> iomem.last also is guaranteed to be below ~0UL when making it here.

I could add an assert:

ASSERT(iomem.last < PFN_DOWN(1UL << domain_max_paddr_bits(d)));

But then I would need to adjust dom0_setup_permissions() to also use
domain_max_paddr_bits() instead of using paddr_bits for the
->iomem_caps initial max address.  That should likely be a separate
patch on it's own.

Thanks, Roger.

