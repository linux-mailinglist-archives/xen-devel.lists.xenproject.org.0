Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE653F9B34
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173768.317038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJdIT-0005gd-7f; Fri, 27 Aug 2021 14:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173768.317038; Fri, 27 Aug 2021 14:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJdIT-0005e7-3x; Fri, 27 Aug 2021 14:57:33 +0000
Received: by outflank-mailman (input) for mailman id 173768;
 Fri, 27 Aug 2021 14:57:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vFra=NS=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mJdIP-0005e1-6u
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:57:30 +0000
Received: from desiato.infradead.org (unknown
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a325925c-a2c1-47d1-9543-25c8749c2a8a;
 Fri, 27 Aug 2021 14:57:25 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJdHk-00DX6q-CH; Fri, 27 Aug 2021 14:56:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 06096300DEF;
 Fri, 27 Aug 2021 16:56:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DA39829CFAC0B; Fri, 27 Aug 2021 16:56:45 +0200 (CEST)
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
X-Inumbo-ID: a325925c-a2c1-47d1-9543-25c8749c2a8a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NSdJTnTrDORwb+LwDd1YsYwMgPCJRxx0pXYK8FlAauE=; b=Fa7lAXZuZMGlhMkvCLlAaInQ0M
	LvZMAI9dgp92KcFz4u2w541+/Nu67i2Ea3rAZpKD6Q1P9ILjKx8E7vJPC9Yy4BHzufUafcmzb+2zu
	XEqetUQrDWVmWgUJbeWVLi3VrFACkcynBo/GAIrkEDlonwYXZkgrnKNPnvuRXhzSenXsmorxKXv3b
	UaLmP8193HgPXArb5Wp1c/mrxTLlf/21JEFOup9O58miZONiwbcuapmO9GWG87OVfsWhj7CHiSkGX
	N5n6bqMpN0VhS93yWvq33V/48j5w+oHy6eCsh396wVtLrGJfjfA+JtKu/NF0o3UbeTizVS7b6v5Pe
	Ifw0PqQQ==;
Date: Fri, 27 Aug 2021 16:56:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH 05/15] perf: Track guest callbacks on a per-CPU basis
Message-ID: <YSj9LQfbKxOhxqcP@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-6-seanjc@google.com>
 <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
 <YSj7jq32U8Euf38o@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSj7jq32U8Euf38o@google.com>

On Fri, Aug 27, 2021 at 02:49:50PM +0000, Sean Christopherson wrote:
> On Fri, Aug 27, 2021, Peter Zijlstra wrote:
> > On Thu, Aug 26, 2021 at 05:57:08PM -0700, Sean Christopherson wrote:
> > > Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
> > > the callbacks more precisely and avoid a lurking NULL pointer dereference.
> > 
> > I'm completely failing to see how per-cpu helps anything here...
> 
> It doesn't help until KVM is converted to set the per-cpu pointer in flows that
> are protected against preemption, and more specifically when KVM only writes to
> the pointer from the owning CPU.  

So the 'problem' I have with this is that sane (!KVM using) people, will
still have to suffer that load, whereas with the static_call() we patch
in an 'xor %rax,%rax' and only have immediate code flow.

> Ignoring static call for the moment, I don't see how the unreg side can be safe
> using a bare single global pointer.  There is no way for KVM to prevent an NMI
> from running in parallel on a different CPU.  If there's a more elegant solution,
> especially something that can be backported, e.g. an rcu-protected pointer, I'm
> all for it.  I went down the per-cpu path because it allowed for cleanups in KVM,
> but similar cleanups can be done without per-cpu perf callbacks.

If all the perf_guest_cbs dereferences are with preemption disabled
(IRQs disabled, IRQ context, NMI context included), then the sequence:

	WRITE_ONCE(perf_guest_cbs, NULL);
	synchronize_rcu();

Ensures that all prior observers of perf_guest_csb will have completed
and future observes must observe the NULL value.


