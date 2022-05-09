Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41DE51F666
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 10:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324264.546224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnyQF-00059j-3n; Mon, 09 May 2022 08:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324264.546224; Mon, 09 May 2022 08:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnyQF-000577-0e; Mon, 09 May 2022 08:07:15 +0000
Received: by outflank-mailman (input) for mailman id 324264;
 Mon, 09 May 2022 08:07:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nnyQC-000571-RT
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 08:07:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnyQC-0003Aa-5v; Mon, 09 May 2022 08:07:12 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnyQB-0002bW-TP; Mon, 09 May 2022 08:07:12 +0000
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
	Subject:Cc:To:From; bh=G9Bbls4G9n6yauL8aeteYZoGXkJGKanNRrS0wL0KSG0=; b=ZK9zen
	hzimCMdcIwr02c+qAZ/DEeOW8eKoT7rrt1hPO/r7GZ9HtacaBEEy+Z2kTY+hnqB7vXQxOGIk1aj+y
	Z0K24b6Lw9toR9TAftNuJKl0/vkRdo4YC+n9v7zk3DI0qiGx8RgVNGIOJvOZn9Su9uislwsyP9HXT
	93zv/ER0NME=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] docs: Fix SUPPORT matrix generation after a5968a553f6a
Date: Mon,  9 May 2022 09:07:07 +0100
Message-Id: <20220509080707.50926-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit a5968a553f6a "SUPPORT.MD: Correct the amount of physical memory
supported for Arm" added a support statement split over two lines.

Unfortunately, docs/support-matrix-generate throw an error for it:

    Generating support matrix (origin/stable-NN )
    + docs/support-matrix-generate HEAD https://xenbits.xen.org/docs/unstable/SUPPORT.html origin/stable-NN https://xenbits.xen.org/docs/NN-testing/SUPPORT.html
    Status, x86: Supported up to 8 TiB. Hosts with more memory are
                 supported, but not security supported.
    Status, Arm32: Supported up to 12 GiB
    Status, Arm64: Supported up to 2 TiB
    ^ cannot parse status codeblock line:
                 supported, but not security supported.
     ? at docs/parse-support-md line 172, <F> chunk 1.

It would be good to allow split support statement (to keep lines below
80 characters) but my knowledge of the script is very limited.

Therefore, workaround the error by describing the support statement
in one long line.

Fixes: a5968a553f6a "SUPPORT.MD: Correct the amount of physical memory supported for Arm"
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 SUPPORT.md | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index cdf93181cf65..ee2cd319e2f8 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -50,8 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
 
 ### Physical Memory
 
-    Status, x86: Supported up to 8 TiB. Hosts with more memory are
-                 supported, but not security supported.
+    Status, x86: Supported up to 8 TiB. Hosts with more memory are supported, but not security supported.
     Status, Arm32: Supported up to 12 GiB
     Status, Arm64: Supported up to 2 TiB
 
-- 
2.32.0


