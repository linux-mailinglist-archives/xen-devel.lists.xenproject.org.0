Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6C19AB6C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 14:14:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJcDt-00022Y-8T; Wed, 01 Apr 2020 12:11:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJcDs-00022T-74
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 12:11:56 +0000
X-Inumbo-ID: fa413f86-7411-11ea-bab2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa413f86-7411-11ea-bab2-12813bfff9fa;
 Wed, 01 Apr 2020 12:11:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C640AE1C;
 Wed,  1 Apr 2020 12:11:53 +0000 (UTC)
Subject: Re: [PATCH 1/5] x86/shim: map and unmap page tables in
 replace_va_mapping
To: Hongyan Xia <hx242@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <1acfafbd8ebada1538c9e06323ef0b3bf3f6897c.1584955616.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <611d0994-27c1-1fdd-0d6b-28f67ce7e486@suse.com>
Date: Wed, 1 Apr 2020 14:11:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1acfafbd8ebada1538c9e06323ef0b3bf3f6897c.1584955616.git.hongyxia@amazon.com>
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
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -169,15 +169,19 @@ static void __init replace_va_mapping(struct domain *d, l4_pgentry_t *l4start,
>                                        unsigned long va, mfn_t mfn)
>  {
>      l4_pgentry_t *pl4e = l4start + l4_table_offset(va);
> -    l3_pgentry_t *pl3e = l4e_to_l3e(*pl4e) + l3_table_offset(va);
> -    l2_pgentry_t *pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(va);
> -    l1_pgentry_t *pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(va);
> +    l3_pgentry_t *pl3e = map_l3t_from_l4e(*pl4e) + l3_table_offset(va);
> +    l2_pgentry_t *pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(va);
> +    l1_pgentry_t *pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(va);
>      struct page_info *page = mfn_to_page(l1e_get_mfn(*pl1e));
>  
>      put_page_and_type(page);
>  
>      *pl1e = l1e_from_mfn(mfn, (!is_pv_32bit_domain(d) ? L1_PROT
>                                                        : COMPAT_L1_PROT));
> +
> +    UNMAP_DOMAIN_PAGE(pl1e);
> +    UNMAP_DOMAIN_PAGE(pl2e);
> +    UNMAP_DOMAIN_PAGE(pl3e);
>  }

I disagree to an approach like this: Why have three pending mappings
when one at a time will do? Map-read/write-unmap three times is what
you want here, even if this is more code churn.

Jan

