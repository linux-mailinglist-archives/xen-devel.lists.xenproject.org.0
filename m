Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A339B25A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 08:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136692.253368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uc-0003V2-Nl; Fri, 04 Jun 2021 06:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136692.253368; Fri, 04 Jun 2021 06:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uc-0003Ov-GW; Fri, 04 Jun 2021 06:02:30 +0000
Received: by outflank-mailman (input) for mailman id 136692;
 Fri, 04 Jun 2021 06:02:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x6aI=K6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lp2ua-00029d-Kt
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 06:02:28 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfd6595e-b914-4951-a782-26a003d51af0;
 Fri, 04 Jun 2021 06:02:18 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 939601FD47;
 Fri,  4 Jun 2021 06:02:17 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 63E28118DD;
 Fri,  4 Jun 2021 06:02:17 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ONwuF+nBuWCyGwAALh3uQQ
 (envelope-from <jgross@suse.com>); Fri, 04 Jun 2021 06:02:17 +0000
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
X-Inumbo-ID: cfd6595e-b914-4951-a782-26a003d51af0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4SWUo43YolLMrmlsJ+DCRZBL/Dp0uw3nhnsJOscj6IQ=;
	b=oWE0POBUbFMpkvHQHjCvq/oGFyH14joaNMlK3UIR6DoVacZWV0YsPMY9oqFDQkoxt31ggC
	BxxIszmrgJuMQNvTL9IPn6SYtbCP48RVWEOaf/cVoFDkp7G8EYzLM3XL+THpYwJPT2iaTX
	RG+sLduwpctq78ul69tXxKcg91xaMt8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4SWUo43YolLMrmlsJ+DCRZBL/Dp0uw3nhnsJOscj6IQ=;
	b=oWE0POBUbFMpkvHQHjCvq/oGFyH14joaNMlK3UIR6DoVacZWV0YsPMY9oqFDQkoxt31ggC
	BxxIszmrgJuMQNvTL9IPn6SYtbCP48RVWEOaf/cVoFDkp7G8EYzLM3XL+THpYwJPT2iaTX
	RG+sLduwpctq78ul69tXxKcg91xaMt8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/6] tools/libs: move xc_core* from libxenctrl to libxenguest
Date: Fri,  4 Jun 2021 08:02:13 +0200
Message-Id: <20210604060214.14924-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604060214.14924-1-jgross@suse.com>
References: <20210604060214.14924-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functionality in xc_core* should be part of libxenguest instead
of libxenctrl. Users are already either in libxenguest, or in xl.
There is one single exception: xc_core_arch_auto_translated_physmap()
is being used by xc_domain_memory_mapping(), which is used by qemu.
So leave the xc_core_arch_auto_translated_physmap() functionality in
libxenctrl.

This will make it easier to merge common functionality of xc_core*
and xg_sr_save*.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 tools/libs/ctrl/Makefile                             |  3 ---
 tools/libs/ctrl/xc_domain.c                          |  2 --
 tools/libs/ctrl/xc_private.h                         | 12 ++++++++++++
 tools/libs/guest/Makefile                            |  3 +++
 tools/libs/{ctrl/xc_core.c => guest/xg_core.c}       |  2 +-
 tools/libs/{ctrl/xc_core.h => guest/xg_core.h}       |  5 ++---
 .../libs/{ctrl/xc_core_arm.c => guest/xg_core_arm.c} |  8 +-------
 .../libs/{ctrl/xc_core_arm.h => guest/xg_core_arm.h} |  0
 .../libs/{ctrl/xc_core_x86.c => guest/xg_core_x86.c} |  8 +-------
 .../libs/{ctrl/xc_core_x86.h => guest/xg_core_x86.h} |  0
 tools/libs/guest/xg_dom_boot.c                       |  2 +-
 tools/libs/guest/xg_domain.c                         |  2 +-
 tools/libs/guest/xg_offline_page.c                   |  2 +-
 tools/libs/guest/xg_resume.c                         |  2 +-
 14 files changed, 24 insertions(+), 27 deletions(-)
 rename tools/libs/{ctrl/xc_core.c => guest/xg_core.c} (99%)
 rename tools/libs/{ctrl/xc_core.h => guest/xg_core.h} (97%)
 rename tools/libs/{ctrl/xc_core_arm.c => guest/xg_core_arm.c} (96%)
 rename tools/libs/{ctrl/xc_core_arm.h => guest/xg_core_arm.h} (100%)
 rename tools/libs/{ctrl/xc_core_x86.c => guest/xg_core_x86.c} (99%)
 rename tools/libs/{ctrl/xc_core_x86.h => guest/xg_core_x86.h} (100%)

diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index fbeb3a3537..519246b0d6 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -2,9 +2,6 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 SRCS-y       += xc_altp2m.c
-SRCS-y       += xc_core.c
-SRCS-$(CONFIG_X86) += xc_core_x86.c
-SRCS-$(CONFIG_ARM) += xc_core_arm.c
 SRCS-y       += xc_cpupool.c
 SRCS-y       += xc_domain.c
 SRCS-y       += xc_evtchn.c
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e7cea4a17d..7d118848f1 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -19,8 +19,6 @@
  * Copyright (c) 2003, K A Fraser.
  */
 
-#include "xc_private.h"
-#include "xc_core.h"
 #include "xc_private.h"
 #include <xen/memory.h>
 #include <xen/hvm/hvm_op.h>
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 8ebc0b59da..dff0f0289b 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -467,6 +467,18 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t domain_id, int param,
 
 int do_dm_op(xc_interface *xch, uint32_t domid, unsigned int nr_bufs, ...);
 
+#if defined (__i386__) || defined (__x86_64__)
+static inline int xc_core_arch_auto_translated_physmap(const xc_dominfo_t *info)
+{
+    return info->hvm;
+}
+#elif defined (__arm__) || defined(__aarch64__)
+static inline int xc_core_arch_auto_translated_physmap(const xc_dominfo_t *info)
+{
+    return 1;
+}
+#endif
+
 #endif /* __XC_PRIVATE_H__ */
 
 /*
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 2a2323ff09..2ce92d247e 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -24,6 +24,9 @@ SRCS-y += xg_offline_page.c
 else
 SRCS-y += xg_nomigrate.c
 endif
+SRCS-y       += xg_core.c
+SRCS-$(CONFIG_X86) += xg_core_x86.c
+SRCS-$(CONFIG_ARM) += xg_core_arm.c
 
 CFLAGS += -I$(XEN_libxenctrl)
 
diff --git a/tools/libs/ctrl/xc_core.c b/tools/libs/guest/xg_core.c
similarity index 99%
rename from tools/libs/ctrl/xc_core.c
rename to tools/libs/guest/xg_core.c
index 9576bec5a3..c52f1161c1 100644
--- a/tools/libs/ctrl/xc_core.c
+++ b/tools/libs/guest/xg_core.c
@@ -61,7 +61,7 @@
  */
 
 #include "xc_private.h"
-#include "xc_core.h"
+#include "xg_core.h"
 #include <stdlib.h>
 #include <unistd.h>
 
diff --git a/tools/libs/ctrl/xc_core.h b/tools/libs/guest/xg_core.h
similarity index 97%
rename from tools/libs/ctrl/xc_core.h
rename to tools/libs/guest/xg_core.h
index 8ea1f93a10..f07584aaa6 100644
--- a/tools/libs/ctrl/xc_core.h
+++ b/tools/libs/guest/xg_core.h
@@ -131,7 +131,6 @@ struct xc_core_memory_map {
     uint64_t    size;
 };
 typedef struct xc_core_memory_map xc_core_memory_map_t;
-int xc_core_arch_auto_translated_physmap(const xc_dominfo_t *info);
 struct xc_core_arch_context;
 int xc_core_arch_memory_map_get(xc_interface *xch,
                                 struct xc_core_arch_context *arch_ctxt,
@@ -152,9 +151,9 @@ int xc_core_arch_get_scratch_gpfn(xc_interface *xch, uint32_t domid,
 
 
 #if defined (__i386__) || defined (__x86_64__)
-# include "xc_core_x86.h"
+# include "xg_core_x86.h"
 #elif defined (__arm__) || defined(__aarch64__)
-# include "xc_core_arm.h"
+# include "xg_core_arm.h"
 #else
 # error "unsupported architecture"
 #endif
diff --git a/tools/libs/ctrl/xc_core_arm.c b/tools/libs/guest/xg_core_arm.c
similarity index 96%
rename from tools/libs/ctrl/xc_core_arm.c
rename to tools/libs/guest/xg_core_arm.c
index 93765a565f..aaabd07558 100644
--- a/tools/libs/ctrl/xc_core_arm.c
+++ b/tools/libs/guest/xg_core_arm.c
@@ -17,7 +17,7 @@
  */
 
 #include "xc_private.h"
-#include "xc_core.h"
+#include "xg_core.h"
 
 #include <xen-tools/libs.h>
 
@@ -31,12 +31,6 @@ xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
     return 0;
 }
 
-int
-xc_core_arch_auto_translated_physmap(const xc_dominfo_t *info)
-{
-    return 1;
-}
-
 int
 xc_core_arch_memory_map_get(xc_interface *xch, struct xc_core_arch_context *unused,
                             xc_dominfo_t *info, shared_info_any_t *live_shinfo,
diff --git a/tools/libs/ctrl/xc_core_arm.h b/tools/libs/guest/xg_core_arm.h
similarity index 100%
rename from tools/libs/ctrl/xc_core_arm.h
rename to tools/libs/guest/xg_core_arm.h
diff --git a/tools/libs/ctrl/xc_core_x86.c b/tools/libs/guest/xg_core_x86.c
similarity index 99%
rename from tools/libs/ctrl/xc_core_x86.c
rename to tools/libs/guest/xg_core_x86.c
index c8f71d4b75..09f5d696ce 100644
--- a/tools/libs/ctrl/xc_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -19,7 +19,7 @@
 
 #include <inttypes.h>
 #include "xc_private.h"
-#include "xc_core.h"
+#include "xg_core.h"
 #include <xen/hvm/e820.h>
 
 int
@@ -33,12 +33,6 @@ xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
     return 1;
 }
 
-int
-xc_core_arch_auto_translated_physmap(const xc_dominfo_t *info)
-{
-    return info->hvm;
-}
-
 int
 xc_core_arch_memory_map_get(xc_interface *xch, struct xc_core_arch_context *unused,
                             xc_dominfo_t *info, shared_info_any_t *live_shinfo,
diff --git a/tools/libs/ctrl/xc_core_x86.h b/tools/libs/guest/xg_core_x86.h
similarity index 100%
rename from tools/libs/ctrl/xc_core_x86.h
rename to tools/libs/guest/xg_core_x86.h
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 2a002e7349..dac96b17a5 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -31,7 +31,7 @@
 #include <zlib.h>
 
 #include "xg_private.h"
-#include "xc_core.h"
+#include "xg_core.h"
 #include <xen/hvm/params.h>
 #include <xen/grant_table.h>
 
diff --git a/tools/libs/guest/xg_domain.c b/tools/libs/guest/xg_domain.c
index dd7db2cbd8..155e337427 100644
--- a/tools/libs/guest/xg_domain.c
+++ b/tools/libs/guest/xg_domain.c
@@ -20,7 +20,7 @@
  */
 
 #include "xg_private.h"
-#include "xc_core.h"
+#include "xg_core.h"
 
 int xc_unmap_domain_meminfo(xc_interface *xch, struct xc_domain_meminfo *minfo)
 {
diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index d4722f0e8c..cfe0e2d537 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -25,7 +25,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <sys/time.h>
-#include <xc_core.h>
+#include <xg_core.h>
 
 #include "xc_private.h"
 #include "xg_private.h"
diff --git a/tools/libs/guest/xg_resume.c b/tools/libs/guest/xg_resume.c
index 3bdefb2eef..d201c1488d 100644
--- a/tools/libs/guest/xg_resume.c
+++ b/tools/libs/guest/xg_resume.c
@@ -21,7 +21,7 @@
 #include <xen/foreign/x86_32.h>
 #include <xen/foreign/x86_64.h>
 #include <xen/hvm/params.h>
-#include "xc_core.h"
+#include "xg_core.h"
 
 static int modify_returncode(xc_interface *xch, uint32_t domid)
 {
-- 
2.26.2


