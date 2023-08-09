Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8C7759C5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580903.909436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxz-0000cA-OD; Wed, 09 Aug 2023 11:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580903.909436; Wed, 09 Aug 2023 11:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxz-0000WY-EA; Wed, 09 Aug 2023 11:03:03 +0000
Received: by outflank-mailman (input) for mailman id 580903;
 Wed, 09 Aug 2023 11:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTgxx-0007K6-FG
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:03:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d864b60-36a4-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 13:03:00 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1F8A64EE0747;
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
X-Inumbo-ID: 4d864b60-36a4-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 7/8] x86/i8259: address MISRA C:2012 Rule 8.4
Date: Wed,  9 Aug 2023 13:02:40 +0200
Message-Id: <41edfbbbc8fae317ebee791633259d7b5c88a2c6.1691575243.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691575243.git.nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The additional header file makes the declaration for the function
'init_IRQ', defined in this file visible, thereby resolving the
violation of Rule 8.4.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/i8259.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 6b35be10f0..9b02a3a0ae 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -19,6 +19,7 @@
 #include <xen/delay.h>
 #include <asm/apic.h>
 #include <asm/asm_defns.h>
+#include <asm/setup.h>
 #include <io_ports.h>
 #include <irq_vectors.h>
 
-- 
2.34.1


