Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4E273C14
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:36:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKcpk-0008Gx-Ii; Tue, 22 Sep 2020 07:35:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKcpj-0008Gs-IK
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:35:27 +0000
X-Inumbo-ID: 4f4fee78-1f8f-4bc1-a456-15d8db0a6ed0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f4fee78-1f8f-4bc1-a456-15d8db0a6ed0;
 Tue, 22 Sep 2020 07:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600760125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbfE6+v3wewovIz2P91IBWhJLv75pEFagcFFK/TLE7g=;
 b=dUevntD+5FuK8UER85zjPsPBTHjK2qjtmi0EPZdBuJQu4yMX7/knkyf4UJKavrMqkQTEi0
 fDwXw/pbYNRUffMN4eUfgsnkAJ2U37Po382qd4bPGUI8iGyLVPAU7DyizqkDWYry3015d/
 1YBLLAXRMWCL4RMyOj9KrRKLZmvIjTY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CB28AC97;
 Tue, 22 Sep 2020 07:36:02 +0000 (UTC)
Subject: Re: [PATCH v4 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <834db49d-dda5-784c-1135-8427086a04eb@suse.com>
Date: Tue, 22 Sep 2020 09:35:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921180214.4842-2-julien@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.09.2020 20:02, Julien Grall wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -504,6 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
>  
>  static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>  {
> +#ifdef CONFIG_PV
>      struct xen_memory_exchange exch;
>      PAGE_LIST_HEAD(in_chunk_list);
>      PAGE_LIST_HEAD(out_chunk_list);
> @@ -516,6 +517,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>      struct domain *d;
>      struct page_info *page;
>  
> +    if ( !is_pv_domain(d) )
> +        return -EOPNOTSUPP;

I think "paging_mode_translate(d)" would be more correct, at which
point the use later in the function ought to be dropped (as that's
precisely one of the things making this function not really
sensible to use on translated guests).

I also wonder whether the #ifdef wouldn't better be left out. Yes,
that'll mean retaining a stub mfn_to_gmfn(), but it could expand
to simply BUG() then, for example.

Jan

