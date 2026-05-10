Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI0RA+TxAGrxOgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 23:00:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38262506627
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 23:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305593.1577886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMBFI-0005J2-Jg; Sun, 10 May 2026 20:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305593.1577886; Sun, 10 May 2026 20:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMBFI-0005H2-Fb; Sun, 10 May 2026 20:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1305593;
 Sun, 10 May 2026 20:59:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+0abf7e93b395bf2e804e+8295+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wMBFH-0005FU-9P
 for xen-devel@lists.xenproject.org; Sun, 10 May 2026 20:59:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMBFG-003wke-Mc; Sun, 10 May 2026 22:59:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+0abf7e93b395bf2e804e+8295+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a00f152-5cb7-0a2a0a5109dd-0a2a450aec3c-34
 for <multiple-recipients>; Sun, 10 May 2026 22:59:25 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+0abf7e93b395bf2e804e+8295+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a00f1ad-56b3-0a2a450a0019-5a9b322292ea-3
 for <multiple-recipients>; Sun, 10 May 2026 22:59:25 +0200
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wMBEe-00000007GLM-0IXw; Sun, 10 May 2026 20:58:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xVN4cOYEHLvsvTsrs+Mo4ZF+TKkKL5dKm3kNYJ9llFY=; b=qnSpKJ33qhVTOfzu2g2xy/mOWn
	WgAnKyKONg75//4h4TDKLqKtbEQC7vadz8Gu58pP3oL3ub0M1GFAwcY9vKlYRq/oc8zuJV92NgJwN
	f0/3F1kmVCbhl4p3jm+cNSRXnfz7h4ZI6Wro/2ShZlH3AuHcVuiCSkNIe2CWQ44+SFexvzRskAKPJ
	T4d0cDCMojrcEffGmo1ijQzcCVZZp+YHV9S8qlpFnbGMvSBzPvWGFumv+QOsL2MzlaF3y1cNVq0zR
	1YRaRp9pbvZTesm0G9/tAEwB+YZfloUwHm951aEWeSoah+Ey4FFSi/QSgIo8wW8wNsxc+W7c3bUQ0
	F7hgqY/A==;
Message-ID: <6a820ac041d4d289dba2e78eff815443a036fe0d.camel@infradead.org>
Subject: [PATCH v4 31/30] KVM: selftests: Add Xen/generic CPUID timing leaf
 test
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David
 Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Jonathan
 Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, Marc
 Zyngier <maz@kernel.org>, Dongli Zhang <dongli.zhang@oracle.com>, Jack
 Allister <jalliste@amazon.com>, Joe Jin <joe.jin@oracle.com>, Joey Gouly
 <joey.gouly@arm.com>, kvm@vger.kernel.org,  linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  xen-devel@lists.xenproject.org,
 linux-kselftest@vger.kernel.org
Date: Sun, 10 May 2026 21:58:21 +0100
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Baioh5K8VSQI5oIkCRkB"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1778446765-7D5868B7-18587396/0/0
X-purgate-type: clean
X-purgate-size: 16200
X-Rspamd-Queue-Id: 38262506627
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.49 / 15.00];
	SIGNED_SMIME(-2.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,infradead.org:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:dongli.zhang@oracle.com,m:jalliste@amazon.com,m:joe.jin@oracle.com,m:joey.gouly@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--=-Baioh5K8VSQI5oIkCRkB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

Verify that userspace can correctly populate Xen and generic CPUID
timing leaves using the KVM_VCPU_TSC_EFFECTIVE_FREQ and
KVM_VCPU_TSC_SCALE attributes.

This validates that the removal of KVM's runtime Xen CPUID modification
doesn't break guests: userspace queries the effective TSC and bus
frequencies, computes the pvclock mul/shift, populates the CPUID leaves,
and the guest verifies the values match.

The test exercises:
 - KVM_VCPU_TSC_EFFECTIVE_FREQ at native and scaled frequencies
 - KVM_VCPU_TSC_SCALE ratio verification against effective frequency
 - Generic timing leaf 0x40000010 (EAX=3Dtsc_khz, EBX=3Dbus_khz)
 - Xen leaf 3 sub-leaf 0 (ECX=3Dguest TSC kHz)
 - Xen leaf 3 sub-leaf 1 (ECX=3Dmul, EDX=3Dshift)

Gracefully skips TSC scaling tests on hardware without support.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/x86/xen_cpuid_timing_test.c | 232 ++++++++++++++++++
 2 files changed, 233 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/xen_cpuid_timing_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selft=
ests/kvm/Makefile.kvm
index fb935ae3bf38..50f02116249f 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -139,6 +139,7 @@ TEST_GEN_PROGS_x86 +=3D x86/xss_msr_test
 TEST_GEN_PROGS_x86 +=3D x86/debug_regs
 TEST_GEN_PROGS_x86 +=3D x86/tsc_msrs_test
 TEST_GEN_PROGS_x86 +=3D x86/vmx_pmu_caps_test
+TEST_GEN_PROGS_x86 +=3D x86/xen_cpuid_timing_test
 TEST_GEN_PROGS_x86 +=3D x86/xen_shinfo_test
 TEST_GEN_PROGS_x86 +=3D x86/xen_vmcall_test
 TEST_GEN_PROGS_x86 +=3D x86/sev_init2_tests
diff --git a/tools/testing/selftests/kvm/x86/xen_cpuid_timing_test.c b/tool=
s/testing/selftests/kvm/x86/xen_cpuid_timing_test.c
new file mode 100644
index 000000000000..f574343ed449
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/xen_cpuid_timing_test.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test that userspace can correctly populate Xen and generic CPUID
+ * timing leaves using KVM_VCPU_TSC_EFFECTIVE_FREQ.
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
+	/* Check Xen leaf 3, sub-leaf 0: ECX =3D guest TSC frequency */
+	__cpuid(XEN_CPUID_LEAF(3), 0, &eax, &ebx, &ecx, &edx);
+	GUEST_ASSERT_EQ(ecx, expected_tsc_khz);
+
+	/* Check Xen leaf 3, sub-leaf 1: ECX =3D mul, EDX =3D shift */
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
+	struct kvm_cpuid2 *cpuid =3D vcpu->cpuid;
+	struct kvm_cpuid_entry2 *entry;
+	int n =3D cpuid->nent;
+
+	vcpu->cpuid =3D realloc(vcpu->cpuid,
+			      sizeof(*cpuid) + (n + 1) * sizeof(*entry));
+	cpuid =3D vcpu->cpuid;
+	cpuid->nent =3D n + 1;
+
+	entry =3D &cpuid->entries[n];
+	memset(entry, 0, sizeof(*entry));
+	entry->function =3D function;
+	entry->index =3D index;
+	entry->flags =3D KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+	entry->eax =3D eax;
+	entry->ebx =3D ebx;
+	entry->ecx =3D ecx;
+	entry->edx =3D edx;
+}
+
+/*
+ * Compute pvclock mul/shift from frequency, matching kvm_get_time_scale()=
.
+ */
+static void compute_tsc_mul_shift(uint64_t tsc_hz, uint32_t *mul, int8_t *=
shift)
+{
+	uint64_t scaled =3D 1000000000ULL;
+	uint64_t base =3D tsc_hz;
+	int32_t s =3D 0;
+	uint32_t base32;
+
+	while (base > scaled * 2 || base >> 32) {
+		base >>=3D 1;
+		s--;
+	}
+	base32 =3D (uint32_t)base;
+	while (base32 <=3D scaled || scaled >> 32) {
+		if (scaled >> 32 || base32 & (1U << 31))
+			scaled >>=3D 1;
+		else
+			base32 <<=3D 1;
+		s++;
+	}
+	*mul =3D (uint32_t)((scaled << 32) / base32);
+	*shift =3D (int8_t)s;
+}
+
+static void run_test(uint64_t tsc_khz)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	struct { uint32_t tsc_khz; uint32_t bus_khz; } freq;
+	struct kvm_device_attr freq_attr =3D {
+		.group =3D KVM_VCPU_TSC_CTRL,
+		.attr =3D 2, /* KVM_VCPU_TSC_EFFECTIVE_FREQ */
+		.addr =3D (uint64_t)(uintptr_t)&freq,
+	};
+
+	vm =3D vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	if (tsc_khz) {
+		pr_info("Testing at TSC frequency %lu kHz\n", tsc_khz);
+		vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *)(unsigned long)tsc_khz);
+	} else {
+		pr_info("Testing at native TSC frequency\n");
+	}
+
+	vcpu_ioctl(vcpu, KVM_GET_DEVICE_ATTR, &freq_attr);
+
+	/* If scaling wasn't applied, skip this frequency */
+	if (tsc_khz && freq.tsc_khz =3D=3D host_khz) {
+		pr_info("  TSC scaling not available, skipping\n");
+		kvm_vm_release(vm);
+		return;
+	}
+
+	pr_info("  Effective TSC: %u kHz, Bus: %u kHz\n", freq.tsc_khz, freq.bus_=
khz);
+
+	/* Also exercise KVM_VCPU_TSC_SCALE if available */
+	{
+		struct { uint64_t ratio; uint64_t frac_bits; } scale;
+		struct kvm_device_attr scale_attr =3D {
+			.group =3D KVM_VCPU_TSC_CTRL,
+			.attr =3D 1, /* KVM_VCPU_TSC_SCALE */
+			.addr =3D (uint64_t)(uintptr_t)&scale,
+		};
+
+		if (!__vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &scale_attr)) {
+			vcpu_ioctl(vcpu, KVM_GET_DEVICE_ATTR, &scale_attr);
+			pr_info("  TSC scale: ratio=3D%lu frac_bits=3D%lu\n",
+				scale.ratio, scale.frac_bits);
+
+			/*
+			 * Verify: applying the ratio to the host TSC frequency
+			 * should give approximately the effective frequency.
+			 */
+			if (tsc_khz) {
+				uint64_t computed =3D ((__uint128_t)host_khz * scale.ratio) >> scale.f=
rac_bits;
+				int64_t diff =3D (int64_t)computed - (int64_t)freq.tsc_khz;
+
+				TEST_ASSERT(diff >=3D -1 && diff <=3D 1,
+					    "TSC_SCALE ratio mismatch: computed %lu vs effective %u (diff %ld=
)",
+					    computed, freq.tsc_khz, diff);
+			}
+		}
+	}
+
+	compute_tsc_mul_shift((uint64_t)freq.tsc_khz * 1000,
+			      &expected_tsc_mul, &expected_tsc_shift);
+
+	expected_tsc_khz =3D freq.tsc_khz;
+	expected_bus_khz =3D freq.bus_khz;
+
+	sync_global_to_guest(vm, expected_tsc_khz);
+	sync_global_to_guest(vm, expected_bus_khz);
+	sync_global_to_guest(vm, expected_tsc_mul);
+	sync_global_to_guest(vm, expected_tsc_shift);
+
+	/* Populate CPUID leaves as a VMM would */
+	add_cpuid_entry(vcpu, GENERIC_TIMING_LEAF, 0,
+			freq.tsc_khz, freq.bus_khz, 0, 0);
+	add_cpuid_entry(vcpu, XEN_CPUID_LEAF(3), 0,
+			0, 0, freq.tsc_khz, 0);
+	add_cpuid_entry(vcpu, XEN_CPUID_LEAF(3), 1,
+			0, 0, expected_tsc_mul,
+			(uint32_t)(uint8_t)expected_tsc_shift);
+
+	vcpu_set_cpuid(vcpu);
+
+	pr_info("  pvclock mul=3D%u shift=3D%d\n", expected_tsc_mul, expected_tsc=
_shift);
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
+	kvm_vm_release(vm);
+}
+
+int main(void)
+{
+	uint64_t freq;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct kvm_device_attr attr =3D {
+		.group =3D KVM_VCPU_TSC_CTRL,
+		.attr =3D 2,
+	};
+
+	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
+
+	/* Check KVM_VCPU_TSC_EFFECTIVE_FREQ is supported */
+	vm =3D vm_create_with_one_vcpu(&vcpu, guest_code);
+	TEST_REQUIRE(!__vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &attr));
+	host_khz =3D __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
+	kvm_vm_release(vm);
+
+	/* Native frequency */
+	run_test(0);
+
+	/* Scaled frequencies =E2=80=94 skip if TSC scaling not available */
+	for (freq =3D 1000000; freq <=3D 4000000; freq +=3D 1000000) {
+		if (freq =3D=3D host_khz)
+			continue;
+		run_test(freq);
+	}
+
+	pr_info("PASS: All CPUID timing leaf tests passed\n");
+	return 0;
+}
--=20
2.43.0



--=-Baioh5K8VSQI5oIkCRkB
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDUxMDIwNTgy
MVowLwYJKoZIhvcNAQkEMSIEIOs+sVtBDqNMC2S7uVGkKA5SADE6/V5PHWpeY5hohXohMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIALmACwOgyLop+
YOTggLSg+h4I46+NTsqWW29MkL15XRfMiYwzVU70RXsHl5I9AseAVYYWtWIQw4p0yXQp6CZvQnmV
P+ZVOogEQfemPFQVSnrgbPJ1aOUZbWFRcZiCpExegtvv18l998XG4wXaKdOpcF6oQnNjh/XcmpTn
4nvIL8S+vxZBe4FrAnY1Se2IkS9m0CTCDCnNd+6rv663fYUJLqj07QcyR1v56StlqXutr62B3ZSg
p3Wl7WURPUyZfvQv/NUS2qOPqV+7SePdHvJ2zT2S0GkmbAQX5LSe/mrKiOuy34gmp7drjaxzmd27
kUMA+4MFCggGs4aBHqEPwjoLxo0tETVLe8E1D10MsCEkI4afz7xOJ+S4gYTz1ib3BbsMTpMquNCD
WAPzadkJA5sSx5ItuLVbV0w9mq7TT/Ueyogjv11nF6c/Gv0lO6UezkvT2Sk6aoAMGvlUwYMyiTY6
4hDvhQqNvIHOb0qRc88gaJxsjioig2ukOhEw4S0blYcqoA2gh5q4yYAiMkszFYQ+I283e3IPeIMg
rcoi3rR/lfC3bUtyRi7ZDaFX3O/BSDynQsjmHxuz0jy8hM4JVg/UvYQMyELGsYcthMOHn5fHdDnr
3Jny1s4zfjzDuX6tE3OSbtbUZsTCzMdGXRYdCAeHpAXh03cGLqrozifAgT8HO6wAAAAAAAA=


--=-Baioh5K8VSQI5oIkCRkB--

