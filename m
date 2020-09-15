Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21126A989
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 18:18:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIDf2-0001dG-8W; Tue, 15 Sep 2020 16:18:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kIDf0-0001Sm-Jf
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 16:18:26 +0000
X-Inumbo-ID: 7c1fe9a4-f218-4ec5-9492-9cfc6f2c8564
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c1fe9a4-f218-4ec5-9492-9cfc6f2c8564;
 Tue, 15 Sep 2020 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=FGlB2UQIQASWliNynhnstajXESwqTlalG0wjsNUQoic=; b=fK5eqAVEqSTyV+7YEUn8U/dY7W
 oB9exPRCswz/Sim0jHMLt0Bh5ea6K0GYYgw3gRyv9s1ClebcznEYHswYKYdP8EZCxlTu1M2vw2X4o
 KXPvMMkucUOq89tNfMAkrYQmQ7je/keozcGtt5wka4yJ8ordoUw3IzmqXq8JDRL3tDXM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIDen-00075j-J4; Tue, 15 Sep 2020 16:18:13 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIDen-0000cN-BZ; Tue, 15 Sep 2020 16:18:13 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 7/8] x86/time: add a domain context record for tsc_info...
Date: Tue, 15 Sep 2020 17:17:59 +0100
Message-Id: <20200915161800.1384-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200915161800.1384-1-paul@xen.org>
References: <20200915161800.1384-1-paul@xen.org>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v8:
 - Removed stray blank line

v7:
 - New in v7
---
 tools/misc/xen-domctx.c    | 11 +++++++++++
 xen/arch/x86/time.c        | 34 +++++++++++++++++++++++++++++++++-
 xen/include/asm-x86/time.h |  5 +++--
 xen/include/public/save.h  | 13 ++++++++++++-
 4 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
index 6ead7ea89d..e582a79678 100644
--- a/tools/misc/xen-domctx.c
+++ b/tools/misc/xen-domctx.c
@@ -59,7 +59,17 @@ static void dump_header(void)
 
     printf("    HEADER: magic %#x, version %u\n",
            h->magic, h->version);
+}
+
+static void dump_tsc_info(void)
+{
+    DOMAIN_SAVE_TYPE(TSC_INFO) *t;
+
+    GET_PTR(t);
 
+    printf("    TSC_INFO: mode: %u incarnation: %u\n"
+           "              khz %u elapsed_nsec: %"PRIu64"\n",
+           t->mode, t->incarnation, t->khz, t->elapsed_nsec);
 }
 
 static void print_binary(const char *prefix, const void *val, size_t size,
@@ -251,6 +261,7 @@ int main(int argc, char **argv)
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


