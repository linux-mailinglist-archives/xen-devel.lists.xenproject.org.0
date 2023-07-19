Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87175925C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 12:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565735.884176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM46b-0000uY-FS; Wed, 19 Jul 2023 10:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565735.884176; Wed, 19 Jul 2023 10:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM46b-0000rq-Cu; Wed, 19 Jul 2023 10:08:25 +0000
Received: by outflank-mailman (input) for mailman id 565735;
 Wed, 19 Jul 2023 10:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM46a-0000rk-1a
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 10:08:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3004a177-261c-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 12:08:21 +0200 (CEST)
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
X-Inumbo-ID: 3004a177-261c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689761301;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XIOOnQ4fgim3D5Pq1B3STxqg0s1BCaA46fECZIyfIC0=;
  b=QsJvio9WvXXj/Y/ZTBgp/49O5vC8Q/hUdEsWqmeSuY2e0CAy8Q4z2r0c
   RJoW2qAHdiv/udFwvZlMSzg/V8JhxcGbwszgtShE/ABkMZP4eE/cYgHCz
   0LMrXiBSkeMGvz+VRt0zNQShvbeBIk88WEuFCYJYjnGSNk4M8PW1gegbY
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119308311
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GTeF8aI/jqJWMNk3FE+R0ZUlxSXFcZb7ZxGr2PjKsXjdYENS1TdWz
 zZMWGyGOfvcZTHxKYxyOoy29koOsJbczdQxSQJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5xAGd/2
 uYFEAoVazHfnuWZz5GVdLVV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJQOxhbD/
 zuuE2LRHUFFPs3GxSG/7XeB2sv1lnzARYkIPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9K24EVAAeUDM/+9zC/Jg0oR3sYOg/Kfvg5jHqIg0c0
 wxmvQBn2eVC0pNRh/3mlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM9PuU5lykfe/T4mNuhXogjxmOMQZmOivpXwGWKJt9zq1zBhEfV8XZ
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2ddMfA5ScSBhWMmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ/90iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:2VmhkK5nm98fSpb15gPXwOPXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwQZVoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eA3OBjKadH/DBbytHOuQ4D9QYUcei1UdAb0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AMSZZDmjZ08S5QZvIvc5ospShyDJudHzb/VjKPne?=
 =?us-ascii?q?CEWNIFKSSZlCz1p04qp87?=
X-Talos-MUID: 9a23:T9+R3As1oB58xuxsiM2nm2E9PtYx77+UF0UgzbE8sJa/KCdqEmLI
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="119308311"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mem: Make mem_hotadd_check() more legible
Date: Wed, 19 Jul 2023 11:08:08 +0100
Message-ID: <20230719100808.4046779-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Introduce a ROUND() macro to mirror ROUNDUP().  Use both to remove all the
opencoded rounding in mem_hotadd_check().  Fix other minor style issues.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The compiled binary is identical.
---
 xen/arch/x86/x86_64/mm.c | 31 +++++++++++++------------------
 xen/include/xen/macros.h |  1 +
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 60db439af3ec..38f978cab269 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1159,10 +1159,10 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
 {
     unsigned long s, e, length, sidx, eidx;
 
-    if ( (spfn >= epfn) )
+    if ( spfn >= epfn )
         return 0;
 
-    if (pfn_to_pdx(epfn) > FRAMETABLE_NR)
+    if ( pfn_to_pdx(epfn) > FRAMETABLE_NR )
         return 0;
 
     if ( (spfn | epfn) & ((1UL << PAGETABLE_ORDER) - 1) )
@@ -1172,10 +1172,9 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
         return 0;
 
     /* Make sure the new range is not present now */
-    sidx = ((pfn_to_pdx(spfn) + PDX_GROUP_COUNT - 1)  & ~(PDX_GROUP_COUNT - 1))
-            / PDX_GROUP_COUNT;
-    eidx = (pfn_to_pdx(epfn - 1) & ~(PDX_GROUP_COUNT - 1)) / PDX_GROUP_COUNT;
-    if (sidx >= eidx)
+    sidx = ROUNDUP(pfn_to_pdx(spfn),     PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
+    eidx = ROUND  (pfn_to_pdx(epfn - 1), PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
+    if ( sidx >= eidx )
         return 0;
 
     s = find_next_zero_bit(pdx_group_valid, eidx, sidx);
@@ -1186,28 +1185,24 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
         return 0;
 
     /* Caculate at most required m2p/compat m2p/frametable pages */
-    s = (spfn & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1));
-    e = (epfn + (1UL << (L2_PAGETABLE_SHIFT - 3)) - 1) &
-            ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1);
+    s = ROUND  (spfn, 1UL << (L2_PAGETABLE_SHIFT - 3));
+    e = ROUNDUP(epfn, 1UL << (L2_PAGETABLE_SHIFT - 3));
 
     length = (e - s) * sizeof(unsigned long);
 
-    s = (spfn & ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1));
-    e = (epfn + (1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) &
-            ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1);
-
-    e = min_t(unsigned long, e,
+    s =     ROUND  (spfn, 1ULL << (L2_PAGETABLE_SHIFT - 2));
+    e = min(ROUNDUP(epfn, 1ULL << (L2_PAGETABLE_SHIFT - 2)),
             (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2);
 
     if ( e > s )
-        length += (e -s) * sizeof(unsigned int);
+        length += (e - s) * sizeof(unsigned int);
 
-    s = pfn_to_pdx(spfn) & ~(PDX_GROUP_COUNT - 1);
-    e = ( pfn_to_pdx(epfn) + (PDX_GROUP_COUNT - 1) ) & ~(PDX_GROUP_COUNT - 1);
+    s = ROUND  (pfn_to_pdx(spfn), PDX_GROUP_COUNT);
+    e = ROUNDUP(pfn_to_pdx(epfn), PDX_GROUP_COUNT);
 
     length += (e - s) * sizeof(struct page_info);
 
-    if ((length >> PAGE_SHIFT) > (epfn - spfn))
+    if ( (length >> PAGE_SHIFT) > (epfn - spfn) )
         return 0;
 
     return 1;
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index 7b92d345044d..ceeffcaa95ff 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -1,6 +1,7 @@
 #ifndef __MACROS_H__
 #define __MACROS_H__
 
+#define ROUND(x, a)   ((x) & ~((a) - 1))
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 
 #define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))

base-commit: b1c16800e52743d9afd9af62c810f03af16dd942
-- 
2.30.2


