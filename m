Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOG3Idm6/2mm9wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:53:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E099501D96
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305124.1577836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXi-0008FY-2V; Sat, 09 May 2026 22:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305124.1577836; Sat, 09 May 2026 22:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXh-00089s-GF; Sat, 09 May 2026 22:53:05 +0000
Received: by outflank-mailman (input) for mailman id 1305124;
 Sat, 09 May 2026 22:53:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wLqXe-0007kw-Ga
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:53:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqXd-002c5y-Ts; Sun, 10 May 2026 00:53:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffba4c-e002-0a2a0a5209dd-0a2a450ae9e4-24
 for <multiple-recipients>; Sun, 10 May 2026 00:53:01 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb9dc-56b3-0a2a450a0019-5a9b5cc7b01a-3
 for <multiple-recipients>; Sun, 10 May 2026 00:49:00 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-00000008wzK-0NIx; Sat, 09 May 2026 22:48:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTD-0000000DhIf-06oU;
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=kOxo26JgkgBnkgpV4u4u6bNS0TzdmD76LNhTnJ/HBkg=; b=S1Qj7ot+NvaVb/ETnLNcOSWLI7
	a8uV8eSZQIwsFNUiD0HkK8FYHDMAVTpOBbqWewmXi9iTOyErjosby5Pac1eE/QdywtKg3s1IgXLek
	HsNyTFM+ykVPLWmEpjCYTbzPzXkWq2gBFRY2VWy5lSXutf/hfKCAX5QZID2vs2Qba7bmYbLFSYdHJ
	e63CuDfT1qC1GqGhST/XGcE8ayKk2efxCazSVC33178g9UgpHiWeSxDzwAU6HGywcZLQDaNc+JTqO
	f/VY+Sc/cuha12qsM/abTJXD6y2KRPxWwrDd1pwd3HDISKnYc2g96zWw4BFuGCu9pg1BtxPbgj7Dm
	WQFH5k/g==;
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
Subject: [PATCH v4 22/30] KVM: x86: Allow KVM master clock mode when TSCs are offset from each other
Date: Sat,  9 May 2026 23:46:48 +0100
Message-ID: <20260509224824.3264567-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1778366940-727758B7-C95BCE30/13/0
X-purgate-type: clean
X-purgate-size: 4581
X-Rspamd-Queue-Id: 3E099501D96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: David Woodhouse <dwmw@amazon.co.uk>

There is no reason why the KVM clock cannot be in masterclock mode when
the TSCs are not in sync, as long as they are at the same *frequency*.

Running at a different frequency would lead to a systemic skew between
the clock(s) as observed by different vCPUs due to arithmetic precision
in the scaling. So that should indeed force the clock to be based on the
host's CLOCK_MONOTONIC_RAW instead of being in masterclock mode where it
is defined by the guest TSC.

But when the vCPUs merely have a different TSC *offset*, that's not a
problem. The offset is applied to that vCPU's kvmclock->tsc_timestamp
field, and it all comes out in the wash.

Track frequency matching separately from full TSC matching. Use
frequency match for master clock eligibility, and full TSC match
(including offset) only for PVCLOCK_TSC_STABLE_BIT, which tells the
guest it is safe to skip cross-vCPU monotonicity enforcement.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/x86.c              | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index eb81f90284ba..c770c63087cb 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1493,6 +1493,7 @@ struct kvm_arch {
 	u64 cur_tsc_offset;
 	u64 cur_tsc_generation;
 	bool all_vcpus_matched_tsc;
+	bool all_vcpus_matched_freq;
 	int nr_vcpus_matched_tsc;
 
 	u32 default_tsc_khz;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b74fd8b088ad..d36d03b8268e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2647,13 +2647,22 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
 
 	/*
-	 * To use the masterclock, the host clocksource must be based on TSC
-	 * and all vCPUs must have matching TSCs.
+	 * Track whether all vCPUs have matching TSC offsets (for
+	 * PVCLOCK_TSC_STABLE_BIT) and matching frequencies (for
+	 * master clock eligibility).
 	 */
 	ka->all_vcpus_matched_tsc = (ka->nr_vcpus_matched_tsc + 1 ==
 				     atomic_read(&vcpu->kvm->online_vcpus));
+	if (ka->all_vcpus_matched_tsc)
+		ka->all_vcpus_matched_freq = true;
 
-	bool use_master_clock = ka->all_vcpus_matched_tsc &&
+	/*
+	 * To use the masterclock, the host clocksource must be based on TSC
+	 * and all vCPUs must have matching TSC *frequency*. Different offsets
+	 * are fine — each vCPU's pvclock has its own tsc_timestamp that
+	 * accounts for its offset.
+	 */
+	bool use_master_clock = ka->all_vcpus_matched_freq &&
 				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
 
 	/*
@@ -2817,7 +2826,13 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 	 * Track the TSC frequency, scaling ratio, and offset for the current
 	 * generation. These are used to detect matching TSC writes and to
 	 * compute the guest TSC from the host clock.
+	 *
+	 * If the frequency changed, master clock mode can no longer be used
+	 * since the kvmclock scaling factors differ between vCPUs.
 	 */
+	if (vcpu->arch.virtual_tsc_khz != kvm->arch.cur_tsc_khz)
+		kvm->arch.all_vcpus_matched_freq = false;
+
 	kvm->arch.cur_tsc_khz = vcpu->arch.virtual_tsc_khz;
 	kvm->arch.cur_tsc_scaling_ratio = vcpu->arch.l1_tsc_scaling_ratio;
 
@@ -3178,7 +3193,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 	bool host_tsc_clocksource, vcpus_matched;
 
 	lockdep_assert_held(&kvm->arch.tsc_write_lock);
-	vcpus_matched = ka->all_vcpus_matched_tsc;
+	vcpus_matched = ka->all_vcpus_matched_freq;
 
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
@@ -3513,7 +3528,7 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 
 	/* If the host uses TSC clocksource, then it is stable */
 	hv_clock.flags = 0;
-	if (use_master_clock)
+	if (use_master_clock && ka->all_vcpus_matched_tsc)
 		hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
 
 	if (vcpu->pv_time.active) {
@@ -6340,7 +6355,7 @@ static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __user *argp)
 
 	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
 	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
-	hv_clock.flags = PVCLOCK_TSC_STABLE_BIT;
+	hv_clock.flags = ka->all_vcpus_matched_tsc ? PVCLOCK_TSC_STABLE_BIT : 0;
 
 	if (copy_to_user(argp, &hv_clock, sizeof(hv_clock)))
 		return -EFAULT;
-- 
2.51.0


