Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF917F10A7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 11:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636556.992157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51kz-0004gV-PE; Mon, 20 Nov 2023 10:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636556.992157; Mon, 20 Nov 2023 10:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51kz-0004eU-MT; Mon, 20 Nov 2023 10:43:57 +0000
Received: by outflank-mailman (input) for mailman id 636556;
 Mon, 20 Nov 2023 10:43:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r51ky-0004eO-38
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 10:43:56 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2c2c0b7-8791-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 11:43:53 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-332c09c0b0bso970508f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 02:43:53 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b0032db8cccd3asm10771113wrs.114.2023.11.20.02.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 02:43:52 -0800 (PST)
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
X-Inumbo-ID: b2c2c0b7-8791-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700477033; x=1701081833; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=umpjuc/Rc6hGwHbS9lYBNpRJxB5vV77ZbHQvbSHmESs=;
        b=rGt3hBs6bWk9E0bwGOmo5CMItFk2gcUx7KZsY+Zmc5CcJb+kYM3R2RtN3WIwp9dwYl
         LULjcDwweEel5+K+rYbj1ag7LEupRr7cLNfa8cnez+v4RC+ztT9tPxbUqeUn7BuwyjRg
         KxcecUI1DBqEdLGqOWeNDN0hxyKDLfloJQgiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700477033; x=1701081833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umpjuc/Rc6hGwHbS9lYBNpRJxB5vV77ZbHQvbSHmESs=;
        b=rtvYENPSHSMH2siyYs47LdFTDzIwFDt1X/HdSgeppX1xir8NRol6qzhQ7QLZAqw9Pr
         VRSQHC1NxYtWRofGRS9J4/bAUBlRuyCfd2swarlXz82Im46eBI6PU/KgqjqyO+mK6Pzh
         PJe+ROdMHn6y+iYd/s/Xlo1qjVbcs1Wbz7z9BFEve8Sqy8EMfoVzTQj/wV1/+gVMYlcq
         mGfpKjHPq9eyh1v1l1e9sEXEi2z/9U0Uy56W+VU/12T4XBI0rWPsdl8bCYPEokzAJL8I
         81zl6gP44Sx7qByUcJy5lhNKALHAni1+ekUj9zz7XYm4/93ecOtOB1hK1ZhRhDbf2mZm
         hgWQ==
X-Gm-Message-State: AOJu0YwJ1ZnQeVv2XB6s1grkYi9Nzpjn8AIZv12n16J6zt1KHCEaeVii
	Y/LDJyGnRXkR1qA4tQhXcOw5Pw==
X-Google-Smtp-Source: AGHT+IHyHbgtobVHk2o+qyCbOHF7iPFestbsKNteHUiw4Wlip8ZpFu4gGIvHaS+ZUNVAG9S7C2k2Mw==
X-Received: by 2002:adf:8bdd:0:b0:332:c7cf:b473 with SMTP id w29-20020adf8bdd000000b00332c7cfb473mr1428070wra.1.1700477033016;
        Mon, 20 Nov 2023 02:43:53 -0800 (PST)
Date: Mon, 20 Nov 2023 11:43:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] x86/iommu: use a rangeset for hwdom setup
Message-ID: <ZVs4aIQwm2TuwIwW@macbook.local>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-4-roger.pau@citrix.com>
 <412f695a-d1f8-4ae3-920e-023428c63059@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <412f695a-d1f8-4ae3-920e-023428c63059@suse.com>

On Mon, Nov 20, 2023 at 11:30:16AM +0100, Jan Beulich wrote:
> On 17.11.2023 10:47, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/io.c
> > +++ b/xen/arch/x86/hvm/io.c
> > @@ -364,9 +364,20 @@ static const struct hvm_mmcfg *vpci_mmcfg_find(const struct domain *d,
> >      return NULL;
> >  }
> >  
> > -bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
> > +int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
> 
> While there, also add __hwdom_init?
> 
> > @@ -447,62 +451,135 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >      if ( iommu_hwdom_passthrough )
> >          return;
> >  
> > -    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
> > -    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
> > +    map = rangeset_new(NULL, NULL, 0);
> > +    if ( !map )
> > +        panic("IOMMU initialization failed unable to allocate rangeset\n");
> 
> This reads a little odd, and could probably do with shortening anyway
> (e.g. "IOMMU init: unable to allocate rangeset\n").
> 
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
> It's > here, but ...
> 
> > -            rc = p2m_add_identity_entry(d, pfn,
> > -                                        perms & IOMMUF_writable ? p2m_access_rw
> > -                                                                : p2m_access_r,
> > -                                        0);
> > +            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
> > +                                       PFN_DOWN(entry.addr + entry.size - 1));
> >              if ( rc )
> > -                printk(XENLOG_WARNING
> > -                       "%pd: identity mapping of %lx failed: %d\n",
> > -                       d, pfn, rc);
> > +                panic("IOMMU failed to remove unusable memory: %d\n",
> > +                      rc);
> > +            continue;
> > +
> > +        case E820_RESERVED:
> > +            if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> > +                continue;
> > +            break;
> > +
> > +        case E820_RAM:
> > +            if ( iommu_hwdom_strict )
> > +                continue;
> > +            break;
> > +
> > +        default:
> > +            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) >= max_pfn )
> > +                continue;
> 
> ... >= here?

Oh, this was a leftover from a previous slightly different logic,
there's no need for such default case anymore, as the whole range
below 4GB is already added to the rangeset in the inclusive case, and
holes are poked for unusable regions.

> > +            entry.size = pfn_to_paddr(max_pfn) - 1 - entry.addr;
> 
> Why the subtraction of 1 when you're calculating size? Don't you actually
> need to add 1 to max_pfn before converting to paddr?

Previous code didn't had the - 1 in max_pfn definition, but again the
default case is no longer needed.

> 
> While overall things look plausible elsewhere, I'm hoping that - as asked
> for by Andrew - it'll be possible to split this some, to make it a little
> more reasonable to actually look at the changes done.

Will try to split it somehow.

Thanks, Roger.

