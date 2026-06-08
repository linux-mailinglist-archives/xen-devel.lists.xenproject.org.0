Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BomTJ+DXJmp0lgIAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4D6579E5
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=kld3KJEK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331704.1594281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNj-0001r6-F9; Mon, 08 Jun 2026 14:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331704.1594281; Mon, 08 Jun 2026 14:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNj-0001gQ-6K; Mon, 08 Jun 2026 14:55:15 +0000
Received: by outflank-mailman (input) for mailman id 1331704;
 Mon, 08 Jun 2026 14:55:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbNh-0001Ok-IK
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNg-008Slm-VL; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7c3-e002-0a2a0a5209dd-0a2a4508bf20-22
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d0-63b5-0a2a45080019-5a9b3222c400-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNR-0000000DtxG-4BPF; Mon, 08 Jun 2026 14:54:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNS-00000000NFa-0ldF;
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
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=mXbhskdA++vhUDI1oas++LQ6MKrW1eT7EmECWvGk1MU=; b=kld3KJEKyVhgHwNB9MXsgtFGHM
	NRk8kDLq4sjWFPSiEYCazB3mLYrvTTJPUeVyZ8Adpmnt0NNFfaZoiBsBTHBZiMcMB/VwcWUxwxy7g
	lNILHXZ/Blw5vKOImjaz2dxZqvHuPxZKmZfM2mAtOIsTRmAupSROxT8IOZPNFf5YWr8Aqcjni3HSu
	Tm5dD4wjccOy5vGXBPeqCifw70AHNUqkba5MbwYlq1/G6tBhhz1sBC19DaWllKo9KdUR/kDGv0bZD
	UP7MppcYr9VAmJQO2gCb91fWtWdSBSqhI7QLwJi8L+i/vREiicZBMMi+ceG/pcLoDUSrhXoBZt8ha
	9XciMkyw==;
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
Subject: [PATCH v5 17/34] KVM: x86: Remove implicit rdtsc() from kvm_compute_l1_tsc_offset()
Date: Mon,  8 Jun 2026 15:47:58 +0100
Message-ID: <20260608145455.89187-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1780930512-BF171DB1-E00BEBBE/0/0
X-purgate-type: clean
X-purgate-size: 2890
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
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
X-Rspamd-Queue-Id: 83E4D6579E5

From: David Woodhouse <dwmw@amazon.co.uk>

Let the callers pass the host TSC value in as an explicit parameter.
This leaves some fairly obviously stupid code, which is using this
function to compare the guest TSC at some *other* time, with the
newly-minted TSC value from rdtsc(). Unless it's being used to measure
*elapsed* time, that isn't very sensible.

In this case, "obviously stupid" is an improvement over being
non-obviously so.

No functional change intended.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/x86.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a6c31a0d9955..bce4c7a6a6fe 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2693,11 +2693,12 @@ u64 kvm_scale_tsc(u64 tsc, u64 ratio)
 	return _tsc;
 }
 
-static u64 kvm_compute_l1_tsc_offset(struct kvm_vcpu *vcpu, u64 target_tsc)
+static u64 kvm_compute_l1_tsc_offset(struct kvm_vcpu *vcpu, u64 host_tsc,
+				     u64 target_tsc)
 {
 	u64 tsc;
 
-	tsc = kvm_scale_tsc(rdtsc(), vcpu->arch.l1_tsc_scaling_ratio);
+	tsc = kvm_scale_tsc(host_tsc, vcpu->arch.l1_tsc_scaling_ratio);
 
 	return target_tsc - tsc;
 }
@@ -2859,7 +2860,7 @@ static void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	bool synchronizing = false;
 
 	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
-	offset = kvm_compute_l1_tsc_offset(vcpu, data);
+	offset = kvm_compute_l1_tsc_offset(vcpu, rdtsc(), data);
 	ns = get_kvmclock_base_ns();
 	elapsed = ns - kvm->arch.last_tsc_nsec;
 
@@ -2908,7 +2909,7 @@ static void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 		} else {
 			u64 delta = nsec_to_cycles(vcpu, elapsed);
 			data += delta;
-			offset = kvm_compute_l1_tsc_offset(vcpu, data);
+			offset = kvm_compute_l1_tsc_offset(vcpu, rdtsc(), data);
 		}
 		matched = true;
 	}
@@ -4155,7 +4156,8 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		if (msr_info->host_initiated) {
 			kvm_synchronize_tsc(vcpu, &data);
 		} else if (!vcpu->arch.guest_tsc_protected) {
-			u64 adj = kvm_compute_l1_tsc_offset(vcpu, data) - vcpu->arch.l1_tsc_offset;
+			u64 adj = kvm_compute_l1_tsc_offset(vcpu, rdtsc(), data) -
+				  vcpu->arch.l1_tsc_offset;
 			adjust_tsc_offset_guest(vcpu, adj);
 			vcpu->arch.ia32_tsc_adjust_msr += adj;
 		}
@@ -5279,7 +5281,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 			mark_tsc_unstable("KVM discovered backwards TSC");
 
 		if (kvm_check_tsc_unstable()) {
-			u64 offset = kvm_compute_l1_tsc_offset(vcpu,
+			u64 offset = kvm_compute_l1_tsc_offset(vcpu, rdtsc(),
 						vcpu->arch.last_guest_tsc);
 			kvm_vcpu_write_tsc_offset(vcpu, offset);
 			if (!vcpu->arch.guest_tsc_protected)
-- 
2.54.0


