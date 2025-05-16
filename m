Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF861AB9714
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986452.1372009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq21-0004w0-Fo; Fri, 16 May 2025 08:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986452.1372009; Fri, 16 May 2025 08:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq21-0004tw-D3; Fri, 16 May 2025 08:03:01 +0000
Received: by outflank-mailman (input) for mailman id 986452;
 Fri, 16 May 2025 08:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFq1z-0004kZ-Tw
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:02:59 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e2d3cb2-322c-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 10:02:58 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fcc96b6a64so3523241a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:02:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d080539sm113823866b.66.2025.05.16.01.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 01:02:57 -0700 (PDT)
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
X-Inumbo-ID: 2e2d3cb2-322c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747382578; x=1747987378; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZmLfJIrHVh6aiW+njytaG9i5QdYCwy1E8PQKiz0nDM=;
        b=FeLkTcvYV+NHtmzY904FqHbwMXDjlOjRqtKuDSZguyO9Mj3BuQz/hFpmdZbGhgIdVj
         yJdEtgJ/QFEU5X5LwG7On3TobXSY6ScOMcW1nDR3KlPFTImk8vLZfpRAxrNI5j2jqXuw
         kWbcLYiG+etE+cq8tR4BClGfyY/xxZpQWmzvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382578; x=1747987378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZmLfJIrHVh6aiW+njytaG9i5QdYCwy1E8PQKiz0nDM=;
        b=tWg3dK2pMO/H4ViGC+Y6fY9Ci/ByGM7d+Wc7ZkLZlnhN4e3EJndlY94xv1zIExFvmn
         TQr5KLoBmyHnyZIxtNtJOmWVwnMnvUbFrMTInwg2OGUTv2yIqX3swCoNvvdhS9SrcJkl
         xT4j8rNEtpenphW2VhXeEASMMptWYBjwUivSs1rJt3+GTStTuPrsTK8oNqCBubYs3Esc
         bit3qqeYVXWEwjPHTFb5crDPRvut/z7bwYoLZoVS0weXEJx9hvsj7Eacm4y79ghO0e+e
         Xc4Lb+1DaSo5ifI99X67TJhOo6yarPc0E6mRLEWm9kN/ifDOZ7a/8TKhWN3JbG5PyhvF
         nnMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuQrcunxsaUK8ANWuC4tirQnlTY67UgqqETSsMkxvi7890Mj7SB5dHGqUWYmnooUb4VE/7GNnfWlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOvcUaYTsZ1V7CzEdgUJ+x4SObjwVbbzw4atIGQYwI4AjHSvXO
	YZeCxn9lWVyxdzamPgCmUq37V9fZJoGA9OyhNVdqujolqOhkhLe60uFhyLqDsJlT9kc=
X-Gm-Gg: ASbGnctd87hb2gwcF08sI2CKM1bI46vefelq3UbXB0TBUd+igLbzvatGM1x4IP5ofzO
	TmLRipEHoPyrNlGkSigU4eQ1Wss5ssbssX4Ja2onaMlB+yKgHzQQbbjJuePxDKJt7vU7CA0jBnq
	Fr4rVwI4LZve73g0azkEdJxdsCN5rg5Lmfrt7IVGinRhEYYypKPP1w4AKgSBI6OqN2j0k2o27NX
	5culqwF0eqWyw+jmBD0mBbbtIxJifpmjBgS0NsGEmLE48UtHhp3ZIlW8gKpBXnOUvrYWiQ7Vi1i
	jvjnpznBgfL3CddpWKu0pG8joBXd7SxoqjvxwEH+SJ6BbDPihr5Ip1fcQBQBuQU4E3c/pPL8CEl
	gFHl7VRzPRsKbgeIComejWsMNbXIFFA==
X-Google-Smtp-Source: AGHT+IEH5H/0YHS5tfd01keWH6IiwtBO1+bO+w7LN9/yRhvEMjos/6L0jbbV2r49AHi/xJ6McXxOpw==
X-Received: by 2002:a17:907:9628:b0:ad5:10e6:437b with SMTP id a640c23a62f3a-ad52d5d46e6mr277903566b.48.1747382577738;
        Fri, 16 May 2025 01:02:57 -0700 (PDT)
Date: Fri, 16 May 2025 10:02:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
Message-ID: <aCbxMF9Uj4eBPMAf@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
 <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
 <aCXB5zpqGfBrPTZy@macbook.lan>
 <205a65d3-92bd-4281-8605-758ca03fcac5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <205a65d3-92bd-4281-8605-758ca03fcac5@suse.com>

On Fri, May 16, 2025 at 09:07:43AM +0200, Jan Beulich wrote:
> On 15.05.2025 12:28, Roger Pau Monné wrote:
> > On Mon, May 12, 2025 at 05:16:02PM +0200, Jan Beulich wrote:
> >> On 06.05.2025 10:31, Roger Pau Monne wrote:
> >>> To better describe the underlying implementation.  Define
> >>> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
> >>> current users of cache_flush_permitted() are not effectively modified.
> >>>
> >>> With the introduction of the new handler, change some of the call sites of
> >>> cache_flush_permitted() to instead use has_arch_io_resources() as such
> >>> callers are not after whether cache flush is enabled, but rather whether
> >>> the domain has any IO resources assigned.
> >>>
> >>> Take the opportunity to adjust l1_disallow_mask() to use the newly
> >>> introduced has_arch_io_resources() macro.
> >>
> >> While I'm happy with everything else here, to me it's at least on the
> >> edge whether cache_flush_permitted() wouldn't be the better predicate
> >> to use there, for this being about ...
> >>
> >>> --- a/xen/arch/x86/mm.c
> >>> +++ b/xen/arch/x86/mm.c
> >>> @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
> >>>  
> >>>  #define l1_disallow_mask(d)                                     \
> >>>      (((d) != dom_io) &&                                         \
> >>> -     (rangeset_is_empty((d)->iomem_caps) &&                     \
> >>> -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
> >>> +     (!has_arch_io_resources(d) &&                              \
> >>>        !has_arch_pdevs(d) &&                                     \
> >>>        is_pv_domain(d)) ?                                        \
> >>>       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
> >>
> >> ... cachability, which goes hand in hand with the ability to also
> >> flush cache contents.
> > 
> > Hm, I was on the edge here, in fact I've previously coded this using
> > cache_flush_permitted(), just to the change back to
> > has_arch_io_resources().  If you think cache_flush_permitted() is
> > better I'm fine with that.
> 
> I think that would be better here, yet as you say - it's not entirely
> clear cut either way.

I've reverted this chunk of the change and left the code as-is for the
time being.

> >> Tangentially - is it plausible for has_arch_io_resources() to return
> >> false when has_arch_pdevs() returns true? Perhaps there are exotic
> >> PCI devices (but non-bridges) which work with no BARs at all ...
> > 
> > I guess it's technically possible, albeit very unlikely?  How would
> > the OS interact with such device then, exclusively with PCI config
> > space accesses?
> 
> Yes, that's what I'd expect for such devices. Looking around, there
> are numerous such devices (leaving aside bridges). Just that it looks
> implausible to me that one would want to pass those through to a guest.

Well, we also need to consider dom0 here (either PV or PVH), which
will get those devices passed through.  I assume those are mostly
system devices, and hence there's usually no interaction of the OS
with them.

I'm thinking that our definition of cache_flush_permitted() is not
fully accurate then, we would need to also account for any PCI devices
being assigned to the guest, even if those have no IO resources?

Thanks, Roger.

