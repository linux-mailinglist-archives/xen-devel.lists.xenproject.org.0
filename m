Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d9sRJ+PXJmqBlgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51C657A10
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=RGeLi7Gj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331708.1594322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNm-0002mI-Ut; Mon, 08 Jun 2026 14:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331708.1594322; Mon, 08 Jun 2026 14:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNm-0002VL-Hj; Mon, 08 Jun 2026 14:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1331708;
 Mon, 08 Jun 2026 14:55:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbNg-0001Ob-GY
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNf-00EcD6-TP; Mon, 08 Jun 2026 16:55:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7c5-5cb7-0a2a0a5109dd-0a2a4504aa90-26
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:11 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7ce-1dec-0a2a45040019-5a9b32229a8c-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:10 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNR-0000000DtxF-3M66; Mon, 08 Jun 2026 14:54:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNR-00000000NFK-45z6;
 Mon, 08 Jun 2026 15:54:57 +0100
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
	bh=kzo7us9axLE6O2exw0Cl6U5WHgHBbewVPWCB3bErZOE=; b=RGeLi7GjoSXYplCK7Jkv0M+NUZ
	d3RESPAK3OJqd9O/Y6CBJzjRWyo+LmbRbYXU17ZRiNIF5jRN/1AelT3Pp7TCUWDm2bDspYBdl8om3
	K5LV2Wpn+lijtTE0bITDN+lqpHd8EGL9BOTxPTq0oHdwHicvt6BAUUIY8oE4emduAdzw1OFQ4x7YQ
	Pe7emlltLqC6oNqj+gHa2Ex8FZ2suXd+M4Yo5H3xQUFch1KSl8iFV/oRtJO0+igNGXiPQ63poo9UT
	0+em0x8c/zUkuqgc+gKdNziudceC23aF8P+fHaZHRCFsOTBdkmb9hsvqPKzYnchYajaEz0ZrhRJya
	q4GZk7fA==;
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
Subject: [PATCH v5 13/34] KVM: x86: Use get_kvmclock() in kvm_get_wall_clock_epoch()
Date: Mon,  8 Jun 2026 15:47:54 +0100
Message-ID: <20260608145455.89187-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1780930511-427613FF-7D56AF36/0/0
X-purgate-type: clean
X-purgate-size: 3112
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
X-Rspamd-Queue-Id: 4D51C657A10

From: David Woodhouse <dwmw@amazon.co.uk>

Now that get_kvmclock() correctly handles TSC scaling and captures both
wallclock and kvmclock from the same TSC reading,
kvm_get_wall_clock_epoch() can simply call it instead of duplicating
the pvclock computation.

This eliminates the last instance of the "definition C" kvmclock
calculation that computed nanoseconds directly from the host TSC
without accounting for guest TSC scaling.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 59 +++++++---------------------------------------
 1 file changed, 9 insertions(+), 50 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7ae6a7705353..fc9366b83912 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3494,63 +3494,22 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
  * wallclock and kvmclock times, and subtracting one from the other.
  *
  * Fall back to using their values at slightly different moments by
- * calling ktime_get_real_ns() and get_kvmclock_ns() separately.
+ * calling ktime_get_real_ns() and get_kvmclock() separately.
  */
 uint64_t kvm_get_wall_clock_epoch(struct kvm *kvm)
 {
-#ifdef CONFIG_X86_64
-	struct pvclock_vcpu_time_info hv_clock;
-	struct kvm_arch *ka = &kvm->arch;
-	unsigned long seq, local_tsc_khz;
-	struct timespec64 ts;
-	uint64_t host_tsc;
-
-	do {
-		seq = read_seqcount_begin(&ka->pvclock_sc);
-
-		local_tsc_khz = 0;
-		if (!ka->use_master_clock)
-			break;
-
-		/*
-		 * The TSC read and the call to get_cpu_tsc_khz() must happen
-		 * on the same CPU.
-		 */
-		get_cpu();
-
-		local_tsc_khz = get_cpu_tsc_khz();
-
-		if (local_tsc_khz &&
-		    !kvm_get_walltime_and_clockread(&ts, &host_tsc))
-			local_tsc_khz = 0; /* Fall back to old method */
-
-		put_cpu();
-
-		/*
-		 * These values must be snapshotted within the seqcount loop.
-		 * After that, it's just mathematics which can happen on any
-		 * CPU at any time.
-		 */
-		hv_clock.tsc_timestamp = ka->master_cycle_now;
-		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
+	struct kvm_clock_data data;
 
-	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
+	get_kvmclock(kvm, &data);
 
 	/*
-	 * If the conditions were right, and obtaining the wallclock+TSC was
-	 * successful, calculate the KVM clock at the corresponding time and
-	 * subtract one from the other to get the guest's epoch in nanoseconds
-	 * since 1970-01-01.
+	 * If get_kvmclock() captured both wallclock and kvmclock from the
+	 * same TSC reading, use them for a precise epoch calculation.
 	 */
-	if (local_tsc_khz) {
-		kvm_get_time_scale(NSEC_PER_SEC, local_tsc_khz * NSEC_PER_USEC,
-				   &hv_clock.tsc_shift,
-				   &hv_clock.tsc_to_system_mul);
-		return ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec -
-			__pvclock_read_cycles(&hv_clock, host_tsc);
-	}
-#endif
-	return ktime_get_real_ns() - get_kvmclock_ns(kvm);
+	if (data.flags & KVM_CLOCK_REALTIME)
+		return data.realtime - data.clock;
+
+	return ktime_get_real_ns() - data.clock;
 }
 
 /*
-- 
2.54.0


