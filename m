Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08231BDDA6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:32:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmol-0000zI-VQ; Wed, 29 Apr 2020 13:32:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTmok-0000z9-PG
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:32:02 +0000
X-Inumbo-ID: ced3a178-8a1d-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ced3a178-8a1d-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 13:32:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 344EDAEF7;
 Wed, 29 Apr 2020 13:32:00 +0000 (UTC)
Subject: Re: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
 <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
 <9df9c5163fde5d25ceb756b20714c58be93b2c6c.camel@xen.org>
 <c33dcaee9c8796da8816de9168f91ce90de61fc5.camel@xen.org>
 <e18871ea997a304394adbbc92e724ae0ec56d87a.camel@xen.org>
 <ec318c48-41c3-5cbf-e03e-8838d9f488ba@suse.com>
 <40644d63e00a10636943f6322707c0ad6a73e11c.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a41b36ed-1dcd-c5e5-2889-1dddaf7b866a@suse.com>
Date: Wed, 29 Apr 2020 15:31:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <40644d63e00a10636943f6322707c0ad6a73e11c.camel@xen.org>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 14:29, Hongyan Xia wrote:
> (Looks like other patches in this series have been merged. Replying to
> this one only.)

Please send as a proper patch, this one came through ...

> From: Wei Liu <wei.liu2@citrix.com>
> Date: Tue, 5 Feb 2019 16:32:54 +0000
> Subject: [PATCH] x86/pv: map and unmap page tables in
> mark_pv_pt_pages_rdonly
> 
> Also, clean up the initialisation of plXe.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/x86/pv/dom0_build.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/pv/dom0_build.c
> b/xen/arch/x86/pv/dom0_build.c
> index abfbe5f436..3522eb0114 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -49,18 +49,11 @@ static __init void mark_pv_pt_pages_rdonly(struct
> domain *d,
>  {
>      unsigned long count;
>      struct page_info *page;
> -    l4_pgentry_t *pl4e;
> -    l3_pgentry_t *pl3e;
> -    l2_pgentry_t *pl2e;
> -    l1_pgentry_t *pl1e;
> -
> -    pl4e = l4start + l4_table_offset(vpt_start);
> -    pl3e = l4e_to_l3e(*pl4e);
> -    pl3e += l3_table_offset(vpt_start);
> -    pl2e = l3e_to_l2e(*pl3e);
> -    pl2e += l2_table_offset(vpt_start);
> -    pl1e = l2e_to_l1e(*pl2e);
> -    pl1e += l1_table_offset(vpt_start);
> +    l4_pgentry_t *pl4e = l4start + l4_table_offset(vpt_start);
> +    l3_pgentry_t *pl3e = map_l3t_from_l4e(*pl4e) +
> l3_table_offset(vpt_start);
> +    l2_pgentry_t *pl2e = map_l2t_from_l3e(*pl3e) +
> l2_table_offset(vpt_start);
> +    l1_pgentry_t *pl1e = map_l1t_from_l2e(*pl2e) +
> l1_table_offset(vpt_start);

... mangled anyway. I also think with the change made you need to
drop the R-b.

Jan

