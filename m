Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8FB642390
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 08:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453200.710884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p25tI-0003Fq-0m; Mon, 05 Dec 2022 07:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453200.710884; Mon, 05 Dec 2022 07:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p25tH-0003DY-Sg; Mon, 05 Dec 2022 07:27:51 +0000
Received: by outflank-mailman (input) for mailman id 453200;
 Mon, 05 Dec 2022 07:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFyF=4D=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1p25tH-0002UH-1M
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 07:27:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 52ab5f3b-746e-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 08:27:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6665B23A;
 Sun,  4 Dec 2022 23:27:56 -0800 (PST)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5659C3F73D;
 Sun,  4 Dec 2022 23:27:47 -0800 (PST)
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
X-Inumbo-ID: 52ab5f3b-746e-11ed-91b6-6bf2151ebd3b
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 2/2] xen/arm: vpl011: add ASSERT_UNREACHABLE in vpl011_mmio_read
Date: Mon,  5 Dec 2022 15:26:40 +0800
Message-Id: <20221205072640.2092473-3-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205072640.2092473-1-jiamei.xie@arm.com>
References: <20221205072640.2092473-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vpl011_mmio_read switch block, all cases should have a return. Add
ASSERT_UNREACHABLE to catch case where the return is not added.

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
---
v4 -> v5
- don't remove "return 1" and add ASSERT_UNREACHABLE
v3 -> v4
- Don't consolidate check registers access
- Don't remove label read_as_zero
---
 xen/arch/arm/vpl011.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index f4a5621fab..c7f9dae76c 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -417,6 +417,7 @@ static int vpl011_mmio_read(struct vcpu *v,
         goto read_as_zero;
     }
 
+    ASSERT_UNREACHABLE();
     return 1;
 
 read_as_zero:
-- 
2.25.1


