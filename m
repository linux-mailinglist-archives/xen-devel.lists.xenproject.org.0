Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761387D4D5B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621784.968582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvELs-0005dl-BR; Tue, 24 Oct 2023 10:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621784.968582; Tue, 24 Oct 2023 10:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvELs-0005b0-8n; Tue, 24 Oct 2023 10:09:32 +0000
Received: by outflank-mailman (input) for mailman id 621784;
 Tue, 24 Oct 2023 10:09:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvELq-0005au-QI
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:09:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvELq-0004g1-9g; Tue, 24 Oct 2023 10:09:30 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvELq-0005qh-0F; Tue, 24 Oct 2023 10:09:30 +0000
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
	Subject:Cc:To:From; bh=/nOMeehIJeVAJWZX97QRpxOFWzxOFIMgOSDEHFUYH9g=; b=43QEbr
	mL8x68O4HnevGHQRqLDDuGmyopI6WA/WbGpWiZFZcn6wc31aF1gFSlaupD6S6UgLaUiv2QkAq2ko3
	vvrp+LMdSN3Nr1Ew8SOMPvEtBrX7NuCLLVHGSmixnSjOd85q9RSBlWoN9yMsH+qV6PZkAJ01sYty0
	vhr6cDkUwaU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	michal.orzel@amd.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.19] docs/arm: Document where Xen should be loaded in memory
Date: Tue, 24 Oct 2023 11:09:23 +0100
Message-Id: <20231024100923.12724-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
we decided to require Xen to be loaded below 5 TiB to simplify
the logic to enable the MMU. The limit was decided based on
how known platform boot plus some slack.

We had a recent report that this is not sufficient on the AVA
platform with a old firmware [1]. But the restriction is not
going to change in Xen 4.18. So document the limit clearly
in docs/misc/arm/booting.txt

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

I couldn't find a nice way to document it in SUPPORT.md. So I decided
to only document the restrict in docs/misc/arm/booting.txt for now.

I also couldn't find any way from GRUB/UEFI (I didn't look much) to
specify the loading address.
---
 docs/misc/arm/booting.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 02f7bb65ec6d..c6bdeafe5e5b 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -21,6 +21,10 @@ The exceptions to this on 32-bit ARM are as follows:
  zImage protocol should still be used and not the stricter "raw
  (non-zImage)" protocol described in arm/Booting.
 
+The exceptions to this on 64-bit ARM are as follows:
+
+ Xen binary should be loaded in memory below 2 TiB.
+
 There are no exception on 64-bit ARM.
 
 Booting Guests
-- 
2.40.1


