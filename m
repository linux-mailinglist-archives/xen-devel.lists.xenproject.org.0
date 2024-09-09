Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5946971B2E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794513.1203473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneZD-0008KA-9A; Mon, 09 Sep 2024 13:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794513.1203473; Mon, 09 Sep 2024 13:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneZD-0008H2-6O; Mon, 09 Sep 2024 13:36:31 +0000
Received: by outflank-mailman (input) for mailman id 794513;
 Mon, 09 Sep 2024 13:36:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vfP8=QH=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sneZB-0008Fa-4K
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:36:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 830f0807-6eb0-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 15:36:26 +0200 (CEST)
Received: from delta.home-life.hub (unknown [176.206.49.208])
 by support.bugseng.com (Postfix) with ESMTPSA id 46F654EE0776;
 Mon,  9 Sep 2024 15:36:25 +0200 (CEST)
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
X-Inumbo-ID: 830f0807-6eb0-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725888985; bh=dPZAAGZbBtIpnQAvYJuhw1T8HhmIhQKlthbwTS8NlPQ=;
	h=From:To:Cc:Subject:Date:From;
	b=H7CzGSRH9dAAbi9LqOi/4ja+Z/UMj8p0xKlyciJBwuh5qGym8VJIMAGY7Ty9Ou3MO
	 MrSsuYLeiZq0WPXizs0Idxgl7awi7mjhP58oDUmdAYo+5X+1fe1/Nh2N+AQu6UhVxU
	 +ZMbBxCKz4t/mjXbEcNxQjn4qOGtigj1Isx3xy+oZDskXvKxUW1Rb+Xybu69e+RdA6
	 BiZiKv//soO/JQZizU1vxUqQvHqDYN+R439qAe+Vc808lGImqoK4eLRSghg17CSWnT
	 QWFlCBlxfSlwstmtkTIH72+fOv1kJ2WlG0fIO9AtoKiSSMYIMXrNrMvtLrgbu4njxV
	 qbBUugHwIK9LA==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2] x86/mm address violations of MISRA C:2012 Rule 5.3
Date: Mon,  9 Sep 2024 15:36:13 +0200
Message-Id: <201625791b87a4ab20e6fb38642ed64f88ce8b2d.1725888742.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 5.3 which states as
following: An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope.

In /x86/mm.c the object struct e820entry *e820 hides an identifier
with the same name declared in x86/include/asm/e820.h.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
Changes in v2:
- rebased against current staging tree

 xen/arch/x86/mm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c735aaf0e8..d537a799bc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4708,7 +4708,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
         struct xen_foreign_memory_map fmap;
         struct domain *d;
-        struct e820entry *e820;
+        struct e820entry *e;
 
         if ( copy_from_guest(&fmap, arg, 1) )
             return -EFAULT;
@@ -4727,23 +4727,23 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return rc;
         }
 
-        e820 = xmalloc_array(e820entry_t, fmap.map.nr_entries);
-        if ( e820 == NULL )
+        e = xmalloc_array(e820entry_t, fmap.map.nr_entries);
+        if ( e == NULL )
         {
             rcu_unlock_domain(d);
             return -ENOMEM;
         }
 
-        if ( copy_from_guest(e820, fmap.map.buffer, fmap.map.nr_entries) )
+        if ( copy_from_guest(e, fmap.map.buffer, fmap.map.nr_entries) )
         {
-            xfree(e820);
+            xfree(e);
             rcu_unlock_domain(d);
             return -EFAULT;
         }
 
         spin_lock(&d->arch.e820_lock);
         xfree(d->arch.e820);
-        d->arch.e820 = e820;
+        d->arch.e820 = e;
         d->arch.nr_e820 = fmap.map.nr_entries;
         spin_unlock(&d->arch.e820_lock);
 
-- 
2.34.1


