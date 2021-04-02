Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D08352BB8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Apr 2021 17:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104890.200914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSLbl-0004VH-N8; Fri, 02 Apr 2021 15:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104890.200914; Fri, 02 Apr 2021 15:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSLbl-0004Us-Jk; Fri, 02 Apr 2021 15:21:13 +0000
Received: by outflank-mailman (input) for mailman id 104890;
 Fri, 02 Apr 2021 15:21:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lSLbk-0004Ui-Nm
 for xen-devel@lists.xenproject.org; Fri, 02 Apr 2021 15:21:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSLbj-00009o-PF; Fri, 02 Apr 2021 15:21:11 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSLbj-00050B-EP; Fri, 02 Apr 2021 15:21:11 +0000
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
	 bh=jQfOL7sF0Ax2+OqBBQai2IFHdDIfjtAQ7KE5lYnqt0Y=; b=gv+DsuaLbFWMDN4dwFQLxy6t+
	yuFXCq5ZQAMJkrwLTwuX0Mz/MJBvTbulaBmBt1Q993VWbR+PTA8mZvm0SPlKUUtkOsmBexrEYRcY1
	V4KrLOu6zWgicNymonlWP8bQMNSCMfRcu2B0/nM/rq54VdUONKLKDjvhiUF7BpzaFui2k=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen/gunzip: Allow perform_gunzip() to be called multiple times
Date: Fri,  2 Apr 2021 16:21:05 +0100
Message-Id: <20210402152105.29387-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402152105.29387-1-julien@xen.org>
References: <20210402152105.29387-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently perform_gunzip() can only be called once because the
the internal state (e.g allocate) is not fully re-initialized.

This works fine if you are only booting dom0. But this will break when
booting multiple using the dom0less that uses compressed kernel images.

This can be resolved by re-initializing bytes_out, malloc_ptr,
malloc_count every time perform_gunzip() is called.

Note the latter is only re-initialized for hardening purpose as there is
no guarantee that every malloc() are followed by free() (It should in
theory!).

Take the opportunity to check the return of alloc_heap_pages() to return
an error rather than dereferencing a NULL pointer later on failure.

Reported-by: Charles Chiou <cchiou@ambarella.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/gunzip.c  | 5 +++++
 xen/common/inflate.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
index db4efcd34b77..425d64e904d8 100644
--- a/xen/common/gunzip.c
+++ b/xen/common/gunzip.c
@@ -114,11 +114,16 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
     window = (unsigned char *)output;
 
     free_mem_ptr = (unsigned long)alloc_xenheap_pages(HEAPORDER, 0);
+    if ( !free_mem_ptr )
+        return -ENOMEM;
+
     free_mem_end_ptr = free_mem_ptr + (PAGE_SIZE << HEAPORDER);
+    init_allocator();
 
     inbuf = (unsigned char *)image;
     insize = image_len;
     inptr = 0;
+    bytes_out = 0;
 
     makecrc();
 
diff --git a/xen/common/inflate.c b/xen/common/inflate.c
index f99c985d6135..d8c28a3e9593 100644
--- a/xen/common/inflate.c
+++ b/xen/common/inflate.c
@@ -238,6 +238,12 @@ STATIC const ush mask_bits[] = {
 static unsigned long INITDATA malloc_ptr;
 static int INITDATA malloc_count;
 
+static void init_allocator(void)
+{
+    malloc_ptr = free_mem_ptr;
+    malloc_count = 0;
+}
+
 static void *INIT malloc(int size)
 {
     void *p;
-- 
2.17.1


