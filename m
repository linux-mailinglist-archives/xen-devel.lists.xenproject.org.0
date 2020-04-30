Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119691C087D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG31-0002oe-GR; Thu, 30 Apr 2020 20:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG2z-0002oZ-Gl
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:41 +0000
X-Inumbo-ID: 6a0b6dc8-8b23-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a0b6dc8-8b23-11ea-b9cf-bc764e2007e4;
 Thu, 30 Apr 2020 20:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mny4fPGI0W4kUckCGEUBvQNC9MU0BAlbEexMC4JDbrU=; b=qCRIOJB3HVKUWxuaCufWT128qC
 L1aqst12J/+1zHfzX8myHDSFQDCOCuKkgc5zDiDbEd8QTjWaXYlS5tiRH9JMfcrfWdTmJ5NyJ9vG+
 d092LdAOlkOX5j3wDWzaG3EQ+zglhFK812VPu0KH2cHEk1rpOLNL8l1+emPs5w4O0Uw8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG2y-0004L2-CB; Thu, 30 Apr 2020 20:44:40 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG2y-0005wj-2Q; Thu, 30 Apr 2020 20:44:40 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 02/16] acpi: vmap pages in acpi_os_alloc_memory
Date: Thu, 30 Apr 2020 21:44:11 +0100
Message-Id: <a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

Also, introduce a wrapper around vmap that maps a contiguous range for
boot allocations.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/drivers/acpi/osl.c | 9 ++++++++-
 xen/include/xen/vmap.h | 5 +++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index 4c8bb7839e..d0762dad4e 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -219,7 +219,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
 	void *ptr;
 
 	if (system_state == SYS_STATE_early_boot)
-		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
+	{
+		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
+
+		return vmap_boot_pages(mfn, PFN_UP(sz));
+	}
 
 	ptr = xmalloc_bytes(sz);
 	ASSERT(!ptr || is_xmalloc_memory(ptr));
@@ -244,5 +248,8 @@ void __init acpi_os_free_memory(void *ptr)
 	if (is_xmalloc_memory(ptr))
 		xfree(ptr);
 	else if (ptr && system_state == SYS_STATE_early_boot)
+	{
+		vunmap(ptr);
 		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
+	}
 }
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 369560e620..c70801e195 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -23,6 +23,11 @@ void *vmalloc_xen(size_t size);
 void *vzalloc(size_t size);
 void vfree(void *va);
 
+static inline void *vmap_boot_pages(mfn_t mfn, unsigned int nr_pages)
+{
+    return __vmap(&mfn, nr_pages, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
+}
+
 void __iomem *ioremap(paddr_t, size_t);
 
 static inline void iounmap(void __iomem *va)
-- 
2.24.1.AMZN


