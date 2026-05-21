Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAECA+IBD2pfEAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:00:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D55A54AE
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315171.1585017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2zi-0002D9-8l; Thu, 21 May 2026 12:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315171.1585017; Thu, 21 May 2026 12:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2zi-0002Ai-5l; Thu, 21 May 2026 12:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1315171;
 Thu, 21 May 2026 12:59:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3pQEPagYKCTwqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 1wQ2zh-0002Ac-6K
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:59:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ2zg-00BIgZ-Hz
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:59:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3pQEPagYKCTwqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a0f019d-5cb7-0a2a0a5109dd-0a2a4509ac7c-36
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:59:20 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3pQEPagYKCTwqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a0f01a6-2497-0a2a45090019-d155d2cac926-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:59:20 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-837cc5bc6deso3781002b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 05:59:19 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779368358; x=1779973158; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqcHY/DvmkAZ9QjHGP0kTeF7mk7WkCMN/ZHV20HdBXo=;
        b=vs64GqVnPqRSmYAKNCqIHM+5m/lC7VzOvYmQtJab0I1Z3fyFrN1c9mrbkxPrqROJRb
         lnH027ST7+RjkC8JXvtZVBN08lamC4LydBZmw4QuXtNWRNECXToPtKwpj4WiudQ1AyzV
         Z2ho5G7EoX2CHm2h+444hEDy1jzV4RBBjW76dTs+NsiS7eRXD2+tFQtMxwM3UY9Nv+ul
         uzjpaQl63X2Og3FkigkbbDfC81YLfiE9aYPqhtsDfUwYfXtLxmUX6MNMcg1uqMes6Tre
         Ur9y+oWeEMRf6gO/S/xOpAWqeu7KZCBivtQr5E2ETLlBNwd6rzd5kB4Mjw7FT6D9AGeL
         Cr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368358; x=1779973158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GqcHY/DvmkAZ9QjHGP0kTeF7mk7WkCMN/ZHV20HdBXo=;
        b=si3jUcDdNolVBgKk2Sd6UF2sjN+Ks9KrZ5VOnJxWU2mCA4HHiL0HdBYTBc+JI3+rxm
         JBN2kl2EcTVCznmH6VQH5Jn1i99fT6PtWshPGPTJSlkS8rZhNWYjkmWDKFghmu2L59sK
         DHqV71lpdY8ExpqpCTn04kbmF/DTO5760yaQvfDkz5n3UR/GGvCiTAnq1pPf1Q172400
         Tk2SSuVtE8vmNC3MaI59SEStazblKhXwHkNpCHJw+wOBQE8QKgZxzBjSHwo/VjpLoNBb
         WCaJ3j/Fx5PKGZaiykCvKjE8hnetbJSZQPFNmMCjShSoeGwcnrt89a6pCXZdk1CHHWCb
         nQLA==
X-Forwarded-Encrypted: i=1; AFNElJ+51dzHYsOcH+rPW7h2j07UDL23WUf3KP0/S5YGbEXK31fahR7AWr4ShlK6SAZN8BM2Xf5f3ZOBaM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgTuFYYLtBmGMcw68rA5KqafEIvAwmSLQiGK3zpQUwaLKPiFa2
	Cyi4dYyEDoq/OtHitWUDQ7a/C64jo1cgHyGRLE+QolBjM48fRghcJxfdCMTgcKvUq2YVPi3NchQ
	Q0cpC9g==
X-Received: from pfdc18.prod.google.com ([2002:aa7:8c12:0:b0:834:df9e:8e02])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4655:b0:82f:de7:d29
 with SMTP id d2e1a72fcca58-8414ae013a1mr2977074b3a.31.1779368357753; Thu, 21
 May 2026 05:59:17 -0700 (PDT)
Date: Thu, 21 May 2026 05:59:17 -0700
In-Reply-To: <423b37f056f0d4d596d5f4cc73802fb1079ecf63.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-28-seanjc@google.com>
 <423b37f056f0d4d596d5f4cc73802fb1079ecf63.camel@infradead.org>
Message-ID: <ag8Bpc_uVNrNWqfX@google.com>
Subject: Re: [PATCH v3 27/41] x86/kvmclock: Enable kvmclock on APs during
 onlining if kvmclock isn't sched_clock
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
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
X-purgate-ID: tlsNG-bad1c0/1779368360-4357BA53-6E4EB036/0/0
X-purgate-type: clean
X-purgate-size: 1465
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
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
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
X-Rspamd-Queue-Id: 6F4D55A54AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > In anticipation of making x86_cpuinit.early_percpu_clock_init(), i.e.
> > kvm_setup_secondary_clock(), a dedicated sched_clock hook that will be
> > invoked if and only if kvmclock is set as sched_clock, ensure APs enabl=
e
> > their kvmclock during CPU online.=C2=A0 While a redundant write to the =
MSR is
> > technically ok, skip the registration when kvmclock is sched_clock so t=
hat
> > it's somewhat obvious that kvmclock *needs* to be enabled during early
> > bringup when it's being used as sched_clock.
> >=20
> > Plumb in the BSP's resume path purely for documentation purposes.=C2=A0=
 Both
> > KVM (as-a-guest) and timekeeping/clocksource hook syscore_ops, and it's
> > not super obvious that using KVM's hooks would be flawed.=C2=A0 E.g. it=
 would
> > work today, because KVM's hooks happen to run after/before timekeeping'=
s
> > hooks during suspend/resume, but that's sheer dumb luck as the order in
> > which syscore_ops are invoked depends entirely on when a subsystem is
> > initialized and thus registers its hooks.
> >=20
> > Opportunsitically make the registration messages more precise to help
> > debug issues where kvmclock is enabled too late.
>=20
> That's a hard word to type, isn't it?

Heh, you have no idea.  I've been "this" close to creating a VIM binding fo=
r a
while, it is time...

