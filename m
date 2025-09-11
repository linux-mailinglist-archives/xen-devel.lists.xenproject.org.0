Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D0B53E9F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 00:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120946.1465552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwphQ-00087s-2v; Thu, 11 Sep 2025 22:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120946.1465552; Thu, 11 Sep 2025 22:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwphQ-00086E-0F; Thu, 11 Sep 2025 22:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1120946;
 Thu, 11 Sep 2025 22:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFcX=3W=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1uwphN-00085p-FP
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 22:23:25 +0000
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed93ee2e-8f5d-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 00:23:24 +0200 (CEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250911222322euoutp011634560d57af0d6769ea82508ee6c7b3~kWqER7Qs81513015130euoutp01K;
 Thu, 11 Sep 2025 22:23:22 +0000 (GMT)
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250911222321eucas1p114043a72e011e2fff92df33a2133b21e~kWqDhtt8p0600006000eucas1p18;
 Thu, 11 Sep 2025 22:23:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250911222317eusmtip2aabd06b78078a7146730dff557f2cb71~kWqAG3AB-1019110191eusmtip2F;
 Thu, 11 Sep 2025 22:23:17 +0000 (GMT)
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
X-Inumbo-ID: ed93ee2e-8f5d-11f0-9d13-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250911222322euoutp011634560d57af0d6769ea82508ee6c7b3~kWqER7Qs81513015130euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757629402;
	bh=9atdt/om7OmffbDgov9WTxIsiO59X0BmEMtINP1uP9A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=oYf4Wl/vK4mtCwLnlaPuk0Vbqm1kIIG4/GofumuhdavmIiBHyUZQRceOU6BgMduk5
	 UPpbMvZbaMJvAX41rCofkjz8fUum8Xd7cFaLczcWfrjE46zM7Gw77+bY+gxYbnaXwW
	 jL8zkycMTQXVpPJyDpmR0+MuvHwC/4FUakNYU3YU=
Message-ID: <5ffc63e9-19bd-4e12-92fc-57fe12d10f4f@samsung.com>
Date: Fri, 12 Sep 2025 00:23:17 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v6 03/16] dma-debug: refactor to use physical addresses
 for page mapping
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Abdiel Janulgue
	<abdiel.janulgue@gmail.com>, Alexander Potapenko <glider@google.com>, Alex
	Gaynor <alex.gaynor@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, David
	Hildenbrand <david@redhat.com>, iommu@lists.linux.dev, Jason Wang
	<jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
	<joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Juergen Gross
	<jgross@suse.com>, kasan-dev@googlegroups.com, Keith Busch
	<kbusch@kernel.org>, linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Miguel
	Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, Stefano
	Stabellini <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250910052618.GH341237@unreal>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250911222321eucas1p114043a72e011e2fff92df33a2133b21e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250910052628eucas1p160daa0dadb6f81d7831d8047628aa9d4
X-EPHeader: CA
X-CMS-RootMailID: 20250910052628eucas1p160daa0dadb6f81d7831d8047628aa9d4
References: <cover.1757423202.git.leonro@nvidia.com>
	<56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
	<20250909193748.GG341237@unreal>
	<CGME20250910052628eucas1p160daa0dadb6f81d7831d8047628aa9d4@eucas1p1.samsung.com>
	<20250910052618.GH341237@unreal>

On 10.09.2025 07:26, Leon Romanovsky wrote:
> On Tue, Sep 09, 2025 at 10:37:48PM +0300, Leon Romanovsky wrote:
>> On Tue, Sep 09, 2025 at 04:27:31PM +0300, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>> <...>
>>
>>>   include/linux/page-flags.h         |  1 +
>> <...>
>>
>>> --- a/include/linux/page-flags.h
>>> +++ b/include/linux/page-flags.h
>>> @@ -614,6 +614,7 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
>>>    * available at this point.
>>>    */
>>>   #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
>>> +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
>> This was a not so great idea to add PhysHighMem() because of "else"
>> below which unfolds to maze of macros and automatically generated
>> functions with "static inline int Page##uname ..." signature.
>>
>>>   #define folio_test_highmem(__f)	is_highmem_idx(folio_zonenum(__f))
>>>   #else
>>>   PAGEFLAG_FALSE(HighMem, highmem)
> After sleeping over it, the following hunk will help:
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index dfbc4ba86bba2..2a1f346178024 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -614,11 +614,11 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
>    * available at this point.
>    */
>   #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
> -#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
>   #define folio_test_highmem(__f)        is_highmem_idx(folio_zonenum(__f))
>   #else
>   PAGEFLAG_FALSE(HighMem, highmem)
>   #endif
> +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
>
>   /* Does kmap_local_folio() only allow access to one page of the folio? */
>   #ifdef CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP

Okay, I will add this fixup while applying the patches.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


