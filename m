Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61C31F7EA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 12:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86845.163322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD3d7-00070J-HW; Fri, 19 Feb 2021 11:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86845.163322; Fri, 19 Feb 2021 11:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD3d7-0006zu-Dj; Fri, 19 Feb 2021 11:07:25 +0000
Received: by outflank-mailman (input) for mailman id 86845;
 Fri, 19 Feb 2021 11:07:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD3d6-0006zp-LW
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 11:07:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ad6a248-4987-42e3-b7b7-9f423cfa0097;
 Fri, 19 Feb 2021 11:07:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69C83AFCD;
 Fri, 19 Feb 2021 11:07:22 +0000 (UTC)
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
X-Inumbo-ID: 5ad6a248-4987-42e3-b7b7-9f423cfa0097
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613732842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8UOkix4EP/5Ua9OQdNnxiZgSKUwqBjpGAIkG+Sptj9I=;
	b=haldrOyQszsZCowU1rQgI/64rM0myLAMVfJ378rwglDRlrkhUsAMaJ5oydzck6H11pc1Wp
	Ca1T8WQHzFRfCLXYjLcPAXRoZHMiVBGFNkdP9o9XbW/Z5UL2XI/XNIAT0MpJFAQndWHccd
	bROw+29w5ZBiyuYsnMeQ+hLZCrSSQ/s=
Subject: Re: [bug report] xen-blkback: don't "handle" error by BUG()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: xen-devel@lists.xenproject.org
References: <YC992dHyignVEe5R@mwanda>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60a27374-d84d-19c5-5a04-2ab981e8ad83@suse.com>
Date: Fri, 19 Feb 2021 12:07:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YC992dHyignVEe5R@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 09:59, Dan Carpenter wrote:
> Hello Jan Beulich,
> 
> The patch 5a264285ed1c: "xen-blkback: don't "handle" error by BUG()"
> from Feb 15, 2021, leads to the following static checker warning:
> 
> 	drivers/block/xen-blkback/blkback.c:836 xen_blkbk_map()
> 	warn: should this be a bitwise negate mask?
> 
> drivers/block/xen-blkback/blkback.c
>    823           * Now swizzle the MFN in our domain with the MFN from the other domain
>    824           * so that when we access vaddr(pending_req,i) it has the contents of
>    825           * the page from the other domain.
>    826           */
>    827          for (seg_idx = last_map, new_map_idx = 0; seg_idx < map_until; seg_idx++) {
>    828                  if (!pages[seg_idx]->persistent_gnt) {
>    829                          /* This is a newly mapped grant */
>    830                          BUG_ON(new_map_idx >= segs_to_map);
>    831                          if (unlikely(map[new_map_idx].status != 0)) {
>    832                                  pr_debug("invalid buffer -- could not remap it\n");
>    833                                  gnttab_page_cache_put(&ring->free_pages,
>    834                                                        &pages[seg_idx]->page, 1);
>    835                                  pages[seg_idx]->handle = BLKBACK_INVALID_HANDLE;
>    836                                  ret |= !ret;
> 
> Originally this code was:
> 
> 	ret |= 1;
> 
> Now it's equivalent to:
> 
> 	if (!ret)
> 		ret = 1;
> 
> This is the second user of this idiom in the kernel.  Both were
> introduced in the last month so maybe it's a new trend or something...
> Anyway.  False positive warning.
> 
> But my main question isn't really related to this patch.  What does
> the 1 mean in this context?  I always feel like there should be
> documentation when functions return a mix of error codes, zero and one
> but there isn't any here.

I agree. The literal 1 was there before, and the security fix
was not a good place to change this. I suppose you really
should ask whoever introduced that use of literal 1. I find
this as odd as you do, and ...

> I have reviewed this and so far as I can see setting "ret = 1;" is
> always treated exactly the same as an error code by everything.  Every
> single place where this is checked just checks for ret is zero.  The
> value is propagated two functions back and then it becomes -EIO.

... I've come to the same conclusions.

Jan

