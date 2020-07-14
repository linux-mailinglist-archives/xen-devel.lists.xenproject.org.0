Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C321F1B8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 14:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvKGS-0002Ym-I2; Tue, 14 Jul 2020 12:42:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvKGR-0002Yh-BG
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 12:42:27 +0000
X-Inumbo-ID: 78ab5e60-c5cf-11ea-9307-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78ab5e60-c5cf-11ea-9307-12813bfff9fa;
 Tue, 14 Jul 2020 12:42:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CED5AC49;
 Tue, 14 Jul 2020 12:42:28 +0000 (UTC)
Subject: Re: [PATCH v7 09/15] efi: use new page table APIs in copy_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <0259b645c81ecc3879240e30760b0e7641a2b602.1590750232.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bfe28c9c-af4e-96c2-9e6c-354a5bf626d8@suse.com>
Date: Tue, 14 Jul 2020 14:42:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0259b645c81ecc3879240e30760b0e7641a2b602.1590750232.git.hongyxia@amazon.com>
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

On 29.05.2020 13:11, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> After inspection ARM doesn't have alloc_xen_pagetable so this function
> is x86 only, which means it is safe for us to change.

Well, it sits inside a "#ifndef CONFIG_ARM" section.

> @@ -1442,29 +1443,42 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
>                                                   unsigned long emfn))
>  {
>      unsigned long next;
> +    l3_pgentry_t *l3src = NULL, *l3dst = NULL;
>  
>      for ( ; mfn < end; mfn = next )
>      {
>          l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)];
> -        l3_pgentry_t *l3src, *l3dst;
>          unsigned long va = (unsigned long)mfn_to_virt(mfn);
>  
> +        if ( !((mfn << PAGE_SHIFT) & ((1UL << L4_PAGETABLE_SHIFT) - 1)) )

To be in line with ...

> +        {
> +            UNMAP_DOMAIN_PAGE(l3src);
> +            UNMAP_DOMAIN_PAGE(l3dst);
> +        }
>          next = mfn + (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT));

... this, please avoid the left shift of mfn in the if(). Judging from
code further down I also think the zapping of l3src would better be
dependent upon va than upon mfn.

>          if ( !is_valid(mfn, min(next, end)) )
>              continue;
> -        if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
> +        if ( !l3dst )
>          {
> -            l3dst = alloc_xen_pagetable();
> -            BUG_ON(!l3dst);
> -            clear_page(l3dst);
> -            efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
> -                l4e_from_paddr(virt_to_maddr(l3dst), __PAGE_HYPERVISOR);
> +            if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
> +            {
> +                mfn_t l3mfn;
> +
> +                l3dst = alloc_map_clear_xen_pt(&l3mfn);
> +                BUG_ON(!l3dst);
> +                efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
> +                    l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
> +            }
> +            else
> +                l3dst = map_l3t_from_l4e(l4e);
>          }
> -        else
> -            l3dst = l4e_to_l3e(l4e);

As for the earlier patch, maybe again neater if you started with

        if ( l3dst )
            /* nothing */;
        else if ...

Would also save a level of indentation as it seems.

Jan

