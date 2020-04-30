Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F11C087E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG36-0002pZ-AM; Thu, 30 Apr 2020 20:44:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG34-0002pO-Ev
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:46 +0000
X-Inumbo-ID: 6ad52000-8b23-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ad52000-8b23-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OnO+pVh1ubCsK0ipJDW4CA7CINr9chMuRxxDESUPwi4=; b=439Wd2ro1oGLaPPX0JahId3fzs
 2UZjHr0o8rVmfbRuWbS7GpBZCoEd1PAGXxdfto+n1F2uWiEjq5qn4kL5lvCz0NR9EMQGJQYWPuIQz
 tmGc8oqYeouUa9D4QxWaoDQIiJh0JBe4ZuFGdz7L1nX6UgpjPr1SrSMOZMc5klNivpW4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG2z-0004LB-Q1; Thu, 30 Apr 2020 20:44:41 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG2z-0005wj-GN; Thu, 30 Apr 2020 20:44:41 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 03/16] x86/numa: vmap the pages for memnodemap
Date: Thu, 30 Apr 2020 21:44:12 +0100
Message-Id: <9a007a9965461127e2a3361cc1fde6a2d217ef48.1588278317.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

This avoids the assumption that there is a direct map and boot pages
fall inside the direct map.

Clean up the variables so that mfn actually stores a type-safe mfn.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/numa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index f1066c59c7..51eca3f3fc 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -100,13 +100,13 @@ static int __init populate_memnodemap(const struct node *nodes,
 static int __init allocate_cachealigned_memnodemap(void)
 {
     unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+    mfn_t mfn = alloc_boot_pages(size, 1);
 
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
+    memnodemap = vmap_boot_pages(mfn, size);
+    BUG_ON(!memnodemap);
     size <<= PAGE_SHIFT;
     printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
+           mfn_to_maddr(mfn), mfn_to_maddr(mfn) + size);
     memnodemapsize = size / sizeof(*memnodemap);
 
     return 0;
-- 
2.24.1.AMZN


