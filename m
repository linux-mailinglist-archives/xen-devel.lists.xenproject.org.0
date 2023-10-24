Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6667D4DBB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621818.968658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEel-0004gV-Bd; Tue, 24 Oct 2023 10:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621818.968658; Tue, 24 Oct 2023 10:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEel-0004e3-7J; Tue, 24 Oct 2023 10:29:03 +0000
Received: by outflank-mailman (input) for mailman id 621818;
 Tue, 24 Oct 2023 10:29:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvEej-0004dt-Qh
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:29:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvEej-00053s-EE; Tue, 24 Oct 2023 10:29:01 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvEej-0006c7-5r; Tue, 24 Oct 2023 10:29:01 +0000
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
	Subject:Cc:To:From; bh=gneOgzLq+s3UL/r3Mm1AyhyGZ7LO+aSw7p45nv4K6ro=; b=FsyIK4
	6bJIVE/Xv5ZHsPzGtvtWIGCgpMXaffoIDKU8Pu3jMuIN8nBsnL0/EKbbxrwOrsR2z3VQ5gq16/xP1
	UpL+heEMYDQuFCk1sYdqHCC4cXwz73a0gOino5pwKfiMbM790HfO1NTqDGRLqBZ2+yjO9hS9VogEs
	C9DPqjaf970=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	michal.orzel@amd.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.19 v2] docs/arm: Document where Xen should be loaded in memory
Date: Tue, 24 Oct 2023 11:28:58 +0100
Message-Id: <20231024102858.29067-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
we decided to require Xen to be loaded below 2 TiB to simplify
the logic to enable the MMU. The limit was decided based on
how known platform boot plus some slack.

We had a recent report that this is not sufficient on the AVA
platform with a old firmware [1]. But the restriction is not
going to change in Xen 4.18. So document the limit clearly
in docs/misc/arm/booting.txt.

[1] https://lore.kernel.org/20231013122658.1270506-3-leo.yan@linaro.org

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---

    Changes in v2:
        - The limit is 2 TiB no 5
        - Remove unnecessary sentence in the docs
        - Add missing link
        - Add Michal's reviewed-by

I couldn't find a nice way to document it in SUPPORT.md. So I decided
to only document the restrict in docs/misc/arm/booting.txt for now.

I also couldn't find any way from GRUB/UEFI (I didn't look much) to
specify the loading address.
---
 docs/misc/arm/booting.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 02f7bb65ec6d..547f58a7d981 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -21,7 +21,9 @@ The exceptions to this on 32-bit ARM are as follows:
  zImage protocol should still be used and not the stricter "raw
  (non-zImage)" protocol described in arm/Booting.
 
-There are no exception on 64-bit ARM.
+The exceptions to this on 64-bit ARM are as follows:
+
+ Xen binary should be loaded in memory below 2 TiB.
 
 Booting Guests
 --------------
-- 
2.40.1


