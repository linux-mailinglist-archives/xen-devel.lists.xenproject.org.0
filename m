Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ETfGngoSGpWnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:24:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED807705C91
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=i2HbQgc8;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353908.1609712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMe-00006B-8l; Fri, 03 Jul 2026 21:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353908.1609712; Fri, 03 Jul 2026 21:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMd-0008A0-8T; Fri, 03 Jul 2026 21:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1353908;
 Fri, 03 Jul 2026 21:23:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflMY-0007C5-A7
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:23:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflMX-001XO6-N0; Fri, 03 Jul 2026 23:23:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a4827d9-5cb7-0a2a0a5109dd-0a2a4505dcf2-44
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:53 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482869-3cb2-0a2a45050019-5a9b5cc79154-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:53 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKc-000000059OA-40uX; Fri, 03 Jul 2026 21:23:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKX-00000001RPL-0RPj;
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
	bh=wRdzvKD2bSU5nsIEUajIFrEJsqOT3VIHViFgVZVhuqk=; b=i2HbQgc8AAYdlD8WujdrvoPn1U
	qoodV8ewcMdiGBQg69o486bMpQqj3pTV6LFQ+p4lqOS+REgBO5BemjRGoJIYKDskYoX3dzxU/dlWs
	fn2vzHq+FScArRGbLA7uB4jy7vpg8ka9zk3nmtu49+oDQijwv+s28SVc4L6+1aNJSTs0xpcGVGk+4
	PUaalf6n5Bs4BQ+P+PIB8knTn4QDDa19PFHuBjY+s0Xdh5h6LrgJk/Hs3e1pM9yixhVu0mhnBsWjJ
	q2hW1MEceXMx6MN7p1chCFiOsbQ0DLRYilZs1FhSzRg3dTm8+BBZ+L5AdoSzqbp/un2xzu5DlNmAh
	h7pBrsWw==;
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
Subject: [PATCH v6 23/36] KVM: selftests: Add master clock offset test
Date: Fri,  3 Jul 2026 22:18:02 +0100
Message-ID: <20260703212145.343527-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c201ff/1783113833-151042B8-9021AFCA/0/0
X-purgate-type: clean
X-purgate-size: 8060
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
X-Rspamd-Queue-Id: ED807705C91

From: David Woodhouse <dwmw@amazon.co.uk>

Verify that KVM master clock mode remains active when vCPUs have
different TSC offsets but the same frequency. Creates three vCPUs,
sets one to a different TSC value, and confirms:

 - KVM_CLOCK_HOST_TSC is set (master clock active)
 - KVM_CLOCK_TSC_STABLE IS set (master clock ⇒ stable flag)
 - PVCLOCK_TSC_STABLE_BIT is NOT set (offsets differ)

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro (claude-opus-4.6-1m)
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/masterclock_offset_test.c         | 180 ++++++++++++++++++
 2 files changed, 181 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/masterclock_offset_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 90568ab631d7..7ecaaf82056e 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -106,6 +106,7 @@ TEST_GEN_PROGS_x86 += x86/pmu_event_filter_test
 TEST_GEN_PROGS_x86 += x86/private_mem_conversions_test
 TEST_GEN_PROGS_x86 += x86/private_mem_kvm_exits_test
 TEST_GEN_PROGS_x86 += x86/pvclock_test
+TEST_GEN_PROGS_x86 += x86/masterclock_offset_test
 TEST_GEN_PROGS_x86 += x86/pvclock_migration_test
 TEST_GEN_PROGS_x86 += x86/set_boot_cpu_id
 TEST_GEN_PROGS_x86 += x86/set_sregs_test
diff --git a/tools/testing/selftests/kvm/x86/masterclock_offset_test.c b/tools/testing/selftests/kvm/x86/masterclock_offset_test.c
new file mode 100644
index 000000000000..88e2bd2edab5
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/masterclock_offset_test.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test that KVM master clock mode works with different TSC offsets
+ * as long as all vCPUs have the same TSC frequency.
+ */
+#include <stdint.h>
+#include <string.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+
+#include <asm/pvclock-abi.h>
+
+#define KVMCLOCK_GPA	0xc0000000ull
+#define TSC_OFFSET	(1000000000ULL)
+
+static uint64_t pvclock_calc(struct pvclock_vcpu_time_info *pvti, uint64_t guest_tsc)
+{
+	uint64_t delta = guest_tsc - pvti->tsc_timestamp;
+
+	if (pvti->tsc_shift >= 0)
+		delta <<= pvti->tsc_shift;
+	else
+		delta >>= -(int)pvti->tsc_shift;
+
+	return pvti->system_time + ((__uint128_t)delta * pvti->tsc_to_system_mul >> 32);
+}
+
+static void guest_code(void)
+{
+	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, KVMCLOCK_GPA | KVM_MSR_ENABLED);
+	for (;;)
+		GUEST_SYNC(0);
+}
+
+int main(void)
+{
+	struct kvm_vcpu *vcpus[3];
+	struct kvm_clock_data clock;
+	struct pvclock_vcpu_time_info pvti[3];
+	struct kvm_vm *vm;
+	uint64_t offset0, host_tsc, clk0, clk2;
+	int i;
+
+	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
+
+	vm = vm_create_with_vcpus(3, guest_code, vcpus);
+
+	TEST_REQUIRE(!__vcpu_has_device_attr(vcpus[0], KVM_VCPU_TSC_CTRL,
+					     KVM_VCPU_TSC_OFFSET));
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    KVMCLOCK_GPA, 1,
+				    vm_calc_num_guest_pages(VM_MODE_DEFAULT,
+							   getpagesize()), 0);
+	virt_map(vm, KVMCLOCK_GPA, KVMCLOCK_GPA,
+		 vm_calc_num_guest_pages(VM_MODE_DEFAULT, getpagesize()));
+
+	/* Get vCPU 0's default offset and set vCPU 2's offset higher */
+	vcpu_device_attr_get(vcpus[0], KVM_VCPU_TSC_CTRL,
+			     KVM_VCPU_TSC_OFFSET, &offset0);
+	uint64_t offset2 = offset0 + TSC_OFFSET;
+	vcpu_device_attr_set(vcpus[2], KVM_VCPU_TSC_CTRL,
+			     KVM_VCPU_TSC_OFFSET, &offset2);
+
+	/* Run each vCPU to enable kvmclock (with offset already set) */
+	for (i = 0; i < 3; i++) {
+		vcpu_run(vcpus[i]);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpus[i], KVM_EXIT_IO);
+	}
+
+	/* Check master clock is active */
+	memset(&clock, 0, sizeof(clock));
+	vm_ioctl(vm, KVM_GET_CLOCK, &clock);
+	pr_info("KVM_GET_CLOCK flags: 0x%x\n", clock.flags);
+	TEST_ASSERT(clock.flags & KVM_CLOCK_HOST_TSC,
+		    "Master clock should be active, flags=0x%x", clock.flags);
+	TEST_ASSERT(clock.flags & KVM_CLOCK_TSC_STABLE,
+		    "KVM_CLOCK_TSC_STABLE should be set, flags=0x%x", clock.flags);
+
+	/* Get per-vCPU pvclock in order 0, 2, 1 */
+	int order[] = {0, 2, 1};
+	for (i = 0; i < 3; i++) {
+		int idx = order[i];
+		__vcpu_ioctl(vcpus[idx], KVM_GET_CLOCK_GUEST, &pvti[idx]);
+		pr_info("vCPU %d: tsc_timestamp=%lu system_time=%lu "
+			"mul=%u shift=%d flags=0x%x\n",
+			idx, (unsigned long)pvti[idx].tsc_timestamp,
+			(unsigned long)pvti[idx].system_time,
+			pvti[idx].tsc_to_system_mul, pvti[idx].tsc_shift,
+			pvti[idx].flags);
+	}
+
+	/* Read guest TSCs: should see (0+OFF) < 2 < (1+OFF) */
+	uint64_t gtsc0 = vcpu_get_msr(vcpus[0], MSR_IA32_TSC);
+	uint64_t gtsc2 = vcpu_get_msr(vcpus[2], MSR_IA32_TSC);
+	uint64_t gtsc1 = vcpu_get_msr(vcpus[1], MSR_IA32_TSC);
+	pr_info("Guest TSCs: vcpu0=%lu vcpu2=%lu vcpu1=%lu\n",
+		(unsigned long)gtsc0, (unsigned long)gtsc2, (unsigned long)gtsc1);
+	pr_info("vcpu0+OFF=%lu vcpu1+OFF=%lu\n",
+		(unsigned long)(gtsc0 + TSC_OFFSET),
+		(unsigned long)(gtsc1 + TSC_OFFSET));
+	TEST_ASSERT(gtsc0 + TSC_OFFSET < gtsc2 && gtsc2 < gtsc1 + TSC_OFFSET,
+		    "Expected (vcpu0+OFF) < vcpu2 < (vcpu1+OFF)");
+
+	/* PVCLOCK_TSC_STABLE_BIT should NOT be set (offsets differ) */
+	TEST_ASSERT(!(pvti[2].flags & PVCLOCK_TSC_STABLE_BIT),
+		    "PVCLOCK_TSC_STABLE_BIT should NOT be set, flags=0x%x",
+		    pvti[2].flags);
+
+	/* Same mul/shift */
+	TEST_ASSERT(pvti[0].tsc_to_system_mul == pvti[2].tsc_to_system_mul &&
+		    pvti[0].tsc_shift == pvti[2].tsc_shift,
+		    "All vCPUs should have same mul/shift");
+
+	/*
+	 * Read host TSC once. At this instant:
+	 *   vCPU 0 guest TSC = host_tsc + offset0
+	 *   vCPU 2 guest TSC = host_tsc + offset0 + TSC_OFFSET
+	 * Feed each through its pvclock. Expect the same kvmclock.
+	 */
+	host_tsc = rdtsc();
+	clk0 = pvclock_calc(&pvti[0], host_tsc + offset0);
+	clk2 = pvclock_calc(&pvti[2], host_tsc + offset0 + TSC_OFFSET);
+
+	pr_info("kvmclock via vCPU 0: %lu ns\n", (unsigned long)clk0);
+	pr_info("kvmclock via vCPU 2: %lu ns\n", (unsigned long)clk2);
+	TEST_ASSERT(clk0 == clk2,
+		    "kvmclock from offset vCPUs should match exactly, "
+		    "diff=%ld ns", (long)(clk2 - clk0));
+
+	pr_info("PASSED: pvclock consistent across offset vCPUs\n");
+
+	/*
+	 * Now add an hour to the VM kvmclock via KVM_SET_CLOCK, run each
+	 * vCPU to pick up the update, and check they're still in sync.
+	 */
+	{
+#define ONE_HOUR_NS (3600ULL * NSEC_PER_SEC)
+		struct kvm_clock_data setclk = { .clock = clock.clock + ONE_HOUR_NS };
+
+		vm_ioctl(vm, KVM_SET_CLOCK, &setclk);
+	}
+
+	/* Guest code does GUEST_SYNC then exits — run each to see update */
+	for (i = 0; i < 3; i++) {
+		vcpu_run(vcpus[order[i]]);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpus[order[i]], KVM_EXIT_IO);
+	}
+
+	/* Re-read pvclocks */
+	for (i = 0; i < 3; i++)
+		__vcpu_ioctl(vcpus[order[i]], KVM_GET_CLOCK_GUEST, &pvti[order[i]]);
+
+	pr_info("After +1h: vCPU 0 system_time=%lu, vCPU 2 system_time=%lu\n",
+		(unsigned long)pvti[0].system_time,
+		(unsigned long)pvti[2].system_time);
+	TEST_ASSERT(pvti[0].system_time == pvti[2].system_time,
+		    "system_time should still match after KVM_SET_CLOCK");
+
+	host_tsc = rdtsc();
+	clk0 = pvclock_calc(&pvti[0], host_tsc + offset0);
+	clk2 = pvclock_calc(&pvti[2], host_tsc + offset0 + TSC_OFFSET);
+
+	pr_info("After +1h: kvmclock via vCPU 0: %lu ns\n", (unsigned long)clk0);
+	pr_info("After +1h: kvmclock via vCPU 2: %lu ns\n", (unsigned long)clk2);
+	TEST_ASSERT(clk0 == clk2,
+		    "After +1h: kvmclock should still match, diff=%ld ns",
+		    (long)(clk2 - clk0));
+
+	/* Verify the clock actually moved by ~1 hour */
+	TEST_ASSERT(clk0 > ONE_HOUR_NS,
+		    "Clock should be > 1 hour after set, got %lu ns",
+		    (unsigned long)clk0);
+
+	pr_info("PASSED: pvclock still consistent after KVM_SET_CLOCK +1h\n");
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.54.0


