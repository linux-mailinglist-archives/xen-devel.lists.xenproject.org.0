Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE651183D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315039.533364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhd6-0004UD-DE; Wed, 27 Apr 2022 13:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315039.533364; Wed, 27 Apr 2022 13:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhd6-0004SL-AB; Wed, 27 Apr 2022 13:22:52 +0000
Received: by outflank-mailman (input) for mailman id 315039;
 Wed, 27 Apr 2022 13:22:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njhd4-0004SC-Us
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:22:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njhd4-0006Pg-2N; Wed, 27 Apr 2022 13:22:50 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njhd3-000602-PT; Wed, 27 Apr 2022 13:22:49 +0000
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
	Subject:Cc:To:From; bh=R4xkNqTwt0kcG0EheB+qkncHGbovRkUehNDbKlxc9f4=; b=QvBSMV
	u6pzFR7c2wnI1OwTdRH44wU+NECi20YqydUqceXzGWtzRQrj7M0GZ86LBBkh76L2RiIW/Eq5BPZnE
	PGdz/SrJ13T6EPTRqir+Sb//ZcTDqLhm24tdoFtRs68V2UZiDAZCOp+8aaP2bTzQEE5lLaPHlfhu4
	ZUN2AHNe7wY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.MD: Correct the amount of physical memory supported for Arm
Date: Wed, 27 Apr 2022 14:22:46 +0100
Message-Id: <20220427132246.52715-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

As part of XSA-385, SUPPORT.MD gained a statement regarding the amount
of physical memory supported.

However, booting Xen on a Arm platform with that amount of memory would
result to a breakage because the frametable area is too small.

The wiki [1] (as of April 2022) claims we were able to support up to
5 TiB on Arm64 and 16 GiB. However, this is not the case because
the struct page_info has always been bigger than expected (56 bytes
for 64-bit and 32-bytes for 32-bit).

I don't have any HW with such amount of memory. So rather than
modifying the code, take the opportunity to use the limit that should
work on Arm (2 TiB for 64-bit and 12 GiB for 32-bit).

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 SUPPORT.md | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 088dda9561c1..1e3c69a07615 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -50,9 +50,10 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
 
 ### Physical Memory
 
-    Status: Supported up to 8 TiB
-
-Hosts with more memory are supported, but not security supported.
+    Status, x86: Supported up to 8 TiB. Hosts with more memory are
+                 supported but not security support.
+    Status, Arm32: Supported up to 12 GiB
+    Status, Arm64: Supported up to 2 TiB
 
 ### Physical Memory Hotplug
 
-- 
2.32.0


