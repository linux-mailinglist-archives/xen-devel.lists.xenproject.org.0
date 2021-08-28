Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE63FA76E
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 21:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174468.318080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mK4LA-0001eg-KE; Sat, 28 Aug 2021 19:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174468.318080; Sat, 28 Aug 2021 19:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mK4LA-0001c3-HJ; Sat, 28 Aug 2021 19:50:08 +0000
Received: by outflank-mailman (input) for mailman id 174468;
 Sat, 28 Aug 2021 19:50:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XnWB=NT=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mK4L8-0001XO-Ba
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 19:50:06 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42ad13f0-ecd5-4b65-bf7c-59e08b9f044a;
 Sat, 28 Aug 2021 19:50:03 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK4J0-00Fo0r-RS; Sat, 28 Aug 2021 19:48:02 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1F90798679D; Sat, 28 Aug 2021 21:47:52 +0200 (CEST)
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
X-Inumbo-ID: 42ad13f0-ecd5-4b65-bf7c-59e08b9f044a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EvpUBX0kQkaSDPnQxMYWZGVN6zhrAsMhEqKxCVzwc4o=; b=pllg0gE0w02xyjMldZ9HnPVzqu
	ta11OtXd1Bso4ilrEuT55ps2xPl2CjYBACyXlwdXXUeIjxslwwfUq6OAyrihSvrjzRr3JtkoSpE8r
	nxY3yx+Fd/3UG041LWAE2YseMLAeONAzBfACBCXTK1UhZW2z6qWvQfm+cZtswlyfd2HomsjEMhaGO
	AlA/8iv9N9xdUC/3HvjDZZKrjX+uYcxwdDOcFci5wDFWFUa+LVkIxA0cauQXcKJeC0qgJePnlirYy
	P7fXACdPsEL7EzZFzKGU7caOwmwQc2FcxEl7F6m9RiEDfUUOmMpAmYquJxamu8c1pYg7LLIf/dgFH
	3zfeLNxg==;
Date: Sat, 28 Aug 2021 21:47:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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
Subject: Re: [PATCH v2 05/13] perf: Force architectures to opt-in to guest
 callbacks
Message-ID: <20210828194752.GC4353@worktop.programming.kicks-ass.net>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828003558.713983-6-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828003558.713983-6-seanjc@google.com>

On Fri, Aug 27, 2021 at 05:35:50PM -0700, Sean Christopherson wrote:
> diff --git a/init/Kconfig b/init/Kconfig
> index 55f9f7738ebb..9ef51ae53977 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1776,6 +1776,9 @@ config HAVE_PERF_EVENTS
>  	help
>  	  See tools/perf/design.txt for details.
>  
> +config HAVE_GUEST_PERF_EVENTS
> +	bool
	depends on HAVE_KVM

?

> +
>  config PERF_USE_VMALLOC
>  	bool
>  	help

