Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F226BE80
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:50:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISCM-0004Jg-C0; Wed, 16 Sep 2020 07:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kISCK-0004Ja-EB
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:49:48 +0000
X-Inumbo-ID: a0ea796d-03ef-4bb9-9516-02023cc7b24b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0ea796d-03ef-4bb9-9516-02023cc7b24b;
 Wed, 16 Sep 2020 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=DoyK1aYmC+HRr3c+xS9qP3Y9GDW56qtSSoCxSv0CcJE=; b=uf1tcYH65YH7pxQ+SlNxJtyVs+
 +1OXMPYxojxVErHQ/w/HJVuNnG51CmRO53g7Spr6NvTVDGp59kegwrFd/PbLy+7qChTeMkaMcK0vW
 iOjfTe8lUS1yae4zS+hVVIGRc23gXRVKpkKh+01UITD7pNTsA4REkod2gBcCuyRyJWbU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISCG-0007g1-3Z; Wed, 16 Sep 2020 07:49:44 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISCF-0006ID-Qy; Wed, 16 Sep 2020 07:49:43 +0000
Subject: Re: [PATCH] mm: adjust get_page()'s types
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ba4a5dcf-3d43-09bd-870e-46a540850cc3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <965ca26d-8413-c4e9-9358-e146d78dd110@xen.org>
Date: Wed, 16 Sep 2020 08:49:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ba4a5dcf-3d43-09bd-870e-46a540850cc3@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 16/09/2020 08:28, Jan Beulich wrote:
> The passed in domain doesn't get altered and hence can be const. While
> modifying its prototype anyway, also switch to bool.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1560,17 +1560,17 @@ void put_page(struct page_info *page)
>       }
>   }
>   
> -int get_page(struct page_info *page, struct domain *domain)
> +bool get_page(struct page_info *page, const struct domain *domain)
>   {
> -    struct domain *owner = page_get_owner_and_reference(page);
> +    const struct domain *owner = page_get_owner_and_reference(page);
>   
>       if ( likely(owner == domain) )
> -        return 1;
> +        return true;
>   
>       if ( owner != NULL )
>           put_page(page);
>   
> -    return 0;
> +    return false;
>   }
>   
>   /* Common code requires get_page_type and put_page_type.
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2510,12 +2510,12 @@ struct domain *page_get_owner_and_refere
>   }
>   
>   
> -int get_page(struct page_info *page, struct domain *domain)
> +bool get_page(struct page_info *page, const struct domain *domain)
>   {
> -    struct domain *owner = page_get_owner_and_reference(page);
> +    const struct domain *owner = page_get_owner_and_reference(page);
>   
>       if ( likely(owner == domain) )
> -        return 1;
> +        return true;
>   
>       if ( !paging_mode_refcounts(domain) && !domain->is_dying )
>           gprintk(XENLOG_INFO,
> @@ -2526,7 +2526,7 @@ int get_page(struct page_info *page, str
>       if ( owner )
>           put_page(page);
>   
> -    return 0;
> +    return false;
>   }
>   
>   /*
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -151,7 +151,7 @@ TYPE_SAFE(unsigned long, pfn);
>   struct page_info;
>   
>   void put_page(struct page_info *);
> -int get_page(struct page_info *, struct domain *);
> +bool get_page(struct page_info *, const struct domain *);
>   struct domain *__must_check page_get_owner_and_reference(struct page_info *);
>   
>   /* Boot-time allocator. Turns into generic allocator after bootstrap. */
> 

-- 
Julien Grall

