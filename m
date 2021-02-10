Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACA13162FD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 10:57:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83513.155615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9mFj-00009I-L5; Wed, 10 Feb 2021 09:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83513.155615; Wed, 10 Feb 2021 09:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9mFj-00008t-HY; Wed, 10 Feb 2021 09:57:43 +0000
Received: by outflank-mailman (input) for mailman id 83513;
 Wed, 10 Feb 2021 09:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9mFi-00008o-LX
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 09:57:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e29b3b47-3708-4922-a3a9-94abd4aa0967;
 Wed, 10 Feb 2021 09:57:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76DBEB138;
 Wed, 10 Feb 2021 09:57:39 +0000 (UTC)
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
X-Inumbo-ID: e29b3b47-3708-4922-a3a9-94abd4aa0967
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612951060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qquZIWRI0HVUHWPa6REcgtkd8siTn2WKZs0cNZYkmOc=;
	b=QzD3QTcmLhvQF32yzs4uP8b+tEsPU08Q2UeZj4M5qg3L68flLVd3heQ7N2bYfg7UNSVp6x
	ItkKyzjrBmo3ydfZmY2ktRCor5Xg3/o/rx3iDzQq+UZwWhXokLsCejfJJMxia7j8Va80qH
	nzqN4TelAba99nv1lsHCW6saxTmR144=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: fix SYSENTER/SYSCALL switching into 64-bit mode
Message-ID: <7ce15e4b-8bf1-0cfd-ca9e-5f6eba12cac1@suse.com>
Date: Wed, 10 Feb 2021 10:57:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When invoked by compat mode, mode_64bit() will be false at the start of
emulation. The logic after complete_insn, however, needs to consider the
mode switched into, in particular to avoid truncating RIP.

Inspired by / paralleling and extending Linux commit 943dea8af21b ("KVM:
x86: Update emulator context mode if SYSENTER xfers to 64-bit mode").

While there, tighten a related assertion in x86_emulate_wrapper() - we
want to be sure to not switch into an impossible mode when the code gets
built for 32-bit only (as is possible for the test harness).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle we could drop SYSENTER's ctxt->lma dependency when setting
_regs.r(ip). I wasn't certain whether leaving it as is serves as kind of
documentation ...

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6127,6 +6127,10 @@ x86_emulate(
              (rc = ops->write_segment(x86_seg_ss, &sreg, ctxt)) )
             goto done;
 
+        if ( ctxt->lma )
+            /* In particular mode_64bit() needs to return true from here on. */
+            ctxt->addr_size = ctxt->sp_size = 64;
+
         /*
          * SYSCALL (unlike most instructions) evaluates its singlestep action
          * based on the resulting EFLAGS.TF, not the starting EFLAGS.TF.
@@ -6927,6 +6931,10 @@ x86_emulate(
                                       ctxt)) != X86EMUL_OKAY )
             goto done;
 
+        if ( ctxt->lma )
+            /* In particular mode_64bit() needs to return true from here on. */
+            ctxt->addr_size = ctxt->sp_size = 64;
+
         singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
@@ -12113,8 +12121,12 @@ int x86_emulate_wrapper(
     unsigned long orig_ip = ctxt->regs->r(ip);
     int rc;
 
+#ifdef __x86_64__
     if ( mode_64bit() )
         ASSERT(ctxt->lma);
+#else
+    ASSERT(!ctxt->lma && !mode_64bit());
+#endif
 
     rc = x86_emulate(ctxt, ops);
 

