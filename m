Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2573F952B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 09:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173442.316471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWNB-0002V2-U2; Fri, 27 Aug 2021 07:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173442.316471; Fri, 27 Aug 2021 07:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWNB-0002ST-Pr; Fri, 27 Aug 2021 07:33:57 +0000
Received: by outflank-mailman (input) for mailman id 173442;
 Fri, 27 Aug 2021 07:33:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vFra=NS=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mJWNA-0002SN-9A
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 07:33:56 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc3fb4e4-8018-4c13-a3e6-f9308e953354;
 Fri, 27 Aug 2021 07:33:53 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWJz-00EFo3-0q; Fri, 27 Aug 2021 07:30:56 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0C6F23005AD;
 Fri, 27 Aug 2021 09:30:37 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E07822C6670E9; Fri, 27 Aug 2021 09:30:36 +0200 (CEST)
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
X-Inumbo-ID: dc3fb4e4-8018-4c13-a3e6-f9308e953354
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pX/U+rVEPbfrs2KxIK3fTT5zek69Vi8l41Blp4tBLok=; b=Yc/w61MYBYU/2XovOdaG/1LI+3
	ofvXZY72T/bqQpEDQIopTT41ymuCj9LCYB3YpGsaZsw8I7lr88Q2nTCRx2MpWUAJi2+3qnashJI4R
	pq0hm4wrqjtQzjgnu14Y0Hv71MTmXVlwUtR00yaCrR+u7hNfiDC4NQgkVvvO74M9TS46PVdKtznHr
	cI35oR72a6g4a2mZG68PMOuldBKtE8eyE5BYPjhe0gvPrNhQPT9HfquqIFtVn1+9kmnU1uaROxDf6
	T9v8X9G4zCE0HsYiDhrr3Coe9vaArCNE5m8ZWnIbYQ2Ri33yjkJEKLCpR695YXtWTkmMXBqMBOcvc
	uj1qfSCA==;
Date: Fri, 27 Aug 2021 09:30:36 +0200
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
Subject: Re: [PATCH 07/15] KVM: Use dedicated flag to track if KVM is
 handling an NMI from guest
Message-ID: <YSiUnDbi/aZ3nunT@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-8-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827005718.585190-8-seanjc@google.com>

On Thu, Aug 26, 2021 at 05:57:10PM -0700, Sean Christopherson wrote:
> diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> index 5cedc0e8a5d5..4c5ba4128b38 100644
> --- a/arch/x86/kvm/x86.h
> +++ b/arch/x86/kvm/x86.h
> @@ -395,9 +395,10 @@ static inline void kvm_unregister_perf_callbacks(void)
>  
>  DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
>  
> -static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
> +static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
>  {
>  	__this_cpu_write(current_vcpu, vcpu);
> +	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
>  
>  	kvm_register_perf_callbacks();
>  }
> @@ -406,6 +407,7 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
>  {
>  	kvm_unregister_perf_callbacks();
>  
> +	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, false);
>  	__this_cpu_write(current_vcpu, NULL);
>  }

Does this rely on kvm_{,un}register_perf_callback() being a function
call and thus implying a sequence point to order the stores? 

