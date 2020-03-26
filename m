Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE6193EF2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 13:35:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHRh8-0007gJ-Bx; Thu, 26 Mar 2020 12:33:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHRh7-0007gE-5H
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 12:33:09 +0000
X-Inumbo-ID: f267d51c-6f5d-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f267d51c-6f5d-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 12:33:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE113B12D;
 Thu, 26 Mar 2020 12:33:06 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d22bf48d-0f58-3a1e-f5d2-794f0dc846dd@suse.com>
Date: Thu, 26 Mar 2020 13:33:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.03.2020 18:04, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2202,6 +2202,17 @@ int domain_relinquish_resources(struct domain *d)
>              ret = relinquish_shared_pages(d);
>              if ( ret )
>                  return ret;
> +
> +            /*
> +             * If the domain is forked, decrement the parent's pause count
> +             * and release the domain.
> +             */
> +            if ( mem_sharing_is_fork(d) )
> +            {
> +                domain_unpause(d->parent);
> +                put_domain(d->parent);
> +                d->parent = NULL;

I think you want to clear the field before putting the reference,
to make sure possible readers of it won't see it non-NULL when
the domain is already being cleaned up, or even gone.

With this, applicable parts of the change
Acked-by: Jan Beulich <jbeulich@suse.com>

I'll try to keep an eye on when you and Roger have settled on the
remaining aspects, to determine when this (probably v13) can be
committed.

> --- a/xen/include/asm-x86/mem_sharing.h
> +++ b/xen/include/asm-x86/mem_sharing.h
> @@ -77,6 +77,14 @@ static inline int mem_sharing_unshare_page(struct domain *d,
>      return rc;
>  }
>  
> +static inline bool mem_sharing_is_fork(struct domain *d)

const? (then also in the stub further down)

Jan

