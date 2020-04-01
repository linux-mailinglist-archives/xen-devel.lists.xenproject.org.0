Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CEC19ABBC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 14:34:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJcVC-0003J2-OH; Wed, 01 Apr 2020 12:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJcVB-0003Iv-5y
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 12:29:49 +0000
X-Inumbo-ID: 74935b00-7414-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74935b00-7414-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 12:29:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D55EAD4B;
 Wed,  1 Apr 2020 12:29:38 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1584955616.git.hongyxia@amazon.com>
 <2fa83ef5818805c179757caac99ccf7ab4f7ba3a.1584955616.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1537005-cac8-cd74-e19c-043219ccab56@suse.com>
Date: Wed, 1 Apr 2020 14:29:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2fa83ef5818805c179757caac99ccf7ab4f7ba3a.1584955616.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.03.2020 10:41, Hongyan Xia wrote:
> --- a/xen/include/asm-x86/page.h
> +++ b/xen/include/asm-x86/page.h
> @@ -196,6 +196,24 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>  #define map_l2t_from_l3e(x)        (l2_pgentry_t *)map_domain_page(l3e_get_mfn(x))
>  #define map_l3t_from_l4e(x)        (l3_pgentry_t *)map_domain_page(l4e_get_mfn(x))
>  
> +#define l1e_from_l2e(l2e, off) ({                   \
> +        l1_pgentry_t *l1t = map_l1t_from_l2e(l2e);  \
> +        l1_pgentry_t l1e = l1t[off];                \
> +        UNMAP_DOMAIN_PAGE(l1t);                     \
> +        l1e; })
> +
> +#define l2e_from_l3e(l3e, off) ({                   \
> +        l2_pgentry_t *l2t = map_l2t_from_l3e(l3e);  \
> +        l2_pgentry_t l2e = l2t[off];                \
> +        UNMAP_DOMAIN_PAGE(l2t);                     \
> +        l2e; })
> +
> +#define l3e_from_l4e(l4e, off) ({                   \
> +        l3_pgentry_t *l3t = map_l3t_from_l4e(l4e);  \
> +        l3_pgentry_t l3e = l3t[off];                \
> +        UNMAP_DOMAIN_PAGE(l3t);                     \
> +        l3e; })

There's a reason these are macros rather than inline functions,
I assume? (This reason would be nice to be stated in the
description.)

I don't see why you use UNMAP_DOMAIN_PAGE() rather than
unmap_domain_page() here - the variables in question go out of
scope right afterwards, so the storing of NULL into them is
pointless (and very likely to be eliminated by the compiler
anyway).

Finally the pointers should each be "to const", as you're
only reading through them.

Jan

