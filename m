Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3OqLOHXJmp+lgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C206579FD
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:55:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=I1BaiAVq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=infradead.org
Received: from list by lists.xenproject.org with outflank-mailman.1331713.1594348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNq-0003YM-12; Mon, 08 Jun 2026 14:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331713.1594348; Mon, 08 Jun 2026 14:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNp-0003Rk-MR; Mon, 08 Jun 2026 14:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1331713;
 Mon, 08 Jun 2026 14:55:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbNl-0002P5-7L
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNk-00EcHE-Jv; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d0-5cb7-0a2a0a5109dd-0a2a45018424-8
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d2-c1f2-0a2a45010019-5a9b3222ea9c-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:15 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNR-0000000Dtx9-2t34; Mon, 08 Jun 2026 14:54:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNR-00000000NEY-1Xm3;
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
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=IKIepJVZTrQvr9mzOQ+/HkJi9FX0zbFmsPkvIgbqGRE=; b=I1BaiAVqVDGDPY/DJMfHhsDzqI
	CPaFVooL4qZtsnnTM+BJwtuHplzLKHiqwoTwUFmsxyhp8F4R84fIgwZo6ogTKuhj9fkpx4ut5Gp3l
	IfafIQl9SY/azFshGwtcrlVKWkYSRIBL6wDcajc855HYrOd04CU0E2bjvkeHkfY+hLnN7l4Js/5aE
	YIk+mSzqTIWhBiKDQBe+XySRSaCwD8KnrAc55L3VozM0FU2qVB7d1OBFwwJTwhC98Rds/89Llm3jC
	4rodbhz/ZkeR8oF2GB8tc0CbRQiirP/U7D2WaNY2CAnwj15OkbXzSRBg4i4dZQhThFNUmI3XkRK/Y
	He1oCUBA==;
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
Subject: [PATCH v5 01/34] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
Date: Mon,  8 Jun 2026 15:47:42 +0100
Message-ID: <20260608145455.89187-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1780930515-ACE52FF4-025FBCFA/0/0
X-purgate-type: clean
X-purgate-size: 4433
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
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
X-Rspamd-Queue-Id: 64C206579FD

From: David Woodhouse <dwmw@amazon.co.uk>

The KVM clock is an interesting thing. It is defined as "nanoseconds
since the guest was created", but in practice it runs at two *different*
rates — or three different rates, if you count implementation bugs.

Definition A is that it runs synchronously with the CLOCK_MONOTONIC_RAW
of the host, with a delta of kvm->arch.kvmclock_offset.

But that version doesn't actually get used in the common case, where the
host has a reliable TSC and the guest TSCs are all running at the same
rate and in sync with each other, and kvm->arch.use_master_clock is set.

In that common case, definition B is used: There is a reference point in
time at kvm->arch.master_kernel_ns (again a CLOCK_MONOTONIC_RAW time),
and a corresponding host TSC value kvm->arch.master_cycle_now. This
fixed point in time is converted to guest units (the time offset by
kvmclock_offset and the TSC Value scaled and offset to be a guest TSC
value) and advertised to the guest in the pvclock structure. While in
this 'use_master_clock' mode, the fixed point in time never needs to be
changed, and the clock runs precisely in time with the guest TSC, at the
rate advertised in the pvclock structure.

The third definition C is implemented in kvm_get_wall_clock_epoch() and
__get_kvmclock(), using the master_cycle_now and master_kernel_ns fields
but converting the *host* TSC cycles directly to a value in nanoseconds
instead of scaling via the guest TSC.

One might naïvely think that all three definitions are identical, since
CLOCK_MONOTONIC_RAW is not skewed by NTP frequency corrections; all
three are just the result of counting the host TSC at a known frequency,
or the scaled guest TSC at a known precise fraction of the host's
frequency. The problem is with arithmetic precision, and the way that
frequency scaling is done in a division-free way by multiplying by a
scale factor, then shifting right. In practice, all three ways of
calculating the KVM clock will suffer a systemic drift from each other.

Eventually, definition C should just be eliminated. Commit 451a707813ae
("KVM: x86/xen: improve accuracy of Xen timers") worked around it for
the specific case of Xen timers, which are defined in terms of the KVM
clock and suffered from a continually increasing error in timer expiry
times. That commit notes that get_kvmclock_ns() is non-trivial to fix
and says "I'll come back to that", which remains true.

Definitions A and B do need to coexist, the former to handle the case
where the host or guest TSC is suboptimally configured. But KVM should
be more careful about switching between them, and the discontinuity in
guest time which could result.

In particular, KVM_REQ_MASTERCLOCK_UPDATE will take a new snapshot of
time as the reference in master_kernel_ns and master_cycle_now, yanking
the guest's clock back to match definition A at that moment.

When invoked from in 'use_master_clock' mode, kvm_update_masterclock()
should probably *adjust* kvm->arch.kvmclock_offset to account for the
drift, instead of yanking the clock back to definition A. But in the
meantime there are a bunch of places where it just doesn't need to be
invoked at all.

To start with: there is no need to do such an update when a Xen guest
populates the shared_info page. This seems to have been a hangover from
the very first implementation of shared_info which automatically
populated the vcpu_info structures at their default locations, but even
then it should just have raised KVM_REQ_CLOCK_UPDATE on each vCPU
instead of using KVM_REQ_MASTERCLOCK_UPDATE. And now that userspace is
expected to explicitly set the vcpu_info even in its default locations,
there's not even any need for that either.

Fixes: 629b5348841a ("KVM: x86/xen: update wallclock region")
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/xen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 91fd3673c09a..82e34edbfdbd 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -98,8 +98,6 @@ static int kvm_xen_shared_info_init(struct kvm *kvm)
 	wc->version = wc_version + 1;
 	read_unlock_irq(&gpc->lock);
 
-	kvm_make_all_cpus_request(kvm, KVM_REQ_MASTERCLOCK_UPDATE);
-
 out:
 	srcu_read_unlock(&kvm->srcu, idx);
 	return ret;
-- 
2.54.0


