Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514CAC8FEE
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001061.1381318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzhg-0004eF-CH; Fri, 30 May 2025 13:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001061.1381318; Fri, 30 May 2025 13:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzhg-0004c7-8M; Fri, 30 May 2025 13:23:20 +0000
Received: by outflank-mailman (input) for mailman id 1001061;
 Fri, 30 May 2025 13:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdt-0008Jy-Lj
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:25 +0000
Received: from 14.mo550.mail-out.ovh.net (14.mo550.mail-out.ovh.net
 [178.32.97.215]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b22512b8-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:19:20 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.148.49])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4b83jh1WJ5z1lvF
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:20 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-595tn (unknown [10.110.113.13])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8AD7EC06E0;
 Fri, 30 May 2025 13:19:19 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
 by ghost-submission-5b5ff79f4f-595tn with ESMTPSA
 id TNHOGFewOWjNxwAAeVbzSg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:19 +0000
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
X-Inumbo-ID: b22512b8-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-114S00895dc382f-a550-4f6b-b404-f0cac4229ca3,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 17/22] x86/acpi: disallow S3 on Secure Launch boot
Date: Fri, 30 May 2025 16:17:59 +0300
Message-ID: <ddf81a75f5afc404a3e52d4de5a25bae6b7801f8.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12706906350127527068
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=GDql3BTKkItj9wJ+5Y5x33V6WArPQmOVJIP++1bnZvg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611160; v=1;
 b=VisO5To8RRu8TC0ZFsf9Gfi3F2pq+oFPXbyOfsoWBWec/iz+gmWk7FcqiZOMnht0TmDHwhsM
 7q2T2kZdE6di2acc+rnLeFMqRDkERQkYfH4TXf2qgTCHjlVc+DlnGrMrMYxhVpuPAVguxXVr1KN
 CjWepru+WVBQx7iYx0gH0pgSkbmPCYs7Z7ctKQAGTw4ecgA/rmdty8DXK+BRufHQi4G6q0zHPmD
 30mYab7ia4SbIesn6X/Dv8A0V3CJXc+h+oOUVbNFaD1yGMnZqKt9/TRdY60507zBLPEuOhMtxMs
 QAGODC0YsBg2Fyhh7oqap0w91NxL5DYa1zU/54bEM4AhA==

Secure Launch won't initiate DRTM on S3 resume (the code for starting
DRTM is not part of Xen), so abort a request to perform S3 suspend to
not lose the state of DRTM PCRs.

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/acpi/power.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 448aa9f3a7..6a53c6718c 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -28,6 +28,7 @@
 #include <asm/irq.h>
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
@@ -356,6 +357,13 @@ int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep)
            PAGE_SIZE - acpi_sinfo.vector_width / 8)) )
         return -EOPNOTSUPP;
 
+    /* Secure Launch won't initiate DRTM on S3 resume, so abort S3 suspend. */
+    if ( sleep->sleep_state == ACPI_STATE_S3 && slaunch_active )
+    {
+        printk(XENLOG_INFO "SLAUNCH: refusing switching into ACPI S3 state.\n");
+        return -EPERM;
+    }
+
     if ( sleep->flags & XENPF_ACPI_SLEEP_EXTENDED )
     {
         if ( !acpi_sinfo.sleep_control.address ||
-- 
2.49.0


