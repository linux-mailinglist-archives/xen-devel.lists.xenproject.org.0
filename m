Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KpjqL+jXJmqHlgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3664D657A25
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=M4uOYeD6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331716.1594372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNt-0004HM-71; Mon, 08 Jun 2026 14:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331716.1594372; Mon, 08 Jun 2026 14:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNs-00043r-Hz; Mon, 08 Jun 2026 14:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1331716;
 Mon, 08 Jun 2026 14:55:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wWbNl-0002Ns-5G
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNk-00EcHE-HR; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7d0-5cb7-0a2a0a5109dd-0a2a45018424-6
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7d3-c1f2-0a2a45010019-5a9b5cc7e19c-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wWbNU-00000001Afv-2Kws; Mon, 08 Jun 2026 14:55:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNR-00000000NEk-2IDj;
 Mon, 08 Jun 2026 15:54:57 +0100
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
	bh=6TRJ2V15CGAD4IK40NX80aKZiFhmGyTcFBfAlg5QdUA=; b=M4uOYeD6r7mluxNx0PQ0VPxKLD
	bRZ6ybXWOtawZ107tdN6ss1YWpR+PNV5H36UUsXsmsYjupy7/21JjI2LTBAC88/H40Ern9a1yA4hk
	shvf8wWkdDQ9KipqprAG6mNeKZ+TN8Elp8obsPY7oyXIRH3CPnLfLbxLx7I8WlDmFJZKsBNs45jyW
	2kzqfqs/tRCOlfKPR6mASqEmn2wFwrOHG8mRQDTYY7xM5kLsQ4nuEWaOU25xbCvykEPBgFMG2rdLK
	RFqmrhZZ6llgZB7RnXqNsDoC+S+fkyasPetFfzN080Rzt8MtCuf8vHNY2Ik6ymOp3GZsZifFGpAfL
	yjvlb2jA==;
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
Subject: [PATCH v5 05/34] KVM: selftests: Add KVM/PV clock selftest to prove timer correction
Date: Mon,  8 Jun 2026 15:47:46 +0100
Message-ID: <20260608145455.89187-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1780930516-B5B46FF4-BB22682A/0/0
X-purgate-type: clean
X-purgate-size: 15950
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3664D657A25

From: Jack Allister <jalliste@amazon.com>

A VM's KVM/PV clock has an inherent relationship to its TSC. When either
the host system live-updates or the VM is live-migrated this pairing of
the two clock sources should stay the same. In reality this is not the
case without some correction taking place.

The KVM_GET_CLOCK_GUEST/KVM_SET_CLOCK_GUEST ioctls can be used to
perform a correction on the PVTI (PV time information) structure held by
KVM to effectively fix up the kvmclock_offset prior to the guest VM
resuming in either a live-update/migration scenario.

This test proves that without the necessary fixup there is a perceived
change in the guest TSC and KVM/PV clock relationship before and after a
simulated LU/LM takes place, and that the correction eliminates it.

The test:
  1. Snapshots the PVTI at boot (PVTI0).
  2. Induces a change in PVTI data (KVM_REQ_MASTERCLOCK_UPDATE).
  3. Snapshots the PVTI after the change (PVTI1).
  4. Requests correction via KVM_SET_CLOCK_GUEST using PVTI0.
  5. Snapshots the PVTI after correction (PVTI2).

Then samples the TSC at a single point in time and calculates the KVM
clock using each PVTI snapshot. The corrected clock should match the
boot clock to within ±1ns.

The test enumerates multiple TSC frequencies from 1GHz to 5GHz at 500MHz
steps, crossing the 32-bit boundary, to exercise the scaling path at
various ratios. The sleep duration between snapshots is configurable via
the -s/--sleep command line option.

Co-developed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Jack Allister <jalliste@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Cc: Dongli Zhang <dongli.zhang@oracle.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/x86/pvclock_test.c  | 440 ++++++++++++++++++
 2 files changed, 441 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/pvclock_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89..fb935ae3bf38 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -105,6 +105,7 @@ TEST_GEN_PROGS_x86 += x86/pmu_counters_test
 TEST_GEN_PROGS_x86 += x86/pmu_event_filter_test
 TEST_GEN_PROGS_x86 += x86/private_mem_conversions_test
 TEST_GEN_PROGS_x86 += x86/private_mem_kvm_exits_test
+TEST_GEN_PROGS_x86 += x86/pvclock_test
 TEST_GEN_PROGS_x86 += x86/set_boot_cpu_id
 TEST_GEN_PROGS_x86 += x86/set_sregs_test
 TEST_GEN_PROGS_x86 += x86/smaller_maxphyaddr_emulation_test
diff --git a/tools/testing/selftests/kvm/x86/pvclock_test.c b/tools/testing/selftests/kvm/x86/pvclock_test.c
new file mode 100644
index 000000000000..aecd62fc8a93
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/pvclock_test.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © Amazon.com, Inc. or its affiliates.
+ *
+ * Tests for pvclock API
+ * KVM_SET_CLOCK_GUEST/KVM_GET_CLOCK_GUEST
+ */
+#include <getopt.h>
+#include <stdint.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+#include "apic.h"
+
+#include <asm/pvclock-abi.h>
+
+/*
+ * Reproduce the pvclock calculation the guest uses to convert TSC to
+ * nanoseconds. This must match the kernel's __pvclock_read_cycles().
+ */
+static inline uint64_t pvclock_scale_delta(uint64_t delta, uint32_t mul,
+					   int8_t shift)
+{
+	if (shift < 0)
+		delta >>= -shift;
+	else
+		delta <<= shift;
+	return ((__uint128_t)delta * mul) >> 32;
+}
+
+static inline uint64_t pvclock_read_cycles(struct pvclock_vcpu_time_info *src,
+					   uint64_t tsc)
+{
+	uint64_t delta = tsc - src->tsc_timestamp;
+
+	return src->system_time + pvclock_scale_delta(delta,
+						      src->tsc_to_system_mul,
+						      src->tsc_shift);
+}
+
+static inline void pvti_snapshot(struct pvclock_vcpu_time_info *dst,
+				 volatile struct pvclock_vcpu_time_info *src)
+{
+	uint32_t version;
+
+	do {
+		version = src->version;
+		__asm__ __volatile__("" ::: "memory");
+		*dst = *src;
+		__asm__ __volatile__("" ::: "memory");
+	} while ((src->version & 1) || src->version != version);
+}
+
+enum {
+	STAGE_FIRST_BOOT,
+	STAGE_UNCORRECTED,
+	STAGE_CORRECTED
+};
+
+#define KVMCLOCK_GPA	0xc0000000ull
+#define KVMCLOCK_SIZE	sizeof(struct pvclock_vcpu_time_info)
+
+static void trigger_pvti_update(void)
+{
+	/*
+	 * Toggle between KVM's old and new system time methods to coerce KVM
+	 * into updating the fields in the PV time info struct.
+	 */
+	wrmsr(MSR_KVM_SYSTEM_TIME, KVMCLOCK_GPA | KVM_MSR_ENABLED);
+	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, KVMCLOCK_GPA | KVM_MSR_ENABLED);
+}
+
+static void guest_code(void)
+{
+	struct pvclock_vcpu_time_info *pvti =
+		(void *)(unsigned long)KVMCLOCK_GPA;
+	struct pvclock_vcpu_time_info pvti_boot;
+	struct pvclock_vcpu_time_info pvti_uncorrected;
+	struct pvclock_vcpu_time_info pvti_corrected;
+	uint64_t tsc_guest;
+	uint64_t clk_boot, clk_uncorrected, clk_corrected;
+	int64_t delta_corrected;
+
+	/* Set up kvmclock and snapshot the initial pvclock parameters. */
+	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, KVMCLOCK_GPA | KVM_MSR_ENABLED);
+	pvti_snapshot(&pvti_boot, pvti);
+	GUEST_SYNC(STAGE_FIRST_BOOT);
+
+	/*
+	 * Trigger an update of the PVTI. Calculating the KVM clock using this
+	 * updated structure will show a delta from the original.
+	 */
+	trigger_pvti_update();
+	pvti_snapshot(&pvti_uncorrected, pvti);
+	GUEST_SYNC(STAGE_UNCORRECTED);
+
+	/*
+	 * Snapshot the corrected time (the host does KVM_SET_CLOCK_GUEST when
+	 * handling STAGE_UNCORRECTED).
+	 */
+	pvti_snapshot(&pvti_corrected, pvti);
+
+	/*
+	 * Sample the TSC at a single point in time, then calculate the
+	 * effective KVM clock using the PVTI from each stage. Verify that the
+	 * corrected clock matches the boot clock to within ±2ns.
+	 */
+	tsc_guest = rdtsc();
+
+	clk_boot = pvclock_read_cycles(&pvti_boot, tsc_guest);
+	clk_uncorrected = pvclock_read_cycles(&pvti_uncorrected, tsc_guest);
+	clk_corrected = pvclock_read_cycles(&pvti_corrected, tsc_guest);
+
+	delta_corrected = clk_boot - clk_corrected;
+
+	__GUEST_ASSERT(delta_corrected >= -2 && delta_corrected <= 2,
+		       "corrected delta %ld out of range (boot=%lu uncorrected=%lu corrected=%lu)",
+		       delta_corrected, clk_boot, clk_uncorrected, clk_corrected);
+
+	GUEST_SYNC(STAGE_CORRECTED);
+}
+
+static void run_test(struct kvm_vm *vm, struct kvm_vcpu *vcpu,
+		     unsigned int sleep_sec)
+{
+	struct pvclock_vcpu_time_info pvti_before;
+	struct ucall uc;
+
+	for (;;) {
+		vcpu_run(vcpu);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_SYNC:
+			break;
+		default:
+			TEST_FAIL("Unexpected ucall");
+		}
+
+		switch (uc.args[1]) {
+		case STAGE_FIRST_BOOT:
+			/* Save the pvclock parameters before the update. */
+			vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, &pvti_before);
+
+			/* Sleep to let the clocks diverge. */
+			sleep(sleep_sec);
+			break;
+
+		case STAGE_UNCORRECTED:
+			/* Restore the original pvclock parameters. */
+			vcpu_ioctl(vcpu, KVM_SET_CLOCK_GUEST, &pvti_before);
+			break;
+
+		case STAGE_CORRECTED:
+			/* Guest verified the delta in-guest. */
+			return;
+
+		default:
+			TEST_FAIL("Unknown stage %lu", uc.args[1]);
+		}
+	}
+}
+
+static void configure_pvclock(struct kvm_vm *vm)
+{
+	unsigned int nr_pages;
+
+	nr_pages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, getpagesize());
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    KVMCLOCK_GPA, 1, nr_pages, 0);
+	virt_map(vm, KVMCLOCK_GPA, KVMCLOCK_GPA, nr_pages);
+}
+
+static void run_at_frequency(uint64_t tsc_khz, unsigned int sleep_sec)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	pr_info("Testing at TSC frequency %lu kHz\n", tsc_khz);
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	configure_pvclock(vm);
+	vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *)tsc_khz);
+	run_test(vm, vcpu, sleep_sec);
+	kvm_vm_free(vm);
+}
+
+static void test_tsc_stable_bit(void);
+static void test_clock_guest_with_offsets(void);
+
+static void usage(const char *name)
+{
+	printf("Usage: %s [options]\n"
+	       "  -s, --sleep SEC     sleep duration between snapshots (default: 2)\n"
+	       "  -h, --help          show this help\n", name);
+}
+
+int main(int argc, char *argv[])
+{
+	static const struct option long_opts[] = {
+		{ "sleep", required_argument, NULL, 's' },
+		{ "help",  no_argument,       NULL, 'h' },
+		{ NULL,    0,                  NULL,  0  },
+	};
+	unsigned int sleep_sec = 2;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	uint64_t host_khz;
+	uint64_t freq;
+	int opt;
+
+	while ((opt = getopt_long(argc, argv, "s:h", long_opts, NULL)) != -1) {
+		switch (opt) {
+		case 's':
+			sleep_sec = atoi(optarg);
+			break;
+		case 'h':
+		default:
+			usage(argv[0]);
+			return opt == 'h' ? 0 : 1;
+		}
+	}
+
+	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	configure_pvclock(vm);
+
+	/* Check KVM_GET_CLOCK_GUEST is supported */
+	{
+		struct pvclock_vcpu_time_info tmp;
+		int ret = __vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, &tmp);
+		TEST_REQUIRE(ret != -1 || errno != ENOTTY);
+	}
+
+	/* First run at native frequency (no scaling). */
+	run_test(vm, vcpu, sleep_sec);
+
+	/*
+	 * Then enumerate a range of TSC frequencies crossing the 32-bit
+	 * boundary, to exercise the scaling path at various ratios.
+	 */
+	host_khz = __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
+	kvm_vm_free(vm);
+
+	for (freq = 1000000; freq <= 5000000; freq += 500000) {
+		if (freq == host_khz)
+			continue;
+		run_at_frequency(freq, sleep_sec);
+	}
+
+	test_tsc_stable_bit();
+	test_clock_guest_with_offsets();
+
+	return 0;
+}
+
+static void guest_code_stable_bit(void)
+{
+	uint32_t apic_id = GET_APIC_ID_FIELD(xapic_read_reg(APIC_ID));
+	uint64_t gpa = KVMCLOCK_GPA + apic_id * sizeof(struct pvclock_vcpu_time_info);
+
+	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, gpa | KVM_MSR_ENABLED);
+	GUEST_SYNC(0);
+	GUEST_SYNC(0);
+	GUEST_SYNC(0);
+}
+
+static void set_tsc_offset(struct kvm_vcpu *vcpu, uint64_t offset)
+{
+	struct kvm_device_attr attr = {
+		.group = KVM_VCPU_TSC_CTRL,
+		.attr = KVM_VCPU_TSC_OFFSET,
+		.addr = (__u64)(uintptr_t)&offset,
+	};
+	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &attr);
+}
+
+static void run_vcpu_once(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	case UCALL_SYNC:
+		break;
+	default:
+		TEST_FAIL("Unexpected ucall");
+	}
+}
+
+static void test_tsc_stable_bit(void)
+{
+	struct pvclock_vcpu_time_info pvti;
+	struct kvm_vcpu *vcpus[2];
+	struct kvm_vm *vm;
+	int ret;
+
+	pr_info("Testing PVCLOCK_TSC_STABLE_BIT with matched/unmatched TSCs\n");
+
+	vm = vm_create_with_vcpus(2, guest_code_stable_bit, vcpus);
+	configure_pvclock(vm);
+
+	/*
+	 * Case 1: All TSCs matched (same frequency and offset).
+	 * Master clock should be active, PVCLOCK_TSC_STABLE_BIT set.
+	 */
+	run_vcpu_once(vcpus[0]);
+
+	ret = __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti);
+	TEST_ASSERT(!ret, "GET_CLOCK_GUEST should succeed with matched TSCs");
+	TEST_ASSERT(pvti.flags & PVCLOCK_TSC_STABLE_BIT,
+		    "PVCLOCK_TSC_STABLE_BIT should be set with matched TSCs");
+
+	/*
+	 * Case 2: Different TSC offset, same frequency.
+	 * Master clock should still be active (frequency matches), but
+	 * PVCLOCK_TSC_STABLE_BIT should be cleared (offsets differ).
+	 */
+	set_tsc_offset(vcpus[1], 12345678);
+	run_vcpu_once(vcpus[1]);
+	run_vcpu_once(vcpus[0]);
+
+	ret = __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti);
+	if (ret) {
+		/* Master clock disabled by offset mismatch — old kernel */
+		pr_info("  Skipping offset tests (master clock requires matched offsets)\n");
+		goto out_stable;
+	}
+	TEST_ASSERT(!(pvti.flags & PVCLOCK_TSC_STABLE_BIT),
+		    "PVCLOCK_TSC_STABLE_BIT should be clear with offset-mismatched TSCs");
+
+	/*
+	 * Case 3: Different TSC frequency.
+	 * Master clock should be disabled entirely.
+	 */
+	vcpu_ioctl(vcpus[1], KVM_SET_TSC_KHZ,
+		   (void *)(unsigned long)(__vcpu_ioctl(vcpus[1], KVM_GET_TSC_KHZ, NULL) / 2));
+	/* Write TSC to trigger kvm_synchronize_tsc / kvm_track_tsc_matching */
+	vcpu_set_msr(vcpus[1], MSR_IA32_TSC, 0);
+	run_vcpu_once(vcpus[1]);
+
+	ret = __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti);
+	TEST_ASSERT(ret && errno == EINVAL,
+		    "GET_CLOCK_GUEST should fail with frequency-mismatched TSCs, got %d (errno %d)",
+		    ret, errno);
+
+out_stable:
+	kvm_vm_free(vm);
+}
+
+static void test_clock_guest_with_offsets(void)
+{
+	struct pvclock_vcpu_time_info pvti0, pvti1, pvti1_after;
+	struct kvm_vcpu *vcpus[2];
+	struct kvm_vm *vm;
+	int64_t delta;
+	int ret;
+
+	pr_info("Testing KVM_[GS]ET_CLOCK_GUEST with different TSC offsets\n");
+
+	vm = vm_create_with_vcpus(2, guest_code_stable_bit, vcpus);
+	configure_pvclock(vm);
+
+	/* Set different TSC offsets on the two vCPUs */
+	set_tsc_offset(vcpus[0], 0);
+	set_tsc_offset(vcpus[1], 1000000000ull);
+
+	/* Run both to establish kvmclock */
+	run_vcpu_once(vcpus[0]);
+	run_vcpu_once(vcpus[1]);
+
+	/* GET_CLOCK_GUEST on both — should succeed (master clock active) */
+	ret = __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti0);
+	if (ret) {
+		pr_info("  Skipping (master clock requires matched offsets on this kernel)\n");
+		kvm_vm_free(vm);
+		return;
+	}
+	ret = __vcpu_ioctl(vcpus[1], KVM_GET_CLOCK_GUEST, &pvti1);
+	TEST_ASSERT(!ret, "GET_CLOCK_GUEST on vcpu1 failed");
+
+	/* The tsc_timestamps should differ (different offsets) */
+	TEST_ASSERT(pvti0.tsc_timestamp != pvti1.tsc_timestamp,
+		    "tsc_timestamps should differ with different offsets");
+
+	/* Sleep to let time elapse, then restore vcpu0's clock */
+	sleep(1);
+	vcpu_ioctl(vcpus[0], KVM_SET_CLOCK_GUEST, &pvti0);
+
+	/* Run vcpu0 to process the clock update */
+	run_vcpu_once(vcpus[0]);
+
+	/* GET_CLOCK_GUEST on vcpu1 — should reflect the correction */
+	ret = __vcpu_ioctl(vcpus[1], KVM_GET_CLOCK_GUEST, &pvti1_after);
+	TEST_ASSERT(!ret, "GET_CLOCK_GUEST on vcpu1 after SET failed");
+
+	/*
+	 * After SET on vcpu0, verify the correction worked by getting
+	 * the clock on vcpu0 again. The mul/shift should be the same,
+	 * and computing kvmclock at the same TSC should give the same
+	 * result as the original (within ±2ns).
+	 */
+	{
+		struct pvclock_vcpu_time_info pvti0_after;
+		uint64_t tsc_now, clk_from_old, clk_from_new;
+
+		ret = __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti0_after);
+		TEST_ASSERT(!ret, "GET_CLOCK_GUEST on vcpu0 after SET failed");
+
+		tsc_now = pvti0_after.tsc_timestamp;
+		clk_from_old = pvclock_read_cycles(&pvti0, tsc_now);
+		clk_from_new = pvclock_read_cycles(&pvti0_after, tsc_now);
+
+		delta = (int64_t)clk_from_new - (int64_t)clk_from_old;
+		TEST_ASSERT(delta >= -2 && delta <= 2,
+			    "clock correction delta should be <=2ns, got %ld ns",
+			    delta);
+	}
+
+	/*
+	 * Also verify that vcpu1's clock is still accessible (master
+	 * clock still active with different offsets).
+	 */
+	ret = __vcpu_ioctl(vcpus[1], KVM_GET_CLOCK_GUEST, &pvti1_after);
+	TEST_ASSERT(!ret, "GET_CLOCK_GUEST on vcpu1 after SET failed");
+
+	kvm_vm_free(vm);
+}
-- 
2.54.0


