Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F2C4115F9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 15:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190919.340757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSJXI-0007S9-Uc; Mon, 20 Sep 2021 13:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190919.340757; Mon, 20 Sep 2021 13:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSJXI-0007PP-R3; Mon, 20 Sep 2021 13:40:44 +0000
Received: by outflank-mailman (input) for mailman id 190919;
 Mon, 20 Sep 2021 13:40:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TWfd=OK=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1mSJXH-0007NC-PY
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 13:40:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b5da75c-d1f3-4d90-be8e-8414f264d9b2;
 Mon, 20 Sep 2021 13:40:43 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32B9260F21;
 Mon, 20 Sep 2021 13:40:42 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mSJXE-00Bm01-5z; Mon, 20 Sep 2021 14:40:40 +0100
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
X-Inumbo-ID: 9b5da75c-d1f3-4d90-be8e-8414f264d9b2
Date: Mon, 20 Sep 2021 14:40:39 +0100
Message-ID: <87o88nuzzc.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley
 <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross
 <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
In-Reply-To: <7a5825d1-d6e9-8ac8-5df2-cce693525da7@redhat.com>
References: <20210828003558.713983-1-seanjc@google.com>
	<20210828201336.GD4353@worktop.programming.kicks-ass.net>
	<YUO5J/jTMa2KGbsq@google.com>
	<YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>
	<662e93f9-e858-689d-d203-742731ecad2c@redhat.com>
	<87tuifv3mb.wl-maz@kernel.org>
	<7a5825d1-d6e9-8ac8-5df2-cce693525da7@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, peterz@infradead.org, seanjc@google.com, mingo@redhat.com, acme@kernel.org, will@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, guoren@kernel.org, nickhu@andestech.com, green.hu@gmail.com, deanbo422@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@linutronix.de, bp@alien8.de, x86@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, james.morse@arm.com, alexandru.elisei@arm.com, suzuki.poulose@arm.com, hpa@zytor.com, vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, sstabellini@kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, artem.kashkanov@intel.com, like.xu.linux@gmail.com, lingsha
 n.zhu@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Mon, 20 Sep 2021 14:18:30 +0100,
Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> On 20/09/21 14:22, Marc Zyngier wrote:
> >> I think that's only ARM, and even then it is only because of
> >> limitations of the hardware which mostly apply only if VHE is not in
> >> use.
> >> 
> >> If anything, it's ARM that should support module build in VHE mode
> >> (Linux would still need to know whether it will be running at EL1 or
> >> EL2, but KVM's functionality is as self-contained as on x86 in the VHE
> >> case).
> > I don't see this happening anytime soon. At least not before we
> > declare the arm64 single kernel image policy to be obsolete.
> 
> --verbose please. :)  I am sure you're right, but I don't understand
> the link between the two.

To start making KVM/arm64 modular, you'd have to build it such as
there is no support for the nVHE hypervisor anymore. Which would mean
two different configs (one that can only work with VHE, and one for
the rest) and contradicts the current single kernel image policy.

It is bad enough that we have to support 3 sets of page sizes.
Doubling the validation space for the sake of being able to unload KVM
seems a dubious prospect.

	M.

-- 
Without deviation from the norm, progress is not possible.

