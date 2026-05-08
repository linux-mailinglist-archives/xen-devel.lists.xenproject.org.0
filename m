Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMi0Hbf1/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:39:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943A4F7E42
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303726.1576977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMMd-00035U-Fq; Fri, 08 May 2026 14:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303726.1576977; Fri, 08 May 2026 14:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMMd-000338-Cx; Fri, 08 May 2026 14:39:39 +0000
Received: by outflank-mailman (input) for mailman id 1303726;
 Fri, 08 May 2026 14:39:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wLMMc-000332-1q
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:39:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMMb-003Ice-15
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:39:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fdf59b-e002-0a2a0a5209dd-0a2a450acde4-20
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:39:36 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fdf5a8-56b3-0a2a450a0019-c387df83eda0-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:39:36 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A1DC5C115;
 Fri,  8 May 2026 14:39:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 215A5593A7;
 Fri,  8 May 2026 14:39:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GKQGB6j1/WlcVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 08 May 2026 14:39:36 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778251176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qcH0oyDgGShFY8obpKeBe1gSWCv27CYVU+nGbBQx6uk=;
	b=eIuw8rpP3+bLN054/2BzceWEYq44u78XjU+o/Hk63wuCt6dDM53cF6B9HfXABaLBH2U1xQ
	p6ltDFfK8+KEsrmabJzOTwdyfB5/COMiL9/p378+C/sLW+lOaj3LjigyBTFzadJe0Vq06w
	0tPe7/qqbqbmOgDTAWLKAuhLF6d+zvE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778251176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qcH0oyDgGShFY8obpKeBe1gSWCv27CYVU+nGbBQx6uk=;
	b=eIuw8rpP3+bLN054/2BzceWEYq44u78XjU+o/Hk63wuCt6dDM53cF6B9HfXABaLBH2U1xQ
	p6ltDFfK8+KEsrmabJzOTwdyfB5/COMiL9/p378+C/sLW+lOaj3LjigyBTFzadJe0Vq06w
	0tPe7/qqbqbmOgDTAWLKAuhLF6d+zvE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: kevin.brodsky@arm.com,
	marmarek@invisiblethingslab.com,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
Date: Fri,  8 May 2026 16:39:33 +0200
Message-ID: <20260508143933.493013-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-purgate-ID: tlsNG-4011c0/1778251176-70F618B7-A88E1767/0/0
X-purgate-type: clean
X-purgate-size: 1487
X-Rspamd-Queue-Id: 2943A4F7E42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:kevin.brodsky@arm.com,m:marmarek@invisiblethingslab.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

With the support of nested lazy mmu sections it can happen that
arch_enter_lazy_mmu_mode() is being called twice without a call of
arch_leave_lazy_mmu_mode() in between, as the lazy_mmu_*() helpers
are not disabling preemption when checking for nested lazy mmu
sections.

This is a problem when running as a Xen PV guest, as
xen_enter_lazy_mmu() and xen_leave_lazy_mmu() don't tolerate this
case.

Fix that in xen_enter_lazy_mmu() and xen_leave_lazy_mmu() in order
not to hurt all other lazy mmu mode users.

Fixes: 291b3abed657 ("x86/xen: use lazy_mmu_state when context-switching")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/mmu_pv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index c80d0058efd1..3eee5f84f8a7 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2145,7 +2145,10 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
 
 static void xen_enter_lazy_mmu(void)
 {
-	enter_lazy(XEN_LAZY_MMU);
+	preempt_disable();
+	if (xen_get_lazy_mode() != XEN_LAZY_MMU)
+		enter_lazy(XEN_LAZY_MMU);
+	preempt_enable();
 }
 
 static void xen_flush_lazy_mmu(void)
@@ -2182,7 +2185,8 @@ static void xen_leave_lazy_mmu(void)
 {
 	preempt_disable();
 	xen_mc_flush();
-	leave_lazy(XEN_LAZY_MMU);
+	if (xen_get_lazy_mode() != XEN_LAZY_NONE)
+		leave_lazy(XEN_LAZY_MMU);
 	preempt_enable();
 }
 
-- 
2.54.0


