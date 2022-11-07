Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6847E61EF21
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 10:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439173.693179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryW5-0002zu-VU; Mon, 07 Nov 2022 09:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439173.693179; Mon, 07 Nov 2022 09:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryW5-0002xR-RR; Mon, 07 Nov 2022 09:34:05 +0000
Received: by outflank-mailman (input) for mailman id 439173;
 Mon, 07 Nov 2022 09:34:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oryW3-0002xC-Gy
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 09:34:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oryW3-0001xS-9E; Mon, 07 Nov 2022 09:34:03 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oryW3-0002en-3I; Mon, 07 Nov 2022 09:34:03 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=fh+/3JjT08V2mpQpJKIyrhxR5RAJjEc00gsvoahjXWA=; b=P4FXrb656+dEAGwIGoWXOVB1df
	8E33I+8TiyM8DbD+3O08jnLxtzYfQtljJJr2JROgv/hJOWF59favY7IVlBBMNsXOL3rTJ3YO+tWpJ
	46o+2UEdm5tAmPb0oMHtZJ2fZcl2rzDeB407AuKaBnDoeYSyyNEFP3pnrYPK/gWP/QSY=;
Message-ID: <c26c575a-69aa-fcbe-fa67-e09b351fa542@xen.org>
Date: Mon, 7 Nov 2022 09:34:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-9-wei.chen@arm.com>
 <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
In-Reply-To: <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/11/2022 20:06, Julien Grall wrote:
> Hi Wei,
> 
> On 04/11/2022 10:07, Wei Chen wrote:
>> There are lots of MMU specific code in head.S. This code will not
>> be used in MPU systems. If we use #ifdef to gate them, the code
>> will become messy and hard to maintain. So we move MMU related
>> code to head_mmu.S, and keep common code still in head.S.
> 
> I am afraid that you can't simply move the MMU code out of head.S 
> because this will break Xen when running using the identity map.
> 
> This is because we only map the first 4KB of Xen with PA == VA. At the 
> moment, we guarantee it by having everything that needs to be used in 
> the identity mapping before _end_boot and checking at link time if this 
> fits in 4KB.
> 
> Now that you moved the MMU code outside of head.S. We need to find a 
> different way to guarantee it. One way to do it would be to create a 
> section that would be used for everything that needs to be identity mapped.

Looking at the code this morning, I noticed that we already have the 
section ".text.header". For now, that should do the job. So we just need
to check the size of .text.header.

Ideally, checking the size should be done in a separate pre-patch so it 
is easier to review.

Cheers,

-- 
Julien Grall

