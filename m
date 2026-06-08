Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nbqEEeHXJmp6lgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF06579FA
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=aZGcqpzL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331706.1594307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNl-0002MJ-68; Mon, 08 Jun 2026 14:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331706.1594307; Mon, 08 Jun 2026 14:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNk-0002FT-QS; Mon, 08 Jun 2026 14:55:16 +0000
Received: by outflank-mailman (input) for mailman id 1331706;
 Mon, 08 Jun 2026 14:55:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbNh-0001Oc-0i
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNg-00EcD6-Cr; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7bc-5cb7-0a2a0a5109dd-0a2a4509e8d2-20
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d0-2497-0a2a45090019-5a9b3222d5a4-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNR-0000000Dtx6-2v57; Mon, 08 Jun 2026 14:54:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNR-00000000NEq-2rr6;
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
	bh=PQH1s5X/ubTmj6TSpsud5d3OFm7dGCk1M0UtxMvyZFE=; b=aZGcqpzLCQbJf47VRT2oCaHI5o
	SbAvKu7kWlyBGUrmA+/l18vVNr3QdBHfahIrcZfQJkGAVGs3o38KJEBbjYKPlOT3SLqiUCtvrsFsJ
	+bQDvjqz5fKj7TDGjjosEQDQqsLwzFAVCtk3kq5eQJU1TTq5ZjeuuUKmfbEl1JbB7LBj0yjstTGmr
	tD875uYDxfNpnbgVQ2IwPqLHLrPWnwCTEwaW/6RAh1iJBiyO5Lvjt+V1kVbQq4RmF4JOOqDu7vCzO
	0ECh92S0tDag2AlJwALLBG0Hyx5dV5NF5QRVf4QBmHvn8D7AQZAomwzKdDDH4Cv38nEnOl12amZgA
	4srQhWTQ==;
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
Subject: [PATCH v5 07/34] KVM: x86: Activate master clock immediately on vCPU creation
Date: Mon,  8 Jun 2026 15:47:48 +0100
Message-ID: <20260608145455.89187-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-bad1c0/1780930512-88D76A53-648BE953/0/0
X-purgate-type: clean
X-purgate-size: 1254
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
X-Rspamd-Queue-Id: 36CF06579FA

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, the master clock was only activated when the first vCPU
processed KVM_REQ_MASTERCLOCK_UPDATE during KVM_RUN. This meant that
KVM_GET_CLOCK could not return the host_tsc field until after the
first KVM_RUN, making it impossible for userspace to follow the
documented TSC migration procedure without a dummy vCPU run.

Fix this by calling kvm_update_masterclock() directly from
kvm_arch_vcpu_postcreate(), after kvm_synchronize_tsc() has already
set all_vcpus_matched_freq. This ensures the master clock is active
immediately, and KVM_GET_CLOCK returns a valid {host_tsc, realtime}
pair as soon as a vCPU exists.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b7e5f6e3dc6c..c1897d939da9 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13098,6 +13098,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 		return;
 	vcpu_load(vcpu);
 	kvm_synchronize_tsc(vcpu, NULL);
+	if (!vcpu->kvm->arch.use_master_clock)
+		kvm_update_masterclock(vcpu->kvm);
 	vcpu_put(vcpu);
 
 	/* poll control enabled by default */
-- 
2.54.0


