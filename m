Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A17EB5E7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633107.987743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfY-0003vS-Vl; Tue, 14 Nov 2023 17:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633107.987743; Tue, 14 Nov 2023 17:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfX-0003ki-OA; Tue, 14 Nov 2023 17:57:47 +0000
Received: by outflank-mailman (input) for mailman id 633107;
 Tue, 14 Nov 2023 17:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYl-0004mK-Iv
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:47 +0000
Received: from 4.mo576.mail-out.ovh.net (4.mo576.mail-out.ovh.net
 [46.105.42.102]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 562ff767-8316-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 18:50:45 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.146.213])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 33ED12BB9F
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:45 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AD9971FE62;
 Tue, 14 Nov 2023 17:50:44 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id aOi5InSzU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:44 +0000
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
X-Inumbo-ID: 562ff767-8316-11ee-98db-6d05b1d4d9a1
Authentication-Results:garm.ovh; auth=pass (GARM-103G0052b324679-71f1-4ee1-bb31-3382685591f2,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 07/10] x86/shutdown: protect against recurrent machine_restart()
Date: Tue, 14 Nov 2023 18:50:09 +0100
Message-ID: <87b0e650f28038c2fb64c5eb607c8fdaa7b4db07.1699981248.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981248.git.krystian.hebel@3mdeb.com>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12931241908158114160
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevtdevieehieeiveekvefhlefftdfhteefueelhfdvhedtjeegkedugfefvdekffenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht

If multiple CPUs called machine_restart() before actual restart took
place, but after boot CPU declared itself not online, ASSERT in
on_selected_cpus() will fail. Few calls later execution would end up
in machine_restart() again, with another frame on call stack for new
exception.

To protect against running out of stack, code checks if boot CPU is
still online before calling on_selected_cpus().

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/shutdown.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 7619544d14da..32c70505ed77 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -577,9 +577,23 @@ void machine_restart(unsigned int delay_millisecs)
         /* Ensure we are the boot CPU. */
         if ( get_apic_id() != boot_cpu_physical_apicid )
         {
-            /* Send IPI to the boot CPU (logical cpu 0). */
-            on_selected_cpus(cpumask_of(0), __machine_restart,
-                             &delay_millisecs, 0);
+            /*
+             * Send IPI to the boot CPU (logical cpu 0).
+             *
+             * If multiple CPUs called machine_restart() before actual restart
+             * took place, but after boot CPU declared itself not online, ASSERT
+             * in on_selected_cpus() will fail. Few calls later we would end up
+             * here again, with another frame on call stack for new exception.
+             * To protect against running out of stack, check if boot CPU is
+             * online.
+             *
+             * Note this is not an atomic operation, so it is possible for
+             * on_selected_cpus() to be called once after boot CPU is offline
+             * before we hit halt() below.
+             */
+            if ( cpu_online(0) )
+                on_selected_cpus(cpumask_of(0), __machine_restart,
+                                 &delay_millisecs, 0);
             for ( ; ; )
                 halt();
         }
-- 
2.41.0


