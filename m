Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46961A215C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 14:09:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM9Vy-0007wh-1C; Wed, 08 Apr 2020 12:09:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LAz7=5Y=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1jM9Vw-0007wc-CA
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 12:09:04 +0000
X-Inumbo-ID: bc4908f0-7991-11ea-b4f4-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4908f0-7991-11ea-b4f4-bc764e2007e4;
 Wed, 08 Apr 2020 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gWpqrb8j/D9PpMGOmBmpJQdVRqYpPCNDUmBBgbEqzPI=; b=rFulLNFAwNEVG4GU0BsmdMg7eK
 t6FVtq8m9hscYZajwJqdZl0pQo8RG/h2U6x8LaG/OUIrwk18XgbKlhR5sH+WiMaUkyF8v6NidJRDN
 JPUpGvXOtQtWrOPXkfxNK/ijhbmmDn37wiBgzbBX+biffyRpwoKqgCXhpgwcszQ1b40icDbkUKgZt
 gmu/qHBTOYhZOPscGlEGNvR5GUfLUaiMhLCbDtMwrbC9Bb1I2G2fveRJORZQjMkBBZM7+9d9qkgqi
 IS9N9w3AZn8HsaiEPr7sydKOZJubXh8l9d/eX+QmafvEV9XBQiJWIA4aXabhy+f5caPQ9auA9NHSu
 /vNODE1g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9Vr-0006nF-9T; Wed, 08 Apr 2020 12:08:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 151B030604B;
 Wed,  8 Apr 2020 14:08:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 08E112BA90A73; Wed,  8 Apr 2020 14:08:56 +0200 (CEST)
Date: Wed, 8 Apr 2020 14:08:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 00/26] Runtime paravirt patching
Message-ID: <20200408120856.GY20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, hpa@zytor.com, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 10:02:57PM -0700, Ankur Arora wrote:
> A KVM host (or another hypervisor) might advertise paravirtualized
> features and optimization hints (ex KVM_HINTS_REALTIME) which might
> become stale over the lifetime of the guest. For instance, the
> host might go from being undersubscribed to being oversubscribed
> (or the other way round) and it would make sense for the guest
> switch pv-ops based on that.

So what, the paravirt spinlock stuff works just fine when you're not
oversubscribed.

> We keep an interesting subset of pv-ops (pv_lock_ops only for now,
> but PV-TLB ops are also good candidates)

The PV-TLB ops also work just fine when not oversubscribed. IIRC
kvm_flush_tlb_others() is pretty much the same in that case.

> in .parainstructions.runtime,
> while discarding the .parainstructions as usual at init. This is then
> used for switching back and forth between native and paravirt mode.
> ([1] lists some representative numbers of the increased memory
> footprint.)
> 
> Mechanism: the patching itself is done using stop_machine(). That is
> not ideal -- text_poke_stop_machine() was replaced with INT3+emulation
> via text_poke_bp(), but I'm using this to address two issues:
>  1) emulation in text_poke() can only easily handle a small set
>  of instructions and this is problematic for inlined pv-ops (and see
>  a possible alternatives use-case below.)
>  2) paravirt patching might have inter-dependendent ops (ex.
>  lock.queued_lock_slowpath, lock.queued_lock_unlock are paired and
>  need to be updated atomically.)

And then you hope that the spinlock state transfers.. That is that both
implementations agree what an unlocked spinlock looks like.

Suppose the native one was a ticket spinlock, where unlocked means 'head
== tail' while the paravirt one is a test-and-set spinlock, where
unlocked means 'val == 0'.

That just happens to not be the case now, but it was for a fair while.

> The alternative use-case is a runtime version of apply_alternatives()
> (not posted with this patch-set) that can be used for some safe subset
> of X86_FEATUREs. This could be useful in conjunction with the ongoing
> late microcode loading work that Mihai Carabas and others have been
> working on.

The whole late-microcode loading stuff is crazy already; you're making
it take double bonghits.

> Also, there are points of similarity with the ongoing static_call work
> which does rewriting of indirect calls.

Only in so far as that code patching is involved. An analogy would be
comparing having a beer with shooting dope. They're both 'drugs'.

> The difference here is that
> we need to switch a group of calls atomically and given that
> some of them can be inlined, need to handle a wider variety of opcodes.
> 
> To patch safely we need to satisfy these constraints:
> 
>  - No references to insn sequences under replacement on any kernel stack
>    once replacement is in progress. Without this constraint we might end
>    up returning to an address that is in the middle of an instruction.

Both ftrace and optprobes have that issue, neither of them are quite as
crazy as this.

>  - handle inter-dependent ops: as above, lock.queued_lock_unlock(),
>    lock.queued_lock_slowpath() and the rest of the pv_lock_ops are
>    a good example.

While I'm sure this is a fun problem, why are we solving it?

>  - handle a broader set of insns than CALL and JMP: some pv-ops end up
>    getting inlined. Alternatives can contain arbitrary instructions.

So can optprobes.

>  - locking operations can be called from interrupt handlers which means
>    we cannot trivially use IPIs for flushing.

Heck, some NMI handlers use locks..

> Handling these, necessitates that target pv-ops not be preemptible.

I don't think that is a correct inferrence.

> Once that is a given (for safety these need to be explicitly whitelisted
> in runtime_patch()), use a state-machine with the primary CPU doing the
> patching and secondary CPUs in a sync_core() loop. 
> 
> In case we hit an INT3/BP (in NMI or thread-context) we makes forward
> progress by continuing the patching instead of emulating.
> 
> One remaining issue is inter-dependent pv-ops which are also executed in
> the NMI handler -- patching can potentially deadlock in case of multiple
> NMIs. Handle these by pushing some of this work in the NMI handler where
> we know it will be uninterrupted.

I'm just seeing a lot of bonghits without sane rationale. Why is any of
this important?

