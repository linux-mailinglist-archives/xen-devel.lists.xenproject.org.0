Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445263F9845
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 12:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173583.316691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZSD-0002ZI-8B; Fri, 27 Aug 2021 10:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173583.316691; Fri, 27 Aug 2021 10:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZSD-0002Vq-4q; Fri, 27 Aug 2021 10:51:21 +0000
Received: by outflank-mailman (input) for mailman id 173583;
 Fri, 27 Aug 2021 10:51:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vFra=NS=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mJZSA-0002Vk-96
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 10:51:19 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b03c9a73-27e4-464d-a57f-36357d8c1762;
 Fri, 27 Aug 2021 10:51:14 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJZOS-00ESWc-Uh; Fri, 27 Aug 2021 10:47:37 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 69DD6300024;
 Fri, 27 Aug 2021 12:47:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4ECD229A12A47; Fri, 27 Aug 2021 12:47:25 +0200 (CEST)
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
X-Inumbo-ID: b03c9a73-27e4-464d-a57f-36357d8c1762
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OvP4Yc4jC04J0qjspa8OOFxuL+jnhRGg3XpJSSUjD4o=; b=dSa6gg/k/uLkIao8HV8YKHe55R
	QJNUW1DSGmJFIQkoPB+Yq9DSt+RE29HdMkm2cJByn2hw71NQjxJsEPWO+21wDTQDfhVhvu8BkQjf+
	L2krqmyZ3aAWLWTmA2aYMCQduTwu64ujYtSfjBEUhfAlVzmTqYLy4o2Ws9e1IwuEUwmRG03uA93za
	1BcwsEtY0TALxF7lF4k1iZju+DOeaUy6K5KSj20dObZE8KmsuxkJigtb+xm3AzeIgXlZyxOHnS/+B
	4KvrvAwWmfWEjBAXOKEuxfukFtVoVnSRlyFVxwDa8h8JGPBd0g9VYSiib1uZ+XvyETPfQlMGdpOrv
	2P9m3iwg==;
Date: Fri, 27 Aug 2021 12:47:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Like Xu <like.xu.linux@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>,
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
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 00/15] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YSjCvbWE6sZ29dPr@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <fd3dcd6c-b3d5-4453-93fb-b46d0595534e@gmail.com>
 <YSiX9OPcrDsr3P4C@hirez.programming.kicks-ass.net>
 <3bd4955a-1219-20b0-058b-d23f1e30aa77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bd4955a-1219-20b0-058b-d23f1e30aa77@gmail.com>

On Fri, Aug 27, 2021 at 04:01:45PM +0800, Like Xu wrote:
> On 27/8/2021 3:44 pm, Peter Zijlstra wrote:

> > You just have to make sure all static_call() invocations that started
> > before unreg are finished before continuing with the unload.
> > synchronize_rcu() can help with that.
> 
> Do you mean something like that:
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 64e310ff4f3a..e7d310af7509 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8465,6 +8465,7 @@ void kvm_arch_exit(void)
>  #endif
>  	kvm_lapic_exit();
>  	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
> +	synchronize_rcu();
> 
>  	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
>  		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index e466fc8176e1..63ae56c5d133 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6508,6 +6508,7 @@ EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
>  int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  {
>  	perf_guest_cbs = NULL;
> +	arch_perf_update_guest_cbs();

I'm thinking the synchronize_rcu() should go here, and access to
perf_guest_cbs should be wrapped to yell when called with preemption
enabled.

But yes..

>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
> 
> > 
> > This is module unload 101. Nothing specific to static_call().
> > 

