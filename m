Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E701FFEBD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:38:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm47E-0000bi-Bc; Thu, 18 Jun 2020 23:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jm47D-0000bd-CF
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:38:39 +0000
X-Inumbo-ID: d5692046-b1bc-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5692046-b1bc-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 23:38:38 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AA011A303E;
 Fri, 19 Jun 2020 01:38:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A79C1A3037;
 Fri, 19 Jun 2020 01:38:36 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id F06oJBad2ZVS; Fri, 19 Jun 2020 01:38:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 24480A303E;
 Fri, 19 Jun 2020 01:38:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id msA5h8fHzbdi; Fri, 19 Jun 2020 01:38:36 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EAC71A3037;
 Fri, 19 Jun 2020 01:38:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D25832059A;
 Fri, 19 Jun 2020 01:38:05 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YwEJBqIWbjmm; Fri, 19 Jun 2020 01:38:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 4EC3121493;
 Fri, 19 Jun 2020 01:38:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TK6es7ReU9sb; Fri, 19 Jun 2020 01:38:00 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2675A21447;
 Fri, 19 Jun 2020 01:38:00 +0200 (CEST)
Date: Fri, 19 Jun 2020 01:38:00 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1060400786.9820894.1592523480084.JavaMail.zimbra@cert.pl>
In-Reply-To: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
Subject: [PATCH v2 1/7] xen/mm: lift 32 item limit from mfn/gfn arrays
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: xen/mm: lift 32 item limit from mfn/gfn arrays
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyLI0cUXZ
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "Kang,
 Luwei" <luwei.kang@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Replace on-stack array allocation with heap allocation
in order to lift the limit of 32 items in mfn/gfn arrays
when calling acquire_resource.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/common/memory.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 714077c1e5..e02606ebe5 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1050,12 +1050,7 @@ static int acquire_resource(
 {
     struct domain *d, *currd = current->domain;
     xen_mem_acquire_resource_t xmar;
-    /*
-     * The mfn_list and gfn_list (below) arrays are ok on stack for the
-     * moment since they are small, but if they need to grow in future
-     * use-cases then per-CPU arrays or heap allocations may be required.
-     */
-    xen_pfn_t mfn_list[32];
+    xen_pfn_t *mfn_list;
     int rc;
 
     if ( copy_from_guest(&xmar, arg, 1) )
@@ -1064,25 +1059,17 @@ static int acquire_resource(
     if ( xmar.pad != 0 )
         return -EINVAL;
 
-    if ( guest_handle_is_null(xmar.frame_list) )
-    {
-        if ( xmar.nr_frames )
-            return -EINVAL;
-
-        xmar.nr_frames = ARRAY_SIZE(mfn_list);
-
-        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
-            return -EFAULT;
-
-        return 0;
-    }
+    mfn_list = xmalloc_array(xen_pfn_t, xmar.nr_frames);
 
-    if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
-        return -E2BIG;
+    if ( ! mfn_list )
+        return -EFAULT;
 
     rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
     if ( rc )
+    {
+        xfree(mfn_list);
         return rc;
+    }
 
     rc = xsm_domain_resource_map(XSM_DM_PRIV, d);
     if ( rc )
@@ -1111,7 +1098,7 @@ static int acquire_resource(
     }
     else
     {
-        xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
+        xen_pfn_t *gfn_list;
         unsigned int i;
 
         /*
@@ -1120,7 +1107,12 @@ static int acquire_resource(
          *        resource pages unless the caller is the hardware domain.
          */
         if ( !is_hardware_domain(currd) )
-            return -EACCES;
+        {
+            rc = -EACCES;
+            goto out;
+        }
+
+        gfn_list = xmalloc_array(xen_pfn_t, xmar.nr_frames);
 
         if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
             rc = -EFAULT;
@@ -1133,9 +1125,12 @@ static int acquire_resource(
             if ( rc && i )
                 rc = -EIO;
         }
+
+        xfree(gfn_list);
     }
 
  out:
+    xfree(mfn_list);
     rcu_unlock_domain(d);
 
     return rc;
-- 
2.20.1

