Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9383A405
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670760.1043744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYWE-0004Uy-CU; Wed, 24 Jan 2024 08:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670760.1043744; Wed, 24 Jan 2024 08:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYWE-0004Rn-9s; Wed, 24 Jan 2024 08:21:58 +0000
Received: by outflank-mailman (input) for mailman id 670760;
 Wed, 24 Jan 2024 08:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSYWD-0004Rf-4a
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:21:57 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2cd8e36-ba91-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 09:21:56 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40ec6a251a6so2641775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:21:56 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 w11-20020adfec4b000000b003392bfcf508sm9627681wrn.29.2024.01.24.00.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 00:21:55 -0800 (PST)
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
X-Inumbo-ID: a2cd8e36-ba91-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706084515; x=1706689315; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P4UmGzzVLHAGCOfMTNJuI1YfNA+8XwSE56/Ppn8LxxE=;
        b=VDFurrZJh+mr7KjGRi71Rdhwi9c5bu6ok33rCtgFacAN6UOt8+9n+/qKbOLzUMUDdh
         i9qJdanl+KeoSL2vJGkulK15cSjmSCgL043BtoZJAVWkFkeGYESI8X7M+k3BbnOwfliU
         t70aoj15uKmUdPlLR7R4EjYkauyvb4Po654bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706084515; x=1706689315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4UmGzzVLHAGCOfMTNJuI1YfNA+8XwSE56/Ppn8LxxE=;
        b=aKfoAxggARSrKQLHPISaVa010qgVtr14aqpNEXt6ROdbtkzuQMzFwAtC4LdHOWBIX2
         yNmX6Rk8IYHH5PAMYG61ZDdc3tM/Q3XkHCf0FDG7z2ivuAwxKzjDSKuHDL0muWOAWufX
         am1GMkofQ3Ahaywa5eG0jhOCG0qYxwhnONPNC8FnmrNVwLGZsFPwXubD/kwc57+JtaQW
         e6vky3Zg2okowMpTlfSZvqScrlUOxsv530EXjkwGTaIwJtyYuyiHLyu07inps36zVH+x
         fM+tAAUIniZJo/V7vzE2XPDSkJi6/B8/qunSKkGMg6koyb3qrzcFxzSA8FLvOFnI9hCE
         Hzsg==
X-Gm-Message-State: AOJu0YyBMtoSakckERa7MCpHtsIDdIzyD1uc6eWBaQNiosGMt/ncxAyE
	KrByTKOCHvQT46nv+XQG8Tyf9x5PowWfD0porIkIj1Eg6ZkBkpCA8E/vUQlx0mc=
X-Google-Smtp-Source: AGHT+IF1jW4ruvN2OphiSjMPmdMSNeOBNbcqMnx6FqidFUGBbEBOTyrtj/evLQd+V5f0Q9Y5Lb/e+Q==
X-Received: by 2002:a05:600c:1c84:b0:40e:c048:42e4 with SMTP id k4-20020a05600c1c8400b0040ec04842e4mr850564wms.104.1706084515464;
        Wed, 24 Jan 2024 00:21:55 -0800 (PST)
Date: Wed, 24 Jan 2024 09:21:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <ZbDIoobsFmx-U5Xt@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <7e936e6a-3218-4c4a-ac68-a58cd363a11d@suse.com>
 <e05e63ab-a86f-45c4-bd80-2b7d6b99aa3d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e05e63ab-a86f-45c4-bd80-2b7d6b99aa3d@amd.com>

On Wed, Jan 24, 2024 at 12:07:28AM -0500, Stewart Hildebrand wrote:
> On 1/23/24 09:29, Jan Beulich wrote:
> > On 15.01.2024 20:43, Stewart Hildebrand wrote:
> >> @@ -1043,11 +1043,11 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
> >>  {
> >>      struct msi_desc *old_desc;
> >>  
> >> -    ASSERT(pcidevs_locked());
> >> -
> >>      if ( !pdev || !pdev->msix )
> >>          return -ENODEV;
> >>  
> >> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
> >> +
> >>      if ( msi->entry_nr >= pdev->msix->nr_entries )
> >>          return -EINVAL;
> > 
> > Further looking at this - is dereferencing pdev actually safe without holding
> > the global lock?

It is safe because either the global pcidevs lock or the per-domain
pci_lock will be held, which should prevent the device from being
removed.

> Are you referring to the new placement of the ASSERT, which opens up the possibility that pdev could be dereferenced and the function return before the ASSERT? If that is what you mean, I see your point. The ASSERT was placed there simply because we wanted to check that pdev != NULL first. See prior discussion at [1]. Hmm.. How about splitting the pdev-checking condition? E.g.:
> 
>     if ( !pdev )
>         return -ENODEV;
> 
>     ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
> 
>     if ( !pdev->msix )
>         return -ENODEV;

I'm not specially worried about the position of the assert, those are
just debug messages at the end.

One worry I have after further looking at the code, when called from
ns16550_init_postirq(), does the device have pdev->domain set?

That case would satisfy the first condition of the assert, so won't
attempt to dereference pdev->domain, but still would be good to ensure
consistency here wrt the state of pdev->domain.

Regards, Roger.

