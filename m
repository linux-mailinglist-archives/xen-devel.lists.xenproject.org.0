Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53F8866E0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 07:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696654.1087740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnYZb-0008VC-Pz; Fri, 22 Mar 2024 06:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696654.1087740; Fri, 22 Mar 2024 06:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnYZb-0008S2-Mg; Fri, 22 Mar 2024 06:40:15 +0000
Received: by outflank-mailman (input) for mailman id 696654;
 Fri, 22 Mar 2024 06:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oB6h=K4=linux.alibaba.com=jiapeng.chong@srs-se1.protection.inumbo.net>)
 id 1rnYZa-0008Rw-8f
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 06:40:14 +0000
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06d3bebd-e817-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 07:40:11 +0100 (CET)
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W3160E1_1711089598) by smtp.aliyun-inc.com;
 Fri, 22 Mar 2024 14:40:07 +0800
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
X-Inumbo-ID: 06d3bebd-e817-11ee-afe0-a90da7624cb6
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1711089608; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=zRQDJgJXoe1TeM1CcHUcSOSMdyyAF8An2Aiv5fBBZMg=;
	b=GHNbHChPdSZuSC4IIhOWOn4kgg6h0Nxq/BKdFxzOWOwTXypLV+fBNNbzvtsvzh0CJCVyZ1qLlqwwLrLI8jm+6eN63Qi3D9g2UOwDhIunl/FIdzRHJ1Aluv1pgphd6pzjcYSpx3XZrFt8Ui5eLCLINtwRs+PvdSiC/wJE5EYbuiw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0W3160E1_1711089598;
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] xen/x86: Remove duplicate include
Date: Fri, 22 Mar 2024 14:39:57 +0800
Message-Id: <20240322063957.94159-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./arch/x86/xen/enlighten.c: linux/memblock.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8610
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/x86/xen/enlighten.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index a01ca255b0c6..5f3a69f6ec34 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
-#include <linux/memblock.h>
-#endif
 #include <linux/console.h>
 #include <linux/cpu.h>
 #include <linux/kexec.h>
-- 
2.20.1.7.g153144c


