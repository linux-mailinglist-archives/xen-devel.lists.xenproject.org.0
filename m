Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D1F1B7835
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzBi-0005DY-FZ; Fri, 24 Apr 2020 14:20:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRzBg-0005Ci-P8
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:20:16 +0000
X-Inumbo-ID: b48f0996-8636-11ea-94b3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b48f0996-8636-11ea-94b3-12813bfff9fa;
 Fri, 24 Apr 2020 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=beV1du9ph6uMZY01rLgboEpxeFyXrD+9xnH+UQh67O0=; b=1N2DbrFADG5vUIVnUYc+z8LPWW
 +4fwBJid6FLzmIz6h8SixZRB5AJVwC03aLdR+0c4uHNwO3fxAu5I0RKmTmAMphUVW/S3A4ciG323u
 fO09oUoELw3KZXx/2ZYI8/wdi4uzdc45nHtb0r6QiZR5pVR5FgIxDEyG2GngWAhVFAgM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRzBa-0001x9-7D; Fri, 24 Apr 2020 14:20:10 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1P-0001fN-FM; Fri, 24 Apr 2020 14:09:39 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 14/15] x86: switch to use domheap page for page tables
Date: Fri, 24 Apr 2020 15:09:05 +0100
Message-Id: <6cf43a3d1cd3d18c600515b1ead65f41c2996e92.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
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

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/mm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 749b6f23e5..7e212cc3e0 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4923,10 +4923,11 @@ mfn_t alloc_xen_pagetable_new(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
-        void *ptr = alloc_xenheap_page();
 
-        BUG_ON(!hardware_domain && !ptr);
-        return ptr ? virt_to_mfn(ptr) : INVALID_MFN;
+        struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+        BUG_ON(!hardware_domain && !pg);
+        return pg ? page_to_mfn(pg) : INVALID_MFN;
     }
 
     return alloc_boot_pages(1, 1);
@@ -4936,7 +4937,7 @@ mfn_t alloc_xen_pagetable_new(void)
 void free_xen_pagetable_new(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
-        free_xenheap_page(mfn_to_virt(mfn_x(mfn)));
+        free_domheap_page(mfn_to_page(mfn));
 }
 
 static DEFINE_SPINLOCK(map_pgdir_lock);
-- 
2.24.1.AMZN


