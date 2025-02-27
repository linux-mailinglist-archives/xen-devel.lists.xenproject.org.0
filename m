Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C14A47ECC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 14:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898094.1306663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tndlm-0007ji-8p; Thu, 27 Feb 2025 13:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898094.1306663; Thu, 27 Feb 2025 13:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tndlm-0007hm-65; Thu, 27 Feb 2025 13:17:42 +0000
Received: by outflank-mailman (input) for mailman id 898094;
 Thu, 27 Feb 2025 13:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yTe9=VS=linux.intel.com=kirill.shutemov@srs-se1.protection.inumbo.net>)
 id 1tndlk-0007he-3w
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 13:17:40 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3613e66e-f50d-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 14:17:38 +0100 (CET)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:17:34 -0800
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP; 27 Feb 2025 05:17:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id AD1B92D5; Thu, 27 Feb 2025 15:17:26 +0200 (EET)
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
X-Inumbo-ID: 3613e66e-f50d-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740662258; x=1772198258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=toSHPZ1YVa1gl//0kRiyLUjjHt9nXx8rDY0Mkemm0Mc=;
  b=jZb+PF1e/gzoCaiUg99IsRx2Iv++aBMjeS0IaY+UeEkjzRntjDLRARQX
   8fDW1lzNPjzq8tAvanC7kkLzddkV5Ga/gHFGphDkLUNxOL/2ri9M4qXbb
   S8RFGRvhoaUU2Y/jtnEQHsmFOjxOQs16N4eKS6g2o4J2i+SjwIr8czSuM
   l/13RxJlvIg9Xkz8dF2LfUML8f10SxumVZxCOo+WPJcbjuJi+48cxRzoB
   6F9isH/BLbrTrDtT6kF6v73zLmNqimaqnioWMzVAfW98b4sdZ5p0U5M1z
   XoqigFzFhwLP/nrFCeuOSaLO57pRahUCX4wz1gWrLI7mbGfwcuj5eJTgj
   g==;
X-CSE-ConnectionGUID: aGcd9D5FSw+u9tstNqXziQ==
X-CSE-MsgGUID: a8QJgYwFR5qgqgAiU4xRgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41433030"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41433030"
X-CSE-ConnectionGUID: sGPlddMNR0G8ZteOUDv6gg==
X-CSE-MsgGUID: QI2K/LkMQjKqVmN4JfZORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154208682"
Date: Thu, 27 Feb 2025 15:17:26 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Subject: Re: [PATCH v2 30/38] x86/paravirt: Don't use a PV sched_clock in
 CoCo guests with trusted TSC
Message-ID: <okuuhll3ymxlvno46dlimlpnkhg5vcxm2jiaew7uce4f35sps3@xaommgjd447m>
References: <20250227021855.3257188-1-seanjc@google.com>
 <20250227021855.3257188-31-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227021855.3257188-31-seanjc@google.com>

On Wed, Feb 26, 2025 at 06:18:46PM -0800, Sean Christopherson wrote:
> Silently ignore attempts to switch to a paravirt sched_clock when running
> as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
> hypervisor could attack the guest by manipulating the PV clock to affect
> guest scheduling in some weird and/or predictable way.  More importantly,
> reading TSC on such platforms is faster than any PV clock, and sched_clock
> is all about speed.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kernel/paravirt.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> index a3a1359cfc26..c538c608d9fb 100644
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -89,6 +89,15 @@ DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
>  int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
>  				      void (*save)(void), void (*restore)(void))
>  {
> +	/*
> +	 * Don't replace TSC with a PV clock when running as a CoCo guest and
> +	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
> +	 * which isn't in the guest's TCB.
> +	 */
> +	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
> +	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
> +		return -EPERM;
> +

Looks like a call for generic CC_ATTR_GUEST_SECURE_TSC that would be true
for TDX and SEV with CC_ATTR_GUEST_SNP_SECURE_TSC.

>  	if (!stable)
>  		clear_sched_clock_stable();
>  
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

