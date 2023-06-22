Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76D73A115
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 14:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553523.864124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCJad-0003Eu-Ot; Thu, 22 Jun 2023 12:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553523.864124; Thu, 22 Jun 2023 12:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCJad-0003Ct-M1; Thu, 22 Jun 2023 12:39:07 +0000
Received: by outflank-mailman (input) for mailman id 553523;
 Thu, 22 Jun 2023 12:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCJab-0003Cn-Q1
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 12:39:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4b06a8e-10f9-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 14:39:03 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f9bece8e19so22385525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 05:39:02 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k37-20020a05600c1ca500b003f9b3829269sm2602180wms.2.2023.06.22.05.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 05:39:01 -0700 (PDT)
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
X-Inumbo-ID: c4b06a8e-10f9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687437542; x=1690029542;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n5HL61NbRzkQwJPyPEEZstRpgUECb6lGMy/OYqG0tEQ=;
        b=XYMvo0ERsoIPEh16KJlzxH4tG3nlKHJOStMW9OwGaPyEiF2UJ48WQyq6WCyOMNaEjX
         R2Dbdql21ocL+NbxGzi3SgJOQ/WbKHXHsbQkQPi1t3YeyljR4/fSshxGuM1qBF9wlV3v
         nClLue4cxC7+3syJu0GoXHX7CZ0t+jaUTfefY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687437542; x=1690029542;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5HL61NbRzkQwJPyPEEZstRpgUECb6lGMy/OYqG0tEQ=;
        b=EmXBxaNvaES4d1cK8ttW3FYKLNESMDbPqbySIyziYNmijEuv+0vex/PLRj49My0NhL
         V/STpuGk+bnABjd8uD18LXEExWc6lmr7vycsN0zCIbLSbl86adOsh8ARm4ybJluOrldP
         t7HhveNFKOMo8ivdypFVW2SQho0ZB4FjZwT2TNckvRs8yMrDM8XFvnnsTEfgczJ7oErg
         vtMLtU/tXhfEA2vm6eF66CC0ICdfh3WjWb4+qB6vtkrfqJ8Aaa2xJgXFa3bD7vsn6lDq
         x83+2KeiuHOYxKlWKdfeSR4jnQiZvZlsF3QVXNvZlLxHWW00EhWejaOapvJ3emjc0o2C
         pe9A==
X-Gm-Message-State: AC+VfDxN4o41C0znZrwz/Wn6LNFBemWCXVTLYkEf+ikyDwPnRFOUoAWJ
	Fr4RdCznI7HsfVMiCEX/Y7OOhg==
X-Google-Smtp-Source: ACHHUZ6JnIjjbM4GScQYP2igBun7zgaV/ht7sPAVxEFdmbh/tckw/4yPKiNQWW1zgnp/s/qwvxUuDg==
X-Received: by 2002:a05:600c:3645:b0:3f9:255e:ee3b with SMTP id y5-20020a05600c364500b003f9255eee3bmr14124828wmq.30.1687437542314;
        Thu, 22 Jun 2023 05:39:02 -0700 (PDT)
Message-ID: <649440e5.050a0220.708ad.038d@mx.google.com>
X-Google-Original-Message-ID: <ZJRA5DqySsZFo9tu@EMEAENGAAD19049.>
Date: Thu, 22 Jun 2023 13:39:00 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] mm/pdx: Add comments throughout the codebase for pdx
References: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
 <984e13ef-a73e-126c-0bf8-58bee9beb7b2@suse.com>
 <64930879.1c0a0220.28719.ce38@mx.google.com>
 <692b3db7-dfe8-8ed7-71e5-b29dcbba7f1c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <692b3db7-dfe8-8ed7-71e5-b29dcbba7f1c@suse.com>

On Thu, Jun 22, 2023 at 11:15:17AM +0200, Jan Beulich wrote:
> >>> --- a/xen/include/xen/mm.h
> >>> +++ b/xen/include/xen/mm.h
> >>> @@ -31,6 +31,22 @@
> >>>   *   (i.e. all devices assigned to) a guest share a single DMA address space
> >>>   *   and, by default, Xen will ensure dfn == pfn.
> >>>   *
> >>> + * pdx: Page InDeX
> >>> + *   Indices into the frame table holding the per-page's book-keeping
> >>> + *   metadata. A compression scheme is used and there's a non-identity
> >>> + *   mapping between valid(mfn) <-> valid(pdx) See the comments in pdx.c
> >>> + *   for an in-depth explanation of that mapping.
> >>
> >> The mapping may very well be (and on x86 typically is) an identity
> >> one. IOW you want to describe not only the compression case, but also
> >> the "no compression possible" one.
> > Point taken. I'll rephrase it slightly as "possibly non-identity" and
> > explicitly state the "no compression is possible" case.
> > 
> >>
> >> PDXes also aren't just indexes to the frame table, but also to the
> >> direct mapping.
> > I had something to that effect earlier on, but I removed it because it
> > doesn't seem to be the case on ARM. There's a directmap_base_pdx global
> > that states the first pdx to be mapped on the directmap.
> 
> Which would merely make it a biased index. I very much hope they
> eliminate holes (and not just unused leading space) from the directmap
> as well.
Yes, the directmap offset is still just a shifted pdx (albeit biased, as
you said), so the holes are naturally removed. Regardless, having to
explain a port-specific quirk in the main mm header seems like too much, so
I sticked with the common denominator: "A pdx is the frame table index of a
valid entry", and that holds for every port.

> >>> + * This is a technique to avoid wasting memory on machines known to have
> >>> + * split their machine address space in two big discontinuous and highly
> >>> + * disjoint chunks.
> >>
> >> Why two? There can be any number, and in fact on the system I originally
> >> had data from for reference (when first writing this code) iirc there
> >> were 8 nodes, each with a chunk of memory far away from the other chunks.
> >> The compression scheme used merely requires that some "inner" bits are
> >> unused (always zero) in all of those ranges.
> > Well, our implementation only supports two and I didn't see any obvious
> > hints about intending to increasing that number.
> 
> Where are you taking that "supports two" from? When I first wrote this code,
> it was tested against a system with 8 (maybe it was 4, but certainly more
> than 2) discontiguous regions (not counting the hole below 4G).
You can have any number, but there's a single contiguous bit slice being
removed, as far as I can see. The adaptor functions in
xen/include/xen/pdx.h perform a single shift.

    static inline unsigned long pfn_to_pdx(unsigned long pfn)
    {
        return (pfn & pfn_pdx_bottom_mask) |
               ((pfn & pfn_top_mask) >> pfn_pdx_hole_shift);
    }

    static inline unsigned long pdx_to_pfn(unsigned long pdx)
    {
        return (pdx & pfn_pdx_bottom_mask) |
               ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
    }

Unless I'm missing some non-obvious piece of the puzzle, I'd say that for a
truly general compressor we'd need some kind of loop over the hole mask.

> > Out of curiosity (and for posterity's sake), what was/is that system?
> 
> I'm not sure I'm permitted to mention that. I'm pretty sure I carefully
> avoided mentioning the partner of ours back at the time.
Fair enough.

Alejandro

