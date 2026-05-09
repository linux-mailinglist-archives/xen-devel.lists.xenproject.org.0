Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G3mMdq6/2mm9wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:53:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BB501D9E
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305123.1577832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXh-0008Ca-MP; Sat, 09 May 2026 22:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305123.1577832; Sat, 09 May 2026 22:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXh-000835-0a; Sat, 09 May 2026 22:53:05 +0000
Received: by outflank-mailman (input) for mailman id 1305123;
 Sat, 09 May 2026 22:53:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wLqXe-0007k5-CC
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:53:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqXd-00AYGp-P8; Sun, 10 May 2026 00:53:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffba0e-5cb7-0a2a0a5109dd-0a2a450cd954-24
 for <multiple-recipients>; Sun, 10 May 2026 00:53:01 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb9dc-62f1-0a2a450c0019-5a9b5cc7e912-3
 for <multiple-recipients>; Sun, 10 May 2026 00:49:00 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-00000008wzA-0Oe2; Sat, 09 May 2026 22:48:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTC-0000000DhHh-1YLk;
 Sat, 09 May 2026 23:48:26 +0100
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=dFbbY5OtZVYUw6Qy5tHS1aKoaYMuSOyj4x77iW34VYE=; b=SE6rkQzNLq7L4CqMdEC8BZZ0P6
	EjpyYbZKK7v43rP/AeQVjSCbX4CyqL7SJgHZ4T2fJwadBOsjBMNWV4O9xztFhbc8UcA+mg4CVAeM/
	pF/f/hHOOeWQWkfR1yJ2MttlyGrwYzwM8Us9usfEsF/GJA5jH2cvu8IwGenT2kPZ0o39/N1dT+CvY
	nxohuJurpY0cff1GFCz0rJ1gt7T7yFG3MUVg02Quc5oH80soyrmI4lVS78+lhGlGprjcpiGEuprPs
	JbtHdqIH9/IguEaANVzJe00VtBFhZaDJfm4NidetUasrra5NgYbGP82uPUI+FCBzQ8t4ujGxOn5Cs
	38tbJYDw==;
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
Subject: [PATCH v4 07/30] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
Date: Sat,  9 May 2026 23:46:33 +0100
Message-ID: <20260509224824.3264567-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1778366940-F4E78CF5-1807B8E8/13/0
X-purgate-type: clean
X-purgate-size: 4939
X-Rspamd-Queue-Id: 804BB501D9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,infradead.org:mid,infradead.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:email];
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

The documentation on TSC migration using KVM_VCPU_TSC_OFFSET is woefully
inadequate. It ignores TSC scaling, and ignores the fact that the host
TSC may differ from one host to the next (and in fact because of the way
the kernel calibrates it, it generally differs from one boot to the next
even on the same hardware).

Add KVM_VCPU_TSC_SCALE to extract the actual scale ratio and frac_bits,
and attempt to document the process that userspace needs to follow to
preserve the TSC across migration.

Only enumerate KVM_VCPU_TSC_SCALE when kvm_caps.has_tsc_control is true,
since the scaling ratio is only meaningful when hardware TSC scaling is
supported.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 Documentation/virt/kvm/devices/vcpu.rst | 36 ++++++++++++++++++++++++-
 arch/x86/include/uapi/asm/kvm.h         |  6 +++++
 arch/x86/kvm/x86.c                      | 22 +++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 5e3805820010..56562b932280 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -243,7 +243,10 @@ Returns:
 Specifies the guest's TSC offset relative to the host's TSC. The guest's
 TSC is then derived by the following equation:
 
-  guest_tsc = host_tsc + KVM_VCPU_TSC_OFFSET
+  guest_tsc = ((host_tsc * tsc_scale_ratio) >> tsc_scale_bits) + KVM_VCPU_TSC_OFFSET
+
+The values of tsc_scale_ratio and tsc_scale_bits can be obtained using
+the KVM_VCPU_TSC_SCALE attribute.
 
 This attribute is useful to adjust the guest's TSC on live migration,
 so that the TSC counts the time during which the VM was paused. The
@@ -292,3 +295,34 @@ From the destination VMM process:
 
 7. Write the KVM_VCPU_TSC_OFFSET attribute for every vCPU with the
    respective value derived in the previous step.
+
+4.2 ATTRIBUTE: KVM_VCPU_TSC_SCALE
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+:Parameters: struct kvm_vcpu_tsc_scale
+
+Returns:
+
+	 ======= ======================================
+	 -EFAULT Error reading the provided parameter
+		 address.
+	 -ENXIO  Attribute not supported (no TSC scaling)
+	 -EINVAL Invalid request to write the attribute
+	 ======= ======================================
+
+This read-only attribute reports the guest's TSC scaling factor, in the form
+of a fixed-point number represented by the following structure::
+
+  struct kvm_vcpu_tsc_scale {
+	__u64 tsc_ratio;
+	__u64 tsc_frac_bits;
+  };
+
+The tsc_frac_bits field indicates the location of the fixed point, such that
+host TSC values are converted to guest TSC using the formula:
+
+  guest_tsc = ((host_tsc * tsc_ratio) >> tsc_frac_bits) + offset
+
+Userspace can use this to precisely calculate the guest TSC from the host
+TSC at any given moment. This is needed for accurate migration of guests,
+as described in the documentation for the KVM_VCPU_TSC_OFFSET attribute.
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 5f2b30d0405c..384be9a53395 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -961,6 +961,12 @@ struct kvm_hyperv_eventfd {
 /* for KVM_{GET,SET,HAS}_DEVICE_ATTR */
 #define KVM_VCPU_TSC_CTRL 0 /* control group for the timestamp counter (TSC) */
 #define   KVM_VCPU_TSC_OFFSET 0 /* attribute for the TSC offset */
+#define   KVM_VCPU_TSC_SCALE  1 /* attribute for TSC scaling factor */
+
+struct kvm_vcpu_tsc_scale {
+	__u64 tsc_ratio;
+	__u64 tsc_frac_bits;
+};
 
 /* x86-specific KVM_EXIT_HYPERCALL flags. */
 #define KVM_EXIT_HYPERCALL_LONG_MODE	_BITULL(0)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d1327d5fba3f..2179ea2da8e0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5930,6 +5930,9 @@ static int kvm_arch_tsc_has_attr(struct kvm_vcpu *vcpu,
 	case KVM_VCPU_TSC_OFFSET:
 		r = 0;
 		break;
+	case KVM_VCPU_TSC_SCALE:
+		r = kvm_caps.has_tsc_control ? 0 : -ENXIO;
+		break;
 	default:
 		r = -ENXIO;
 	}
@@ -5950,6 +5953,22 @@ static int kvm_arch_tsc_get_attr(struct kvm_vcpu *vcpu,
 			break;
 		r = 0;
 		break;
+	case KVM_VCPU_TSC_SCALE: {
+		struct kvm_vcpu_tsc_scale scale;
+
+		if (!kvm_caps.has_tsc_control) {
+			r = -ENXIO;
+			break;
+		}
+
+		scale.tsc_ratio = vcpu->arch.l1_tsc_scaling_ratio;
+		scale.tsc_frac_bits = kvm_caps.tsc_scaling_ratio_frac_bits;
+		r = -EFAULT;
+		if (copy_to_user(uaddr, &scale, sizeof(scale)))
+			break;
+		r = 0;
+		break;
+	}
 	default:
 		r = -ENXIO;
 	}
@@ -5989,6 +6008,9 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 		r = 0;
 		break;
 	}
+	case KVM_VCPU_TSC_SCALE:
+		r = -EINVAL; /* Read only */
+		break;
 	default:
 		r = -ENXIO;
 	}
-- 
2.51.0


