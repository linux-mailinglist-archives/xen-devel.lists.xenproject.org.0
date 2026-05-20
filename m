Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHtJC672DWry4wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 20:00:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9F3595145
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 20:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314253.1584227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPlD6-0005I1-Ut; Wed, 20 May 2026 18:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314253.1584227; Wed, 20 May 2026 18:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPlD6-0005GZ-RW; Wed, 20 May 2026 18:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1314253;
 Wed, 20 May 2026 17:59:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3m_YNagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 1wPlD5-0005GT-1v
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 17:59:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPlD4-00B8Dw-EX
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 19:59:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3m_YNagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a0df688-2eae-0a2a0a5409dd-0a2a4509cd90-18
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:59:58 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3m_YNagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a0df69c-2497-0a2a45090019-d155d2cab15f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:59:58 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-82fa6c3a77cso2941261b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:59:57 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779299996; x=1779904796; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CN4Zn2M2jJcMvhiuUJl3O5eQtI7RDh/+btUc2M7YWms=;
        b=SH3BMk/qzhgTuBB9zkEXNGLp3Yo9XQ08pfAku9KfsPEQ6sXfEmYRsdMs+wmt0H54hD
         yGdWX/4+kJL4VqkKUXrPdLCTkcLlYUiGFVJvBTU+1fn7+MBdqSkgxwEYNOa4JWTwoYzf
         2JN6t8aoAuu5Z8TbIG5GjZ4IhCngzyqUZ5/E0Zxg+0HKC6P4JNuM9GoRYHzFg0RaTpnx
         ZooWuLBM43mdNzxZsCG7R8C/wrF2FIm7j+naUj53kBJtonWOQ8Q4evmsTWnOOT+vm8WF
         9hNc404d6jxeDxh4hiVM1dnDeeHnRTAPoz6PANtJNLi7fdymSw0mMOFC59BHiVNSzeYS
         nq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299996; x=1779904796;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CN4Zn2M2jJcMvhiuUJl3O5eQtI7RDh/+btUc2M7YWms=;
        b=Ht8u76NBnEO3IpZeEryiVtvV1d/zkE3lqboFIaB0dE1zCxHs2y2J3Z5c6dAGsFHNlS
         zAYz7h+Zi9mZsj9R7Cbil1KxnSLnB5hh67qjZkZCHB0rbmnf/t96ddEp65BzZ+WJNUCx
         AtF2nl8xQWV14tIiKdQaeGZGbRgD7X1bAQyjIjfJUNhjVOoOrPR/MnamuFtYMfKuwX5C
         V7NsObeZXHp8+EXUB02fabBmx+Jp1i5iRFhYbcXaFlpQ/4hAidcec5fuqxDc5CNTk1LV
         xHG8hCnKFusBJEYNhD+gdko4QkTlTkGbx+c8vaPQRf094C3tplmVdDzjzxxqIXtq24bk
         VpcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8r+uvB3DjFyfUprx33uMn1+iM1YxZbU0TFjEjWWHcKbuMSF7wTdKh1KFKaMZFCIKCHMXQqXz9nXYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0ppvt0egDUV7xh2hghnrB8NWBGRtt2y2f4140HfxB3R9uekX4
	sj5bU8ILDxnhN73bS9TYW+7yuFIsZ2GcQI/nWcDXxcO17erGxm8ZkeVcczmR8BAZ+LoJ6/y9drq
	av6mYkw==
X-Received: from pfblu4.prod.google.com ([2002:a05:6a00:7484:b0:83a:58c1:f5e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2449:b0:835:405a:7e72
 with SMTP id d2e1a72fcca58-83f33c24d1cmr24352155b3a.11.1779299995865; Wed, 20
 May 2026 10:59:55 -0700 (PDT)
Date: Wed, 20 May 2026 10:59:55 -0700
In-Reply-To: <7260682b21c28d1299e58400b9a2f4b8d23bd434.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <7260682b21c28d1299e58400b9a2f4b8d23bd434.camel@infradead.org>
Message-ID: <ag32mwLvHpWn2vCt@google.com>
Subject: Re: [PATCH v3 00/41] x86: Try to wrangle PV clocks vs. TSC
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
X-purgate-ID: tlsNG-bad1c0/1779299998-37175A53-26F4437A/0/0
X-purgate-type: clean
X-purgate-size: 4263
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7F9F3595145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > Dave/Thomas/Peter/Boris, what's the going rate for bribes to take somet=
hing
> > like this through the tip tree?
> >=20
> > The bulk of the changes are in kvmclock and TSC, but pretty much every
> > hypervisor's guest-side code gets touched at some point.=C2=A0 I am rea=
onsably
> > confident in the correctness of the KVM changes.=C2=A0 Michael tested H=
yper-V in
> > v2, and while there were conflicts when rebasing, they were largely
> > superficial (and I've just jinxed myself).=C2=A0 For all other hypervis=
ors, assume
> > the code is compile-tested only, but those changes are all quite small =
and
> > straightforward.
> >=20
> > The only changes that are questionable/contentious are the last two pat=
ches,
> > which have KVM-as-a-guest use CPUID 0x16 to get the CPU frequency, even=
 on
> > AMD (that's the dubious part).=C2=A0 I very deliberately put them last,=
 so that
> > they can be dropped at will (I don't care terribly if those patches lan=
d).
> > To merge them, I would want explicit Acks from Paolo and David W.
> >=20
> > So, except for the last two patches, to get the stuff I really care abo=
ut
> > landed, I think/hope it's just the TSC and guest-side CoCo changes that=
 need
> > reviews/acks?
> >=20
> > The primary goal of this series is (or at least was, when I started) to
> > fix flaws with SNP and TDX guests where a PV clock provided by the untr=
usted
> > hypervisor is used instead of the secure/trusted TSC that is controlled=
 by
> > trusted firmware.
> >=20
> > The secondary goal is to draft off of the SNP and TDX changes to slight=
ly
> > modernize running under KVM.=C2=A0 Currently, KVM guests will use TSC f=
or
> > clocksource, but not sched_clock.=C2=A0 And they ignore Intel's CPUID-b=
ased TSC
> > and CPU frequency enumeration, even when using the TSC instead of kvmcl=
ock.
> > And if the host provides the core crystal frequency in CPUID.0x15, then=
 KVM
> > guests can use that for the APIC timer period instead of manually calib=
rating
> > the frequency.
> >=20
> > The tertiary goal is to clean up all of the PV clock code to deduplicat=
e logic
> > across hypervisors, and to hopefully make it all easier to maintain goi=
ng
> > forward.
>=20
> I booted this in qemu with -cpu host,+invtsc,+vmware-cpuid-freq
>=20
> I was expecting to see it eschew the kvmclock and use *only* the TSC.
> Is there even any need for 'tsc-early' given that it's *told* the TSC
> frequency in CPUID? Shouldn't it have detected that the TSC is known
> before init_tsc_clocksource() runs?
>
> And then it even spent some time at boot actually using the kvmclock as
> clocksource... when ideally I don't think it would even have *enabled*
> it at all?

Yeah, that's definitely the ideal state.  And I had all the same expectatio=
ns and
observations as you when digging in and testing this.  But unless this seri=
es
makes things worse, I want punt on achieving the ideal state for the moment=
, as
it's proving to be a big lift just to get to a not-awful state.

> [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000] tsc: Detected 2400.000 MHz processor
> [    0.008205] TSC deadline timer available
> [    0.008270] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.159085] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.164074] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycle=
s: 0x22983777dd9, max_idle_ns: 440795300422 ns
> [    0.229087] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 1911260446275000 ns
> [    0.337095] clocksource: Switched to clocksource kvm-clock
> [    0.345246] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    0.356201] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
2983777dd9, max_idle_ns: 440795300422 ns
> [    0.360560] clocksource: Switched to clocksource tsc
>=20



