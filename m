Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E602A995B5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 18:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964998.1355667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7dGs-0005tr-0l; Wed, 23 Apr 2025 16:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964998.1355667; Wed, 23 Apr 2025 16:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7dGr-0005rP-U8; Wed, 23 Apr 2025 16:48:25 +0000
Received: by outflank-mailman (input) for mailman id 964998;
 Wed, 23 Apr 2025 16:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJp7=XJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1u7dGq-0005rJ-Jj
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 16:48:24 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c47db621-2062-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 18:48:22 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30db1bc464dso1506021fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 09:48:22 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3109075f28dsm19415671fa.6.2025.04.23.09.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 09:48:20 -0700 (PDT)
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
X-Inumbo-ID: c47db621-2062-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745426902; x=1746031702; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQS+oR9s8FG/Q5RPJOqhZ2ex/ZXUmEGeaT5QJ6emN/U=;
        b=Fg2jsPbC990KAmuucdHAZArV7jwMqn82FAdJLnzjQqVjp/LFfVoDlek//AGHPNoOeE
         cVlS6A00V8xlbA09IrKjRa0Pg5/BE3CsjWkYDcR4XwJP6CssaI7fCTcBVNZbObfpQahE
         OpX/FNl/1KZ4TrbvvA+3siocMUnkSknK9IiqxluldSpWiNrBk2PsajrQEzkl5izLpL+u
         GP8V915rDsGG+xMeHA4FmxsWlJFsOjmmfty9g0jViDap1A0Mf8ITePX1Nsb7q1pZfnm/
         vbJWOE6doHyDqStUQxL+5HW4JmTB1IdShPF/r2/H3jyGGiV8OUkIgr7Q2HdcgKctojNJ
         AAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426902; x=1746031702;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQS+oR9s8FG/Q5RPJOqhZ2ex/ZXUmEGeaT5QJ6emN/U=;
        b=ISaLN/g1vd6uWNwyp3npEZJapof4SbRwTCN1f5Lt+tOAMgWLlJ8kClnoijFyBfhWF8
         SFKlLqBRW/zU/HegKg/Jq7GjGXt/5mCipud7IDrGIHSXDeOP+HBDmFVQ0zmEZDTF61MQ
         hcUDA9LaGZohFpysq8/5Sdw2BI7O0nj6S4U4IdUsdS9gpqRImr7PhKyMacY0+u6ruXE2
         RP1YdULB2BLey4815PTg7YPmEOl3DG82Pdwqmyj7qENVXw2PrUuhCNNwiqexbsehcvYo
         4vQQJm2fVpzSA6VEqQ5DkNTHEvH0ugDD3R5ugCpwdnS2a0Qdm53NnkofyHiIwEKmLzwk
         fWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn47o8nsOSrNrzeRHjLhCpE+eaoK9sX58hrkOZ0PP5MIXU95frWZ2tbmpHnoIGs40yJODO1j0xXwA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL1b3AI5CO0qkLjbck48/nmydrk9fmZb3RAVKsmYB8PT5h1GCy
	6RPhBI6unqJ1M9nGpcfe1cEr1WZC0DKJIA5DejurdycCM200qtmR
X-Gm-Gg: ASbGncvdWSVm3JNwJWmG04cNAgnH7gUPUuFxZXf/MBCnOujzWif31OHFAf6niSXdPhv
	3Oh3/LHsbpl8XOVauSYjOlpC7F0fGHADLRLBNPbAUyrqK/X1Qe0kGmYcVwd+oFl6QoSHRjpifG4
	61P5T5dStGYeP0cymdsYocq3qlP0zvSIhy9GMgS4NtHk2D9faQ3j2Yw1a730Yohqmj4pAr759+T
	0SyIqGY7D0AGj0ITyAgSKElFcoR0LDVKACYbAu/C7Oed3WLVgaiQ3Q9RXtGHH37tjuQgSgocqVC
	ByTg+4e+8z6YYuhkmRlJkXQHRwZdNYwpuGNu3dLFXq723yAH0ohWGPyeCYIqwOyUSPP3XVdIgCm
	Yc2Bx8FsRSAnI
X-Google-Smtp-Source: AGHT+IH7O1iiDddCO89yvZWH7Be7H2ryLRucKswHDEdPt9gWFhhsHNxHjpkzMogRjLrNlf6lejAH5w==
X-Received: by 2002:a2e:ab19:0:b0:30b:d5ed:55c7 with SMTP id 38308e7fff4ca-3109057628emr72700781fa.36.1745426901514;
        Wed, 23 Apr 2025 09:48:21 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:48:19 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Aleksandr Partanen <alex.pentagrid@gmail.com>, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] xen: mapcache: Fix finding matching entry
Message-ID: <aAkZ04aPs7XGBiOM@zapote>
References: <20250410144604.214977-1-alex.pentagrid@gmail.com>
 <alpine.DEB.2.22.394.2504181638300.785180@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2504181638300.785180@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Fri, Apr 18, 2025 at 04:39:04PM -0700, Stefano Stabellini wrote:
> On Thu, 10 Apr 2025, Aleksandr Partanen wrote:
> > If we have request without lock and hit unlocked or invalid
> > entry during the search, we remap it immediately,
> > even if we have matching entry in next entries in bucket.
> > This leads to duplication of mappings of the same size,
> > and to possibility of selecting the wrong element
> > during invalidation and underflow it's entry->lock counter
> > 
> > Signed-off-by: Aleksandr Partanen <alex.pentagrid@gmail.com>
> 
> Hi Aleksandr, thanks for the patch, it looks correct to me.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> Edgar, would you be able to give it a look as well to make sure?


Looks good to me too, thanks!

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>




> 
> 
> > ---
> >  hw/xen/xen-mapcache.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index 698b5c53ed..2c8f861fdb 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -376,12 +376,12 @@ tryagain:
> >  
> >      entry = &mc->entry[address_index % mc->nr_buckets];
> >  
> > -    while (entry && (lock || entry->lock) && entry->vaddr_base &&
> > -            (entry->paddr_index != address_index || entry->size != cache_size ||
> > +    while (entry && (!entry->vaddr_base ||
> > +            entry->paddr_index != address_index || entry->size != cache_size ||
> >               !test_bits(address_offset >> XC_PAGE_SHIFT,
> >                   test_bit_size >> XC_PAGE_SHIFT,
> >                   entry->valid_mapping))) {
> > -        if (!free_entry && !entry->lock) {
> > +        if (!free_entry && (!entry->lock || !entry->vaddr_base)) {
> >              free_entry = entry;
> >              free_pentry = pentry;
> >          }
> > -- 
> > 2.39.5
> > 

