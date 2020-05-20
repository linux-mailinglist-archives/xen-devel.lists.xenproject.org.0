Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A11DAFB9
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLev-0000dt-3z; Wed, 20 May 2020 10:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbLet-0000do-MA
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:09:07 +0000
X-Inumbo-ID: f09c54c0-9a81-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f09c54c0-9a81-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 10:09:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA678ABBE;
 Wed, 20 May 2020 10:09:08 +0000 (UTC)
Subject: Re: [PATCH v6 13/15] x86/mm: drop old page table APIs
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <d6a642544c5ce0b975cdab8ad054f7a348f17c8d.1587735799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be3d3dd0-6001-41a5-7390-44dc8c327d8f@suse.com>
Date: Wed, 20 May 2020 12:09:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d6a642544c5ce0b975cdab8ad054f7a348f17c8d.1587735799.git.hongyxia@amazon.com>
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

On 24.04.2020 16:09, Hongyan Xia wrote:
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -815,7 +815,7 @@ static int setup_cpu_root_pgt(unsigned int cpu)
>      if ( !opt_xpti_hwdom && !opt_xpti_domu )
>          return 0;
>  
> -    rpt = alloc_xen_pagetable();
> +    rpt = alloc_xenheap_page();

So the idea of not using alloc_domheap_page() + map_domain_page_global()
here is that in the long run alloc_xenheap_page() will resolve to just
this? If so, while I'd have preferred the greater flexibility until then,
this is fair enough, i.e.
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

