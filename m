Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162A2EF430
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 15:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63546.112812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt6M-0008S6-7Q; Fri, 08 Jan 2021 14:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63546.112812; Fri, 08 Jan 2021 14:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt6M-0008Re-3e; Fri, 08 Jan 2021 14:50:54 +0000
Received: by outflank-mailman (input) for mailman id 63546;
 Fri, 08 Jan 2021 14:50:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0bx=GL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kxt6K-0008RL-R0
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 14:50:52 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e34234fe-02a3-46e8-88f9-137e05f4d4f9;
 Fri, 08 Jan 2021 14:50:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB28ED1;
 Fri,  8 Jan 2021 06:50:51 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA9293F70D;
 Fri,  8 Jan 2021 06:50:50 -0800 (PST)
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
X-Inumbo-ID: e34234fe-02a3-46e8-88f9-137e05f4d4f9
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 07/11] xen/arm: bitops: Implement a ffsll function
Date: Fri,  8 Jan 2021 14:46:27 +0000
Message-Id: <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610115608.git.rahul.singh@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
In-Reply-To: <cover.1610115608.git.rahul.singh@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>

Implement the ffsll based on built-in function "__builtin_ffsll()"

ffsll will return one plus the index of the least significant 1-bit in
doublewords or if doublewords is zero, returns zero.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in V4:
 - This patch is introduce in this verison.
---
 xen/include/asm-arm/bitops.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/include/asm-arm/bitops.h b/xen/include/asm-arm/bitops.h
index 71ae14cab3..7f83ee1828 100644
--- a/xen/include/asm-arm/bitops.h
+++ b/xen/include/asm-arm/bitops.h
@@ -170,6 +170,18 @@ static inline unsigned int find_first_set_bit(unsigned long word)
         return ffsl(word) - 1;
 }
 
+/**
+ * ffsll - find the first least significant set bit
+ * @doubleword: double word to search
+ *
+ * Returns one plus the index of the least significant 1-bit in @doubleword
+ * or if doubleword is zero, returns zero.
+ */
+static inline int ffsll(long long doubleword)
+{
+        return __builtin_ffsll(doubleword);
+}
+
 /**
  * hweightN - returns the hamming weight of a N-bit word
  * @x: the word to weigh
-- 
2.17.1


