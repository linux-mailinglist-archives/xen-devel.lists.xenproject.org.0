Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B94615407
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 22:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435239.688368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opybg-0000vz-Pa; Tue, 01 Nov 2022 21:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435239.688368; Tue, 01 Nov 2022 21:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opybg-0000tk-N0; Tue, 01 Nov 2022 21:15:36 +0000
Received: by outflank-mailman (input) for mailman id 435239;
 Tue, 01 Nov 2022 21:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ggQ1=3B=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1opybf-0000tZ-Fp
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 21:15:35 +0000
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 525cfc74-5a2a-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 22:15:34 +0100 (CET)
Received: from pop-os.home ([86.243.100.34]) by smtp.orange.fr with ESMTPA
 id pyanoKD2rsfCIpybcoWfMO; Tue, 01 Nov 2022 22:15:33 +0100
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
X-Inumbo-ID: 525cfc74-5a2a-11ed-8fd0-01056ac49cbb
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:33 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 28/30] x86/xen: Use kstrtobool() instead of strtobool()
Date: Tue,  1 Nov 2022 22:14:16 +0100
Message-Id: <e91af3c8708af38b1c57e0a2d7eb9765dda0e963.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strtobool() is the same as kstrtobool().
However, the latter is more used within the kernel.

In order to remove strtobool() and slightly simplify kstrtox.h, switch to
the other function name.

While at it, include the corresponding header file (<linux/kstrtox.h>)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is part of a serie that axes all usages of strtobool().
Each patch can be applied independently from the other ones.

The last patch of the serie removes the definition of strtobool().

You may not be in copy of the cover letter. So, if needed, it is available
at [1].

[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 arch/x86/xen/enlighten_pv.c | 3 ++-
 arch/x86/xen/setup.c        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 05170fc19083..9e1ac6a281e4 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -23,6 +23,7 @@
 #include <linux/start_kernel.h>
 #include <linux/sched.h>
 #include <linux/kprobes.h>
+#include <linux/kstrtox.h>
 #include <linux/memblock.h>
 #include <linux/export.h>
 #include <linux/mm.h>
@@ -113,7 +114,7 @@ static __read_mostly bool xen_msr_safe = IS_ENABLED(CONFIG_XEN_PV_MSR_SAFE);
 static int __init parse_xen_msr_safe(char *str)
 {
 	if (str)
-		return strtobool(str, &xen_msr_safe);
+		return kstrtobool(str, &xen_msr_safe);
 	return -EINVAL;
 }
 early_param("xen_msr_safe", parse_xen_msr_safe);
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index cfa99e8f054b..0abccdab5bc6 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -7,6 +7,7 @@
 
 #include <linux/init.h>
 #include <linux/sched.h>
+#include <linux/kstrtox.h>
 #include <linux/mm.h>
 #include <linux/pm.h>
 #include <linux/memblock.h>
@@ -85,7 +86,7 @@ static void __init xen_parse_512gb(void)
 	arg = strstr(xen_start_info->cmd_line, "xen_512gb_limit=");
 	if (!arg)
 		val = true;
-	else if (strtobool(arg + strlen("xen_512gb_limit="), &val))
+	else if (kstrtobool(arg + strlen("xen_512gb_limit="), &val))
 		return;
 
 	xen_512gb_limit = val;
-- 
2.34.1


