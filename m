Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA64441D55
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219256.380076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ7G-0004wy-RT; Mon, 01 Nov 2021 15:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219256.380076; Mon, 01 Nov 2021 15:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ7G-0004nf-Dz; Mon, 01 Nov 2021 15:20:54 +0000
Received: by outflank-mailman (input) for mailman id 219256;
 Mon, 01 Nov 2021 15:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ7D-0008DB-Ns
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:51 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b39cf17-3b27-11ec-8548-12813bfff9fa;
 Mon, 01 Nov 2021 15:20:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB80B1FD7A;
 Mon,  1 Nov 2021 15:20:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D60E13A4A;
 Mon,  1 Nov 2021 15:20:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UELzJLYFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:22 +0000
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
X-Inumbo-ID: 3b39cf17-3b27-11ec-8548-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ebl2j3jB8jP/yYrt9tPrvJMVy94LsP3wFgmGN2v8Zvg=;
	b=Fehuadq8JM1ebDMiW89hfQzagnl7/4IzqnzzsD0UzEtm02xwwNhkmi9/HlPGpkgTAf7LgG
	qi1K/RtRyz0ex+00qeaXloE5GBIzarJfSQuBL2LW7lkzASqQJgKefh/ttL1xMPPYsVOlvm
	8yokW5FFQivrsbHwv3xXLr62zntr6ro=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 13/15] xen/x86: add hypercall performance counters for hvm, correct pv
Date: Mon,  1 Nov 2021 16:20:13 +0100
Message-Id: <20211101152015.28488-14-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
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
index 6d8d6693dc..1bac5d4d44 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -210,6 +210,8 @@ int hvm_hypercall(struct cpu_user_regs *regs)
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


