Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pN8HDPe5/2m29wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:49:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BFC501B65
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 00:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304996.1577640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTZ-0005ud-9O; Sat, 09 May 2026 22:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304996.1577640; Sat, 09 May 2026 22:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTY-0005gC-Rk; Sat, 09 May 2026 22:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1304996;
 Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wLqTV-0004yZ-T7
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqTV-00DG64-A9; Sun, 10 May 2026 00:48:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb98b-e002-0a2a0a5209dd-0a2a4508e700-30
 for <multiple-recipients>; Sun, 10 May 2026 00:48:45 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb9cd-63b5-0a2a45080019-5a9b5cc7a050-3
 for <multiple-recipients>; Sun, 10 May 2026 00:48:45 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-00000008wz6-0Xpp; Sat, 09 May 2026 22:48:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTB-0000000DhHM-4BHL;
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
	bh=wfrMtj5ZnQw5qzm4tVj9nJs76L69YTBE+psOfwhJUqs=; b=WH1+Pf0sgeUE/1kLOZi2zQe61+
	clX/XjFXxTT+HlO735BJ+oBKA2xFoMIwzCRYs9uPFc+tsR2LTvxBT9YU2rhNSq4xECjvRfuLc5zvP
	uUPr2hiZ/luP/qeJhQYWXATigOx1W799RsiWGCpFIGVbB6n1zkpYPwFnjZDgbFJLCzS+5x7nuIzvk
	aISbB4j22HT0p5iIcmczYYifqI4UCo1f4iaIVWGou3HmdziKDWtow1GUkQEwb1vSxtNUPcvB1WESA
	20D4xRu8stcXhQ493WDRq1vz29jJfNmBc2S8KOifh8+DNtKnbo0Js6r6FJVLPKtAmF3LKaTEaWwmV
	SJuOPcbw==;
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
Subject: [PATCH v4 02/30] KVM: x86: Improve accuracy of KVM clock when TSC scaling is in force
Date: Sat,  9 May 2026 23:46:28 +0100
Message-ID: <20260509224824.3264567-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1778366925-BE776DB1-84D15631/0/0
X-purgate-type: clean
X-purgate-size: 4034
X-Rspamd-Queue-Id: A0BFC501B65
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email,xen.org:email];
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

The kvm_guest_time_update() function scales the host TSC frequency to
the guest's using kvm_scale_tsc() and the v->arch.l1_tsc_scaling_ratio
scaling ratio previously calculated for that vCPU. Then calculates the
scaling factors for the KVM clock itself based on that guest TSC
frequency.

However, it uses kHz as the unit when scaling, and then multiplies by
1000 only at the end.

With a host TSC frequency of 3000MHz and a guest set to 2500MHz, the
result of kvm_scale_tsc() will actually come out at 2,499,999kHz. So
the KVM clock advertised to the guest is based on a frequency of
2,499,999,000 Hz.

By using Hz as the unit from the beginning, the KVM clock would be based
on a more accurate frequency of 2,499,999,999 Hz in this example.

Use u64 for the hw_tsc_hz field since an unsigned int would overflow for
TSC frequencies above 4GHz. Use div_u64() for the Xen CPUID leaf to
play nice with 32-bit kernels.

Fixes: 78db6a503796 ("KVM: x86: rewrite handling of scaled TSC for kvmclock")
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/cpuid.c            |  2 +-
 arch/x86/kvm/x86.c              | 17 +++++++++--------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c470e40a00aa..37264212c7df 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -950,7 +950,7 @@ struct kvm_vcpu_arch {
 	gpa_t time;
 	s8  pvclock_tsc_shift;
 	u32 pvclock_tsc_mul;
-	unsigned int hw_tsc_khz;
+	u64 hw_tsc_hz;
 	struct gfn_to_pfn_cache pv_time;
 	/* set guest stopped flag in pvclock flags field */
 	bool pvclock_set_guest_stopped_request;
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e69156b54cff..621d950ec692 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -2131,7 +2131,7 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
 				*ecx = vcpu->arch.pvclock_tsc_mul;
 				*edx = vcpu->arch.pvclock_tsc_shift;
 			} else if (index == 2) {
-				*eax = vcpu->arch.hw_tsc_khz;
+				*eax = div_u64(vcpu->arch.hw_tsc_hz, 1000);
 			}
 		}
 	} else {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0a1b63c63d1a..d9ef165df6a1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3314,7 +3314,8 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
 int kvm_guest_time_update(struct kvm_vcpu *v)
 {
 	struct pvclock_vcpu_time_info hv_clock = {};
-	unsigned long flags, tgt_tsc_khz;
+	unsigned long flags;
+	u64 tgt_tsc_hz;
 	unsigned seq;
 	struct kvm_vcpu_arch *vcpu = &v->arch;
 	struct kvm_arch *ka = &v->kvm->arch;
@@ -3340,8 +3341,8 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 
 	/* Keep irq disabled to prevent changes to the clock */
 	local_irq_save(flags);
-	tgt_tsc_khz = get_cpu_tsc_khz();
-	if (unlikely(tgt_tsc_khz == 0)) {
+	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
+	if (unlikely(tgt_tsc_hz == 0)) {
 		local_irq_restore(flags);
 		kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
 		return 1;
@@ -3376,16 +3377,16 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 	/* With all the info we got, fill in the values */
 
 	if (kvm_caps.has_tsc_control) {
-		tgt_tsc_khz = kvm_scale_tsc(tgt_tsc_khz,
+		tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
 					    v->arch.l1_tsc_scaling_ratio);
-		tgt_tsc_khz = tgt_tsc_khz ? : 1;
+		tgt_tsc_hz = tgt_tsc_hz ? : 1;
 	}
 
-	if (unlikely(vcpu->hw_tsc_khz != tgt_tsc_khz)) {
-		kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_khz * 1000LL,
+	if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
+		kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
 				   &vcpu->pvclock_tsc_shift,
 				   &vcpu->pvclock_tsc_mul);
-		vcpu->hw_tsc_khz = tgt_tsc_khz;
+		vcpu->hw_tsc_hz = tgt_tsc_hz;
 	}
 
 	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
-- 
2.51.0


