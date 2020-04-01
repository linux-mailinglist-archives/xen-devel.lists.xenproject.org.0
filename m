Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCD19ABEE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 14:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJcfK-0004nh-PU; Wed, 01 Apr 2020 12:40:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJcfJ-0004nZ-Ec
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 12:40:17 +0000
X-Inumbo-ID: f02afa6a-7415-11ea-bac3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f02afa6a-7415-11ea-bac3-12813bfff9fa;
 Wed, 01 Apr 2020 12:40:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 56103AD75;
 Wed,  1 Apr 2020 12:40:15 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86_64/mm: map and unmap page tables in
 destroy_m2p_mapping
To: Hongyan Xia <hx242@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <7143c2a1e0c7ca46b3ace329d7dcab85e0b5c87c.1584955616.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7981c892-0e5c-03fb-679c-94f023a5c9fc@suse.com>
Date: Wed, 1 Apr 2020 14:40:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7143c2a1e0c7ca46b3ace329d7dcab85e0b5c87c.1584955616.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.03.2020 10:41, Hongyan Xia wrote:
> @@ -297,26 +298,33 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
>              continue;
>          }
>  
> -        l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> +        l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
>          if (!(l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT))
>          {
>              i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
>                      (1UL << (L2_PAGETABLE_SHIFT - 3)) ;
> +            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
>              continue;
>          }
>  
>          pt_pfn = l2e_get_pfn(l2_ro_mpt[l2_table_offset(va)]);
>          if ( hotadd_mem_valid(pt_pfn, info) )
>          {
> +            l2_pgentry_t *l2t;
> +
>              destroy_xen_mappings(rwva, rwva + (1UL << L2_PAGETABLE_SHIFT));
>  
> -            l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> -            l2e_write(&l2_ro_mpt[l2_table_offset(va)], l2e_empty());
> +            l2t = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);

Why a 2nd mapping of the same L3 entry that you've already mapped
into l2_ro_mpt?

> +            l2e_write(&l2t[l2_table_offset(va)], l2e_empty());
> +            UNMAP_DOMAIN_PAGE(l2t);

If this then weren't to go away, it should again be the lowercase
variant imo, as the variable's scope ends here.

Jan

