Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA535EDFF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 09:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110286.210518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZZE-0003Ge-0h; Wed, 14 Apr 2021 07:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110286.210518; Wed, 14 Apr 2021 07:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZZD-0003GF-TN; Wed, 14 Apr 2021 07:04:03 +0000
Received: by outflank-mailman (input) for mailman id 110286;
 Wed, 14 Apr 2021 07:04:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWZZC-0003G9-KL
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 07:04:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18b1592a-4221-42c3-bb14-d094061185f9;
 Wed, 14 Apr 2021 07:04:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 902AEABF6;
 Wed, 14 Apr 2021 07:03:59 +0000 (UTC)
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
X-Inumbo-ID: 18b1592a-4221-42c3-bb14-d094061185f9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618383839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzdCFqNXJM+Y7HaQG2lsIiWMMIlqEKnnRc2eLr1g0ts=;
	b=MyIi/aRQWnQfQ12JGs93AxdKfU5/aaJKs4BFnfd7JhZFNeB+CsXKGeanVJnFlIj45WRv+C
	RSx5vv3q85dSDFsPtrmEnY/pHyBRf4qaDjspz4WQMuGmRh9OYaDvX7ApiUARXlRoWS/fWL
	4D6B5H842gugP+TagdRhyFeOczSkp9k=
Subject: Re: [PATCH 11/11] Arm/optee: don't open-code xzalloc_flex_struct()
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <aad23304-c727-2921-59fe-ab3763f5da03@suse.com>
 <9f95c37b-dc4a-d2cf-01c1-98d2108fae88@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c9229ac-5491-313e-f053-bc5bee01c3de@suse.com>
Date: Wed, 14 Apr 2021 09:03:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9f95c37b-dc4a-d2cf-01c1-98d2108fae88@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.04.2021 20:19, Julien Grall wrote:
> On 08/04/2021 13:23, Jan Beulich wrote:
>> There is a difference in generated code: xzalloc_bytes() forces
>> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
>> actually don't want it.
> 
> So I think moving to xmalloc_flex_struct() is a pretty good move. But I 
> am actually a bit confused with the argument used.
> 
> Could you provide some details why you think forcing the array to be 
> aligned to the maximum cache line supported (128 bytes on Arm) is wrong?

It is not "wrong" in that sense, but if this is intended it shouldn't
be arranged via use of xmalloc_bytes(). As also pointed out in a
similar discussion on another sub-thread, imo xmalloc_bytes(), being
type-unsafe, should go away altogether mid-term. If individual callers
have specific alignment requirements (which ought to be the exception),
they should explicitly request the needed alignment. If architectures
would prefer all allocations to have certain minimum alignment (e.g.
to avoid cacheline sharing, which was Andrew's argument) or other
"arrangement" (alignment by itself may not be that interesting due to
the bhdr placed ahead of the allocation), it should be the allocator
itself that provides for this, not individual callers.

Jan

