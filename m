Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9871ADA76
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNfe-0000M6-Vi; Fri, 17 Apr 2020 09:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lM+k=6B=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jPNfd-0000Lc-0p
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:52:25 +0000
X-Inumbo-ID: 2030b313-8091-11ea-8c9b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2030b313-8091-11ea-8c9b-12813bfff9fa;
 Fri, 17 Apr 2020 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fgPHa6/lewyPUGLpvLuUr7Qnl8FXYus9SeBUggwCmRY=; b=fsoDzbLe09VaPA4VGTGG/T2hUA
 ng16FFZwNw0bU5Df2LGAgfBie/sIqtw/GHzip1fzwercdIajGh2lUi7UvIwZvPcWUSzbZpRQ+4sr2
 JC12EYZYIOBOWUlpfl1yhEqZxMD+E54kgExpa6CVvZy3QCRiEiQ/dvIiOVgsZM4x9HFo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfX-0002fd-9o; Fri, 17 Apr 2020 09:52:19 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfW-000304-TS; Fri, 17 Apr 2020 09:52:19 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/6] x86_64/mm: map and unmap page tables in
 cleanup_frame_table
Date: Fri, 17 Apr 2020 10:52:03 +0100
Message-Id: <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587116799.git.hongyxia@amazon.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587116799.git.hongyxia@amazon.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

From: Wei Liu <wei.liu2@citrix.com>

Also fix a weird indentation.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/x86_64/mm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index e85ef449f3..18210405f4 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -737,8 +737,8 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
 
     while (sva < eva)
     {
-        l3e = l4e_to_l3e(idle_pg_table[l4_table_offset(sva)])[
-          l3_table_offset(sva)];
+        l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(sva)],
+                           l3_table_offset(sva));
         if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) ||
              (l3e_get_flags(l3e) & _PAGE_PSE) )
         {
@@ -747,7 +747,7 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
             continue;
         }
 
-        l2e = l3e_to_l2e(l3e)[l2_table_offset(sva)];
+        l2e = l2e_from_l3e(l3e, l2_table_offset(sva));
         ASSERT(l2e_get_flags(l2e) & _PAGE_PRESENT);
 
         if ( (l2e_get_flags(l2e) & (_PAGE_PRESENT | _PAGE_PSE)) ==
@@ -763,10 +763,10 @@ static void cleanup_frame_table(struct mem_hotadd_info *info)
             continue;
         }
 
-        ASSERT(l1e_get_flags(l2e_to_l1e(l2e)[l1_table_offset(sva)]) &
-                _PAGE_PRESENT);
-         sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) +
-                    (1UL << PAGE_SHIFT);
+        ASSERT(l1e_get_flags(l1e_from_l2e(l2e, l1_table_offset(sva))) &
+               _PAGE_PRESENT);
+
+        sva = (sva & ~((1UL << PAGE_SHIFT) - 1)) + (1UL << PAGE_SHIFT);
     }
 
     /* Brute-Force flush all TLB */
-- 
2.24.1.AMZN


