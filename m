Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9560819CA4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 11:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657599.1026554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtih-0007Sg-Ay; Wed, 20 Dec 2023 10:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657599.1026554; Wed, 20 Dec 2023 10:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtih-0007Qx-86; Wed, 20 Dec 2023 10:22:31 +0000
Received: by outflank-mailman (input) for mailman id 657599;
 Wed, 20 Dec 2023 10:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFtig-0007Qr-8c
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 10:22:30 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd7ffdc-9f21-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 11:22:28 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d3748f345so3459465e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 02:22:27 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040c11fbe581sm6801609wmq.27.2023.12.20.02.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 02:22:27 -0800 (PST)
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
X-Inumbo-ID: acd7ffdc-9f21-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703067747; x=1703672547; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z3JfBbR0a4QYvbdHVn7Xh+Bpjd9UUuKh/RGcGzhdZ2g=;
        b=ED67wtNJVIuAlFBHhJWhnv4z7B1GIgXeIGJOrwYguEDei6bNT/Bk5w+hKilFwmNkff
         025slyZ9FShvtXsFvmqm5Xe0L38xxpR9yKXzhFgjfUO7ZR5Q9zGg0JKhLhylMylYJ9yU
         aezu2CBz+D1Erd/9/3npi6F146KFL3222/Eow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703067747; x=1703672547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3JfBbR0a4QYvbdHVn7Xh+Bpjd9UUuKh/RGcGzhdZ2g=;
        b=AndAxDeH8MZlWLQk3PGImgkPx64yuUd/T/NX1z++JUq/gZ4jSvW9O4IvKneUlgwivF
         KgteSEZBQzBrFLCDmhkRnqpT7VrBJmkr71omtD7A/5PfBxT4GkWexIq8z2qtBFsZo9HB
         G2EoGKK5ekk2e2uu5QZdWpTjmeTcUqdP8uoDd6N2/eSS9Ql6U9L2ZgctXI5M0Wyf4UkE
         h/8RpR6gPgbm/aVoUPAPMC8wiZs7jaC06yEy329GcdHfsNtSaG+eaUO/tNQekMKXzD+g
         +D461N82XF3g/ezWk/BANF3IVTNoQt+cN7c2pBkFOrNHIAQLheyWWIC6pF58ZuIZOLks
         /jFQ==
X-Gm-Message-State: AOJu0YwZFIRyuSjGCDLZvK3SUTcKCDChy9xR8sh6cjUpYejlUAXoHyWh
	NuD4KSOEmDJE15VToFMnszkRKQ==
X-Google-Smtp-Source: AGHT+IERCeEy7q1BOXR1MgKe6C9yPzAwr1XOztWvsqiGTvCJdqFjrdJE/pg6p6tR3PJwOyBFR1ZQRw==
X-Received: by 2002:a05:600c:3105:b0:40c:46eb:e6ad with SMTP id g5-20020a05600c310500b0040c46ebe6admr8502281wmo.175.1703067747331;
        Wed, 20 Dec 2023 02:22:27 -0800 (PST)
Date: Wed, 20 Dec 2023 11:22:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 5/7] x86/iommu: remove regions not to be mapped
Message-ID: <ZYLAYtenu3bWOfUU@macbook>
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-6-roger.pau@citrix.com>
 <2966f31a-8390-46fd-84c5-c424382dff29@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2966f31a-8390-46fd-84c5-c424382dff29@suse.com>

On Tue, Dec 19, 2023 at 05:18:39PM +0100, Jan Beulich wrote:
> On 15.12.2023 15:18, Roger Pau Monne wrote:
> > Introduce the code to remove regions not to be mapped from the rangeset
> > that will be used to setup the IOMMU page tables for the hardware domain.
> > 
> > This change also introduces two new functions: remove_xen_ranges() and
> > vpci_subtract_mmcfg() that copy the logic in xen_in_range() and
> > vpci_is_mmcfg_address() respectively and remove the ranges that would otherwise
> > be intercepted by the original functions.
> > 
> > Note that the rangeset is still not populated.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > @@ -533,6 +541,62 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >              goto commit;
> >      }
> >  
> > +    /* Remove any areas in-use by Xen. */
> > +    rc = remove_xen_ranges(map);
> > +    if ( rc )
> > +        panic("IOMMU failed to remove Xen ranges: %d\n", rc);
> > +
> > +    /* Remove any overlap with the Interrupt Address Range. */
> > +    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> > +    if ( rc )
> > +        panic("IOMMU failed to remove Interrupt Address Range: %d\n",
> > +              rc);
> > +
> > +    /* If emulating IO-APIC(s) make sure the base address is unmapped. */
> > +    if ( has_vioapic(d) )
> > +    {
> > +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> > +        {
> > +            rc = rangeset_remove_singleton(map,
> > +                PFN_DOWN(domain_vioapic(d, i)->base_address));
> > +            if ( rc )
> > +                panic("IOMMU failed to remove IO-APIC: %d\n",
> > +                      rc);
> > +        }
> > +    }
> > +
> > +    if ( is_pv_domain(d) )
> > +    {
> > +        /*
> > +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> > +         * ones there (also for e.g. HPET in certain cases), so it should also
> > +         * have such established for IOMMUs.  Remove any read-only ranges here,
> > +         * since ranges in mmio_ro_ranges are already explicitly mapped below
> > +         * in read-only mode.
> > +         */
> > +        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, map_subtract, map);
> 
> I find it a little odd that you iterate over mmio_ro_ranges twice (once
> here, once in what the earlier patch added), but I guess overall it's
> easier this way.

Given the number of ranges in the MMIO RO rangeset, I'm not sure
there's much reason to attempt to optimize this at the cost of making
the code harder to read.

> Also, nit: Either this line is too long, or ...
> 
> > +        if ( rc )
> > +            panic("IOMMU failed to remove read-only regions: %d\n",
> > +                  rc);
> 
> ... there's no need to wrap lines here.

No need to wrap indeed.

Thanks, Roger.

