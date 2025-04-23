Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0659A98C8F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 16:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964782.1355489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7arE-0007wQ-Tw; Wed, 23 Apr 2025 14:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964782.1355489; Wed, 23 Apr 2025 14:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7arE-0007tI-RA; Wed, 23 Apr 2025 14:13:48 +0000
Received: by outflank-mailman (input) for mailman id 964782;
 Wed, 23 Apr 2025 14:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=maGd=XJ=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1u7arD-0007tC-C9
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 14:13:47 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29bcdabe-204d-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 16:13:44 +0200 (CEST)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:13:41 -0700
Received: from tfalcon-desk.amr.corp.intel.com (HELO [10.124.221.81])
 ([10.124.221.81])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:13:39 -0700
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
X-Inumbo-ID: 29bcdabe-204d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745417624; x=1776953624;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gCdfzP6Rz3QRAiqWb8ICzKaC8k4ViRNpmXNZ7t4kQyU=;
  b=XfSeS8ZxVwQmJczfiJXzk/AynwHyIXtNAK+aOdOOHYoNxvHy/xf/ltCi
   tnmm07d9eM+SQHrewpTNRNXlJliZAGW/x7AGvOQ6jbqEcVdlZbHnjazqH
   yJA9SMTCphRWLFKxuXOJr+74i0TlpryjV0+fZZOGlF0HDkNQWkDbl6hJ/
   CXz4yXxCsF05n3Y9PMyn/Uwo+qFmcpuGpS3J7cD8mjegvJptancN6Teqc
   krPgAa4ridTcVmHhayEihgS677R8nz2n7YrSRomQDWAsb3veATWByf3+c
   Syl8h3l2ibbWzseZI5k5W0GP/xh+rTHGMWokp9nA+rc2bpDuHQSi0ZF2j
   g==;
X-CSE-ConnectionGUID: HymkmlCOQNeQ5lNmDTjXpQ==
X-CSE-MsgGUID: q+5C3HgETUOdRaewTXDTSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50674127"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50674127"
X-CSE-ConnectionGUID: hN2luxYRRR22QwDVEy73vw==
X-CSE-MsgGUID: TPuRvEnIRWOtX5fYO79fZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137495477"
Message-ID: <4caedcaf-793a-4371-a8db-50723dcdbad4@intel.com>
Date: Wed, 23 Apr 2025 07:13:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/34] x86/msr: Move rdtsc{,_ordered}() to
 <asm/tsc.h>
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, wei.liu@kernel.org,
 ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
 seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
 kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-2-xin@zytor.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250422082216.1954310-2-xin@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 01:21, Xin Li (Intel) wrote:
> Relocate rdtsc{,_ordered}() from <asm/msr.h> to <asm/tsc.h>, and
> subsequently remove the inclusion of <asm/msr.h> in <asm/tsc.h>.
> Consequently, <asm/msr.h> must be included in several source files
> that previously did not require it.

I know it's mildly obvious but could you please add a problem statement
to these changelogs, even if it's just one little sentence?

	For some reason, there are some TSC-related functions in the
	MSR header even though there is a tsc.h header.

	Relocate rdtsc{,_ordered}() and	subsequently remove the
	inclusion of <asm/msr.h> in <asm/tsc.h>. Consequently,
	<asm/msr.h> must be included in several source files that
	previously did not require it.

But I agree with the concept, so with this fixed:

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

