Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D147E1D2D26
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 12:44:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZBLy-0004Av-Fb; Thu, 14 May 2020 10:44:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4jr8=64=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jZBLx-0004Aa-4r
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 10:44:37 +0000
X-Inumbo-ID: e2303dea-95cf-11ea-a468-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2303dea-95cf-11ea-a468-12813bfff9fa;
 Thu, 14 May 2020 10:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9T3VeNPVxqhKc11ERGW3Ko1mTMz/vBpR5z7eveF6nE=; b=4gNl2eOwTytWx7+/tUDUjMUR0p
 uBRn4zyHzPlVf9qNouO/wSVuNg4dy+g1rsKv6ka2USlJYHX5kBcuRDgkX2a3GJYwen8YsQuIzf9WE
 BFz9V+zvVn8E25TsnBquXJoyWzSLAqljcD/eGwCNPIizWjsqihnHaIZG+HjAn4mvZJdM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jZBLm-0004aS-Po; Thu, 14 May 2020 10:44:26 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jZBLm-0000sH-Gh; Thu, 14 May 2020 10:44:26 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/5] common/domain: add a domain context record for
 shared_info...
Date: Thu, 14 May 2020 11:44:15 +0100
Message-Id: <20200514104416.16657-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514104416.16657-1-paul@xen.org>
References: <20200514104416.16657-1-paul@xen.org>
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... and update xen-domctx to dump some information describing the record.

NOTE: The domain may or may not be using the embedded vcpu_info array so
      ultimately separate context records will be added for vcpu_info when
      this becomes necessary.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>

v3:
 - Actually dump some of the content of shared_info

v2:
 - Drop the header change to define a 'Xen' page size and instead use a
   variable length struct now that the framework makes this is feasible
 - Guard use of 'has_32bit_shinfo' in common code with CONFIG_COMPAT
---
 tools/misc/xen-domctx.c   | 73 +++++++++++++++++++++++++++++++++++++++
 xen/common/domain.c       | 60 ++++++++++++++++++++++++++++++++
 xen/include/public/save.h | 11 +++++-
 3 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
index 243325dfce..b2fed5eae7 100644
--- a/tools/misc/xen-domctx.c
+++ b/tools/misc/xen-domctx.c
@@ -31,6 +31,7 @@
 #include <errno.h>
 
 #include <xenctrl.h>
+#include <xen-tools/libs.h>
 #include <xen/xen.h>
 #include <xen/domctl.h>
 #include <xen/save.h>
@@ -61,6 +62,76 @@ static void dump_header(void)
 
 }
 
+static void print_binary(const char *prefix, void *val, size_t size,
+                         const char *suffix)
+{
+    printf("%s", prefix);
+
+    while (size--)
+    {
+        uint8_t octet = *(uint8_t *)val++;
+        unsigned int i;
+
+        for ( i = 0; i < 8; i++ )
+        {
+            printf("%u", octet & 1);
+            octet >>= 1;
+        }
+    }
+
+    printf("%s", suffix);
+}
+
+static void dump_shared_info(void)
+{
+    DOMAIN_SAVE_TYPE(SHARED_INFO) *s;
+    shared_info_any_t *info;
+    unsigned int i;
+
+    GET_PTR(s);
+
+    printf("    SHARED_INFO: has_32bit_shinfo: %s buffer_size: %u\n",
+           s->has_32bit_shinfo ? "true" : "false", s->buffer_size);
+
+    info = (shared_info_any_t *)s->buffer;
+
+#define GET_FIELD_PTR(_f) \
+    (s->has_32bit_shinfo ? (void *)&(info->x32._f) : (void *)&(info->x64._f))
+#define GET_FIELD_SIZE(_f) \
+    (s->has_32bit_shinfo ? sizeof(info->x32._f) : sizeof(info->x64._f))
+#define GET_FIELD(_f) \
+    (s->has_32bit_shinfo ? info->x32._f : info->x64._f)
+
+    /* Array lengths are the same for 32-bit and 64-bit shared info */
+
+    for ( i = 0; i < ARRAY_SIZE(info->x64.evtchn_pending); i++ )
+    {
+        const char *prefix = !i ?
+            "                 evtchn_pending: " :
+            "                                 ";
+
+        print_binary(prefix, GET_FIELD_PTR(evtchn_pending[0]),
+                 GET_FIELD_SIZE(evtchn_pending[0]), "\n");
+    }
+
+    for ( i = 0; i < ARRAY_SIZE(info->x64.evtchn_mask); i++ )
+    {
+        const char *prefix = !i ?
+            "                    evtchn_mask: " :
+            "                                 ";
+
+        print_binary(prefix, GET_FIELD_PTR(evtchn_mask[0]),
+                 GET_FIELD_SIZE(evtchn_mask[0]), "\n");
+    }
+
+    printf("                 wc: version: %u sec: %u nsec: %u\n",
+           GET_FIELD(wc_version), GET_FIELD(wc_sec), GET_FIELD(wc_nsec));
+
+#undef GET_FIELD
+#undef GET_FIELD_SIZE
+#undef GET_FIELD_PTR
+}
+
 static void dump_end(void)
 {
     DOMAIN_SAVE_TYPE(END) *e;
@@ -167,12 +238,14 @@ int main(int argc, char **argv)
         if ( (typecode < 0 || typecode == desc->typecode) &&
              (instance < 0 || instance == desc->instance) )
         {
+
             printf("[%u] type: %u instance: %u length: %u\n", entry++,
                    desc->typecode, desc->instance, desc->length);
 
             switch (desc->typecode)
             {
             case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
+            case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(); break;
             case DOMAIN_SAVE_CODE(END): dump_end(); break;
             default:
                 printf("Unknown type %u: skipping\n", desc->typecode);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7cc9526139..e4518cd28d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -33,6 +33,7 @@
 #include <xen/xenoprof.h>
 #include <xen/irq.h>
 #include <xen/argo.h>
+#include <xen/save.h>
 #include <asm/debugger.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
@@ -1649,6 +1650,65 @@ int continue_hypercall_on_cpu(
     return 0;
 }
 
+static int save_shared_info(const struct domain *d, struct domain_context *c,
+                            bool dry_run)
+{
+    struct domain_shared_info_context ctxt = { .buffer_size = PAGE_SIZE };
+    size_t hdr_size = offsetof(typeof(ctxt), buffer);
+    int rc;
+
+    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
+    if ( rc )
+        return rc;
+
+#ifdef CONFIG_COMPAT
+    if ( !dry_run )
+        ctxt.has_32bit_shinfo = has_32bit_shinfo(d);
+#endif
+
+    rc = domain_save_data(c, &ctxt, hdr_size);
+    if ( rc )
+        return rc;
+
+    rc = domain_save_data(c, d->shared_info, ctxt.buffer_size);
+    if ( rc )
+        return rc;
+
+    return domain_save_end(c);
+}
+
+static int load_shared_info(struct domain *d, struct domain_context *c)
+{
+    struct domain_shared_info_context ctxt;
+    size_t hdr_size = offsetof(typeof(ctxt), buffer);
+    unsigned int i;
+    int rc;
+
+    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
+    if ( rc || i ) /* expect only a single instance */
+        return rc;
+
+    rc = domain_load_data(c, &ctxt, hdr_size);
+    if ( rc )
+        return rc;
+
+    if ( ctxt.pad[0] || ctxt.pad[1] || ctxt.pad[2] ||
+         ctxt.buffer_size != PAGE_SIZE )
+        return -EINVAL;
+
+#ifdef CONFIG_COMPAT
+    d->arch.has_32bit_shinfo = ctxt.has_32bit_shinfo;
+#endif
+
+    rc = domain_load_data(c, d->shared_info, ctxt.buffer_size);
+    if ( rc )
+        return rc;
+
+    return domain_load_end(c);
+}
+
+DOMAIN_REGISTER_SAVE_RESTORE(SHARED_INFO, save_shared_info, load_shared_info);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
index 834c031c51..2b633cf03d 100644
--- a/xen/include/public/save.h
+++ b/xen/include/public/save.h
@@ -73,7 +73,16 @@ struct domain_save_header {
 };
 DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
 
-#define DOMAIN_SAVE_CODE_MAX 1
+struct domain_shared_info_context {
+    uint8_t has_32bit_shinfo;
+    uint8_t pad[3];
+    uint32_t buffer_size;
+    uint8_t buffer[XEN_FLEX_ARRAY_DIM]; /* Implementation specific size */
+};
+
+DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct domain_shared_info_context);
+
+#define DOMAIN_SAVE_CODE_MAX 2
 
 #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
 
-- 
2.20.1


