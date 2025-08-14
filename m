Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55CB26A34
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 16:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081861.1441830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZOJ-0001nm-OI; Thu, 14 Aug 2025 14:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081861.1441830; Thu, 14 Aug 2025 14:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZOJ-0001li-L8; Thu, 14 Aug 2025 14:57:19 +0000
Received: by outflank-mailman (input) for mailman id 1081861;
 Thu, 14 Aug 2025 14:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umZOH-0001jo-U0
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 14:57:17 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f79447ca-791e-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 16:57:16 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b9df0bffc3so605744f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 07:57:16 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3abedesm51604353f8f.3.2025.08.14.07.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 07:57:14 -0700 (PDT)
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
X-Inumbo-ID: f79447ca-791e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755183435; x=1755788235; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVGRhEQCZ11GWFohBwD5YrLNaqcNhZ0QuP0mBQRr5wc=;
        b=EQ/+vwLgcFKVeLWjTv092uMbHZBlKDa3V+qWqanJUMivQrJfUN6dOC07V3xj6N7vQg
         CEAMvLnSUJDvJkkzUuo+Vm/76Xez1SHWkAyWMmcuLCTiAmrkdSQ4qE4MbvvVVtWFBiQU
         h5X2wTSAkf56YijASvyRIrSUF5sLuGZN4Uw18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183435; x=1755788235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVGRhEQCZ11GWFohBwD5YrLNaqcNhZ0QuP0mBQRr5wc=;
        b=nu+iTE/Ss8t6FYhIPajb9+65ZMYRx44OsRm9eiV2C5qCaHge+qFJi+CI4omm5rGZNC
         hQbE2ub0daNRAKFOuWX0e8fkdMrGsqWrvCLISISQWwyAE9zWmdv3RH64jLhI9gGmdjCU
         6bgSguuT+uQvvm9Rd6rih5IOcI+iByD0gCvNWNjmO3/sykZW3aSXCYqpMKB3X/oX5epE
         UYShAvFNqXPw/qk3mJyTfwXFGF/S+sUOF5kqjuLnUTblG152lLNdlcmnQWXfdPsQWVAe
         dvdcs21KgmEO+HbKGaOX5tgcXXdwAgovXFffp/lzZef1I+AyCwwZy8ExGVb9rdu6LTU/
         QzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG11RIxJ6ok4Lvki1qroJsDJmWxdSGokELnrwoXQbBwjdlerkbp4/5Dm4BQj38Nm1zP1CWYzOrc2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGZO13IS6MoXfgG79kQ6MeRL8EodpijCHqrM2DlHT8iQkkQrzo
	d7oT7EXIP440dqcxHucPAu6FTIZZlWhnUEErxEflDL/tXsTbspypl0wdZCBQi5jOFHY=
X-Gm-Gg: ASbGncvGjrd6/qtyZiPrl/40eY+aq9x5s4aiMBnZsQE6PP/e+v3pWlDJUssDIvCwh9p
	nolyPdzgLCacRjYzRuD4Yxtvz0ehTN+jALXkLNHHMoKPqBZDMXWdn5Rp6u7YHKVJMqa9g94Ukt5
	9yTYjVU09q1Y3G6wHIDlJu8qDfQycJ68BOfCqt2ui9BAxE8QO5tzYMw7LlDuSfwGgXVlgoFVGfq
	/klt+20FJ8DMtcX00FQg1CsnvMtx18ztobGUbwA0iQW+WfBFcYoCSX/vCQr/qtVZqdXvtkT86xt
	av6+OWUcJbskr6JRJj4wuVkYuLnhg+7iJoGOW+nnp1mY6EQR9gmkIW2gE/xbWA3mOVzAAfAMPjr
	paNduzRvXrnpmBHzS/jM6/Hpmikr8a5CTFvgUJGQ5ZK2BQOOt7UAcN+kjC2q6WsRAuw==
X-Google-Smtp-Source: AGHT+IF7aZza5bt07fFPq75ic+0DO18q92gvAG6vmO/Kqa4Doa5yyHJbuTjRyCMw0SHzw7nPkKpClg==
X-Received: by 2002:a05:6000:2507:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3b9edf5bbafmr3141063f8f.47.1755183435270;
        Thu, 14 Aug 2025 07:57:15 -0700 (PDT)
Date: Thu, 14 Aug 2025 16:57:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
Message-ID: <aJ35SplaIL1vZAE9@macbook.local>
References: <20250813125538.78174-1-roger.pau@citrix.com>
 <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
 <aJ26UmemwxyyTioE@macbook.local>
 <3fbdd1fc-e739-42cf-892b-a561910a5693@suse.com>
 <aJ3eRFc7CCwVi5WE@macbook.local>
 <f707d57e-73f3-43c4-a005-f2b93ad3d1cf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f707d57e-73f3-43c4-a005-f2b93ad3d1cf@suse.com>

On Thu, Aug 14, 2025 at 03:15:26PM +0200, Jan Beulich wrote:
> On 14.08.2025 15:01, Roger Pau Monné wrote:
> > On Thu, Aug 14, 2025 at 12:45:40PM +0200, Jan Beulich wrote:
> >> On 14.08.2025 12:28, Roger Pau Monné wrote:
> >>> On Thu, Aug 14, 2025 at 09:18:45AM +0200, Jan Beulich wrote:
> >>>> On 13.08.2025 14:55, Roger Pau Monne wrote:
> >>>>> --- a/xen/common/pdx.c
> >>>>> +++ b/xen/common/pdx.c
> >>>>> @@ -288,7 +288,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
> >>>>>  
> >>>>>      pfn_pdx_hole_shift  = hole_shift;
> >>>>>      pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
> >>>>> -    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
> >>>>> +    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;
> >>>>
> >>>> Given
> >>>>
> >>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> >>>>
> >>>> this shouldn't be needed, except maybe for Arm32. There, however, ...
> >>>>
> >>>>>      pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
> >>>>
> >>>> ... this and the shift immediately ahead would also be a problem afaict,
> >>>> which makes me conclude this isn't what Coverity has looked at. I expect
> >>>> the problem is with the toolstack side definition of PAGE_SIZE, which imo
> >>>> would rather be addressed there. (And yes, I'm pretty averse to arbitrary
> >>>> casts like this being introduced.)
> >>>
> >>> As I've realized while looking at this, wouldn't ma_va_bottom_mask
> >>> also better be of type paddr_t, since it's not operating on pfns, but
> >>> physical addresses.  I didn't adjust the type of ma_va_bottom_mask,
> >>> but I would be happy to do it if you agree.
> >>
> >> No, as its name says it's also used on virtual addresses (really: offsets
> >> into the direct map). It hence would better not have any bits set outside
> >> of the range that VAs can cover.
> > 
> > It's confusing that it's sometimes used against a paddr_t or an
> > unsigned long type.  The logic itself already limits the shift so it's
> > below the width of unsigned long AFAICT.
> 
> Well, the variable simply doesn't need to be wider than the narrowest type
> it's used with.
> 
> >> With that, imo the cast (if any) also
> >> should have been to unsigned long, not paddr_t. Yet as said, im the cast
> >> would better not be there in the first place. Just that meanwhile I've
> >> learned that this was committed already.
> > 
> > Sorry, I should have waited for your opinion.
> > 
> > I think you would prefer the patch below.
> 
> Yes.
> 
> >  I can send this formally,
> > not sure whether you would prefer a formal revert of the previous
> > patch, plus the new fix applied, or doing the revert in the new patc
> > (like below) is fine.
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I don't see a strong need for an outright revert.

I've adjusted UL -> L as requested by Andrew, and added the following
commit message:

tests/pdx: define PAGE_SIZE as long

Otherwise Coverity complains about possibly shifting an integer more than
31 bits.

This also reverts the previous attempt to fix this Coverity reported
issue, commit 4dd323029094d93dbc8d174fe744fd7f54f0a7a4.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Coverity ID: 1662707
Fixes: cb50e4033717 ('test/pdx: add PDX compression unit tests')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

Let me know if you are OK with the adjustment and commit message.

Thanks, Roger.

