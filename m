Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CE8C5684
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721497.1124954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rsQ-00053K-0V; Tue, 14 May 2024 13:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721497.1124954; Tue, 14 May 2024 13:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rsP-000518-Te; Tue, 14 May 2024 13:07:29 +0000
Received: by outflank-mailman (input) for mailman id 721497;
 Tue, 14 May 2024 13:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6rsP-00050y-24
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:07:29 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9ad2926-11f2-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 15:07:28 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43df732cb05so13213461cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:07:27 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e12b42801sm32659671cf.55.2024.05.14.06.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 06:07:26 -0700 (PDT)
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
X-Inumbo-ID: e9ad2926-11f2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715692047; x=1716296847; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nm55sy5L4tLfMCnAnqjy2v6Z96IfSoi9VR5YhkRI+3Q=;
        b=LF8cUrF72txFUib0uc+yptbfuDoADOZCuqbVH+KJ5NG0vEaje2+P6PKXlcah2njGtT
         g1aOU5Cx7VRjhIMmKKW9AS6HZXuZ1ruBGgjpKF2qltiOkId4kziKbG356Ma0k+JuPT1N
         J1jsoHBydAfMdqnqO5muCz6m1CQ4xEIDpNdvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715692047; x=1716296847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm55sy5L4tLfMCnAnqjy2v6Z96IfSoi9VR5YhkRI+3Q=;
        b=YCQ2zox/xZ26GjIdfycPJrknIwhnjwlOowk5K/HfbA9N8lWUtx6QUGvUC/+h5NEXTM
         BySpplUPf1t2YwjRLdX1LHdojk0qgItd7CdPtNQ5UqNhJagHQGHsspS03Bvla+ZD6b8X
         dFOPdL5I12xdbBNX3uwSYX6zrx9UAgA0/0hY3jvSBOW2MwVMcyOAJ1QVyFCbceMUq0Kg
         tK5oY7W3dlfi7mB9zuIoS9EKcvA6fu+2ly6EDYi9WFnrqsiGLAYH1g/Q42mQQW7xO8Uw
         aeQrwEwLvANP81lF+PmTuX8F+V8BNRVqWF3Tia2DkwAPJl31pkWsRCVjRgFvxWJrTj/p
         5ChA==
X-Gm-Message-State: AOJu0YzK8AZYRjMa0o4Ep4VrEXB0np+J78cTAtK07IzNrmZe29UEqHlv
	/Yj5q1UeF1pNItn6G1P+HotQCLGAAAZrPT0VwxaZzeeZViASaece0hHSFNXBWyo=
X-Google-Smtp-Source: AGHT+IHXt0AY1pzIoqtAIJnRpSSOxNa7wjI1BYwXzcE4Won4cnbp7TdYp1JkEpGUo9hTHyTNCc/OEA==
X-Received: by 2002:a05:622a:3d1:b0:43a:4b03:8000 with SMTP id d75a77b69052e-43dfdf9c697mr108672621cf.67.1715692046548;
        Tue, 14 May 2024 06:07:26 -0700 (PDT)
Date: Tue, 14 May 2024 15:07:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 10/19] xen/page_alloc: Add a path for xenheap
 when there is no direct map
Message-ID: <ZkNiDMqk7ijWi7bK@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-11-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-11-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:37PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When there is not an always-mapped direct map, xenheap allocations need
> to be mapped and unmapped on-demand.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>     I have left the call to map_pages_to_xen() and destroy_xen_mappings()
>     in the split heap for now. I am not entirely convinced this is necessary
>     because in that setup only the xenheap would be always mapped and
>     this doesn't contain any guest memory (aside the grant-table).
>     So map/unmapping for every allocation seems unnecessary.

I'm also concerned by this, did you test that
CONFIG_SEPARATE_XENHEAP=y works properly with the added {,un}map
calls?

If CONFIG_SEPARATE_XENHEAP=y I would expect the memory returned by
alloc_heap_pages(MEMZONE_XEN...) to already have the virtual mappings
created ahead?

The comment at the top of page_alloc.c also needs to be updated to
notice how the removal of the direct map affects xenheap allocations,
AFAICT a new combination is now possible:

CONFIG_SEPARATE_XENHEAP=n & CONFIG_NO_DIRECTMAP=y

>     Changes in v2:
>         * Fix remaining wrong indentation in alloc_xenheap_pages()
> 
>     Changes since Hongyan's version:
>         * Rebase
>         * Fix indentation in alloc_xenheap_pages()
>         * Fix build for arm32
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 9b7e4721cd..dfb2c05322 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2242,6 +2242,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
>  void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>  {
>      struct page_info *pg;
> +    void *ret;

virt_addr maybe? ret is what I would expect to store the return value
of the function usually.

>  
>      ASSERT_ALLOC_CONTEXT();
>  
> @@ -2250,17 +2251,36 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>      if ( unlikely(pg == NULL) )
>          return NULL;
>  
> +    ret = page_to_virt(pg);
> +
> +    if ( !has_directmap() &&
> +         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
> +                          PAGE_HYPERVISOR) )
> +    {
> +        /* Failed to map xenheap pages. */
> +        free_heap_pages(pg, order, false);
> +        return NULL;
> +    }
> +
>      return page_to_virt(pg);
>  }
>  
>  
>  void free_xenheap_pages(void *v, unsigned int order)
>  {
> +    unsigned long va = (unsigned long)v & PAGE_MASK;
> +
>      ASSERT_ALLOC_CONTEXT();
>  
>      if ( v == NULL )
>          return;
>  
> +    if ( !has_directmap() &&
> +         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
> +        dprintk(XENLOG_WARNING,
> +                "Error while destroying xenheap mappings at %p, order %u\n",
> +                v, order);
> +
>      free_heap_pages(virt_to_page(v), order, false);
>  }
>  
> @@ -2284,6 +2304,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>  {
>      struct page_info *pg;
>      unsigned int i;
> +    void *ret;
>  
>      ASSERT_ALLOC_CONTEXT();
>  
> @@ -2296,16 +2317,28 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>      if ( unlikely(pg == NULL) )
>          return NULL;
>  
> +    ret = page_to_virt(pg);
> +
> +    if ( !has_directmap() &&
> +         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
> +                          PAGE_HYPERVISOR) )
> +    {
> +        /* Failed to map xenheap pages. */
> +        free_domheap_pages(pg, order);
> +        return NULL;
> +    }
> +
>      for ( i = 0; i < (1u << order); i++ )
>          pg[i].count_info |= PGC_xen_heap;
>  
> -    return page_to_virt(pg);
> +    return ret;
>  }
>  
>  void free_xenheap_pages(void *v, unsigned int order)
>  {
>      struct page_info *pg;
>      unsigned int i;
> +    unsigned long va = (unsigned long)v & PAGE_MASK;
>  
>      ASSERT_ALLOC_CONTEXT();
>  
> @@ -2317,6 +2350,12 @@ void free_xenheap_pages(void *v, unsigned int order)
>      for ( i = 0; i < (1u << order); i++ )
>          pg[i].count_info &= ~PGC_xen_heap;
>  
> +    if ( !has_directmap() &&
> +         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
> +        dprintk(XENLOG_WARNING,
> +                "Error while destroying xenheap mappings at %p, order %u\n",
> +                v, order);

I don't think this should be a dprintk(), leaving mappings behind
could be a severe issue given the point of this work is to prevent
leaking data by having everything mapped on the direct map.

This needs to be a printk() IMO, I'm unsure whether freeing the memory
would need to be avoided if destroying the mappings failed, I can't
think of how we could recover from this gracefully.

Thanks, Roger.

