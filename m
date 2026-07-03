Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bCrBACMoSGohnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4312705BE0
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=fcUVvHAI;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353758.1609512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKr-0006cn-E4; Fri, 03 Jul 2026 21:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353758.1609512; Fri, 03 Jul 2026 21:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKr-0006Td-2u; Fri, 03 Jul 2026 21:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1353758;
 Fri, 03 Jul 2026 21:22:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wflKo-0005hr-LN
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflKo-00BXCb-1w; Fri, 03 Jul 2026 23:22:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a48279b-2eae-0a2a0a5409dd-0a2a45019e62-24
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:01 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827f8-400f-0a2a45010019-5a9b3222a836-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:01 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wflKX-0000000AsYS-3lGH; Fri, 03 Jul 2026 21:21:50 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKX-00000001RQI-3LPT;
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
	bh=9YLu6jUxizeyw6FPvXNgLWAHtpjzd7Ja/IQI9k+fk+s=; b=fcUVvHAIPPdYkE7/dYS8PsNO0M
	0l7rKpCfaWyv7qnO627IUm/45JZzCNXpKFxdSx3aOe4X/asoyK1w+W3ZNk66BM8q3BbjYRzGNQLNV
	FIOdbKNq2+NaKcooJ/SV2aSPahIzidPDXtyB92+iE1701oAJYZIobMAgIC8rg0p2P6qLAa9eY/PVl
	/pGKXDoXfX1z+5rZmDtJJ9Wv34vMFTG3iFXgK7vu2PgYTbtbFTcJhelUV/ioie3vUIgVLGidMeVnR
	PeaxJ2Y8zB3aSgCvh1ZPeMDKjka+OYRslMm979N9HKfPZmmsO4HL0U8OnTYlA/VVYGrcVlh/JcdzD
	AnicB8aQ==;
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
Subject: [PATCH v6 36/36] KVM: x86: Activate master clock from kvm_arch_init_vm()
Date: Fri,  3 Jul 2026 22:18:15 +0100
Message-ID: <20260703212145.343527-37-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1783113721-D18C31E0-8D48DA2E/0/0
X-purgate-type: clean
X-purgate-size: 4143
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid];
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
X-Rspamd-Queue-Id: A4312705BE0

From: David Woodhouse <dwmw@amazon.co.uk>

Initialize the TSC generation and master clock state at VM creation
time, rather than relying on kvm_update_masterclock() from
kvm_arch_vcpu_postcreate().

Set cur_tsc_generation=1, cur_tsc_khz, cur_tsc_scaling_ratio,
cur_tsc_offset, cur_tsc_nsec and kvmclock_offset from an atomic
ktime/TSC snapshot. This establishes a coherent epoch so that:

 - The first vCPU synchronizes to the existing generation (getting
   the pre-computed TSC offset) rather than computing its own.
 - pvclock_update_vm_gtod_copy() succeeds immediately (no zero
   tsc_hz from uninitialized cur_tsc_scaling_ratio).
 - KVM_GET_CLOCK returns valid {host_tsc, realtime} fields as soon
   as any vCPU exists.
 - KVM_[GS]ET_CLOCK_GUEST works without a prior KVM_RUN.
 - No O(N) iteration of all vCPUs on each vCPU creation.

This replaces the kvm_update_masterclock() call that was added to
kvm_arch_vcpu_postcreate() to work around the missing initialization.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro (claude-opus-4.6-1m)
---
 arch/x86/kvm/x86.c | 45 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 58016af64932..d35f2ac3ef49 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13161,8 +13161,6 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 		return;
 	vcpu_load(vcpu);
 	kvm_synchronize_tsc(vcpu, NULL);
-	if (!vcpu->kvm->arch.use_master_clock)
-		kvm_update_masterclock(vcpu->kvm, NULL);
 	vcpu_put(vcpu);
 
 	/* poll control enabled by default */
@@ -13572,6 +13570,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
 	unsigned long flags;
+	u64 kvmclock_host_tsc;
+	s64 kvmclock_ns;
 
 	if (!kvm_is_vm_type_supported(type))
 		return -EINVAL;
@@ -13603,18 +13603,47 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	seqcount_raw_spinlock_init(&kvm->arch.pvclock_sc, &kvm->arch.tsc_write_lock);
 	ratelimit_state_init(&kvm->arch.kvmclock_update_rs, HZ, 10);
 	ratelimit_set_flags(&kvm->arch.kvmclock_update_rs, RATELIMIT_MSG_ON_RELEASE);
-	kvm->arch.kvmclock_offset = -get_kvmclock_base_ns();
-	kvm->arch.all_vcpus_matched_freq = true;
-
-	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
-	pvclock_update_vm_gtod_copy(kvm);
-	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
 
 	kvm->arch.default_tsc_khz = max_tsc_khz ? : tsc_khz;
 	kvm->arch.apic_bus_cycle_ns = APIC_BUS_CYCLE_NS_DEFAULT;
 	kvm->arch.guest_can_read_msr_platform_info = true;
 	kvm->arch.enable_pmu = enable_pmu;
 
+	kvm->arch.all_vcpus_matched_freq = true;
+	kvm->arch.all_vcpus_matched_tsc = true;
+	kvm->arch.cur_tsc_scaling_ratio = kvm_caps.default_tsc_scaling_ratio;
+	kvm->arch.cur_tsc_khz = kvm->arch.default_tsc_khz;
+
+	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
+
+	/*
+	 * Establish the initial TSC generation for synchronization logic.
+	 * The first vCPU will sync to this, starting its guest TSC at the
+	 * number of cycles elapsed since VM creation rather than at zero.
+	 * This ensures coherence with the kvmclock epoch (also set here)
+	 * and means the master clock snapshot taken below is immediately
+	 * valid — no need to redo it at first vCPU creation.
+	 */
+#ifdef CONFIG_X86_64
+	if (!kvm_get_time_and_clockread(&kvmclock_ns, &kvmclock_host_tsc))
+#endif
+	{
+		/*
+		 * If not simultaneous, we want the TSC to be zero slightly
+		 * *after* the kvmclock is zero.
+		 */
+		kvmclock_ns = get_kvmclock_base_ns();
+		kvmclock_host_tsc = rdtsc();
+	}
+	kvm->arch.cur_tsc_write = 0;
+	kvm->arch.cur_tsc_offset = -(s64)kvmclock_host_tsc;
+	kvm->arch.cur_tsc_nsec = kvmclock_ns;
+	kvm->arch.cur_tsc_generation = 1;
+	kvm->arch.kvmclock_offset = -kvmclock_ns;
+
+	pvclock_update_vm_gtod_copy(kvm);
+	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
+
 #if IS_ENABLED(CONFIG_HYPERV)
 	spin_lock_init(&kvm->arch.hv_root_tdp_lock);
 	kvm->arch.hv_root_tdp = INVALID_PAGE;
-- 
2.54.0


