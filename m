Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4EAA6C6E
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 10:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974513.1362360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlbe-00016m-Bc; Fri, 02 May 2025 08:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974513.1362360; Fri, 02 May 2025 08:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlbe-00015K-94; Fri, 02 May 2025 08:18:50 +0000
Received: by outflank-mailman (input) for mailman id 974513;
 Fri, 02 May 2025 08:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k+8a=XS=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uAlbc-00015E-Av
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 08:18:48 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0edadf5f-272e-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 10:18:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC8B3434E4;
 Fri,  2 May 2025 08:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FCDC4CEE9;
 Fri,  2 May 2025 08:18:32 +0000 (UTC)
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
X-Inumbo-ID: 0edadf5f-272e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173921;
	bh=cceIUw9EX6CJ615GNdppXNrElVMTPwJztPtsbm/5hy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/TX4Mf5qkn+d5eWIgqv7vIk75zfM6yrIPmHLSfaOvilB1TMJCOwX6UxaLi3/4ntF
	 CTdvcW24sQjGFvj/AXsOJGncvakw6Z4p8ZclsEDe2hknFU+ckPt2/qHvdPIyk59xbo
	 rV1pq8QWA/qTkpUObp899r1foJ9LRWGoqI6CTS1V0Cu+JCa9JAJtB9a+QLyuX858V2
	 70a22IBVEVB0MRp2wD32EPcEnvbH3GYXu7Ra0oeU+V0Ro/eudlwhxrpwk5f5KAdfqv
	 vheM2b3e+KJz5ez4AHrUsoRTaS6WvSOsjRrAmUB93Bp+mNMmxeQYuTcRVRzY5U5RIz
	 AD+AuPXxVZ3PA==
Date: Fri, 2 May 2025 10:18:30 +0200
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
Message-ID: <aBR_1oQN-gKCREBD@gmail.com>
References: <20250427092027.1598740-1-xin@zytor.com>
 <20250427092027.1598740-3-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427092027.1598740-3-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> For some reason, there are some TSC-related functions in the MSR
  ^^^^^^^^^^^^^^^
> header even though there is a tsc.h header.

The real reason is that the rdtsc{,_ordered}() methods use the 
EAX_EDX_*() macros to optimize their EDX/EAX assembly accessors, which 
is why these methods were in <asm/msr.h>.

Your followup patch tacitly acknowledges this by silently creating 
duplicate copies of these facilities in both headers ...

I've cleaned it all up in tip:x86/msr via these preparatory patches:

  x86/msr: Improve the comments of the DECLARE_ARGS()/EAX_EDX_VAL()/EAX_EDX_RET() facility
  x86/msr: Rename DECLARE_ARGS() to EAX_EDX_DECLARE_ARGS
  x86/msr: Move the EAX_EDX_*() methods from <asm/msr.h> to <asm/asm.h>

Thanks,

	Ingo

