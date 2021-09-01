Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF53FE1FD
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 20:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176607.321369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLUhk-0003E9-IR; Wed, 01 Sep 2021 18:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176607.321369; Wed, 01 Sep 2021 18:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLUhk-0003Aw-FQ; Wed, 01 Sep 2021 18:11:20 +0000
Received: by outflank-mailman (input) for mailman id 176607;
 Wed, 01 Sep 2021 18:11:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLUhi-0003AX-W8
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 18:11:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLUhi-0008Fy-NV; Wed, 01 Sep 2021 18:11:18 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLUhi-0000v1-HK; Wed, 01 Sep 2021 18:11:18 +0000
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
	bh=icnWcTlQp/oE8mUZ05u+b5+ihbagLiHOfp5+wRHA+Gc=; b=ZXdspewTVPJE5qslYe9D6qFmL2
	lv3B7YG6jLU5MkHS2IRcnpiiL6EVEEvykaBV6Mu+ns+7kg2AsTdaLsbalT5KF8OdiT/dVcJchCVBy
	LrA48cP23cRl/urp4BWc6GQOOrYUTq6bifGG/k6xxKNq3kJ9nXABAqL9SH6dNMTp9SDo=;
Subject: Re: vcpu_show_execution_state() difference between Arm and x86
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <85dc06ff-04df-2148-81c5-26bd25d1142f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8f295eeb-e8f2-a115-3f83-60922d0fe5f9@xen.org>
Date: Wed, 1 Sep 2021 19:11:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <85dc06ff-04df-2148-81c5-26bd25d1142f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 01/09/2021 14:39, Jan Beulich wrote:
> All,
> 
> back in 2016 Andrew added code to x86'es variant to avoid interleaving
> of output. The same issue ought to exist on Arm.

Agree. I guess we got away so far because it is pretty rare to have two 
CPUs running at the same.

> The lock acquired,
> or more importantly the turning off of IRQs while doing so, is now
> getting in the way of having PVH Dom0's state dumped the 2nd time. 

I am not quite too sure to understand the problem with PVH dom0. Do you 
have a pointer to the issue?

> For
> register state I did find a sufficiently simple (yet not pretty)
> workaround. For the stack, where I can't reasonably avoid using p2m
> functions, this is going to be more difficult. >
> Since I expect Arm to want to also have interleave protection at some
> point, and since Arm also acquires the p2m lock while accessing Dom0's
> stacks, I wonder whether anyone has any clever idea on how to avoid
> the (valid) triggering of check_lock()'s assertion without intrusive
> changes. (As to intrusive changes - acquiring the p2m lock up front in
> recursive mode, plus silencing check_lock() for nested acquires of a
> lock that's already being held by a CPU was my initial idea.)

At least one Arm, the P2M lock is a rwlock which is not yet recursive. 
But then it feels to me that this solution is only going to cause us 
more trouble in the future.

I looked at the original commit to find out the reason to use the 
console lock. AFAICT, this was to allow console_force_unlock() to work 
properly. But it is not entirely clear why we couldn't get a new lock 
(with IRQ enabled) that could be forced unlocked in that function.

Can either you or Andrew clarify it?

The other solution I can think off is buffering the output for 
show_registers and only print it once at the end. The downside is we may 
not get any output if there is an issue in the middle of the dump.

Cheers,

-- 
Julien Grall

