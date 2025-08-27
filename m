Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E5B37A1D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 08:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095533.1450497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9F2-0007i3-EI; Wed, 27 Aug 2025 06:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095533.1450497; Wed, 27 Aug 2025 06:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9F2-0007gk-Ak; Wed, 27 Aug 2025 06:02:40 +0000
Received: by outflank-mailman (input) for mailman id 1095533;
 Wed, 27 Aug 2025 06:02:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83xn=3H=yandex.ru=vyacheslav.legoshin@srs-se1.protection.inumbo.net>)
 id 1ur9F0-0007ge-Nx
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 06:02:39 +0000
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net
 [2a02:6b8:c02:900:1:45:d181:d103])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e5370e2-830b-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 08:02:37 +0200 (CEST)
Received: from mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c24:1aa8:0:640:56c3:0])
 by forward103b.mail.yandex.net (Yandex) with ESMTPS id 65AE0C012A;
 Wed, 27 Aug 2025 09:02:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 72SplHDMM8c0-t9dNJ3i3; 
 Wed, 27 Aug 2025 09:02:34 +0300
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
X-Inumbo-ID: 6e5370e2-830b-11f0-a32c-13f23c93f187
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1756274554; bh=0Rlob4aSxa0xqrzYkKAjTuRxH36ZPzw+XMsNDdBabeM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=X9HOMNUMHOAb6XEZ4bEXzdZBhz2eGpk50dM6cvaXJQho9IsLMB4hfQ2kh7Hx2MXi8
	 ckMDIrvG8lSCmA422xVqRo3qp0U0bXWdCsRAtEwfJ3McdaloSBC88c8LWaCaHGv1uc
	 BRp/L5B2T0gpgKGVcShRLtNWsI9G+doux1CuhiDg=
Authentication-Results: mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Vyacheslav Legoshin <vyacheslav.legoshin@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Vyacheslav Legoshin <vyacheslav.legoshin@yandex.ru>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] x86/vhpet: Add option to always fire hpet timer on resume
Date: Wed, 27 Aug 2025 09:01:08 +0300
Message-ID: <faa5eee741a772eba95415ca26f0cdf304486fc3.1756272466.git.vyacheslav.legoshin@yandex.ru>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following issue was observed on Windows 10 21H2 x64+: when the domain state
is saved while all cores are executing the 'halt' instruction, and the memory
save takes a relatively long time (tens of seconds), the HPET counter may
overflow as follows:
counter  = 11243f3e4a
comparator = 910cb70f

In such cases, the fix implemented in commit
b144cf45d50b603c2909fc32c6abf7359f86f1aa does not work (because the 'diff' is
not negative), resulting in the guest VM becoming unresponsive for
approximately 30 seconds.

This patch adds an option to always adjust the HPET timer to fire immediately
after restore.
---
 docs/misc/xen-command-line.pandoc |  9 +++++++++
 xen/arch/x86/hvm/hpet.c           | 21 ++++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a75b6c9301..b28610918f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1461,6 +1461,15 @@ HPET can be disabled by specifying `hpet=0`.
 
 Deprecated alternative of `hpet=broadcast`.
 
+### hpet_drift_fix (x86)
+> `= <boolean>`
+
+> Default: `false`
+
+Always set HPET timer to fire immediately after domain restore.
+This option can be used to fix unresponsive snapshots with modern x64 Windows
+systems (21H2+) which use non-periodic timers.
+
 ### hvm_debug (x86)
 > `= <integer>`
 
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index f0e5f877f4..5b9e38bd9b 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -11,6 +11,7 @@
 #include <asm/current.h>
 #include <asm/hpet.h>
 #include <asm/mc146818rtc.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/event.h>
 #include <xen/trace.h>
@@ -222,6 +223,9 @@ static void cf_check hpet_timer_fired(struct vcpu *v, void *data)
  * 1/(2^10) second, namely, 0.9765625 milliseconds */
 #define  HPET_TINY_TIME_SPAN  ((h->stime_freq >> 10) / STIME_PER_HPET_TICK)
 
+bool hpet_drift_fix;
+boolean_param("hpet_drift_fix", hpet_drift_fix);
+
 static void hpet_set_timer(HPETState *h, unsigned int tn,
                            uint64_t guest_time)
 {
@@ -268,11 +272,18 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
      * are restoring after migrate, treat any wrap as past since the value
      * is unlikely to be 'small'.
      */
-    if ( (int64_t)diff < 0 )
-        diff = (timer_is_32bit(h, tn) &&
-                vhpet_domain(h)->creation_finished &&
-                (-diff > HPET_TINY_TIME_SPAN))
-            ? (uint32_t)diff : 0;
+    if (hpet_drift_fix && !vhpet_domain(h)->creation_finished)
+    {
+        diff = 0;
+    }
+    else
+    {
+        if ( (int64_t)diff < 0 )
+            diff = (timer_is_32bit(h, tn) &&
+                    vhpet_domain(h)->creation_finished &&
+                    (-diff > HPET_TINY_TIME_SPAN))
+                ? (uint32_t)diff : 0;
+    }
 
     destroy_periodic_time(&h->pt[tn]);
     if ( (tn <= 1) && (h->hpet.config & HPET_CFG_LEGACY) )
-- 
2.42.1


