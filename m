Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oqz5FatrRWrQ/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:34:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05126F0E85
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=AMRXTX9R;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350544.1608035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0h0-0001pj-Tw; Wed, 01 Jul 2026 19:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350544.1608035; Wed, 01 Jul 2026 19:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0h0-0001mi-Qu; Wed, 01 Jul 2026 19:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1350544;
 Wed, 01 Jul 2026 19:33:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3YmtFagYKCacZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 1wf0gz-0001Z7-GL
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:33:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0gy-004oBL-TW
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:33:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3YmtFagYKCacZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a456b9c-2eae-0a2a0a5409dd-0a2a4509e6b8-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:52 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3YmtFagYKCacZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a456b63-97e6-0a2a45090019-d155d6cab8da-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:52 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c9f452d260so14902225ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:52 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934371; x=1783539171; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UfbO84e0Sh/RDtmtar1VNwA0GsKq34HNdlIOIT+krtA=;
        b=AMRXTX9RbUJm6EZTMErtVm2SOxZxGNRMbsJeTYXz1MSKJZdeUpfr3oYsmz+pV5WqgW
         HRVba+crviIXfXkCo4r5FBnNAbWF9x9OBnJgnmUO/QmV2EVI2z6zzOMK2dCV/J2hjvQa
         zQkn7X/oyW4Q2jemRPb5y0fY+NA40WiahJeSMlEgTcJ4fdRaM9rMplbzXP9c9dYk4gxq
         Oz9jJWrvA5gxsPkWojGP3sflAkI886i79+XOhYtAX5dXCEoPR0yyLGrX9AdMsHEqpHKQ
         akaae/pdc+sS8gLlHZdS0PEnic6dTOPaoAT9dkFH4r8LskqOfNfSyVDYy/24tV8eU1SG
         8o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934371; x=1783539171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfbO84e0Sh/RDtmtar1VNwA0GsKq34HNdlIOIT+krtA=;
        b=CfZwskGBmQ6jg1Ug52r5uRHuibGs7iTXKeCcQqpROuup/36U8rP4iAv1yxiBteyYbk
         2cTqkwHzMA4K5zj7OV/J/Y5BuHhTN5DfjbcWef3SO5MBAHP53lHWZycr0Yjj3/M63TDt
         iS+mulqY80MCqhgp+6EaaG1E+EU/c5a+DXs8VpiMu6BA+XCpcO/+zwJq3CW67Azbqs5W
         It+F01p+nRhLrbTJMqOSb8DKlJg4GC56APZyBtL6FhyZeVFkbdWqmgReozDDvcijjfeq
         PkcsUMocXGXzRjFNuCOXStHzEnVT3VbyC24OZG2GOLnp/zzK7hckf4y5IyKMH3yud7vs
         f3DA==
X-Forwarded-Encrypted: i=1; AFNElJ87yIacb93KF2ygwoQ+urKAAD6QL/3dFb4jn8eqJPVXtvaH8J6lXxZ+RwlseH+bunboXSMP7DXTpZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLcXiWLg7uJNU+ZKVfIFo3yha69vEUQBGUV7uJYbIEgn4YsAfs
	x8XB+sXWM5CZvhwQBS9H38QqdAon9W7vqP7iarKNX5omg6nXpw5WLVG9I6W2TXklLYCSCymLL/5
	RoP0A5g==
X-Received: from pgkm12.prod.google.com ([2002:a63:ed4c:0:b0:c9e:1056:de15])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b7a7:b0:3bf:6011:53b
 with SMTP id adf61e73a8af0-3bfed47e0eamr2900412637.38.1782934370392; Wed, 01
 Jul 2026 12:32:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:41 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-21-seanjc@google.com>
Subject: [PATCH v5 20/51] KVM: x86: Officially define CPUID 0x40000010 as PV
 Timing Info (TSC and Bus)
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1782934372-46327986-DD399FFD/13/0
X-purgate-type: clean
X-purgate-size: 3773
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amazon.co.uk:email,lkml.org:url];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C05126F0E85

From: David Woodhouse <dwmw@amazon.co.uk>

Formally define and document CPUID 0x40000010 as providing TSC and local
APIC bus frequency information for KVM's PV CPUID range.  Way back in
2008, VMware proposed (https://lkml.org/lkml/2008/10/1/246) carving out a
range of CPUID leaves for use by hypervisors.  While the broader proposal
from VMware was mostly shot down in flames, use of CPUID 0x40000010 to
provide TSC and local APIC bus frequency information survived and made it's
way into multiple guest operating systems.

XNU unconditionally assumes CPUID 0x40000010 contains the frequency
information, if it's present on any hypervisor:

  https://github.com/apple/darwin-xnu/blob/main/osfmk/i386/cpuid.c

As does FreeBSD:

  https://github.com/freebsd/freebsd-src/commit/4a432614f68

More importantly, QEMU (the de facto "reference" VMM for KVM) has
conditionally provided timing information in CPUID 0x40000010 for almost
9 years, since commit 9954a1582e ("x86-KVM: Supply TSC and APIC clock
rates to guest like VMWare").

So at this point it would be daft for KVM (or any hypervisor) to expose
0x40000010 for any *other* content.  Officially carve out and define the
CPUID leaf so that Linux-as-a-guest can follow suit and pull TSC and Local
APIC Bus frequency information from CPUID.

Defer providing userspace with the necessary information needed to
precisely and accurately enumerate the _actual_ configured TSC frequency
to the guest (that exact information, along with the scaled ratio, isn't
exposed to userspace).  As evidenced by QEMU, providing CPUID 0x40000010
without help from KVM is entirely possible, just not ideal.

Link: https://lore.kernel.org/all/ea0d7f43d910cee9600b254e303f468722fa355b.camel@infradead.org
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: drop KVM filling of CPUID, add documentation, massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/x86/cpuid.rst | 12 ++++++++++++
 arch/x86/include/uapi/asm/kvm_para.h | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/virt/kvm/x86/cpuid.rst b/Documentation/virt/kvm/x86/cpuid.rst
index bda3e3e737d7..a5ee8ff052ce 100644
--- a/Documentation/virt/kvm/x86/cpuid.rst
+++ b/Documentation/virt/kvm/x86/cpuid.rst
@@ -122,3 +122,15 @@ KVM_HINTS_REALTIME 0            guest checks this feature bit to
                                 preempted for an unlimited time
                                 allowing optimizations
 ================== ============ =================================
+
+function: KVM_CPUID_TIMING_INFO (0x40000010)
+
+returns::
+
+   eax = (Virtual) TSC frequency in kHz
+   ebx = (Virtual) Bus (local APIC timer) frequency in kHz
+   ecx = 0 (Reserved)
+   edx = 0 (Reserved)
+
+Note, KVM only defines the semantics of KVM_CPUID_TIMING_INFO; KVM does NOT
+advertise support via KVM_GET_SUPPORTED_CPUID.
diff --git a/arch/x86/include/uapi/asm/kvm_para.h b/arch/x86/include/uapi/asm/kvm_para.h
index a1efa7907a0b..c3a384711f3a 100644
--- a/arch/x86/include/uapi/asm/kvm_para.h
+++ b/arch/x86/include/uapi/asm/kvm_para.h
@@ -44,6 +44,17 @@
  */
 #define KVM_FEATURE_CLOCKSOURCE_STABLE_BIT	24
 
+/*
+ * The timing information leaf provides TSC and local APIC timer frequency
+ * information to the guest.  Note, userspace is responsible for filling the
+ * leaf with the correct information.
+ *
+ *  # EAX: (Virtual) TSC frequency in kHz.
+ *  # EBX: (Virtual) Bus (local APIC timer) frequency in kHz.
+ *  # ECX, EDX: Reserved (must be zero).
+ */
+#define KVM_CPUID_TIMING_INFO	0x40000010
+
 #define MSR_KVM_WALL_CLOCK  0x11
 #define MSR_KVM_SYSTEM_TIME 0x12
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


