Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764E36631B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 02:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114061.217252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ0t4-00036O-FC; Wed, 21 Apr 2021 00:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114061.217252; Wed, 21 Apr 2021 00:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ0t4-00035z-Bz; Wed, 21 Apr 2021 00:38:38 +0000
Received: by outflank-mailman (input) for mailman id 114061;
 Wed, 21 Apr 2021 00:38:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H1sd=JS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lZ0t2-00035u-Ve
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 00:38:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e69274-60f2-4253-ac05-712b7cc1390d;
 Wed, 21 Apr 2021 00:38:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC1CD613F5;
 Wed, 21 Apr 2021 00:38:32 +0000 (UTC)
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
X-Inumbo-ID: 58e69274-60f2-4253-ac05-712b7cc1390d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618965513;
	bh=RmLqvu9tgob2Eh+IKRGLzjOvMGE6rKk/UB90gfOoPvM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ux8yPz99HVVOPErlQ/9ves5Bl6Rz2UVqJOP5fysNtalFblzUBtsAJWNO1f2Bn9BHh
	 MS9dMtlGvQl6SafhYqJP6/2LtelVR+L5HXXP6rZe3j5duaG1dzk9yCPxCAlHcJev/b
	 ZtcWmqyWjWl9qLYEdSIGrhr2/EHt2JcbXOhCaBSeImpk8QLcG6Umhf+APXVDM3iY4N
	 XtzLvh2q2frtcqlp3rh4/dVImjhyv48XW2S2/JwLuc2Kgx/QfLfCPqBYl4jeyopvc3
	 uShyw1KKonMDf5AyEKoGy0QlNk2UeUIBgS9LCRhxfneT3fu5MD2MyGvxX+8zNp1giS
	 ByStZYeXvaVsA==
Date: Tue, 20 Apr 2021 17:38:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    ash.j.wilding@gmail.com, Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/arm: Ensure the vCPU context is seen before clearing
 the _VPF_down
In-Reply-To: <37631386-a53f-d99d-d71b-0b871b5dd9b0@xen.org>
Message-ID: <alpine.DEB.2.21.2104201726061.26180@sstabellini-ThinkPad-T480s>
References: <20210226205158.20991-1-julien@xen.org> <alpine.DEB.2.21.2102261756280.2682@sstabellini-ThinkPad-T480s> <ca41bfbb-d942-d8fd-e96e-c464f6b3643f@xen.org> <alpine.DEB.2.21.2103191652450.439@sstabellini-ThinkPad-T480s> <86165804-34a1-59e5-1b51-fecc60dbf796@xen.org>
 <alpine.DEB.2.21.2104131541370.4885@sstabellini-ThinkPad-T480s> <ebcaad65-a155-6979-9754-a8ef0ece3590@xen.org> <alpine.DEB.2.21.2104201234060.26180@sstabellini-ThinkPad-T480s> <37631386-a53f-d99d-d71b-0b871b5dd9b0@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Apr 2021, Julien Grall wrote:
> (+ Andrew and Jan)
> 
> Hi Stefano,
> 
> On 20/04/2021 20:38, Stefano Stabellini wrote:
> > On Fri, 16 Apr 2021, Julien Grall wrote:
> > > > I think your explanation is correct. However, don't we need a smp_rmb()
> > > > barrier after reading v->is_initialised in xen/common/domctl.c:do_domctl
> > > > ? That would be the barrier that pairs with smp_wmb in regards to
> > > > v->is_initialised.
> > > 
> > > There is already a smp_mb() in sync_vcpu_exec_state() which is called from
> > > vcpu_pause() -> vcpu_sleep_sync().
> > 
> > But that's too late, isn't? The v->is_initialized check is done before
> > the vcpu_pause() call. We might end up taking the wrong code path:
> > 
> > https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/domctl.c#L587
> > https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/domctl.c#L598
> 
> I am a bit confused what you mean by "wrong path" here. There is no timing
> guarantee with a memory barrier. What the barrier will guarantee you is
> v->is_initialized will be read *before* anything after the barrier.
> 
> Are you worried that some variables in vcpu_pause() may be read before
> v->is_initialized?
> 
> > 
> > > I don't think we can ever remove the memory barrier in
> > > sync_vcpu_exec_state()
> > > because the vCPU paused may have run (or initialized) on a different pCPU.
> > > So
> > > I would like to rely on the barrier rather than adding an extra one (even
> > > thought it is not a fast path).
> > > 
> > > I am thinking to add a comment on top of vcpu_pause() to clarify that
> > > after
> > > the call, the vCPU context will be observed without extra synchronization
> > > required.
> > 
> > Given that an if.. goto is involved, even if both code paths lead to
> > good results, I think it would be best to have the smp_rmb() barrier
> > above after the first v->is_initialised read to make sure we take the
> > right path.
> 
> I don't understand what you are referring by "wrong" and "right" path. The
> processor will always execute/commit the path based on the value of
> v->is_initialized. What may happen is the processor may start to speculate the
> wrong path and then backtrack if it discovers the value is not the expected
> one. But, AFAIK, smp_rmb() is not going to protect you against speculation...
> smp_rmb() is only going to enforce a memory ordering between read.
> 
> > Instead of having to make sure that even the "wrong" path
> > behaves correctly.
> Just for clarification, I think you meant writing the following code:
> 
> if ( !v->is_initialized )
>   goto getvcpucontext_out;
> 
> smp_rmb();

No, sorry, I'll try to be clearer, see below


> ...
> 
> vcpu_pause();
> 
> AFAICT, there is nothing in the implementation of XEN_DOMCTL_getvcpucontext
> that justify the extra barrier (assuming we consider vcpu_pause() as a full
> memory barrier).
> 
> From your e-mail, I also could not infer what is your exact concern regarding
> the memory ordering. If you have something in mind, then would you mind to
> provide a sketch showing what could go wrong?

Let me start with what I had in mind:

initialized = v->is_initialized;
smp_rmb();
if ( !initialized )
  goto getvcpucontext_out;


Without smp_rmb there are no guarantees that we see an up-to-date value
of v->is_initialized, right? This READ of v->is_initialized is supposed
to pair with the WRITE in arch_set_info_guest.

Relying on the the barrier in vcpu_pause is OK only if is_initialised
was already read as "1".

I think it might be OK in this case, because probably nothing wrong
happens if we read the old value of v->is_initialized as "0" but it
doesn't seem to be a good idea. Theoretically it could pass a very long
time before we see v->is_initialized as "1" without the smp_rmb.

Please let me know if I am missing something.

