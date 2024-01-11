Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931982B5B4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 21:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666521.1037215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO1P2-0006XC-B5; Thu, 11 Jan 2024 20:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666521.1037215; Thu, 11 Jan 2024 20:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO1P2-0006Vf-8G; Thu, 11 Jan 2024 20:11:48 +0000
Received: by outflank-mailman (input) for mailman id 666521;
 Thu, 11 Jan 2024 20:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikTk=IV=citrix.com=prvs=733603de5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rO1P1-0006VZ-4n
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 20:11:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a26167c5-b0bd-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 21:11:43 +0100 (CET)
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
X-Inumbo-ID: a26167c5-b0bd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705003903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vFvoMsqyWFHreX8Y6trU3e3hv4EtiqIn/i79xDFGmac=;
  b=BRk1p8zv6fjsS3/crXgZJc6fxw2p86jl+MxcvqiuQUmls3JJCDzE+5FJ
   WuMB01AKs1pWKvl3muSGXntdZFEQ7Te9UacKfk85MeLYeRpGoCK8WdQlO
   fA/qKV++8madqfRxS/b+64/atC9z8yU5ulmaXNGDDWrNF39dbZqO9rkLg
   s=;
X-CSE-ConnectionGUID: Z6gQJUwJRXSzUt1GtVnlpQ==
X-CSE-MsgGUID: XBKvECL9QaqVW/qcQqhyGA==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 132139168
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:HbVQR6wdTe9Pyz4M73p6t+dsxirEfRIJ4+MujC+fZmUNrF6WrkUBx
 jBLDG2Da/zZZWTxeosibY3l9B8Pup/Vx981SgZpqiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8E8HUMja4mtC4gRnPKkT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVMQ+
 sU6FS8vVCC4ld+qmZ2ndO9onv12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ4Pxx3J/
 zyWl4j/KiEwF8Ky4h7Uy3u1uNCIhCjCQYIDO5Tto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYfXNxKGuF89wCJyYLT+Q+SAmVCRTlEAPQEnsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkAowXQqPHFeC1Ffup+6/dB10Uqnostf/LCdvIP6IBPN3
 BKwnBMsuqlKotI10aGjxAWS696znaQlXjLZ9y2OATr5t1IhOtL4D7FE/2Q3+hqpEWp4crVil
 CJd8yRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiH7IdkBumEhfRw4bq7onAMFh
 2eK5GtsCGJ7ZiP2PcebnartYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hgjQfLwXufhnY
 /+zKJ/8ZUv2/Iw7lFJasc9Bi+50rs3/rEuPLa3GI+OPi+PDNC7PFexZbzNjrIkRtcu5nekcy
 P4HX+Pi9vmVeLSWjvX/mWLLEW03EA==
IronPort-HdrOrdr: A9a23:oCb/zqiiwEcBJgrbXYSNiDaBVnBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AarVSNmqixpPXavSW+Oe3n9jmUfJ7fUT/8WjyGX+?=
 =?us-ascii?q?DG1t1EZKJd1mU4Joxxg=3D=3D?=
X-Talos-MUID: 9a23:ZUiXgQv4xbmWCaDUlM2ntBtBKupDx/WXAVkzrtIfsPCdNT1fEmLI
X-IronPort-AV: E=Sophos;i="6.04,187,1695700800"; 
   d="scan'208";a="132139168"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1-alt] xen/livepatch: Make check_for_livepatch_work() faster in the common case
Date: Thu, 11 Jan 2024 20:11:29 +0000
Message-ID: <20240111201129.4010175-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
References: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When livepatching is enabled, this function is used all the time.  Really do
check the fastpath first, and annotate it likely() as this is the right answer
100% of the time (to many significant figures).  This cuts out 3 pointer
dereferences in the "nothing to do path".

However, GCC still needs some help to persuade it not to set the full stack
frame (6 spilled registers, 3 slots of locals) even on the fastpath.

Create a new check_for_livepatch_work() with the fastpath only, and make the
"new" do_livepatch_work() noinline.  This causes the fastpath to need no stack
frame, making it faster still.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v1-alt:
 * Manually split the functions.

Experimenting with __attribute__((cold)) was disappointing.  Vs this patch, it
creates an extra check_for_livepatch_work.cold function(and section) which is
just `jmp do_livepatch_work`.
---
 xen/common/livepatch.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 1209fea2566c..2c4b84382798 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1693,7 +1693,7 @@ static int livepatch_spin(atomic_t *counter, s_time_t timeout,
  * The main function which manages the work of quiescing the system and
  * patching code.
  */
-void check_for_livepatch_work(void)
+static void noinline do_livepatch_work(void)
 {
 #define ACTION(x) [LIVEPATCH_ACTION_##x] = #x
     static const char *const names[] = {
@@ -1711,10 +1711,6 @@ void check_for_livepatch_work(void)
          !is_idle_domain(current->sched_unit->domain) )
         return;
 
-    /* Fast path: no work to do. */
-    if ( !per_cpu(work_to_do, cpu ) )
-        return;
-
     smp_rmb();
     /* In case we aborted, other CPUs can skip right away. */
     if ( !livepatch_work.do_work )
@@ -1864,6 +1860,17 @@ void check_for_livepatch_work(void)
     }
 }
 
+void check_for_livepatch_work(void)
+{
+    unsigned int cpu = smp_processor_id();
+
+    /* Fast path: no work to do. */
+    if ( likely(!per_cpu(work_to_do, cpu)) )
+        return;
+
+    do_livepatch_work();
+}
+
 /*
  * Only allow dependent payload is applied on top of the correct
  * build-id.
-- 
2.30.2


