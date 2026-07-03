Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1o7SAnIoSGpPnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:24:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E9705C7C
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 23:24:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=qTsfnPqY;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353900.1609670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMZ-0007IV-5s; Fri, 03 Jul 2026 21:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353900.1609670; Fri, 03 Jul 2026 21:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMY-0007FO-J2; Fri, 03 Jul 2026 21:23:54 +0000
Received: by outflank-mailman (input) for mailman id 1353900;
 Fri, 03 Jul 2026 21:23:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflMW-0006v9-Mq
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:23:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflMW-00CejO-2E; Fri, 03 Jul 2026 23:23:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a48275c-bab6-0a2a0a5309dd-0a2a450c84ae-48
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:52 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482867-f399-0a2a450c0019-5a9b5cc7bdf0-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:51 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKd-000000059O3-3Oad; Fri, 03 Jul 2026 21:23:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKW-00000001ROl-2MEe;
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
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=pFpNlCE+MJW0eKcLFgCCZwMvqjxRJ/tMcKVjrR0U73Q=; b=qTsfnPqYdMDx4eUygFXJFljz/J
	HPP9ML6utEPbyFF37E1VztfM6jgMhMBh95PQ1lNByOYWgIaCp6JWwXn4CRiSdDQFDIubsZaIb1glB
	Pu8lGpAoP1cmJkXCbNxwxUkWPL34CuBc3XRH6b6uwshPpJHdqsbbOUZ4TmvT2K+ejBCcOwlpZY1Jb
	GjvaQoRWKExUh3UM+KhXoM+5PJv34XQ5X20qE921jQFhjoHQPWuJAMkL9/oLGBiIyvViWkFfekSOH
	a1X/CfCJ/Z+HF+xC8jpSbTeTXXtYydVpu1qQp7aurcyiShWJWGhkMCvXINe0EysHUaf8mOrj5+V/i
	2xt5dohQ==;
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
Subject: [PATCH v6 15/36] KVM: x86: Fix compute_guest_tsc() to handle negative time deltas
Date: Fri,  3 Jul 2026 22:17:54 +0100
Message-ID: <20260703212145.343527-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1783113832-92F3BD51-96E90A37/0/0
X-purgate-type: clean
X-purgate-size: 1721
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amazon.co.uk:email];
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
X-Rspamd-Queue-Id: F02E9705C7C

From: David Woodhouse <dwmw@amazon.co.uk>

The compute_guest_tsc() function computes the guest TSC at a given
kernel_ns timestamp. When the master clock reference point
(master_kernel_ns) is earlier than vcpu->arch.this_tsc_nsec, the delta
is negative. Since pvclock_scale_delta() takes a u64, the negative
value wraps to a huge positive number, producing a wildly wrong result.

Handle negative deltas explicitly by negating the delta, scaling it,
and subtracting from this_tsc_write.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 376b8dc2ade9..55fb19fb7a88 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2588,11 +2588,21 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 
 static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
 {
-	u64 tsc = pvclock_scale_delta(kernel_ns-vcpu->arch.this_tsc_nsec,
-				      vcpu->arch.virtual_tsc_mult,
-				      vcpu->arch.virtual_tsc_shift);
-	tsc += vcpu->arch.this_tsc_write;
-	return tsc;
+	s64 delta_ns = kernel_ns - vcpu->arch.this_tsc_nsec;
+	u64 tsc;
+
+	/* Handle negative deltas gracefully (master clock ref may be earlier) */
+	if (delta_ns < 0) {
+		tsc = pvclock_scale_delta(-delta_ns,
+					  vcpu->arch.virtual_tsc_mult,
+					  vcpu->arch.virtual_tsc_shift);
+		return vcpu->arch.this_tsc_write - tsc;
+	}
+
+	tsc = pvclock_scale_delta(delta_ns,
+				  vcpu->arch.virtual_tsc_mult,
+				  vcpu->arch.virtual_tsc_shift);
+	return vcpu->arch.this_tsc_write + tsc;
 }
 
 #ifdef CONFIG_X86_64
-- 
2.54.0


