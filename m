Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB7908FC6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 18:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740801.1147903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9YE-0005nD-MP; Fri, 14 Jun 2024 16:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740801.1147903; Fri, 14 Jun 2024 16:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9YE-0005kT-Ji; Fri, 14 Jun 2024 16:13:18 +0000
Received: by outflank-mailman (input) for mailman id 740801;
 Fri, 14 Jun 2024 16:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldK3=NQ=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sI9YD-0005jz-6e
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 16:13:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 013e1e08-2a69-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 18:13:15 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-46-197-197.retail.telecomitalia.it [79.46.197.197])
 by support.bugseng.com (Postfix) with ESMTPSA id 369AF4EE0757;
 Fri, 14 Jun 2024 18:13:13 +0200 (CEST)
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
X-Inumbo-ID: 013e1e08-2a69-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/mm address violations of MISRA C:2012 Rule 5.3
Date: Fri, 14 Jun 2024 18:12:25 +0200
Message-Id: <80cb7054b82f55f11159faf5f10bfacf44758be0.1718380780.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718380780.git.alessandro.zucchelli@bugseng.com>
References: <cover.1718380780.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 5.3 which states as
following: An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/arch/x86/mm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5471b6b1f2..720d56e103 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4703,7 +4703,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
         struct xen_foreign_memory_map fmap;
         struct domain *d;
-        struct e820entry *map;
+        struct e820entry *e;
 
         if ( copy_from_guest(&fmap, arg, 1) )
             return -EFAULT;
@@ -4722,23 +4722,23 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return rc;
         }
 
-        map = xmalloc_array(e820entry_t, fmap.map.nr_entries);
-        if ( map == NULL )
+        e = xmalloc_array(e820entry_t, fmap.map.nr_entries);
+        if ( e == NULL )
         {
             rcu_unlock_domain(d);
             return -ENOMEM;
         }
 
-        if ( copy_from_guest(map, fmap.map.buffer, fmap.map.nr_entries) )
+        if ( copy_from_guest(e, fmap.map.buffer, fmap.map.nr_entries) )
         {
-            xfree(map);
+            xfree(e);
             rcu_unlock_domain(d);
             return -EFAULT;
         }
 
         spin_lock(&d->arch.e820_lock);
         xfree(d->arch.e820);
-        d->arch.e820 = map;
+        d->arch.e820 = e;
         d->arch.nr_e820 = fmap.map.nr_entries;
         spin_unlock(&d->arch.e820_lock);
 
-- 
2.34.1


