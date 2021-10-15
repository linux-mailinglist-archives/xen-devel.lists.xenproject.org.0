Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7EE42F187
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210505.367488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMhY-0006kA-BT; Fri, 15 Oct 2021 12:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210505.367488; Fri, 15 Oct 2021 12:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMhY-0006fm-47; Fri, 15 Oct 2021 12:52:44 +0000
Received: by outflank-mailman (input) for mailman id 210505;
 Fri, 15 Oct 2021 12:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbMhV-0001If-Uy
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:52:41 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2dc843a-2db6-11ec-8235-12813bfff9fa;
 Fri, 15 Oct 2021 12:52:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 587F421A69;
 Fri, 15 Oct 2021 12:52:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CF7713C1A;
 Fri, 15 Oct 2021 12:52:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KPPLCXV5aWEYHgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 12:52:05 +0000
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
X-Inumbo-ID: b2dc843a-2db6-11ec-8235-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634302325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fl7rNXPaOF/rSqcMCLu39+aDb9pf3LlEE3G2oqMEJsc=;
	b=WOzvxyvsFED/BlTD78alE86l3sJ0PshZhOW5840BFzGbvbLV0l3CYQwae0xhDgjqzVtpLG
	p5DGEchBlzv/MHgEcapE27cQdnfYMNSuUjAB7niX+j12iKb377lXVHI4MfUPU7QXlORXn+
	ILrheYV+FMb6bS+iD5At2Sqt+LKPa6M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 12/12] xen/x86: add hypercall performance counters for hvm, correct pv
Date: Fri, 15 Oct 2021 14:51:52 +0200
Message-Id: <20211015125152.25198-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211015125152.25198-1-jgross@suse.com>
References: <20211015125152.25198-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HVM hypercall handler is missing incrementing the per hypercall
counters. Add that.

The counters for PV are handled wrong, as they are not using
perf_incra() with the number of the hypercall as index, but are
incrementing the total number of hypercalls only. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 ++
 xen/arch/x86/pv/hypercall.c  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index e766cf4c72..599921dc48 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -214,6 +214,8 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         ioreq_signal_mapcache_invalidate();
     }
 
+    perfc_incra(hypercalls, eax);
+
     return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
 
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 9b575e5c0b..ec8d2c7f87 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -106,7 +106,7 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
     if ( curr->hcall_preempted )
         regs->rip -= 2;
 
-    perfc_incr(hypercalls);
+    perfc_incra(hypercalls, eax);
 }
 
 enum mc_disposition pv_do_multicall_call(struct mc_state *state)
-- 
2.26.2


