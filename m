Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BomTJ+DXJmp0lgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407576579E2
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=dB1mnmM6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331707.1594300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNk-0002D7-PV; Mon, 08 Jun 2026 14:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331707.1594300; Mon, 08 Jun 2026 14:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNk-00025i-B7; Mon, 08 Jun 2026 14:55:16 +0000
Received: by outflank-mailman (input) for mailman id 1331707;
 Mon, 08 Jun 2026 14:55:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbNh-0001P6-TP
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNh-00EcHH-95; Mon, 08 Jun 2026 16:55:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7c9-bab6-0a2a0a5309dd-0a2a4503be90-16
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:13 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d0-672d-0a2a45030019-5a9b3222d954-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:13 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNS-0000000DtxR-0or9; Mon, 08 Jun 2026 14:54:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNS-00000000NFq-1gTE;
 Mon, 08 Jun 2026 15:54:58 +0100
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
	bh=cmBqqtGJwbuFFzQ3xL4KAIBfESZHairUslQqBI77Ze0=; b=dB1mnmM67CSlPJ6qjMZQQjgdYG
	Wvrfg4w3dEFSg2McKUMLj7rJRsW2heHp4o5GCCWuu7n8rYuEJbnowfNdy8nwZZEECFDzCuY1rFpeI
	tTHDpGf+o6xNA2jP69ahEanmXVrPb/JeZd1tefKD11xaBN6l9FLgluxY4zEqEFAhJ2EFpIRBQPGig
	R6VZDpVufIAjpY1rbFjXr+woncXFvfV6Jrc1PGg/gZoh4b8QZkmL4RJQZgSuPO6Y4WpUSRmKeGUpa
	GQgB0qyhndvUYvNOeBQs0vTz/R805XKvXREXqgPNbSllBj2QKpXgaOSasLbcdLxFhYlbqVHB01qy9
	xmXunmwg==;
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
Subject: [PATCH v5 21/34] KVM: x86: Allow KVM master clock mode when TSCs are offset from each other
Date: Mon,  8 Jun 2026 15:48:02 +0100
Message-ID: <20260608145455.89187-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-33051d/1780930513-37340938-D226680D/0/0
X-purgate-type: clean
X-purgate-size: 8693
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
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
X-Rspamd-Queue-Id: 407576579E2

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, a guest writing different TSC values on different vCPUs could
force KVM out of master clock mode. With this change, only a frequency
mismatch disables master clock. The only ways for non-master-clock mode
to happen now are archaic hardware without a TSC-based clocksource, or a
VMM that sets different TSC frequencies across vCPUs.

Running at a different frequency would lead to a systemic skew between
the clock(s) as observed by different vCPUs due to arithmetic precision
in the scaling. So that should indeed force the clock to be based on the
host's CLOCK_MONOTONIC_RAW instead of being in masterclock mode where it
is defined by the guest TSC.

But when the vCPUs merely have a different TSC *offset*, that's not a
problem. The offset is applied to that vCPU's kvmclock->tsc_timestamp
field, and it all comes out in the wash.

Track frequency matching separately from offset matching using a
dedicated freq generation counter (cur_tsc_freq_generation) that only
bumps on actual frequency changes. Each vCPU is counted exactly once per
freq generation via a per-vCPU this_tsc_freq_generation field, preventing
repeated syncs of the same vCPU from falsely re-enabling master clock.

Note that the generation-based counting has a known limitation: if all
vCPUs are in sync and one changes away and then back again, the other
vCPUs are still at the old generation and won't be counted until they
sync again (which may never happen). This was always the case for the
offset tracking and isn't expected VMM behaviour — although it is the
scenario that the VM-wide KVM_SET_TSC_KHZ ioctl was introduced to handle
cleanly.

While at it, restructure the existing TSC offset generation tracking to
use the same pattern: reset counter to zero on new generation, then
unconditionally count vCPUs that haven't been seen in this generation.
Both counters now use a consistent >= online_vcpus threshold (1-based
counting where the reference vCPU is included in the count).

Use frequency match for master clock eligibility, and full TSC match
(including offset) only for PVCLOCK_TSC_STABLE_BIT, which tells the
guest it is safe to skip cross-vCPU monotonicity enforcement.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  4 ++
 arch/x86/kvm/x86.c              | 68 ++++++++++++++++++++++++++-------
 2 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index eb81f90284ba..699a1a197194 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -970,6 +970,7 @@ struct kvm_vcpu_arch {
 	u64 this_tsc_nsec;
 	u64 this_tsc_write;
 	u64 this_tsc_generation;
+	u64 this_tsc_freq_generation;
 	bool tsc_catchup;
 	bool tsc_always_catchup;
 	s8 virtual_tsc_shift;
@@ -1493,6 +1494,9 @@ struct kvm_arch {
 	u64 cur_tsc_offset;
 	u64 cur_tsc_generation;
 	bool all_vcpus_matched_tsc;
+	bool all_vcpus_matched_freq;
+	int nr_vcpus_matched_freq;
+	u64 cur_tsc_freq_generation;
 	int nr_vcpus_matched_tsc;
 
 	u32 default_tsc_khz;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ac66f8e7116f..86c30be4c5d2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2647,14 +2647,37 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
 
 	/*
-	 * To use the masterclock, the host clocksource must be based on TSC
-	 * and all vCPUs must have matching TSCs.  Note, the count for matching
-	 * vCPUs doesn't include the reference vCPU, hence "+1".
+	 * Track whether all vCPUs have matching TSC offsets (for
+	 * PVCLOCK_TSC_STABLE_BIT) and matching frequencies (for
+	 * master clock eligibility).
+	 */
+
+	/*
+	 * A new vCPU might already have incremented ->online_vcpus
+	 * and cause a temporary false negative here. But will then
+	 * call kvm_synchronize_tsc() from kvm_arch_vcpu_postcreate()
+	 * and finish the job.
 	 */
-	ka->all_vcpus_matched_tsc = (ka->nr_vcpus_matched_tsc + 1 ==
-				     atomic_read(&vcpu->kvm->online_vcpus));
+	int online = atomic_read(&vcpu->kvm->online_vcpus);
 
-	bool use_master_clock = ka->all_vcpus_matched_tsc &&
+	ka->all_vcpus_matched_tsc = (ka->nr_vcpus_matched_tsc >= online);
+	/*
+	 * all_vcpus_matched_freq starts true and is cleared when
+	 * __kvm_synchronize_tsc() detects a frequency mismatch.
+	 * Re-enable when all vCPUs have synced with matching frequency.
+	 * If all offsets also match, that implies frequencies match too.
+	 */
+	if (ka->all_vcpus_matched_tsc ||
+	    ka->nr_vcpus_matched_freq >= online)
+		ka->all_vcpus_matched_freq = true;
+
+	/*
+	 * To use the masterclock, the host clocksource must be based on TSC
+	 * and all vCPUs must have matching TSC *frequency*. Different offsets
+	 * are fine — each vCPU's pvclock has its own tsc_timestamp that
+	 * accounts for its offset.
+	 */
+	bool use_master_clock = ka->all_vcpus_matched_freq &&
 				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
 
 	/*
@@ -2818,7 +2841,22 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 	 * Track the TSC frequency, scaling ratio, and offset for the current
 	 * generation. These are used to detect matching TSC writes and to
 	 * compute the guest TSC from the host clock.
+	 *
+	 * If the frequency changed, master clock mode can no longer be used
+	 * since the kvmclock scaling factors differ between vCPUs.
 	 */
+	if (vcpu->arch.virtual_tsc_khz != kvm->arch.cur_tsc_khz) {
+		kvm->arch.cur_tsc_freq_generation++;
+		kvm->arch.all_vcpus_matched_freq = false;
+		kvm->arch.nr_vcpus_matched_freq = 0;
+	}
+
+	/* Count each vCPU once per freq generation */
+	if (vcpu->arch.this_tsc_freq_generation != kvm->arch.cur_tsc_freq_generation) {
+		vcpu->arch.this_tsc_freq_generation = kvm->arch.cur_tsc_freq_generation;
+		kvm->arch.nr_vcpus_matched_freq++;
+	}
+
 	kvm->arch.cur_tsc_khz = vcpu->arch.virtual_tsc_khz;
 	kvm->arch.cur_tsc_scaling_ratio = vcpu->arch.l1_tsc_scaling_ratio;
 
@@ -2835,17 +2873,18 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 		 * exact software computation in compute_guest_tsc()
 		 */
 		kvm->arch.cur_tsc_generation++;
+		kvm->arch.all_vcpus_matched_tsc = false;
+		kvm->arch.nr_vcpus_matched_tsc = 0;
 		kvm->arch.cur_tsc_nsec = ns;
 		kvm->arch.cur_tsc_write = tsc;
 		kvm->arch.cur_tsc_offset = offset;
-		kvm->arch.nr_vcpus_matched_tsc = 0;
-		kvm->arch.all_vcpus_matched_tsc = false;
-	} else if (vcpu->arch.this_tsc_generation != kvm->arch.cur_tsc_generation) {
+	}
+
+	if (vcpu->arch.this_tsc_generation != kvm->arch.cur_tsc_generation) {
+		vcpu->arch.this_tsc_generation = kvm->arch.cur_tsc_generation;
 		kvm->arch.nr_vcpus_matched_tsc++;
 	}
 
-	/* Keep track of which generation this VCPU has synchronized to */
-	vcpu->arch.this_tsc_generation = kvm->arch.cur_tsc_generation;
 	vcpu->arch.this_tsc_nsec = kvm->arch.cur_tsc_nsec;
 	vcpu->arch.this_tsc_write = kvm->arch.cur_tsc_write;
 
@@ -3180,7 +3219,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 	bool host_tsc_clocksource, vcpus_matched;
 
 	lockdep_assert_held(&kvm->arch.tsc_write_lock);
-	vcpus_matched = ka->all_vcpus_matched_tsc;
+	vcpus_matched = ka->all_vcpus_matched_freq;
 
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
@@ -3527,7 +3566,7 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 
 	/* If the host uses TSC clocksource, then it is stable */
 	hv_clock.flags = 0;
-	if (use_master_clock)
+	if (use_master_clock && ka->all_vcpus_matched_tsc)
 		hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
 
 	if (vcpu->pv_time.active) {
@@ -6354,7 +6393,7 @@ static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __user *argp)
 
 	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
 	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
-	hv_clock.flags = PVCLOCK_TSC_STABLE_BIT;
+	hv_clock.flags = ka->all_vcpus_matched_tsc ? PVCLOCK_TSC_STABLE_BIT : 0;
 
 	if (copy_to_user(argp, &hv_clock, sizeof(hv_clock)))
 		return -EFAULT;
@@ -13649,6 +13688,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	mutex_init(&kvm->arch.apic_map_lock);
 	seqcount_raw_spinlock_init(&kvm->arch.pvclock_sc, &kvm->arch.tsc_write_lock);
 	kvm->arch.kvmclock_offset = -get_kvmclock_base_ns();
+	kvm->arch.all_vcpus_matched_freq = true;
 
 	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 	pvclock_update_vm_gtod_copy(kvm);
-- 
2.54.0


