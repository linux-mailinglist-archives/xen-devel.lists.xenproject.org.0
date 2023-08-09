Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC107759C8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580904.909441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgy0-0000jX-3J; Wed, 09 Aug 2023 11:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580904.909441; Wed, 09 Aug 2023 11:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxz-0000c3-Tj; Wed, 09 Aug 2023 11:03:03 +0000
Received: by outflank-mailman (input) for mailman id 580904;
 Wed, 09 Aug 2023 11:03:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTgxy-0007K6-83
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:03:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4df2377e-36a4-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 13:03:00 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D6AA94EE0748;
 Wed,  9 Aug 2023 13:02:59 +0200 (CEST)
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
X-Inumbo-ID: 4df2377e-36a4-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 8/8] x86/nmi: address MISRA C:2012 Rule 8.4
Date: Wed,  9 Aug 2023 13:02:41 +0200
Message-Id: <cb600b79b3f603302a58198c1f5e84488441b736.1691575243.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691575243.git.nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include an additional header to make the declarations for
functions 'watchdog_*' visible prior to their definition in
the file, thereby resolving the violations of Rule 8.4.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/nmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 104e366bd3..dc79c25e3f 100644
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


