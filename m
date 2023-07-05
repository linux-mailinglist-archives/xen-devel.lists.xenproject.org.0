Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDB0748804
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559317.874287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pf-0004Gx-V7; Wed, 05 Jul 2023 15:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559317.874287; Wed, 05 Jul 2023 15:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pf-0004E6-Nb; Wed, 05 Jul 2023 15:27:27 +0000
Received: by outflank-mailman (input) for mailman id 559317;
 Wed, 05 Jul 2023 15:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH4Pd-0001jW-MY
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:27:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70dc1d4e-1b48-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 17:27:24 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.248.64])
 by support.bugseng.com (Postfix) with ESMTPSA id CFD1E4EE0C9B;
 Wed,  5 Jul 2023 17:27:22 +0200 (CEST)
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
X-Inumbo-ID: 70dc1d4e-1b48-11ee-8611-37d641c3527e
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
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v2 10/13] x86/monitor: fix violations of MISRA C:2012 Rule 7.2
Date: Wed,  5 Jul 2023 17:26:32 +0200
Message-Id: <8fd5ef2ace63cfd86e94aafb533a139f2a7d0f96.1688559115.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688559115.git.gianluca.luparini@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- change commit title to make it unique
- change commit message
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


