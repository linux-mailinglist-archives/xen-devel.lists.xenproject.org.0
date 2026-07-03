Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1bPzBXkoSGpYnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:24:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D62705C99
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:24:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=Z7Au5hbq;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353907.1609702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMc-0008CP-Rd; Fri, 03 Jul 2026 21:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353907.1609702; Fri, 03 Jul 2026 21:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMc-00080t-65; Fri, 03 Jul 2026 21:23:58 +0000
Received: by outflank-mailman (input) for mailman id 1353907;
 Fri, 03 Jul 2026 21:23:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflMY-00078a-3q
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:23:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflMX-00A83n-GB; Fri, 03 Jul 2026 23:23:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482855-e002-0a2a0a5209dd-0a2a450295e8-10
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:53 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482868-5a27-0a2a45020019-5a9b5cc7c8dc-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:52 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKd-000000059Nz-0yD3; Fri, 03 Jul 2026 21:23:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKW-00000001ROL-0svz;
 Fri, 03 Jul 2026 22:21:48 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=3lUib/EIrL1+94Hfr3HOPm3NJZGT4m6/AxpXp3yQAbg=; b=Z7Au5hbqzBkr89WU5YG+ZPC5S9
	ySbJNMLzah02oxol8S6rfewycGcma4xQAxc/yMNJ1UwcfKW0RZDK3N+ZfzpwnX0cDbzjv5IEtb3XP
	BqmZyXcEoEi6mGeg4G6eowbPuwlNfZdOQ3/Bi5QFoSwkKPyjSnPkAGntNnwvwwDGqmSGfM+0tOfqP
	H7LdsJn0nbVCjmbDvgIm50n7FXL+ms0X6P1pPKn8r3p7vR1RPFZ7mfnTwaazlLdhUz077TRnX5ZbP
	eSFnpVBx/QIZTGoz7Uf4ekeKzPD87F7ACQm+Sjaqai+PI1jV9VHGP1Dq2P8ygLT7zgjTP15zci0gv
	RqcBJSrQ==;
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
Subject: [PATCH v6 09/36] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
Date: Fri,  3 Jul 2026 22:17:48 +0100
Message-ID: <20260703212145.343527-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-720697/1783113833-4E10A7C5-2A36E47B/0/0
X-purgate-type: clean
X-purgate-size: 24002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98D62705C99

From: David Woodhouse <dwmw@amazon.co.uk>

The documentation on TSC migration using KVM_VCPU_TSC_OFFSET is woefully
inadequate. It ignores TSC scaling, and ignores the fact that the host
TSC may differ from one host to the next (and in fact because of the way
the kernel calibrates it, it generally differs from one boot to the next
even on the same hardware).

Add KVM_VCPU_TSC_SCALE to extract the actual scale ratio and frac_bits,
and attempt to document the process that userspace needs to follow to
preserve the TSC across migration. Add a self test to function as an
exemplar.

Only enumerate KVM_VCPU_TSC_SCALE when kvm_caps.has_tsc_control is true,
since the scaling ratio is only meaningful when hardware TSC scaling is
supported.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 Documentation/virt/kvm/devices/vcpu.rst       | 120 ++++--
 arch/x86/include/uapi/asm/kvm.h               |   6 +
 arch/x86/kvm/x86.c                            |  21 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/pvclock_migration_test.c          | 383 ++++++++++++++++++
 5 files changed, 501 insertions(+), 30 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/pvclock_migration_test.c

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 5e3805820010..de9f58f75eb9 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -229,6 +229,7 @@ including the layout of the stolen time structure.
 :Architectures: x86
 
 4.1 ATTRIBUTE: KVM_VCPU_TSC_OFFSET
+----------------------------------
 
 :Parameters: 64-bit unsigned TSC offset
 
@@ -243,7 +244,10 @@ Returns:
 Specifies the guest's TSC offset relative to the host's TSC. The guest's
 TSC is then derived by the following equation:
 
-  guest_tsc = host_tsc + KVM_VCPU_TSC_OFFSET
+  guest_tsc = ((host_tsc * tsc_ratio) >> tsc_frac_bits) + KVM_VCPU_TSC_OFFSET
+
+The values of tsc_ratio and tsc_frac_bits can be obtained using
+the KVM_VCPU_TSC_SCALE attribute.
 
 This attribute is useful to adjust the guest's TSC on live migration,
 so that the TSC counts the time during which the VM was paused. The
@@ -251,44 +255,100 @@ following describes a possible algorithm to use for this purpose.
 
 From the source VMM process:
 
-1. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (tsc_src),
+1. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (host_tsc_src),
    kvmclock nanoseconds (guest_src), and host CLOCK_REALTIME nanoseconds
-   (host_src).
+   (time_src) at a given moment (Tsrc).
+
+2. For each vCPU[i]:
+
+   a. Read the KVM_VCPU_TSC_OFFSET attribute to record the guest TSC offset
+      (ofs_src[i]).
 
-2. Read the KVM_VCPU_TSC_OFFSET attribute for every vCPU to record the
-   guest TSC offset (ofs_src[i]).
+   b. Read the KVM_VCPU_TSC_SCALE attribute to record the guest TSC scaling
+      ratio (ratio_src[i], frac_bits_src[i]).
 
-3. Invoke the KVM_GET_TSC_KHZ ioctl to record the frequency of the
-   guest's TSC (freq).
+   c. Use host_tsc_src and the scaling/offset factors to calculate this
+      vCPU's TSC at time Tsrc:
+
+      tsc_src[i] = ((host_tsc_src * ratio_src[i]) >> frac_bits_src[i]) + ofs_src[i]
+
+3. Invoke the KVM_GET_CLOCK_GUEST ioctl on the boot vCPU to return the KVM
+   clock as a function of the guest TSC (pvti_src). (This ioctl may not
+   succeed if the host and guest TSCs are not consistent and well-behaved.)
 
 From the destination VMM process:
 
-4. Invoke the KVM_SET_CLOCK ioctl, providing the source nanoseconds from
-   kvmclock (guest_src) and CLOCK_REALTIME (host_src) in their respective
-   fields.  Ensure that the KVM_CLOCK_REALTIME flag is set in the provided
-   structure.
+4. Before creating the vCPUs, invoke the KVM_SET_TSC_KHZ ioctl on the VM, to
+   set the scaled frequency of the guest's TSC (freq).
+
+5. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (host_tsc_dst) and
+   host CLOCK_REALTIME nanoseconds (time_dst) at a given moment (Tdst).
+
+6. Calculate the number of nanoseconds elapsed between Tsrc and Tdst:
+
+   ΔT = time_dst - time_src
+
+7. As each vCPU[i] is created:
+
+   a. Read the KVM_VCPU_TSC_SCALE attribute to record the guest TSC scaling
+      ratio (ratio_dst[i], frac_bits_dst[i]).
+
+   b. Calculate the intended guest TSC value at time Tdst:
+
+      tsc_dst[i] = tsc_src[i] + (ΔT * freq[i])
 
-   KVM will advance the VM's kvmclock to account for elapsed time since
-   recording the clock values.  Note that this will cause problems in
-   the guest (e.g., timeouts) unless CLOCK_REALTIME is synchronized
-   between the source and destination, and a reasonably short time passes
-   between the source pausing the VMs and the destination executing
-   steps 4-7.
+   c. Use host_tsc_dst and the scaling factors to calculate this vCPU's
+      raw scaled TSC at time Tdst without offsetting:
+
+      raw_dst[i] = ((host_tsc_dst * ratio_dst[i]) >> frac_bits_dst[i])
+
+   d. Calculate ofs_dst[i] = tsc_dst[i] - raw_dst[i] and set the resulting
+      offset using the KVM_VCPU_TSC_OFFSET attribute.
+
+8. If pvti_src was provided, invoke the KVM_SET_CLOCK_GUEST ioctl on the boot
+   vCPU to restore the KVM clock as a precise function of the guest TSC.
+
+9. If KVM_SET_CLOCK_GUEST was not available or failed (e.g. because the
+   master clock is not active), fall back to the KVM_SET_CLOCK ioctl,
+   providing the source nanoseconds from kvmclock (guest_src) and
+   CLOCK_REALTIME (time_src) in their respective fields. Ensure that the
+   KVM_CLOCK_REALTIME flag is set in the provided structure.
+
+   KVM will restore the VM's kvmclock, accounting for elapsed time since
+   the clock values were recorded. Note that this will cause problems in
+   the guest (e.g., timeouts) unless CLOCK_REALTIME is synchronized between
+   the source and destination, and a reasonably short time passes between
+   the source pausing the VMs and the destination resuming them.
+   Due to the KVM_[SG]ET_CLOCK API using CLOCK_REALTIME instead of
+   CLOCK_TAI, leap seconds during the migration may also introduce errors.
+
+4.2 ATTRIBUTE: KVM_VCPU_TSC_SCALE
+---------------------------------
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
 
-5. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (tsc_dest) and
-   kvmclock nanoseconds (guest_dest).
+This read-only attribute reports the guest's TSC scaling factor, in the form
+of a fixed-point number represented by the following structure::
 
-6. Adjust the guest TSC offsets for every vCPU to account for (1) time
-   elapsed since recording state and (2) difference in TSCs between the
-   source and destination machine:
+  struct kvm_vcpu_tsc_scale {
+	__u64 tsc_ratio;
+	__u64 tsc_frac_bits;
+  };
 
-   ofs_dst[i] = ofs_src[i] -
-     (guest_src - guest_dest) * freq +
-     (tsc_src - tsc_dest)
+The tsc_frac_bits field indicates the location of the fixed point, such that
+host TSC values are converted to guest TSC using the formula:
 
-   ("ofs[i] + tsc - guest * freq" is the guest TSC value corresponding to
-   a time of 0 in kvmclock.  The above formula ensures that it is the
-   same on the destination as it was on the source).
+  guest_tsc = ((host_tsc * tsc_ratio) >> tsc_frac_bits) + offset
 
-7. Write the KVM_VCPU_TSC_OFFSET attribute for every vCPU with the
-   respective value derived in the previous step.
+Userspace can use this to precisely calculate the guest TSC from the host
+TSC at any given moment. This is needed for accurate migration of guests,
+as described in the documentation for the KVM_VCPU_TSC_OFFSET attribute.
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 5f4a66b1662a..fb38486ff742 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -962,6 +962,12 @@ struct kvm_hyperv_eventfd {
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
index 2039bd8518fb..26b4649dfb94 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5935,6 +5935,9 @@ static int kvm_arch_tsc_has_attr(struct kvm_vcpu *vcpu,
 	case KVM_VCPU_TSC_OFFSET:
 		r = 0;
 		break;
+	case KVM_VCPU_TSC_SCALE:
+		r = kvm_caps.has_tsc_control ? 0 : -ENXIO;
+		break;
 	default:
 		r = -ENXIO;
 	}
@@ -5955,6 +5958,21 @@ static int kvm_arch_tsc_get_attr(struct kvm_vcpu *vcpu,
 			break;
 		r = 0;
 		break;
+	case KVM_VCPU_TSC_SCALE: {
+		struct kvm_vcpu_tsc_scale scale;
+
+		r = -ENXIO;
+		if (!kvm_caps.has_tsc_control)
+			break;
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
@@ -5994,6 +6012,9 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 		r = 0;
 		break;
 	}
+	case KVM_VCPU_TSC_SCALE:
+		r = kvm_caps.has_tsc_control ? -EINVAL : -ENXIO;
+		break;
 	default:
 		r = -ENXIO;
 	}
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index fb935ae3bf38..90568ab631d7 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -106,6 +106,7 @@ TEST_GEN_PROGS_x86 += x86/pmu_event_filter_test
 TEST_GEN_PROGS_x86 += x86/private_mem_conversions_test
 TEST_GEN_PROGS_x86 += x86/private_mem_kvm_exits_test
 TEST_GEN_PROGS_x86 += x86/pvclock_test
+TEST_GEN_PROGS_x86 += x86/pvclock_migration_test
 TEST_GEN_PROGS_x86 += x86/set_boot_cpu_id
 TEST_GEN_PROGS_x86 += x86/set_sregs_test
 TEST_GEN_PROGS_x86 += x86/smaller_maxphyaddr_emulation_test
diff --git a/tools/testing/selftests/kvm/x86/pvclock_migration_test.c b/tools/testing/selftests/kvm/x86/pvclock_migration_test.c
new file mode 100644
index 000000000000..3b675827aec3
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/pvclock_migration_test.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test KVM clock precision across simulated live migration.
+ *
+ * Verifies that the documented TSC migration procedure (using
+ * KVM_VCPU_TSC_OFFSET, KVM_VCPU_TSC_SCALE, KVM_GET_CLOCK, and
+ * KVM_SET_CLOCK_GUEST) preserves the kvmclock's relationship to
+ * CLOCK_MONOTONIC_RAW.
+ *
+ * The test:
+ * 1. Creates a VM, runs the guest to enable kvmclock
+ * 2. Does a PTP-like ABA measurement of kvmclock vs CLOCK_MONOTONIC_RAW
+ * 3. Follows the documented migration procedure (same host, 1s pause)
+ * 4. Does the same ABA measurement on the destination VM
+ * 5. Verifies the kvmclock-vs-monotonic delta is preserved
+ */
+#include <inttypes.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+
+#include <asm/pvclock-abi.h>
+
+#define KVMCLOCK_GPA	0xc0000000ULL
+
+static void guest_code(void)
+{
+	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, KVMCLOCK_GPA | 1);
+	GUEST_SYNC(0);
+	GUEST_SYNC(1);
+}
+
+static uint64_t read_kvmclock_ns(struct kvm_vm *vm)
+{
+	struct kvm_clock_data data = {};
+
+	vm_ioctl(vm, KVM_GET_CLOCK, &data);
+	return data.clock;
+}
+
+static uint64_t pvclock_read_cycles(struct pvclock_vcpu_time_info *src,
+				    uint64_t tsc)
+{
+	uint64_t delta = tsc - src->tsc_timestamp;
+	uint64_t ns;
+
+	if (src->tsc_shift >= 0)
+		delta <<= src->tsc_shift;
+	else
+		delta >>= -(int32_t)src->tsc_shift;
+
+	ns = (unsigned __int128)delta * src->tsc_to_system_mul >> 32;
+	return src->system_time + ns;
+}
+
+/*
+ * ABA measurement: read CLOCK_MONOTONIC_RAW, kvmclock, CLOCK_MONOTONIC_RAW.
+ * Repeat 3 times, keep the reading with the smallest spread.
+ */
+static void aba_reading(struct kvm_vm *vm, uint64_t *lo, uint64_t *kvm_ns,
+			uint64_t *hi)
+{
+	uint64_t best_spread = UINT64_MAX;
+	int i;
+
+	for (i = 0; i < 3; i++) {
+		struct timespec ts1, ts2;
+		uint64_t m1, m2, clk;
+
+		clock_gettime(CLOCK_MONOTONIC_RAW, &ts1);
+		clk = read_kvmclock_ns(vm);
+		clock_gettime(CLOCK_MONOTONIC_RAW, &ts2);
+
+		m1 = ts1.tv_sec * 1000000000ULL + ts1.tv_nsec;
+		m2 = ts2.tv_sec * 1000000000ULL + ts2.tv_nsec;
+
+		if (m2 - m1 < best_spread) {
+			best_spread = m2 - m1;
+			*lo = m1;
+			*kvm_ns = clk;
+			*hi = m2;
+		}
+	}
+}
+
+static struct kvm_vm *create_vm(struct kvm_vcpu **vcpu)
+{
+	struct kvm_vm *vm = vm_create_with_one_vcpu(vcpu, guest_code);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    KVMCLOCK_GPA, 1, 1, 0);
+	virt_map(vm, KVMCLOCK_GPA, KVMCLOCK_GPA, 1);
+	return vm;
+}
+
+int main(void)
+{
+	struct pvclock_vcpu_time_info pvti_src;
+	struct kvm_clock_data clock_src, clock_dst;
+	struct kvm_vcpu_tsc_scale scale_src, scale_dst;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	uint64_t mono_before, kvm_before, kvm_after;
+	int64_t delta_before;
+	uint64_t ofs_src, tsc_src, tsc_dst, raw_dst, ofs_dst;
+	uint64_t host_tsc_src, host_tsc_dst;
+	uint64_t time_src, time_dst;
+	int64_t delta_t;
+	uint32_t freq_khz = 1500000; /* 1.5 GHz — forces TSC scaling */
+	int ret;
+
+	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
+
+	/* === SOURCE SIDE === */
+	pr_info("=== Source VM ===\n");
+	vm = create_vm(&vcpu);
+
+	/* Set guest TSC frequency (may trigger scaling) */
+	vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *)(unsigned long)freq_khz);
+
+	/* Run guest to enable kvmclock */
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+
+	/* ABA measurement: kvmclock vs CLOCK_MONOTONIC_RAW */
+	uint64_t src_mono_lo, src_mono_hi;
+	aba_reading(vm, &src_mono_lo, &kvm_before, &src_mono_hi);
+	mono_before = (src_mono_lo + src_mono_hi) / 2;
+	delta_before = (int64_t)(kvm_before - mono_before);
+	pr_info("  kvmclock - MONOTONIC_RAW = %" PRId64 " ns (±%" PRIu64 " ns)\n",
+		delta_before, (src_mono_hi - src_mono_lo) / 2);
+
+	/* Step 1: KVM_GET_CLOCK for atomic {host_tsc, realtime} */
+	memset(&clock_src, 0, sizeof(clock_src));
+	clock_src.flags = KVM_CLOCK_REALTIME;
+	vm_ioctl(vm, KVM_GET_CLOCK, &clock_src);
+	host_tsc_src = clock_src.host_tsc;
+	time_src = clock_src.realtime;
+
+	/* Step 2: Save TSC offset and scale */
+	{
+		struct kvm_device_attr attr = {
+			.group = KVM_VCPU_TSC_CTRL,
+			.attr = KVM_VCPU_TSC_OFFSET,
+			.addr = (uint64_t)(uintptr_t)&ofs_src,
+		};
+		vcpu_ioctl(vcpu, KVM_GET_DEVICE_ATTR, &attr);
+	}
+	{
+		struct kvm_device_attr attr = {
+			.group = KVM_VCPU_TSC_CTRL,
+			.attr = KVM_VCPU_TSC_SCALE,
+			.addr = (uint64_t)(uintptr_t)&scale_src,
+		};
+		memset(&scale_src, 0, sizeof(scale_src));
+		__vcpu_ioctl(vcpu, KVM_GET_DEVICE_ATTR, &attr);
+	}
+
+	/* Compute guest TSC at Tsrc */
+	if (scale_src.tsc_frac_bits)
+		tsc_src = ((unsigned __int128)host_tsc_src * scale_src.tsc_ratio
+			   >> scale_src.tsc_frac_bits) + ofs_src;
+	else
+		tsc_src = host_tsc_src + ofs_src;
+
+	/* Step 3: KVM_GET_CLOCK_GUEST */
+	ret = __vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, &pvti_src);
+	TEST_ASSERT(!ret, "KVM_GET_CLOCK_GUEST failed");
+
+	pr_info("  TSC freq=%u kHz, offset=%" PRId64 "\n", freq_khz, (int64_t)ofs_src);
+
+	kvm_vm_release(vm);
+
+	/* === PAUSE (simulate migration) === */
+	pr_info("=== Pausing 1 second ===\n");
+	sleep(1);
+
+	/* === DESTINATION SIDE === */
+	pr_info("=== Destination VM ===\n");
+	vm = create_vm(&vcpu);
+
+	/* Step 4: KVM_SET_TSC_KHZ */
+	vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *)(unsigned long)freq_khz);
+
+	/* Step 5: KVM_GET_CLOCK for atomic {host_tsc, realtime} pair.
+	 * Master clock is active from vCPU creation.
+	 */
+	memset(&clock_dst, 0, sizeof(clock_dst));
+	vm_ioctl(vm, KVM_GET_CLOCK, &clock_dst);
+	host_tsc_dst = clock_dst.host_tsc;
+	time_dst = clock_dst.realtime;
+
+	/* Step 6: ΔT */
+	delta_t = (int64_t)(time_dst - time_src);
+
+	/* Step 7: Compute destination offset */
+	{
+		struct kvm_device_attr attr = {
+			.group = KVM_VCPU_TSC_CTRL,
+			.attr = KVM_VCPU_TSC_SCALE,
+			.addr = (uint64_t)(uintptr_t)&scale_dst,
+		};
+		memset(&scale_dst, 0, sizeof(scale_dst));
+		__vcpu_ioctl(vcpu, KVM_GET_DEVICE_ATTR, &attr);
+	}
+
+	tsc_dst = tsc_src + (uint64_t)((int64_t)freq_khz * delta_t / 1000000LL);
+
+	if (scale_dst.tsc_frac_bits)
+		raw_dst = (unsigned __int128)host_tsc_dst * scale_dst.tsc_ratio
+			  >> scale_dst.tsc_frac_bits;
+	else
+		raw_dst = host_tsc_dst;
+
+	ofs_dst = tsc_dst - raw_dst;
+
+	/*
+	 * The TSC offset delta introduced by using CLOCK_REALTIME to
+	 * estimate elapsed time. On same host, the correct offset is
+	 * ofs_src; the difference is the CLOCK_REALTIME-vs-TSC error.
+	 */
+	int64_t tsc_ofs_delta = (int64_t)(ofs_dst - ofs_src);
+	int64_t tsc_ofs_delta_ns = tsc_ofs_delta * 1000000LL / freq_khz;
+	pr_info("  Destination TSC offset=%" PRId64
+		", imprecision from CLOCK_REALTIME: %" PRId64 " cycles = %"
+		PRId64 " ns\n", (int64_t)ofs_dst, tsc_ofs_delta, tsc_ofs_delta_ns);
+
+	/* Set TSC offset */
+	{
+		struct kvm_device_attr attr = {
+			.group = KVM_VCPU_TSC_CTRL,
+			.attr = KVM_VCPU_TSC_OFFSET,
+			.addr = (uint64_t)(uintptr_t)&ofs_dst,
+		};
+		vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &attr);
+	}
+
+	/* Step 8: KVM_SET_CLOCK_GUEST */
+	ret = __vcpu_ioctl(vcpu, KVM_SET_CLOCK_GUEST, &pvti_src);
+	TEST_ASSERT(!ret, "KVM_SET_CLOCK_GUEST failed: errno %d", errno);
+
+	/* Run guest to update pvclock page on destination */
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+
+	/* ABA measurement on destination */
+	uint64_t mono_lo, mono_hi;
+	aba_reading(vm, &mono_lo, &kvm_after, &mono_hi);
+
+	/*
+	 * The kvmclock is tied to the guest TSC via SET_CLOCK_GUEST.
+	 * The guest TSC is offset from the correct value by tsc_ofs_delta_ns
+	 * (due to CLOCK_REALTIME imprecision). So the kvmclock should be
+	 * offset from CLOCK_MONOTONIC_RAW by exactly:
+	 *   (original delta) + tsc_ofs_delta_ns
+	 *
+	 * The "original delta" has uncertainty from the source ABA spread,
+	 * and the measurement has uncertainty from the destination ABA spread.
+	 * Verify the expected value falls within the combined bounds.
+	 */
+	int64_t delta_before_lo = (int64_t)(kvm_before - src_mono_hi);
+	int64_t delta_before_hi = (int64_t)(kvm_before - src_mono_lo);
+	int64_t expected_lo = delta_before_lo + tsc_ofs_delta_ns;
+	int64_t expected_hi = delta_before_hi + tsc_ofs_delta_ns;
+	int64_t actual_lo = (int64_t)(kvm_after - mono_hi);
+	int64_t actual_hi = (int64_t)(kvm_after - mono_lo);
+
+	/* Show the shift relative to the source measurement */
+	int64_t expected_mid = tsc_ofs_delta_ns;
+	int64_t expected_err = (int64_t)(src_mono_hi - src_mono_lo) / 2;
+	int64_t actual_mid = ((actual_lo + actual_hi) / 2) - delta_before;
+	int64_t actual_err = (int64_t)(mono_hi - mono_lo) / 2;
+	pr_info("  kvmclock-mono shift: expected %" PRId64 " ns (±%" PRId64
+		"), measured %" PRId64 " ns (±%" PRId64 ")\n",
+		expected_mid, expected_err, actual_mid, actual_err);
+
+	/* The ranges must overlap */
+	TEST_ASSERT(expected_hi >= actual_lo && expected_lo <= actual_hi,
+		    "Ranges don't overlap: expected [%" PRId64 ", %" PRId64
+		    "] measured [%" PRId64 ", %" PRId64 "]",
+		    expected_lo, expected_hi, actual_lo, actual_hi);
+
+	/*
+	 * Direct pvclock verification: read the destination pvclock page
+	 * and verify that computing kvmclock from pvti_src and pvti_dst
+	 * at the same guest TSC gives the same result.
+	 *
+	 * Get an atomic {host_tsc, kvmclock} pair, scale host_tsc to
+	 * guest TSC using KVM_VCPU_TSC_SCALE, then compute kvmclock
+	 * from both pvclock structs.
+	 */
+	struct kvm_clock_data clock_now = {};
+	vm_ioctl(vm, KVM_GET_CLOCK, &clock_now);
+
+	struct pvclock_vcpu_time_info *pvti_dst = addr_gpa2hva(vm, KVMCLOCK_GPA);
+	uint64_t host_tsc_now = clock_now.host_tsc;
+	uint64_t guest_tsc_now;
+
+	if (scale_dst.tsc_frac_bits)
+		guest_tsc_now = ((unsigned __int128)host_tsc_now *
+				 scale_dst.tsc_ratio >> scale_dst.tsc_frac_bits)
+				+ ofs_dst;
+	else
+		guest_tsc_now = host_tsc_now + ofs_dst;
+
+	uint64_t clk_from_src = pvclock_read_cycles(&pvti_src, guest_tsc_now);
+	uint64_t clk_from_dst = pvclock_read_cycles(pvti_dst, guest_tsc_now);
+	int64_t pvclock_delta = (int64_t)(clk_from_src - clk_from_dst);
+
+	pr_info("  Pvclock direct: src=%" PRIu64 " dst=%" PRIu64
+		" delta=%" PRId64 " ns\n", clk_from_src, clk_from_dst, pvclock_delta);
+	pr_info("  KVM_GET_CLOCK:  %" PRIu64 " ns\n", (uint64_t)clock_now.clock);
+
+	TEST_ASSERT(pvclock_delta >= -2 && pvclock_delta <= 2,
+		    "pvclock src vs dst disagree by %" PRId64 " ns", pvclock_delta);
+
+	/*
+	 * Tight ABA: compare pvclock_read() directly (no ioctl) against
+	 * CLOCK_MONOTONIC_RAW. The spread should be much smaller since
+	 * there's no syscall between the two clock_gettime calls — just
+	 * rdtsc + userspace mul/shift.
+	 */
+	uint64_t tight_mono_lo = 0, tight_mono_hi = 0, tight_kvm = 0;
+	uint64_t tight_best_spread = UINT64_MAX;
+	for (int i = 0; i < 3; i++) {
+		struct timespec ts1, ts2;
+		uint64_t m1, m2, tsc, clk;
+
+		clock_gettime(CLOCK_MONOTONIC_RAW, &ts1);
+		tsc = rdtsc();
+		clock_gettime(CLOCK_MONOTONIC_RAW, &ts2);
+
+		m1 = ts1.tv_sec * 1000000000ULL + ts1.tv_nsec;
+		m2 = ts2.tv_sec * 1000000000ULL + ts2.tv_nsec;
+
+		/* Scale host TSC to guest TSC */
+		if (scale_dst.tsc_frac_bits)
+			tsc = ((unsigned __int128)tsc * scale_dst.tsc_ratio
+			       >> scale_dst.tsc_frac_bits) + ofs_dst;
+		else
+			tsc += ofs_dst;
+
+		clk = pvclock_read_cycles(pvti_dst, tsc);
+
+		if (m2 - m1 < tight_best_spread) {
+			tight_best_spread = m2 - m1;
+			tight_mono_lo = m1;
+			tight_mono_hi = m2;
+			tight_kvm = clk;
+		}
+	}
+	pr_info("  Tight ABA spread: %" PRIu64 " ns (best of 3)\n", tight_best_spread);
+
+	int64_t tight_expected_lo = delta_before_lo + tsc_ofs_delta_ns;
+	int64_t tight_expected_hi = delta_before_hi + tsc_ofs_delta_ns;
+	int64_t tight_actual_lo = (int64_t)(tight_kvm - tight_mono_hi);
+	int64_t tight_actual_hi = (int64_t)(tight_kvm - tight_mono_lo);
+	int64_t tight_actual_mid = ((tight_actual_lo + tight_actual_hi) / 2) - delta_before;
+	int64_t tight_actual_err = (int64_t)(tight_mono_hi - tight_mono_lo) / 2;
+
+	pr_info("  Tight kvmclock-mono shift: expected %" PRId64
+		" ns (±%" PRId64 "), measured %" PRId64 " ns (±%" PRId64 ")\n",
+		expected_mid, expected_err, tight_actual_mid, tight_actual_err);
+
+	TEST_ASSERT(tight_expected_hi >= tight_actual_lo &&
+		    tight_expected_lo <= tight_actual_hi,
+		    "Tight ABA ranges don't overlap");
+
+	kvm_vm_release(vm);
+	pr_info("PASS: kvmclock offset matches TSC delta from CLOCK_REALTIME"
+		" (%" PRId64 " ns) within ABA bounds\n", tsc_ofs_delta_ns);
+	return 0;
+}
-- 
2.54.0


