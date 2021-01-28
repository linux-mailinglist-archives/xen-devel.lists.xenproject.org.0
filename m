Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D36307A4A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 17:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77205.139694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59oc-0001ai-H4; Thu, 28 Jan 2021 16:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77205.139694; Thu, 28 Jan 2021 16:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59oc-0001aJ-Dh; Thu, 28 Jan 2021 16:06:38 +0000
Received: by outflank-mailman (input) for mailman id 77205;
 Thu, 28 Jan 2021 16:06:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l59oa-0001aE-Bg
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:06:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f212dc13-0ab5-433f-916d-9710b46804f7;
 Thu, 28 Jan 2021 16:06:34 +0000 (UTC)
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
X-Inumbo-ID: f212dc13-0ab5-433f-916d-9710b46804f7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611849994;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m3a3YrcKS+Z4jO6MFo0S22uO7FSUVhVfgv7t5qdElOk=;
  b=UeUHJGvaC2AhwEG6LXVw07lbpSttIIOJdpiXbLmAkeqBZlVsOOr3bkKg
   9P036YUwWFiOIrSxz6rvzYch0LaX5/nZrNrjboYv/IGPmVqHfLIo52Oub
   1K71Vi1Ys56+wk8SFK+PL0bbc6mDJNsD4wf3ES4t9Pqq/KlQu6N0rLm4C
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: El06mIVeMw3LksMNp5N9eH2b4lcygZjxg5121Bh0/1uDyulXTCHXF6pKOyhSPA/OQt9JOWEzUH
 oFbHvWKfdPbGXQmFTqIY7hg0ZZnFBFClzsgPp3FNpvk/UVDKdj6ncPojzGjvTBhJcley4AiSCM
 Qt5dt297mN1X4/13/jU02f+BzT/qpnlpcRYtgQ38bJlFIycEjCcWM6KyLhkxvUzKGqQyEURLBp
 0HCUXEpvKmpx8ii3xuk12rViYlB93H0MzYYTf5fD3VUDfl2HOee7CSblAbQf40+yu/cr2RRyFJ
 SSs=
X-SBRS: 5.1
X-MesageID: 36279467
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36279467"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
Date: Thu, 28 Jan 2021 16:06:16 +0000
Message-ID: <20210128160616.17608-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The ABI is unfortunate, and frame being 64 bits leads to all kinds of problems
performing correct overflow checks.

Furthermore, the mixed use of unsigned int and unsigned long in the call tree
is buggy on arm32 where the two are the same size, and certain out-of-range
combinations will truncated and be permitted.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Paul Durrant <paul@xen.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Posted ahead of my full v8 series, in the hope that it catches some people
before the end of the day.
---
 xen/arch/x86/mm.c        |  2 +-
 xen/common/memory.c      | 15 ++++++++++++++-
 xen/include/asm-x86/mm.h |  2 +-
 xen/include/xen/mm.h     |  2 +-
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 63e9fae919..2ce00a8ece 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4588,7 +4588,7 @@ static int handle_iomem_range(unsigned long s, unsigned long e, void *p)
 }
 
 int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
+                          unsigned int id, unsigned int frame,
                           unsigned int nr_frames, xen_pfn_t mfn_list[])
 {
     int rc;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index ccb4d49fc6..33ab36eb72 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1054,7 +1054,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
 }
 
 static int acquire_grant_table(struct domain *d, unsigned int id,
-                               unsigned long frame,
+                               unsigned int frame,
                                unsigned int nr_frames,
                                xen_pfn_t mfn_list[])
 {
@@ -1134,6 +1134,19 @@ static int acquire_resource(
     if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
         return -E2BIG;
 
+    /*
+     * The ABI is rather unfortunate.  nr_frames (and therefore the total size
+     * of the resource) is 32bit, while frame (the offset within the resource
+     * we'd like to start at) is 64bit.
+     *
+     * Reject values oustide the of the range of nr_frames, as well as
+     * combinations of frame and nr_frame which overflow, to simplify the rest
+     * of the logic.
+     */
+    if ( (xmar.frame >> 32) ||
+         ((xmar.frame + xmar.nr_frames) >> 32) )
+        return -EINVAL;
+
     rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
     if ( rc )
         return rc;
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 1fdb4eb835..3fe47dcd8d 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -641,7 +641,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
 }
 
 int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
+                          unsigned int id, unsigned int frame,
                           unsigned int nr_frames, xen_pfn_t mfn_list[]);
 
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 636a1254ae..66a4d10695 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -614,7 +614,7 @@ static inline void put_page_alloc_ref(struct page_info *page)
 
 #ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
 static inline int arch_acquire_resource(
-    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
+    struct domain *d, unsigned int type, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
 {
     return -EOPNOTSUPP;
-- 
2.11.0


