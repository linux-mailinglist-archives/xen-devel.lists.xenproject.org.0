Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C627321D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 20:43:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQlo-0007RZ-2V; Mon, 21 Sep 2020 18:42:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sGfq=C6=gmail.com=minchan.kim@srs-us1.protection.inumbo.net>)
 id 1kKQlm-0007RU-Dz
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:42:34 +0000
X-Inumbo-ID: e9c464a3-575c-487b-bcbe-227ab60205d4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9c464a3-575c-487b-bcbe-227ab60205d4;
 Mon, 21 Sep 2020 18:42:33 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id z18so10067544pfg.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 11:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GC8sasDcUUtfwQI8cKe8C4MyvaXt20t2jZSBkvmxcKE=;
 b=PJIO62ljOyN+1oeIjex1hvkPe/kAXRdHMt2EuQnA7LXWMDOfzFJMe9X1NF6dCxKuIh
 EhFxtVsOp5Dj9ZEIJWRwPrIwHfaaa+nrRPykZYIAImOwzeCkt2RIpZu/a8MFyx/1HUYu
 JPeseNB397GZY/NIsuxhnZcN+rfWQhgzOB3CbDYGMxzldcRBPGGrvGQLvcSbfPtCzSnN
 8IpqjPYrO7za6eiQMYDcaiwTFY5V0R0Up+iputxQPdeN3wyYPyeJeDCwnYfUzTuu39gr
 zSX+fTMi1+vbhHa3PM7rwXb3APyjh8XPjYeiQH8eQIRJUs0AbvMttuiUz20Vdld2OX3J
 Dteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=GC8sasDcUUtfwQI8cKe8C4MyvaXt20t2jZSBkvmxcKE=;
 b=EVPvGaBr2SM38tOZy3Z6Iefqpynk/Vx8iqretR71gEisktSlV5bgG9wCGLWQPsUGTi
 6IJEkdc8PFWXw08SpRdq7t2mu0G1ODccEhkOyGSyT+Fw07V8WYuni50RHUQbGmwM/qF6
 8IUoL/5esv/70G27wQtHc00hT2zPoYfKaDRf1dVXB8BOzrdE8yvdxjhQqZQ/17wyeobJ
 viYpkIAdNb60SELCbifw/DLk44LGpC+EXnIA+3E8haTZs3zqUl7GkGO1RFxOQ8MCUpvI
 DDQsb32owm32va5+2TMD34s1np4k7RlacjeyRsYZ23ILnVQ5PLtOsfVpDb39OB00lE/Y
 jngw==
X-Gm-Message-State: AOAM533Fs61OelPXA+lPRuYS4jdpET9HKqq5vX1rPtftFYugKmQCVIEC
 oca6Ynkt7fsGGzGUZLXdjqM=
X-Google-Smtp-Source: ABdhPJyIYDaB5wxRnaHeVNF92ISZZsgvCaNReLLtTysYEz7UGmPMJ8HW/tA7CIa5ivCFQs4Qv4vx5Q==
X-Received: by 2002:aa7:8a46:0:b029:142:2501:398a with SMTP id
 n6-20020aa78a460000b02901422501398amr993477pfa.79.1600713752207; 
 Mon, 21 Sep 2020 11:42:32 -0700 (PDT)
Received: from google.com ([2620:15c:211:1:7220:84ff:fe09:5e58])
 by smtp.gmail.com with ESMTPSA id i25sm13004358pgi.9.2020.09.21.11.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:42:31 -0700 (PDT)
Date: Mon, 21 Sep 2020 11:42:29 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/6] zsmalloc: switch from alloc_vm_area to get_vm_area
Message-ID: <20200921184229.GA422329@google.com>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-2-hch@lst.de>
 <20200921174256.GA387368@google.com> <20200921181708.GA2067@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921181708.GA2067@lst.de>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 21, 2020 at 08:17:08PM +0200, Christoph Hellwig wrote:
> On Mon, Sep 21, 2020 at 10:42:56AM -0700, Minchan Kim wrote:
> > IIRC, the problem was runtime pte popluating needs GFP_KERNEL but
> > zs_map_object API runs under non-preemtible section.
> 
> Make sense.
> 
> > > -	area->vm = alloc_vm_area(PAGE_SIZE * 2, NULL);
> > > +	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
> > >  	if (!area->vm)
> > >  		return -ENOMEM;
> > >  	return 0;
> > 
> > I think it shoud work.
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 05789aa4af12..6a1e4d854593 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -2232,7 +2232,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
> >  	arch_enter_lazy_mmu_mode();
> >  
> >  	do {
> > -		if (create || !pte_none(*pte)) {
> > +		if ((create || !pte_none(*pte)) && fn) {
> >  			err = fn(pte++, addr, data);
> >  			if (err)
> >  				break;
> > diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> > index 3e4fe3259612..9ef7daf3d279 100644
> > --- a/mm/zsmalloc.c
> > +++ b/mm/zsmalloc.c
> > @@ -1116,6 +1116,8 @@ static struct zspage *find_get_zspage(struct size_class *class)
> >  #ifdef CONFIG_ZSMALLOC_PGTABLE_MAPPING
> >  static inline int __zs_cpu_up(struct mapping_area *area)
> >  {
> > +	int ret;
> > +
> >  	/*
> >  	 * Make sure we don't leak memory if a cpu UP notification
> >  	 * and zs_init() race and both call zs_cpu_up() on the same cpu
> > @@ -1125,7 +1127,13 @@ static inline int __zs_cpu_up(struct mapping_area *area)
> >  	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
> >  	if (!area->vm)
> >  		return -ENOMEM;
> > -	return 0;
> > +
> > +	/*
> > +	 * Populate ptes in advance to avoid pte allocation with GFP_KERNEL
> > +	 * in non-preemtible context of zs_map_object.
> > +	 */
> > +	ret = apply_to_page_range(&init_mm, NULL, PAGE_SIZE * 2, NULL, NULL);
> > +	return ret;
> 
> I think this needs the addr from the vm area somewhere..

Yeah, let's assign the addres we got get_vm_area.

> 
> We probaby want to add a trivial helper to prefault an area instead of
> the open coded variant.

It seems zsmalloc is only customer the function so let's have the helper
when we see another customer.

If we don't have objection, I'd like to ask to Andrew fold this up.

---
 mm/memory.c   | 2 +-
 mm/zsmalloc.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 05789aa4af12..6a1e4d854593 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2232,7 +2232,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	arch_enter_lazy_mmu_mode();
 
 	do {
-		if (create || !pte_none(*pte)) {
+		if ((create || !pte_none(*pte)) && fn) {
 			err = fn(pte++, addr, data);
 			if (err)
 				break;
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 3e4fe3259612..918c7b019b3d 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1125,7 +1125,13 @@ static inline int __zs_cpu_up(struct mapping_area *area)
 	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
 	if (!area->vm)
 		return -ENOMEM;
-	return 0;
+
+	/*
+	 * Populate ptes in advance to avoid pte allocation with GFP_KERNEL
+	 * in non-preemtible context of zs_map_object.
+	 */
+	return apply_to_page_range(&init_mm, (unsigned long)area->vm->addr,
+			PAGE_SIZE * 2, NULL, NULL);
 }
 
 static inline void __zs_cpu_down(struct mapping_area *area)
-- 
2.28.0.681.g6f77f65b4e-goog


