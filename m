Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNa9Ml8ED2pDEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:10:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F45A56DB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315183.1585027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3AX-00055X-6p; Thu, 21 May 2026 13:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315183.1585027; Thu, 21 May 2026 13:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3AX-00052d-3X; Thu, 21 May 2026 13:10:33 +0000
Received: by outflank-mailman (input) for mailman id 1315183;
 Thu, 21 May 2026 13:10:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterz@infradead.org>) id 1wQ3AU-00052X-Pu
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:10:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ3AT-007gjB-OW
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:10:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterz@infradead.org>)
 id 6a0f042c-2eae-0a2a0a5409dd-0a2a4507cada-44
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:10:29 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <peterz@infradead.org>)
 id 6a0f0444-229c-0a2a45070019-5a9b3222a22e-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:10:28 +0200
Received: from
 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wQ3AK-00000008VrU-2GqZ; Thu, 21 May 2026 13:10:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 111F6300446; Thu, 21 May 2026 15:10:19 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DA7DVimM8Ck0kNzDR7awZketijLzqktg5UcM679ki4g=; b=q6twZ/quiaPkS7JYDLfYP4oxQR
	kwL3xkWZBEpV2j7C1uN45f/dlF1ZLXrwx+jWqL7SQEvjHcy7/MS8yAxgKbQMJOBppFTgAyijrmCw+
	qsUedKzMdKPt0VHol7Hg5iM2yiOqZHQAzBNQpo0ETgquMSq330OAMMUOL5XazrqdRvIuwmq8fCzvJ
	8w7PV454mMuz+QtTx/4yGia1zkhOm9E43cVzP05eFWXg6UOcrEZyigPUrzrWk0OV5q9ekYN/vFQ9r
	H8UIXCIrcHRZ6j+ZCex3x14hX/FPAOr2uRFQk4MepXZ9vQBQZkKMP2xQUakHd/KfGdD8DmUEqPEFb
	l12Q18Ng==;
Date: Thu, 21 May 2026 15:10:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Kiryl Shutsemau <kas@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Juergen Gross <jgross@suse.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Michael Kelley <mhklinux@outlook.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 27/41] x86/kvmclock: Enable kvmclock on APs during
 onlining if kvmclock isn't sched_clock
Message-ID: <20260521131019.GI3126523@noisy.programming.kicks-ass.net>
References: <20260515191942.1892718-1-seanjc@google.com>
 <20260515191942.1892718-28-seanjc@google.com>
 <423b37f056f0d4d596d5f4cc73802fb1079ecf63.camel@infradead.org>
 <ag8Bpc_uVNrNWqfX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ag8Bpc_uVNrNWqfX@google.com>
X-purgate-ID: tlsNG-ef75cf/1779369029-0B57BC48-2C90EFCE/0/0
X-purgate-type: clean
X-purgate-size: 1570
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,noisy.programming.kicks-ass.net:mid];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[peterz@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[infradead.org:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5C6F45A56DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 05:59:17AM -0700, Sean Christopherson wrote:
> On Thu, May 21, 2026, David Woodhouse wrote:
> > On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > > In anticipation of making x86_cpuinit.early_percpu_clock_init(), i.e.
> > > kvm_setup_secondary_clock(), a dedicated sched_clock hook that will be
> > > invoked if and only if kvmclock is set as sched_clock, ensure APs enable
> > > their kvmclock during CPU online.  While a redundant write to the MSR is
> > > technically ok, skip the registration when kvmclock is sched_clock so that
> > > it's somewhat obvious that kvmclock *needs* to be enabled during early
> > > bringup when it's being used as sched_clock.
> > > 
> > > Plumb in the BSP's resume path purely for documentation purposes.  Both
> > > KVM (as-a-guest) and timekeeping/clocksource hook syscore_ops, and it's
> > > not super obvious that using KVM's hooks would be flawed.  E.g. it would
> > > work today, because KVM's hooks happen to run after/before timekeeping's
> > > hooks during suspend/resume, but that's sheer dumb luck as the order in
> > > which syscore_ops are invoked depends entirely on when a subsystem is
> > > initialized and thus registers its hooks.
> > > 
> > > Opportunsitically make the registration messages more precise to help
> > > debug issues where kvmclock is enabled too late.
> > 
> > That's a hard word to type, isn't it?
> 
> Heh, you have no idea.  I've been "this" close to creating a VIM binding for a
> while, it is time...

'z=' not good enough?


