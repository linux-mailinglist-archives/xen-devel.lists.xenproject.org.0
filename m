Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DA83F950E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 09:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173435.316460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWEU-0000lx-UK; Fri, 27 Aug 2021 07:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173435.316460; Fri, 27 Aug 2021 07:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWEU-0000jn-Q2; Fri, 27 Aug 2021 07:24:58 +0000
Received: by outflank-mailman (input) for mailman id 173435;
 Fri, 27 Aug 2021 07:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vFra=NS=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mJWES-0000jh-Le
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 07:24:56 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 214d3879-e323-421f-b055-be730575d8a2;
 Fri, 27 Aug 2021 07:24:54 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWBM-00EFSX-VT; Fri, 27 Aug 2021 07:22:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A41C630035D;
 Fri, 27 Aug 2021 09:21:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 80EAF2C6670E9; Fri, 27 Aug 2021 09:21:43 +0200 (CEST)
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
X-Inumbo-ID: 214d3879-e323-421f-b055-be730575d8a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=neG8mg28UHUzHJK70IF++gxfO1zx12p3aLda6nUX0F8=; b=AukJ9GkzIV3P3F+0ekocwQawBL
	tFlCkXpct0NjVzxDAYN3qp6dW8DFOR5++b6oO+2oFghCLwWlQldR9xUKOxe6O9xGeZ3SF85D2ScKC
	RFt1tMii/X4MA5Hvk4XKVnCAHMtwMT7KO94Zi39lswz81eHv7+EWswbpXCxLYyjwAhehjD4Pj9zhD
	/QGUZAd7iD4iU9YTu64FgKEGL0luhMV0hc4vrnvpZFSqjXRBBxUSDax4g0UrRpI2dleksB66sSbSW
	I8F5HQkpMUSSv+Lz7wFRfoB+E5euI/bbEB/SVUaXfnNNAHO9evgCgJrPXZXun2y+vLo5dnB1ozeVf
	G62jQfjw==;
Date: Fri, 27 Aug 2021 09:21:43 +0200
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
Subject: Re: [PATCH 06/15] KVM: x86: Register perf callbacks only when
 actively handling interrupt
Message-ID: <YSiShwJeBvAVPVKe@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-7-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827005718.585190-7-seanjc@google.com>

On Thu, Aug 26, 2021 at 05:57:09PM -0700, Sean Christopherson wrote:
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 9bc1375d6ed9..2f28d9d8dc94 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6485,6 +6485,18 @@ static void perf_pending_event(struct irq_work *entry)
>  #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
>  DEFINE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
>  
> +void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> +{
> +	__this_cpu_write(perf_guest_cbs, cbs);
> +}
> +EXPORT_SYMBOL_GPL(__perf_register_guest_info_callbacks);
> +
> +void __perf_unregister_guest_info_callbacks(void)
> +{
> +	__this_cpu_write(perf_guest_cbs, NULL);
> +}
> +EXPORT_SYMBOL_GPL(__perf_unregister_guest_info_callbacks);

This is 100% broken, and a prime example of why I hate modules.

It provides an interface for all modules, and completely fails to
validate even the most basic usage.

By using __this_cpu*() it omits the preemption checks, so you can call
this with preemption enabled, no problem.

By not checking the previous state, multiple modules can call this
interleaved without issue.

Basically assume any EXPORTed function is hostile, binary modules and
out-of-tree modules *are* just that. It's a cesspit out there.

