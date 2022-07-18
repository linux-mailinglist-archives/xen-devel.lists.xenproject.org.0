Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E9F577C5C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369274.600614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1m-0005KV-2R; Mon, 18 Jul 2022 07:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369274.600614; Mon, 18 Jul 2022 07:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1l-0005ET-TW; Mon, 18 Jul 2022 07:18:49 +0000
Received: by outflank-mailman (input) for mailman id 369274;
 Mon, 18 Jul 2022 07:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDL1j-0004to-NP
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:18:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db04218d-0669-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 09:18:45 +0200 (CEST)
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
X-Inumbo-ID: db04218d-0669-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658128725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MBnjpYcrthIMf2A0TClYrTSnU8giI6pEvHtffLJlDVY=;
  b=G6cN5xEVpKp13zbtjNdQm9WsVzxFaw8p3fJI03vxLfTZTyT70n27sbKB
   5Fe0u/NAZ1NvsVofjfiTZOKFUtndI93zhU6NZCoh/hWXVLl3emHSQ0B3W
   /j1dTrGX2SBDEjWOH75qG4lmfkTV6cwAbIIO1aihYscV9kohivGAuh1Py
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76011728
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:P9jYk60dOKxWYV0JffbD5bpxkn2cJEfYwER7XKvMYLTBsI5bpzNVn
 zMeWD+HbKrcMGCgfo1xYYjj/E5S65+Gm9FhSVNspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8Uw35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/FxKkI2P4kmw7YtI01E2
 6I7NC4kVh/W0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRD3GbwdCJRE8D5Umkf3zrnL+bydZuBSeoq9fD237k1IpieGyaoq9ltqiVcdSlWiWh
 1P/pHnHXS8UNPGy6yDZ/Sf57gPItXyiA99DfFGizdZ1hHWDy2pVDwcZPXOZi/Skjk+1W/pEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWRVlSe9rWQkwriYwo5J0FcRjMaZDMKtoyLTJ4Isv7fcjpyOPfr04KkQWChn
 2riQDsW3OtK05NSv0mv1RWe2m/3+MCUJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnuNOvwjxp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGO6VsBvs4MZCL7Mcebhr5d7Oxzl8Dd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5RrpktP3U+FiJr
 4432gnj40w3bdASqxL/qeY7RW3m51BibXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:6oN8nqq5ic+i+tM3scP2gRoaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76011728"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] xen/wait: Drop vestigial remnants of TRAP_regs_partial
Date: Mon, 18 Jul 2022 08:18:21 +0100
Message-ID: <20220718071825.22113-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718071825.22113-1-andrew.cooper3@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The preservation of entry_vector was introduced with ecf9846a6a20 ("x86:
save/restore only partial register state where possible") where
TRAP_regs_partial was introduced, but missed from f9eb74789af7 ("x86/entry:
Remove support for partial cpu_user_regs frames") where TRAP_regs_partial was
removed.

Fixes: f9eb74789af7 ("x86/entry: Remove support for partial cpu_user_regs frames")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/wait.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index 9276d76464fb..3ebb884fe738 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -124,7 +124,6 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
     struct cpu_info *cpu_info = get_cpu_info();
     struct vcpu *curr = current;
     unsigned long dummy;
-    u32 entry_vector = cpu_info->guest_cpu_user_regs.entry_vector;
 
     ASSERT(wqv->esp == 0);
 
@@ -169,8 +168,6 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         for ( ; ; )
             do_softirq();
     }
-
-    cpu_info->guest_cpu_user_regs.entry_vector = entry_vector;
 }
 
 static void __finish_wait(struct waitqueue_vcpu *wqv)
-- 
2.11.0


