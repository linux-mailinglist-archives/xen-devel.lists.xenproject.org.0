Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E544D5BA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 12:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224720.388186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml87i-0005gZ-Kw; Thu, 11 Nov 2021 11:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224720.388186; Thu, 11 Nov 2021 11:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml87i-0005dO-Gp; Thu, 11 Nov 2021 11:20:06 +0000
Received: by outflank-mailman (input) for mailman id 224720;
 Thu, 11 Nov 2021 11:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjuL=P6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1ml87g-0005K6-ED
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 11:20:04 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 500ceebe-42e1-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 12:20:02 +0100 (CET)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml873-002g98-8m; Thu, 11 Nov 2021 11:19:26 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 627DF3000D5;
 Thu, 11 Nov 2021 12:19:22 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 304F0201EC1CF; Thu, 11 Nov 2021 12:19:21 +0100 (CET)
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
X-Inumbo-ID: 500ceebe-42e1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rwfbmkoas7VebHdsAPeFky9gQjs68+546BvuzLh8KOw=; b=nYW2D8WwDzTJBO/3hqaCnKl+rG
	Juv9WqI4u6yj05w2X63ioSsTn5cEdV6jDA351V4/q9yydOsa7FW1hSEMYTFCpYM+34h+eLD05vIuf
	aJw4KwauVgbsmZhkliH2C6iKJqojPUXuWEPcd38B1dtT88o84f5Sp/oMWfV8h9DaHJOesh+0xGqtP
	n4R4aYuGwPrCobAnDwuTl24Bkv/pjQsvWW5g0gG3sYG1rBE7VdaHTNsjeZ1KJKR5jtxxyS54nzBQU
	j+XeoDvq2JxdCtTPVCSG+YQMQo1n/omY8trwJKb2fdS0v2mWaEEA6whxFBt8nI2ZCCfGYmM487YiO
	s2UIUTPg==;
Date: Thu, 11 Nov 2021 12:19:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
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
	Like Xu <like.xu@linux.intel.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v4 00/17] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YYz8OTWtkcFUkvbZ@hirez.programming.kicks-ass.net>
References: <20211111020738.2512932-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>

On Thu, Nov 11, 2021 at 02:07:21AM +0000, Sean Christopherson wrote:

> Like Xu (1):
>   perf/core: Rework guest callbacks to prepare for static_call support
> 
> Sean Christopherson (16):
>   perf: Protect perf_guest_cbs with RCU
>   KVM: x86: Register perf callbacks after calling vendor's
>     hardware_setup()
>   KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
>     guest
>   perf: Stop pretending that perf can handle multiple guest callbacks
>   perf: Drop dead and useless guest "support" from arm, csky, nds32 and
>     riscv
>   perf: Add wrappers for invoking guest callbacks
>   perf: Force architectures to opt-in to guest callbacks
>   perf/core: Use static_call to optimize perf_guest_info_callbacks
>   KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
>     variable
>   KVM: x86: More precisely identify NMI from guest when handling PMI
>   KVM: Move x86's perf guest info callbacks to generic KVM
>   KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
>   KVM: arm64: Convert to the generic perf callbacks
>   KVM: arm64: Hide kvm_arm_pmu_available behind CONFIG_HW_PERF_EVENTS=y
>   KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c
>   perf: Drop guest callback (un)register stubs

Thanks!, I'll queue them up and push them into tip/perf/core once -rc1
happens.

