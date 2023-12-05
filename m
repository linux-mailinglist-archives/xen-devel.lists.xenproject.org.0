Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D768058B0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648026.1011933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXMM-0004HZ-TX; Tue, 05 Dec 2023 15:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648026.1011933; Tue, 05 Dec 2023 15:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXMM-0004El-QU; Tue, 05 Dec 2023 15:29:18 +0000
Received: by outflank-mailman (input) for mailman id 648026;
 Tue, 05 Dec 2023 15:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAXML-0004DQ-1q
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:29:17 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb8d7f8-9383-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:29:16 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c0a11a914so25236315e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:29:16 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 fa10-20020a05600c518a00b00405442edc69sm22659525wmb.14.2023.12.05.07.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:29:15 -0800 (PST)
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
X-Inumbo-ID: 0cb8d7f8-9383-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701790155; x=1702394955; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRMSpPHYDJRHtNqsUE8mJmv8pPspAjwSB3nkhaFy8IY=;
        b=UJmg0OUz76lA/BpADJCqPc6dUXNM5exNVQeAua42a9KfjIOf2u5kpBa1JvhfVRGPo1
         7ktjGcPAwpj+DDH4ODhCBKWg4ktirLzAdzVMzhNgjQV7tBee8Q2AqlKhwSHt39gaABvb
         ppw6Ct6H6AEvW+g2DUHURBNpL70XQWxmJg66w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701790155; x=1702394955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRMSpPHYDJRHtNqsUE8mJmv8pPspAjwSB3nkhaFy8IY=;
        b=MRYTCwJcpWMKLEwDLVkUSx5EVTjhP77dwTBTYHW4rdft2whwH3OYu87M7gXuuUZ1HR
         8rI07gt6VnXmLM3I+R4fUk/f9f3TPHOffyuEEPGR1cb+GlpOkErhAa7n/46YEX1mp6Od
         12GMD7rk6KgnKWj89OBu7IJ33GeqoewikyknaOCsEgMMKKZYkJGeLOj/jGJaNc/YsXgx
         57uQfSd/2lln4btjkZBUZXtVlfySe3HKWwxVVGJtKzh+MDgtTaUK7ByNF/1iyTAq9zKK
         yGXFTLfg5ys9vCZyCTMPgJeG5HkTUJNFmJ9mJnLNYMcnf9MUssel709/QTr/PbwOV3Zk
         V/FA==
X-Gm-Message-State: AOJu0YxZWwGUt3v+Tt5q4Je6XWyHphz9NDkkhRJyHJ180XvemwrpUPLf
	20qx+0Y5av6bEoj5bOV333ssyQ==
X-Google-Smtp-Source: AGHT+IGkpNItnmSvg7PHLlHdYO/n3MJQpKt3XZINL3p1n1Urlg9178h2iC5/uYYR3gn5gxeNBdgdzA==
X-Received: by 2002:a05:600c:a3a0:b0:409:637b:890d with SMTP id hn32-20020a05600ca3a000b00409637b890dmr571933wmb.2.1701790155261;
        Tue, 05 Dec 2023 07:29:15 -0800 (PST)
Date: Tue, 5 Dec 2023 16:29:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/6] x86/iommu: introduce a rangeset to perform hwdom
 IOMMU setup
Message-ID: <ZW9Byij0hlUsVzDL@macbook>
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-4-roger.pau@citrix.com>
 <93b57f96-e47e-493b-b0f4-a8183ba8466f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93b57f96-e47e-493b-b0f4-a8183ba8466f@suse.com>

On Tue, Dec 05, 2023 at 03:50:44PM +0100, Jan Beulich wrote:
> On 04.12.2023 10:43, Roger Pau Monne wrote:
> > This change just introduces the boilerplate code in order to use a rangeset
> > when setting up the hardware domain IOMMU mappings.  The rangeset is never
> > populated in this patch, so it's a non-functional change as far as the mappings
> > the domain gets established.
> > 
> > Note there's a change for HVM domains (ie: PVH dom0) that will get switched to
> > create the p2m mappings using map_mmio_regions() instead of
> > p2m_add_identity_entry(), so that ranges can be mapped with a single function
> > call if possible.  Note that the interface of map_mmio_regions() doesn't allow
> > creating read-only mappings, but so far there are no such mappings created for
> > PVH dom0 in arch_iommu_hwdom_init().
> 
> I don't understand this paragraph: The rangeset remains empty, so nothing is
> changing right here. DYM there is going to be such a change as a result of
> this patch, but in a later part of this series?

Yes, when the rangeset is populated and mappings are created based on
its contents, map_mmio_regions() will be used instead of
p2m_add_identity_entry().  I guess the '... that will get switched to
create the p2m ...' is not clear enough.

> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -370,10 +370,77 @@ static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> >      return perms;
> >  }
> >  
> > +struct map_data {
> > +    struct domain *d;
> > +    unsigned int flush_flags;
> > +    bool ro;
> > +};
> > +
> > +static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
> > +                                              void *data)
> > +{
> > +    struct map_data *info = data;
> > +    struct domain *d = info->d;
> > +    long rc;
> > +
> > +    if ( iommu_verbose )
> > +        printk(XENLOG_INFO " [%010lx, %010lx] R%c\n",
> > +               s, e, info->ro ? 'O' : 'W');
> > +
> > +    if ( paging_mode_translate(d) )
> > +    {
> > +        if ( info->ro )
> > +        {
> > +            ASSERT_UNREACHABLE();
> > +            return 0;
> > +        }
> > +        while ( (rc = map_mmio_regions(d, _gfn(s), e - s + 1, _mfn(s))) > 0 )
> > +        {
> > +            s += rc;
> > +            process_pending_softirqs();
> > +        }
> > +    }
> > +    else
> > +    {
> > +        const unsigned int perms = IOMMUF_readable | IOMMUF_preempt |
> > +                                   (info->ro ? 0 : IOMMUF_writable);
> > +
> > +        if ( info->ro && !iomem_access_permitted(d, s, e) )
> 
> How is r/o-ness related to iomem_access_permitted()? The present callers
> are such that there is a connection, but that's invisible here. I guess
> either the field wants to change name (maybe mmio_ro or ro_mmio or even
> just mmio), or there wants to be a comment.

Will add:

"read-only ranges are only created based on the contents of
mmio_ro_ranges, and hence need the additional iomem_access_permitted()
check."

> > +        {
> > +            /*
> > +             * Should be more fine grained in order to not map the forbidden
> > +             * frame instead of rejecting the region as a whole, but it's only
> > +             * for read-only MMIO regions, which are very limited.
> > +             */
> 
> How certain are you/we that no two adjacent ones may appear, with
> different permissions granted to Dom0?

Yeah, I was already not very convinced by this, and I think the only
solution here is to iterate over the read-only ranges with page
granularity.  In any case read-only ranges are both few and small in
size, hence this is unlikely to be noticeable performance wise.

> > +            printk(XENLOG_DEBUG
> > +                   "IOMMU read-only mapping of region [%lx, %lx] forbidden\n",
> > +                   s, e);
> > +            return 0;
> > +        }
> > +        while ( (rc = iommu_map(d, _dfn(s), _mfn(s), e - s + 1,
> > +                                perms, &info->flush_flags)) > 0 )
> > +        {
> > +            s += rc;
> > +            process_pending_softirqs();
> > +        }
> > +    }
> > +    ASSERT(rc <= 0);
> > +    if ( rc )
> > +        printk(XENLOG_WARNING
> > +               "IOMMU identity mapping of [%lx, %lx] failed: %ld\n",
> > +               s, e, rc);
> > +
> > +    /* Ignore errors and attempt to map the remaining regions. */
> > +    return 0;
> > +}
> > +
> >  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >  {
> >      unsigned long i, top, max_pfn, start, count;
> >      unsigned int flush_flags = 0, start_perms = 0;
> > +    struct rangeset *map;
> > +    struct map_data map_data = { .d = d };
> > +    int rc;
> >  
> >      BUG_ON(!is_hardware_domain(d));
> >  
> > @@ -397,6 +464,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >      if ( iommu_hwdom_passthrough )
> >          return;
> >  
> > +    map = rangeset_new(NULL, NULL, 0);
> > +    if ( !map )
> > +        panic("IOMMU init: unable to allocate rangeset\n");
> > +
> >      max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
> >      top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
> >  
> > @@ -451,6 +522,24 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >              goto commit;
> >      }
> >  
> > +    if ( iommu_verbose )
> > +        printk(XENLOG_INFO "d%u: identity mappings for IOMMU:\n",
> > +               d->domain_id);
> 
> %pd: ?

Indeed, I probably copied this from a different chunk and didn't
adjust to use %pd.

> > +    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
> > +    if ( rc )
> > +        panic("IOMMU unable to create mappings: %d\n", rc);
> > +    if ( is_pv_domain(d) )
> > +    {
> > +        map_data.ro = true;
> > +        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
> > +                                    &map_data);
> > +        if ( rc )
> > +            panic("IOMMU unable to create read-only mappings: %d\n", rc);
> > +    }
> > +
> > +    rangeset_destroy(map);
> 
> This could move up, couldn't it?

Yes, could be moved just after the rangeset_report_ranges(map...)
call.

> >      /* Use if to avoid compiler warning */
> >      if ( iommu_iotlb_flush_all(d, flush_flags) )
> 
> Don't you need to fold map.flush_flags into flush_flags ahead of this call?
> Or can the variable perhaps go away altogether, being replaced by the struct
> field?

Yes, the variable ends up being replaced in a later patch, hence I
didn't touch it here.

Thanks, Roger.

