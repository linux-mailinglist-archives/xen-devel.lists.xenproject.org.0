Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A575381B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 12:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563557.880813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKG1l-0002l3-97; Fri, 14 Jul 2023 10:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563557.880813; Fri, 14 Jul 2023 10:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKG1l-0002ie-6H; Fri, 14 Jul 2023 10:27:57 +0000
Received: by outflank-mailman (input) for mailman id 563557;
 Fri, 14 Jul 2023 10:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dx2S=DA=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qKG1k-0002iY-E1
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 10:27:56 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18319ad6-2231-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 12:27:55 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so2882865e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jul 2023 03:27:55 -0700 (PDT)
Received: from EMEAENGAAD19049. ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a05600c510a00b003fbb1ce274fsm1862089wms.0.2023.07.14.03.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 03:27:54 -0700 (PDT)
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
X-Inumbo-ID: 18319ad6-2231-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689330474; x=1691922474;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=twurVRsPlIe7uMwCQf+SqDy5nf0XEhbH2pBEM5eBNkw=;
        b=XEPKr3AF68fwYH3XaAnOEfgbgcBV0L5/t5/ByI5CKkS591y46VHjOYwm0igfhdDN5f
         vYIktIOFvqlM/b4QOeFHeHHSNg4Ag6u20drmBjDoZ7gC1GCyw5nK4UVyEXBkd6A9yMdK
         cAVIxehoJr363g9LSW8NzPYJa/3WboWdork2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689330474; x=1691922474;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twurVRsPlIe7uMwCQf+SqDy5nf0XEhbH2pBEM5eBNkw=;
        b=LpTa7b6Zx7Cfmsr4B7J3T2J2qxjx4OIr97WnHeSU/wNEWBh8BmPxknv8AHp+Q8ePVX
         pGiXUNTHRzDnVnMd04nszFX7BYVJgOX38AcT8MCX+eknEFgLwg49Yt7Qc2M2VCBOqwAJ
         j3wFCqVkzKrG3VWXMD7cMjKTt+BusSIlsV7xotRTmNzPvozqh3tiFFHSv4KtEIDJkvRx
         gXihMGzvmh8SHRsg/MScCAbDUe1w44OyRYpG/BX3XTmFL/d3mHFoQxGLHLsOSFbrREeo
         61nmTVLgKRHF7S66Z/Jx4qaf1pH/R3rju+h0SoBKBSwdaURZ4GFuYSeEkvMzFXrrKrr/
         9TrQ==
X-Gm-Message-State: ABy/qLZMCj8Nq5pIcPmzduPOp8bfh1wSRmN04OptJzZYQEjePgI3G+zc
	c3v9pasYUzxjK9FbfKRx+rthjQ==
X-Google-Smtp-Source: APBJJlH4DuCO+oObOR726JhPMmpn9HDxk6v8dWqztMs9QpWndOZldZbRx5rB0k2eHuH7Ok9tbeEEBQ==
X-Received: by 2002:a05:6512:224c:b0:4fb:7626:31a2 with SMTP id i12-20020a056512224c00b004fb762631a2mr3736685lfu.43.1689330474576;
        Fri, 14 Jul 2023 03:27:54 -0700 (PDT)
Message-ID: <64b1232a.050a0220.898b.6177@mx.google.com>
X-Google-Original-Message-ID: <ZLEjIT1adG0W/I3o@EMEAENGAAD19049.>
Date: Fri, 14 Jul 2023 11:27:45 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] mm/pdx: Add comments throughout the codebase for pdx
References: <20230707160759.12132-1-alejandro.vallejo@cloud.com>
 <646ce8b8-7a8c-88c1-2b1e-76a721e6f164@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <646ce8b8-7a8c-88c1-2b1e-76a721e6f164@suse.com>

Hi,

On Thu, Jul 13, 2023 at 05:12:09PM +0200, Jan Beulich wrote:
> On 07.07.2023 18:07, Alejandro Vallejo wrote:
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -31,6 +31,17 @@
> >   *   (i.e. all devices assigned to) a guest share a single DMA address space
> >   *   and, by default, Xen will ensure dfn == pfn.
> >   *
> > + * pdx: Page InDeX
> > + *   Indices into the frame table holding the per-page's book-keeping
> > + *   metadata. A compression scheme may be used, so there's a possibly non
> > + *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
> > + *   in pdx.c for an in-depth explanation of that mapping. This also has a
> > + *   knock-on effect on the directmap, as "compressed" pfns have no
> > + *   corresponding mapped frames.
> 
> Didn't you mean to keep the directmap part optional,
I did.

> which would call for saying "may" here (twice)?
That paragraph as-is doesn't really mandate a directmap. It merely state
that there are knock-on effects on directmap indexing, not that there's
always a directmap to index.

> Yet then ...
>
> 
> > --- a/xen/include/xen/pdx.h
> > +++ b/xen/include/xen/pdx.h
> > @@ -1,6 +1,73 @@
> >  #ifndef __XEN_PDX_H__
> >  #define __XEN_PDX_H__
> >  
> > +/*
> > + * PDX (Page inDeX)
> > + *
> > + * This file deals with optimisations pertaining to frame table and
> > + * directmap indexing, A pdx is an index into the frame table, which
> > + * typically also means an index into the directmap[1]. However, having an
> > + * identity relationship between mfn and pdx could waste copious amounts of
> > + * memory in empty frame table entries and page tables. There are some
> > + * techniques to bring memory wastage down.
> > + *
> > + * [1] Some ports apply further modifications to a pdx before indexing the
> > + *     directmap. This doesn't change the fact that the same compression
> > + *     present in the frame table is also present in the directmap
> > + *     whenever said map is present.
> 
> .. you mention it here as non-optional as well. Didn't you tell me that
> Arm doesn't use compressed indexes into the directmap?
> 
> Jan

The [1] note states "whenever said map is present", meaning that it may not
be present. Saying it's optional is a stretch though. It's not like we can
choose right now.

> Didn't you tell me that Arm doesn't use compressed indexes into the directmap?
arm32 doesn't have a directmap at all. arm64 uses biased pdx as indices
(they are offset by a constant), so they are still subject to compression.

Alejandro

