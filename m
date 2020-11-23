Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F72C0C88
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:00:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34403.65428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCOd-0004fn-Gi; Mon, 23 Nov 2020 14:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34403.65428; Mon, 23 Nov 2020 14:00:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCOd-0004fO-CG; Mon, 23 Nov 2020 14:00:47 +0000
Received: by outflank-mailman (input) for mailman id 34403;
 Mon, 23 Nov 2020 14:00:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCOc-0004fJ-4z
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:00:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ecaf108-f42d-4e10-9de6-853d9cccf809;
 Mon, 23 Nov 2020 14:00:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2A39ABCE;
 Mon, 23 Nov 2020 14:00:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCOc-0004fJ-4z
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:00:46 +0000
X-Inumbo-ID: 9ecaf108-f42d-4e10-9de6-853d9cccf809
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9ecaf108-f42d-4e10-9de6-853d9cccf809;
	Mon, 23 Nov 2020 14:00:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606140044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7xEL+nZ6ORkadDdGG1Wgx62xuWkiAD7wj8c6vYeF/g=;
	b=uFUYn8TWtNYLMiWFU7teWNOxFsfmW9bH+p6HcgxO+TP2NuWYO0ktIMamMtemadL+Ds03nx
	ujQEX39mbyPYSyxGIL6oeGnk49TuiM5iuU4nLyxMRpHuOuDkyilippiro+7QHa3xaLaB3i
	xOmfZFYcyNWu0t/7ze5JAhosR9cMgyo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A2A39ABCE;
	Mon, 23 Nov 2020 14:00:44 +0000 (UTC)
Subject: Ping: [PATCH v2 6/9] x86/p2m: avoid unnecessary calls of
 write_p2m_entry_pre() hook
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
 <3386a823-5560-9cf3-5711-219d5bd0e54e@suse.com>
Message-ID: <775760fa-03c8-5c2e-317b-e89e5b8d789a@suse.com>
Date: Mon, 23 Nov 2020 15:00:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3386a823-5560-9cf3-5711-219d5bd0e54e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.11.2020 10:37, Jan Beulich wrote:
> When shattering a large page, we first construct the new page table page
> and only then hook it up. The "pre" hook in this case does nothing, for
> the page starting out all blank. Avoid 512 calls into shadow code in
> this case by passing in INVALID_GFN, indicating the page being updated
> is (not yet) associated with any GFN. (The alternative to this change
> would be to actually pass in a correct GFN, which can't be all the same
> on every loop iteration.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.

Ping?

Thanks, Jan

> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -134,7 +134,7 @@ static int write_p2m_entry(struct p2m_do
>  
>          paging_lock(d);
>  
> -        if ( p2m->write_p2m_entry_pre )
> +        if ( p2m->write_p2m_entry_pre && gfn != gfn_x(INVALID_GFN) )
>              p2m->write_p2m_entry_pre(d, gfn, p, new, level);
>  
>          oflags = l1e_get_flags(*p);
> @@ -290,7 +290,8 @@ p2m_next_level(struct p2m_domain *p2m, v
>          {
>              new_entry = l1e_from_pfn(pfn | (i << ((level - 1) * PAGETABLE_ORDER)),
>                                       flags);
> -            rc = write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
> +            rc = write_p2m_entry(p2m, gfn_x(INVALID_GFN), l1_entry + i,
> +                                 new_entry, level);
>              if ( rc )
>              {
>                  unmap_domain_page(l1_entry);
> 
> 


