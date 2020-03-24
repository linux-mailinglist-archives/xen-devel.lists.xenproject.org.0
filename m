Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B119135F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 15:37:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGkdn-0000aL-Ct; Tue, 24 Mar 2020 14:34:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2LnZ=5J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGkdm-0000a8-2K
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 14:34:50 +0000
X-Inumbo-ID: 9d508d4e-6ddc-11ea-841e-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d508d4e-6ddc-11ea-841e-12813bfff9fa;
 Tue, 24 Mar 2020 14:34:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id z3so20876137edq.11
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 07:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lRU0KPiMf84r+QOQfQrKkGdJY9+/ItH3a3HWqxiP6FE=;
 b=faAsE73Wc0s1DbquaaLUgpz/Rx4Q5OAouUGd6Fd/crRUiHDut8Yk68CVp/iwwFceB9
 CUeJZe4l7T+zjKCxhLMVeih/z8Isl20tiqmaDlqFPOMAm2ZT56zgbvPczAWzhUm9qGkX
 xuJcdwkeqIyspimOz/t2SvS1+TbSgMuHZWDyGmT8bAMyvXk3522myYaEkyiuK//ae6bK
 2vgrBMJNPC56hOz31tFlBiB1MzhoMIo5w3L+yqRGrEBPinnklHVvjgBXifFJePdf3Ijf
 VOHdq3v65dSZyF/asyVp8/hrWkwz9wiMZhJ1Xv7wYn+zUEGeAn9eFLisrMnBYWZIm+5q
 Rfkw==
X-Gm-Message-State: ANhLgQ1BBhgCWCQi778rEpTpXjsS6BSNRpIu04yANsTk900hAHyQv3SS
 ripQEfSO2vuYjZ8PHVb4bNY=
X-Google-Smtp-Source: ADFU+vukn8mIgnC1UB/GU3WyrBXXCyGXXq2FV1HL7XWogB7ZVCDHx7aY7hQ4kkZHyWg8QbZHYzjqnQ==
X-Received: by 2002:a05:6402:17cf:: with SMTP id
 s15mr26462330edy.260.1585060488434; 
 Tue, 24 Mar 2020 07:34:48 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id j10sm197996ejv.13.2020.03.24.07.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 07:34:47 -0700 (PDT)
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200318173243.29183-1-paul@xen.org>
 <20200318173243.29183-2-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c85b5cfb-b690-da2d-0ddc-d0214ba511c4@xen.org>
Date: Tue, 24 Mar 2020 14:34:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318173243.29183-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v4 1/3] mm: keep PGC_extra pages on a
 separate list
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/03/2020 17:32, Paul Durrant wrote:
> This patch adds a new page_list_head into struct domain to hold PGC_extra
> pages. This avoids them getting confused with 'normal' domheap pages where
> the domain's page_list is walked.
> 
> A new dump loop is also added to dump_pageframe_info() to unconditionally
> dump the 'extra page list'.
> 
> Signed-off-by: Paul Durrant <paul@xen.org>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <julien@xen.org>

> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v7:
>   - Cosmetic changes
> 
> v6:
>   - New in v6
> ---
>   xen/arch/x86/domain.c    |  9 +++++++++
>   xen/common/domain.c      |  1 +
>   xen/common/page_alloc.c  |  2 +-
>   xen/include/asm-x86/mm.h |  6 ++----
>   xen/include/xen/mm.h     |  5 ++---
>   xen/include/xen/sched.h  | 13 +++++++++++++
>   6 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index caf2ecad7e..683bc619aa 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -251,12 +251,21 @@ void dump_pageframe_info(struct domain *d)
>           p2m_pod_dump_data(d);
>   
>       spin_lock(&d->page_alloc_lock);
> +
>       page_list_for_each ( page, &d->xenpage_list )
>       {
>           printk("    XenPage %p: caf=%08lx, taf=%" PRtype_info "\n",
>                  _p(mfn_x(page_to_mfn(page))),
>                  page->count_info, page->u.inuse.type_info);
>       }
> +
> +    page_list_for_each ( page, &d->extra_page_list )
> +    {
> +        printk("    ExtraPage %p: caf=%08lx, taf=%" PRtype_info "\n",
> +               _p(mfn_x(page_to_mfn(page))),
> +               page->count_info, page->u.inuse.type_info);
> +    }
> +
>       spin_unlock(&d->page_alloc_lock);
>   }
>   
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index b4eb476a9c..3dcd73f67c 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -403,6 +403,7 @@ struct domain *domain_create(domid_t domid,
>       spin_lock_init_prof(d, page_alloc_lock);
>       spin_lock_init(&d->hypercall_deadlock_mutex);
>       INIT_PAGE_LIST_HEAD(&d->page_list);
> +    INIT_PAGE_LIST_HEAD(&d->extra_page_list);
>       INIT_PAGE_LIST_HEAD(&d->xenpage_list);
>   
>       spin_lock_init(&d->node_affinity_lock);
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 76d37226df..10b7aeca48 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2314,7 +2314,7 @@ int assign_pages(
>           smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>           pg[i].count_info =
>               (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
> -        page_list_add_tail(&pg[i], &d->page_list);
> +        page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
>       }
>   
>    out:
> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
> index a06b2fb81f..1fa334b306 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -629,10 +629,8 @@ typedef struct mm_rwlock {
>       const char        *locker_function; /* func that took it */
>   } mm_rwlock_t;
>   
> -#define arch_free_heap_page(d, pg)                                      \
> -    page_list_del2(pg, is_xen_heap_page(pg) ?                           \
> -                       &(d)->xenpage_list : &(d)->page_list,            \
> -                   &(d)->arch.relmem_list)
> +#define arch_free_heap_page(d, pg) \
> +    page_list_del2(pg, page_to_list(d, pg), &(d)->arch.relmem_list)
>   
>   extern const char zero_page[];
>   
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index d0d095d9c7..a163c201e2 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -583,9 +583,8 @@ static inline unsigned int get_order_from_pages(unsigned long nr_pages)
>   void scrub_one_page(struct page_info *);
>   
>   #ifndef arch_free_heap_page
> -#define arch_free_heap_page(d, pg)                      \
> -    page_list_del(pg, is_xen_heap_page(pg) ?            \
> -                      &(d)->xenpage_list : &(d)->page_list)
> +#define arch_free_heap_page(d, pg) \
> +    page_list_del(pg, page_to_list(d, pg))
>   #endif
>   
>   int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index e6813288ab..4b78291d51 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -329,6 +329,7 @@ struct domain
>   
>       spinlock_t       page_alloc_lock; /* protects all the following fields  */
>       struct page_list_head page_list;  /* linked list */
> +    struct page_list_head extra_page_list; /* linked list (size extra_pages) */
>       struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
>   
>       /*
> @@ -512,6 +513,18 @@ struct domain
>   #endif
>   };
>   
> +static inline struct page_list_head *page_to_list(
> +    struct domain *d, const struct page_info *pg)
> +{
> +    if ( is_xen_heap_page(pg) )
> +        return &d->xenpage_list;
> +
> +    if ( pg->count_info & PGC_extra )
> +        return &d->extra_page_list;
> +
> +    return &d->page_list;
> +}
> +
>   /* Return number of pages currently posessed by the domain */
>   static inline unsigned int domain_tot_pages(const struct domain *d)
>   {
> 

-- 
Julien Grall

