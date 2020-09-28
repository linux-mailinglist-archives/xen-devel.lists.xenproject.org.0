Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1E27AE52
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:54:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsfG-0001re-I2; Mon, 28 Sep 2020 12:53:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E1aX=DF=suse.de=osalvador@srs-us1.protection.inumbo.net>)
 id 1kMsfE-0001rZ-Rh
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:53:56 +0000
X-Inumbo-ID: b88ea8e3-6389-40d4-a12d-1aba130e7128
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b88ea8e3-6389-40d4-a12d-1aba130e7128;
 Mon, 28 Sep 2020 12:53:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12751AC24;
 Mon, 28 Sep 2020 12:53:55 +0000 (UTC)
Date: Mon, 28 Sep 2020 14:53:51 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Mike Rapoport <rppt@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH RFC 4/4] mm/page_alloc: place pages to tail in
 __free_pages_core()
Message-ID: <20200928125346.GA7703@linux>
References: <20200916183411.64756-1-david@redhat.com>
 <20200916183411.64756-5-david@redhat.com>
 <20200928075820.GA4082@linux>
 <a18327c0-b86a-df00-e984-27c26468caf7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a18327c0-b86a-df00-e984-27c26468caf7@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Sep 28, 2020 at 10:36:00AM +0200, David Hildenbrand wrote:
> Hi Oscar!

Hi David :-)

> 
> Old code:
> 
> set_page_refcounted(): sets the refcount to 1.
> __free_pages()
>   -> put_page_testzero(): sets it to 0
>   -> free_the_page()->__free_pages_ok()
> 
> New code:
> 
> set_page_refcounted(): sets the refcount to 1.
> page_ref_dec(page): sets it to 0
> __free_pages_ok():

bleh, I misread the patch, somehow I managed to not see that you replaced
__free_pages with __free_pages_ok.

To be honest, now that we do not need the page's refcount to be 1 for the
put_page_testzero to trigger (and since you are decrementing it anyways),
I think it would be much clear for those two to be gone.

But not strong, so:

Reviewed-by: Oscar Salvador <osalvador@suse.de>

-- 
Oscar Salvador
SUSE L3

