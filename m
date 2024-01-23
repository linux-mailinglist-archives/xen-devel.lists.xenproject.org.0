Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09384839216
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 16:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670520.1043362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSIMq-0001Am-9B; Tue, 23 Jan 2024 15:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670520.1043362; Tue, 23 Jan 2024 15:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSIMq-00017Z-6G; Tue, 23 Jan 2024 15:07:12 +0000
Received: by outflank-mailman (input) for mailman id 670520;
 Tue, 23 Jan 2024 15:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDjx=JB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSIMo-00017T-Ps
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 15:07:10 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1445f9d7-ba01-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 16:07:09 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eb0836f8dso17530885e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 07:07:09 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 jb13-20020a05600c54ed00b0040e418494absm41756335wmb.46.2024.01.23.07.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 07:07:08 -0800 (PST)
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
X-Inumbo-ID: 1445f9d7-ba01-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706022429; x=1706627229; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7wM/1rXgOuon42oEldfXYPMXxsGK00QIox6AXmIImk=;
        b=MB53cY2/xk0N1vuKakOkYgNrxu+HGJUZH8eSM/YawNsKntt8jPfQ36kQGAMO/B+l8M
         2YzY+vF1p3PmeEdHmhhc7YSFVTBUoT2Qlvf3XwimhpTHWEvDbTzJBWmfCNfaawuqr917
         sOugXkYT6Wc2sm8Rf6GCqlp/rJDjMffOlbxd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706022429; x=1706627229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7wM/1rXgOuon42oEldfXYPMXxsGK00QIox6AXmIImk=;
        b=oA4lZmZ/43/TwagPn1lw+8xXDVOIytloT16sxMpeDzsPKBYGERjMGjRUY2SEmEGwBQ
         69be8glJGy5M1XRE4JOFeiLTC+LOJHCxHLw5zQhCWSAtCuwT9cha9SIOZRmtvmgLVRxw
         HaCiuP4pfAylj8RgHiyJiOJ66umNSmZcJirLbxCcZm0Cq8KHpRJhnIGJ6VBoP7aWyzGE
         2v7GepyoytgymxIsAtv/tqSuTgWdR32YOMP36AoU1ww5qIBzNvdfEX9jAIn6ahJGbwbq
         VcQbwJyhW6EK5SfCJA3yWJtbxMUNwt+VhJeQ5QYe9+6mcAQda7XVIHM7tqarzhfB2z9S
         kuXg==
X-Gm-Message-State: AOJu0YzPXYDKbRPIK39nq/TAVj5fezmlb8Oi9Iw/hTixfVz+V3Sel+SY
	s1bLJD62VJLIbeeDJiiOwHGPS2qYreSxOXvPAAAtykS9CD/4B+OegdYZ7LEKTdU=
X-Google-Smtp-Source: AGHT+IFwM7oCdmc+lXsPO9Mkme4/uVgP+h3bwOFqLSTvTIcvItX+TRbtFYPUXOqpjTyF+sIO6aKEqA==
X-Received: by 2002:a05:600c:21d0:b0:40d:3112:a2c3 with SMTP id x16-20020a05600c21d000b0040d3112a2c3mr227449wmj.73.1706022428890;
        Tue, 23 Jan 2024 07:07:08 -0800 (PST)
Date: Tue, 23 Jan 2024 16:07:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
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
Message-ID: <Za_WGzS14Eqt8yZF@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com>

On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
> On 15.01.2024 20:43, Stewart Hildebrand wrote:
> > @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >  {
> >      int irq, pirq, ret;
> >  
> > +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> 
> If either lock is sufficient to hold here, ...
> 
> > --- a/xen/arch/x86/physdev.c
> > +++ b/xen/arch/x86/physdev.c
> > @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
> >  
> >      case MAP_PIRQ_TYPE_MSI:
> >      case MAP_PIRQ_TYPE_MULTI_MSI:
> > +        pcidevs_lock();
> >          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> > +        pcidevs_unlock();
> >          break;
> 

IIRC (Stewart can further comment) this is done holding the pcidevs
lock to keep the path unmodified, as there's no need to hold the
per-domain rwlock.

Roger.

