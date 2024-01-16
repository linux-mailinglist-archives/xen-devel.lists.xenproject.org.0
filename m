Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473C82F54E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668086.1040034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp54-0004uf-V7; Tue, 16 Jan 2024 19:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668086.1040034; Tue, 16 Jan 2024 19:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp54-0004qW-NQ; Tue, 16 Jan 2024 19:26:38 +0000
Received: by outflank-mailman (input) for mailman id 668086;
 Tue, 16 Jan 2024 19:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp52-0003Xv-Pk
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:36 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27577966-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:34 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:29 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com (Postfix)
 with ESMTPS id 87DC94AC9A; Tue, 16 Jan 2024 19:26:24 +0000 (UTC)
Received: from EX19MTAUEB002.ant.amazon.com [10.0.29.78:45401]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.89.133:2525]
 with esmtp (Farcaster)
 id d55e2cef-2007-41b2-bf89-6108138fb5eb; Tue, 16 Jan 2024 19:26:24 +0000 (UTC)
Received: from EX19D008UEA003.ant.amazon.com (10.252.134.116) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:21 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA003.ant.amazon.com (10.252.134.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:21 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:20 +0000
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
X-Inumbo-ID: 27577966-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433195; x=1736969195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OfEYXQrUMYXPAWM79GmQhfyI8aqQMCL5v2pGd2UmDoQ=;
  b=mvOpX/TXdj8oavfa8ECbnQDh7OTbLI8rQZ6s+NH4M0rXJM9ftnaqBZhf
   ECzpwxxmbcdwJqGLaLCLO9ZglXT2dBvE09QcpFu6+d+UryDYfZ8E0teEx
   V1CFfYpaKtV/qDTWpfzqVVY9CN3eOY0enQhBvE5BXF8XyaMskQbrwagl5
   g=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="267191231"
X-Farcaster-Flow-ID: d55e2cef-2007-41b2-bf89-6108138fb5eb
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 04/27] acpi: vmap pages in acpi_os_alloc_memory
Date: Tue, 16 Jan 2024 19:25:48 +0000
Message-ID: <20240116192611.41112-5-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

Also, introduce a wrapper around vmap that maps a contiguous range for
boot allocations. Unfortunately, the new helper cannot be a static inline
because the dependencies are a mess. We would need to re-include
asm/page.h (was removed in aa4b9d1ee653 "include: don't use asm/page.h
from common headers") and it doesn't look to be enough anymore
because bits from asm/cpufeature.h is used in the definition of PAGE_NX.

Lastly, with the move to vmap(), it is now easier to find the size
of the mapping. So pass the whole area to init_boot_pages() rather than
just the first page.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v2:
        * Rename vmap_contig_pages() to vmap_contig()
        * Rename nr_pages to nr to be consistent with vmap() parameters
        * Pass the whole region to init_boot_pages()

    Changes since Hongyan's version:
        * Rename vmap_boot_pages() to vmap_contig_pages()
        * Move the new helper in vmap.c to avoid compilation issue
        * Don't use __pa() to translate the virtual address

diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 171271fae3..966a7e763f 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -245,6 +245,11 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
     return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
 }
 
+void *vmap_contig(mfn_t mfn, unsigned int nr)
+{
+    return __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
+}
+
 unsigned int vmap_size(const void *va)
 {
     unsigned int pages = vm_size(va, VMAP_DEFAULT);
diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index 389505f786..ab80d6b2a9 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -221,7 +221,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
 	void *ptr;
 
 	if (system_state == SYS_STATE_early_boot)
-		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
+	{
+		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
+
+		return vmap_contig(mfn, PFN_UP(sz));
+	}
 
 	ptr = xmalloc_bytes(sz);
 	ASSERT(!ptr || is_xmalloc_memory(ptr));
@@ -246,5 +250,11 @@ void __init acpi_os_free_memory(void *ptr)
 	if (is_xmalloc_memory(ptr))
 		xfree(ptr);
 	else if (ptr && system_state == SYS_STATE_early_boot)
-		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
+	{
+		paddr_t addr = mfn_to_maddr(vmap_to_mfn(ptr));
+		unsigned int nr = vmap_size(ptr);
+
+		vunmap(ptr);
+		init_boot_pages(addr, addr + nr * PAGE_SIZE);
+	}
 }
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 24c85de490..0c16baa85f 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -15,6 +15,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
              unsigned int align, unsigned int flags, enum vmap_region type);
 void *vmap(const mfn_t *mfn, unsigned int nr);
+void *vmap_contig(mfn_t mfn, unsigned int nr);
 void vunmap(const void *va);
 
 void *vmalloc(size_t size);
-- 
2.40.1


