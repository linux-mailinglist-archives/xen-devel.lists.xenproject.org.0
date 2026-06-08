Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4f78BRLYJmqklgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:56:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E702657A92
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:56:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=Ni9Ilvbw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331758.1594535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOZ-0004Su-St; Mon, 08 Jun 2026 14:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331758.1594535; Mon, 08 Jun 2026 14:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOY-0003vB-28; Mon, 08 Jun 2026 14:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1331758;
 Mon, 08 Jun 2026 14:55:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wWbO8-0007M8-QR
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbO8-002m34-5B; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7e2-bab6-0a2a0a5309dd-0a2a4508ce74-18
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7eb-63b5-0a2a45080019-5a9b5cc7e90e-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wWbNU-00000001Ag1-2Lkb; Mon, 08 Jun 2026 14:55:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNS-00000000NFW-0Spr;
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
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=2HLSLUjeLQsW5WrqM21C7HZ/xT6pine5iDmPQ6igVxE=; b=Ni9Ilvbwo7oIrKnHzDrIZAX3F2
	RVmRXimMBpSXsB/PuaSbg7zYWlWsY9UbP0wfNf5MjypDK+kBFRkXsj0vr9rZtr0xBq0N4u3z84LWb
	RkcALGmd1E1iTn/pYRHEwvY0rIcfjeZ4m/iW/CXynbM0G8e2Xw/147pFKI0z7DMnFZi2ZtaxDjJwQ
	2TTQpAps1eMGFLa+LHQAZI2lhKXsKQNZoAMimSnbZozldFTFmjECb4y0D8gAkpJV1zRbGQDWWgoDM
	hvapc+bDfQtP6TDe0mL9HqbqDIvgaulmjVRM8bTdK+Aw70gqrKAi9unsKv9TS7s5FTmPCuB3m/JzY
	8exJbhGw==;
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
Subject: [PATCH v5 16/34] KVM: x86: Simplify and comment kvm_get_time_scale()
Date: Mon,  8 Jun 2026 15:47:57 +0100
Message-ID: <20260608145455.89187-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1780930540-B6169DB1-04C58ABA/0/0
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
X-Rspamd-Queue-Id: 7E702657A92

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
index 92e32d720523..a6c31a0d9955 100644
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


