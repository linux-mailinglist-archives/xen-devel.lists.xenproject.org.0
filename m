Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE0AA442F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 09:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973464.1361581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA24Z-0005xs-DZ; Wed, 30 Apr 2025 07:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973464.1361581; Wed, 30 Apr 2025 07:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA24Z-0005v5-B0; Wed, 30 Apr 2025 07:41:39 +0000
Received: by outflank-mailman (input) for mailman id 973464;
 Wed, 30 Apr 2025 07:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qtXD=XQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uA24Y-0005uz-Jo
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 07:41:38 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 890a08c7-2596-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 09:41:33 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-736c277331eso639260b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 00:41:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7403991f725sm1022391b3a.52.2025.04.30.00.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 00:41:31 -0700 (PDT)
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
X-Inumbo-ID: 890a08c7-2596-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745998892; x=1746603692; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKhWCt2/Ar1AMFhBPMtsJjqBoZBft5c+tmQ1EZctz9M=;
        b=pcp5fefgdOnq8aMg6nlMl3dqgjRu0PYSWSTK4Rz4iaD1wJl6zgWVl81Kf4OTIOecsY
         5VHnG4ngjKXhRqtjESu7i0qYwO8NsTs+xrjrV9aiycox6DAZENLPmGR2Llh6m1t/kywk
         oqMt2QY7nUDLsdfzT2+/TUSUyprKydxNcDp/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998892; x=1746603692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKhWCt2/Ar1AMFhBPMtsJjqBoZBft5c+tmQ1EZctz9M=;
        b=w7fePFYjyG7HbuRmeewyfleOPhydqqBVAvwjDpHY0cJcJ4wn8IWuEdrL5KvxFzh/U4
         brb8dl4lI5dgZkbg3vi2b/H9wTkBoQxFNeE78jV0wZu09x7Z0P8ydRSuWFqDX88uMiOZ
         9RrGildZ0g4SdHaP8tgp7R3k/qmUlkTF1wa/KX5KBpSPjzGOcIycSgsCXwzZZQR2SOLb
         LceFIFEXbrNlN4qophEfD6maPYJVViAXf7xpl0SU4JDw9CXzPTwZ89K/4D+L41X7VlDj
         laDVpebwKTVjw5QReUMxoBT4XIHSai5RspDv4lH0kgLlC5H3OLUUEYsH3cZZ4+y+z6Aw
         1EJA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ixti42Rve7B5UjJWU71IFjBIBpLUeMGGoAWDbW0oYBJ92yKp9UCx5POiMyJw54K8xMBA5oatwrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuIntlRfcA0AtB4uxbqD6NNwXjDlxi1a5Aj6gP5mhHWLy0Rm0L
	9xb0/+4HpKU5YfHCxH/yW93F1vObCt8Q0rmLSJ2BASo8DVyJEEP7Lf3hDQAS3QU=
X-Gm-Gg: ASbGncv/pfQr1D02s5qw0OFuRbhmsgHFik5qe2R6v0W2xS+jkwFqekcburraMjIGoTl
	D8dYNfV/DNjGFbKPwHQLDm0BWz8G2Os7oW4rTK+X7a+BXH0dvMe5Yg2eWoVXdT7z6enivZxT0yp
	PZepBfEj+yDWxwjGF/tZTEPj9jd93AjP7zvyB0RQTBAtLEiiwDSrx+7PW1MWi4IhgJoJzoFVCOB
	l23mNgDiludOwqguLEQPe9mLPu+9nW/glVs80Ug4vWc8brBZXvvfUj6eUY+pJ9De/L0a1KmPuju
	mMzNTVyb1bqlfuHJGoyTjjYFlqapttJxnYNhlWmTV5NTWQ==
X-Google-Smtp-Source: AGHT+IGdw/bypFbKFPXbjR2E48Wzc2TwcjLMPoUSamvvK/g5RRw0TvulM6BoMQiJ3WLF5MmMLMyIXA==
X-Received: by 2002:a05:6a21:1585:b0:1ee:b5f4:b1d7 with SMTP id adf61e73a8af0-20a8e65a70emr2895145637.7.1745998891628;
        Wed, 30 Apr 2025 00:41:31 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:41:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
	agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aBHUJjQk248aLi68@macbook.lan>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
 <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop>
 <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com>

On Wed, Apr 30, 2025 at 08:27:55AM +0200, Jan Beulich wrote:
> On 29.04.2025 23:52, Stefano Stabellini wrote:
> > On Tue, 29 Apr 2025, Jan Beulich wrote:
> >> On 28.04.2025 22:00, Stefano Stabellini wrote:
> >>> On Mon, 28 Apr 2025, Jan Beulich wrote:
> >>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
> >>>>> --- a/xen/arch/x86/mm.c
> >>>>> +++ b/xen/arch/x86/mm.c
> >>>>> @@ -4401,7 +4401,7 @@ int steal_page(
> >>>>>      const struct domain *owner;
> >>>>>      int rc;
> >>>>>  
> >>>>> -    if ( paging_mode_external(d) )
> >>>>> +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
> >>>>>          return -EOPNOTSUPP;
> >>>>>  
> >>>>>      /* Grab a reference to make sure the page doesn't change under our feet */
> >>>>
> >>>> Is this (in particular the code following below here) a safe thing to do
> >>>> when we don't properly refcount page references from the P2M, yet? It's
> >>>> Dom0, yes, but even there I might see potential security implications (as
> >>>> top violating privacy of a guest).
> >>>
> >>> I don't think I am following, could you please elaborate more? The
> >>> change I am proposing is to allow Dom0 to share its own pages to the
> >>> co-processor. DomUs are not in the picture. I would be happy to add
> >>> further restriction to that effect. Is there something else you have in
> >>> mind?
> >>
> >> Once "shared" with the PSP, how would Xen know that this sharing has stopped?
> >> Without knowing, how could it safely give the same page to a DomU later on?
> >> ("Safely" in both directions: Without compromising privacy of the DomU and
> >> without compromising host safety / security.)
> > 
> > Why would Xen later assign the same page to a DomU? The page comes
> > from the hardware domain, which, as of today, cannot be destroyed. BTW I
> > realize it is a bit different, but we have been doing the same thing
> > with Dom0 1:1 mapped on ARM since the start of the project.
> 
> The life cycle of the page within Dom0 may be such that a need arises to
> move it elsewhere (balloon out, grant-transfer, and what not).

I think it's up to dom0 to make sure the page is handled
appropriately, in order for it to keep it's special contiguity
properties.

If the PSP is not using the IOMMU page-tables for DMA accesses, and
the hardware domain can freely interact with it, there's no protection
from such device accessing any random MFN on the system, and hence no
refcounts or similar will protect from that.

The only protection would be Xen owning the device, and the hardware
domain using an emulated/mediated interface to communicate with it.  I
have no idea how complicated the PSP interface is, and whether it
would be feasible to trap and emulate/mediate accesses in Xen.

> >>>>> --- a/xen/common/memory.c
> >>>>> +++ b/xen/common/memory.c
> >>>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> >>>>>              rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> >>>>>                                          exch.out.extent_order) ?: rc;
> >>>>>  
> >>>>> -            if ( !paging_mode_translate(d) &&
> >>>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
> >>>>>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
> >>>>>                                              (i << out_chunk_order) + j,
> >>>>>                                              mfn) )
> >>>>
> >>>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
> >>>> it?
> >>>
> >>> One way or another Dom0 PVH needs to know the MFN to pass it to the
> >>> co-processor.
> >>
> >> I see. That's pretty odd, though. I'm then further concerned of the order of
> >> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
> >> same upper bound. With both CPU and I/O side translation there is, in
> >> principle, no reason to permit any kind of contiguity. Of course there's a
> >> performance aspect, but that hardly matters in the specific case here. Yet at
> >> the same time, once we expose MFNs, contiguity will start mattering as soon
> >> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
> >> make tightening of the presently lax handling prone to regressions in this
> >> new behavior you're introducing. What chunk size does the PSP driver require?
> > 
> > I don't know. The memory returned by XENMEM_exchange is contiguous,
> > right? Are you worried that Xen cannot allocate the requested amount of
> > memory contiguously?
> 
> That would be Dom0's problem then. But really for a translated guest the
> exchanged chunks being contiguous shouldn't matter, correctness-wise. That is,
> within Xen, rather than failing a request, we could choose to retry using
> discontiguous chunks (contiguous only in GFN space). Such an (afaict)
> otherwise correct change would break your use case, as it would invalidate the
> MFN information passed back. (This fallback approach would similarly apply to
> other related mem-ops. It's just that during domain creation the tool stack
> has its own fallback, so it may not be of much use right now.)

I think the description in the public header needs to be expanded to
specify what the XENMEM_exchange does for translated guests, and
clearly write down that the underlying MFNs for the exchanged region
will be contiguous.  Possibly a new XENMEMF_ flag needs to be added to
request contiguous physical memory for the new range.

Sadly this also has the side effect of quite likely shattering
superpages for dom0 EPT/NPT, which will result in decreased dom0
performance.

We have so far avoided exposing MFNs to HVM/PVH, but I don't see much
way to avoid this if there's no option to use IOMMU or NPT page-tables
with the PSP and we don't want to intercept PSP accesses in Xen and
translate requests on the fly.

Thanks, Roger.

