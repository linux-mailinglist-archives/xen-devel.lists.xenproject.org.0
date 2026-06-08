Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WPDEHenXJmqIlgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FE657A28
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=hJmTbo0V;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331715.1594388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNw-0004mP-DQ; Mon, 08 Jun 2026 14:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331715.1594388; Mon, 08 Jun 2026 14:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNv-0004PC-0h; Mon, 08 Jun 2026 14:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1331715;
 Mon, 08 Jun 2026 14:55:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wWbNk-0002Hj-Rv
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNk-00AKVN-8I; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7c6-2eae-0a2a0a5409dd-0a2a450596fa-20
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7d3-aaa8-0a2a45050019-5a9b5cc7b614-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wWbNU-00000001AgM-2M92; Mon, 08 Jun 2026 14:55:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNS-00000000NGE-2kHD;
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
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=mAoCrW41i2oubtWoRcSbcZKOTJ7hLP/U/r8vkThOrIU=; b=hJmTbo0VQUYJIJ5SiadsI+2Oi6
	MKKp3iSxBITfY/0JfC1ulBP5KmALb63BQVFZ5VBIZ8zHsl+fv1IbRJswv4zVZ5Gd2YEyx68z/xCIY
	y8evaf+XUEww9YTdUGtalJxvTdrTL+sGNRUiaP31Pf1Y9FnGQ9ltnFdiv8mJE23LklblzcqdllpIf
	VZv83tdmjr0SAKriU5YRvhiHcTjfa8VG0A48nvBVSyi0PPOrE1P6WtBDCvpdneNT6I/ngEMGo+ueG
	He7tGsQdtSYrAz3HrHHEnKW9d9JmO462eHtQeKqgzNHIngCwn1xabEDqaGgl5+HSPMg6o+1/bWfPY
	lQ71nmTQ==;
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
Subject: [PATCH v5 27/34] KVM: x86: Remove runtime Xen TSC frequency CPUID update
Date: Mon,  8 Jun 2026 15:48:08 +0100
Message-ID: <20260608145455.89187-28-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c201ff/1780930516-DA76A443-E1A010EA/0/0
X-purgate-type: clean
X-purgate-size: 3099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 278FE657A28

From: David Woodhouse <dwmw@amazon.co.uk>

Remove the code in kvm_cpuid() that dynamically updates the Xen TSC
info CPUID leaf at runtime. This code was updating the wrong sub-leaf
anyway (0x40000x03/2 EAX is the *host* TSC frequency per the Xen ABI,
not the guest frequency which belongs in 0x40000x03/0 ECX).

Userspace now has all the information it needs to populate the Xen TSC
info leaves (and the generic 0x40000010 timing leaf) at vCPU setup time:

  - KVM_GET_CLOCK_GUEST returns the pvclock_vcpu_time_info structure
    containing tsc_to_system_mul and tsc_shift (Xen leaf index 1)
  - KVM_VCPU_TSC_SCALE returns the effective TSC and bus
    frequencies in kHz (Xen leaf index 2, and 0x40000010)
  - KVM_VCPU_TSC_SCALE returns the raw hardware scaling ratio for
    precise arithmetic (VMClock)

This eliminates the last instance of KVM modifying guest CPUID entries
at runtime for timing information.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/cpuid.c | 16 ----------------
 arch/x86/kvm/xen.h   | 13 -------------
 2 files changed, 29 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 621d950ec692..826637a0b72d 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -2117,22 +2117,6 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
 		} else if (function == 0x80000007) {
 			if (kvm_hv_invtsc_suppressed(vcpu))
 				*edx &= ~feature_bit(CONSTANT_TSC);
-		} else if (IS_ENABLED(CONFIG_KVM_XEN) &&
-			   kvm_xen_is_tsc_leaf(vcpu, function)) {
-			/*
-			 * Update guest TSC frequency information if necessary.
-			 * Ignore failures, there is no sane value that can be
-			 * provided if KVM can't get the TSC frequency.
-			 */
-			if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, vcpu))
-				kvm_guest_time_update(vcpu);
-
-			if (index == 1) {
-				*ecx = vcpu->arch.pvclock_tsc_mul;
-				*edx = vcpu->arch.pvclock_tsc_shift;
-			} else if (index == 2) {
-				*eax = div_u64(vcpu->arch.hw_tsc_hz, 1000);
-			}
 		}
 	} else {
 		*eax = *ebx = *ecx = *edx = 0;
diff --git a/arch/x86/kvm/xen.h b/arch/x86/kvm/xen.h
index 59e6128a7bd3..f372855857a8 100644
--- a/arch/x86/kvm/xen.h
+++ b/arch/x86/kvm/xen.h
@@ -50,14 +50,6 @@ static inline void kvm_xen_sw_enable_lapic(struct kvm_vcpu *vcpu)
 		kvm_xen_inject_vcpu_vector(vcpu);
 }
 
-static inline bool kvm_xen_is_tsc_leaf(struct kvm_vcpu *vcpu, u32 function)
-{
-	return static_branch_unlikely(&kvm_xen_enabled.key) &&
-	       vcpu->arch.xen.cpuid.base &&
-	       function <= vcpu->arch.xen.cpuid.limit &&
-	       function == (vcpu->arch.xen.cpuid.base | XEN_CPUID_LEAF(3));
-}
-
 static inline bool kvm_xen_msr_enabled(struct kvm *kvm)
 {
 	return static_branch_unlikely(&kvm_xen_enabled.key) &&
@@ -177,11 +169,6 @@ static inline bool kvm_xen_timer_enabled(struct kvm_vcpu *vcpu)
 {
 	return false;
 }
-
-static inline bool kvm_xen_is_tsc_leaf(struct kvm_vcpu *vcpu, u32 function)
-{
-	return false;
-}
 #endif
 
 int kvm_xen_hypercall(struct kvm_vcpu *vcpu);
-- 
2.54.0


