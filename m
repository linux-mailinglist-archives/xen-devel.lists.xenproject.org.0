Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0345575676B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564680.882286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPyz-0008OK-TZ; Mon, 17 Jul 2023 15:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564680.882286; Mon, 17 Jul 2023 15:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPyz-0008MF-Q7; Mon, 17 Jul 2023 15:17:53 +0000
Received: by outflank-mailman (input) for mailman id 564680;
 Mon, 17 Jul 2023 15:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLPyy-0008M9-Rp
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:17:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 186e562a-24b5-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 17:17:51 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso6218154a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 08:17:51 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v9-20020aa7d649000000b0051def9be785sm10052903edr.85.2023.07.17.08.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 08:17:50 -0700 (PDT)
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
X-Inumbo-ID: 186e562a-24b5-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689607071; x=1692199071;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pl+agShOZLQ/uSctIG4q0BsztpV+2qGnqQ8/faLyzW4=;
        b=hLnVSrDVuAP0IwAdpoqmr75sEJVeUlF/9a5k1M24xIV2GBDwx//awoI1Qdf68cx86A
         5rwpktR1K9nt3KEvM5+UYdtNbLSr/YmID3kqz6QOkZ09bEiWBW8YYH0bu1BpmR8+RhqD
         MRvCBrhlEzszRVinC8aAymD02quJAK+Twlesk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607071; x=1692199071;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl+agShOZLQ/uSctIG4q0BsztpV+2qGnqQ8/faLyzW4=;
        b=fu30XLm2nUrwwDoZh7pJkPi1iUu8rGN5OrA0cA9LlXTSE1GzkDzO2lSlXfjjLcW0EC
         OehchztAL7mQxQb22k/OrKQZrhtfnelCy4vCZYhUarDNpV8zr0ETjz8mt1EYlosVrgdp
         rJRljDZknasMt6MD8p6uyr3I4BHYpejzwIzVuLecsoEBcm3GSA5iNd7IOGsNFrywGv5K
         RWguAULH2Wmq2odLxbQWNMmafbZe+PgHhWLWgkPMTDl+0i/6hyWn8KTQsWYICorvU+CK
         V/kqoXRiUFoPv016CgvjNR/EKbF7yh/bxviThwaVbsC/vViWTGj3dKt1Hg8gP49uhG61
         o8pA==
X-Gm-Message-State: ABy/qLb46JIG88y4zRNWpbsBe5BUGXVLs/CZSMR2YlWoJ3gmx4SyJ3EN
	JTjh4HqBn7BQqxOrAmEoS2xm1A==
X-Google-Smtp-Source: APBJJlEEJFdaBi59YX9+o1l54fwMJXX3riFuG0WK/iLcx1n8IbRgTabJYMeV6CecUtkSgsI+7n0UZg==
X-Received: by 2002:aa7:de0a:0:b0:51c:dd99:a211 with SMTP id h10-20020aa7de0a000000b0051cdd99a211mr10640186edv.27.1689607070863;
        Mon, 17 Jul 2023 08:17:50 -0700 (PDT)
Message-ID: <64b55b9e.a70a0220.f2728.ad3a@mx.google.com>
X-Google-Original-Message-ID: <ZLVbnQmiHfRP70cB@EMEAENGAAD19049.>
Date: Mon, 17 Jul 2023 16:17:49 +0100
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
 <64b1232a.050a0220.898b.6177@mx.google.com>
 <6519818f-d31e-d588-6613-3671cc7427d4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6519818f-d31e-d588-6613-3671cc7427d4@suse.com>

On Fri, Jul 14, 2023 at 12:36:11PM +0200, Jan Beulich wrote:
> On 14.07.2023 12:27, Alejandro Vallejo wrote:
> > On Thu, Jul 13, 2023 at 05:12:09PM +0200, Jan Beulich wrote:
> >> On 07.07.2023 18:07, Alejandro Vallejo wrote:
> >>> --- a/xen/include/xen/mm.h
> >>> +++ b/xen/include/xen/mm.h
> >>> @@ -31,6 +31,17 @@
> >>>   *   (i.e. all devices assigned to) a guest share a single DMA address space
> >>>   *   and, by default, Xen will ensure dfn == pfn.
> >>>   *
> >>> + * pdx: Page InDeX
> >>> + *   Indices into the frame table holding the per-page's book-keeping
> >>> + *   metadata. A compression scheme may be used, so there's a possibly non
> >>> + *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
> >>> + *   in pdx.c for an in-depth explanation of that mapping. This also has a
> >>> + *   knock-on effect on the directmap, as "compressed" pfns have no
> >>> + *   corresponding mapped frames.
> >>
> >> Didn't you mean to keep the directmap part optional,
> > I did.
> > 
> >> which would call for saying "may" here (twice)?
> > That paragraph as-is doesn't really mandate a directmap. It merely state
> > that there are knock-on effects on directmap indexing, not that there's
> > always a directmap to index.
> > 
> >> Yet then ...
> >>
> >>
> >>> --- a/xen/include/xen/pdx.h
> >>> +++ b/xen/include/xen/pdx.h
> >>> @@ -1,6 +1,73 @@
> >>>  #ifndef __XEN_PDX_H__
> >>>  #define __XEN_PDX_H__
> >>>  
> >>> +/*
> >>> + * PDX (Page inDeX)
> >>> + *
> >>> + * This file deals with optimisations pertaining to frame table and
> >>> + * directmap indexing, A pdx is an index into the frame table, which
> >>> + * typically also means an index into the directmap[1]. However, having an
> >>> + * identity relationship between mfn and pdx could waste copious amounts of
> >>> + * memory in empty frame table entries and page tables. There are some
> >>> + * techniques to bring memory wastage down.
> >>> + *
> >>> + * [1] Some ports apply further modifications to a pdx before indexing the
> >>> + *     directmap. This doesn't change the fact that the same compression
> >>> + *     present in the frame table is also present in the directmap
> >>> + *     whenever said map is present.
> >>
> >> .. you mention it here as non-optional as well. Didn't you tell me that
> >> Arm doesn't use compressed indexes into the directmap?
> >>
> >> Jan
> > 
> > The [1] note states "whenever said map is present", meaning that it may not
> > be present. Saying it's optional is a stretch though. It's not like we can
> > choose right now.
> > 
> >> Didn't you tell me that Arm doesn't use compressed indexes into the directmap?
> > arm32 doesn't have a directmap at all. arm64 uses biased pdx as indices
> > (they are offset by a constant), so they are still subject to compression.
> 
> Hmm, then our understanding of "optional" was differing: I understood
> "use of compressed indexes is optional", when you apparently meant
> "the use of a directmap is optional". If this is the case, then I
> agree with the chosen wording. (Nevertheless using the suggested "may"
> wouldn't yield and incorrect outcome.)
> 
> Jan

Like this?

```
 * pdx: Page InDeX
 *   Indices into the frame table holding the per-page's book-keeping
 *   metadata. A compression scheme may be used, so there's a possibly non
 *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
 *   in pdx.c for an in-depth explanation of that mapping. This also may
 *   have a knock-on effect on the directmap, as "compressed" pfns may not
 *   have corresponding mapped frames.
```

If so, sure. I don't mind either way. I'm happy for those 2 _may_s to be added. 

Thanks,
Alejandro

