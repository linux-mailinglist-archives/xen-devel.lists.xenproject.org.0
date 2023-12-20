Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C9819BB6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657580.1026526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtFG-00043h-KQ; Wed, 20 Dec 2023 09:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657580.1026526; Wed, 20 Dec 2023 09:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtFG-00040R-H3; Wed, 20 Dec 2023 09:52:06 +0000
Received: by outflank-mailman (input) for mailman id 657580;
 Wed, 20 Dec 2023 09:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFtFF-00040L-DJ
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:52:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d2e72d7-9f1d-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:52:03 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c3f68b69aso51097265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:52:03 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 t18-20020adfa2d2000000b003364aa5cc13sm2226975wra.1.2023.12.20.01.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 01:52:02 -0800 (PST)
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
X-Inumbo-ID: 6d2e72d7-9f1d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703065922; x=1703670722; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SnJKypEl/WD0+g/FIUAtukmBZWfKCXQm/bsKob1J2AA=;
        b=u4+Mv8ex9bUQXF4Swl0jHtlj7y3hWv4mQbCqI6UmcvtII8R6RV6GFt20uM74Jfpxfd
         6i+Q6C1XdQr9muAyVF4TlyjS35isG3SdT+YOfM+ARMNS0t/fihFQUkZZg5YgyieHl+pv
         56Gk5jciXxA+Z+YnbelIJjZs5qK/Vy5VZDkZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065922; x=1703670722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnJKypEl/WD0+g/FIUAtukmBZWfKCXQm/bsKob1J2AA=;
        b=Jmr/O1UOe6thWI3jNqOWsp71MIGhPbg8JZm7nuXjFII6pdB3cvueeyV8shOUdn+8l+
         fncKPG+QhK2KMW2PQ63BZB7d5XLna+Ra98t7ugEBYFSHH7dZuSQxM0jMuIWn5p5XkLqB
         MjU2zp4ho8XLL0WJl4iNYfuBpoS4PaRrscurp+GMv54m3G29IbSFCzmIe4elF/9Ln/GP
         nZyUeXh5285E1MCi6/xqJXCKo2Ch12KUxwdHP/ApYzJm8kVqQwHIVbH5WQ1XoeXn51Ef
         uqKLCudDXcE1v/P+RBbYKOLdhKqJFqngC24ku0rmuesyjBWh33u0clq8D3gL4K015U9Q
         K2Zw==
X-Gm-Message-State: AOJu0Yx9AUwNH/W+9gCclP+afebtf0kxxyVtySsrlfWcl62QTzc3OAfm
	4VGYCnSg5bqcBztpcylV/Q59fw==
X-Google-Smtp-Source: AGHT+IF2hYoBblevT/tpo0rtMSzBrmIYtFmy8l8JUuasAokpMmBEWrr/V8Hz8zq0ukAWV5gQJTiX7g==
X-Received: by 2002:a05:600c:3784:b0:40b:5e1b:54a8 with SMTP id o4-20020a05600c378400b0040b5e1b54a8mr10555472wmr.52.1703065922524;
        Wed, 20 Dec 2023 01:52:02 -0800 (PST)
Date: Wed, 20 Dec 2023 10:52:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/7] x86/iommu: introduce a rangeset to perform hwdom
 IOMMU setup
Message-ID: <ZYK5QXmbHhxKdS31@macbook>
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-5-roger.pau@citrix.com>
 <454027bf-b07e-49cf-97de-009d431e5f4b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <454027bf-b07e-49cf-97de-009d431e5f4b@suse.com>

On Tue, Dec 19, 2023 at 05:06:32PM +0100, Jan Beulich wrote:
> On 15.12.2023 15:18, Roger Pau Monne wrote:
> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -370,10 +370,88 @@ static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> >      return perms;
> >  }
> >  
> > +struct map_data {
> > +    struct domain *d;
> > +    unsigned int flush_flags;
> > +    bool mmio_ro;
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
> > +               s, e, info->mmio_ro ? 'O' : 'W');
> > +
> > +    if ( paging_mode_translate(d) )
> > +    {
> > +        if ( info->mmio_ro )
> > +        {
> > +            ASSERT_UNREACHABLE();
> > +            return 0;
> 
> Is this meant to be in line with the main return statement's comment?
> I'm inclined to ask for an actual error code (-EOPNOTSUPP?) here.

Hm, yes, for that one it might make sense to return -EOPNOTSUPP, as
all attempts to map will end up failing anyway.

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
> > +                                   (info->mmio_ro ? 0 : IOMMUF_writable);
> > +
> > +        /*
> > +         * Read-only ranges are only created based on the contents of mmio
> > +         * read-only rangeset, and hence need the additional iomem permissions
> > +         * check.
> > +         */
> > +        while( info->mmio_ro && s <= e && !iomem_access_permitted(d, s, e) )
> 
> Nit: Missing blank after "while".
> 
> > +        {
> > +            /*
> > +             * Consume a frame per iteration until the reminder is accessible
> 
> Nit: remainder?
> 
> > +             * or there's nothing left to map.
> > +             */
> > +            if ( iomem_access_permitted(d, s, s) )
> > +            {
> > +                rc = iommu_map(d, _dfn(s), _mfn(s), 1, perms,
> > +                               &info->flush_flags);
> > +                if ( rc < 0 )
> > +                    break;
> > +                /* Must map a frame at least, which is what we request for. */
> > +                ASSERT(rc == 1);
> > +                process_pending_softirqs();
> > +            }
> > +            s++;
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
> > @@ -397,6 +475,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
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
> > @@ -451,8 +533,26 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >              goto commit;
> >      }
> >  
> > +    if ( iommu_verbose )
> > +        printk(XENLOG_INFO "%pd: identity mappings for IOMMU:\n", d);
> > +
> > +    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
> > +    if ( rc )
> > +        panic("IOMMU unable to create mappings: %d\n", rc);
> > +    rangeset_destroy(map);
> > +
> > +    if ( is_pv_domain(d) )
> > +    {
> > +        map_data.mmio_ro = true;
> > +        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
> > +                                    &map_data);
> > +        if ( rc )
> > +            panic("IOMMU unable to create read-only mappings: %d\n", rc);
> > +    }
> 
> As it stands identity_map() deliberately returns no error. Yet here
> you panic() in case of receiving an error, despite that being impossible?

I wasn't sure whether rangeset_report_ranges() itself could return an
error.  Thinking twice, we might want to print a message and attempt
to continue, as in the worst case dom0 might be missing maps.

> Also if we want/need to panic() here, can we avoid having two instances
> of almost the same string literal in .rodata? Along the lines of
> 
>     rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
>     rangeset_destroy(map);
>     if ( !rc && is_pv_domain(d) )
>     {
>         map_data.mmio_ro = true;
>         rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
>                                     &map_data);
>     }
>     if ( rc )
>         panic("IOMMU unable to create %smappings: %d\n",
>               map_data.mmio_ro ? "read-only " : "", rc);
> 
> ?
> 
> > +    map_data.flush_flags |= flush_flags;
> 
> So you decided to still keep the standalone "flush_flags" around. Is
> there a particular reason?

Oh, git distracted with the other changes and forgot about this one.

Thanks, Roger.

