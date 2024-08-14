Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB39952468
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 23:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777704.1187791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seL76-0002e4-Mo; Wed, 14 Aug 2024 21:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777704.1187791; Wed, 14 Aug 2024 21:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seL76-0002ca-Jd; Wed, 14 Aug 2024 21:01:00 +0000
Received: by outflank-mailman (input) for mailman id 777704;
 Wed, 14 Aug 2024 21:00:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1seL75-0002cU-Cb
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 21:00:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1seL74-0001pQ-Q9; Wed, 14 Aug 2024 21:00:58 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1seL74-0006gF-Dc; Wed, 14 Aug 2024 21:00:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=2S8P9lWhk8bwnpOkGtCpc7nBvi39fV4oVc25z4uXCpA=; b=Nxz7WK
	GydekKWdML94vt3St26CbHKb6TajgC2t67drbUdDMuzd4ZS2p61D4YJq6Gl0uNWf66P2xcwl6Mh9m
	nNA657KDnc6QwWKKOX/MRStIfiDl3IBEgFhGRarzDFL2hqO7MZJKus6/kI12DZ/uZJhUr3sdEEz2s
	1E5RbSwVI/k=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: Hide FEAT_SME
Date: Wed, 14 Aug 2024 22:00:54 +0100
Message-Id: <20240814210054.67520-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer hardware may support FEAT_SME. Xen doesn't have any knowledge but
it will still expose the feature to the VM. If the OS is trying to use
SME, then it will crash.

Solve by hiding FEAT_SME.

Signed-off-by: Julien Grall <julien@xen.org>

---

The current approach used to create the domain cpuinfo is to hide
(i.e. a denylist) what we know Xen is not supporting. The drawback
with this approach is for newly introduced feature, Xen will expose it
by default.

If a kernel is trying to use it then it will crash. I can't really
make my mind whether it would be better to expose only what we support
(i.e. use an allowlist).

AFAICT, there is no security concerns with the current approach because
ID_* registers are not a way to tell the kernel which features are
supported. A guest kernel could still try to access the new registers.

So the most annoying bits is that booting Xen on a new HW may lead to
an OS crashing.
---
 xen/arch/arm/cpufeature.c             | 3 +++
 xen/arch/arm/include/asm/cpufeature.h | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index ef77473bf8e3..b45dbe3c668d 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -208,6 +208,9 @@ static int __init create_domain_cpuinfo(void)
     domain_cpuinfo.pfr64.sve = 0;
     domain_cpuinfo.zfr64.bits[0] = 0;
 
+    /* Hide SMT support as Xen does not support it */
+    domain_cpuinfo.pfr64.sme = 0;
+
     /* Hide MTE support as Xen does not support it */
     domain_cpuinfo.pfr64.mte = 0;
 
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index c95582044a8a..969e043f5bda 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -207,7 +207,9 @@ struct cpuinfo_arm {
             unsigned long mte:4;
             unsigned long ras_frac:4;
             unsigned long mpam_frac:4;
-            unsigned long __res1:44;
+            unsigned long __res1:4;
+            unsigned long sme:4;
+            unsigned long __res2:36;
         };
     } pfr64;
 
-- 
2.40.1


