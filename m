Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81D82F54A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668084.1040020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp53-0004WB-Gt; Tue, 16 Jan 2024 19:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668084.1040020; Tue, 16 Jan 2024 19:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp53-0004OT-9l; Tue, 16 Jan 2024 19:26:37 +0000
Received: by outflank-mailman (input) for mailman id 668084;
 Tue, 16 Jan 2024 19:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp51-0002iI-BF
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:35 +0000
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com
 [207.171.188.206]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 277952f4-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:33 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:25 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com (Postfix)
 with ESMTPS id 2AEEA4A030; Tue, 16 Jan 2024 19:26:22 +0000 (UTC)
Received: from EX19MTAUEA002.ant.amazon.com [10.0.29.78:58155]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.28.244:2525]
 with esmtp (Farcaster)
 id fbe8e0d8-d681-4c49-bf24-a619c28870a6; Tue, 16 Jan 2024 19:26:21 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:20 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:19 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 277952f4-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433193; x=1736969193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8FsCSW5o3cFuUs+oU0aAarf/rBoTpzODox4faRm0p08=;
  b=J/V+Yegr1PjiC7Loro6hTCvK6l4wKK4yIqNBCNTT7uq6rBaoYIuOhcta
   NXmR23Xt5bw+DKtYQQx3B1OXy9ck1aUnSeY0cczTpWUvqbX7gbQv2tGeH
   eKQO7FrCRCZvOWHgwH0K9/xYnmgl1d7XENvk4T91kpTrvzMRrKfKKg57E
   s=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="697582403"
X-Farcaster-Flow-ID: fbe8e0d8-d681-4c49-bf24-a619c28870a6
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2 (resend) 03/27] xen/vmap: Introduce vmap_size() and use it
Date: Tue, 16 Jan 2024 19:25:47 +0000
Message-ID: <20240116192611.41112-4-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Julien Grall <jgrall@amazon.com>

vunmap() and vfree() currently duplicate the (small) logic to find the
size of an vmap area. In a follow-up patch, we will want to introduce
another one (this time externally).

So introduce a new helper vmap_size() that will return the number of
pages in the area starting at the given address. Take the opportunity
to replace the open-coded version.

Note that vfree() was storing the type of the area in a local variable.
But this seems to have never been used (even when it was introduced).

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v2:
        * Patch added

diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index fc5c70da4d..171271fae3 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -245,14 +245,21 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
     return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
 }
 
-void vunmap(const void *va)
+unsigned int vmap_size(const void *va)
 {
-    unsigned long addr = (unsigned long)va;
     unsigned int pages = vm_size(va, VMAP_DEFAULT);
 
     if ( !pages )
         pages = vm_size(va, VMAP_XEN);
 
+    return pages;
+}
+
+void vunmap(const void *va)
+{
+    unsigned long addr = (unsigned long)va;
+    unsigned pages = vmap_size(va);
+
 #ifndef _PAGE_NONE
     destroy_xen_mappings(addr, addr + PAGE_SIZE * pages);
 #else /* Avoid tearing down intermediate page tables. */
@@ -328,17 +335,11 @@ void vfree(void *va)
     unsigned int i, pages;
     struct page_info *pg;
     PAGE_LIST_HEAD(pg_list);
-    enum vmap_region type = VMAP_DEFAULT;
 
     if ( !va )
         return;
 
-    pages = vm_size(va, type);
-    if ( !pages )
-    {
-        type = VMAP_XEN;
-        pages = vm_size(va, type);
-    }
+    pages = vmap_size(va);
     ASSERT(pages);
 
     for ( i = 0; i < pages; i++ )
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 2b7369e062..24c85de490 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -25,6 +25,9 @@ void vfree(void *va);
 
 void __iomem *ioremap(paddr_t pa, size_t len);
 
+/* Return the number of pages in the mapping starting at address 'va' */
+unsigned int vmap_size(const void *va);
+
 static inline void iounmap(void __iomem *va)
 {
     unsigned long addr = (unsigned long)(void __force *)va;
-- 
2.40.1


