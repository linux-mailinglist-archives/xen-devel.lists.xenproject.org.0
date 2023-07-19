Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C2759515
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 14:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565819.884349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6Ey-0001lr-MP; Wed, 19 Jul 2023 12:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565819.884349; Wed, 19 Jul 2023 12:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6Ey-0001je-Jf; Wed, 19 Jul 2023 12:25:12 +0000
Received: by outflank-mailman (input) for mailman id 565819;
 Wed, 19 Jul 2023 12:25:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM6Ew-0001jY-MU
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 12:25:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bc8aab4-262f-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 14:25:09 +0200 (CEST)
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
X-Inumbo-ID: 4bc8aab4-262f-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689769509;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mHyvFWxCWGdqxsZY/Dj4dtue/ppFq+2gHCIJLk+UjEs=;
  b=LxsbvjjE3TSa+AfAQfZBuPEkl0lOEnwSGv/yKO4OQrYhGNLR0/u8jevU
   Yro372Jjx8ulvJj6b3jWyBv918+rpP18rJcebzbdNllPU1n4luYPbuisl
   ROOCUniVRlgN8eIbOAb0ibik0WT+Dj1448dMeJSmcvvEdCkvr8OJGxZqk
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116603790
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ZeW06aIMRWD6cX+iFE+R0ZUlxSXFcZb7ZxGr2PjKsXjdYENS1TUGy
 GEbDGrUOqyOZWr0e411YYWw9R4EuJTWxtZnT1dlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c58C0BQ7
 tM5EwwiUUqKvNu6/OqFRdVF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJsLxh3H9
 zquE2LRBTIUO5ug4zG8on+j1unhtBrYR4U8PejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9JmUjezQrbDA5zOa5qboKgi6XcNlfOfvg5jHqIg0c0
 wxmvQBn2eVC0pNRh/3mlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM9PuU5lykfe/T4mNuhXogjxmOMQZmOivpXwGWKJt9zq1zBhEfV8XZ
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dJKfAFSfSFrXMmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:JytZlqu6XqjYNrjHh6XnONUF7skCNoMji2hC6mlwRA09TyXBrb
 HUoBwavSWE6wr5K0tQ4+xoWZPwP080kKQf3WB/B8bEYOCLggqVxcRZnPPfKl7balzDH4xmpM
 FdmsFFYbWcYTcVsS+52njALz9K+qjkzEncv5a7854bd3AOV0gP1WdE4wCgeHFedU1jKL58ML
 e53MBOoD2tYh0sH7aGL0hAe8Xm4/nnsKjtaRkACwVixxKJiVqTmcvHOind+jo7Fxdj5Y0p+W
 /Dnxe8xojLiYDJ9jbsk0v/y9Bztf/awNNFA8CWzugTJTP2jg60ZIJnMofyzAwdkaWKxXJvtP
 TpmR0pOMN+8Dfudny4uh/kwAuI6kdb15ao8y7kvZKqm72EeNslMbs3uWt2SGqn13Yd
X-Talos-CUID: =?us-ascii?q?9a23=3AnobuOWl2SY1OIolqdSdj52B8CwTXOXbX7WnLDG6?=
 =?us-ascii?q?DNUlWErSucFOsoJ1rr+M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUGTH2A4oro3D0YOsFjRZj3v8xoxvwKqhT38nmqx?=
 =?us-ascii?q?WtsbUMwJZAhSCixqeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116603790"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Allow hvm_copy_to_guest_*() to come from const sources
Date: Wed, 19 Jul 2023 13:24:57 +0100
Message-ID: <20230719122457.4067001-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The work to fix MISRA rule 7.4 (using mutable pointers to string literals)
identifies that string literals do indeed get passed into
hvm_copy_to_guest_linear() by way of the PVH dom0 command line.

This higlights that the copy_to_* helpers really ought to take a const
source.  Update the function types to match, and cast away constness in the
wrappers around __hvm_copy() where HVMCOPY_to_guest is used.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/hvm.c                 | 11 ++++++-----
 xen/arch/x86/include/asm/hvm/support.h |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 57363c2ae124..32dcd34f678c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3401,9 +3401,10 @@ static enum hvm_translation_result __hvm_copy(
 }
 
 enum hvm_translation_result hvm_copy_to_guest_phys(
-    paddr_t paddr, void *buf, unsigned int size, struct vcpu *v)
+    paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
 {
-    return __hvm_copy(buf, paddr, size, v,
+    return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
+                      paddr, size, v,
                       HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);
 }
 
@@ -3415,11 +3416,11 @@ enum hvm_translation_result hvm_copy_from_guest_phys(
 }
 
 enum hvm_translation_result hvm_copy_to_guest_linear(
-    unsigned long addr, void *buf, unsigned int size, uint32_t pfec,
+    unsigned long addr, const void *buf, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo)
 {
-    return __hvm_copy(buf, addr, size, current,
-                      HVMCOPY_to_guest | HVMCOPY_linear,
+    return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
+                      addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
                       PFEC_page_present | PFEC_write_access | pfec, pfinfo);
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 8d4707e58c9c..142e5985642d 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -59,7 +59,7 @@ enum hvm_translation_result {
  * address range does not map entirely onto ordinary machine memory.
  */
 enum hvm_translation_result hvm_copy_to_guest_phys(
-    paddr_t paddr, void *buf, unsigned int size, struct vcpu *v);
+    paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v);
 enum hvm_translation_result hvm_copy_from_guest_phys(
     void *buf, paddr_t paddr, unsigned int size);
 
@@ -85,7 +85,7 @@ typedef struct pagefault_info
 } pagefault_info_t;
 
 enum hvm_translation_result hvm_copy_to_guest_linear(
-    unsigned long addr, void *buf, unsigned int size, uint32_t pfec,
+    unsigned long addr, const void *buf, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo);
 enum hvm_translation_result hvm_copy_from_guest_linear(
     void *buf, unsigned long addr, unsigned int size, uint32_t pfec,
-- 
2.30.2


