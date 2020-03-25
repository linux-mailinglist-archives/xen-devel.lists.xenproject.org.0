Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE11192BBC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:04:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH7Wa-0002v3-Rt; Wed, 25 Mar 2020 15:00:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH7WZ-0002uy-HK
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:00:55 +0000
X-Inumbo-ID: 6cbb932c-6ea9-11ea-8635-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cbb932c-6ea9-11ea-8635-12813bfff9fa;
 Wed, 25 Mar 2020 15:00:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A958FAD06;
 Wed, 25 Mar 2020 15:00:53 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80c98b3e-efa7-66e6-bd47-61bc0560f535@suse.com>
Date: Wed, 25 Mar 2020 16:00:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-4-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 03/17] xen/mm: Move the MM types in a
 separate header
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> It is getting incredibly difficult to use typesafe GFN/MFN/PFN in the
> headers because of circular dependency. For instance, asm-x86/page.h
> cannot include xen/mm.h.
> 
> In order to convert more code to use typesafe, the types are now moved
> in a separate header that requires only a few dependencies.

We definitely need to do this, so thanks for investing the
time. I think though that we want to settle up front (and
perhaps record in a comment in the new header) what is or
is not suitable to go into the new header. After all you're
moving not just type definitions, but also simple helper
functions.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -1,50 +1,7 @@
>  /******************************************************************************
>   * include/xen/mm.h
>   *
> - * Definitions for memory pages, frame numbers, addresses, allocations, etc.
> - *
>   * Copyright (c) 2002-2006, K A Fraser <keir@xensource.com>
> - *
> - *                         +---------------------+
> - *                          Xen Memory Management
> - *                         +---------------------+
> - *
> - * Xen has to handle many different address spaces.  It is important not to
> - * get these spaces mixed up.  The following is a consistent terminology which
> - * should be adhered to.
> - *
> - * mfn: Machine Frame Number
> - *   The values Xen puts into its own pagetables.  This is the host physical
> - *   memory address space with RAM, MMIO etc.
> - *
> - * gfn: Guest Frame Number
> - *   The values a guest puts in its own pagetables.  For an auto-translated
> - *   guest (hardware assisted with 2nd stage translation, or shadowed), gfn !=
> - *   mfn.  For a non-translated guest which is aware of Xen, gfn == mfn.
> - *
> - * pfn: Pseudophysical Frame Number
> - *   A linear idea of a guest physical address space. For an auto-translated
> - *   guest, pfn == gfn while for a non-translated guest, pfn != gfn.
> - *
> - * dfn: Device DMA Frame Number (definitions in include/xen/iommu.h)
> - *   The linear frame numbers of device DMA address space. All initiators for
> - *   (i.e. all devices assigned to) a guest share a single DMA address space
> - *   and, by default, Xen will ensure dfn == pfn.
> - *
> - * WARNING: Some of these terms have changed over time while others have been
> - * used inconsistently, meaning that a lot of existing code does not match the
> - * definitions above.  New code should use these terms as described here, and
> - * over time older code should be corrected to be consistent.
> - *
> - * An incomplete list of larger work area:
> - * - Phase out the use of 'pfn' from the x86 pagetable code.  Callers should
> - *   know explicitly whether they are talking about mfns or gfns.
> - * - Phase out the use of 'pfn' from the ARM mm code.  A cursory glance
> - *   suggests that 'mfn' and 'pfn' are currently used interchangeably, where
> - *   'mfn' is the appropriate term to use.
> - * - Phase out the use of gpfn/gmfn where pfn/mfn are meant.  This excludes
> - *   the x86 shadow code, which uses gmfn/smfn pairs with different,
> - *   documented, meanings.
>   */
>  
>  #ifndef __XEN_MM_H__
> @@ -54,100 +11,11 @@
>  #include <xen/types.h>
>  #include <xen/list.h>
>  #include <xen/spinlock.h>
> -#include <xen/typesafe.h>
>  #include <xen/kernel.h>
> +#include <xen/mm_types.h>

Is there anything left in the header here which requires the
explicit inclusion of xen/kernel.h?

Jan

