Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1088F6AB6E3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506672.779777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5AP-00079w-PR; Mon, 06 Mar 2023 07:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506672.779777; Mon, 06 Mar 2023 07:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5AP-000788-LH; Mon, 06 Mar 2023 07:21:53 +0000
Received: by outflank-mailman (input) for mailman id 506672;
 Mon, 06 Mar 2023 07:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5AN-0006qo-PA
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:21:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f29f080-bbef-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:21:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21EB81FDAE;
 Mon,  6 Mar 2023 07:21:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 971D013A66;
 Mon,  6 Mar 2023 07:21:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S7nHI4yUBWTHKQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 07:21:48 +0000
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
X-Inumbo-ID: 8f29f080-bbef-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678087309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jFT+0nbJeKez3tdZ3hN9Aftdtbd1wRX/xlXPbO/ug3Y=;
	b=Z5Bo5hkYMatyrX/SNn0tgSzHd+hTNPdVd/i/w3lsFmLiKzinpPEy4T2+Eq2bW3Oc2pXhEb
	b9+rL/QfbJou8PlWd7I7bGUZYjLdgo9JUjdo8ZIJHRKOJ+68PiVUsmUKcYbrtm8a4as3Bz
	GF0Cz4yAcdyMJ8RTqR7Q/EyExYNrbHA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Julien Grall <julien@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v3 1/4] tools: rename xen-tools/libs.h file to common-macros.h
Date: Mon,  6 Mar 2023 08:21:37 +0100
Message-Id: <20230306072140.28402-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230306072140.28402-1-jgross@suse.com>
References: <20230306072140.28402-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to better reflect the contents of the header and to make it
more appropriate to use it for different runtime environments like
programs, libraries, and firmware, rename the libs.h include file to
common-macros.h. Additionally add a comment pointing out the need to be
self-contained.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> # tools/python/xen/lowlevel/xc/xc.c
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
V2:
- new patch
V3:
- small rephrase of warning comment (Jan Beulich)
---
 tools/console/daemon/io.c                         |  2 +-
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c         |  2 +-
 .../include/xen-tools/{libs.h => common-macros.h} | 15 ++++++++++++---
 tools/libs/call/buffer.c                          |  2 +-
 tools/libs/ctrl/xc_pm.c                           |  2 +-
 tools/libs/ctrl/xc_private.h                      |  2 +-
 tools/libs/foreignmemory/linux.c                  |  2 +-
 tools/libs/gnttab/freebsd.c                       |  2 +-
 tools/libs/gnttab/linux.c                         |  2 +-
 tools/libs/guest/xg_core_arm.c                    |  2 +-
 tools/libs/guest/xg_cpuid_x86.c                   |  2 +-
 tools/libs/guest/xg_dom_arm.c                     |  2 +-
 tools/libs/guest/xg_dom_bzimageloader.c           |  2 +-
 tools/libs/guest/xg_dom_x86.c                     |  2 +-
 tools/libs/guest/xg_sr_common.c                   |  2 +-
 tools/libs/light/libxl_internal.h                 |  2 +-
 tools/libs/light/libxl_psr.c                      |  2 +-
 tools/libs/stat/xenstat_linux.c                   |  2 +-
 tools/misc/xen-access.c                           |  2 +-
 tools/misc/xen-cpuid.c                            |  2 +-
 tools/misc/xen-diag.c                             |  2 +-
 tools/misc/xen-hptool.c                           |  2 +-
 tools/misc/xen-livepatch.c                        |  2 +-
 tools/misc/xen-mfndump.c                          |  2 +-
 tools/misc/xenpm.c                                |  2 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c             |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c               |  2 +-
 tools/python/xen/lowlevel/xc/xc.c                 |  2 +-
 tools/tests/cpu-policy/test-cpu-policy.c          |  2 +-
 tools/tests/paging-mempool/test-paging-mempool.c  |  2 +-
 tools/tests/resource/test-resource.c              |  2 +-
 tools/tests/tsx/test-tsx.c                        |  2 +-
 tools/tests/vhpet/emul.h                          |  2 +-
 tools/tests/x86_emulator/x86-emulate.h            |  2 +-
 tools/tests/xenstore/test-xenstore.c              |  2 +-
 tools/xenstore/utils.h                            |  2 +-
 tools/xentrace/analyze.h                          |  2 +-
 tools/xl/xl_cmdtable.c                            |  2 +-
 xen/lib/x86/private.h                             |  2 +-
 39 files changed, 50 insertions(+), 41 deletions(-)
 rename tools/include/xen-tools/{libs.h => common-macros.h} (82%)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 682c1f4008..6bfe96715b 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -50,7 +50,7 @@
 #include <sys/ioctl.h>
 #include <libutil.h>
 #endif
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 /* Each 10 bits takes ~ 3 digits, plus one, plus one for nul terminator. */
 #define MAX_STRLEN(x) ((sizeof(x) * CHAR_BIT + CHAR_BIT-1) / 10 * 3 + 2)
diff --git a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
index 79a849a044..7d0f274c6c 100644
--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -8,7 +8,7 @@
 
 #include <getopt.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 #include <xen/lib/x86/cpuid.h>
 #include <xen/lib/x86/msr.h>
 #include <xen/domctl.h>
diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/common-macros.h
similarity index 82%
rename from tools/include/xen-tools/libs.h
rename to tools/include/xen-tools/common-macros.h
index bafc90e2f6..a372b9ecf2 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -1,5 +1,14 @@
-#ifndef __XEN_TOOLS_LIBS__
-#define __XEN_TOOLS_LIBS__
+#ifndef __XEN_TOOLS_COMMON_MACROS__
+#define __XEN_TOOLS_COMMON_MACROS__
+
+/*
+ * Caution:
+ *
+ * This header must be completely self-contained. There are no external
+ * references to variables or functions allowed, as the file might be included
+ * for different runtime environments, such as firmware or target and build
+ * host programs.
+ */
 
 #ifndef BUILD_BUG_ON
 #if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
@@ -67,4 +76,4 @@
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
 
-#endif	/* __XEN_TOOLS_LIBS__ */
+#endif	/* __XEN_TOOLS_COMMON_MACROS__ */
diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 085674d882..2579b8c719 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -16,7 +16,7 @@
 #include <errno.h>
 #include <string.h>
 #include <pthread.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "private.h"
 
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 76d7eb7f26..c3a9864bf7 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -21,7 +21,7 @@
 #include <stdbool.h>
 #include "xc_private.h"
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 /*
  * Get PM statistic info
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index ed960c6f30..80dc464c93 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -39,7 +39,7 @@
 
 #include <xen/sys/privcmd.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #if defined(HAVE_VALGRIND_MEMCHECK_H) && !defined(NDEBUG) && !defined(__MINIOS__)
 /* Compile in Valgrind client requests? */
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index 9062117407..12f959765a 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -25,7 +25,7 @@
 
 #include <sys/mman.h>
 #include <sys/ioctl.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "private.h"
 
diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index e42ac3fbf3..d69d928a16 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -31,7 +31,7 @@
 #include <xen/sys/gntdev.h>
 
 #include <xenctrl.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "private.h"
 
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index 5628fd5719..7286c1d4fe 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -33,7 +33,7 @@
 #include <xen/sys/gntalloc.h>
 
 #include <xenctrl.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "private.h"
 
diff --git a/tools/libs/guest/xg_core_arm.c b/tools/libs/guest/xg_core_arm.c
index aaabd07558..de30cf0c31 100644
--- a/tools/libs/guest/xg_core_arm.c
+++ b/tools/libs/guest/xg_core_arm.c
@@ -19,7 +19,7 @@
 #include "xc_private.h"
 #include "xg_core.h"
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 int
 xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 57f81eb0a0..4542878bbe 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -24,7 +24,7 @@
 #include <limits.h>
 #include "xg_private.h"
 #include <xen/hvm/params.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 enum {
 #define XEN_CPUFEATURE(name, value) X86_FEATURE_##name = value,
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 5e3b76355e..d616dccbd6 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -21,7 +21,7 @@
 
 #include <xen/xen.h>
 #include <xen/io/protocols.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "xg_private.h"
 
diff --git a/tools/libs/guest/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
index 764ddbb43e..c6ee6d83e7 100644
--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -34,7 +34,7 @@
 #include "xg_private.h"
 #include "xg_dom_decompress.h"
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #ifndef __MINIOS__
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 9328fbf804..811d176488 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -35,7 +35,7 @@
 #include <xen/arch-x86/hvm/start_info.h>
 #include <xen/io/protocols.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "xg_private.h"
 #include "xenctrl.h"
diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 17567ab133..7ccdc3b1f6 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -2,7 +2,7 @@
 
 #include "xg_sr_common.h"
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static const char *const dhdr_types[] =
 {
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index ad982d691a..5244fde623 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -58,7 +58,7 @@
 #include <xenguest.h>
 #include <xenhypfs.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "xentoollog.h"
 
diff --git a/tools/libs/light/libxl_psr.c b/tools/libs/light/libxl_psr.c
index 9ced7d1715..712a55a73d 100644
--- a/tools/libs/light/libxl_psr.c
+++ b/tools/libs/light/libxl_psr.c
@@ -16,7 +16,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 #include "libxl_internal.h"
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #define IA32_QM_CTR_ERROR_MASK         (0x3ul << 62)
 
diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index ebcd65f24a..05d0b07553 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -30,7 +30,7 @@
 #include <string.h>
 #include <unistd.h>
 #include <regex.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "xenstat_priv.h"
 
diff --git a/tools/misc/xen-access.c b/tools/misc/xen-access.c
index 0731c20b83..4097eebe6f 100644
--- a/tools/misc/xen-access.c
+++ b/tools/misc/xen-access.c
@@ -43,7 +43,7 @@
 #include <xenevtchn.h>
 #include <xen/vm_event.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #if defined(__arm__) || defined(__aarch64__)
 #include <xen/arch-arm.h>
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 3ab820571d..8cf6a5ecfe 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -10,7 +10,7 @@
 #include <xenctrl.h>
 #include <xenguest.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static uint32_t nr_features;
 
diff --git a/tools/misc/xen-diag.c b/tools/misc/xen-diag.c
index 4778914820..cd0c2c1fc6 100644
--- a/tools/misc/xen-diag.c
+++ b/tools/misc/xen-diag.c
@@ -11,7 +11,7 @@
 #include <xenctrl.h>
 
 #include <xen/errno.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static xc_interface *xch;
 
diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index 7f17f24942..6d6aec8bad 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -5,7 +5,7 @@
 #include <xenctrl.h>
 #include <xenguest.h>
 #include <xenstore.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static xc_interface *xch;
 
diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index 16a4a47ab7..5bf9d9a32b 100644
--- a/tools/misc/xen-livepatch.c
+++ b/tools/misc/xen-livepatch.c
@@ -15,7 +15,7 @@
 #include <xenstore.h>
 
 #include <xen/errno.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static xc_interface *xch;
 
diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index 62121bd241..b32c95e262 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -8,7 +8,7 @@
 #include <xenctrl.h>
 #include <xenguest.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), 21)
 #define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 4f8cde690a..1bb6187e56 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -28,7 +28,7 @@
 #include <inttypes.h>
 #include <sys/time.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #define MAX_PKG_RESIDENCIES 12
 #define MAX_CORE_RESIDENCIES 8
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index d623ad390e..c85b1fcce7 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -21,7 +21,7 @@
 #include <errno.h>
 #include "mmap_stubs.h"
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include <caml/mlvalues.h>
 #include <caml/memory.h>
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ed1cbafdb4..6ec9ed6d1e 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -33,7 +33,7 @@
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
 #include <xenguest.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "mmap_stubs.h"
 
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index cfb2734a99..224671bc02 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -22,7 +22,7 @@
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/params.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 /* Needed for Python versions earlier than 2.3. */
 #ifndef PyMODINIT_FUNC
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index ed450a0997..d3f24fd6d2 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -7,7 +7,7 @@
 #include <string.h>
 #include <err.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 #include <xen/asm/x86-vendors.h>
 #include <xen/lib/x86/cpu-policy.h>
 #include <xen/domctl.h>
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index b2dfe9b074..1ebc13455a 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -8,7 +8,7 @@
 #include <xenctrl.h>
 #include <xenforeignmemory.h>
 #include <xengnttab.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 0a950072f9..7ae88ea348 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -7,7 +7,7 @@
 #include <xenctrl.h>
 #include <xenforeignmemory.h>
 #include <xengnttab.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index f11e8c54e0..d6d98c299b 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -28,7 +28,7 @@
 
 #include <xenctrl.h>
 #include <xenguest.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "xg_private.h"
 
diff --git a/tools/tests/vhpet/emul.h b/tools/tests/vhpet/emul.h
index b022cc0eab..dfeb10f74e 100644
--- a/tools/tests/vhpet/emul.h
+++ b/tools/tests/vhpet/emul.h
@@ -24,7 +24,7 @@
 
 #include "hpet.h"
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #define NR_CPUS 8
 
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 18ae40d017..46d4e43cea 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -39,7 +39,7 @@
 #include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #define BUG() abort()
 #define ASSERT assert
diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstore/test-xenstore.c
index d3574b3fa2..d491dac53b 100644
--- a/tools/tests/xenstore/test-xenstore.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -31,7 +31,7 @@
 #include <time.h>
 #include <xenstore.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #define TEST_PATH "xenstore-test"
 #define WRITE_BUFFERS_N    10
diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index 9d012b97c1..028ecb9d7a 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -5,7 +5,7 @@
 #include <stdint.h>
 #include <stdio.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "xenstore_lib.h"
 
diff --git a/tools/xentrace/analyze.h b/tools/xentrace/analyze.h
index f9d98d8da4..6fefa19639 100644
--- a/tools/xentrace/analyze.h
+++ b/tools/xentrace/analyze.h
@@ -3,7 +3,7 @@
 
 #include <stdint.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #define TRC_GEN_MAIN     0
 #define TRC_SCHED_MAIN   1
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 35182ca196..ccf4d83584 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -15,7 +15,7 @@
 #include <string.h>
 
 #include <libxl.h>
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 #include "xl.h"
 
diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
index 2d53bd3ced..60bb82a400 100644
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -26,7 +26,7 @@
 #include <xen/asm/msr-index.h>
 #include <xen/asm/x86-vendors.h>
 
-#include <xen-tools/libs.h>
+#include <xen-tools/common-macros.h>
 
 static inline bool test_bit(unsigned int bit, const void *vaddr)
 {
-- 
2.35.3


