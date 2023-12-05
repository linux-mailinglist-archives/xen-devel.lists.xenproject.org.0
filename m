Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31152805985
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 17:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648113.1012122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXx5-0005ng-Kz; Tue, 05 Dec 2023 16:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648113.1012122; Tue, 05 Dec 2023 16:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXx5-0005lE-IK; Tue, 05 Dec 2023 16:07:15 +0000
Received: by outflank-mailman (input) for mailman id 648113;
 Tue, 05 Dec 2023 16:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAXx4-0005l8-UH
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 16:07:14 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 597f56a3-9388-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 17:07:12 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33334480eb4so4167462f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 08:07:12 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n5-20020a5d6b85000000b0033342d2bf02sm7179154wrx.25.2023.12.05.08.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 08:07:11 -0800 (PST)
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
X-Inumbo-ID: 597f56a3-9388-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701792432; x=1702397232; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B5AEE3JV8TZ9251nXOW6j62Co0eyKnNRBvPpes+m3Zs=;
        b=Gh1br3HiEEdxA4xkkSoO2zZPpEnTbUUlLfCcmj+L5eNbqGHcpG9RsMer5CHrW5Yhwv
         bYlZT+uVM59Vp1LYYVFUxD2BSqq/fUliN0WwDMfv/WMGgjm+vpiEq0712SWdvoOeLptU
         PTz7tzUHQvFhNc1OXG1N3w4O7XDtvhEJ6aN0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701792432; x=1702397232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5AEE3JV8TZ9251nXOW6j62Co0eyKnNRBvPpes+m3Zs=;
        b=E8iyasCzcKz8Si8aLNmSydhvm+qY5EcfWw5y/2bTGNshDrjCPkP0f/Y2D6vFE4WIeS
         ol0CsICs5npuRHJuRuDQOxwa5v+1ACIBnuOtKAly3668pimXMUSSdQUdUs2uBac2TNuO
         JT28IiP2ZTKj4YD+b0UKx4eqHJD1wSPN27+tdDc78FF5HHRivPgZzggmsotdZLgPUNLw
         8X2vllcIFw3Gx9yYaNL/+fsiJMpF5c0GQVexa1JPFOtnSReHXZJIDeWbe4Tqe+isesuc
         XfMItX/cIn6D9iYIy1cPjjFBDQw+EiJuDkRyDwg13T/pVnDbt8tJo6fvm+pD43b+EWHd
         7mrA==
X-Gm-Message-State: AOJu0YyIXsMzFHcIXUyh72CdUoiBtyWnGpPgJ28YAPerQ7qtdyts2jjA
	Q0jrk0cJaRycoOxVJaFI+dc3MwFU3iglJwi3U/Y=
X-Google-Smtp-Source: AGHT+IHnpCuqcbFctMyL/8Gsa0vyPtKMNGllPhrU7hxgF0cj2jNaj7Y6STua/CwJilMIG5EgzgKzlQ==
X-Received: by 2002:adf:fb42:0:b0:331:41a8:d8f9 with SMTP id c2-20020adffb42000000b0033141a8d8f9mr3384300wrs.35.1701792431362;
        Tue, 05 Dec 2023 08:07:11 -0800 (PST)
Date: Tue, 5 Dec 2023 17:07:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/6] x86/iommu: switch hwdom IOMMU to use a rangeset
Message-ID: <ZW9KrlBechjyJidT@macbook>
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-6-roger.pau@citrix.com>
 <095c2f4c-9b10-4ab8-95ea-101f62096678@suse.com>
 <ZW9FM44pEIn4odkn@macbook>
 <798cfd87-7c10-41e9-a427-c7177da4d063@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <798cfd87-7c10-41e9-a427-c7177da4d063@suse.com>

On Tue, Dec 05, 2023 at 04:47:15PM +0100, Jan Beulich wrote:
> On 05.12.2023 16:43, Roger Pau Monné wrote:
> > On Tue, Dec 05, 2023 at 04:27:05PM +0100, Jan Beulich wrote:
> >> On 04.12.2023 10:43, Roger Pau Monne wrote:
> >>> @@ -476,58 +406,55 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >>>      if ( !map )
> >>>          panic("IOMMU init: unable to allocate rangeset\n");
> >>>  
> >>> -    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
> >>> -    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
> >>> +    if ( iommu_hwdom_inclusive )
> >>> +    {
> >>> +        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
> >>> +        rc = rangeset_add_range(map, 0, max_pfn);
> >>> +        if ( rc )
> >>> +            panic("IOMMU inclusive mappings can't be added: %d\n",
> >>> +                  rc);
> >>> +    }
> >>>  
> >>> -    for ( i = 0, start = 0, count = 0; i < top; )
> >>> +    for ( i = 0; i < e820.nr_map; i++ )
> >>>      {
> >>> -        unsigned long pfn = pdx_to_pfn(i);
> >>> -        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> >>> +        struct e820entry entry = e820.map[i];
> >>>  
> >>> -        if ( !perms )
> >>> -            /* nothing */;
> >>> -        else if ( paging_mode_translate(d) )
> >>> +        switch ( entry.type )
> >>>          {
> >>> -            int rc;
> >>> +        case E820_UNUSABLE:
> >>> +            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) > max_pfn )
> >>> +                continue;
> >>
> >> The !iommu_hwdom_inclusive part isn't really needed here, is it? The ...
> > 
> > Nor the PFN_DOWN(entry.addr) > max_pfn.
> 
> Hmm, I couldn't convince myself that could also be dropped.

We never map unusable regions, so it's always fine to remove them from
the rangeset.  The condition was just a way to exit early and avoid
the rangeset_remove_range() call.

> >>> -            rc = p2m_add_identity_entry(d, pfn,
> >>> -                                        perms & IOMMUF_writable ? p2m_access_rw
> >>> -                                                                : p2m_access_r,
> >>> -                                        0);
> >>> +            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
> >>> +                                       PFN_DOWN(entry.addr + entry.size - 1));
> >>
> >> ... call here would then simply be a no-op, as it looks. And things would
> >> overall look more safe if the removal was skipped for fewer reasons.
> > 
> > OK, the removal can be done unconditionally if so desired.
> > 
> >>> @@ -605,7 +532,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >>>      rangeset_destroy(map);
> >>>  
> >>>      /* Use if to avoid compiler warning */
> >>> -    if ( iommu_iotlb_flush_all(d, flush_flags) )
> >>> +    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
> >>>          return;
> >>>  }
> >>
> >> Ah yes, here is said change. But I think for correctness this wants
> >> moving to the earlier patch.
> > 
> > OK, so something like:
> > 
> > map_data.flush_flags |= flush_flags;
> 
> Or simply drop flush_flags here right away (read: replace by map.flush_flags).

Right, OK, that will lead to some small changes to existing code which
I wanted to avoid in the context of just adding new code to deal with
a rangeset, but anyway, if that's preferred I will adjust.

Thanks, Roger.

