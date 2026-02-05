Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MgX1E9szhGnH0wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 07:08:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED9EEEBE
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 07:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221490.1529701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnsWO-0005XA-Qz; Thu, 05 Feb 2026 06:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221490.1529701; Thu, 05 Feb 2026 06:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnsWO-0005UV-KG; Thu, 05 Feb 2026 06:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1221490;
 Thu, 05 Feb 2026 06:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2jf7=AJ=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1vnsWN-0005UN-K7
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 06:07:19 +0000
Received: from jpms-ob02.noc.sony.co.jp (jpms-ob02.noc.sony.co.jp
 [2001:cf8:ace:41::5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5aa1841-0258-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 07:07:11 +0100 (CET)
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::6])
 by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:07:04 +0900
Received: from unknown (HELO JPC00244420)
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob1.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:07:03 +0900
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
X-Inumbo-ID: e5aa1841-0258-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770271632; x=1801807632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UBawYbMlXUOKgrz6LV1oJhX/gsrHRCKMioT7xEbWP+c=;
  b=VFWUOk52jOWcGi8pj9k9yr/ikYHOdIKZqb2K1uWGipADY1SE3PQwOTAd
   L1fLtNarakqJrl3BQYWs+6W4oyyUdZ+0FIs0dyOj6CQ+MfqzHxh2KAdIH
   KGWt31+gP6+/qFc0RaScONa/Iscq8V+bJRGQChyS1VjkFs/6uNL0Klj4V
   F3dZo4x3hIQEWk2FM2k9w1/kJjQDxg9fIL1jKGEn8vhCi5zUeIAZOAEps
   yaLH9WYQl9P3XdFxUeL/srUNydMF/rc/fmyYMC55dStmlEPivS0aHwUhs
   mv9q4sb+M1E35Nwfj+vY5pbcasXXbcmYpXwcqGxmNsm8oUL3mj/HMM43P
   A==;
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="608419792"
Date: Thu, 5 Feb 2026 15:07:01 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suresh Siddha <suresh.b.siddha@intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel
 expects so
Message-ID: <aYQzhRN83rJx6DSb@JPC00244420>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
 <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
 <0149c37d-7065-4c72-ab56-4cea1a6c15d0@intel.com>
 <aYMOqXTYMJ_IlEFA@JPC00244420>
 <722b53a7-7560-4a1b-ab26-73eeed3dffa5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <722b53a7-7560-4a1b-ab26-73eeed3dffa5@intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sony.com:s=s1jp];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sohil.mehta@intel.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:suresh.b.siddha@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:mingo@elte.hu,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sony.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sony.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E3ED9EEEBE
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 10:53:28AM -0800, Sohil Mehta wrote:
> On 2/4/2026 1:17 AM, Shashank Balaji wrote:
> 
> > __x2apic_disable disables x2apic only if boot_cpu_has(X86_FEATURE_APIC)
> > and x2apic is already enabled. 
> 
> I meant the X86_FEATURE_X2APIC and not X86_FEATURE_APIC.

My bad, I got that wrong. __x2apic_disable checks for X86_FEATURE_APIC,
while x2apic_enabled checks for X86_FEATURE_X2APIC.

> But, thinking about it more, checking that the CPU is really in X2APIC mode
> by reading the MSR is good enough.

But yes, I agree.

> > x2apic_enabled also does the same checks,
> > the only difference being, it uses rdmsrq_safe instead of just rdmsrq,
> > which is what __x2apic_disable uses. The safe version is because of
> > Boris' suggestion [1]. If that's applicable here as well, then rdmsrq in
> > __x2apic_disable should be changed to rdmsrq_safe.
> 
> I don't know if there is a strong justification for changing to
> rdmsrq_safe() over here. Also, that would be beyond the scope of this
> patch. In general, it's better to avoid such changes unless an actual
> issue pops up.

Makes sense.

> >> I considered if an error message should be printed along with this. But,
> >> I am not sure if it can really be called a firmware issue. It's probably
> >> just that newer CPUs might have started defaulting to x2apic on.
> >>
> >> Can you specify what platform you are encountering this?
> > 
> > 
> > I'm not sure it's the CPU defaulting to x2apic on. As per Section
> > 12.12.5.1 of the Intel SDM:
> > 
> > 	On coming out of reset, the local APIC unit is enabled and is in
> > 	the xAPIC mode: IA32_APIC_BASE[EN]=1 and IA32_APIC_BASE[EXTD]=0.
> > 
> > So, the CPU should be turning on in xapic mode. In fact, when x2apic is
> > disabled in the firmware, this problem doesn't happen.
> > 
> 
> It's a bit odd then that the firmware chooses to enable x2apic without
> the OS requesting it.

Well, the firmware has a setting saying "Enable x2apic", which was
enabled. So it did what the setting says

> Linux maintains a concept of X2APIC_ON_LOCKED in x2apic_state which is
> based on the hardware preference to keep the apic in X2APIC mode.
> 
> When you have x2apic enabled in firmware, but the system is in XAPIC
> mode, can you read the values in MSR_IA32_ARCH_CAPABILITIES and
> MSR_IA32_XAPIC_DISABLE_STATUS?
> 
> XAPIC shouldn't be disabled because you are running in that mode. But,
> it would be good to confirm.

With x2apic enabled by the firmware, and after kernel switches to xapic
(because no interrupt remapping support), bit 21 (XAPIC_DISABLE_STATUS)
of MSR_IA32_ARCH_CAPABILITIES is 0, and MSR_IA32_XAPIC_DISABLE_STATUS
MSR is not available.
 
> > Either way, a pr_warn maybe helpful. How about "x2apic re-enabled by the
> > firmware during resume. Disabling\n"?
> 
> I mainly want to make sure the firmware is really at fault before we add
> such a print. But it seems likely now that the firmware messed up.

