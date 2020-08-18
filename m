Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836AA24830B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ytR-0006HD-GT; Tue, 18 Aug 2020 10:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pr8P=B4=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k7ytP-0005zo-NE
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:30:59 +0000
X-Inumbo-ID: c59afaba-b84f-4ebd-a365-e9f923ab4cc3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c59afaba-b84f-4ebd-a365-e9f923ab4cc3;
 Tue, 18 Aug 2020 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=0B+/exvkZXk9UaGSfy4aEbkmijHI3UBAG2GUZIo9jRQ=; b=FuA1OU59lP4vZMREqb9t/otfTd
 SE2qr5h8lFkvFnE1sEtUw2zG1+wN7yg3u4NPaDYsC7Zj+Q7bp7B9MVN/DrwKKl4oNANdFw27AEaDk
 VMHr0kyZauOQ1ZnBz3E6wHidQyI+o1/hlZikXrOa/WnZZgP3nK9obQo8MObxm/YNCTrM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7ytB-00014r-WC; Tue, 18 Aug 2020 10:30:45 +0000
Received: from host31-48-92-96.range31-48.btcentralplus.com ([31.48.92.96]
 helo=u2f063a87eabd5f.home) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7ytB-0003Rw-OT; Tue, 18 Aug 2020 10:30:45 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 8/9] x86/time: add a domain context record for tsc_info...
Date: Tue, 18 Aug 2020 11:30:31 +0100
Message-Id: <20200818103032.3050-9-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200818103032.3050-1-paul@xen.org>
References: <20200818103032.3050-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... and update xen-domctx to dump some information describing the record.

NOTE: Whilst the record definition is x86 specific, it is visible directly
      in the common header as context record numbers should be unique across
      all architectures.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v7:
 - New in v7
---
 tools/misc/xen-domctx.c    | 12 ++++++++++++
 xen/arch/x86/time.c        | 34 +++++++++++++++++++++++++++++++++-
 xen/include/asm-x86/time.h |  5 +++--
 xen/include/public/save.h  | 13 ++++++++++++-
 4 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
index 6ead7ea89d..e09d75cf68 100644
--- a/tools/misc/xen-domctx.c
+++ b/tools/misc/xen-domctx.c
@@ -59,9 +59,20 @@ static void dump_header(void)
 
     printf("    HEADER: magic %#x, version %u\n",
            h->magic, h->version);
+}
+
+static void dump_tsc_info(void)
+{
+    DOMAIN_SAVE_TYPE(TSC_INFO) *t;
 
+    GET_PTR(t);
+
+    printf("    TSC_INFO: mode: %u incarnation: %u\n"
+           "              khz %u elapsed_nsec: %"PRIu64"\n",
+           t->mode, t->incarnation, t->khz, t->elapsed_nsec);
 }
 
+
 static void print_binary(const char *prefix, const void *val, size_t size,
                          const char *suffix)
 {
@@ -251,6 +262,7 @@ int main(int argc, char **argv)
             {
             case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
             case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(); break;
+            case DOMAIN_SAVE_CODE(TSC_INFO): dump_tsc_info(); break;
             case DOMAIN_SAVE_CODE(END): dump_end(); break;
             default:
                 printf("Unknown type %u: skipping\n", desc->typecode);
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 505e54ebd7..05f65fbf12 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -26,6 +26,7 @@
 #include <xen/symbols.h>
 #include <xen/keyhandler.h>
 #include <xen/guest_access.h>
+#include <xen/save.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/msr.h>
@@ -2334,7 +2335,7 @@ int host_tsc_is_safe(void)
  * called to collect tsc-related data only for save file or live
  * migrate; called after last rdtsc is done on this incarnation
  */
-void tsc_get_info(struct domain *d, uint32_t *tsc_mode,
+void tsc_get_info(const struct domain *d, uint32_t *tsc_mode,
                   uint64_t *elapsed_nsec, uint32_t *gtsc_khz,
                   uint32_t *incarnation)
 {
@@ -2453,6 +2454,37 @@ int tsc_set_info(struct domain *d,
     return 0;
 }
 
+static int save_tsc_info(const struct domain *d, struct domain_context *c,
+                         bool dry_run)
+{
+    struct domain_tsc_info_context ctxt;
+
+    if ( !dry_run )
+        tsc_get_info(d, &ctxt.mode, &ctxt.elapsed_nsec, &ctxt.khz,
+                     &ctxt.incarnation);
+
+    return DOMAIN_SAVE_ENTRY(TSC_INFO, c, 0, &ctxt, sizeof(ctxt));
+}
+
+static int load_tsc_info(struct domain *d, struct domain_context *c)
+{
+    struct domain_tsc_info_context ctxt;
+    unsigned int i;
+    int rc;
+
+    rc = DOMAIN_LOAD_ENTRY(TSC_INFO, c, &i, &ctxt, sizeof(ctxt));
+    if ( rc )
+        return rc;
+
+    if ( i ) /* expect only a single instance */
+        return -ENXIO;
+
+    return tsc_set_info(d, ctxt.mode, ctxt.elapsed_nsec, ctxt.khz,
+                        ctxt.incarnation);
+}
+
+DOMAIN_REGISTER_SAVE_LOAD(TSC_INFO, save_tsc_info, load_tsc_info);
+
 /* vtsc may incur measurable performance degradation, diagnose with this */
 static void dump_softtsc(unsigned char key)
 {
diff --git a/xen/include/asm-x86/time.h b/xen/include/asm-x86/time.h
index f347311cc4..7f2ce6226a 100644
--- a/xen/include/asm-x86/time.h
+++ b/xen/include/asm-x86/time.h
@@ -59,8 +59,9 @@ u64 gtsc_to_gtime(struct domain *d, u64 tsc);
 int tsc_set_info(struct domain *d, uint32_t tsc_mode, uint64_t elapsed_nsec,
                  uint32_t gtsc_khz, uint32_t incarnation);
 
-void tsc_get_info(struct domain *d, uint32_t *tsc_mode, uint64_t *elapsed_nsec,
-                  uint32_t *gtsc_khz, uint32_t *incarnation);
+void tsc_get_info(const struct domain *d, uint32_t *tsc_mode,
+                  uint64_t *elapsed_nsec, uint32_t *gtsc_khz,
+                  uint32_t *incarnation);
    
 
 void force_update_vcpu_system_time(struct vcpu *v);
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
index 0e855a4b97..aeb17298eb 100644
--- a/xen/include/public/save.h
+++ b/xen/include/public/save.h
@@ -93,7 +93,18 @@ struct domain_shared_info_context {
 
 DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct domain_shared_info_context);
 
-#define DOMAIN_SAVE_CODE_MAX 2
+#if defined(__i386__) || defined(__x86_64__)
+struct domain_tsc_info_context {
+    uint32_t mode;
+    uint32_t incarnation;
+    uint64_t elapsed_nsec;
+    uint32_t khz;
+};
+
+DECLARE_DOMAIN_SAVE_TYPE(TSC_INFO, 3, struct domain_tsc_info_context);
+#endif
+
+#define DOMAIN_SAVE_CODE_MAX 3
 
 #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
 
-- 
2.20.1


