Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1ECA9CD7B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968329.1357970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8LFF-0004AE-8E; Fri, 25 Apr 2025 15:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968329.1357970; Fri, 25 Apr 2025 15:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8LFF-00048g-4G; Fri, 25 Apr 2025 15:45:41 +0000
Received: by outflank-mailman (input) for mailman id 968329;
 Fri, 25 Apr 2025 15:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1XR=XL=linux.intel.com=ilpo.jarvinen@srs-se1.protection.inumbo.net>)
 id 1u8LFD-00048Z-Do
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:45:39 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53fc4cc2-21ec-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 17:45:37 +0200 (CEST)
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 08:45:35 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 08:45:22 -0700
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
X-Inumbo-ID: 53fc4cc2-21ec-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745595937; x=1777131937;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NDEMzXyKMQaX/1P4v8LWPCUwLdyUYFm0Z5j9i1NuUNc=;
  b=jqB6ckNe+u+NoojI4ep+JrEurZEaq67IL+ypmXJvVvI4ltx2oQ1mfTWg
   9/HbBKA3yJ/nIfw9b1P8GQAQnkAdLAm6PnjJLIKeCIPqC+1DX1Bem7ykJ
   dVj2geitsf/+iLo2WjpBWT78xvNtvYGAHuGwa5JWAwWsSwgzOO50/SXu5
   qYFdEfaWZM+nu367oLgoUQJVYGBRTii701DFzxZw62FkXo6dO1GKrBKzl
   1A+YpD+pv5NtGUqIu7X/7aBxXoQ9hDqa4RaEMsCQHovv+2PNRhoaqtvvq
   TZrtUL8VlI1Kw+N7kX52dpmKN2teELzOreoEfV5SZgZf7mSCmJaPBHjl4
   g==;
X-CSE-ConnectionGUID: r8qAf6dJSSuurr3t6tbocQ==
X-CSE-MsgGUID: FyBwG7PtTrilPYuNPjc0EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="50928850"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="50928850"
X-CSE-ConnectionGUID: zVyTiGS+Tp27oRIuRu3o/Q==
X-CSE-MsgGUID: FTR+bshYRAKz5gvHmp9NIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133870388"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 25 Apr 2025 18:45:18 +0300 (EEST)
To: "Xin Li (Intel)" <xin@zytor.com>
cc: LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
    virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
    linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
    linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    Netdev <netdev@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com, 
    peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com, 
    alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
    adrian.hunter@intel.com, kan.liang@linux.intel.com, wei.liu@kernel.org, 
    ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
    tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com, 
    seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com, 
    kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com, 
    dapeng1.mi@linux.intel.com
Subject: Re: [PATCH v3 01/14] x86/msr: Move rdtsc{,_ordered}() to
 <asm/tsc.h>
In-Reply-To: <20250425083442.2390017-2-xin@zytor.com>
Message-ID: <42dc90e1-df2a-2324-d28c-d75fb525e4a2@linux.intel.com>
References: <20250425083442.2390017-1-xin@zytor.com> <20250425083442.2390017-2-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Apr 2025, Xin Li (Intel) wrote:

> For some reason, there are some TSC-related functions in the MSR
> header even though there is a tsc.h header.
> 
> Relocate rdtsc{,_ordered}() from <asm/msr.h> to <asm/tsc.h>, and
> subsequently remove the inclusion of <asm/msr.h> in <asm/tsc.h>.
> Consequently, <asm/msr.h> must be included in several source files
> that previously did not require it.
>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> 
> Change in v3:
> * Add a problem statement to the changelog (Dave Hansen).
> ---

>  drivers/platform/x86/intel/pmc/cnp.c          |  1 +
>  .../intel/speed_select_if/isst_if_common.c    |  1 +
>  drivers/platform/x86/intel/turbo_max_3.c      |  1 +

Hi,

To me this looks really a random set of source files, maybe it helped some 
build success but it's hard for me to review this because there are still 
cases that depend on indirect include chains.

Could you just look into solving all missing msr.h includes instead 
as clearly some are still missing after 3 pre-existing ones and you adding 
it into 3 files:

$ git grep -e rdmsr -e wrmsr -l drivers/platform/x86/
drivers/platform/x86/intel/ifs/core.c
drivers/platform/x86/intel/ifs/load.c
drivers/platform/x86/intel/ifs/runtest.c
drivers/platform/x86/intel/pmc/cnp.c
drivers/platform/x86/intel/pmc/core.c
drivers/platform/x86/intel/speed_select_if/isst_if_common.c
drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.c
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
drivers/platform/x86/intel/tpmi_power_domains.c
drivers/platform/x86/intel/turbo_max_3.c
drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
drivers/platform/x86/intel_ips.c

$ git grep -e 'msr.h' -l drivers/platform/x86/
drivers/platform/x86/intel/pmc/core.c
drivers/platform/x86/intel/tpmi_power_domains.c
drivers/platform/x86/intel_ips.c

I'd also prefer the patch(es) adding missing includes be in a different 
patch.

-- 
 i.


