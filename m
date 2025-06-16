Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44391ADB44E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 16:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017345.1394332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRB6c-0001CX-TC; Mon, 16 Jun 2025 14:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017345.1394332; Mon, 16 Jun 2025 14:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRB6c-0001B9-Pu; Mon, 16 Jun 2025 14:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1017345;
 Mon, 16 Jun 2025 14:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppVY=Y7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRB6b-0001B3-JI
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 14:46:37 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1ae7ba0-4ac0-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 16:46:32 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so3714052f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 07:46:32 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568a800d9sm11157887f8f.45.2025.06.16.07.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 07:46:31 -0700 (PDT)
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
X-Inumbo-ID: b1ae7ba0-4ac0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750085192; x=1750689992; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDup5PmZLZjol1hr4+Jh9CeqzezFF4lo5IwNGLjG2Gw=;
        b=OCQ1MV4+697vBQxfCHBdA/JfbhjioWJf2xQptVq37GOwUWKY1vfzeKdT1VV0gvQlom
         sHgBFGnpaoGUUhcLssEZPf5ei5ryDgNv3lWYu+3Isk/4BIb0wBjto2Gw8ymIUPhzA2mg
         rTKXJxuLxcSu8XJtEQHuHU8ZL3XUYP6VjUT+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085192; x=1750689992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDup5PmZLZjol1hr4+Jh9CeqzezFF4lo5IwNGLjG2Gw=;
        b=bjYfj2gS7zl97ABOHxkKJhur/wRvFVxjfKYArF8uvx/LKSPUg/8StugCbXwkHPbjkG
         PbsbZz0EG6AmnFqvR3swlkHUXWnkSzlnj5ddX2jfw9GeMmwqBVarJOIAbM/r1rD5JpzE
         bOArpy8uZIOXyesIiVYr7JW93sDPYnBsZgvZI4uFCOWrDuQAFmqYZFHmz31RvjnkizOl
         GwmEkPrO0dJrgXHGjMYrOx9YP5z7jiYRhBi9tKwGmVPWdMLJ4JiftfWbDy3mWEdoXW2G
         NgTbx1MgV/sHOB52NC6VeRU+PxnOkdbY10hA9x95NIKqNXmfPDj8741s6rlVmIl+5ae9
         jgkg==
X-Gm-Message-State: AOJu0Yzz45k0un+ot0+bYAoVBjPc7MHdLd2SYFORNHDZlrkFHre1WgZ2
	JvxWmau3R/Mn1sdmTcyHGPDmY4I3l/ENcbHwBGXWpVCEvYjUcmWcRyQI/oiK0Lo7tC4=
X-Gm-Gg: ASbGncvYfRIqlnxFWuNaLV1cDOwIytX0dhptJ8W32n+y6fkTqSYbGtYcqIoNym1lYbW
	/xXLJ9D12vTlJGOseRIEhhGqmy9YCMK11odOAfb5Jdtr8ots06woyrtniL6EFiQDRFp31Hn7Gbr
	Dwnjozl7Det3d4xGvAYrl3ZBIWq1UBbN/HhL0BjvbgJLyW2Uevb269JA/0hzoDISktKCz/YpYKA
	7IOJRIFoefxI9pRm6V4zuv5ujsmlzg5iGeTTDHb0mBvlnQeVC4xiW7JRkGZXwf3eDljExz/Flzi
	H6ucLa+uqYajs3yZxisohuCP6C1IzjmTPlGUAYEY3hon7nwCwqls6r5owOOZXFwYR3h0eGL8J2s
	hXyHyQ/KROl+YERrX48g0/XNuRMhzMAwjNC0=
X-Google-Smtp-Source: AGHT+IFIX/J69NlQgNq/gTfyxowuZT/8nib312hnAvvrzv4gS1wYr8D00jB1Q1ayE7bgEvVAcQEzdQ==
X-Received: by 2002:a5d:64c3:0:b0:3a4:f6f2:65e9 with SMTP id ffacd0b85a97d-3a572e7509cmr8228576f8f.19.1750085191856;
        Mon, 16 Jun 2025 07:46:31 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:46:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
Message-ID: <aFAuRXSryHKj3jVa@macbook.local>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
 <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>

On Mon, Jun 16, 2025 at 04:23:40PM +0200, Jan Beulich wrote:
> On 16.06.2025 15:27, Roger Pau Monné wrote:
> > On Tue, Feb 25, 2025 at 03:58:34PM +0100, Jan Beulich wrote:
> >> Entities building domains are expected to deal with higher order
> >> allocation attempts (for populating a new domain) failing. If we set
> >> aside a reservation for DMA, try to avoid taking higher order pages from
> >> that reserve pool.
> >>
> >> Instead favor order-0 ones which often can still be
> >> supplied from higher addressed memory, even if we've run out of
> >> large/huge pages there.
> > 
> > I would maybe write that last sentence as:  force non zero order
> > allocations to use the non-DMA region, and if the region cannot
> > fulfill the request return an error to the caller for it to retry with
> > a smaller order.  Effectively this limits allocations from the DMA
> > region to only be of order 0 during physmap domain population.
> 
> I can take this text, sure.
> 
> >> --- a/xen/common/memory.c
> >> +++ b/xen/common/memory.c
> >> @@ -192,6 +192,14 @@ static void populate_physmap(struct memo
> >>           * delayed.
> >>           */
> >>          a->memflags |= MEMF_no_icache_flush;
> >> +
> >> +        /*
> >> +         * Heuristically assume that during domain construction the caller is
> >> +         * capable of falling back to order-0 allocations, allowing us to
> >> +         * conserve on memory otherwise held back for DMA purposes.
> >> +         */
> >> +        if ( a->extent_order )
> >> +            a->memflags |= MEMF_no_dma;
> > 
> > For PV domains: is it possible for toolstack to try to allocate a
> > certain amount of pages from the DMA pool for the benefit of the
> > domain?
> 
> Not directly at least. To benefit the domain, it would also need to be
> told where in PFN space those pages would have ended up.

My question makes no sense anyway if MEMF_no_dma isn't exposed to the
hypercall interface.

> > I also wonder if it would make sense to attempt to implement the
> > logic on the toolstack side: meminit_{hvm,pv}()?
> > 
> > No strong opinion, but slightly less logic in the hypervisor, and
> > won't change the interface for possibly existing toolstacks that don't
> > pass MEMF_no_dma on purpose.
> 
> MEMF_no_dma isn't exposed outside of the hypervisor.

Oh, I see.

One question I have though, on systems with a low amount of memory
(let's say 8GB), does this lead to an increase in domain construction
time due to having to fallback to order 0 allocations when running out
of non-DMA memory?

Thanks, Roger.

