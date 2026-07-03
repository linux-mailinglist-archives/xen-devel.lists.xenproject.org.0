Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YTCmIVooSGpBnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:23:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4D705C43
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:23:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=oMsIAx+v;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353875.1609594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflM6-0004UJ-L5; Fri, 03 Jul 2026 21:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353875.1609594; Fri, 03 Jul 2026 21:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflM6-0004RP-I1; Fri, 03 Jul 2026 21:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1353875;
 Fri, 03 Jul 2026 21:23:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflM4-0004QN-ON
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:23:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflM4-00CejO-5F; Fri, 03 Jul 2026 23:23:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482835-bab6-0a2a0a5309dd-0a2a45038b46-12
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:23 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a48284a-ec1a-0a2a45030019-5a9b5cc7ce42-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:23 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKY-000000059O6-1xMF; Fri, 03 Jul 2026 21:23:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKW-00000001ROv-2yUi;
 Fri, 03 Jul 2026 22:21:48 +0100
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
	bh=ydNYanTzV+rXuDAMNzpsQ17TnZayvJkNqhFCKKMsQXQ=; b=oMsIAx+viNMO768Fm1dQ1GGaQK
	HXvg0RdzbGgsuyU4XEvhoMXSxjNjkwu5TbIxHkRRwfGkDZDe1Z4U8tJ6GLT0QO2ULe44BAftyOTbv
	aaFsMl9pLEPIW5nhCurlLhDQSFXMAlkIcVYGkGjlWSmASd1UGSg+vCw8weRL+ou3XrY8d/8LuRSbC
	8/jZsf0YPkPlj4c1U57Nd8tJI6vJbUxLgJg9kHdwnvj/OHA4wyNNua2tIyY/ICjN9qfYH4GiS+luu
	QIUIDYxtlqNIQmClLOA15ZhWTJa5IvVzPxSBFxY7cLYtioKEIJgJcJE9Uoy0dATamc19dnoF+0clO
	wIaVaSdg==;
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
Subject: [PATCH v6 17/36] KVM: x86: Simplify and comment kvm_get_time_scale()
Date: Fri,  3 Jul 2026 22:17:56 +0100
Message-ID: <20260703212145.343527-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-33051d/1783113803-0652F5D1-4893E3B8/0/0
X-purgate-type: clean
X-purgate-size: 3197
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email];
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
X-Rspamd-Queue-Id: 0AF4D705C43

From: David Woodhouse <dwmw@amazon.co.uk>

The kvm_get_time_scale() function was entirely opaque. Add comments
explaining what it does: compute a fixed-point multiplier and shift for
converting TSC ticks to nanoseconds via pvclock_scale_delta().

Rename the local variables from the cryptic tps64/tps32/scaled64 to
base_hz_u64/base32/scaled_hz_u64 to make the code self-documenting.
The "tps32" name stood for "Ticks Per Second" but was misleading since
it held the shifted base frequency, not a tick count.

No functional change.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/x86.c | 55 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9dc4213f0fa5..0087ddd08e83 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2472,32 +2472,57 @@ static uint32_t div_frac(uint32_t dividend, uint32_t divisor)
 	return dividend;
 }
 
-static void kvm_get_time_scale(uint64_t scaled_hz, uint64_t base_hz,
+static void kvm_get_time_scale(u64 scaled_hz, u64 base_hz,
 			       s8 *pshift, u32 *pmultiplier)
 {
-	uint64_t scaled64;
-	int32_t  shift = 0;
-	uint64_t tps64;
-	uint32_t tps32;
+	u64 scaled_hz_u64 = scaled_hz;
+	s32 shift = 0;
+	u64 base_hz_u64;
+	u32 base32;
 
-	tps64 = base_hz;
-	scaled64 = scaled_hz;
-	while (tps64 > scaled64*2 || tps64 & 0xffffffff00000000ULL) {
-		tps64 >>= 1;
+	/*
+	 * This function calculates a fixed-point multiplier and shift such
+	 * that:
+	 *   time_ns = (tsc_cycles << shift) * multiplier >> 32
+	 *
+	 * Where tsc_cycles tick at base_hz, and time_ns should count at
+	 * scaled_hz (typically NSEC_PER_SEC for a TSC→nanoseconds conversion).
+	 *
+	 * The multiplier is: (scaled_hz << 32) / base_hz, adjusted by shift
+	 * to keep everything in range.
+	 */
+
+	base_hz_u64 = base_hz;
+
+	/*
+	 * Start by shifting base_hz right until it fits in 32 bits, and
+	 * is lower than double the target rate. This introduces a negative
+	 * shift value which would result in pvclock_scale_delta() shifting
+	 * the actual tick count right before performing the multiplication.
+	 */
+	while (base_hz_u64 > scaled_hz_u64 * 2 || base_hz_u64 >> 32) {
+		base_hz_u64 >>= 1;
 		shift--;
 	}
 
-	tps32 = (uint32_t)tps64;
-	while (tps32 <= scaled64 || scaled64 & 0xffffffff00000000ULL) {
-		if (scaled64 & 0xffffffff00000000ULL || tps32 & 0x80000000)
-			scaled64 >>= 1;
+	/* Now the shifted base_hz fits in 32 bits. */
+	base32 = (u32)base_hz_u64;
+
+	/*
+	 * Next, shift scaled_hz right until it fits in 32 bits, and ensure
+	 * that the shifted base_hz is strictly larger (so that the result of the
+	 * final division also fits in 32 bits).
+	 */
+	while (base32 <= scaled_hz_u64 || scaled_hz_u64 >> 32) {
+		if (scaled_hz_u64 >> 32 || base32 & BIT(31))
+			scaled_hz_u64 >>= 1;
 		else
-			tps32 <<= 1;
+			base32 <<= 1;
 		shift++;
 	}
 
 	*pshift = shift;
-	*pmultiplier = div_frac(scaled64, tps32);
+	*pmultiplier = div_frac(scaled_hz_u64, base32);
 }
 
 #ifdef CONFIG_X86_64
-- 
2.54.0


