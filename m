Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6762D0EBA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46246.82060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmESX-0004Vk-01; Mon, 07 Dec 2020 11:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46246.82060; Mon, 07 Dec 2020 11:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmESW-0004VL-Sg; Mon, 07 Dec 2020 11:13:36 +0000
Received: by outflank-mailman (input) for mailman id 46246;
 Mon, 07 Dec 2020 11:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmESV-0004VG-8B
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:13:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a95b8a1b-1a80-4833-a0cc-31e39d960564;
 Mon, 07 Dec 2020 11:13:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5522AC90;
 Mon,  7 Dec 2020 11:13:32 +0000 (UTC)
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
X-Inumbo-ID: a95b8a1b-1a80-4833-a0cc-31e39d960564
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607339612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCzpD7E3EAHXyy4/w480x8Wr+pQ8zWMdDln3IOghJfM=;
	b=FCdtJG1grs8Z87EaKCVtRAnYPFtjnrwZhZCXJuab9/4wq6adpqpiAA12gM0CpAKdELBXMO
	tvBKJ42YnS8oYTE4kkjgdi1d6L/goPHfV9bAZciF+WUAaWQDmuM3pbR3jTe42MtsfsAgru
	2CsUlIsIZBqOVvgtv8tnjlu4OtCFhtI=
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51a5c06f-e6ce-c651-2fd2-352aaa591fb1@suse.com>
Date: Mon, 7 Dec 2020 12:13:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -17,15 +17,15 @@
>   */
>  
>  #include <xen/ctype.h>
> +#include <xen/domain.h>
> +#include <xen/event.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/lib.h>
> -#include <xen/trace.h>
> +#include <xen/paging.h>
>  #include <xen/sched.h>
> -#include <xen/irq.h>
>  #include <xen/softirq.h>
> -#include <xen/domain.h>
> -#include <xen/event.h>
> -#include <xen/paging.h>
> +#include <xen/trace.h>
>  #include <xen/vpci.h>

Seeing this consolidation (thanks!), have you been able to figure
out what xen/ctype.h is needed for here? It looks to me as if it
could be dropped at the same time.

> @@ -601,7 +610,7 @@ static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
>      return rc;
>  }
>  
> -static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
>  {
>      hvm_unmap_ioreq_gfn(s, true);
>      hvm_unmap_ioreq_gfn(s, false);

How is this now different from ...

> @@ -674,6 +683,12 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
>      return rc;
>  }
>  
> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
> +{
> +    hvm_remove_ioreq_gfn(s, false);
> +    hvm_remove_ioreq_gfn(s, true);
> +}

... this? Imo if at all possible there should be no such duplication
(i.e. at least have this one simply call the earlier one).

> @@ -1080,6 +1105,24 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
>      return rc;
>  }
>  
> +/* Called with ioreq_server lock held */
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct hvm_ioreq_server *s,
> +                                   uint32_t flags)
> +{
> +    int rc = p2m_set_ioreq_server(d, flags, s);
> +
> +    if ( rc == 0 && flags == 0 )
> +    {
> +        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +        if ( read_atomic(&p2m->ioreq.entry_count) )
> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
> +    }
> +
> +    return rc;
> +}
> +
>  /*
>   * Map or unmap an ioreq server to specific memory type. For now, only
>   * HVMMEM_ioreq_server is supported, and in the future new types can be
> @@ -1112,19 +1155,11 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
>      if ( s->emulator != current->domain )
>          goto out;
>  
> -    rc = p2m_set_ioreq_server(d, flags, s);
> +    rc = arch_ioreq_server_map_mem_type(d, s, flags);
>  
>   out:
>      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>  
> -    if ( rc == 0 && flags == 0 )
> -    {
> -        struct p2m_domain *p2m = p2m_get_hostp2m(d);
> -
> -        if ( read_atomic(&p2m->ioreq.entry_count) )
> -            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
> -    }
> -
>      return rc;
>  }

While you mention this change in the description, I'm still
missing justification as to why the change is safe to make. I
continue to think p2m_change_entry_type_global() would better
not be called inside the locked region, if at all possible.

> @@ -1239,33 +1279,28 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>  }
>  
> -struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> -                                                 ioreq_t *p)
> +int arch_ioreq_server_get_type_addr(const struct domain *d,
> +                                    const ioreq_t *p,
> +                                    uint8_t *type,
> +                                    uint64_t *addr)
>  {
> -    struct hvm_ioreq_server *s;
> -    uint32_t cf8;
> -    uint8_t type;
> -    uint64_t addr;
> -    unsigned int id;
> +    unsigned int cf8 = d->arch.hvm.pci_cf8;
>  
>      if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
> -        return NULL;
> -
> -    cf8 = d->arch.hvm.pci_cf8;
> +        return -EINVAL;

The caller cares about only a boolean. Either make the function
return bool, or (imo better, but others may like this less) have
it return "type" instead of using indirection, using e.g.
negative values to identify errors (which then could still be
errno ones if you wish).

> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -19,6 +19,25 @@
>  #ifndef __ASM_X86_HVM_IOREQ_H__
>  #define __ASM_X86_HVM_IOREQ_H__
>  
> +#define HANDLE_BUFIOREQ(s) \
> +    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
> +
> +bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
> +int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
> +void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct hvm_ioreq_server *s,
> +                                   uint32_t flags);
> +bool arch_ioreq_server_destroy_all(struct domain *d);
> +int arch_ioreq_server_get_type_addr(const struct domain *d,
> +                                    const ioreq_t *p,
> +                                    uint8_t *type,
> +                                    uint64_t *addr);
> +void arch_ioreq_domain_init(struct domain *d);
> +
>  bool hvm_io_pending(struct vcpu *v);
>  bool handle_hvm_io_completion(struct vcpu *v);
>  bool is_ioreq_server_page(struct domain *d, const struct page_info *page);

What's the plan here? Introduce them into the x86 header just
to later move the entire block into the common one? Wouldn't
it make sense to introduce the common header here right away?
Or do you expect to convert some of the simpler ones to inline
functions later on?

Jan

