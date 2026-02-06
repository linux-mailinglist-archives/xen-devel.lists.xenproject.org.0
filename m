Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJv9EQtkhWl3BAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 04:46:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE513F9D54
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 04:46:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222747.1530477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voCmR-000452-3k; Fri, 06 Feb 2026 03:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222747.1530477; Fri, 06 Feb 2026 03:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voCmQ-00041y-Tj; Fri, 06 Feb 2026 03:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1222747;
 Fri, 06 Feb 2026 03:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6vR=AK=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1voCmP-00041D-G5
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 03:45:13 +0000
Received: from jpms-ob02.noc.sony.co.jp (jpms-ob02.noc.sony.co.jp
 [2001:cf8:ace:41::5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37f34637-030e-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 04:45:06 +0100 (CET)
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::7])
 by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 12:45:01 +0900
Received: from unknown (HELO JPC00244420)
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 12:45:01 +0900
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
X-Inumbo-ID: 37f34637-030e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770349507; x=1801885507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IuPnlqREwJB3pbqSqs+4wA7Rlfs308sbPiaPxE9gRow=;
  b=PGiM8c0k1NStI9Uo/jLqSLmCzGFdV4IgZ6HLyJNYcFFpfEPzBE5LTJdq
   8b1+7QjtZUlx9cz0DmSlZBr3pCuiFatM6JGK4qaZ59O/dnhacwh0hGB9+
   ooN06xSFhLpPgS9XRxn1oaC6hDeI/MwVXANGXKb1NTloxOCDY0F9RG39u
   Qo+SoP0bI7XaFJBXRkBP7D+S+HTArZskk3ueQ1Pu1/eVgxijx5RAwTSOU
   DUEjrOFCcwGwe20xS+Nxjzxam1W0QLVYhYFyQRQfAUNoXiUfQl3EYVSlR
   NvKRGmSvK9fHjthOiL7z0nuleTFeB/zntlBeaH+vDFwVWuknDS81YzzsG
   A==;
X-IronPort-AV: E=Sophos;i="6.21,275,1763391600"; 
   d="scan'208";a="578775205"
Date: Fri, 6 Feb 2026 12:44:57 +0900
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
Message-ID: <aYVjuSkdOlBh06_S@JPC00244420>
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
X-Rspamd-Queue-Id: DE513F9D54
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 03:18:58PM -0800, Sohil Mehta wrote:
> Maybe a warning would be useful to encourage firmware to fix this going
> forward. I don't have a strong preference on the wording, but how about?
> 
> pr_warn_once("x2apic unexpectedly re-enabled by the firmware during
> resume.\n");

That works

> A few nits:
> 
> For the code comments, you can use more of the line width. Generally, 72
> (perhaps even 80) chars is okay for comments dependent on the code in
> the vicinity.
> 
> The tip tree has slightly unique preferences, such as capitalizing the
> first word of the patch title.
> 
> Please refer:
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

Thanks! I noticed that I also didn't use '()' for function names in the
commit message. I'll fix all these and add the pr_warn_once in v2.

