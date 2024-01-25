Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D483BC42
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 09:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671395.1044714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSvOK-000536-Lg; Thu, 25 Jan 2024 08:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671395.1044714; Thu, 25 Jan 2024 08:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSvOK-00050e-IT; Thu, 25 Jan 2024 08:47:20 +0000
Received: by outflank-mailman (input) for mailman id 671395;
 Thu, 25 Jan 2024 08:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSvOI-00050U-Vq
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 08:47:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57a3005b-bb5e-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 09:47:16 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55a45a453eeso8132757a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 00:47:17 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05640205d400b0055d07073cc6sm210687edx.80.2024.01.25.00.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 00:47:16 -0800 (PST)
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
X-Inumbo-ID: 57a3005b-bb5e-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706172436; x=1706777236; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOPKVww7bzuKHViPxmqAo+KZYz+GyO21TmYZk/zuNNM=;
        b=XX/fyuNbZNNxDOU3w29C2rV3GYL5zZlfcDj+op4psfH3uutyD2pF81TUB2i3H/+Bof
         hkdRcbJfvWCTcvmBEVNZ5jwvWpCcJe/mkOJ8JV9UvFHbz985rrbwdrR00OnFw3AQZK74
         BpxzlEB4urj05fs3uoFD+6v6+rK2vb1r5TsXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706172436; x=1706777236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOPKVww7bzuKHViPxmqAo+KZYz+GyO21TmYZk/zuNNM=;
        b=qYcWmY5t0IVT78uX24E/gPeqWtQ0kU1ijD+jvtMFpjItDJQKfqruCImLR5tb0zuPJx
         9eOWlypzsChK6loSJnXy508vmUF5rEIgp1KRyhWwFUssiS0j4u3QQQ9mBx9JA6sLAMbP
         QE1k2lk9JMXvFLL6y4eMbQLNYmZR/ncZ/vUz4bgV+l6kjahJqaGRiRGn1l3M7LZHzNDr
         4I6E5Yz88O4Osx/R3JbWrb02B8lkCVw9c88DOsx8/WSbu0rREDgSdumhUflgLjZUEMPb
         j9THh8UVZCYQFp97bNvLKrGffd+MzkPO08Soec5OrGAe7Fk24KvzKkK9K7lw0mjmQvpH
         TbUA==
X-Gm-Message-State: AOJu0Yy4fEH4aQ0WrMwq8sUbmeuQP9HvVxFq3UA9WUOTuc+Erq+t+QaC
	k2SSyEnoxi1z2NTF6BtHio3D51ObSzCd6YyrNcyuFCxtPInejrAEpsNgzAYRe5o=
X-Google-Smtp-Source: AGHT+IFpLUCv/rnBIyP18spKrrYjzTOcMsiBBxznXs5pn/MgWBw2fqcsJ08xEH2q/Nwb54KDe0gpuQ==
X-Received: by 2002:a50:9f03:0:b0:559:e715:8424 with SMTP id b3-20020a509f03000000b00559e7158424mr456845edf.31.1706172436583;
        Thu, 25 Jan 2024 00:47:16 -0800 (PST)
Date: Thu, 25 Jan 2024 09:47:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/3] x86/iommu: remove regions not to be mapped
Message-ID: <ZbIgE8exXDVicN8D@macbook>
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-2-roger.pau@citrix.com>
 <ad178469-15c3-4ae5-8538-e927f1116a42@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad178469-15c3-4ae5-8538-e927f1116a42@suse.com>

On Thu, Jan 25, 2024 at 09:34:40AM +0100, Jan Beulich wrote:
> On 24.01.2024 18:29, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/io.c
> > +++ b/xen/arch/x86/hvm/io.c
> > @@ -369,6 +369,22 @@ bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
> >      return vpci_mmcfg_find(d, addr);
> >  }
> >  
> > +int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
> > +{
> > +    const struct hvm_mmcfg *mmcfg;
> > +
> > +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
> > +    {
> > +        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
> > +                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
> 
> Along the lines of this, ...
> 
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
> >      return 0;
> >  }
> >  
> > +int __hwdom_init remove_xen_ranges(struct rangeset *r)
> > +{
> > +    paddr_t start, end;
> > +    int rc;
> > +
> > +    /* S3 resume code (and other real mode trampoline code) */
> > +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> > +                               PFN_DOWN(bootsym_phys(trampoline_end)) - 1);
> 
> ... did you perhaps mean
> 
>                                PFN_DOWN(bootsym_phys(trampoline_end) - 1));
> 
> here (and then similarly below, except there the difference is benign I
> think, for the labels being page-aligned)?

They are all page aligned, so I didn't care much,  but now that you
point it might be safer to do the subtraction from the address instead
of the frame number, just in case.

Thanks, Roger.

