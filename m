Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148DABBC02
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 13:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989741.1373713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGyMB-0002dE-MW; Mon, 19 May 2025 11:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989741.1373713; Mon, 19 May 2025 11:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGyMB-0002aP-Js; Mon, 19 May 2025 11:08:31 +0000
Received: by outflank-mailman (input) for mailman id 989741;
 Mon, 19 May 2025 11:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9i=YD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uGyMA-0002aJ-0r
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 11:08:30 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96b04a30-34a1-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 13:08:28 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-742c73f82dfso852081b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 04:08:27 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742a9829cb7sm5922534b3a.111.2025.05.19.04.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 04:08:25 -0700 (PDT)
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
X-Inumbo-ID: 96b04a30-34a1-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747652906; x=1748257706; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TRgDNN/WJGaTzMAptFGW4O+KglzQsrfQyHkZcI4kRoA=;
        b=WPtPQfJjMtBi6X0WuZHw36nepavAWHJE+a9ECR4CCvxkv879FkYXrx45HKHldxVfPa
         8toPVWHj8qnoGiZ/TYKhADSqPDVhEAGKDrfGozeQU3fyUie03yIlWEEaTbo8Zgq3PtdM
         F8B+6PCYBlUOXSXFuOIqEJyBihBmP9Wh6KBks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652906; x=1748257706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRgDNN/WJGaTzMAptFGW4O+KglzQsrfQyHkZcI4kRoA=;
        b=jAKzrLI2UFfkVTBlfSnK8YIYRJQIkXNpczx/AluljEOqkhn+qzTwHe4Hin3GvvuIPr
         xoGX65CynxySkloCohtoiuGMXvrHn3Nz+0CAt+P+ZAAEd6bpiDZgCZPyWfYsup0qPdgq
         cImPe4PzcNwgSI7KPmAex/rsqnZrMtlklO7BjiHFOwBd4/cdWklXCC2rvEsDTeFQBk4s
         9Ope/7hyfemEa+W1n8LBlA5A7Rr7ym66vxwmXPnvvprGllV5+gHJ27qAfRCSFN1MiM9S
         B4+USNwFMeeLlHEvU6WmF5Ssd3nLd+Kuz/qqQe3nBI8TwD3PpHaZBN1hYQOOIKiOuQEp
         ebOg==
X-Forwarded-Encrypted: i=1; AJvYcCVuP2rw/bDZsN8fP191HydL0ATXXKVKcDLhCrLUoUPDnsfRYJMTaU8Ban7SuUMk8kSdvRV3hKlWLd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxaIvZ6PiFHyxU/LbjTzUfy+80J6qpAQwJ2QWJHml6U6lOxFCd
	aNOIUVuSvASA8J+ZLOh9WZkp+Ai3YMq5rERwV9v1EFGf1KWKImrgf6Yos+TsBgUA0iQ=
X-Gm-Gg: ASbGncvtspy38YxuXmAHEO2tJ4Qev4guLm63NH6/vM1i8rhAUeha3pG/ue5Hoce2MxX
	7iTjiRfTVNbT94Z8ZJ8E26GBo9m2TrGF4E3fnvWK1cVdc/WYmwBvyw+UgxpthQh/7/eTnFNQvyV
	XuOP8X8w9kK8XuBodw5EcJbhW1wISK26vkH9SwvDkwHEZTNJiKDjXogm+7WvlcEmVdCtrxJ0LHm
	ZcCTwWsrY2Hn5JO4SBW6VjCzJwS89jc6w923WbE7JS6fzeb5gIXkFC3r81tiR4o4W9LWanAt+k+
	NAFGxVU6SUbINxZyy7M080AXATTrVr2s91+124cTTxbG8JgidVBYjLeq9qXLXKzKxGDsrvRjDYH
	RzlQYRi0mcg2dV7XkMGYwgZvp
X-Google-Smtp-Source: AGHT+IEoJUNV0yC8LPugppleKXiEO7uQ1XCyjz35X3ubPPbDFDbkerei1o8wC0T1lF7hQoLwKqO53A==
X-Received: by 2002:a05:6a00:ad1:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-742a9776965mr17227248b3a.1.1747652906301;
        Mon, 19 May 2025 04:08:26 -0700 (PDT)
Date: Mon, 19 May 2025 13:08:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/6] x86/hvm: reduce the need to flush caches in
 memory_type_changed()
Message-ID: <aCsRJBmoP-al6Kgk@Mac.lan>
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-7-roger.pau@citrix.com>
 <c01ec6e8-bb45-4072-a527-99a7c72fc714@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c01ec6e8-bb45-4072-a527-99a7c72fc714@suse.com>

On Sun, May 18, 2025 at 01:44:49PM +0200, Jan Beulich wrote:
> On 16.05.2025 11:45, Roger Pau Monne wrote:
> > The current cache flushing done in memory_type_changed() is too wide, and
> > this doesn't scale on boxes with high number of CPUs.  Attempt to limit
> > cache flushes as a result of p2m type changes, and only do them if:
> > 
> >  * The CPU doesn't support (or has broken) self-snoop capability, otherwise
> >    there would be leftover aliases in the cache.  For guest initiated
> >    memory changes (like changes to MTRRs) the guest should already do a
> >    cache flush.
> >  * The IOMMU cannot force all DMA accesses to be snooping ones.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> > Not sure whether this attempt to reduce cache flushing should get some
> > mention in the CHANGELOG.
> 
> Err on the side of adding an entry there?

Oleksii would you be fine with me adding:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1ea06524db20..fa971cd9e6ee 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
  - Linux based device model stubdomains are now fully supported.
+ - On x86:
+   - Restrict the cache flushing done in memory_type_changed() to improve
+     performance.

 ### Added
  - On x86:

Asking whether you provide a RB/Acked-by here so that I don't need to
resend just for the CHANGELOG addition.

> > --- a/xen/arch/x86/hvm/mtrr.c
> > +++ b/xen/arch/x86/hvm/mtrr.c
> > @@ -782,14 +782,21 @@ HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
> >  
> >  void memory_type_changed(struct domain *d)
> >  {
> > -    if ( (is_iommu_enabled(d) || cache_flush_permitted(d)) &&
> > +    if ( cache_flush_permitted(d) &&
> >           d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) &&
> >           /*
> >            * Do the p2m type-change, but skip the cache flush if the domain is
> >            * not yet running.  The check for creation_finished must strictly be
> >            * done after the call to p2m_memory_type_changed().
> >            */
> > -         d->creation_finished )
> > +         d->creation_finished &&
> > +         /*
> > +          * The cache flush should be done if either: CPU doesn't have
> > +          * self-snoop in which case there could be aliases left in the cache,
> > +          * or IOMMUs cannot force all DMA device accesses to be snooped.
> 
> I think this could do with "some" added ahead of IOMMUs (maybe parenthesized),
> to clarify the route to take here if and when we change the global to a finer
> grained property.

Done, thanks.

