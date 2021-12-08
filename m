Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE746D784
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242362.419258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIp-0002ui-1q; Wed, 08 Dec 2021 15:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242362.419258; Wed, 08 Dec 2021 15:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIo-0002mW-Ct; Wed, 08 Dec 2021 15:56:18 +0000
Received: by outflank-mailman (input) for mailman id 242362;
 Wed, 08 Dec 2021 15:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIl-0001LM-6n
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e4440f7-583f-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 16:56:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D24A3218B5;
 Wed,  8 Dec 2021 15:56:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A411713C8E;
 Wed,  8 Dec 2021 15:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KEngJpzVsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:12 +0000
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
X-Inumbo-ID: 5e4440f7-583f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJr8Fztf5T8hrG+mezGu/5MmsW11cX9HygUkaO7iFT0=;
	b=MxPCuDts/lw/W3BQmkzM22HUXyY30mCR7tGlzT6OvNhK+v32RBcn/XQ5fxaD7NNgltGK68
	Rs2Sr2CF6djMdkWUUZGU78oOxgPyKyOkQocT0+4Z9R77TfCFYoCEXCFvwdIz6QfTwxc2Yl
	LiLWg+d2Bmf3Jv4Bj3bSSU9FS13T2aw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 11/13] xen/x86: add hypercall performance counters for hvm, correct pv
Date: Wed,  8 Dec 2021 16:56:04 +0100
Message-Id: <20211208155606.20029-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HVM hypercall handler is missing incrementing the per hypercall
counters. Add that.

The counters for PV are handled wrong, as they are not using
perf_incra() with the number of the hypercall as index, but are
incrementing the first hypercall entry (set_trap_table) for each
hypercall. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 ++
 xen/arch/x86/pv/hypercall.c  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 5952172476..37f60238d2 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -200,6 +200,8 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         ioreq_signal_mapcache_invalidate();
     }
 
+    perfc_incra(hypercalls, eax);
+
     return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
 
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index ef92266620..bf64bb41bb 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -102,7 +102,7 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
     if ( curr->hcall_preempted )
         regs->rip -= 2;
 
-    perfc_incr(hypercalls);
+    perfc_incra(hypercalls, eax);
 }
 
 enum mc_disposition pv_do_multicall_call(struct mc_state *state)
-- 
2.26.2


