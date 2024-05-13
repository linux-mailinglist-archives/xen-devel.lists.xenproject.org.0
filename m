Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3028C3CD7
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 10:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720709.1123624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6QfN-0006YX-4A; Mon, 13 May 2024 08:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720709.1123624; Mon, 13 May 2024 08:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6QfN-0006X3-1E; Mon, 13 May 2024 08:04:13 +0000
Received: by outflank-mailman (input) for mailman id 720709;
 Mon, 13 May 2024 08:04:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6QfL-0006Wu-B0
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 08:04:11 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6095d4f5-10ff-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 10:04:10 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-43df751b5b8so26694781cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 01:04:10 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df56ddd77sm52324351cf.92.2024.05.13.01.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 01:04:08 -0700 (PDT)
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
X-Inumbo-ID: 6095d4f5-10ff-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715587449; x=1716192249; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rjFDyNE0Bma0WbeZjIZz33kb6FYOzh5eHByKzczNbH4=;
        b=C+8zTSD79rYfcYq0Nbh9NGjlyzYY374gdf28eY34kNjBgDdVrv2l4gQl6NHHqvjBNI
         zLH1UYosCGhtDVgJQTx9JWtV7wuCi2x92Ytlkx/P78m/6v1hoRlUc4j/uk9CCP/7j1dy
         E5Xu6NM8jy37zi0DC2DZWxMbDDrnbxWGSXuE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715587449; x=1716192249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjFDyNE0Bma0WbeZjIZz33kb6FYOzh5eHByKzczNbH4=;
        b=IaYSSt4Bm51VSDdhjuN/clam/JQ6AFfmAZZWFpgQOmbQjlpLbFnE7fDjbZC0IEHYFf
         1mu8mRIymuV2rZ1EPze4ea6kFSV+JHU34wOQk/xj2UUHeQmBwkF+1DZfMapjEIJt+CFW
         LRBZk7hAi/OgLEBAnMpUQC8q/OxTGJWFadD6k03EKLhRHMshS29w0U7ccLgyJl+GxrpC
         H0tnMK0WSXsnU4EcTNR+z87OQJ1eFuJny+LAdryeJIR1GNZP6V0N+WjLXtyy9NTtBG1s
         2PmmTeqNo7oUfWBrzbKeuaagfCqpLikqpxjcbzva5SvrZ966hBvN/ppvDAXrjWxbYvx8
         vBlg==
X-Forwarded-Encrypted: i=1; AJvYcCWVFbZJDWKSD6RpbRrCKR972awVgjFWWQ6vrJ8jO5vYsixIe6tPitamF8vmMffMRanoBirhIg7QSXNP15M51ehJ/ct5MPBKt0dkT9AswRM=
X-Gm-Message-State: AOJu0YyNY6EvCUIqpQ2PmZwGXWja76UTbnLBfvjko21vfMQZVNwtTG/S
	Mtw5uSngm+7HpwvlSDvvLDKmQovv6QHev0FvqDJQ/nQlY7ejDsHQVqTp7u9AKBM=
X-Google-Smtp-Source: AGHT+IHAHc9UBuFgcuXON2WzD3TXDJHqmOdVKpY4SAixdRSr0AxZCL07fL8VxqdyyDWm28HOU+4ByA==
X-Received: by 2002:ac8:7f10:0:b0:43b:9f:5ac8 with SMTP id d75a77b69052e-43dfce579ddmr140191811cf.31.1715587448887;
        Mon, 13 May 2024 01:04:08 -0700 (PDT)
Date: Mon, 13 May 2024 10:04:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Message-ID: <ZkHJdk8b35CgcjJC@macbook>
References: <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
 <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
 <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org>
 <ZjyFxrvHJ04ZlBGg@macbook>
 <bd463f7a-eadf-441f-96e3-3a39f647f160@xen.org>
 <ZjyzTCOSeNvPq2Np@macbook>
 <37b842c7-c46e-4948-8139-a07bfc2a6f37@xen.org>
 <ZjzIWsoRmgmWkgGh@macbook>
 <e1cf9c7c-581d-4bec-acaf-654d40b7ac07@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1cf9c7c-581d-4bec-acaf-654d40b7ac07@xen.org>

On Fri, May 10, 2024 at 10:37:53PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 09/05/2024 13:58, Roger Pau Monné wrote:
> > On Thu, May 09, 2024 at 01:12:00PM +0100, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 09/05/2024 12:28, Roger Pau Monné wrote:
> > > > OTOH for 1GB given the code here the page could be freed in one go,
> > > > without a chance of preempting the operation.
> > > > 
> > > > Maybe you have to shatter superpages into 4K entries and then remove
> > > > them individually, as to allow for preemption to be possible by
> > > > calling put_page() for each 4K chunk?
> > > This would require to allocate some pages from the P2M pool for the tables.
> > > As the pool may be exhausted, it could be problematic when relinquishing the
> > > resources.
> > 
> > Indeed, it's not ideal.
> > 
> > > It may be possible to find a way to have memory available by removing other
> > > mappings first. But it feels a bit hackish and I would rather prefer if we
> > > avoid allocating any memory when relinquishing.
> > 
> > Maybe it could be helpful to provide a function to put a superpage,
> > that internally calls free_domheap_pages() with the appropriate order
> > so that freeing a superpage only takes a single free_domheap_pages()
> > call.
> 
> Today, free_domheap_page() is only called when the last reference is
> removed. I don't thinkt here is any guarantee that all the references will
> dropped at the same time.

I see, yes, we have no guarantee that removing the superpage entry in
the mapping domain will lead to either the whole superpage freed at
once, or not freed.  The source domain may have shattered the
super-page and hence freeing might need to be done at a smaller
granularity.

> >  That could reduce some of the contention around the heap_lock
> > and d->page_alloc_lock locks.
> 
> From previous experience (when Hongyan and I worked on optimizing
> init_heap_pages() for Live-Update), the lock is actually not the biggest
> problem. The issue is adding the pages back to the heap (which may requiring
> merging). So as long as the pages are not freed contiguously, we may not
> gain anything.

Would it help to defer the merging to the idle context, kind of
similar to what we do with scrubbing?

Thanks, Roger.

