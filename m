Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A5AA6D01
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 10:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974540.1362380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAm8V-0007qO-3U; Fri, 02 May 2025 08:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974540.1362380; Fri, 02 May 2025 08:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAm8U-0007nf-VR; Fri, 02 May 2025 08:52:46 +0000
Received: by outflank-mailman (input) for mailman id 974540;
 Fri, 02 May 2025 08:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k+8a=XS=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uAm8T-0007nZ-0d
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 08:52:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7af8759-2732-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 10:52:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D97EF5C1C03;
 Fri,  2 May 2025 08:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD4BC4CEE4;
 Fri,  2 May 2025 08:52:28 +0000 (UTC)
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
X-Inumbo-ID: c7af8759-2732-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746175956;
	bh=SxBjkp/J5NNckAueMrQukPtaJ3IgnM76Ll+NdIUNXIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJ1UtPGazPk6ZEG0HwcxHRuFOiH/JR3XBtmKJLiHP/jshRcy9Arm4mvyGtimOvgTy
	 OmBKdXEFyjZ8BZMwd8D5Yrhyf1bz+OVbfKouNV2DcQM8RRSV+d8/qkqc9y00t15W+1
	 79vLoiUJcrIIg1H9/yghIFiGnP5DFIedHMd4MJHdsNaPcS8RGk10pBZFuSDnIKldZI
	 i66CAPb8L+3qEo576w8fnUHJl5uZTEiJZdpOmBXZziTwORlH5NpUwvvKUbp9Waeu+E
	 Y/YctucrsKzRC6TBuMOLWKYkj+excCXHWTN55BMKpApl0iGcZF2wL5SK+lxFB1I13T
	 UP3Jz5dY9bM3g==
Date: Fri, 2 May 2025 10:52:26 +0200
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
Message-ID: <aBSHyo-pu7K_CfpI@gmail.com>
References: <20250427092027.1598740-1-xin@zytor.com>
 <20250427092027.1598740-3-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427092027.1598740-3-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> For some reason, there are some TSC-related functions in the MSR
> header even though there is a tsc.h header.
> 
> Relocate rdtsc{,_ordered}() from <asm/msr.h> to <asm/tsc.h>, and
> subsequently remove the inclusion of <asm/msr.h> in <asm/tsc.h>.
> 
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> --- a/arch/x86/include/asm/tsc.h
> +++ b/arch/x86/include/asm/tsc.h
> @@ -7,7 +7,81 @@
>  
>  #include <asm/cpufeature.h>
>  #include <asm/processor.h>
> -#include <asm/msr.h>

Note that in the tip:x86/msr commit I've applied today I've 
intentionally delayed the removal of this header dependency, to reduce 
the probability of breaking -next today or in the near future.

We can remove that now superfluous header dependency in a future patch.

Thanks,

	Ingo

