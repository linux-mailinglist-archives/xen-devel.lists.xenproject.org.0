Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC936D8EE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 15:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119378.225826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkei-0001Uh-Qt; Wed, 28 Apr 2021 13:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119378.225826; Wed, 28 Apr 2021 13:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkei-0001UI-Nv; Wed, 28 Apr 2021 13:55:08 +0000
Received: by outflank-mailman (input) for mailman id 119378;
 Wed, 28 Apr 2021 13:55:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbkeh-0001UD-97
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 13:55:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54927e7a-1631-463e-92ec-6c1af4a60206;
 Wed, 28 Apr 2021 13:55:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70778B197;
 Wed, 28 Apr 2021 13:55:05 +0000 (UTC)
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
X-Inumbo-ID: 54927e7a-1631-463e-92ec-6c1af4a60206
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619618105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMVnwNnoLMDZf5nSSh7sqO65rAV0iBlhVquou0Wers8=;
	b=eHLEJ5NoTutlamblIYkYZKBRMFkEQq/Jlx4ITifXsL++rh1Z6qGfMLfxhEjPY0ieYnhbhW
	ddt3cvhDV0oKpDZftK8iXIL4V8jIo0hdpqPqT7cRiFw5auZkwppy3ntunaEOH36TizaoXU
	E3GHh5mq/43n0I/pMs/bs7WPb9L0M58=
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
 <1edc8d66-ca10-8e90-d8e8-2e299ef715d7@suse.com>
 <4317b9a308cce76de8c75288d41af9dde10cbe6e.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a5deabc-d711-651a-8d76-44fb03613901@suse.com>
Date: Wed, 28 Apr 2021 15:55:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <4317b9a308cce76de8c75288d41af9dde10cbe6e.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 15:22, Hongyan Xia wrote:
> On Wed, 2021-04-28 at 13:51 +0200, Jan Beulich wrote:
>> See my proposal to defer unmapping of the domain's own pages
>> (and I would consider the p2m pages to be part of the domain's
>> ones for this purpose). In fact, since the p2m pages come from a
>> fixed, separate pool I wonder whether the entire pool couldn't
>> be mapped in e.g. the per-domain VA range.
> 
> I thought about that as well, not just EPT but a lot of domain-private
> pages can be moved to the per-domain range, and the secrets are hidden
> by virtue of cr3 switches when switching to other domains. But still we
> have the problem of quickly finding PA->VA (I don't mean __va(), I mean
> finding the VA that can access a page table page) for EPT walks.
> 
> Mapping in bigger pages should work wonders for pre-partitioned guests
> where we know the guest mostly just has contiguous physical memory and
> a superpage map probably covers all pages in an HVM 2-level walk. But
> for a generic solution where domain memory can be really fragmented
> (and context switches can happen a lot on a pCPU), how can we quickly
> find PA->VA in EPT walking without some intrusive changes to Xen? Of
> course, if we do not allow the HAP pool to change and force the HAP
> pool to be physically contiguous, we can just remember the base VA of
> its vmapped region for quick PA->VA, but I don't think this is a
> generic solution.

We don't need to make the p2m pool static, but I think we can build on
it changing rarely, if ever. Hence it changing may be acceptable to be
moderately expensive.

If we made the pool physically contiguous, translation - as you say -
would be easy. But even if we can't find enough physical memory for it
to be contiguous, we can still help ourselves. The intermediate case is
when we can still make it consist of all 2M pages. There translation
may be fast enough even via a brute force array lookup. If we need to
resort to 4k pages, why not maintain the PA->VA association in a radix
tree?

Independent of that I think there are some cycles to be gained by,
already today, not having to map and unmap the root page table for
every access (get, set, etc).

Jan

