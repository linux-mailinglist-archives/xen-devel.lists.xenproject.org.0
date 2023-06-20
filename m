Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A881736A2B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551557.861231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ77-0001ct-9c; Tue, 20 Jun 2023 11:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551557.861231; Tue, 20 Jun 2023 11:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ76-0001Hz-SD; Tue, 20 Jun 2023 11:01:32 +0000
Received: by outflank-mailman (input) for mailman id 551557;
 Tue, 20 Jun 2023 10:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYi4-0004Ou-SI
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3099a977-0f56-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 12:35:35 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id AE2424EE0753;
 Tue, 20 Jun 2023 12:35:33 +0200 (CEST)
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
X-Inumbo-ID: 3099a977-0f56-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 10/13] xen/x86: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:35:02 +0200
Message-Id: <c22614e2febfe9078fcefeff4aae897fbaf92e39.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/monitor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index d4857faf8a..dc336c239a 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -48,17 +48,17 @@ static unsigned long *monitor_bitmap_for_msr(const struct domain *d, u32 *msr)
 
     switch ( *msr )
     {
-    case 0 ... 0x1fff:
+    case 0 ... 0x1fffU:
         BUILD_BUG_ON(sizeof(d->arch.monitor.msr_bitmap->low) * 8 <= 0x1fff);
         return d->arch.monitor.msr_bitmap->low;
 
-    case 0x40000000 ... 0x40001fff:
+    case 0x40000000U ... 0x40001fffU:
         BUILD_BUG_ON(
             sizeof(d->arch.monitor.msr_bitmap->hypervisor) * 8 <= 0x1fff);
         *msr &= 0x1fff;
         return d->arch.monitor.msr_bitmap->hypervisor;
 
-    case 0xc0000000 ... 0xc0001fff:
+    case 0xc0000000U ... 0xc0001fffU:
         BUILD_BUG_ON(sizeof(d->arch.monitor.msr_bitmap->high) * 8 <= 0x1fff);
         *msr &= 0x1fff;
         return d->arch.monitor.msr_bitmap->high;
-- 
2.41.0


