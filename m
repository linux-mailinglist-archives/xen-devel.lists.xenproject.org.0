Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hz4E/MKD2omEgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:38:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5D5A60B7
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315238.1585081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3bi-0003kC-AR; Thu, 21 May 2026 13:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315238.1585081; Thu, 21 May 2026 13:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3bi-0003iA-7J; Thu, 21 May 2026 13:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1315238;
 Thu, 21 May 2026 13:38:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <32QoPagYKCYIykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 1wQ3bg-0003i2-Pf
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:38:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ3bg-00Gin8-5e
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:38:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <32QoPagYKCYIykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a0f0ad2-bab6-0a2a0a5309dd-0a2a45068402-24
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:38:36 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <32QoPagYKCYIykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a0f0ada-7371-0a2a45060019-d155d2caed64-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:38:35 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-841127f960fso1220376b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 06:38:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779370714; x=1779975514; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbJ4F8kl/6/QcBmB9dNne3NQOqe79KuT470iYfI7huM=;
        b=hG6B9OEgWtr7KTUiUJXXEpQ1JY+bs8So+ilFZT4WRa1GbMtbUbgoUBcpQPkheK0GHo
         dVp0Ey6EsM/eugVN2fmv9TLIAabVzmCH/Z1+5uOWbXIzlFY3rF4LCiV18+/qgAsgiqh+
         NlEA11Ydo/C3feLRzxgyiLMGVWuwIm15kkcHTsPeko+WrVBPr3jfmddxxtgNaMuyXN3R
         PnFuo6J0RlDzp90jobGs+IpgwXXgh4tlxNwy/S7O6vzZ/mF6iKGU4YKyfkb18fPlDQaR
         qDWVrBj70nMW4dcm3rQUtyU0YgptjPMbf0TA5Xe4qE12do0abRkorVVCoYMPAlacaexx
         f3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370714; x=1779975514;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jbJ4F8kl/6/QcBmB9dNne3NQOqe79KuT470iYfI7huM=;
        b=mbrlvJtcPRzWDxHqYmM+Tz6hhUozTPLbwxvu9urZXU9M03UCm/cdgPcIKi14NKd2Yj
         oMwVfkWu6xWVKrOYq4XB59XZEsMcIUdGZz/8CrJtgkc0bchhD24agubfhhIyj/lceDBm
         g7NH9vS9N44q3Mq4lzK6H7kZVqlwTBuWQtb/m0vPKywNQs6OIcHULuZjSU49g3bdCHLc
         j+NCaGXUXiHCNujGUL491IK5CSKqFpTKxiCt/eTanApuW64Zt0dIQTrSUPivPszVKFWz
         un4eMUBo0O2s6IMdAljEQAn/fW7wiOWFjSoHGW5ACEJB4aHdSkH24fmIKuXm5UqCgT5F
         pPCw==
X-Forwarded-Encrypted: i=1; AFNElJ9lMxR6hrkiraU3P+d4maUpYPUO9i6EGor3sg0Is+COxyFtb9oZ/WkXIBhaTzgUXB/MEkOv8E7LFqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1h5hIR7B6K0aOGn2mb9VGckB30biRdOQ6XBijRoWTccjkE9++
	l48odtfhfpBfAkzq98P9cv5LOHhyfnKviwkJrutshBIK+TDo7OcvSu2JDm/bsuZfoIcUEiVGp8k
	VYHcNiQ==
X-Received: from pfbem15.prod.google.com ([2002:a05:6a00:374f:b0:83d:3c25:eb8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c8c:b0:827:3b1b:43e6
 with SMTP id d2e1a72fcca58-8414acc6e8emr3123916b3a.21.1779370713612; Thu, 21
 May 2026 06:38:33 -0700 (PDT)
Date: Thu, 21 May 2026 06:38:32 -0700
In-Reply-To: <20260521131019.GI3126523@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-28-seanjc@google.com>
 <423b37f056f0d4d596d5f4cc73802fb1079ecf63.camel@infradead.org>
 <ag8Bpc_uVNrNWqfX@google.com> <20260521131019.GI3126523@noisy.programming.kicks-ass.net>
Message-ID: <ag8K2FRGcoEa-D2Y@google.com>
Subject: Re: [PATCH v3 27/41] x86/kvmclock: Enable kvmclock on APs during
 onlining if kvmclock isn't sched_clock
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1779370716-87371D75-0F2D37D4/0/0
X-purgate-type: clean
X-purgate-size: 1831
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
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: B5F5D5A60B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026, Peter Zijlstra wrote:
> On Thu, May 21, 2026 at 05:59:17AM -0700, Sean Christopherson wrote:
> > On Thu, May 21, 2026, David Woodhouse wrote:
> > > On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > > > In anticipation of making x86_cpuinit.early_percpu_clock_init(), i.=
e.
> > > > kvm_setup_secondary_clock(), a dedicated sched_clock hook that will=
 be
> > > > invoked if and only if kvmclock is set as sched_clock, ensure APs e=
nable
> > > > their kvmclock during CPU online.=C2=A0 While a redundant write to =
the MSR is
> > > > technically ok, skip the registration when kvmclock is sched_clock =
so that
> > > > it's somewhat obvious that kvmclock *needs* to be enabled during ea=
rly
> > > > bringup when it's being used as sched_clock.
> > > >=20
> > > > Plumb in the BSP's resume path purely for documentation purposes.=
=C2=A0 Both
> > > > KVM (as-a-guest) and timekeeping/clocksource hook syscore_ops, and =
it's
> > > > not super obvious that using KVM's hooks would be flawed.=C2=A0 E.g=
. it would
> > > > work today, because KVM's hooks happen to run after/before timekeep=
ing's
> > > > hooks during suspend/resume, but that's sheer dumb luck as the orde=
r in
> > > > which syscore_ops are invoked depends entirely on when a subsystem =
is
> > > > initialized and thus registers its hooks.
> > > >=20
> > > > Opportunsitically make the registration messages more precise to he=
lp
> > > > debug issues where kvmclock is enabled too late.
> > >=20
> > > That's a hard word to type, isn't it?
> >=20
> > Heh, you have no idea.  I've been "this" close to creating a VIM bindin=
g for a
> > while, it is time...
>=20
> 'z=3D' not good enough?

You people and your fancy ways.  I'm just happy I can get in and out of the=
 editor :-)

