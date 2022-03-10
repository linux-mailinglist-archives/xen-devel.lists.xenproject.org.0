Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD84D41DD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 08:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288152.488624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJc-0000pz-Kr; Thu, 10 Mar 2022 07:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288152.488624; Thu, 10 Mar 2022 07:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJc-0000kZ-9s; Thu, 10 Mar 2022 07:34:28 +0000
Received: by outflank-mailman (input) for mailman id 288152;
 Thu, 10 Mar 2022 07:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHx9=TV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSDJb-0000ZP-0h
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 07:34:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80a6c3ed-a044-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 08:34:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 59F7C1F444;
 Thu, 10 Mar 2022 07:34:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C68C13FA5;
 Thu, 10 Mar 2022 07:34:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aDi0BQGqKWIkIAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Mar 2022 07:34:25 +0000
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
X-Inumbo-ID: 80a6c3ed-a044-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646897665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BEzMzKjCEqWCLH4etovzeszLFEIwdEg6ZM52H2MR7Ho=;
	b=WKqgQwFza2uC/HWEuRsXBxOLS5oJiVmLCWkBKGaMLeOAu8BH/j1Bj0yHUoAtAA5lC3rMtT
	i/Y5DrqTLI1jxCiv+I9YoNIPoL65aC4+xsucIOiVJ/JcH962O0y8UnbGvmGgtmQKZkLVqC
	b6w/ePPZklxgYjbJ2JwlPZMa1AJ3Hs0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 03/11] xen: switch non style compliant hypercall handler parameter types
Date: Thu, 10 Mar 2022 08:34:12 +0100
Message-Id: <20220310073420.15622-4-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310073420.15622-1-jgross@suse.com>
References: <20220310073420.15622-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch some non style compliant types (u32, s32, s64) of hypercall
handler parameters to style compliant ones.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V4:
- carved out from following patch (Julien Grall)
---
 xen/arch/x86/include/asm/hypercall.h | 10 +++++-----
 xen/include/xen/hypercall.h          |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index 610c37a0b8..d6daa7e4cb 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -94,7 +94,7 @@ do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc);
 extern long cf_check
 do_update_va_mapping(
     unsigned long va,
-    u64 val64,
+    uint64_t val64,
     unsigned long flags);
 
 extern long cf_check
@@ -104,7 +104,7 @@ do_physdev_op(
 extern long cf_check
 do_update_va_mapping_otherdomain(
     unsigned long va,
-    u64 val64,
+    uint64_t val64,
     unsigned long flags,
     domid_t domid);
 
@@ -162,10 +162,10 @@ extern long cf_check compat_callback_op(
     int cmd, XEN_GUEST_HANDLE(void) arg);
 
 extern int cf_check compat_update_va_mapping(
-    unsigned int va, u32 lo, u32 hi, unsigned int flags);
+    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags);
 
 extern int cf_check compat_update_va_mapping_otherdomain(
-    unsigned int va, u32 lo, u32 hi, unsigned int flags, domid_t domid);
+    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid);
 
 DEFINE_XEN_GUEST_HANDLE(trap_info_compat_t);
 extern int cf_check compat_set_trap_table(
@@ -175,7 +175,7 @@ extern int cf_check compat_set_gdt(
     XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int entries);
 
 extern int cf_check compat_update_descriptor(
-    u32 pa_lo, u32 pa_hi, u32 desc_lo, u32 desc_hi);
+    uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi);
 
 extern unsigned int cf_check compat_iret(void);
 
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 82f7f2caeb..81aae7a662 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -198,8 +198,8 @@ compat_sched_op(
 
 extern int cf_check
 compat_set_timer_op(
-    u32 lo,
-    s32 hi);
+    uint32_t lo,
+    int32_t hi);
 
 extern int cf_check compat_xsm_op(
     XEN_GUEST_HANDLE_PARAM(void) op);
-- 
2.34.1


