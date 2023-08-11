Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC12778803
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582285.912002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRE-0005Ca-60; Fri, 11 Aug 2023 07:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582285.912002; Fri, 11 Aug 2023 07:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRE-000541-0F; Fri, 11 Aug 2023 07:20:00 +0000
Received: by outflank-mailman (input) for mailman id 582285;
 Fri, 11 Aug 2023 07:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r9U=D4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUMRC-00039t-0I
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78aef6c2-3817-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 09:19:55 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D4EA64EE0746;
 Fri, 11 Aug 2023 09:19:54 +0200 (CEST)
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
X-Inumbo-ID: 78aef6c2-3817-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 5/6] vpic/msix: make 'get_slot' static
Date: Fri, 11 Aug 2023 09:19:30 +0200
Message-Id: <6ff95436f704c852e6397a584eef65f9d1713999.1691676251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691676251.git.nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function can become static since it's used only within this file.
This also resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
of a declaration before the function definition.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: b177892d2d0e ("vpci/msix: handle accesses adjacent to the MSI-X table")
---
 xen/drivers/vpci/msix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 25bde77586a4..f9df506f29bf 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -223,7 +223,7 @@ static void __iomem *get_table(const struct vpci *vpci, unsigned int slot)
     return msix->table[slot];
 }
 
-unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
+static unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
 {
     unsigned long pfn = PFN_DOWN(addr);
 
-- 
2.34.1


