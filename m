Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFLpOEqthWkRFAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 09:58:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC8FBBAF
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 09:58:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222971.1530632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHev-0005La-Bs; Fri, 06 Feb 2026 08:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222971.1530632; Fri, 06 Feb 2026 08:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHev-0005In-8e; Fri, 06 Feb 2026 08:57:49 +0000
Received: by outflank-mailman (input) for mailman id 1222971;
 Fri, 06 Feb 2026 08:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6vR=AK=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1voHeu-0005Ih-L4
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 08:57:48 +0000
Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp
 [2001:cf8:ace:41::4]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b88d49-0339-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 09:57:44 +0100 (CET)
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::7])
 by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 17:57:37 +0900
Received: from unknown (HELO JPC00244420)
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 17:57:36 +0900
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
X-Inumbo-ID: e3b88d49-0339-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770368264; x=1801904264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pC/nHVWjvFbxMPwxtThf4k2nFuf59ielNHdSV23cY9U=;
  b=A2Lo627pG2vqp+4SHLFm5bAOIWjFteYDn42/glFbGGE7Q5B4bi15fK/2
   rSFv2KpZYzyW+yYGrmhLXbW7T712+8ExOAKUYStMwx7zLe0w0ljM7gPsy
   WFEX0B+pYjs0XiLCNpep2XDvsMx5UJG3NXgJXVfiEumlfldR92vsbjovc
   +DZP0rFMq8CWaYoufarfJygRM0apL7unwcbOL1CnpJv9oFuOQxvLQEuY+
   wy9u1oV/w1MNbEhcrNNngosiS0LTXx7iMvaVHKnqzj8+JSFdneHucpIp3
   romHPmPS0ECqp59CiD8cPYfRwU4cuaIytOFVnZ6PAJ5kaSYMDzIBRCnLf
   A==;
X-IronPort-AV: E=Sophos;i="6.21,276,1763391600"; 
   d="scan'208";a="578880254"
Date: Fri, 6 Feb 2026 17:57:31 +0900
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
Message-ID: <aYWs-wvDuS53BHMe@JPC00244420>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
 <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
 <0149c37d-7065-4c72-ab56-4cea1a6c15d0@intel.com>
 <aYMOqXTYMJ_IlEFA@JPC00244420>
 <722b53a7-7560-4a1b-ab26-73eeed3dffa5@intel.com>
 <aYQzhRN83rJx6DSb@JPC00244420>
 <e5ac3272-795b-488c-b767-290fd50f2105@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5ac3272-795b-488c-b767-290fd50f2105@intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sony.com:dkim,uefi.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 87BC8FBBAF
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 03:18:58PM -0800, Sohil Mehta wrote:
> On 2/4/2026 10:07 PM, Shashank Balaji wrote:
> > On Wed, Feb 04, 2026 at 10:53:28AM -0800, Sohil Mehta wrote:
> 
> >> It's a bit odd then that the firmware chooses to enable x2apic without
> >> the OS requesting it.
> > 
> > Well, the firmware has a setting saying "Enable x2apic", which was
> > enabled. So it did what the setting says
> > 
> 
> The expectation would be that firmware would restore to the same state
> before lapic_suspend().

I'm a bit out of my depth here, but I went looking around, and this is from the
latest ACPI spec (v6.6) [1]:

	When executing from the power-on reset vector as a result of waking
	from an S2 or S3 sleep state, the platform firmware performs only the
	hardware initialization required to restore the system to either the
	state the platform was in prior to the initial operating system boot,
	or to the pre-sleep configuration state. In multiprocessor systems,
	non-boot processors should be placed in the same state as prior to the
	initial operating system boot.

	(further ahead)

	 If this is an S2 or S3 wake, then the platform runtime firmware
	 restores minimum context of the system before jumping to the waking
	 vector. This includes:

	 	CPU configuration. Platform runtime firmware restores the
		pre-sleep configuration or initial boot configuration of each
		CPU (MSR, MTRR, firmware update, SMBase, and so on). Interrupts
		must be disabled (for IA-32 processors, disabled by CLI
		instruction).

		(and other things)

I suppose, in my case, the firmware is restoring initial boot
configuration on S3 resume. And initial boot configuration of x2apic is
set from the firmware's UI "Enable x2apic".

> Maybe a warning would be useful to encourage firmware to fix this going
> forward. I don't have a strong preference on the wording, but how about?
> 
> pr_warn_once("x2apic unexpectedly re-enabled by the firmware during
> resume.\n");

At least as per the spec, it's not something the firmware needs to fix,
and it's not unexpected re-enablement.

Am I missing something?

But it _is_ surprising that this bug went unnoticed for so long :)

[1] https://uefi.org/specs/ACPI/6.6/16_Waking_and_Sleeping.html#initialization

