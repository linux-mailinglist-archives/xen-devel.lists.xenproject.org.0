Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009A22DD50
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jul 2020 10:36:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzc8i-0001Bf-81; Sun, 26 Jul 2020 08:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jzc8h-0001Ba-A8
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 08:36:11 +0000
X-Inumbo-ID: 0e6348b0-cf1b-11ea-8a02-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e6348b0-cf1b-11ea-8a02-bc764e2007e4;
 Sun, 26 Jul 2020 08:36:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22213B601;
 Sun, 26 Jul 2020 08:36:19 +0000 (UTC)
Subject: Re: [PATCH 4/6] remove remaining uses of iommu_legacy_map/unmap
To: Paul Durrant <paul@xen.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3face98c-7fa7-2baf-2fe8-b5869865203f@suse.com>
Date: Sun, 26 Jul 2020 10:36:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724164619.1245-5-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 18:46, Paul Durrant wrote:
> ---
>  xen/arch/x86/mm.c               | 22 +++++++++++++++-----
>  xen/arch/x86/mm/p2m-ept.c       | 22 +++++++++++++-------
>  xen/arch/x86/mm/p2m-pt.c        | 17 +++++++++++----
>  xen/arch/x86/mm/p2m.c           | 28 ++++++++++++++++++-------
>  xen/arch/x86/x86_64/mm.c        | 27 ++++++++++++++++++------
>  xen/common/grant_table.c        | 36 +++++++++++++++++++++++++-------
>  xen/common/memory.c             |  7 +++----
>  xen/drivers/passthrough/iommu.c | 37 +--------------------------------
>  xen/include/xen/iommu.h         | 20 +++++-------------
>  9 files changed, 123 insertions(+), 93 deletions(-)

Overall more code. I wonder whether a map-and-flush function (named
differently than the current ones) wouldn't still be worthwhile to
have.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1225,11 +1225,25 @@ map_grant_ref(
>              kind = IOMMUF_readable;
>          else
>              kind = 0;
> -        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 0, kind) )
> +        if ( kind )
>          {
> -            double_gt_unlock(lgt, rgt);
> -            rc = GNTST_general_error;
> -            goto undo_out;
> +            dfn_t dfn = _dfn(mfn_x(mfn));
> +            unsigned int flush_flags = 0;
> +            int err;
> +
> +            err = iommu_map(ld, dfn, mfn, 0, kind, &flush_flags);
> +            if ( err )
> +                rc = GNTST_general_error;
> +
> +            err = iommu_iotlb_flush(ld, dfn, 1, flush_flags);
> +            if ( err )
> +                rc = GNTST_general_error;
> +
> +            if ( rc != GNTST_okay )
> +            {
> +                double_gt_unlock(lgt, rgt);
> +                goto undo_out;
> +            }
>          }

The mapping needs to happen with at least ld's lock held, yes. But
is the same true also for the flushing? Can't (not necessarily
right in this change) the flush be pulled out of the function and
instead done once per batch that got processed?

Jan

