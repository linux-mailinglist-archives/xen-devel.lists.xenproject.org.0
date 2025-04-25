Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E5A9C978
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968007.1357715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IY5-0004qv-0B; Fri, 25 Apr 2025 12:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968007.1357715; Fri, 25 Apr 2025 12:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IY4-0004om-TZ; Fri, 25 Apr 2025 12:52:56 +0000
Received: by outflank-mailman (input) for mailman id 968007;
 Fri, 25 Apr 2025 12:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y1QO=XL=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1u8IY4-0004oe-2P
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:52:56 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34ae0a91-21d4-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 14:52:55 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u8IXt-0000000C2bD-2jfU; Fri, 25 Apr 2025 12:52:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3849A300073; Fri, 25 Apr 2025 14:52:45 +0200 (CEST)
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
X-Inumbo-ID: 34ae0a91-21d4-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IDYQFrDJHA7L8jf52g4kfnTitAFJx9ur9V0d2b50BLo=; b=WC7YSMHkPF6hShCY786xiHVHDr
	zbWZEoDWt7bacv4YBSZjyeuzd86Hs+DM9z1RnOCJQ5xBDY8fzsuMOP9nz+hxSYkX8GWF+7Hcfd5GY
	y9XAgi28oYrUDuf79WmTYUQ4rYSrUCc+ti4P994Grej6mWoEbXrvRT1Znq7C8PiN0wGwEE2TCP7Ta
	IuyucF2BGfKx+iZgRxhCuCkO9O6vufW91a9tlgB/cQWrA5X6Fgbd7WhC72owqwZ4ziVmITn1Ygvpo
	g1O3mI6ZWJdPLtdB/AOnAYdH/GQcnroDkK5y+ZyfJ79ZewuBEVt4rRKLKSFqPHLgMvZsVeAKOv3c+
	Wjij67/A==;
Date: Fri, 25 Apr 2025 14:52:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
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
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
	seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
	kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com,
	dapeng1.mi@linux.intel.com
Subject: Re: [PATCH v3 00/14] MSR code cleanup part one
Message-ID: <20250425125245.GC22125@noisy.programming.kicks-ass.net>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>

On Fri, Apr 25, 2025 at 01:34:23AM -0700, Xin Li (Intel) wrote:
> This patch set is the first part of the patch set:
> 
>   MSR refactor with new MSR instructions support
> 
> @ https://lore.kernel.org/lkml/20250422082216.1954310-1-xin@zytor.com/T/#m5a34be7d4ed55f0baca965cb65452a08e9ad7c8a
> 
> 
> It's getting *WAY* too big, and whether to zap the pv_ops MSR APIs is
> still under argument.  Dave Hansen suggested to focus on rename stuff
> first, most of which he acked.
> 
> Jürgen Groß also gave his RBs to most of the Xen MSR cleanup patches.
> 
> So here comes the first MSR cleanup patch set with version 3.
> 
> 
> This patch series is based on:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/msr
> 
> 
> Xin Li (Intel) (14):
>   x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
>   x86/msr: Remove rdpmc()
>   x86/msr: Rename rdpmcl() to rdpmc()
>   x86/msr: Convert the rdpmc() macro into an always inline function
>   x86/msr: Return u64 consistently in Xen PMC read functions
>   x86/msr: Convert __wrmsr() uses to native_wrmsr{,q}() uses
>   x86/msr: Add the native_rdmsrq() helper
>   x86/msr: Convert __rdmsr() uses to native_rdmsrq() uses
>   x86/xen/msr: Remove calling native_{read,write}_msr{,_safe}() in
>     pmu_msr_{read,write}()
>   x86/xen/msr: Remove pmu_msr_{read,write}()
>   x86/xen/msr: Remove the error pointer argument from set_seg()
>   x86/pvops/msr: refactor pv_cpu_ops.write_msr{,_safe}()
>   x86/msr: Replace wrmsr(msr, low, 0) with wrmsrq(msr, low)
>   x86/msr: Change the function type of native_read_msr_safe()

These look ok.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

