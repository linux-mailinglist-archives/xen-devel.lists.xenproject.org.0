Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3D366123
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 22:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114003.217170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYxHi-0006ww-Lb; Tue, 20 Apr 2021 20:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114003.217170; Tue, 20 Apr 2021 20:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYxHi-0006wX-I9; Tue, 20 Apr 2021 20:47:50 +0000
Received: by outflank-mailman (input) for mailman id 114003;
 Tue, 20 Apr 2021 20:47:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYxHg-0006wS-A1
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 20:47:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYxHc-0001Fk-5b; Tue, 20 Apr 2021 20:47:44 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYxHb-0001Mv-Qr; Tue, 20 Apr 2021 20:47:43 +0000
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
	bh=062wf0jX2s7gBmfPJWrxKqZ4yMQBlrsJ/ydjSMaRZ7I=; b=T/ptf+MG92mRSTz8tijz8xfeMD
	ZKVFFZSG+3A8TuiWUBsBklyU/TEnhKzmcKLlK5ZDJX064rs1uCoSe4L3eAQ6ozCRMOmlngS5CcLR4
	HbKm/Zz44XVxM5lZjMc83fqR2CHlJ3ta8D6cbwW5wwtDeCzE1LZ5kykthX57qDKLpCyE=;
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
From: Julien Grall <julien@xen.org>
Message-ID: <37631386-a53f-d99d-d71b-0b871b5dd9b0@xen.org>
Date: Tue, 20 Apr 2021 21:47:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104201234060.26180@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Andrew and Jan)

Hi Stefano,

On 20/04/2021 20:38, Stefano Stabellini wrote:
> On Fri, 16 Apr 2021, Julien Grall wrote:
>>> I think your explanation is correct. However, don't we need a smp_rmb()
>>> barrier after reading v->is_initialised in xen/common/domctl.c:do_domctl
>>> ? That would be the barrier that pairs with smp_wmb in regards to
>>> v->is_initialised.
>>
>> There is already a smp_mb() in sync_vcpu_exec_state() which is called from
>> vcpu_pause() -> vcpu_sleep_sync().
> 
> But that's too late, isn't? The v->is_initialized check is done before
> the vcpu_pause() call. We might end up taking the wrong code path:
> 
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/domctl.c#L587
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/domctl.c#L598

I am a bit confused what you mean by "wrong path" here. There is no 
timing guarantee with a memory barrier. What the barrier will guarantee 
you is v->is_initialized will be read *before* anything after the barrier.

Are you worried that some variables in vcpu_pause() may be read before 
v->is_initialized?

> 
>> I don't think we can ever remove the memory barrier in sync_vcpu_exec_state()
>> because the vCPU paused may have run (or initialized) on a different pCPU. So
>> I would like to rely on the barrier rather than adding an extra one (even
>> thought it is not a fast path).
>>
>> I am thinking to add a comment on top of vcpu_pause() to clarify that after
>> the call, the vCPU context will be observed without extra synchronization
>> required.
> 
> Given that an if.. goto is involved, even if both code paths lead to
> good results, I think it would be best to have the smp_rmb() barrier
> above after the first v->is_initialised read to make sure we take the
> right path.

I don't understand what you are referring by "wrong" and "right" path. 
The processor will always execute/commit the path based on the value of 
v->is_initialized. What may happen is the processor may start to 
speculate the wrong path and then backtrack if it discovers the value is 
not the expected one. But, AFAIK, smp_rmb() is not going to protect you 
against speculation... smp_rmb() is only going to enforce a memory 
ordering between read.

> Instead of having to make sure that even the "wrong" path
> behaves correctly.
Just for clarification, I think you meant writing the following code:

if ( !v->is_initialized )
   goto getvcpucontext_out;

smp_rmb();

...

vcpu_pause();

AFAICT, there is nothing in the implementation of 
XEN_DOMCTL_getvcpucontext that justify the extra barrier (assuming we 
consider vcpu_pause() as a full memory barrier).

 From your e-mail, I also could not infer what is your exact concern 
regarding the memory ordering. If you have something in mind, then would 
you mind to provide a sketch showing what could go wrong?

Cheers,

-- 
Julien Grall

