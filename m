Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC86873D438
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554875.866324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfh-0003WC-Nc; Sun, 25 Jun 2023 20:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554875.866324; Sun, 25 Jun 2023 20:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfh-0003Nz-Ja; Sun, 25 Jun 2023 20:49:21 +0000
Received: by outflank-mailman (input) for mailman id 554875;
 Sun, 25 Jun 2023 20:49:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfg-0003Ku-Qo
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfg-0003Ma-Hj; Sun, 25 Jun 2023 20:49:20 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfg-00021M-A4; Sun, 25 Jun 2023 20:49:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=e2gQb0HdlWtQqWMde+fvJ6mMzc931ddrnh3muHKVYvo=; b=eJNOekMD1tCqbAAreLgIGPa13F
	AokNsJsBGvgamZNdOcCJRQ+s8qW+Amune3MrV1lljAZb0IBLpNTpFKqM14P2cDG0erp9GkReF4sPc
	YCne/lmFLfZ4OZ6oR5fOVPJ6yEcvqYcOjK5THmWJsV0yhj6x57SotdWuZFN/O9zamkmU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/9] xen/arm32: head: Remove 'r6' from the clobber list of create_page_tables()
Date: Sun, 25 Jun 2023 21:49:02 +0100
Message-Id: <20230625204907.57291-5-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since commit 62529f16c8a2 ("xen/arm32: head: Use a page mapping for the
1:1 mapping in create_page_tables()"), the register 'r6' is not used
anymore within create_page_tables(). So remove it from the documentation.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 997c8a4fbbc1..5e3692eb3abf 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -451,10 +451,7 @@ ENDPROC(cpu_init)
  * Output:
  *   r12: Was a temporary mapping created?
  *
- * Clobbers r0 - r4, r6
- *
- * Register usage within this function:
- *   r6 : Identity map in place
+ * Clobbers r0 - r4
  */
 create_page_tables:
         /* Prepare the page-tables for mapping Xen */
-- 
2.40.1


