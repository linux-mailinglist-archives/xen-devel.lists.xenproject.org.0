Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hm2uBiEoSGoVnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB11B705BBF
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:22:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=fPnUdJ68;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353757.1609518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKr-0006gi-M8; Fri, 03 Jul 2026 21:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353757.1609518; Fri, 03 Jul 2026 21:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflKr-0006aR-FI; Fri, 03 Jul 2026 21:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1353757;
 Fri, 03 Jul 2026 21:22:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wflKo-0005h7-Ju
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflKj-00BXCb-0b; Fri, 03 Jul 2026 23:22:06 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827c7-2eae-0a2a0a5409dd-0a2a4504c5b0-26
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:00 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ba378bf2ab63d22ff04d+8349+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a4827f7-a01d-0a2a45040019-5a9b3222e448-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:22:00 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wflKX-0000000AsYC-0U5S; Fri, 03 Jul 2026 21:21:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKW-00000001RPD-46vV;
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
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=sAJ+w5HRGJ1JE3H1Wx/huE4jGAY90IdO6mwCHpL6bJA=; b=fPnUdJ68VFN82oFjJj/i57tghy
	0ZFD0hlumo0Eo/gYwzBln/e4uVYPLsis5GydyD/+Vy4w0rNcBsFWA+dW+Ch1zFGpDHSdlShsvrN6H
	2XPhUzEfjC6LB0Tg162oU459VFP6GwWorQp5lrMES88+J5LfEdmILh5zqQipXPKBFQL+QF6Pjkixl
	636TJb/z0HGrnDJ1GFdnnpOTdabYuoPygi84otBK2A9xaA55UpAOVjtSsMueaNRJPCWb+Nf+bWhfL
	UHPuZPEewOXB2c2BM4PG3/hV3K+2lePVnxjsArjeyD/3F2zSR5t6Hi71bD2Gy6MSpkMgA9oCaaUzU
	Dg0T/Ycw==;
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
Subject: [PATCH v6 21/36] KVM: x86: Replace nr_vcpus_matched_tsc count with all_vcpus_matched_tsc bool
Date: Fri,  3 Jul 2026 22:18:00 +0100
Message-ID: <20260703212145.343527-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1783113720-AFD241CC-35407CC4/0/0
X-purgate-type: clean
X-purgate-size: 2850
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,amazon.co.uk:email];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB11B705BBF

From: David Woodhouse <dwmw@amazon.co.uk>

Using a count and comparing with kvm->online_vcpus was always racy
because a new vCPU could be created while kvm_track_tsc_matching() was
running and comparing with kvm->online_vcpus. That variable is only
atomic with respect to itself; kvm_arch_vcpu_create() runs before
kvm->online_vcpus is incremented for the new vCPU.

Replace the count with a boolean that is set in kvm_track_tsc_matching()
after comparing the count, and cleared when a new TSC generation starts.
The boolean is consumed by pvclock_update_vm_gtod_copy() under the
tsc_write_lock, which serializes against __kvm_synchronize_tsc().

Keep the count for now as it's still used in the trace event.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/x86.c              | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index e752b13c0809..51d8bcbc2d1d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1492,6 +1492,7 @@ struct kvm_arch {
 	u64 cur_tsc_write;
 	u64 cur_tsc_offset;
 	u64 cur_tsc_generation;
+	bool all_vcpus_matched_tsc;
 	int nr_vcpus_matched_tsc;
 
 	u32 default_tsc_khz;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 478147aff56a..83c47fe5c9b8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2651,8 +2651,10 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 	 * and all vCPUs must have matching TSCs.  Note, the count for matching
 	 * vCPUs doesn't include the reference vCPU, hence "+1".
 	 */
-	bool use_master_clock = (ka->nr_vcpus_matched_tsc + 1 ==
-				 atomic_read(&vcpu->kvm->online_vcpus)) &&
+	ka->all_vcpus_matched_tsc = (ka->nr_vcpus_matched_tsc + 1 ==
+				     atomic_read(&vcpu->kvm->online_vcpus));
+
+	bool use_master_clock = ka->all_vcpus_matched_tsc &&
 				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
 
 	/*
@@ -2837,6 +2839,7 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 		kvm->arch.cur_tsc_write = tsc;
 		kvm->arch.cur_tsc_offset = offset;
 		kvm->arch.nr_vcpus_matched_tsc = 0;
+		kvm->arch.all_vcpus_matched_tsc = false;
 	} else if (vcpu->arch.this_tsc_generation != kvm->arch.cur_tsc_generation) {
 		kvm->arch.nr_vcpus_matched_tsc++;
 	}
@@ -3169,8 +3172,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 	bool host_tsc_clocksource, vcpus_matched;
 
 	lockdep_assert_held(&kvm->arch.tsc_write_lock);
-	vcpus_matched = (ka->nr_vcpus_matched_tsc + 1 ==
-			atomic_read(&kvm->online_vcpus));
+	vcpus_matched = ka->all_vcpus_matched_tsc;
 
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
-- 
2.54.0


