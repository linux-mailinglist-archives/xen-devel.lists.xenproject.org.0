Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7BD7704A9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 17:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577194.904190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwiu-0000e7-Ic; Fri, 04 Aug 2023 15:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577194.904190; Fri, 04 Aug 2023 15:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwiu-0000YN-D7; Fri, 04 Aug 2023 15:28:16 +0000
Received: by outflank-mailman (input) for mailman id 577194;
 Fri, 04 Aug 2023 15:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRwis-00080Z-Ap
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 15:28:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 863935ce-32db-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 17:28:12 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D99AB4EE0743;
 Fri,  4 Aug 2023 17:28:11 +0200 (CEST)
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
X-Inumbo-ID: 863935ce-32db-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 4/6] x86/include: address MISRA C:2012 Rule 5.3.
Date: Fri,  4 Aug 2023 17:27:47 +0200
Message-Id: <40823fbaa9e0a9b026e5ff3b01af9d83583889fd.1691162261.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691162261.git.nicola.vetrini@bugseng.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/mpc_default_type/mpc_default in 'xen/arch/x86/include/asm/mpspec.h'
to avoid clashing with function parameter names in 'mpparse.c'.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Even though the global variable does not seem to be used anywhere and is
perhaps better to remove it entirely.
---
 xen/arch/x86/include/asm/mpspec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/mpspec.h b/xen/arch/x86/include/asm/mpspec.h
index 1246eece0b..cc96ee63bd 100644
--- a/xen/arch/x86/include/asm/mpspec.h
+++ b/xen/arch/x86/include/asm/mpspec.h
@@ -15,7 +15,7 @@ extern void get_smp_config (void);
 extern unsigned char apic_version [MAX_APICS];
 extern int mp_irq_entries;
 extern struct mpc_config_intsrc mp_irqs [MAX_IRQ_SOURCES];
-extern int mpc_default_type;
+extern int mpc_default;
 extern unsigned long mp_lapic_addr;
 extern bool pic_mode;
 
-- 
2.34.1


