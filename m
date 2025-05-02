Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA5AA6C2E
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 10:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974487.1362340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlM5-00071s-U0; Fri, 02 May 2025 08:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974487.1362340; Fri, 02 May 2025 08:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlM5-00070Q-QZ; Fri, 02 May 2025 08:02:45 +0000
Received: by outflank-mailman (input) for mailman id 974487;
 Fri, 02 May 2025 08:02:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k+8a=XS=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uAlM4-00070K-TR
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 08:02:45 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd1ada1-272b-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 10:02:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EE973A4B9D8;
 Fri,  2 May 2025 07:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE92BC4CEE4;
 Fri,  2 May 2025 08:02:28 +0000 (UTC)
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
X-Inumbo-ID: cfd1ada1-272b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746172956;
	bh=VrP6FYMiM8APrbbiFFr3vwipUq0BMzeGXIdgg8yPKw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o40ruDpdxuzYi5SlPXBVO3KE83CyehxDNrNO/541PgVjFTDFgkp9ttfsSywwoC2Xi
	 deyF+fk2wjQxxc5XQRBVm8Bmt2O6KE/EWUyWPBtkP4DjmRVUsgvwR4qUU7TcNGYno2
	 LrsDSCZuBZAWl/LYiTehIFOfFP/Ile60POceUApHmDdzreBk3ZrpTs99IMSeErgzEI
	 qcVRENdvjn60dt64quynSDl7VztBTPTl/yjYLXHI6ByaM4mPy/wh1yniu8zkGauz6l
	 KWZFS4mxzAp7qh9gzlauN/px1lSmL30l6NU2jcy73WKeezA7wFlGHek2h34pt4xuBA
	 QpbqWIpAjreaA==
Date: Fri, 2 May 2025 10:02:26 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
	peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
	seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
	kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com,
	dapeng1.mi@linux.intel.com, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v4 02/15] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
Message-ID: <aBR8EoYkxaFHwZN2@gmail.com>
References: <20250427092027.1598740-1-xin@zytor.com>
 <20250427092027.1598740-3-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427092027.1598740-3-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> index 94408a784c8e..13335a130edf 100644
> --- a/arch/x86/include/asm/tsc.h
> +++ b/arch/x86/include/asm/tsc.h
> @@ -7,7 +7,81 @@
>  
>  #include <asm/cpufeature.h>
>  #include <asm/processor.h>
> -#include <asm/msr.h>
> +
> +/*
> + * both i386 and x86_64 returns 64-bit value in edx:eax, but gcc's "A"
> + * constraint has different meanings. For i386, "A" means exactly
> + * edx:eax, while for x86_64 it doesn't mean rdx:rax or edx:eax. Instead,
> + * it means rax *or* rdx.
> + */
> +#ifdef CONFIG_X86_64
> +/* Using 64-bit values saves one instruction clearing the high half of low */
> +#define DECLARE_ARGS(val, low, high)	unsigned long low, high
> +#define EAX_EDX_VAL(val, low, high)	((low) | (high) << 32)
> +#define EAX_EDX_RET(val, low, high)	"=a" (low), "=d" (high)
> +#else
> +#define DECLARE_ARGS(val, low, high)	u64 val
> +#define EAX_EDX_VAL(val, low, high)	(val)
> +#define EAX_EDX_RET(val, low, high)	"=A" (val)
> +#endif

Meh, this patch creates a duplicate copy of DECLARE_ARGS() et al in 
<asm/tsc.h> now:

 arch/x86/include/asm/msr.h:#define DECLARE_ARGS(val, low, high) unsigned long low, high
 arch/x86/include/asm/msr.h:#define DECLARE_ARGS(val, low, high) u64 val
 arch/x86/include/asm/msr.h:     DECLARE_ARGS(val, low, high);
 arch/x86/include/asm/msr.h:     DECLARE_ARGS(val, low, high);
 arch/x86/include/asm/msr.h:     DECLARE_ARGS(val, low, high);
 arch/x86/include/asm/tsc.h:#define DECLARE_ARGS(val, low, high) unsigned long low, high
 arch/x86/include/asm/tsc.h:#define DECLARE_ARGS(val, low, high) u64 val
 arch/x86/include/asm/tsc.h:     DECLARE_ARGS(val, low, high);
 arch/x86/include/asm/tsc.h:     DECLARE_ARGS(val, low, high);
 arch/x86/include/asm/tsc.h:#undef DECLARE_ARGS

Which was both an undeclared change, bloats the code, causes various 
problems, and is totally unnecessary to boot.

Please don't do that ...

Thanks,

	Ingo

