Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VsFFINYPI2rZhQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 20:05:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CB64A6ED
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 20:05:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=MswAC1rY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1329903.1593775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVYui-0001zm-Dm; Fri, 05 Jun 2026 18:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329903.1593775; Fri, 05 Jun 2026 18:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVYui-0001x2-AU; Fri, 05 Jun 2026 18:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1329903;
 Fri, 05 Jun 2026 18:04:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3xw8jagYKCco8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 1wVYug-0001wU-T0
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 18:04:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVYug-00FOio-9n
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 20:04:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3xw8jagYKCco8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 6a230fb9-5cb7-0a2a0a5109dd-0a2a4504bb32-22
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 20:04:58 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3xw8jagYKCco8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 6a230fc8-1dec-0a2a45040019-d155d2cac848-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 20:04:58 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-8421f5d76aaso1429486b3a.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 11:04:57 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780682696; x=1781287496; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zOxp1hSLKBpPLL80bFuxK8SsL52R5IjTb2Bqqq35EAY=;
        b=MswAC1rYxQrSVJsjF7ImymeriXfJ8IudBsyPTOdul6UqK9a0x5muNQM3SNDqikiq+L
         ZYiA/VRVRFiTB/+Do9W9CwaKXLc6R66uVqTvd6m3mmItTnGOtX5aHvrF4poHa40WShVA
         TOITWo7fmVNdb6/PY1XbZJjIpC1pYmuwdzqhjpAt/Ca8uMzNwK/NeDwGNBQN14ZPouHY
         tPcwCaui98wrl0fBzSfMiIXN585OrUusksp0+FexeEt/7rJcRhcLPsXrlXMwbJnaHrDc
         tnkiG46SUvhFYDWLbkMp6030vAktxJS+Qv9XG8sP8VanARQutSvMY7vUj/pGhF9FdvpI
         JXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780682696; x=1781287496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOxp1hSLKBpPLL80bFuxK8SsL52R5IjTb2Bqqq35EAY=;
        b=DNuaUhWkW5XFTW77BMmrTPAKt5Ja31S/FnJtZ0T1nUQw5959txqj5jG6yPosW+5yJK
         +6gMc0HjIEmXDvJY0Pktw36zxDGL7E+/f2SlxUxahGD4+0ZsO3+2iJPivymj3tHq0Iyk
         i+feEbcNQQm4LEB9FY62s+fNBuZl4bg0SgBvzsgsxYT/zGogKKilArWCW7xlwxx38TRJ
         n4NtmJ+lbFt5POOyihVFf54s/lBQ2q+AxnUPAcQA/JMuiBIeSoOfDW+j5QmqtcIwYq3X
         DkQNvPjsGWcvrrTBAXVngO62F8ZHFrfqNOjM41AHjEHJ1CVnQYX+SE8bG/VzCEXKH8yF
         IBwQ==
X-Forwarded-Encrypted: i=1; AFNElJ99Ay5/4vWhK3b1FE4vWvlx9kVikfcPvPXnx4mWT1ud097BSDiJt7YbHh+hd0qi+dgFlG0C2BZ7ID0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOgXVq0P50eEDzTQ0omXfE67jLn4jDkLs6wYwOoNAMfE2KIp8v
	POKpNAQ8Cp+5MUfwSX72SWfnAcPtIdH8EeEZ5spt4UQOFd8mE4hO2X7jnyMPs084tAKiEqKZ2by
	PUYPYIA==
X-Received: from pfjq2.prod.google.com ([2002:a05:6a00:882:b0:842:1f0e:d24c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:218e:b0:842:4e43:6f6c
 with SMTP id d2e1a72fcca58-842b0fb60bfmr4509683b3a.39.1780682695567; Fri, 05
 Jun 2026 11:04:55 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:04:54 -0700
In-Reply-To: <87fr315fq9.ffs@fw13>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com> <20260529144435.704127-2-seanjc@google.com>
 <87fr315fq9.ffs@fw13>
Message-ID: <aiMPxl5vkvJDldi9@google.com>
Subject: Re: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if its
 exact timing is known
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-ebf023/1780682698-493773FF-49C64960/0/0
X-purgate-type: clean
X-purgate-size: 1551
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,alien8.de,linux.intel.com,kernel.org,microsoft.com,broadcom.com,siemens.com,infradead.org,suse.com,google.com,zytor.com,intel.com,oracle.com,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,outlook.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:pbonzini@redhat.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC6CB64A6ED

On Fri, Jun 05, 2026, Thomas Gleixner wrote:
> On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:
> > Don't re-calibrate the TSC frequency if the TSC is known to run at a fixed
> > frequency.
> 
> That's misleading because fixed frequency means that the frequency does
> not change, i.e. X86_FEATURE_CONSTANT_TSC is set. But
> X86_FEATURE_CONSTANT_TSC does not imply that the frequency can be read
> from CPUID/MSRs.

Sorry, "if the TSC runs at a known, fixed frequency" would be a better way to
phrase this.

> > In practice, this is likely one big nop, as re-calibration is
> > used only for SMP=n kernels, and only for hardware that is 20+ years old,
> > i.e. is extremely unlikely to collide with TSC_KNOWN_FREQ.
> 
> recalibrate_cpu_khz() is only invoked from Intel P4 and AMD K7 CPU
> frequency drivers, which means that's absolutely not interesting and
> neither X86_FEATURE_CONSTANT_TSC nor X86_FEATURE_TSC_KNOWN_FREQ can be
> set on those systems.

It _shouldn't_ be set on those systems, but in the world of virtualization it's
not completely impossible.

> IOW, this patch is pointless voodoo ware.

Would y'all be opposed to adding a WARN?  I don't actually care about P4 or K7
CPUs, but without any reference to X86_FEATURE_TSC_KNOWN_FREQ in
recalibrate_cpu_khz(), the code _looks_ wrong, and so is very confusing for
readers that don't already know that in practice, it's limited to ancient CPUs.

In other words, the point is to document expectations and mutual exclusion, not
to "fix" anything.

