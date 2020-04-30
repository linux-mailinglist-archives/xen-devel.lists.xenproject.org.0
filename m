Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2EB1BF856
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:43:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8Wf-0001nK-Ga; Thu, 30 Apr 2020 12:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU8Wd-0001nF-Hq
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 12:42:47 +0000
X-Inumbo-ID: 17b6538c-8ae0-11ea-9a3e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17b6538c-8ae0-11ea-9a3e-12813bfff9fa;
 Thu, 30 Apr 2020 12:42:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20EB5AC64;
 Thu, 30 Apr 2020 12:42:45 +0000 (UTC)
Subject: Re: [PATCH v6 09/15] efi: use new page table APIs in copy_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <6c27c79964eb16eba4743515689b9fd7eb3409d1.1587735799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f2447ba-e12a-9241-6c2c-a7a49059c09b@suse.com>
Date: Thu, 30 Apr 2020 14:42:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6c27c79964eb16eba4743515689b9fd7eb3409d1.1587735799.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 16:09, Hongyan Xia wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1454,16 +1454,20 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
>              continue;
>          if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
>          {
> -            l3dst = alloc_xen_pagetable();
> -            BUG_ON(!l3dst);
> +            mfn_t l3mfn = alloc_xen_pagetable_new();
> +
> +            BUG_ON(mfn_eq(l3mfn, INVALID_MFN));
> +            l3dst = map_domain_page(l3mfn);
>              clear_page(l3dst);
>              efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
> -                l4e_from_paddr(virt_to_maddr(l3dst), __PAGE_HYPERVISOR);
> +                l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
>          }
>          else
> -            l3dst = l4e_to_l3e(l4e);
> -        l3src = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
> +            l3dst = map_l3t_from_l4e(l4e);
> +        l3src = map_l3t_from_l4e(idle_pg_table[l4_table_offset(va)]);
>          l3dst[l3_table_offset(mfn << PAGE_SHIFT)] = l3src[l3_table_offset(va)];
> +        unmap_domain_page(l3src);
> +        unmap_domain_page(l3dst);
>      }
>  }

This looks very inefficient - you establish and tear down two mappings
per loop iteration, when really you may end up copying all 512 slots
between the same pair of L3 tables.

Jan

