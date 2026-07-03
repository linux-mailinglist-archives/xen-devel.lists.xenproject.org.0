Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C/j6ESIoSGodnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB44705BD5
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=PpxWMrvM;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353752.1609465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKn-0005QY-S6; Fri, 03 Jul 2026 21:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353752.1609465; Fri, 03 Jul 2026 21:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKn-0005Me-L6; Fri, 03 Jul 2026 21:22:05 +0000
Received: by outflank-mailman (input) for mailman id 1353752;
 Fri, 03 Jul 2026 21:22:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wflKl-00051M-OQ
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:22:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflKj-00A7vt-4i; Fri, 03 Jul 2026 23:22:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827a3-e002-0a2a0a5209dd-0a2a4507d220-22
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:01 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827f7-9c8e-0a2a45070019-5a9b3222db84-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:00 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wflKX-0000000AsYJ-27pF; Fri, 03 Jul 2026 21:21:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKX-00000001RPj-1hBl;
 Fri, 03 Jul 2026 22:21:49 +0100
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
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=dcChYx15IhyePM7jxxFL8xpvT1sezeCblvUhAhYmoTc=; b=PpxWMrvMWWKNxttwja7nHYJHNJ
	Tdw+PzgGZjwODRY98hW5BR+tAtE89GRECyXkUmSTeJX1rBty2kcY8W+58CRVlWYk4Bz4l41ihaFha
	g01FYDjNMOh8OKhpw6xaihQ43pPDg704uo3EVd3bW5xMlHRGXnL0d+Hffs2+SQF+WpgWeEp7CgGs1
	Qbg3PriQlFgedyBXaFLnwXicyc7Ph84YMeMxmkCegXoq2LTS4hfbXFUPjEA8KQWIbUH+wERqoWG49
	xsrw3fT911L0O1Vdx4DtSCpxTgfx6KSV+Kg3+Gl0SH6biyYxrIIAOSM8tCTHByHs82tPXLS5Knk8Y
	1/TJPGTg==;
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
Subject: [PATCH v6 29/36] KVM: selftests: Add Xen/generic CPUID timing leaf test
Date: Fri,  3 Jul 2026 22:18:08 +0100
Message-ID: <20260703212145.343527-30-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ef75cf/1783113721-FD52025E-D8802687/0/0
X-purgate-type: clean
X-purgate-size: 8822
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,amazon.co.uk:email];
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
X-Rspamd-Queue-Id: EAB44705BD5

From: David Woodhouse <dwmw@amazon.co.uk>

Verify that userspace can correctly populate Xen and generic CPUID
timing leaves using the KVM_VCPU_TSC_SCALE and
KVM_VCPU_TSC_SCALE attributes.

This validates that the removal of KVM's runtime Xen CPUID modification
doesn't break guests: userspace queries the effective TSC and bus
frequencies, computes the pvclock mul/shift, populates the CPUID leaves,
and the guest verifies the values match.

The test exercises:
 - KVM_VCPU_TSC_SCALE at native and scaled frequencies
 - KVM_VCPU_TSC_SCALE ratio verification against effective frequency
 - Generic timing leaf 0x40000010 (EAX=tsc_khz, EBX=bus_khz)
 - Xen leaf 3 sub-leaf 0 (ECX=guest TSC kHz)
 - Xen leaf 3 sub-leaf 1 (ECX=mul, EDX=shift)

Gracefully skips TSC scaling tests on hardware without support.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/x86/xen_cpuid_timing_test.c | 230 ++++++++++++++++++
 2 files changed, 231 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/xen_cpuid_timing_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 7ecaaf82056e..58aac2980cdf 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -141,6 +141,7 @@ TEST_GEN_PROGS_x86 += x86/xss_msr_test
 TEST_GEN_PROGS_x86 += x86/debug_regs
 TEST_GEN_PROGS_x86 += x86/tsc_msrs_test
 TEST_GEN_PROGS_x86 += x86/vmx_pmu_caps_test
+TEST_GEN_PROGS_x86 += x86/xen_cpuid_timing_test
 TEST_GEN_PROGS_x86 += x86/xen_shinfo_test
 TEST_GEN_PROGS_x86 += x86/xen_vmcall_test
 TEST_GEN_PROGS_x86 += x86/sev_init2_tests
diff --git a/tools/testing/selftests/kvm/x86/xen_cpuid_timing_test.c b/tools/testing/selftests/kvm/x86/xen_cpuid_timing_test.c
new file mode 100644
index 000000000000..2098cb511ef0
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/xen_cpuid_timing_test.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test that userspace can correctly populate Xen and generic CPUID
+ * timing leaves using KVM_GET_TSC_KHZ and KVM_VCPU_TSC_SCALE.
+ *
+ * This validates that the removal of KVM's runtime Xen CPUID modification
+ * doesn't break guests, because userspace has all the information needed.
+ */
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+
+#include <asm/pvclock-abi.h>
+
+#define XEN_CPUID_BASE		0x40000100
+#define XEN_CPUID_LEAF(n)	(XEN_CPUID_BASE + (n))
+#define GENERIC_TIMING_LEAF	0x40000010
+
+/* Values set by host, verified by guest */
+static uint32_t expected_tsc_khz;
+static uint32_t expected_bus_khz;
+static uint32_t expected_tsc_mul;
+static int8_t   expected_tsc_shift;
+static uint64_t host_khz;
+
+static void guest_code(void)
+{
+	uint32_t eax, ebx, ecx, edx;
+
+	/* Check generic timing leaf 0x40000010 */
+	__cpuid(GENERIC_TIMING_LEAF, 0, &eax, &ebx, &ecx, &edx);
+	GUEST_ASSERT_EQ(eax, expected_tsc_khz);
+	GUEST_ASSERT_EQ(ebx, expected_bus_khz);
+
+	/* Check Xen leaf 3, sub-leaf 0: ECX = guest TSC frequency */
+	__cpuid(XEN_CPUID_LEAF(3), 0, &eax, &ebx, &ecx, &edx);
+	GUEST_ASSERT_EQ(ecx, expected_tsc_khz);
+
+	/* Check Xen leaf 3, sub-leaf 1: ECX = mul, EDX = shift */
+	__cpuid(XEN_CPUID_LEAF(3), 1, &eax, &ebx, &ecx, &edx);
+	GUEST_ASSERT_EQ(ecx, expected_tsc_mul);
+	GUEST_ASSERT_EQ((int8_t)edx, expected_tsc_shift);
+
+	GUEST_SYNC(0);
+}
+
+static void add_cpuid_entry(struct kvm_vcpu *vcpu, uint32_t function,
+			    uint32_t index, uint32_t eax, uint32_t ebx,
+			    uint32_t ecx, uint32_t edx)
+{
+	struct kvm_cpuid2 *cpuid = vcpu->cpuid;
+	struct kvm_cpuid_entry2 *entry;
+	int n = cpuid->nent;
+
+	vcpu->cpuid = realloc(vcpu->cpuid,
+			      sizeof(*cpuid) + (n + 1) * sizeof(*entry));
+	cpuid = vcpu->cpuid;
+	cpuid->nent = n + 1;
+
+	entry = &cpuid->entries[n];
+	memset(entry, 0, sizeof(*entry));
+	entry->function = function;
+	entry->index = index;
+	entry->flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+	entry->eax = eax;
+	entry->ebx = ebx;
+	entry->ecx = ecx;
+	entry->edx = edx;
+}
+
+/*
+ * Compute pvclock mul/shift from frequency, matching kvm_get_time_scale().
+ */
+static void compute_tsc_mul_shift(uint64_t tsc_hz, uint32_t *mul, int8_t *shift)
+{
+	uint64_t scaled = 1000000000ULL;
+	uint64_t base = tsc_hz;
+	int32_t s = 0;
+	uint32_t base32;
+
+	while (base > scaled * 2 || base >> 32) {
+		base >>= 1;
+		s--;
+	}
+	base32 = (uint32_t)base;
+	while (base32 <= scaled || scaled >> 32) {
+		if (scaled >> 32 || base32 & (1U << 31))
+			scaled >>= 1;
+		else
+			base32 <<= 1;
+		s++;
+	}
+	*mul = (uint32_t)((scaled << 32) / base32);
+	*shift = (int8_t)s;
+}
+
+static void run_test(uint64_t tsc_khz)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	uint32_t effective_tsc_khz, effective_bus_khz;
+	int bus_cycle_ns;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	if (tsc_khz) {
+		pr_info("Testing at TSC frequency %lu kHz\n", tsc_khz);
+		vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *)(unsigned long)tsc_khz);
+	} else {
+		pr_info("Testing at native TSC frequency\n");
+	}
+
+	effective_tsc_khz = __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
+	bus_cycle_ns = vm_check_cap(vm, KVM_CAP_X86_APIC_BUS_CYCLES_NS);
+	effective_bus_khz = bus_cycle_ns > 0 ? 1000000 / bus_cycle_ns : 1000000;
+
+	/* If scaling wasn't applied, skip this frequency */
+	if (tsc_khz && effective_tsc_khz == host_khz) {
+		pr_info("  TSC scaling not available, skipping\n");
+		kvm_vm_free(vm);
+		return;
+	}
+
+	pr_info("  Effective TSC: %u kHz, Bus: %u kHz\n", effective_tsc_khz, effective_bus_khz);
+
+	/* Also exercise KVM_VCPU_TSC_SCALE if available */
+	{
+		struct { uint64_t ratio; uint64_t frac_bits; } scale;
+		struct kvm_device_attr scale_attr = {
+			.group = KVM_VCPU_TSC_CTRL,
+			.attr = KVM_VCPU_TSC_SCALE,
+			.addr = (uint64_t)(uintptr_t)&scale,
+		};
+
+		if (!__vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &scale_attr)) {
+			vcpu_ioctl(vcpu, KVM_GET_DEVICE_ATTR, &scale_attr);
+			pr_info("  TSC scale: ratio=%lu frac_bits=%lu\n",
+				scale.ratio, scale.frac_bits);
+
+			/*
+			 * Verify: applying the ratio to the host TSC frequency
+			 * should give approximately the effective frequency.
+			 */
+			if (tsc_khz) {
+				uint64_t computed = ((__uint128_t)host_khz * scale.ratio) >> scale.frac_bits;
+				int64_t diff = (int64_t)computed - (int64_t)effective_tsc_khz;
+
+				TEST_ASSERT(diff >= -1 && diff <= 1,
+					    "TSC_SCALE ratio mismatch: computed %lu vs effective %u (diff %ld)",
+					    computed, effective_tsc_khz, diff);
+			}
+		}
+	}
+
+	compute_tsc_mul_shift((uint64_t)effective_tsc_khz * 1000,
+			      &expected_tsc_mul, &expected_tsc_shift);
+
+	expected_tsc_khz = effective_tsc_khz;
+	expected_bus_khz = effective_bus_khz;
+
+	sync_global_to_guest(vm, expected_tsc_khz);
+	sync_global_to_guest(vm, expected_bus_khz);
+	sync_global_to_guest(vm, expected_tsc_mul);
+	sync_global_to_guest(vm, expected_tsc_shift);
+
+	/* Populate CPUID leaves as a VMM would */
+	add_cpuid_entry(vcpu, GENERIC_TIMING_LEAF, 0,
+			effective_tsc_khz, effective_bus_khz, 0, 0);
+	add_cpuid_entry(vcpu, XEN_CPUID_LEAF(3), 0,
+			0, 0, effective_tsc_khz, 0);
+	add_cpuid_entry(vcpu, XEN_CPUID_LEAF(3), 1,
+			0, 0, expected_tsc_mul,
+			(uint32_t)(uint8_t)expected_tsc_shift);
+
+	vcpu_set_cpuid(vcpu);
+
+	pr_info("  pvclock mul=%u shift=%d\n", expected_tsc_mul, expected_tsc_shift);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	case UCALL_SYNC:
+		break;
+	default:
+		TEST_FAIL("Unexpected ucall");
+	}
+
+	kvm_vm_free(vm);
+}
+
+int main(void)
+{
+	uint64_t freq;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct kvm_device_attr attr = {
+		.group = KVM_VCPU_TSC_CTRL,
+		.attr = KVM_VCPU_TSC_SCALE,
+	};
+
+	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
+
+	/* Check KVM_VCPU_TSC_SCALE is supported (implies TSC scaling) */
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	TEST_REQUIRE(!__vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &attr));
+	host_khz = __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
+	kvm_vm_free(vm);
+
+	/* Native frequency */
+	run_test(0);
+
+	/* Scaled frequencies — skip if TSC scaling not available */
+	for (freq = 1000000; freq <= 4000000; freq += 1000000) {
+		if (freq == host_khz)
+			continue;
+		run_test(freq);
+	}
+
+	pr_info("PASS: All CPUID timing leaf tests passed\n");
+	return 0;
+}
-- 
2.54.0


