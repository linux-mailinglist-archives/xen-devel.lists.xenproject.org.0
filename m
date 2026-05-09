Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOXbBNK6/2nm9wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:53:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B208B501D7A
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305109.1577806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXa-0007GA-5P; Sat, 09 May 2026 22:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305109.1577806; Sat, 09 May 2026 22:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXZ-0007Bf-QK; Sat, 09 May 2026 22:52:57 +0000
Received: by outflank-mailman (input) for mailman id 1305109;
 Sat, 09 May 2026 22:52:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wLqXX-000748-Pe
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:52:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqXX-006SzZ-6b; Sun, 10 May 2026 00:52:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 69ffba91-bab6-0a2a0a5309dd-0a2a450884bc-28
 for <multiple-recipients>; Sun, 10 May 2026 00:52:55 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+34a25b45fb3f66caac6a+8294+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 69ffb9d6-63b5-0a2a45080019-5a9b3222c200-3
 for <multiple-recipients>; Sun, 10 May 2026 00:48:54 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-000000060LN-26fo; Sat, 09 May 2026 22:48:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTD-0000000DhIz-16xH;
 Sat, 09 May 2026 23:48:27 +0100
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=iccKma5DaUh/za+fsn0g6dyqukLvuPzbIDc21T+eVFU=; b=u6RYDSbD4U67hGcbeOF2FyQMxF
	4dNfxJgj+Jw1VpmpgORUTUZi/lx3jqCjscmmNps9Ktu6RmyhKNQqG8Zrshc/lCMPNKFIfu5ClurIy
	afITS5d2xHSMWTG1ed+ca466NtWYvBcu88t51HCKij8WUt4q45fFjeqxZY2/6d429QdDCMJqzlYX7
	P+yZB0umg7J4duqoMjVX9Fgti9c5kdgIh1TnkR32o+5SZVuXwWnuwEIwgF0Q+TO4dsFx/cw9gg56g
	4jcjQhe2ozp2dKpbnlzBRde2x4i2wfno53zqxKIRk7l41GA2YKpPWUPfJlcBAfuh3NmuEZZFoC7Td
	q83vedYA==;
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
Date: Sat,  9 May 2026 23:46:53 +0100
Message-ID: <20260509224824.3264567-28-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1778366934-BF77EDB1-33DC7014/13/0
X-purgate-type: clean
X-purgate-size: 5057
X-Rspamd-Queue-Id: B208B501D7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: David Woodhouse <dwmw@amazon.co.uk>

Add a read-only per-vCPU attribute that reports the effective TSC and
APIC bus frequencies as seen by the guest, after hardware TSC scaling
is applied.

This allows userspace to populate CPUID leaf 0x40000010 (the "generic"
timing information leaf used by FreeBSD, XNU, and VMware) with correct
values, without KVM needing to modify guest CPUID at runtime.

The effective TSC frequency differs from what userspace requested via
KVM_SET_TSC_KHZ due to the granularity of hardware scaling and the
host kernel's measurement of its own TSC frequency.

The relationship between the attributes in KVM_VCPU_TSC_CTRL:

  KVM_VCPU_TSC_OFFSET: the offset added to the scaled host TSC
  KVM_VCPU_TSC_SCALE: the raw hardware scaling ratio and frac_bits,
    for VMClock and precise arithmetic
  KVM_VCPU_TSC_EFFECTIVE_FREQ: the resulting frequencies in kHz,
    for populating CPUID leaves

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 Documentation/virt/kvm/devices/vcpu.rst | 33 +++++++++++++++++++++++++
 arch/x86/include/uapi/asm/kvm.h         |  6 +++++
 arch/x86/kvm/x86.c                      | 23 +++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 56562b932280..75d1c2bbb8bc 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -326,3 +326,36 @@ host TSC values are converted to guest TSC using the formula:
 Userspace can use this to precisely calculate the guest TSC from the host
 TSC at any given moment. This is needed for accurate migration of guests,
 as described in the documentation for the KVM_VCPU_TSC_OFFSET attribute.
+
+4.3 ATTRIBUTE: KVM_VCPU_TSC_EFFECTIVE_FREQ
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+:Parameters: struct kvm_vcpu_tsc_effective_freq
+
+Returns:
+
+	 ======= ======================================
+	 -EFAULT Error reading the provided parameter
+		 address.
+	 -ENXIO  Attribute not supported (no constant TSC)
+	 ======= ======================================
+
+This read-only attribute reports the effective TSC and APIC bus timer
+frequencies as observed by the guest, after hardware TSC scaling is
+applied::
+
+  struct kvm_vcpu_tsc_effective_freq {
+	__u32 tsc_khz;
+	__u32 bus_khz;
+  };
+
+The tsc_khz field is the guest's effective TSC frequency in kHz. This
+may differ slightly from what userspace requested via KVM_SET_TSC_KHZ
+due to the granularity of hardware scaling and the host kernel's
+measurement of its own TSC frequency.
+
+The bus_khz field is the APIC bus timer frequency in kHz.
+
+Userspace can use these values to populate CPUID timing leaves for the
+guest, such as the generic timing leaf at 0x40000010 (EAX=tsc_khz,
+EBX=bus_khz) or hypervisor-specific equivalents.
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 384be9a53395..196899296f84 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -962,12 +962,18 @@ struct kvm_hyperv_eventfd {
 #define KVM_VCPU_TSC_CTRL 0 /* control group for the timestamp counter (TSC) */
 #define   KVM_VCPU_TSC_OFFSET 0 /* attribute for the TSC offset */
 #define   KVM_VCPU_TSC_SCALE  1 /* attribute for TSC scaling factor */
+#define   KVM_VCPU_TSC_EFFECTIVE_FREQ 2 /* attribute for effective frequencies */
 
 struct kvm_vcpu_tsc_scale {
 	__u64 tsc_ratio;
 	__u64 tsc_frac_bits;
 };
 
+struct kvm_vcpu_tsc_effective_freq {
+	__u32 tsc_khz;
+	__u32 bus_khz;
+};
+
 /* x86-specific KVM_EXIT_HYPERCALL flags. */
 #define KVM_EXIT_HYPERCALL_LONG_MODE	_BITULL(0)
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 77dfd4455a4e..c15303963686 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6079,6 +6079,9 @@ static int kvm_arch_tsc_has_attr(struct kvm_vcpu *vcpu,
 	case KVM_VCPU_TSC_SCALE:
 		r = kvm_caps.has_tsc_control ? 0 : -ENXIO;
 		break;
+	case KVM_VCPU_TSC_EFFECTIVE_FREQ:
+		r = boot_cpu_has(X86_FEATURE_CONSTANT_TSC) ? 0 : -ENXIO;
+		break;
 	default:
 		r = -ENXIO;
 	}
@@ -6115,6 +6118,25 @@ static int kvm_arch_tsc_get_attr(struct kvm_vcpu *vcpu,
 		r = 0;
 		break;
 	}
+	case KVM_VCPU_TSC_EFFECTIVE_FREQ: {
+		struct kvm_vcpu_tsc_effective_freq freq;
+
+		if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
+			r = -ENXIO;
+			break;
+		}
+
+		if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, vcpu))
+			kvm_guest_time_update(vcpu);
+
+		freq.tsc_khz = div_u64(vcpu->arch.hw_tsc_hz, 1000);
+		freq.bus_khz = 1000000 / vcpu->kvm->arch.apic_bus_cycle_ns;
+		r = -EFAULT;
+		if (copy_to_user(uaddr, &freq, sizeof(freq)))
+			break;
+		r = 0;
+		break;
+	}
 	default:
 		r = -ENXIO;
 	}
@@ -6155,6 +6177,7 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 		break;
 	}
 	case KVM_VCPU_TSC_SCALE:
+	case KVM_VCPU_TSC_EFFECTIVE_FREQ:
 		r = -EINVAL; /* Read only */
 		break;
 	default:
-- 
2.51.0


