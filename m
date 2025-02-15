Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C330A36B60
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 03:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889275.1298452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj7jI-0003Sl-Di; Sat, 15 Feb 2025 02:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889275.1298452; Sat, 15 Feb 2025 02:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj7jI-0003QB-AH; Sat, 15 Feb 2025 02:16:28 +0000
Received: by outflank-mailman (input) for mailman id 889275;
 Sat, 15 Feb 2025 02:16:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj7jH-0003Q5-4U
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 02:16:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da9acf09-eb42-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 03:16:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D31AA44DCD;
 Sat, 15 Feb 2025 02:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8EAC4CED1;
 Sat, 15 Feb 2025 02:16:21 +0000 (UTC)
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
X-Inumbo-ID: da9acf09-eb42-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739585783;
	bh=Tt4zFsPSSdzWpok1ed/XizN/m8V02W9TBbyagaXU23c=;
	h=Date:From:To:cc:Subject:From;
	b=ZfU/VUXh6721YczvSeiypEMSk2FDKqFpzeK6yTFfDQ6ZDiR+Xc/9Fj1gTAn6TRMMl
	 343TinB6oKjid10zvBO7O3MDkrc3ig8H3QVLrJsbV+N0BXrUPLZEN9P7V5cmBObFpm
	 x14wt/OYbo16DWas2Pch5WR64ckxrDaIMxSTzdTlM9cB1X34Artqo5JwoBldYGc5Xs
	 6mkDAGoEJlmJ7AZjXmjcFX5A2kPaQ9ophREcTcsEQQrl9ObroSLsPNKtLR3HLmhLj0
	 NzvrWiDUkn5SdqNwRS23VLQh88Z34p/3ipEL6wBNc1o/r8+BGPiligjZQAx6dkoYS1
	 XnuPKHQREwmWg==
Date: Fri, 14 Feb 2025 18:16:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com
Subject: xen/x86: resolve the last 3 MISRA R16.6 violations 
Message-ID: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

MISRA R16.6 states that "Every switch statement shall have at least two
switch-clauses". There are only 3 violations left on x86 (zero on ARM).

Two of them can be simply fixed.

One of them is only a violation depending on the kconfig configuration.
So deviate it instead with a SAF comment.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index b8a4f878ea..e1f950f7b1 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -92,6 +92,14 @@
         },
         {
             "id": "SAF-11-safe",
+            "analyser": {
+                "eclair": "MC3A2.R16.6"
+            },
+            "name": "Rule 16.6: single clause due to kconfig",
+            "text": "A switch statement with a single switch clause because other switch clauses are disabled in a given kconfig is allowed."
+        },
+        {
+            "id": "SAF-12-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 39e39ce4ce..c10c6bd833 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
 {
     ASSERT(v == current || !vcpu_runnable(v));
 
-    switch ( reg )
-    {
-    default:
-        return alternative_call(hvm_funcs.get_reg, v, reg);
-    }
+    return alternative_call(hvm_funcs.get_reg, v, reg);
 }
 
 void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
     ASSERT(v == current || !vcpu_runnable(v));
 
-    switch ( reg )
-    {
-    default:
-        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
-    }
+    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
 }
 
 static bool cf_check is_sysdesc_access(
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 87b30ce4df..dca11a613d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -436,6 +436,7 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
 
 static unsigned long get_shstk_bottom(unsigned long sp)
 {
+    /* SAF-11-safe */
     switch ( get_stack_page(sp) )
     {
 #ifdef CONFIG_XEN_SHSTK

