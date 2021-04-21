Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94F366ADF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 14:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114460.218130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZC2n-0005VT-Mx; Wed, 21 Apr 2021 12:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114460.218130; Wed, 21 Apr 2021 12:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZC2n-0005V4-JV; Wed, 21 Apr 2021 12:33:25 +0000
Received: by outflank-mailman (input) for mailman id 114460;
 Wed, 21 Apr 2021 12:33:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZC2l-0005Uz-OF
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 12:33:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZC2h-0007bU-Sd; Wed, 21 Apr 2021 12:33:19 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZC2h-0005Kq-IN; Wed, 21 Apr 2021 12:33:19 +0000
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
	bh=mYmM24mLKgLCz+WYQeCydJI3pDAs79lkrvvCaIamrPY=; b=d776M1BdiUESilTVOAGl9TLU+1
	apxHQM/LZe8p3SJ1LvlMX/ewNRElt4AdBomdn4s2ORnRAGqe6QZCxD6YkkIe9/evxPefbnMDPxMb6
	JreBn3p244pT74VlOAdfRic5vwzFRtVWrlegmb5M/XUBLvt+XMFbM5PrJfEWVEmIvD1U=;
Subject: Re: [PATCH] xen/arm: Ensure the vCPU context is seen before clearing
 the _VPF_down
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 ash.j.wilding@gmail.com, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210226205158.20991-1-julien@xen.org>
 <alpine.DEB.2.21.2102261756280.2682@sstabellini-ThinkPad-T480s>
 <ca41bfbb-d942-d8fd-e96e-c464f6b3643f@xen.org>
 <alpine.DEB.2.21.2103191652450.439@sstabellini-ThinkPad-T480s>
 <86165804-34a1-59e5-1b51-fecc60dbf796@xen.org>
 <alpine.DEB.2.21.2104131541370.4885@sstabellini-ThinkPad-T480s>
 <ebcaad65-a155-6979-9754-a8ef0ece3590@xen.org>
 <alpine.DEB.2.21.2104201234060.26180@sstabellini-ThinkPad-T480s>
 <37631386-a53f-d99d-d71b-0b871b5dd9b0@xen.org>
 <alpine.DEB.2.21.2104201726061.26180@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <0660d553-54e3-0c5e-ef2d-41c3dc740695@xen.org>
Date: Wed, 21 Apr 2021 13:33:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104201726061.26180@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/04/2021 01:38, Stefano Stabellini wrote:
> On Tue, 20 Apr 2021, Julien Grall wrote:
>> AFAICT, there is nothing in the implementation of XEN_DOMCTL_getvcpucontext
>> that justify the extra barrier (assuming we consider vcpu_pause() as a full
>> memory barrier).
>>
>>  From your e-mail, I also could not infer what is your exact concern regarding
>> the memory ordering. If you have something in mind, then would you mind to
>> provide a sketch showing what could go wrong?
> 
> Let me start with what I had in mind:
> 
> initialized = v->is_initialized;
> smp_rmb();
> if ( !initialized )
>    goto getvcpucontext_out;
> 
> 
> Without smp_rmb there are no guarantees that we see an up-to-date value
> of v->is_initialized, right?

No. The smp_*mb() barriers only guarantee an ordering, it doesn't say 
anything about when the values will be seen. The write may in fact still 
be in the write buffer of the other CPU.

> This READ of v->is_initialized is supposed
> to pair with the WRITE in arch_set_info_guest.

I am assuming you meant the access and not the barrier, right? 
Regardless, the barriers used, the access will happen in any order. IOW 
the following two ordering is possible:

Sequence 1:

CPU0: v->vcpu_initialized = 1
CPU1: read v->vcpu_initialized

Sequence 2:

CPU1: read v->vcpu_initialized
CPU0: v->vcpu_initialized = 0

In the first sequence, CPU1 will observe 0 and therefore bailout. In the 
second sequence, we will be observing 1 and continue.

> 
> Relying on the the barrier in vcpu_pause is OK only if is_initialised
> was already read as "1".
> 
> I think it might be OK in this case, because probably nothing wrong
> happens if we read the old value of v->is_initialized as "0" but it
> doesn't seem to be a good idea.

The smp_rmb() is not going to give you that guarantee. If you need it, 
then you mostly likely want to use a synchronization primitives such as 
spin_lock().

> Theoretically it could pass a very long
> time before we see v->is_initialized as "1" without the smp_rmb.

I have the impression that there might be confusion about what I am 
aiming to achieve.

The code today looks roughly like:

1) if ( v->is_initialized )
2)   return;
3) vcpu_pause();
4) /* Access registers */

My aim is to ensure that a processor will not READ any value for 4) are 
not happening before 1). If this happens, then we may provide garbagge 
to the domctl.

Returning an error is a lot better because the caller of the domctl will 
know the vCPU is not yet setup and can provide the infrastructure to try 
again.

 From this PoV, your proposal and my two proposals are functionally 
equivalent. The main differences is whether there is an extra barrier 
and how easy is it to figure out the ordering.

Speaking with Ash, your proposal is probably the easiest one to 
understand. However, it also adds a barrier for the failure path (which 
is pointless).

I would like to avoid barriers when they are not necessary. Hence why I 
prefer the vcpu_pause() solution (we may want to add a comment).

Although, I could live with your proposal if the others are happy with 
it (Andrew? Jan?) because this is not an hot path.

Cheers,

-- 
Julien Grall

