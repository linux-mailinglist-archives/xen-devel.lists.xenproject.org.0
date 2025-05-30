Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F1AC8FCC
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000982.1381256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfH-0007ed-LY; Fri, 30 May 2025 13:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000982.1381256; Fri, 30 May 2025 13:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfH-0007YY-ER; Fri, 30 May 2025 13:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1000982;
 Fri, 30 May 2025 13:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdc-0008Jy-JQ
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:08 +0000
Received: from 9.mo561.mail-out.ovh.net (9.mo561.mail-out.ovh.net
 [87.98.184.141]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a932ea8e-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:19:05 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.180])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4b83jP1cy2z1YFn
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:05 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-sqk4q (unknown [10.110.168.56])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 77CA610022F;
 Fri, 30 May 2025 13:19:04 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-5b5ff79f4f-sqk4q with ESMTPSA
 id nUD9EEiwOWgXJgAAZ+UDpg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:04 +0000
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
X-Inumbo-ID: a932ea8e-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-103G005baab5605-d08e-4e2c-a3be-21458a63de71,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 12/22] x86/hvm: check for VMX in SMX if Slaunch is active
Date: Fri, 30 May 2025 16:17:54 +0300
Message-ID: <25de2a5ba43629cca33b96d20c77f19d64096242.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12702684225100625052
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegkeffieeitdevkefhudegffevieeggfelgedvgeehffdtteehfeeuleeiudekvdenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=obSSiy8YAHm2T2PniWDCTzac2MGgksM6oibQ6iXFGMY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611145; v=1;
 b=KnQZv8WLUXETTFEQ2abZsscZIgP0ZcCLoZ2Bli4n4ItYmqdUYAtfwWaFuD8LUXd+noBHCgch
 ZZnTJEE8g0D8K29rvNOxbSAzyr3kRiv8PID4qEs+3GTNPyAYFM1Pf/nZVli6T9LcrzU8Dwf0Rtg
 DlUBSumOo/9zXJ8O5w1ZkDLOE37hDXDHwF1I9hjnyJFWKXEKX2p3UHGlnQpKPMENCZauT/vVVvo
 ipWZ5JZejWAaGhDPRe1wKMSXt6Mh5N4XNaT904xvPmLc7Cz+SATbivuvVoouG/pDWKmyn+jmhG1
 muOgvoW7wFNDPiui0pgyw2jDMDUWfcWS6mtJJE8mMYCFw==

From: Michał Żygowski <michal.zygowski@3mdeb.com>

Check whther IA32_FEATURE_CONTROL has the proper bits enabled to run
VMX in SMX when slaunch is active.

Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 57d49364db..835a6be75a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -30,6 +30,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/shadow.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/xstate.h>
@@ -724,7 +725,7 @@ static int _vmx_cpu_up(bool bsp)
     bios_locked = !!(eax & IA32_FEATURE_CONTROL_LOCK);
     if ( bios_locked )
     {
-        if ( !(eax & (tboot_in_measured_env()
+        if ( !(eax & (tboot_in_measured_env() || slaunch_active
                       ? IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX
                       : IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX)) )
         {
-- 
2.49.0


