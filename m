Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E54360712
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 12:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111021.212201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzCS-0006Us-9d; Thu, 15 Apr 2021 10:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111021.212201; Thu, 15 Apr 2021 10:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzCS-0006UR-5Q; Thu, 15 Apr 2021 10:26:16 +0000
Received: by outflank-mailman (input) for mailman id 111021;
 Thu, 15 Apr 2021 10:26:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWzCP-0006UM-SQ
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 10:26:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWzCP-0005nz-Jn; Thu, 15 Apr 2021 10:26:13 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWzCP-00010I-AA; Thu, 15 Apr 2021 10:26:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NZ07Qcw1Cctb6iKARQGabUrJslVL16xSSfmjvDjEfmQ=; b=k7StNO7A8s8cRusMz7QXsQY76t
	f8tWcHeeoA03pSMvheHzbhF2eio5ffTu8xpaxwH51BOSo73yErW/jpsRKXJNymwF42WANHuXExD44
	erOEqZUZK0vG8KLWmrvvNw/xim17t8TMyWjTd4K91t6eydbC2YFq/75UyshFnA1/PzGw=;
Subject: Re: [PATCH 11/11] Arm/optee: don't open-code xzalloc_flex_struct()
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <aad23304-c727-2921-59fe-ab3763f5da03@suse.com>
 <9f95c37b-dc4a-d2cf-01c1-98d2108fae88@xen.org>
 <1c9229ac-5491-313e-f053-bc5bee01c3de@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7945a56e-337d-3c84-ecfd-2be759adda4a@xen.org>
Date: Thu, 15 Apr 2021 11:26:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1c9229ac-5491-313e-f053-bc5bee01c3de@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/04/2021 08:03, Jan Beulich wrote:
> On 13.04.2021 20:19, Julien Grall wrote:
>> On 08/04/2021 13:23, Jan Beulich wrote:
>>> There is a difference in generated code: xzalloc_bytes() forces
>>> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
>>> actually don't want it.
>>
>> So I think moving to xmalloc_flex_struct() is a pretty good move. But I
>> am actually a bit confused with the argument used.
>>
>> Could you provide some details why you think forcing the array to be
>> aligned to the maximum cache line supported (128 bytes on Arm) is wrong?
> 
> It is not "wrong" in that sense, but if this is intended it shouldn't
> be arranged via use of xmalloc_bytes().

This is not very clear from the commit message (or even the cover 
letter). How about:

"
The current use xzalloc_bytes() in optee is nearly an open-coded version 
of xzalloc_flex_struct() which was introduced after the driver was merged.

The main difference is xzalloc_bytes() will also force the allocation to 
be SMP_CACHE_BYTES aligned and therefore avoid sharing the cache line.

While sharing the cache line can have an impact on the performance, this 
is also true for most of the other users of  x*alloc_flex_struct(). So 
if we want to prevent sharing a cache line, it should be part of 
x*alloc_flex_struct().

In this case, we don't need stricter alignment than what the allocator 
does. So the call to xzalloc_bytes() is now replaced with a call 
xzalloc_flex_Struct().
"

Ideally, we want the same sort of the commit message in the other patches.

> As also pointed out in a
> similar discussion on another sub-thread, imo xmalloc_bytes(), being
> type-unsafe, should go away altogether mid-term.

And I will support dropping xmalloc_bytes().

> If individual callers
> have specific alignment requirements (which ought to be the exception),
> they should explicitly request the needed alignment. If architectures
> would prefer all allocations to have certain minimum alignment (e.g.
> to avoid cacheline sharing, which was Andrew's argument) or other
> "arrangement" (alignment by itself may not be that interesting due to
> the bhdr placed ahead of the allocation), it should be the allocator
> itself that provides for this, not individual callers.

And I agree that the allocator should do the alignment if this benefits 
every allocation.

Cheers,

-- 
Julien Grall

