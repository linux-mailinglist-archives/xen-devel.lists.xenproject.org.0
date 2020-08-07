Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089923EE91
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 16:05:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k430G-0004ZE-8j; Fri, 07 Aug 2020 14:05:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k430E-0004Z4-ML
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 14:05:46 +0000
X-Inumbo-ID: a2639879-7456-4c42-9ec3-2504e0af3fe9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2639879-7456-4c42-9ec3-2504e0af3fe9;
 Fri, 07 Aug 2020 14:05:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F329EAC41;
 Fri,  7 Aug 2020 14:06:02 +0000 (UTC)
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
Date: Fri, 7 Aug 2020 16:05:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.2020 16:21, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Rewrite those functions to use the new APIs. Modify its callers to unmap
> the pointer returned. Since alloc_xen_pagetable_new() is almost never
> useful unless accompanied by page clearing and a mapping, introduce a
> helper alloc_map_clear_xen_pt() for this sequence.
> 
> Note that the change of virt_to_xen_l1e() also requires vmap_to_mfn() to
> unmap the page, which requires domain_page.h header in vmap.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> Changed in v8:
> - s/virtual address/linear address/.
> - BUG_ON() on NULL return in vmap_to_mfn().

The justification for this should be recorded in the description. In
reply to v7 I did even suggest how to easily address the issue you
did notice with large pages, as well as alternative behavior for
vmap_to_mfn().

> --- a/xen/include/asm-x86/page.h
> +++ b/xen/include/asm-x86/page.h
> @@ -291,7 +291,15 @@ void copy_page_sse2(void *, const void *);
>  #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
>  #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
>  #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
> -#define vmap_to_mfn(va)     _mfn(l1e_get_pfn(*virt_to_xen_l1e((unsigned long)(va))))
> +
> +#define vmap_to_mfn(va) ({                                                  \
> +        const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned long)(va));   \
> +        mfn_t mfn_;                                                         \
> +        BUG_ON(!pl1e_);                                                     \
> +        mfn_ = l1e_get_mfn(*pl1e_);                                         \
> +        unmap_domain_page(pl1e_);                                           \
> +        mfn_; })

Additionally - no idea why I only notice this now, this wants some
further formatting adjustment: Either

#define vmap_to_mfn(va) ({                                                \
        const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned long)(va)); \
        mfn_t mfn_;                                                       \
        BUG_ON(!pl1e_);                                                   \
        mfn_ = l1e_get_mfn(*pl1e_);                                       \
        unmap_domain_page(pl1e_);                                         \
        mfn_;                                                             \
    })

or (preferably imo)

#define vmap_to_mfn(va) ({                                            \
    const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned long)(va)); \
    mfn_t mfn_;                                                       \
    BUG_ON(!pl1e_);                                                   \
    mfn_ = l1e_get_mfn(*pl1e_);                                       \
    unmap_domain_page(pl1e_);                                         \
    mfn_;                                                             \
})

Jan

