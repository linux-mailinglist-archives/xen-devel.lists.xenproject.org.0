Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3921412EFA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191374.341363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZnT-0007xn-Af; Tue, 21 Sep 2021 07:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191374.341363; Tue, 21 Sep 2021 07:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZnT-0007v3-70; Tue, 21 Sep 2021 07:02:31 +0000
Received: by outflank-mailman (input) for mailman id 191374;
 Tue, 21 Sep 2021 07:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x95K=OL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSZnR-0007ut-CR
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:02:29 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1b44f86-1aa9-11ec-b89e-12813bfff9fa;
 Tue, 21 Sep 2021 07:02:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C24531FD60;
 Tue, 21 Sep 2021 07:02:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7949113B97;
 Tue, 21 Sep 2021 07:02:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tMNXHIODSWHLegAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Sep 2021 07:02:27 +0000
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e1b44f86-1aa9-11ec-b89e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632207747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7thuIDnGv5oZ6BTCP+zSuwIv02tmpVWBhc2C3gScL0A=;
	b=jAdmKx0bi/GxFtRD1x8hHCZEDyOQ/cvhk5YcWnckIWx43Mk91SCNdODfzpafnCcTY+64Og
	vWaYMT7ZXT1Bn1xhQ/qUlHk1gIqL1CrkEwp8TVH8oVO0BWYJ+hsBQRAjLikxcKNAX3wtvH
	O9djHthfpfICEmgIIifKGpYoHOBe8xQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/xen: remove unneeded preempt_disable() from xen_irq_enable()
Date: Tue, 21 Sep 2021 09:02:26 +0200
Message-Id: <20210921070226.32021-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disabling preemption in xen_irq_enable() is not needed. There is no
risk of missing events due to preemption, as preemption can happen
only in case an event is being received, which is just the opposite
of missing an event.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/irq.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
index dfa091d79c2e..ba9b14a97109 100644
--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@ -57,24 +57,20 @@ asmlinkage __visible void xen_irq_enable(void)
 {
 	struct vcpu_info *vcpu;
 
-	/*
-	 * We may be preempted as soon as vcpu->evtchn_upcall_mask is
-	 * cleared, so disable preemption to ensure we check for
-	 * events on the VCPU we are still running on.
-	 */
-	preempt_disable();
-
 	vcpu = this_cpu_read(xen_vcpu);
 	vcpu->evtchn_upcall_mask = 0;
 
-	/* Doesn't matter if we get preempted here, because any
-	   pending event will get dealt with anyway. */
+	/*
+	 * Now preemption could happen, but this is only possible if an event
+	 * was handled, so missing an event due to preemption is not
+	 * possible at all.
+	 * The worst possible case is to be preempted and then check events
+	 * pending on the old vcpu, but this is not problematic.
+	 */
 
 	barrier(); /* unmask then check (avoid races) */
 	if (unlikely(vcpu->evtchn_upcall_pending))
 		xen_force_evtchn_callback();
-
-	preempt_enable();
 }
 PV_CALLEE_SAVE_REGS_THUNK(xen_irq_enable);
 
-- 
2.26.2


