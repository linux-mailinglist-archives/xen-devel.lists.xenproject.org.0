Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE67EB5EE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633102.987724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfW-0003V5-Ti; Tue, 14 Nov 2023 17:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633102.987724; Tue, 14 Nov 2023 17:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfW-00036u-2a; Tue, 14 Nov 2023 17:57:46 +0000
Received: by outflank-mailman (input) for mailman id 633102;
 Tue, 14 Nov 2023 17:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYk-0004wk-Me
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:46 +0000
Received: from 5.mo583.mail-out.ovh.net (5.mo583.mail-out.ovh.net
 [87.98.173.103]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55eb02bf-8316-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 18:50:45 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.4.72])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 831882530C
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:44 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 053BA1FD62;
 Tue, 14 Nov 2023 17:50:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id +FLBOXOzU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:43 +0000
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
X-Inumbo-ID: 55eb02bf-8316-11ee-9b0e-b553b5be7939
Authentication-Results:garm.ovh; auth=pass (GARM-103G0053f19ddfa-4a8e-402b-a711-632ec1da18cf,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 06/10] x86/smp: call x2apic_ap_setup() earlier
Date: Tue, 14 Nov 2023 18:50:08 +0100
Message-ID: <7c13554e60cc76516922992b7faf911b91f99a2a.1699981248.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981248.git.krystian.hebel@3mdeb.com>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12930960431237409136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevtdevieehieeiveekvefhlefftdfhteefueelhfdvhedtjeegkedugfefvdekffenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht

It used to be called from smp_callin(), however BUG_ON() was invoked on
multiple occasions before that. It may end up calling machine_restart()
which tries to get APIC ID for CPU running this code. If BSP detected
that x2APIC is enabled, get_apic_id() will try to use it for all CPUs.
Enabling x2APIC on secondary CPUs earlier protects against an endless
loop of #GP exceptions caused by attempts to read IA32_X2APIC_APICID
MSR while x2APIC is disabled in IA32_APIC_BASE.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/smpboot.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 8ae65ab1769f..a3895dafa267 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -184,7 +184,6 @@ static void smp_callin(void)
      * update until we finish. We are free to set up this CPU: first the APIC.
      */
     Dprintk("CALLIN, before setup_local_APIC().\n");
-    x2apic_ap_setup();
     setup_local_APIC(false);
 
     /* Save our processor parameters. */
@@ -351,6 +350,14 @@ void start_secondary(void *unused)
     get_cpu_info()->xen_cr3 = 0;
     get_cpu_info()->pv_cr3 = 0;
 
+    /*
+     * BUG_ON() used in load_system_tables() and later code may end up calling
+     * machine_restart() which tries to get APIC ID for CPU running this code.
+     * If BSP detected that x2APIC is enabled, get_apic_id() will try to use it
+     * for _all_ CPUs. Enable x2APIC on secondary CPUs now so we won't end up
+     * with endless #GP loop.
+     */
+    x2apic_ap_setup();
     load_system_tables();
 
     /* Full exception support from here on in. */
-- 
2.41.0


