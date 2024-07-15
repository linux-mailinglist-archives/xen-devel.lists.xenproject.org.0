Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8519318CE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759091.1168731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOt3-0004Jl-EX; Mon, 15 Jul 2024 16:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759091.1168731; Mon, 15 Jul 2024 16:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOt3-0004HW-BB; Mon, 15 Jul 2024 16:49:17 +0000
Received: by outflank-mailman (input) for mailman id 759091;
 Mon, 15 Jul 2024 16:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3wo=OP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sTOt2-0003ll-Dr
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:49:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b3e0205-42ca-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 18:49:14 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.163.111.28])
 by support.bugseng.com (Postfix) with ESMTPSA id C57A64EE0742;
 Mon, 15 Jul 2024 18:49:12 +0200 (CEST)
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
X-Inumbo-ID: 2b3e0205-42ca-11ef-8776-851b0ebba9a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4 2/9] x86/cpuid: use fallthrough pseudo keyword
Date: Mon, 15 Jul 2024 18:48:53 +0200
Message-Id: <a7c697fc2cac00a2598a8b904adb9dfc3e0d40f3.1721050709.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721050709.git.federico.serafini@bugseng.com>
References: <cover.1721050709.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current comment making explicit the fallthrough intention does
not follow the agreed syntax: replace it with the pseduo keyword.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpuid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index a822e80c7e..2a777436ee 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -97,9 +97,8 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         if ( is_viridian_domain(d) )
             return cpuid_viridian_leaves(v, leaf, subleaf, res);
 
+        fallthrough;
         /*
-         * Fallthrough.
-         *
          * Intel reserve up until 0x4fffffff for hypervisor use.  AMD reserve
          * only until 0x400000ff, but we already use double that.
          */
-- 
2.34.1


