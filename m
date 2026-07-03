Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RuliDVcoSGo/nAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:23:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF1705C3A
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:23:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=iU6SK+6H;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353876.1609599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflM6-0004YP-Un; Fri, 03 Jul 2026 21:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353876.1609599; Fri, 03 Jul 2026 21:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflM6-0004UL-Pt; Fri, 03 Jul 2026 21:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1353876;
 Fri, 03 Jul 2026 21:23:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflM4-0004QI-El
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:23:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflM3-00BXKf-Rt; Fri, 03 Jul 2026 23:23:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a4827dc-2eae-0a2a0a5409dd-0a2a4509cd18-38
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:23 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a48284a-97e6-0a2a45090019-5a9b5cc7a69c-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:23 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKe-000000059OD-0yjS; Fri, 03 Jul 2026 21:22:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKX-00000001RPs-2B0E;
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
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=MSS/L0DlzIiHi7Bw2B047mUTxdF1yD6n9Esd4lrjANw=; b=iU6SK+6HlatYeQ2gl9tGwyLkqi
	sAlSNaCj1PI5JPhBJmRbg/ZFhceYepOCKk0FhLL4jYcu0Ca1VR2EtHfZyR4QbM6Nkewx7oXq5ElzM
	SEIB8TwnLNxYKX69h8tecrdlNIfS4rDY4Bwhm5882oYca8mbjNYb3jUkg7/HSWCpmyYBUBFyQOOi3
	tcR/CDUHlwPBWqbHVVgaWWgQRlA6+jwPo9gNJ9sC8Gj+x8HkO25EeY7RimOfYveAQMCdQmD5iWBYI
	UP7CHZJJi5EKQaHg39iDBGsOfy3hGBLeHuhNl9ZJkgXvFeo9mpsYJEgU9DxfO7FEEbwn5yRsKKDgf
	yzRGECYw==;
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
Subject: [PATCH v6 31/36] KVM: selftests: Add Xen runstate migration test
Date: Fri,  3 Jul 2026 22:18:10 +0100
Message-ID: <20260703212145.343527-32-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-bad1c0/1783113803-47731986-BAA3D1A4/0/0
X-purgate-type: clean
X-purgate-size: 8510
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email];
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
X-Rspamd-Queue-Id: 8DBF1705C3A

From: David Woodhouse <dwmw@amazon.co.uk>

Test that Xen runstate (steal time) is correctly accounted across a
simulated live migration using KVM_XEN_VCPU_ATTR and KVM_[GS]ET_CLOCK_GUEST.

The test simulates what a real VMM does during migration:
1. Creates a VM with Xen HVM config and runstate tracking
2. Runs the guest to accumulate some kvmclock time
3. Saves clock (KVM_GET_CLOCK_GUEST), TSC offset, and runstate
4. Marks the saved state as RUNSTATE_runnable (vCPU not running)
5. Destroys the source VM
6. Sleeps 10ms (simulating migration network transfer time)
7. Creates a new VM and restores all state precisely as saved
8. Runs the guest and verifies the migration gap appears as steal

The kernel accounts the gap because: on vcpu_load, it transitions from
RUNSTATE_runnable to RUNSTATE_running, computing delta = kvmclock_now -
state_entry_time. Since kvmclock has advanced past the saved entry time
(real time elapsed during migration), the delta is added to time_runnable.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/x86/xen_migration_test.c    | 194 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/xen_migration_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 58aac2980cdf..f155683bd7f8 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -142,6 +142,7 @@ TEST_GEN_PROGS_x86 += x86/debug_regs
 TEST_GEN_PROGS_x86 += x86/tsc_msrs_test
 TEST_GEN_PROGS_x86 += x86/vmx_pmu_caps_test
 TEST_GEN_PROGS_x86 += x86/xen_cpuid_timing_test
+TEST_GEN_PROGS_x86 += x86/xen_migration_test
 TEST_GEN_PROGS_x86 += x86/xen_shinfo_test
 TEST_GEN_PROGS_x86 += x86/xen_vmcall_test
 TEST_GEN_PROGS_x86 += x86/sev_init2_tests
diff --git a/tools/testing/selftests/kvm/x86/xen_migration_test.c b/tools/testing/selftests/kvm/x86/xen_migration_test.c
new file mode 100644
index 000000000000..4a041d36f1b9
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/xen_migration_test.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test Xen runstate (steal time) preservation across simulated migration.
+ *
+ * Verifies that the kernel correctly accounts the migration gap as
+ * steal time (runnable) when runstate data is saved and restored
+ * precisely, but real time elapses during the migration.
+ *
+ * The key insight: userspace saves the runstate with state=RUNSTATE_runnable
+ * (the vCPU is not running during migration). On restore, the kernel sees
+ * that kvmclock has advanced past state_entry_time, and accounts the
+ * difference as time spent in the runnable state.
+ */
+#include <inttypes.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+
+#include <asm/pvclock-abi.h>
+
+#define SHINFO_GPA	0xc0000000ULL
+#define RUNSTATE_GPA	(SHINFO_GPA + 0x1000)
+
+#define RUNSTATE_running  0
+#define RUNSTATE_runnable 1
+#define RUNSTATE_blocked  2
+#define RUNSTATE_offline  3
+
+struct vcpu_runstate_info {
+	uint32_t state;
+	uint64_t state_entry_time;
+	uint64_t time[4];
+} __attribute__((packed));
+
+static void guest_code(void)
+{
+	volatile struct vcpu_runstate_info *rs =
+		(void *)(unsigned long)RUNSTATE_GPA;
+
+	/* Report runstate times — no need to enable kvmclock MSR,
+	 * the kernel writes runstate using its internal kvmclock. */
+	GUEST_SYNC_ARGS(0, rs->time[RUNSTATE_runnable],
+			rs->time[RUNSTATE_running], 0, 0);
+}
+
+static struct kvm_vm *create_xen_vm(struct kvm_vcpu **vcpu)
+{
+	struct kvm_vm *vm;
+	int xen_caps;
+
+	vm = vm_create_with_one_vcpu(vcpu, guest_code);
+
+	xen_caps = kvm_check_cap(KVM_CAP_XEN_HVM);
+	TEST_REQUIRE(xen_caps & KVM_XEN_HVM_CONFIG_SHARED_INFO);
+	TEST_REQUIRE(xen_caps & KVM_XEN_HVM_CONFIG_RUNSTATE);
+
+	/* Map pages */
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    SHINFO_GPA, 1, 2, 0);
+	virt_map(vm, SHINFO_GPA, SHINFO_GPA, 2);
+
+	/* Enable Xen HVM with MSR interception (enables runstate tracking) */
+	struct kvm_xen_hvm_config cfg = {
+		.flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
+		.msr = 0x40000000,
+	};
+	vm_ioctl(vm, KVM_XEN_HVM_CONFIG, &cfg);
+
+	/* Set shared_info */
+	struct kvm_xen_hvm_attr ha = {
+		.type = KVM_XEN_ATTR_TYPE_SHARED_INFO,
+		.u.shared_info.gfn = SHINFO_GPA >> 12,
+	};
+	vm_ioctl(vm, KVM_XEN_HVM_SET_ATTR, &ha);
+
+	/* Set runstate address */
+	struct kvm_xen_vcpu_attr rs_addr = {
+		.type = KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+		.u.gpa = RUNSTATE_GPA,
+	};
+	vcpu_ioctl(*vcpu, KVM_XEN_VCPU_SET_ATTR, &rs_addr);
+
+	return vm;
+}
+
+int main(void)
+{
+	struct pvclock_vcpu_time_info pvti;
+	struct kvm_xen_vcpu_attr runstate_save;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	uint64_t tsc_offset;
+	int ret;
+
+	/* === SOURCE SIDE === */
+	pr_info("=== Source: create VM and run guest ===\n");
+	vm = create_xen_vm(&vcpu);
+
+	/* Run guest once to accumulate some runstate time */
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+
+	pr_info("  Guest sees: runnable=%" PRIu64 " running=%" PRIu64 "\n",
+		uc.args[2], uc.args[3]);
+
+	/* Save clock state */
+	ret = __vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, &pvti);
+	TEST_ASSERT(!ret, "KVM_GET_CLOCK_GUEST failed");
+
+	/* Save TSC offset */
+	tsc_offset = vcpu_get_msr(vcpu, MSR_IA32_TSC_ADJUST);
+
+	/* Save runstate — the vCPU is now "runnable" (not running) */
+	runstate_save.type = KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_DATA;
+	vcpu_ioctl(vcpu, KVM_XEN_VCPU_GET_ATTR, &runstate_save);
+
+	/*
+	 * Transition to runnable state before saving — the vCPU is
+	 * not running during migration.
+	 */
+	runstate_save.u.runstate.state = RUNSTATE_runnable;
+
+	pr_info("  Saved runstate: running=%" PRIu64 " runnable=%" PRIu64
+		" entry=%" PRIu64 "\n",
+		(uint64_t)runstate_save.u.runstate.time_running,
+		(uint64_t)runstate_save.u.runstate.time_runnable,
+		(uint64_t)runstate_save.u.runstate.state_entry_time);
+
+	uint64_t saved_runnable = runstate_save.u.runstate.time_runnable;
+
+	kvm_vm_free(vm);
+
+	/* === MIGRATION GAP === */
+	pr_info("=== Simulating migration (sleeping 10ms) ===\n");
+	usleep(10000);
+
+	/* === DESTINATION SIDE === */
+	pr_info("=== Destination: create new VM and restore ===\n");
+	vm = create_xen_vm(&vcpu);
+
+	/* Restore TSC offset */
+	vcpu_set_msr(vcpu, MSR_IA32_TSC_ADJUST, tsc_offset);
+
+	/* Restore clock — kvmclock will now be ~10ms ahead of the snapshot */
+	vcpu_ioctl(vcpu, KVM_SET_CLOCK_GUEST, &pvti);
+
+	/* Restore runstate exactly as saved (state=runnable) */
+	runstate_save.type = KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_DATA;
+	ret = __vcpu_ioctl(vcpu, KVM_XEN_VCPU_SET_ATTR, &runstate_save);
+	TEST_ASSERT(!ret, "Restore runstate failed: errno %d", errno);
+
+	/*
+	 * Run the guest. When the vCPU enters vcpu_run, the kernel
+	 * transitions from RUNSTATE_runnable to RUNSTATE_running.
+	 * It computes: delta = kvmclock_now - state_entry_time
+	 * This delta (which includes the migration gap) is added to
+	 * time_runnable (steal time).
+	 */
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+
+	uint64_t guest_runnable = uc.args[2];
+	uint64_t guest_running = uc.args[3];
+
+	pr_info("  Guest sees: runnable=%" PRIu64 " running=%" PRIu64 "\n",
+		guest_runnable, guest_running);
+
+	uint64_t steal_increase = guest_runnable - saved_runnable;
+	pr_info("  Steal time increase: %" PRIu64 " ns (migration gap)\n",
+		steal_increase);
+
+	/*
+	 * The steal time increase should be at least 10ms (the sleep)
+	 * but not more than 5s (allowing for VM creation overhead).
+	 * The actual gap is from the source's state_entry_time to the
+	 * destination's kvmclock "now" at vcpu_load time.
+	 */
+	TEST_ASSERT(steal_increase >= 10000000ULL &&
+		    steal_increase < 5000000000ULL,
+		    "Steal time increase %" PRIu64 " ns not in expected range "
+		    "[10ms, 5s]", steal_increase);
+
+	kvm_vm_free(vm);
+	pr_info("PASS: Migration gap correctly accounted as steal time\n");
+	return 0;
+}
-- 
2.54.0


