Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2653777327
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581929.911452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DN-0006ve-34; Thu, 10 Aug 2023 08:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581929.911452; Thu, 10 Aug 2023 08:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DM-0006nG-TU; Thu, 10 Aug 2023 08:40:16 +0000
Received: by outflank-mailman (input) for mailman id 581929;
 Thu, 10 Aug 2023 08:40:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1DK-0005Mc-W7
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:40:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc7ea8b-3759-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:40:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A558D4EE0740;
 Thu, 10 Aug 2023 10:40:12 +0200 (CEST)
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
X-Inumbo-ID: 7fc7ea8b-3759-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 7/7] x86/nmi: include missing header with declarations for 'watchdog_*'
Date: Thu, 10 Aug 2023 10:39:47 +0200
Message-Id: <0665857accd8f39297f4cb77329fb1874be21302.1691655814.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691655814.git.nicola.vetrini@bugseng.com>
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include an additional header to make the declarations for
functions 'watchdog_*' visible prior to their definition in
the file, thereby resolving the violations of Rule 8.4.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: c8177e691f0f ("watchdog: Move watchdog from being x86 specific to common code")
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- Revised commit message
---
 xen/arch/x86/nmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 104e366bd310..dc79c25e3ffd 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -24,6 +24,7 @@
 #include <xen/console.h>
 #include <xen/smp.h>
 #include <xen/keyhandler.h>
+#include <xen/watchdog.h>
 #include <xen/cpu.h>
 #include <asm/current.h>
 #include <asm/mc146818rtc.h>
-- 
2.34.1


