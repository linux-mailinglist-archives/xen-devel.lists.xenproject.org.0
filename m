Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMdlIK9yB2pX3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:23:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF288556B79
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310323.1581220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy7z-0007k6-AR; Fri, 15 May 2026 19:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310323.1581220; Fri, 15 May 2026 19:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy7z-0007hD-7f; Fri, 15 May 2026 19:23:19 +0000
Received: by outflank-mailman (input) for mailman id 1310323;
 Fri, 15 May 2026 19:23:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3KnIHagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 1wNy7x-0007h0-NY
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:23:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy7x-00BXOc-3r
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:23:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3KnIHagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a077266-e002-0a2a0a5209dd-0a2a450194e6-16
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:23:17 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3KnIHagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a07722b-c1f2-0a2a45010019-d155d7c9e03a-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:16 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c799ee56bd6so145584a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:21:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872875; x=1779477675; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm1yasCgCkYBCfOrXX2peIQ68HcxfozY1zg+bDbrsDM=;
        b=fJMaZqYuZHOm8AKMt/L4KC1jrHSoFoCrfYd41E17aRPoZygM5ZOuhNyb2j4KgGtLsI
         DR923adDfISkAXLywvY0teblMRdkiFxOMS5JKcuzJ+EZvSBHC3NxjsA6wn74zEQiXEDa
         HW0IY2dplFeFx0hWbdz4NT4il5ftgkVw4QO/EnBszLwRxO8Umc7fcgGzGjkTM+Nukd3Y
         jHA9mjLLfszLzXlRrf8SOScp+IeRAXTY2OSiVdvNSMJI+NiN4ht+ifs9UESLRxOnHE+W
         MBUoIY3cRYoch2V7SKvoo+ylKAhPik/r7GBhcx0v01C7GGMOQnL5fNZzFNAKgIFFveyL
         jImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872875; x=1779477675;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zm1yasCgCkYBCfOrXX2peIQ68HcxfozY1zg+bDbrsDM=;
        b=bCuMgSVrO8/ZK5PFNZLfUjD7I4C+n0FBGyxHcRWcZUM20T9rEWloXWAvx79PZVjnzx
         x1MvC+svz6OT+erEzalK29Bo1kfSwvh0qTvHVSmme3V46Us4PEktkJwGHadfwXKMfSRI
         uZzyd262vuQWU6gy8cx8+DolUF5P2qShdFakE5L+3hwgh/++go+3ChoLIKEG6Kxd2HQ7
         xtYXXGX1HMKy1w0BUKu8mmQUdvr004JxznO5eJ2oNDnEhJVDI72PALwcq6+gRoBVBgnh
         4SXjJ1O4vK0ZkoyI7/6e/QexPfvOjdGOK2PGkzwBBRibFVfC8RM8P/IQs8mv7bJZDVRO
         XSjg==
X-Forwarded-Encrypted: i=1; AFNElJ+xQtX3aB56PRMYKaAdg7E/wFEY78sQuP06EPTNvN4sYblrvfegxPGYbcaXXQ5leYerAZFixzhQoSY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGlT/M7kMHFVR34Y3zSx5TDqR0pgSeIITe3wN7TIubYYwPJYxS
	rHYxcXXoa+gkkA8ZXQlu5xguvviOFLKJ+RK2U9ZCHRza7X8S269JuGNOd2YmZkZBz5XLXkFxwjD
	54pFjmQ==
X-Received: from pfvo27.prod.google.com ([2002:a05:6a00:1b5b:b0:837:e90f:8cd9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:338b:b0:838:9e25:f128
 with SMTP id d2e1a72fcca58-83f33cf0bf3mr5811988b3a.26.1778872874478; Fri, 15
 May 2026 12:21:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:36 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-36-seanjc@google.com>
Subject: [PATCH v3 35/41] x86/kvmclock: Obtain TSC frequency from CPUID if present
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1778872876-AE342FF4-BB56FD61/0/0
X-purgate-type: clean
X-purgate-size: 3211
X-Rspamd-Queue-Id: DF288556B79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de,amazon.co.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kas@kernel.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,m:dwmw@amazon.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

From: David Woodhouse <dwmw@amazon.co.uk>

In https://lkml.org/lkml/2008/10/1/246 a proposal was made for generic
CPUID conventions across hypervisors. It was mostly shot down in flames,
but the leaf at 0x40000010 containing timing information didn't die.

It's used by XNU and FreeBSD guests under all hypervisors=C2=B9=C2=B2 to de=
termine
the TSC frequency, and also exposed by the EC2 Nitro hypervisor (as
well as, presumably, VMware). FreeBSD's Bhyve is probably just about
to start exposing it too.

Use it under KVM to obtain the TSC frequency more accurately, instead
of reverse-calculating the frequency from the mul/shift values in the
KVM clock.

Before:
[    0.000020] tsc: Detected 2900.014 MHz processor

After:
[    0.000020] tsc: Detected 2900.015 MHz processor

$ cpuid -1 -l 0x40000010
CPU:
   hypervisor generic timing information (0x40000010):
      TSC frequency (Hz) =3D 2900015
      bus frequency (Hz) =3D 1000000

=C2=B9 https://github.com/apple/darwin-xnu/blob/main/osfmk/i386/cpuid.c
=C2=B2 https://github.com/freebsd/freebsd-src/commit/4a432614f68

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_para.h |  1 +
 arch/x86/kernel/kvm.c           | 10 ++++++++++
 arch/x86/kernel/kvmclock.c      |  6 +++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_par=
a.h
index 17053d2bf270..3f7f558b5b24 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -129,6 +129,7 @@ enum kvm_guest_cpu_action {
 void kvmclock_init(void);
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action);
 bool kvm_para_available(void);
+unsigned int kvm_para_tsc_khz(void);
 unsigned int kvm_arch_para_features(void);
 unsigned int kvm_arch_para_hints(void);
 void kvm_async_pf_task_wait_schedule(u32 token);
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 65c787b1ea03..5cd92a0b156a 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -918,6 +918,16 @@ bool kvm_para_available(void)
 }
 EXPORT_SYMBOL_GPL(kvm_para_available);
=20
+unsigned int kvm_para_tsc_khz(void)
+{
+	u32 base =3D kvm_cpuid_base();
+
+	if (cpuid_eax(base) >=3D (base | KVM_CPUID_TIMING_INFO))
+		return cpuid_eax(base | KVM_CPUID_TIMING_INFO);
+
+	return 0;
+}
+
 unsigned int kvm_arch_para_features(void)
 {
 	return cpuid_eax(kvm_cpuid_base() | KVM_CPUID_FEATURES);
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 47f7df1e81a0..5ceba4f3836c 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -200,7 +200,11 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action act=
ion)
  */
 static unsigned long kvm_get_tsc_khz(void)
 {
-	return pvclock_tsc_khz(this_cpu_pvti());
+	/*
+	 * If KVM advertises the frequency directly in CPUID, use that
+	 * instead of reverse-calculating it from the KVM clock data.
+	 */
+	return kvm_para_tsc_khz() ? : pvclock_tsc_khz(this_cpu_pvti());
 }
=20
 static void __init kvm_get_preset_lpj(void)
--=20
2.54.0.563.g4f69b47b94-goog


