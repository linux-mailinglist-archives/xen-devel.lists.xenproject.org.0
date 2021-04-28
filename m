Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B436D6D0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 13:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119268.225688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbijA-0006t5-M5; Wed, 28 Apr 2021 11:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119268.225688; Wed, 28 Apr 2021 11:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbijA-0006sf-In; Wed, 28 Apr 2021 11:51:36 +0000
Received: by outflank-mailman (input) for mailman id 119268;
 Wed, 28 Apr 2021 11:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbij8-0006sa-GJ
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 11:51:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ad4c323-b77e-4261-8136-367685e0c9f4;
 Wed, 28 Apr 2021 11:51:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6A0DB155;
 Wed, 28 Apr 2021 11:51:32 +0000 (UTC)
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
X-Inumbo-ID: 2ad4c323-b77e-4261-8136-367685e0c9f4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619610692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uocNQ6cVlsLNTMgKENbh5tUDcffYvr09JXYanuSOEyM=;
	b=NlIrLFBvMiLFrxUtWXs3jJFlzs9k0BpRnLfNGFtQulaC2oQx6/4MTgiblux7C+pH8P86y/
	iX/fkjP0r9tdOObgQ0ut5kjnupKOGVtMaFMWaHTnlGwb5eDa+1WPbLnxOa+6sqGyxSCa+s
	9cehRPeSTG4T7z7XYRNVyM3icSHYpLU=
Subject: Re: [PATCH 13/16] xen/page_alloc: add a path for xenheap when there
 is no direct map
To: Hongyan Xia <hx242@xen.org>
Cc: julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1588278317.git.hongyxia@amazon.com>
 <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
 <a1bd2c72-1310-f018-dda5-90521be03fe4@suse.com>
 <943480f695052163b540919c9c55655e5b4f741a.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1edc8d66-ca10-8e90-d8e8-2e299ef715d7@suse.com>
Date: Wed, 28 Apr 2021 13:51:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <943480f695052163b540919c9c55655e5b4f741a.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 13:04, Hongyan Xia wrote:
> On Thu, 2021-04-22 at 14:31 +0200, Jan Beulich wrote:
>> As I don't think we have many cases where code actually depends on
>> being able to apply __va() (or equivalent) to the address returned
>> from alloc_xenheap_pages(), I think this should instead involve
>> vmap(), with the vmap area drastically increased (perhaps taking all
>> of the space the direct map presently consumes). For any remaining
>> users of __va() or alike these should perhaps be converted into an
>> alias / derivation of vmap_to_{mfn,page}() then.
> 
> That's true, and this was my first implementation (and also Wei's
> original proposal) which worked okay. But, several problems got in the
> way.
> 
> 1. Partial unmap. Biggest offender is xmalloc which allocates and could
> then free part of it, which means we need to be able to partially unmap
> the region. vmap() does not support this.

If the direct map went fully away, and hence if Xen heap pages got
vmap()-ed, there's no reason to keep xmalloc() from forwarding to
vmalloc() instead of going this partial-unmap route.

> 2. Fast PA->VA. There is currently no way to go from PA to VA in
> vmapped pages, unless we somehow repurpose or add new fields in
> page_info. Also, VA->PA is possible but very slow now. There is not
> much PA->VA in the critical path but see 3.

There would better not be any PA->VA. Can you point out examples
where it would be hard to avoid using such? I also don't see the
connection to 3 - is EPT code using PA->VA a lot? p2m-ept.c does
not look to have a single use of __va() or ..._to_virt().

> 3. EPT. Mapping and unmapping EPT in HVM hypercalls and MMIO are so
> many and so slow that it is probably not possible to keep them as
> domheap pages due to the big performance drop after removing the direct
> map. If we move them to xenheap pages on vmap, then this depends on 2
> for page table walking.

See my proposal to defer unmapping of the domain's own pages
(and I would consider the p2m pages to be part of the domain's
ones for this purpose). In fact, since the p2m pages come from a
fixed, separate pool I wonder whether the entire pool couldn't
be mapped in e.g. the per-domain VA range.

Jan

