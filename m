Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B2375289
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 12:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123419.232782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebTO-0004wM-PX; Thu, 06 May 2021 10:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123419.232782; Thu, 06 May 2021 10:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebTO-0004tr-Lj; Thu, 06 May 2021 10:43:14 +0000
Received: by outflank-mailman (input) for mailman id 123419;
 Thu, 06 May 2021 10:43:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lebTN-0004cw-4B
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 10:43:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lebTJ-000652-Nr; Thu, 06 May 2021 10:43:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lebTJ-0002l1-FD; Thu, 06 May 2021 10:43:09 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=hsYrq9gCUN9/sBh5lySpQIJ5bBTu7DfTjVtwFhrf7bg=; b=Er2XOMbbw53B75nvXe24LJmNA
	4oPwroYgwxIuo3/s0++bOaDipB64gygv+vcIWw4ejGrRJF3qMHXEFmYy4fnMzPiUTwVVE5cCMtLZJ
	iQv5SqfTjvWgp4bE0KpgSLU27aPW8olHvhEyOi4zGl4xQV8My3B4g1mIuw+cssUw7DSKU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: dwmw2@infradead.org,
	paul@xen.org,
	hongyxia@amazon.com,
	raphning@amazon.com,
	maghul@amazon.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 2/2] xen/kexec: Reserve KEXEC_TYPE_LIVEUPDATE and KEXEC_RANGE_MA_LIVEUPDATE
Date: Thu,  6 May 2021 11:42:59 +0100
Message-Id: <20210506104259.16928-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506104259.16928-1-julien@xen.org>
References: <20210506104259.16928-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Unfortunately, the code to support Live Update has already been merged in
Kexec and shipped since 2.0.21. Reserve the IDs used by Kexec before they
end up to be re-used for a different purpose.

This patch reserves two IDs:
    * KEXEC_TYPE_LIVEUPDATE: New operation to request Live Update
    * KEXEC_MA_RANGE_LIVEUPDATE: New range to query the Live Update
      area below Xen

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/public/kexec.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 3f2a118381ba..650d2feb036f 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -71,17 +71,22 @@
  */
 
 /*
- * Kexec supports two types of operation:
+ * Kexec supports three types of operation:
  * - kexec into a regular kernel, very similar to a standard reboot
  *   - KEXEC_TYPE_DEFAULT is used to specify this type
  * - kexec into a special "crash kernel", aka kexec-on-panic
  *   - KEXEC_TYPE_CRASH is used to specify this type
  *   - parts of our system may be broken at kexec-on-panic time
  *     - the code should be kept as simple and self-contained as possible
+ * - Live update into a new Xen, preserving all running domains
+ *   - KEXEC_TYPE_LIVE_UPDATE is used to specify this type
+ *   - Xen performs non-cooperative live migration and stores live
+ *     update state in memory, passing it to the new Xen.
  */
 
-#define KEXEC_TYPE_DEFAULT 0
-#define KEXEC_TYPE_CRASH   1
+#define KEXEC_TYPE_DEFAULT      0
+#define KEXEC_TYPE_CRASH        1
+#define KEXEC_TYPE_LIVEUPDATE   2
 
 
 /* The kexec implementation for Xen allows the user to load two
@@ -150,6 +155,8 @@ typedef struct xen_kexec_load_v1 {
 #define KEXEC_RANGE_MA_EFI_MEMMAP 5 /* machine address and size of
                                      * of the EFI Memory Map */
 #define KEXEC_RANGE_MA_VMCOREINFO 6 /* machine address and size of vmcoreinfo */
+/* machine address and size of the Live Update area below Xen */
+#define KEXEC_RANGE_MA_LIVEUPDATE 7
 
 /*
  * Find the address and size of certain memory areas
-- 
2.17.1


