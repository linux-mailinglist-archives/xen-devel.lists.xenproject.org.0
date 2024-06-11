Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4AE904A9D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 07:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738746.1145750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHGBr-0002M0-10; Wed, 12 Jun 2024 05:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738746.1145750; Wed, 12 Jun 2024 05:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHGBq-0002IL-Pw; Wed, 12 Jun 2024 05:06:30 +0000
Received: by outflank-mailman (input) for mailman id 738746;
 Tue, 11 Jun 2024 19:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMx3=NN=linux.intel.com=tim.c.chen@srs-se1.protection.inumbo.net>)
 id 1sH7NV-0001BJ-K5
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 19:41:57 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7323852-282a-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 21:41:54 +0200 (CEST)
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 12:41:53 -0700
Received: from mmasroor-mobl.amr.corp.intel.com (HELO [10.255.231.206])
 ([10.255.231.206])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 12:41:52 -0700
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
X-Inumbo-ID: a7323852-282a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718134915; x=1749670915;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3jSJzP/wKvbuiDtG0srhckDI0jqTpk/NVaK27TegDYY=;
  b=Txa/O434fPtNVN8jejVEK4GQd5KLG/dxr4fJIpUpVMFpyyfy3moEf96o
   3t6h70pNz/+OX5tzRNfphI9UzLkxXTDSIdWjFYzkAhYh8YdIkSIq0PxXz
   NoLZViLbrfbROUfTH8xleCglCnrWw1vvLpRxA8BM3VJcy3ihHWX8fX2dF
   dA1tFcmdszgqoi477kAhSoi7MvrpLEMefAsRUIta0L8UXsUgzobZtWMit
   zXi+dHs+HGr+tuPz25BCXunJTRvKFzoLm95mt1uQgPYmndBp0NiTFh3dM
   uDjJSySMyG2krjc1ltX2bBJ+AqrF1Yivhts05T81/ExByjBmlU8pSEls7
   A==;
X-CSE-ConnectionGUID: aN8xGcLkQSiGT8PYSgEXfQ==
X-CSE-MsgGUID: KG80D3N5Qs6iUzB2G3FBvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14826583"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="14826583"
X-CSE-ConnectionGUID: RmVZgz1VRteabv7gZ38CIw==
X-CSE-MsgGUID: YWjwba72SB6sl89EETJtkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39643390"
Message-ID: <80532f73e52e2c21fdc9aac7bce24aefb76d11b0.camel@linux.intel.com>
Subject: Re: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
From: Tim Chen <tim.c.chen@linux.intel.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org, 
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
 kasan-dev@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>, Mike
 Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>, "K. Y.
 Srinivasan" <kys@microsoft.com>,  Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,  Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 11 Jun 2024 12:41:51 -0700
In-Reply-To: <20240607090939.89524-2-david@redhat.com>
References: <20240607090939.89524-1-david@redhat.com>
	 <20240607090939.89524-2-david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-3.fc36) 
MIME-Version: 1.0

On Fri, 2024-06-07 at 11:09 +0200, David Hildenbrand wrote:
> In preparation for further changes, let's teach __free_pages_core()
> about the differences of memory hotplug handling.
>=20
> Move the memory hotplug specific handling from generic_online_page() to
> __free_pages_core(), use adjust_managed_page_count() on the memory
> hotplug path, and spell out why memory freed via memblock
> cannot currently use adjust_managed_page_count().
>=20
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h       |  3 ++-
>  mm/kmsan/init.c     |  2 +-
>  mm/memory_hotplug.c |  9 +--------
>  mm/mm_init.c        |  4 ++--
>  mm/page_alloc.c     | 17 +++++++++++++++--
>  5 files changed, 21 insertions(+), 14 deletions(-)
>=20
> diff --git a/mm/internal.h b/mm/internal.h
> index 12e95fdf61e90..3fdee779205ab 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -604,7 +604,8 @@ extern void __putback_isolated_page(struct page *page=
, unsigned int order,
>  				    int mt);
>  extern void memblock_free_pages(struct page *page, unsigned long pfn,
>  					unsigned int order);
> -extern void __free_pages_core(struct page *page, unsigned int order);
> +extern void __free_pages_core(struct page *page, unsigned int order,
> +		enum meminit_context);

Shouldn't the above be=20
		enum meminit_context context);
> =20
>  /*
>   * This will have no effect, other than possibly generating a warning, i=
f the

Thanks.

Tim

