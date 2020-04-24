Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C81B7061
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRuOx-0000fx-Lh; Fri, 24 Apr 2020 09:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRuOw-0000fs-DB
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:13:38 +0000
X-Inumbo-ID: e1a8f98a-860b-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1a8f98a-860b-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/yQWa354o6CUZt+4eJYJWVc+dtItT1EC2mqjXKJ37uY=; b=R6i7R60/7eaBegofFdbFaJCAkJ
 jSesuaU8M1l2CGnTZv8+o6vBqemNJjsDv1jC++5OHPxvNRai53pt7vQ7y6RocLv9KuiglRnwITnDF
 ik3nPmEUkY4HFMMmbH0fWR8ExDijroe4L2niKVOEEUpB5yjV/xcNMCzVypB38ElB3sOg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRuOu-0003il-4J; Fri, 24 Apr 2020 09:13:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRuOt-00050e-TW; Fri, 24 Apr 2020 09:13:36 +0000
Subject: Re: [PATCH 4/6] x86/smpboot: map and unmap page tables in
 cleanup_cpu_root_pgt
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1587116799.git.hongyxia@amazon.com>
 <bc0ad02ad73ac3f02e063457d69634b1f6b57ddc.1587116799.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <afec3c99-49e8-0304-23ef-1763df48fc9c@xen.org>
Date: Fri, 24 Apr 2020 10:13:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bc0ad02ad73ac3f02e063457d69634b1f6b57ddc.1587116799.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 17/04/2020 10:52, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/x86/smpboot.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 09264b02d1..275ce7661d 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -858,23 +858,27 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
>             r < root_table_offset(HYPERVISOR_VIRT_END); ++r )
>       {
>           l3_pgentry_t *l3t;
> +        mfn_t l3mfn;
>           unsigned int i3;
>   
>           if ( !(root_get_flags(rpt[r]) & _PAGE_PRESENT) )
>               continue;
>   
> -        l3t = l4e_to_l3e(rpt[r]);
> +        l3mfn = l4e_get_mfn(rpt[r]);
> +        l3t = map_domain_page(l3mfn);
>   
>           for ( i3 = 0; i3 < L3_PAGETABLE_ENTRIES; ++i3 )
>           {
>               l2_pgentry_t *l2t;
> +            mfn_t l2mfn;
>               unsigned int i2;
>   
>               if ( !(l3e_get_flags(l3t[i3]) & _PAGE_PRESENT) )
>                   continue;
>   
>               ASSERT(!(l3e_get_flags(l3t[i3]) & _PAGE_PSE));
> -            l2t = l3e_to_l2e(l3t[i3]);
> +            l2mfn = l3e_get_mfn(l3t[i3]);
> +            l2t = map_domain_page(l2mfn);
>   
>               for ( i2 = 0; i2 < L2_PAGETABLE_ENTRIES; ++i2 )
>               {
> @@ -882,13 +886,15 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
>                       continue;
>   
>                   ASSERT(!(l2e_get_flags(l2t[i2]) & _PAGE_PSE));
> -                free_xen_pagetable(l2e_to_l1e(l2t[i2]));
> +                free_xen_pagetable_new(l2e_get_mfn(l2t[i2]));
>               }
>   
> -            free_xen_pagetable(l2t);
> +            unmap_domain_page(l2t);
> +            free_xen_pagetable_new(l2mfn);
>           }
>   
> -        free_xen_pagetable(l3t);
> +        unmap_domain_page(l3t);
> +        free_xen_pagetable_new(l3mfn);
>       }
>   
>       free_xen_pagetable(rpt);
> @@ -896,11 +902,14 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
>       /* Also zap the stub mapping for this CPU. */
>       if ( stub_linear )
>       {
> -        l3_pgentry_t *l3t = l4e_to_l3e(common_pgt);
> -        l2_pgentry_t *l2t = l3e_to_l2e(l3t[l3_table_offset(stub_linear)]);
> -        l1_pgentry_t *l1t = l2e_to_l1e(l2t[l2_table_offset(stub_linear)]);
> +        l3_pgentry_t l3e = l3e_from_l4e(common_pgt,
> +                                        l3_table_offset(stub_linear));
> +        l2_pgentry_t l2e = l2e_from_l3e(l3e, l2_table_offset(stub_linear));
> +        l1_pgentry_t *l1t = map_l1t_from_l2e(l2e);
>   
>           l1t[l1_table_offset(stub_linear)] = l1e_empty();
> +
> +        unmap_domain_page(l1t);
>       }
>   }
>   
> 

Cheers,

-- 
Julien Grall

