Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D964EAD5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464428.722852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D7-0004R2-Pd; Fri, 16 Dec 2022 11:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464428.722852; Fri, 16 Dec 2022 11:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D7-0004Mg-G3; Fri, 16 Dec 2022 11:49:05 +0000
Received: by outflank-mailman (input) for mailman id 464428;
 Fri, 16 Dec 2022 11:49:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D6-0004IQ-1V
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D5-0002Dj-RC; Fri, 16 Dec 2022 11:49:03 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D5-0004sN-Je; Fri, 16 Dec 2022 11:49:03 +0000
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
	bh=ZLdocJInFCY/LVnGw1j5HFKUJpFld4Nm6D1TB3zFoFs=; b=kpUoDQTpOqZ2oeUr+0YruDlA5R
	+9X+I0qjhfLukkQQwY8weaTAUl2Nl3fQGJ/YKVV/I3ZlZyl+1nxWkn3fLTr/G6T++f27r113LV0au
	nZHlDrqQQUXHfrnkzyPOGxy/WpLSpu5Qh+pYRcl7gixXkluuHZ4DDeZz4ybaJ9tFWa/M=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 04/22] xen/numa: vmap the pages for memnodemap
Date: Fri, 16 Dec 2022 11:48:35 +0000
Message-Id: <20221216114853.8227-5-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

This avoids the assumption that there is a direct map and boot pages
fall inside the direct map.

Clean up the variables so that mfn actually stores a type-safe mfn.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Changes compare to Hongyan's version:
        * The function modified was moved to common code. So rebase it
        * vmap_boot_pages() was renamed to vmap_contig_pages()
---
 xen/common/numa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index 4948b21fbe66..2040b3d974e5 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -424,13 +424,13 @@ static int __init populate_memnodemap(const struct node *nodes,
 static int __init allocate_cachealigned_memnodemap(void)
 {
     unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+    mfn_t mfn = alloc_boot_pages(size, 1);
 
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
+    memnodemap = vmap_contig_pages(mfn, size);
+    BUG_ON(!memnodemap);
     size <<= PAGE_SHIFT;
     printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
+           mfn_to_maddr(mfn), mfn_to_maddr(mfn) + size);
     memnodemapsize = size / sizeof(*memnodemap);
 
     return 0;
-- 
2.38.1


