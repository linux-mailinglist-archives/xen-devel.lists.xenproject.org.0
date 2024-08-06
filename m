Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D6A948F74
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 14:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772868.1183307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbJc0-0001d4-Ho; Tue, 06 Aug 2024 12:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772868.1183307; Tue, 06 Aug 2024 12:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbJc0-0001ah-FH; Tue, 06 Aug 2024 12:48:24 +0000
Received: by outflank-mailman (input) for mailman id 772868;
 Tue, 06 Aug 2024 12:48:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbJby-0001ab-Um
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 12:48:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbJby-0005fo-72; Tue, 06 Aug 2024 12:48:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbJbx-0007eA-Rr; Tue, 06 Aug 2024 12:48:22 +0000
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
	Subject:Cc:To:From; bh=bgtg7AJNCNjW0PVNQtg8CBjCCHn+6JUhVvhjRrYGPYw=; b=pR0obT
	hKWc8nKwnes/f4MHLQ48aIJgvOyHGUy8cUPdGKjHyx+x0Y95/bQfQL9e2g75Ax6PRZUZgpSTBZgeu
	hwggwo+Sot6M+EucjSv61TmwP7OkyWAxDVow/TVm/yeui5PkRHEV0Y5QKKacnV/8bbqF0jYYyu8Br
	nozNNk0SSwU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: entry: Actually skip do_trap_*() when an SError is triggered
Date: Tue,  6 Aug 2024 13:48:15 +0100
Message-Id: <20240806124815.53492-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

For SErrors, we support two configurations:
  * Every SErrors will result to a panic in Xen
  * We will forward SErrors triggered by a VM back to itself

For the latter case, we want to skip the call to do_trap_*() because the PC
was already adjusted.

However, the alternative used to decide between the two configurations
is inverted. This would result to the VM corrupting itself if:
  * x19 is non-zero in the panic case
  * advance PC too much in the second case

Solve the issue by switch from alternative_if to alternative_if_not.

Fixes: a458d3bd0d25 ("xen/arm: entry: Ensure the guest state is synced when receiving a vSError")
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

This is a candidate to be backported to all supported tree.

I don't have a setup where I can easily inject SError. But this was tested
by setting x19 to 1 just before the first alternative and use "serrors=panic".

Before this patch, Linux would get stuck.
---
 xen/arch/arm/arm64/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 6251135ebdd2..fab10f8a0d26 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -259,7 +259,7 @@
          * apart. The easiest way is to duplicate the few instructions
          * that need to be skipped.
          */
-        alternative_if SKIP_SYNCHRONIZE_SERROR_ENTRY_EXIT
+        alternative_if_not SKIP_SYNCHRONIZE_SERROR_ENTRY_EXIT
         cbnz      x19, 1f
         mov       x0, sp
         bl        do_trap_\trap
-- 
2.40.1


