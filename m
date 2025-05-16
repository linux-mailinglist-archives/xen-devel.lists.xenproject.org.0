Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F388AB9723
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986460.1372019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq4k-0005iJ-SQ; Fri, 16 May 2025 08:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986460.1372019; Fri, 16 May 2025 08:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq4k-0005fe-Pj; Fri, 16 May 2025 08:05:50 +0000
Received: by outflank-mailman (input) for mailman id 986460;
 Fri, 16 May 2025 08:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFq4j-0005fT-7T
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:05:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938e23a9-322c-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 10:05:48 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad53cd163d9so40325066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:05:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d047cb1sm113826066b.30.2025.05.16.01.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 01:05:47 -0700 (PDT)
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
X-Inumbo-ID: 938e23a9-322c-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747382748; x=1747987548; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fyqCvKZE3CbLWKoj2rLeV7NbmPUxeHwiR2HeylYQs4s=;
        b=IWsz91vJaUTQYldIsPEmOfmJcEGC2BPaxq2QtlFEJW7ar8XUC3hxbKtTRlTpbtO4OJ
         lsSo1mPkeOr72Fng7S/kGuKKOFva8n8/QZiRn9foBQNwAtFpYaQz8Nx2qCuKQeJO50OQ
         eOoiM/26aS+ombvkgtiP53odOmyq62Zkj1qdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382748; x=1747987548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyqCvKZE3CbLWKoj2rLeV7NbmPUxeHwiR2HeylYQs4s=;
        b=jcsuuGVzAKjilm9tYWl/OWYtS9WWzWrFnqjCXqeXh3tFzhzW/03uBOOnTqyU/dxyng
         D1tT37LWI4z6KJQinwiwvuSzH7krCiIBHU5rxKANpm0m3JnuWIgj8Kv3OCjHwTGgqKG1
         YpBcxBmtbmGuuGbkiKs8Fty9p11xFqMrXDNk6VbAY2b+/t0KJHFLOYb9n2H+ovjvUMim
         f7sxeVZKhwHPTZKsjJAAUAvrJ0D/sVbPIzggOzmNRPZddK6KrKSUOjm8I8PE/p/Cg4OM
         rSxixl9QjsqbSM2xOCyg34quNe6Ypsm0PxeF1mG03xf3JIcEmlRiiPH5y5QN/BeQBQKK
         PMCg==
X-Forwarded-Encrypted: i=1; AJvYcCUK+dzR4YIVpsMw9ZfI25qPzo5KX03bmPyzXPYVcFdAEhKSZ0W26pFhjfb1LpWv8KJ+AcH2YujQmsE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZbKhjLTe62kWY//X8TVnM9J17xgTm48rkeF2uhMWMztr4nl3d
	Q5/I1p/goFVx2JE8B9QL1fm8TY/SNjHSd4IBinpugwVcoX93JOIGqaMVNMzU98gwWHg=
X-Gm-Gg: ASbGncsz+iyHYqa3FegX+oNWtzqL6X6/6hZsC+7KAQSmLU3EFt3j1YsWC8OFpDQXgZ4
	r4PBSiiqBwD/2NYdRDVCtGkJC/peqWg/bXxgkeijnhcG+Ivlf35k6WaM70H/12L/9nWetCqSLEZ
	hvttGsttYnt5jml5rauYrJX3iicg85bACWBi71S0k5+p6rp/SSO+MrpLJphtSbmjlw2wsOEqD1c
	gHhKjGEguzLLhg/GqektutGQeNhirKE2BGP7YNJOMto8lR/YC7dInPnD5e/EEMJ4fCyMVobw41d
	BypIG0wP+MnMGKn5AimstFC7yHPQhrBPtvtGy+Q0rKReWXCObmTIe7xXdf9UNdTkD292+rDaisb
	VqEa90HL9Stz1x7VGLLA=
X-Google-Smtp-Source: AGHT+IGI1myFVDeswzo1K9UZwYacmSTw5zDXGexAqYFNYhIt5q7rITezhP2SUGELuh+HiH9aj4Q6rQ==
X-Received: by 2002:a17:907:9411:b0:ad1:cd1a:ec8c with SMTP id a640c23a62f3a-ad52d5757e8mr265912566b.44.1747382747983;
        Fri, 16 May 2025 01:05:47 -0700 (PDT)
Date: Fri, 16 May 2025 10:05:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 8/9] xen: introduce flag when a domain requires cache
 control
Message-ID: <aCbx2vxqx3T-6uXe@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-9-roger.pau@citrix.com>
 <b9a2b6fb-af34-443e-93b6-a5e827259a4b@suse.com>
 <aCXFeBGIr87MwELu@macbook.lan>
 <8f7beebc-643b-4308-b8ff-c0b812eb8d02@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f7beebc-643b-4308-b8ff-c0b812eb8d02@suse.com>

On Fri, May 16, 2025 at 09:16:10AM +0200, Jan Beulich wrote:
> On 15.05.2025 12:44, Roger Pau Monné wrote:
> > On Mon, May 12, 2025 at 05:24:01PM +0200, Jan Beulich wrote:
> >> On 06.05.2025 10:31, Roger Pau Monne wrote:
> >>> Such flag is added to the domain create hypercall, and a matching option is
> >>> added to xl and libxl to set the flag: `cache_control`.  When the flag is
> >>> set, the domain is allowed the usage of cache control operations.  If the
> >>> flag is not explicitly set, libxl will set it if the domain has any `iomem`
> >>> or `ioports` ranges assigned.
> >>>
> >>> Modify cache_flush_permitted() helper so that it's return value is no
> >>> longer based on the IO resources assigned to the domain, but rather whether
> >>> the domain has been explicitly allowed control over the cache, or if it has
> >>> IOMMU support and there's a single IOMMU in the system that doesn't allow
> >>> forcing snooping behind the guest back.  As a result of this, the return of
> >>> cache_flush_permitted() is constant for the lifetime of a domain, based on
> >>> the domain creation flags and the capabilities of the IOMMU if enabled
> >>> for the domain.
> >>
> >> This then further emphasizes the remark made for patch 7.
> > 
> > Hm, I think you are referring to the remark about how PCI device
> > without IO resources would be handled then, and what would
> > cache_flush_permitted() return then?
> 
> Or more generally the relationship between that and has_arch_io_resources().
> 
> > IMO the benefit of the approach presented here is that it aims to know
> > whether a domain needs cache control to be set at creation time, and
> > not altered during it's runtime.
> 
> I agree that having this not vary over a domain's lifetime makes things easier
> for us. At the same time it may negatively affect performance of domains where
> hardware devices are added / removed on the fly.

I'm planing to leave this change for a further iteration of the
series.  Initially I just want to attempt to limit flushing when the
domain has IOMMU support enabled, and the host globally supports
snooping on all IOMMUs, as that's likely less controversial and would
unblock a customer reported issue.

Thanks, Roger.

