Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A738E805908
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648060.1012003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXaS-00088n-SP; Tue, 05 Dec 2023 15:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648060.1012003; Tue, 05 Dec 2023 15:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXaS-000863-P3; Tue, 05 Dec 2023 15:43:52 +0000
Received: by outflank-mailman (input) for mailman id 648060;
 Tue, 05 Dec 2023 15:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAXaR-00080l-9g
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:43:51 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15531e77-9385-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:43:49 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3334a701cbbso2007935f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:43:49 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 ay10-20020a05600c1e0a00b0040b397787d3sm22831916wmb.24.2023.12.05.07.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:43:48 -0800 (PST)
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
X-Inumbo-ID: 15531e77-9385-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701791029; x=1702395829; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/feExbbIXbtB63BatL1mfmntUZAlic5BaAzXYxCV9r0=;
        b=vOGFeSxofTSfnlZs5i2sayLvQGOBXaGLbd5vIz+jzUMESBUePpIldr/NmLscKx2nol
         zqfY0Sw1jVGAJ1nVx5hmKUTBZM4ZOvdO/QxaqdsSfyW0DhFayL5Tbbk45GKN9b8U7QY0
         sJtKg/SD4qq0s8wT4KQ4fivXtv92zdFTmNyZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791029; x=1702395829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/feExbbIXbtB63BatL1mfmntUZAlic5BaAzXYxCV9r0=;
        b=C60QwNm0AcVsx0znWGjmlrxN7fsyIatiTm5Fkr9/KSWJvLalXSeVIGQrN2iI1sDBvQ
         CDjcZQMi5k2uftpd22n8hoRb/FA7KH4hjzABATHUdzqvluK5NZjBerahJg0EeyRJ5kx7
         AuChPbVWJa7yTyMfV1lfRDIkzeftH0GE0rtfnaZ4JO6hdFE/Slr0lTTSvepvjzI8CZrr
         uWXfDSgpg2BfT+Etg9YJBRmmrhiHDkRCLwUrVhHZOJ9Murv9zuKSjKD79a1WGxVh515Q
         5TZG4TRUTSlJ5YQNJIhbr05IBf0csDaMjz3dv0uzGsPEGhADuGdj+QrztFz/YVhG4vtx
         jGkA==
X-Gm-Message-State: AOJu0YyHPQbdPD+UY7+wVYtecbGVPmECUsgWwJ3Zyuf+mIJnbUTBDksQ
	KxabL5KjpM5be/3O5ZRUr7wPcQ==
X-Google-Smtp-Source: AGHT+IG8NeDUtHz8PmYrShf1CdvjTtD5flIz+eVovetARLjV1sXzl/8SenKBrD3eXbic/FGsKISwIw==
X-Received: by 2002:a7b:c846:0:b0:40b:5e21:c5bc with SMTP id c6-20020a7bc846000000b0040b5e21c5bcmr417492wml.138.1701791028824;
        Tue, 05 Dec 2023 07:43:48 -0800 (PST)
Date: Tue, 5 Dec 2023 16:43:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/6] x86/iommu: switch hwdom IOMMU to use a rangeset
Message-ID: <ZW9FM44pEIn4odkn@macbook>
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-6-roger.pau@citrix.com>
 <095c2f4c-9b10-4ab8-95ea-101f62096678@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <095c2f4c-9b10-4ab8-95ea-101f62096678@suse.com>

On Tue, Dec 05, 2023 at 04:27:05PM +0100, Jan Beulich wrote:
> On 04.12.2023 10:43, Roger Pau Monne wrote:
> > @@ -476,58 +406,55 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >      if ( !map )
> >          panic("IOMMU init: unable to allocate rangeset\n");
> >  
> > -    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
> > -    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
> > +    if ( iommu_hwdom_inclusive )
> > +    {
> > +        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
> > +        rc = rangeset_add_range(map, 0, max_pfn);
> > +        if ( rc )
> > +            panic("IOMMU inclusive mappings can't be added: %d\n",
> > +                  rc);
> > +    }
> >  
> > -    for ( i = 0, start = 0, count = 0; i < top; )
> > +    for ( i = 0; i < e820.nr_map; i++ )
> >      {
> > -        unsigned long pfn = pdx_to_pfn(i);
> > -        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> > +        struct e820entry entry = e820.map[i];
> >  
> > -        if ( !perms )
> > -            /* nothing */;
> > -        else if ( paging_mode_translate(d) )
> > +        switch ( entry.type )
> >          {
> > -            int rc;
> > +        case E820_UNUSABLE:
> > +            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) > max_pfn )
> > +                continue;
> 
> The !iommu_hwdom_inclusive part isn't really needed here, is it? The ...

Nor the PFN_DOWN(entry.addr) > max_pfn.

> > -            rc = p2m_add_identity_entry(d, pfn,
> > -                                        perms & IOMMUF_writable ? p2m_access_rw
> > -                                                                : p2m_access_r,
> > -                                        0);
> > +            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
> > +                                       PFN_DOWN(entry.addr + entry.size - 1));
> 
> ... call here would then simply be a no-op, as it looks. And things would
> overall look more safe if the removal was skipped for fewer reasons.

OK, the removal can be done unconditionally if so desired.

> > @@ -605,7 +532,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >      rangeset_destroy(map);
> >  
> >      /* Use if to avoid compiler warning */
> > -    if ( iommu_iotlb_flush_all(d, flush_flags) )
> > +    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
> >          return;
> >  }
> 
> Ah yes, here is said change. But I think for correctness this wants
> moving to the earlier patch.

OK, so something like:

map_data.flush_flags |= flush_flags;

And adjusting the iommu_iotlb_flush_all() would be fine in this patch
context.

Thanks, Roger.

