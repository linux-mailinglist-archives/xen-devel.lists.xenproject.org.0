Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP0tF8hyD2ryMQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:02:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B416B5ABF92
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315938.1585574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQAWU-0007bu-QA; Thu, 21 May 2026 21:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315938.1585574; Thu, 21 May 2026 21:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQAWU-0007Zc-Mz; Thu, 21 May 2026 21:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1315938;
 Thu, 21 May 2026 21:01:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3sHIPagYKCSsZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 1wQAWS-0007YE-Ol
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 21:01:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQAWR-004L1S-5t
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 23:01:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3sHIPagYKCSsZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a0f729a-5cb7-0a2a0a5109dd-0a2a450bd03e-14
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:01:39 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3sHIPagYKCSsZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a0f72b1-212f-0a2a450b0019-d155d6cae84b-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:01:38 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bd1dbcccf6so109114475ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:01:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779397297; x=1780002097; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iN4mR6FXbVUwqAWLl+PlqYFyvLBNkg9d4d7Akdf1bJQ=;
        b=JIMauFvrwPnBeNtRDTIluZXbpmUvFefVyHUBcIWXka7+LjZOUZ48q+mq1Sl9FMhj6R
         aBJjM/a1ell70tS6zSU82SHDDKEm8JAXlEcOWuRi6Dm+boyxeqIOCGyX7TiULqfkImRt
         qLxWHMu0Eybykn053m2iEMPxNt8rmSDpxnEyPFaL0FwL9Fmnzhc8SAWvT8B2mLMrhvPe
         I06scUk1niZn7NW8KwnBRfBIjH1I6NcibhdMq+Md+ECHVDeizeOWOlrLr2U8Mzz9owxN
         jTI044Svrals1qFuDVScfS5WVPwr60pDp7DkqDYHtc1uWRVVpqSE1abBI8pgqF3pwnfr
         VQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779397297; x=1780002097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iN4mR6FXbVUwqAWLl+PlqYFyvLBNkg9d4d7Akdf1bJQ=;
        b=pMV9KLcgX96fu4zo3+k5rgR2gQhJIBb1knnln8ycycwll6fVgsBZy8tREpI8BvV+e2
         pZ23sZnwnZFRe59n1WHNrWDP0brNfZgYnWWtFX50wZ2eT8a8Ybs4byd8t9jRbhOCvONZ
         xEmfmnULkwP5503aZ3TCm54SVMMeCA6bcrHoQItC5SgLBbs1ygsNLN6wVqhmKngO7E31
         +f66QAR31g9OUMjSFG5ExeCyoXhSECUMtFnJ6BhqyCx485GQhkY4BwwZ3aJQUcCWSbpp
         b/i2N5hp4+zPTqbr5LISnuxRaXbGElYuqS+NJh1Ow2IJuq9gZ3b4IKIf0kWccODXuENW
         G19Q==
X-Forwarded-Encrypted: i=1; AFNElJ95T+dXTxteqvcywflvRZsVpsSz1gPAyLBpIM1OwGZhOjRQqlC0ganQFYlTyNBMCS7IbsBwdj5T3iA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuavIVFEfo+XwfzGBFtNFjRSlSaWYUhPg0haCCVi4SpGTtVyUV
	iCli7efC2Y7FQ+SUWlG2UjEWqhVA00tzXWkB9dboeRkwpT7HqBu7w1LlgmbxXrwPL8fvYC7cxdx
	7znEiag==
X-Received: from plge10.prod.google.com ([2002:a17:902:cf4a:b0:2bd:40d4:e407])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e84c:b0:2ba:4ad9:70f6
 with SMTP id d9443c01a7336-2beb06aa272mr6036375ad.31.1779397296608; Thu, 21
 May 2026 14:01:36 -0700 (PDT)
Date: Thu, 21 May 2026 14:01:35 -0700
In-Reply-To: <c54fd01b-fe22-4c9c-8d5f-5b317de07a40@oracle.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-38-seanjc@google.com>
 <c54fd01b-fe22-4c9c-8d5f-5b317de07a40@oracle.com>
Message-ID: <ag9yryEe0A7_AZCT@google.com>
Subject: Re: [PATCH v3 37/41] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
From: Sean Christopherson <seanjc@google.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: kvm@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Kiryl Shutsemau <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-42698a/1779397299-19165F3B-09F33C45/0/0
X-purgate-type: clean
X-purgate-size: 1778
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
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,lists.linux.dev,lists.xenproject.org,microsoft.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,outlook.com,amd.com,linutronix.de,amazon.co.uk];
	FORGED_RECIPIENTS(0.00)[m:dongli.zhang@oracle.com,m:kvm@vger.kernel.org,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,m:dwmw@amazon.co.uk,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
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
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B416B5ABF92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026, Dongli Zhang wrote:
> On 2026-05-15 12:19 PM, Sean Christopherson wrote:
> > Prefer the TSC over kvmclock for sched_clock if the TSC is constant,
> > nonstop, and not marked unstable via command line.  I.e. use the same
> > criteria as tweaking the clocksource rating so that TSC is preferred over
> > kvmclock.  Per the below comment from native_sched_clock(), sched_clock
> > is more tolerant of slop than clocksource; using TSC for clocksource but
> > not sched_clock makes little to no sense, especially now that KVM CoCo
> > guests with a trusted TSC use TSC, not kvmclock.
> > 
> >         /*
> >          * Fall back to jiffies if there's no TSC available:
> >          * ( But note that we still use it if the TSC is marked
> >          *   unstable. We do this because unlike Time Of Day,
> >          *   the scheduler clock tolerates small errors and it's
> >          *   very important for it to be as fast as the platform
> >          *   can achieve it. )
> >          */
> > 
> > The only advantage of using kvmclock is that doing so allows for early
> > and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
> > broken for over two years with nary a complaint, i.e. it can't be
> > _that_ valuable.  And as above, certain types of KVM guests are losing
> > the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
> > needs to be decoupled from sched_clock() no matter what.
> 
> Has it been broken for two years because of pvclock_clocksource_read_nowd()?

Yep.  Because pvclock_clocksource_read_nowd() ignores PVCLOCK_GUEST_STOPPED, the
flag only ever gets recognized when the kernel reads WALL_CLOCK, which AFAICT
only happens at initial boot, and during suspend and resume.

