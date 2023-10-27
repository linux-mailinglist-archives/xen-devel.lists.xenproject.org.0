Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3EA7D99F8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624385.972957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyp-0001ii-MH; Fri, 27 Oct 2023 13:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624385.972957; Fri, 27 Oct 2023 13:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyp-0001dM-F1; Fri, 27 Oct 2023 13:34:27 +0000
Received: by outflank-mailman (input) for mailman id 624385;
 Fri, 27 Oct 2023 13:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwMym-0000bB-JH
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:34:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a0b81b2-74cd-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 15:34:23 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 2F1DC4EE0C89;
 Fri, 27 Oct 2023 15:34:22 +0200 (CEST)
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
X-Inumbo-ID: 8a0b81b2-74cd-11ee-98d6-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v4 5/8] x86/io_apic: address violation of MISRA C:2012 Rule 10.1
Date: Fri, 27 Oct 2023 15:34:12 +0200
Message-Id: <6de2dac3c48426a11841130d14c9d01f383379ef.1698410970.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698410970.git.nicola.vetrini@bugseng.com>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of IO_APIC_BASE contains a sum of an essentially enum
value (FIX_IO_APIC_BASE_0) that is positive with an index that, in all
instances, is unsigned, therefore the former is cast to unsigned, so that
the operands are of the same essential type.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Eventually __fix_to_virt may become an inline function; in that case,
it should retain unsigned int as its parameter type.

Changes in v3:
- style fix
- Add missing S-o-b
---
 xen/arch/x86/include/asm/io_apic.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index a7e4c9e146de..206bb961c005 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -14,9 +14,10 @@
  * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
  */
 
-#define IO_APIC_BASE(idx)                                               \
-    ((volatile uint32_t *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + (idx))    \
-                           + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
+#define IO_APIC_BASE(idx)                                         \
+    ((volatile uint32_t *)                                        \
+     (__fix_to_virt((unsigned int)FIX_IO_APIC_BASE_0 + (idx)) +   \
+                    (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
 
 #define IO_APIC_ID(idx) (mp_ioapics[idx].mpc_apicid)
 
-- 
2.34.1


