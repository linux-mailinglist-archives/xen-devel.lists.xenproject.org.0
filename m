Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9712730FF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 19:44:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKPqC-0001Ot-6W; Mon, 21 Sep 2020 17:43:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sGfq=C6=gmail.com=minchan.kim@srs-us1.protection.inumbo.net>)
 id 1kKPq9-0001Oo-Ve
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 17:43:02 +0000
X-Inumbo-ID: 614f4c2f-9cf5-4b04-b3f7-8a85f812c8ec
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 614f4c2f-9cf5-4b04-b3f7-8a85f812c8ec;
 Mon, 21 Sep 2020 17:43:00 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f2so9677747pgd.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QtMGv9Az8n8/1NHjLi6o0NjvgH4+/FeF5Ci7mHb3HKk=;
 b=C7h6inMmXViVfdzLNOvFuTTw5gDP/PsNQbK7XEZloBeiZ8TI/21zMOjn7CNA+2JpdR
 fcqHDQGOwu00JGZ24OItIms+ocEi5vn4ArXzVIiiv3IsrWX58V+/xvf5GAM6uWt45WHV
 J5uOcJSwwSsyQG3DI06e7LXhdO9u9oPEpVS+RmLizgAmeHXs0yGsQU1nOXkBOVIfgxKA
 R2QFqMXS/jWK8IGcmqN0UiZJVAO1wKzNqskrF4+I7n3VyZXcnkek4EZphD0W4XzFqzOv
 ok0cZ2Pc39gKnqlEn4+P3Rhkp0HO3HdeqOVIlHDzJsQPR318T1EvvNwcSWIeqku82piy
 vqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=QtMGv9Az8n8/1NHjLi6o0NjvgH4+/FeF5Ci7mHb3HKk=;
 b=pm0txfM9y+dHobRVJl49oqI5k2UeZBXQQYCQFPROx+i/CellAs0G5SBmxlN1Ej6loI
 7fsYx+sLhECrSY1mT13mYhix+Ys7aMsaZBmD+y1/uwHCqxMcnf1GyZ9NdSy6iJgwotzV
 sKN6WNMGsxRkGaOQ23aLn2WaW55xr5Gd6gwOO1lJXAPykjI6aMsnJYzf+twsnb4fsorl
 bdTaLkTfJmx+rnG44/bgwuvhn/X2hc/6kptKzgvLOP/pP3csBv6i0WX/rQqc0/GMaScF
 eqJJAMhd/eLhLJjZFSKSwhL9nN3qaQ806JjNRARpUEwfyotQmFwucg8geOOVE9N6IrcP
 HIgA==
X-Gm-Message-State: AOAM533zuR8jmZ3VVK10W0BdQKFUVLKmlbrykid1NJde2s4RWg5FcJMW
 tnonK/EZvBZppJ5RAvk0H3s=
X-Google-Smtp-Source: ABdhPJz3bQvQ0y+Tkl35pFZsVWVp7/jEG6xMj1AV8L7OC4sV/ELLhXdmGbDdT9tBGrtDXWjgu18MoQ==
X-Received: by 2002:a17:902:8695:b029:d2:29b:991a with SMTP id
 g21-20020a1709028695b02900d2029b991amr1034190plo.80.1600710179810; 
 Mon, 21 Sep 2020 10:42:59 -0700 (PDT)
Received: from google.com ([2620:15c:211:1:7220:84ff:fe09:5e58])
 by smtp.gmail.com with ESMTPSA id ca6sm123394pjb.53.2020.09.21.10.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 10:42:58 -0700 (PDT)
Date: Mon, 21 Sep 2020 10:42:56 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
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
Message-ID: <20200921174256.GA387368@google.com>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918163724.2511-2-hch@lst.de>
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

On Fri, Sep 18, 2020 at 06:37:19PM +0200, Christoph Hellwig wrote:
> There is no obvious reason why zsmalloc needs to pre-fault the PTEs
> given that it later uses map_kernel_range to just like vmap().

IIRC, the problem was runtime pte popluating needs GFP_KERNEL but
zs_map_object API runs under non-preemtible section.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/zsmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index c36fdff9a37131..3e4fe3259612fd 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -1122,7 +1122,7 @@ static inline int __zs_cpu_up(struct mapping_area *area)
>  	 */
>  	if (area->vm)
>  		return 0;
> -	area->vm = alloc_vm_area(PAGE_SIZE * 2, NULL);
> +	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
>  	if (!area->vm)
>  		return -ENOMEM;
>  	return 0;

I think it shoud work.

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
index 3e4fe3259612..9ef7daf3d279 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1116,6 +1116,8 @@ static struct zspage *find_get_zspage(struct size_class *class)
 #ifdef CONFIG_ZSMALLOC_PGTABLE_MAPPING
 static inline int __zs_cpu_up(struct mapping_area *area)
 {
+	int ret;
+
 	/*
 	 * Make sure we don't leak memory if a cpu UP notification
 	 * and zs_init() race and both call zs_cpu_up() on the same cpu
@@ -1125,7 +1127,13 @@ static inline int __zs_cpu_up(struct mapping_area *area)
 	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
 	if (!area->vm)
 		return -ENOMEM;
-	return 0;
+
+	/*
+	 * Populate ptes in advance to avoid pte allocation with GFP_KERNEL
+	 * in non-preemtible context of zs_map_object.
+	 */
+	ret = apply_to_page_range(&init_mm, NULL, PAGE_SIZE * 2, NULL, NULL);
+	return ret;
 }
 
 static inline void __zs_cpu_down(struct mapping_area *area)


