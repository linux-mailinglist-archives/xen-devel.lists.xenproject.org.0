Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796CF42D82C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 13:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209256.365653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mayvC-000163-7W; Thu, 14 Oct 2021 11:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209256.365653; Thu, 14 Oct 2021 11:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mayvC-00013t-4N; Thu, 14 Oct 2021 11:29:14 +0000
Received: by outflank-mailman (input) for mailman id 209256;
 Thu, 14 Oct 2021 11:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mayvA-00013n-Jy
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 11:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mayv8-0007FB-Fw; Thu, 14 Oct 2021 11:29:10 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.16.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mayv8-00083n-A6; Thu, 14 Oct 2021 11:29:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=q1KyYt4EdZVP4UDyrC5nCFv/2ZeCUGGzkQu5Ue7ucE0=; b=gBObF8ia5gFib5epUpWnoU7CwQ
	wbLF6oBidknLb2pare9iZjk7KIy9p+nf95gi/zXUeeP66ZASwhNY6EYD8/FC0lij9ssyi7tf3fnk0
	cFCxvRs76USQYiJRbww58i9stZZ9lN5HcNmbdAULvbZJIjTYkZMNVmxmhNZWsmNmGjmo=;
Message-ID: <561dcb90-7b6d-4dd6-2ca7-a4a5ec1c5e35@xen.org>
Date: Thu, 14 Oct 2021 12:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <f78f8a30-39b7-cec2-2af0-27ebab28cedd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f78f8a30-39b7-cec2-2af0-27ebab28cedd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/09/2021 07:42, Jan Beulich wrote:
> Determining that behavior is correct (i.e. results in failure) for a
> passed in GFN equaling INVALID_GFN is non-trivial. Make this quite a
> bit more obvious by checking input in generic code - both for singular
> requests to not match the value and for range ones to not pass / wrap
> through it.
> 
> For Arm similarly make more obvious that no wrapping of MFNs passed
> for XENMAPSPACE_dev_mmio and thus to map_dev_mmio_region() can occur:
> Drop the "nr" parameter of the function to avoid future callers
> appearing which might not themselves check for wrapping. Otherwise
> the respective ASSERT() in rangeset_contains_range() could trigger.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I find it odd that map_dev_mmio_region() returns success upon
> iomem_access_permitted() indicating failure - is this really intended?

AFAIR yes. The hypercall is not used as "Map the region" but instead 
"Make sure the region is mapped if the IOMEM region is accessible".

It is necessary to return 0 because dom0 OS cannot distinguished between 
emulated and non-emulated. So we may report error when there is none.

> As per commit 102984bb1987 introducing it this also was added for ACPI
> only - any reason XENMAPSPACE_dev_mmio isn't restricted to CONFIG_ACPI
> builds?

There is nothing specific to ACPI in the implementation. So I don't 
really see the reason to restrict to CONFIG_ACPI.

However, it is still possible to boot using DT when Xen is built with 
CONFIG_ACPI. So if the restriction was desirable, then I think it should 
be using !acpi_disabled.

> 
> I'd be happy to take suggestions towards avoiding the need to #define
> _gfn() around the BUILD_BUG_ON() being added. I couldn't think of
> anything prettier.
> 
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1479,7 +1479,7 @@ int xenmem_add_to_physmap_one(
>           break;
>       }
>       case XENMAPSPACE_dev_mmio:
> -        rc = map_dev_mmio_region(d, gfn, 1, _mfn(idx));
> +        rc = map_dev_mmio_region(d, gfn, _mfn(idx));
>           return rc;
>   
>       default:
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1360,19 +1360,18 @@ int unmap_mmio_regions(struct domain *d,
>   
>   int map_dev_mmio_region(struct domain *d,
>                           gfn_t gfn,
> -                        unsigned long nr,
>                           mfn_t mfn)
>   {
>       int res;
>   
> -    if ( !(nr && iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn) + nr - 1)) )
> +    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn)) )
>           return 0;
>   
> -    res = p2m_insert_mapping(d, gfn, nr, mfn, p2m_mmio_direct_c);
> +    res = p2m_insert_mapping(d, gfn, 1, mfn, p2m_mmio_direct_c);
>       if ( res < 0 )
>       {
> -        printk(XENLOG_G_ERR "Unable to map MFNs [%#"PRI_mfn" - %#"PRI_mfn" in Dom%d\n",
> -               mfn_x(mfn), mfn_x(mfn) + nr - 1, d->domain_id);
> +        printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" in %pd\n",
> +               mfn_x(mfn), d);
>           return res;
>       }
>   
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4132,7 +4132,10 @@ int gnttab_map_frame(struct domain *d, u
>       bool status = false;
>   
>       if ( gfn_eq(gfn, INVALID_GFN) )
> +    {
> +        ASSERT_UNREACHABLE();
>           return -EINVAL;
> +    }
>   
>       grant_write_lock(gt);
>   
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -831,6 +831,9 @@ int xenmem_add_to_physmap(struct domain
>           return -EACCES;
>       }
>   
> +    if ( gfn_eq(_gfn(xatp->gpfn), INVALID_GFN) )
> +        return -EINVAL;
> +
>       if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>           extra.foreign_domid = DOMID_INVALID;
>   
> @@ -841,6 +844,15 @@ int xenmem_add_to_physmap(struct domain
>       if ( xatp->size < start )
>           return -EILSEQ;
>   
> +    if ( xatp->gpfn + xatp->size < xatp->gpfn ||
> +         xatp->idx + xatp->size < xatp->idx )
> +    {
> +#define _gfn(x) (x)

AFAICT, _gfn() will already be defined. So some compiler may complain 
because will be defined differently on debug build. However...

> +        BUILD_BUG_ON(INVALID_GFN + 1);

... I might be missing something... but why can't use gfn_x(INVALID_GFN) 
+ 1 here?

In fact, I am not entirely sure what's the purpose of this 
BUILD_BUG_ON(). Could you give more details?

> +#undef _gfn
> +        return -EOVERFLOW;
> +    }
> +
>       xatp->idx += start;
>       xatp->gpfn += start;
>       xatp->size -= start;
> @@ -961,6 +973,9 @@ static int xenmem_add_to_physmap_batch(s
>                                                  extent, 1)) )
>               return -EFAULT;
>   
> +        if ( gfn_eq(_gfn(gpfn), INVALID_GFN) )
> +            return -EINVAL;
> +
>           rc = xenmem_add_to_physmap_one(d, xatpb->space, extra,
>                                          idx, _gfn(gpfn));
>   
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -297,7 +297,6 @@ int unmap_regions_p2mt(struct domain *d,
>   
>   int map_dev_mmio_region(struct domain *d,
>                           gfn_t gfn,
> -                        unsigned long nr,
>                           mfn_t mfn);
>   
>   int guest_physmap_add_entry(struct domain *d,
> 

Cheers,

-- 
Julien Grall

