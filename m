Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA963EACA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450233.707499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0eZJ-0008En-JJ; Thu, 01 Dec 2022 08:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450233.707499; Thu, 01 Dec 2022 08:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0eZJ-0008C6-GD; Thu, 01 Dec 2022 08:05:17 +0000
Received: by outflank-mailman (input) for mailman id 450233;
 Thu, 01 Dec 2022 08:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux6T=37=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1p0eZH-00089d-S6
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:05:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e22707bf-714e-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 09:05:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16A5D6E;
 Thu,  1 Dec 2022 00:05:19 -0800 (PST)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A59263F67D;
 Thu,  1 Dec 2022 00:05:10 -0800 (PST)
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
X-Inumbo-ID: e22707bf-714e-11ed-91b6-6bf2151ebd3b
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/2] xen/arm: vpl011: drop extra return in vpl011_mmio_read
Date: Thu,  1 Dec 2022 16:04:00 +0800
Message-Id: <20221201080400.1842558-3-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201080400.1842558-1-jiamei.xie@arm.com>
References: <20221201080400.1842558-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vpl011_mmio_read switch block, all cases have a return. So the
outside one can be removed.

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
---
v3 -> v4
- Don't consolidate check registers access
- Don't remove label read_as_zero
---
 xen/arch/arm/vpl011.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index f4a5621fab..35de50760c 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -417,8 +417,6 @@ static int vpl011_mmio_read(struct vcpu *v,
         goto read_as_zero;
     }
 
-    return 1;
-
 read_as_zero:
     *r = 0;
     return 1;
-- 
2.25.1


