Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6+tFC906LGo3OAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 18:59:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73067B23A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 18:59:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=citrix.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1336906.1598638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY5Cb-0006LP-SO; Fri, 12 Jun 2026 16:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336906.1598638; Fri, 12 Jun 2026 16:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY5Cb-0006JE-Po; Fri, 12 Jun 2026 16:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1336906;
 Fri, 12 Jun 2026 16:57:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wY5Ca-0006J8-8r
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:57:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY5CZ-0096qn-M5
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 18:57:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2c3a85-2eae-0a2a0a5409dd-0a2a4501be58-10
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 18:57:51 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2c3a8e-c1f2-0a2a45010019-a0658308907c-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 18:57:51 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 347F2449F6A3;
 Fri, 12 Jun 2026 12:56:39 -0400 (EDT)
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
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI runtime path
Date: Fri, 12 Jun 2026 17:54:36 +0100
Message-Id: <8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781283471-B655DFF4-38E03CD2/0/0
X-purgate-type: clean
X-purgate-size: 3114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:bernhard.kaindl@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF73067B23A

Anthony reported a boot-time assertion in init_xen_time() via efi_get_time()
-> efi_rs_enter() in vcpu_save_fpu() on a Broadwell-D system:

  Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195

This became fragile after the lazy-FPU removal cleanup series:

In 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling"),
efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr),
which unconditionally asserts !is_idle_vcpu(v)
so an EFI runtime call in idle context now asserts.

Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),
efi_rs_leave() was changed to call vcpu_restore_fpu(curr),
which has the same assertion and can fail for the same reason.

Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
for idle vCPUs, which don't have an FPU context to save/restore,
much like the calls are guarded in __context_switch(),
where save/restore is done only for non-idle vCPUs.

Fixes: 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling")
Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
Reported-by: Anthony PERARD <anthony.perard@vates.tech>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/efi/runtime.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Jan Beulich's suggestion to guard the calls to vcpu_save_fpu() and
vcpu_restore_fpu() in the EFI runtime path with is_idle_vcpu() checks
seems to be the right approach to fix the assertion failure for idle vCPUs:

> The thinko looks to be in 4b9851c64522 ("x86: Remove fpu_initialised/fpu_dirty"):
> While vcpu_restore_fpu() indeed unconditionally set the two boolean fields to
> true at that point, idle vCPU-s may never make it through that function, and
> hence ->fpu_dirtied would have remained false, triggering the (original) early
> exit from _vcpu_save_fpu(). Perhaps all we can do now is guard the call to
> vcpu_save_fpu() (and also the one to vcpu_restore_fpu() out of efi_rs_leave())
> by explicit is_idle_vcpu() checks. Much like the calls are guarded in
> __context_switch().

Anthony, could you test this with the 'cmos-rtc-probe' workaround you just
added removed to check if guarding the assertions as Jan suggested is enough
to fix the issues triggered on your machine?

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index a23fa75e3740..596f2710fb21 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -98,7 +98,8 @@ struct efi_rs_state efi_rs_enter(void)
      */
     sync_local_execstate();
     state.cr3 = read_cr3();
-    vcpu_save_fpu(current);
+    if ( !is_idle_vcpu(current) )
+        vcpu_save_fpu(current);
     asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
     asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
 
@@ -159,7 +160,8 @@ void efi_rs_leave(struct efi_rs_state *state)
     }
     irq_exit();
     spin_unlock(&efi_rs_lock);
-    vcpu_restore_fpu(curr);
+    if ( !is_idle_vcpu(curr) )
+        vcpu_restore_fpu(curr);
 }
 
 unsigned long efi_get_time(void)
-- 
2.39.5


