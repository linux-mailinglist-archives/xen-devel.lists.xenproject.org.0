Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG+lAE+zhWmbFQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:24:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481EFBFE2
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223043.1530701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voI4O-0003wH-NV; Fri, 06 Feb 2026 09:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223043.1530701; Fri, 06 Feb 2026 09:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voI4O-0003tR-Kh; Fri, 06 Feb 2026 09:24:08 +0000
Received: by outflank-mailman (input) for mailman id 1223043;
 Fri, 06 Feb 2026 09:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6vR=AK=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1voI4M-0003sn-Nc
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:24:06 +0000
Received: from jpms-ob02.noc.sony.co.jp (jpms-ob02.noc.sony.co.jp
 [2001:cf8:ace:41::5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9247a15a-033d-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 10:24:03 +0100 (CET)
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::7])
 by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 18:24:00 +0900
Received: from unknown (HELO JPC00244420)
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 18:23:56 +0900
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
X-Inumbo-ID: 9247a15a-033d-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770369844; x=1801905844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPZfRdP+k5tHXCWNK6Ygu9GCntNiGeUU6L8G+KPNkCQ=;
  b=RUt2QEnftwM1KiJrBNHRT2TK2Ivwb11iwqsRxog1/IBIeDcwSCYdpwFd
   HgqFbV1YJF7oC9RMe8s0HOYmw/xAbDNftAGXAQLfGqxduUHQJPNSk4D1l
   ovuZJplJ7DhqBYXXJN1RUZh0LRxncQ9zABFbWHOzttU0Z98oqweIqX1Vk
   v8mxFUv8Om1CE2axUC0023wveuJDzihyjUD1YMAuUEbeHsy7XgxTASoUF
   w/cZBCLntjJtnmEy0TY5/gJza5JcBoCtNrYLPw67xy0EPd2DVhltMgqbg
   3MKesNGHaVjUs12HPnquyTFUOGQqPu9bfLcriDup5eYTdYoeF4U5WU+cH
   A==;
X-IronPort-AV: E=Sophos;i="6.21,276,1763391600"; 
   d="scan'208";a="578889420"
Date: Fri, 6 Feb 2026 18:23:53 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
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
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, jailhouse-dev@googlegroups.com,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH 3/3] x86/virt: rename x2apic_available to
 x2apic_without_ir_available
Message-ID: <aYWzKQQTyTZpMAme@JPC00244420>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
 <20260202-x2apic-fix-v1-3-71c8f488a88b@sony.com>
 <ab7f5935-fd5e-4ba5-a97d-5433f241a089@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab7f5935-fd5e-4ba5-a97d-5433f241a089@intel.com>
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sohil.mehta@intel.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 6481EFBFE2
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 04:10:37PM -0800, Sohil Mehta wrote:
> On 2/2/2026 1:51 AM, Shashank Balaji wrote:
> > No functional change.
> > 
> > x86_init.hyper.x2apic_available is used only in try_to_enable_x2apic to check if
> > x2apic needs to be disabled if interrupt remapping support isn't present. But
> > the name x2apic_available doesn't reflect that usage.
> > 
> 
> I don't understand the premise of this patch. Shouldn't the variable
> name reflect what is stored rather than how it is used?

Sorry about the confusion, I should have used '()'.
x86_init.hyper.x2apic_available() is called only in
try_to_enable_x2apic(). Here's the relevant snippet:

	static __init void try_to_enable_x2apic(int remap_mode)
	{
		if (x2apic_state == X2APIC_DISABLED)
			return;

		if (remap_mode != IRQ_REMAP_X2APIC_MODE) {
			u32 apic_limit = 255;

			/*
			 * Using X2APIC without IR is not architecturally supported
			 * on bare metal but may be supported in guests.
			 */
			if (!x86_init.hyper.x2apic_available()) {
				pr_info("x2apic: IRQ remapping doesn't support X2APIC mode\n");
				x2apic_disable();
				return;
			}

So the question being asked is, "can x2apic be used without IR?", but
the name "x2apic_available" signals "is x2apic available?". I found this
confusing while going through the source.

Most hypervisors set their x2apic_available() implementation to
essentially return if the CPU supports x2apic or not, which is valid
given the name "x2apic_available", but x2apic availability is not what's in
question at the callsite.

> > This is what x2apic_available is set to for various hypervisors:
> > 
> > 	acrn		boot_cpu_has(X86_FEATURE_X2APIC)
> > 	mshyperv	boot_cpu_has(X86_FEATURE_X2APIC)
> > 	xen		boot_cpu_has(X86_FEATURE_X2APIC) or false
> > 	vmware		vmware_legacy_x2apic_available
> > 	kvm		kvm_cpuid_base() != 0
> > 	jailhouse	x2apic_enabled()
> > 	bhyve		true
> > 	default		false
> > 
> 
> If both interrupt remapping and x2apic are enabled, what would the name
> x2apic_without_ir_available signify?

If IR is enabled, then the branch to call x2apic_available() wouldn't be taken :)
So the meaning of x2apic_without_ir_available wouldn't be relevant
anymore.

> A value of "true" would mean x2apic is available without IR. But that
> would be inaccurate for most hypervisors. A value of "false" could be
> interpreted as x2apic is not available, which is also inaccurate.
> 
> To me, x2apic_available makes more sense than
> x2apic_without_ir_available based on the values being set by the
> hypervisors.
 
I agree with you, and I think therein lies the problem. Most hypervisors
are answering the broader question "is x2apic available?", so the name
"x2apic_available" makes sense.

I think further work is required to check if various implementations of
x2apic_available() also need to be changed to reflect the "x2apic
without IR?" semantic, but I don't know enough to do that myself. Maybe
I should have added TODOs above the implementations.

I would like the feedback of the virt folks too on all this, maybe I'm
misinterpreting what's going on here.

> > Bare metal and vmware correctly check if x2apic is available without interrupt
> > remapping. The rest of them check if x2apic is enabled/supported, and kvm just
> > checks if the kernel is running on kvm. The other hypervisors may have to have
> > their checks audited.
> > 
> AFAIU, the value on bare metal is set to false because this is a
> hypervisor specific variable. Perhaps I have misunderstood something?

