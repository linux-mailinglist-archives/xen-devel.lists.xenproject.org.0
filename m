Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA950A4EE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 18:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310335.527120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZF1-0006Oz-MK; Thu, 21 Apr 2022 16:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310335.527120; Thu, 21 Apr 2022 16:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZF1-0006Lt-Ix; Thu, 21 Apr 2022 16:01:11 +0000
Received: by outflank-mailman (input) for mailman id 310335;
 Thu, 21 Apr 2022 16:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhZF0-0006Ln-3i
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 16:01:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d5ef55f-c18c-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 18:01:02 +0200 (CEST)
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
X-Inumbo-ID: 3d5ef55f-c18c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650556867;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=1OJz8RvTJ8Itq+VTruUHMHkolaIHndfDoMVGIZQTtrY=;
  b=S4TNRHtx6raypI2AeOLQGchgMoNya8T6VkGr9RNiMLj883T/Kd58oNiu
   cI6zylI3GIiSxlvbX+vHldOi55sHE4exH2zxi+jODiKpJNzjX4WVFpNTn
   K2JbKLIzpLmkn48kzh+z9AsIgeZMOkTAnqe+efgaPC9jCUTZgvzAt5twT
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69648190
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZqZC/6knXQadjsawSDO8FLXo5gzpJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcC27Tb6rfMGSheot0aY+wpBsE7MTXyd9iGwdoqX82RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWVrV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbA07HfOShrwmUBQHHCB+F7MX17rqGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHOGQzPE2RO3WjPH8PU8gwnsuRiULRaiNBqxWSoPUP+3XMmVkZPL/Fb4OOJ43iqd9utmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFuOrD1CBcQIKO43tw6MyoDKsimcK1FRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3Ct4acu6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcR5q2z3pyH8J9AMiN2bGKuPGp9VEdMOS
 BWN0T69GbcJZCf6BUOJS97Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziFiLo
 4sHa5vWmn2ykoTWO0HqzGLaFnhSRVBTOHw8g5A/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:jWGYc69MPnmL2bhlSgduk+DQI+orL9Y04lQ7vn2YSXRuE/Bw9v
 re+sjzuiWE6wr5NEtOpTniAtjmfZq/z+8W3WB5B97LN2OK1FdARLsSibcKqAeBJ8SRzIBgPN
 9bAs1DNOE=
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69648190"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xen/build: Fix MAP rule when called in isolation
Date: Thu, 21 Apr 2022 17:00:39 +0100
Message-ID: <20220421160039.24564-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Now that `make MAP` might rebuild $(TARGET), it needs removing from
no-dot-config-targets.

Otherwise the build eventually fails with:

    CPP     arch/x86/asm-macros.i
  arch/x86/asm-macros.c:1:10: fatal error: asm/asm-defns.h: No such file or
  directory
      1 | #include <asm/asm-defns.h>
        |          ^~~~~~~~~~~~~~~~~

Fixes: e1e72198213b ("xen/build: Fix dependency for the MAP rule")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>

Backporting notes.  The original, e1e72198213b, wants backporting as far as we
can go.  This patch is only relevant from 6c122d3984a5e onwards, so 4.14,
which is why my main developing/testing on 4.13 didn't spot it.

no-dot-config-targets seems like a very easy way to create breakage...
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 3a4e3bdd0f95..ec34524ed21d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -215,7 +215,7 @@ export XEN_ROOT := $(abs_srctree)/..
 clean-targets := %clean
 no-dot-config-targets := $(clean-targets) \
                          uninstall debug cloc \
-                         cscope TAGS tags MAP gtags \
+                         cscope TAGS tags gtags \
                          xenversion
 
 config-build    := n
-- 
2.11.0


