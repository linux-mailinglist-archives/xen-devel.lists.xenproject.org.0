Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C6271913
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 03:58:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKB4o-0006GM-3D; Mon, 21 Sep 2020 01:57:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g9WK=C6=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kKB4n-0006GH-BY
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 01:57:09 +0000
X-Inumbo-ID: aa07bbea-6272-4a1a-9082-66a30a1df7b3
Received: from out30-132.freemail.mail.aliyun.com (unknown [115.124.30.132])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa07bbea-6272-4a1a-9082-66a30a1df7b3;
 Mon, 21 Sep 2020 01:57:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0U9XKMRq_1600653420; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U9XKMRq_1600653420) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 21 Sep 2020 09:57:01 +0800
Date: Mon, 21 Sep 2020 09:57:00 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 2/4] mm/page_alloc: place pages to tail in
 __putback_isolated_page()
Message-ID: <20200921015700.GA83969@L-31X9LVDL-1304.local>
References: <20200916183411.64756-1-david@redhat.com>
 <20200916183411.64756-3-david@redhat.com>
 <20200918020758.GB54754@L-31X9LVDL-1304.local>
 <e287e372-7b5d-9a0b-9e27-7de1e305fc3a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e287e372-7b5d-9a0b-9e27-7de1e305fc3a@redhat.com>
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
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 18, 2020 at 09:27:23AM +0200, David Hildenbrand wrote:
>On 18.09.20 04:07, Wei Yang wrote:
>> On Wed, Sep 16, 2020 at 08:34:09PM +0200, David Hildenbrand wrote:
>>> __putback_isolated_page() already documents that pages will be placed to
>>> the tail of the freelist - this is, however, not the case for
>>> "order >= MAX_ORDER - 2" (see buddy_merge_likely()) - which should be
>>> the case for all existing users.
>>>
>>> This change affects two users:
>>> - free page reporting
>>> - page isolation, when undoing the isolation.
>>>
>>> This behavior is desireable for pages that haven't really been touched
>>> lately, so exactly the two users that don't actually read/write page
>>> content, but rather move untouched pages.
>>>
>>> The new behavior is especially desirable for memory onlining, where we
>>> allow allocation of newly onlined pages via undo_isolate_page_range()
>>> in online_pages(). Right now, we always place them to the head of the
>> 
>> The code looks good, while I don't fully understand the log here.
>> 
>> undo_isolate_page_range() is used in __offline_pages and alloc_contig_range. I
>> don't connect them with online_pages(). Do I miss something?
>
>Yeah, please look at -mm / -next instead. See
>
>https://lkml.kernel.org/r/20200819175957.28465-11-david@redhat.com
>

Thanks, I get the point.

>
>-- 
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

