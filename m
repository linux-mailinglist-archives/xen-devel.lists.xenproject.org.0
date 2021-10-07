Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419AD425E79
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 23:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204025.359225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaiz-0007PL-F4; Thu, 07 Oct 2021 21:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204025.359225; Thu, 07 Oct 2021 21:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaiz-0007Mh-Az; Thu, 07 Oct 2021 21:14:45 +0000
Received: by outflank-mailman (input) for mailman id 204025;
 Thu, 07 Oct 2021 21:14:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYaix-0007Mb-31
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 21:14:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8a2b3a3-81de-4217-a7f8-8f01ef913191;
 Thu, 07 Oct 2021 21:14:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 638E261058;
 Thu,  7 Oct 2021 21:14:40 +0000 (UTC)
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
X-Inumbo-ID: c8a2b3a3-81de-4217-a7f8-8f01ef913191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633641280;
	bh=yT20tuwE1nPRXehqM/Dw9IBvRDDRBsfeVOweJ9/NGVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oP+LhXteWG7q8ZKzJAdPPzdGSuJEhM5t8xTqMct8cFwKuq3h4kgj026CF2Pix87zs
	 nUY6zLyZ05dlGyDXesvHXF8O6U15N188di77gCWauHoNMheJzQv1jtIW/iwbPODiP/
	 TuPa/fMtadDbXx+PUOfu3CQ1RVMc2hrS7EXUgdS6HPagZE0m1qcD+PPM5zZKK8i+zE
	 Asz4Uv3GPX7XBtoQtH3+WoYutZBn+aUwxcSzSvvJPQ+3qLeuX6qrPd1jXRDpsIX6iE
	 CXnjSD9deQctQDW34USVADBvbl/srE7ojgqHzZ+5Q3JzLoxpJhTDffSmSio6TlZce+
	 febfa026HBeaw==
Date: Thu, 7 Oct 2021 14:14:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr <olekstysh@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PING] Re: [PATCH] xen/arm: optee: Allocate anonymous domheap
 pages
In-Reply-To: <87r1cwra4t.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.2110071357160.414@sstabellini-ThinkPad-T480s>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s> <87bl4jrovq.fsf@epam.com> <81f7699b-69c1-da52-a1a7-5000343bf872@gmail.com> <alpine.DEB.2.21.2110061639050.3209@sstabellini-ThinkPad-T480s>
 <87r1cwra4t.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Oct 2021, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
> > On Wed, 6 Oct 2021, Oleksandr wrote:
> >> Hello all
> >> 
> >> Gentle reminder.
> >  
> > Many thanks for the ping, this patch fell off my radar.
> >
> >
> >  
> >> On 23.09.21 23:57, Volodymyr Babchuk wrote:
> >> > Hi Stefano,
> >> > 
> >> > Stefano Stabellini <sstabellini@kernel.org> writes:
> >> > 
> >> > > On Mon, 6 Sep 2021, Oleksandr Tyshchenko wrote:
> >> > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >> > > > 
> >> > > > Allocate anonymous domheap pages as there is no strict need to
> >> > > > account them to a particular domain.
> >> > > > 
> >> > > > Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
> >> > > > domU and dom0 can allocate" the dom0 cannot allocate memory outside
> >> > > > of the pre-allocated region. This means if we try to allocate
> >> > > > non-anonymous page to be accounted to dom0 we will get an
> >> > > > over-allocation issue when assigning that page to the domain.
> >> > > > The anonymous page, in turn, is not assigned to any domain.
> >> > > > 
> >> > > > CC: Julien Grall <jgrall@amazon.com>
> >> > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >> > > > Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >> > > Only one question, which is more architectural: given that these pages
> >> > > are "unlimited", could the guest exploit the interface somehow to force
> >> > > Xen to allocate an very high number of anonymous pages?
> >> > > 
> >> > > E.g. could a domain call OPTEE_SMC_RPC_FUNC_ALLOC in a loop to force Xen
> >> > > to exaust all memory pages?
> >> > Generally, OP-TEE mediator tracks all resources allocated and imposes
> >> > limits on them.
> >> > 
> >> > OPTEE_SMC_RPC_FUNC_ALLOC case is a bit different, because it is issued
> >> > not by domain, but by OP-TEE itself. As OP-TEE is more trusted piece of
> >> > system we allow it to request as many buffers as it wants. Also, we know
> >> > that OP-TEE asks only for one such buffer per every standard call. And
> >> > number of simultaneous calls is limited by number of OP-TEE threads,
> >> > which is quite low: typically only two.
> >
> > So let me repeat it differently to see if I understood correctly:
> >
> > - OPTEE_SMC_RPC_FUNC_ALLOC is only called by OP-TEE, not by the domain
> > - OPTEE is trusted and only call it twice anyway
> 
> Correct.
> 
> > I am OK with this argument, but do we have a check to make sure a domU
> > cannot issue OPTEE_SMC_RPC_FUNC_ALLOC?
> 
> domU can't issue any RPC, because all RPCs are issued from OP-TEE
> side. This is the nature of RPC - OP-TEE requests Normal World for some
> service. But of course, Normal World can perform certain actions that
> will make OP-TEE to issue a RPC. I discuss this in depth below.
> 
> >
> > Looking at the patch, there are other two places, in addition to
> > OPTEE_SMC_RPC_FUNC_ALLOC, where the anonymous memory pages can be
> > allocated:
> >
> > 1) copy_std_request
> > 2) translate_noncontig
> >
> > We need to prove that neither 1) or 2) can result in a domU exausting
> > Xen memory.
> >
> > In the case of 1), it looks like the memory is freed before returning to
> > the DomU, right? If so, it should be no problem?
> 
> Yes, mediator makes shadow copy of every request buffer to hide
> translated addresses from the guest. Number of requests is limited by
> number of OP-TEE threads.
> 
> > In the case of 2), it looks like the memory could outlive the call where
> > it is allocated. Is there any kind of protection against issuing
> > something like OPTEE_MSG_ATTR_TYPE_TMEM_INOUT in a loop? Is it OP-TEE
> > itself that would refuse the attempt? Thus, the idea is that
> > do_call_with_arg will return error and we'll just free the memory there?
> 
> Well, translate_noncontig() calls allocate_optee_shm_buf() which counts
> all allocated buffers. So you can't call it more than
> MAX_SHM_BUFFER_COUNT times, without de-allocating previous memory. But,
> thanks to your question, I have found a bug there: memory is not freed
> if allocate_optee_shm_buf() fails. I'll prepare patch later today.
> 
> > I cannot see a check for errors returned by do_call_with_arg and memory
> > freeing done because of that. Sorry I am not super familiar with the
> > code, I am just trying to make sure we are not offering to DomUs an easy
> > way to crash the system.
> 
> I tried to eliminate all possibilities for a guest to crash the
> system. Of course, this does not mean that there are none of them.
> 
> And yes, code is a bit hard to understand, because calls to OP-TEE are
> stateful and you need to account for that state. From NW and SW this
> looks quite fine, because state is handled naturally. But mediator sits
> in a middle, so it's implementation is a bit messy.
> 
> I'll try to explain what is going on, so you it will be easier to
> understand logic in the mediator.
> 
> There are two types of OP-TEE calls: fast calls and standard calls. Fast
> call is simple: call SMC and get result. It does not allocate thread
> context in OP-TEE and is non-preemptive. So yes, it should be fast. It
> is used for simple things like "get OP-TEE version" or "exchange
> capabilities". It is easy to handle them in mediator: just forward
> the call, check result, return it back to a guest.
> 
> Standard calls are stateful. OP-TEE allocates thread for each call. This
> call can be preempted either by IRQ or by RPC. For consistency IRQ
> return is also considered as special type of RPC. So, in general one
> standard call can consist of series of SMCs:
> 
> --> SMC with request
> <-- RPC return (like IRQ)
> --> SMC "resume call"
> <-- RPC return (like "read disk")
> --> SMC "resume call"
> <-- RPC return (like "send network packet")
> --> SMC "resume call"
> ...
> <-- Final return
> 
> There are many types of RPCs: "handle IRQ", additional shared buffer
> allocation/de-allocation, RPMB access, disks access, network access,
> synchronization primitives (when OP-TEE thread is gets blocked on a
> mutex), etc.
> 
> Two more things that makes all this worse: Normal World can register
> shared buffer with OP-TEE. Such buffer can live indefinitely
> long. Also, Normal World decides when to resume call. For example,
> calling process can be preempted and then resumed seconds
> later. Misbehaving guest can decide to not resume call at all.
> 
> As I said, I tried to take all this things into account. There are
> basically 3 types of objects that can lead to memory allocation on Xen
> side:
> 
> 1. Standard call context. Besides memory space for struct optee_std_call
> itself it allocates page for a shadow buffer, where argument addresses
> are translated by Xen. Number of this objects is limited by number of
> OP-TEE threads:
> 
>     count = atomic_add_unless(&ctx->call_count, 1, max_optee_threads);
>     if ( count == max_optee_threads )
>         return ERR_PTR(-ENOSPC);
> 
> 2. Shared buffer. This is a buffer shared by guest with OP-TEE. It can
> be either temporary buffer which is shared for one standard call
> duration, or registered shared buffer, which is remains active until it
> is de-registered. This is where translate_noncontig() comes into play.
> Number of this buffers is limited in allocate_optee_shm_buf():
> 
>     count = atomic_add_unless(&ctx->optee_shm_buf_count, 1,
>                               MAX_SHM_BUFFER_COUNT);
>     if ( count == MAX_SHM_BUFFER_COUNT )
>         return ERR_PTR(-ENOMEM);
> 
> 3. Shared RPC buffer. This is very special kind of buffer. Basically,
> OP-TEE needs some shared memory to provide RPC call parameters. So it
> requests buffer from Normal World. There is no hard limit on this from
> mediator side, because, as I told earlier, OP-TEE itself limits number
> of this buffers. There is no cases when more that one buffer will be
> allocated per OP-TEE thread. This type of buffer is used only to process
> RPC requests themselves. OP-TEE can request more buffers via RPC, but
> they will fall to p.2: NW uses separate request to register buffer and
> then returns its handle in the preempted call.
> 
> 
> Apart from those two limits, there is a limit on total number of pages
> which is shared between guest and OP-TEE: MAX_TOTAL_SMH_BUF_PG. This
> limit is for a case when guest tries to allocate few really BIG buffers.
> 
> 
> > It looks like they could be called from one of the OPTEE operations that
> > a domU could request? Is there a limit for them?
> 
> Yes, there are limits, as I described above.
> 
> Also, bear in mind that resources available to OP-TEE are also quite
> limited. So, in case of some breach in mediator, OP-TEE will give up
> first. This of course is not an excuse to have bugs in the mediator...

OK, thanks for the explanation. The reasons for my questions is that if
the allocations are using the memory of DomU, then at worst DomU can run
out of memory. But if the allocations are using anonymous memory, then
the whole platform might run out of memory. We have issued XSAs for
things like that in the past.

This is why I am worried about this patch: if we apply it we really
become reliant on these limits being implemented correctly. A bug can
have much more severe consequences.

As you are the maintainer for this code, and this code is not security
supported, I'll leave it up to you (also see the other email about
moving optee to "supported, not security supported").

However, maybe a different solution would be to increase max_pages for a
domain when optee is enabled? Maybe just by a few pages (as many as
needed by the optee mediator)? Because if we did that, we wouldn't risk
exposing DOS attack vectors for every bug in the mediator limits checks.

The below adds a 10 pages slack.


diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 3964a8a5cd..a3105f1a9a 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -38,8 +38,11 @@ bool tee_handle_call(struct cpu_user_regs *regs)
     return cur_mediator->ops->handle_call(regs);
 }
 
+#define TEE_SLACK (10)
 int tee_domain_init(struct domain *d, uint16_t tee_type)
 {
+    int ret;
+
     if ( tee_type == XEN_DOMCTL_CONFIG_TEE_NONE )
         return 0;
 
@@ -49,7 +52,15 @@ int tee_domain_init(struct domain *d, uint16_t tee_type)
     if ( cur_mediator->tee_type != tee_type )
         return -EINVAL;
 
-    return cur_mediator->ops->domain_init(d);
+    ret = cur_mediator->ops->domain_init(d);
+    if ( ret < 0 )
+        return ret;
+
+    /* 
+     * Increase maxmem for domains with TEE, the extra pages are used by
+     * the mediator
+     */
+    d->max_pages += TEE_SLACK;
 }
 
 int tee_relinquish_resources(struct domain *d)

