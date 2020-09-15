Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3A26A987
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 18:18:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIDev-0001ZP-Ij; Tue, 15 Sep 2020 16:18:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kIDet-0001TA-UZ
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 16:18:19 +0000
X-Inumbo-ID: 6dbd685a-31c9-450a-8b1a-e265ceef0fb9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dbd685a-31c9-450a-8b1a-e265ceef0fb9;
 Tue, 15 Sep 2020 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=M8+UCfBnDkPwUvAq7NIm9OKh0hY4HyBdcyPNDLGAcvA=; b=Ao1l67nWK+2kjibWyOd9Evv9YI
 /1uznTRFChZYqQuq5Qd0C4p6K2PkdkwChNHApGj6AqWwJm1f6WZhtXLBCPOFupJgy2Iqt9d0EiN8j
 Nif8C5/xIl5bCSl2BMDN6S4xy3S4vSbcUXL+7PtyzBBqmdmRNmdsLqsz4Hylamhathe0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIDem-00075T-38; Tue, 15 Sep 2020 16:18:12 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIDel-0000cN-Rh; Tue, 15 Sep 2020 16:18:12 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 6/8] common/domain: add a domain context record for
 shared_info...
Date: Tue, 15 Sep 2020 17:17:58 +0100
Message-Id: <20200915161800.1384-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200915161800.1384-1-paul@xen.org>
References: <20200915161800.1384-1-paul@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... and update xen-domctx to dump some information describing the record.

NOTE: Processing of the content during restore is currently limited to
      PV domains, and matches processing of the PV-only SHARED_INFO record
      done by libxc. All content is, however, saved such that restore
      processing can be modified in future without requiring a new record
      format.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>

v8:
 - Incorporate zero-ing out of shared info fields that would be done in
   processing of SHARED_INFO from older stream versions

v7:
 - Only restore vcpu_info and arch sub-structures for PV domains, to match
   processing of SHARED_INFO in xc_sr_restore_x86_pv.c
 - Use additional option to domain_load_end() to ignore the record for
   HVM domains

v6:
 - Only save compat_shared_info buffer if has_32bit_shinfo is set
 - Validate flags field in load handler

v5:
 - Addressed comments from Julien

v4:
 - Addressed comments from Jan

v3:
 - Actually dump some of the content of shared_info

v2:
 - Drop the header change to define a 'Xen' page size and instead use a
   variable length struct now that the framework makes this is feasible
 - Guard use of 'has_32bit_shinfo' in common code with CONFIG_COMPAT
---
 tools/misc/xen-domctx.c   |  78 +++++++++++++++++++++
 xen/common/domain.c       | 144 ++++++++++++++++++++++++++++++++++++++
 xen/include/public/save.h |  13 +++-
 3 files changed, 234 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
index 243325dfce..6ead7ea89d 100644
--- a/tools/misc/xen-domctx.c
+++ b/tools/misc/xen-domctx.c
@@ -31,6 +31,7 @@
 #include <errno.h>
 
 #include <xenctrl.h>
+#include <xen-tools/libs.h>
 #include <xen/xen.h>
 #include <xen/domctl.h>
 #include <xen/save.h>
@@ -61,6 +62,82 @@ static void dump_header(void)
 
 }
 
+static void print_binary(const char *prefix, const void *val, size_t size,
+                         const char *suffix)
+{
+    printf("%s", prefix);
+
+    while ( size-- )
+    {
+        uint8_t octet = *(const uint8_t *)val++;
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
+    bool has_32bit_shinfo;
+    shared_info_any_t *info;
+    unsigned int i, n;
+
+    GET_PTR(s);
+    has_32bit_shinfo = s->flags & DOMAIN_SAVE_32BIT_SHINFO;
+
+    printf("    SHARED_INFO: has_32bit_shinfo: %s buffer_size: %u\n",
+           has_32bit_shinfo ? "true" : "false", s->buffer_size);
+
+    info = (shared_info_any_t *)s->buffer;
+
+#define GET_FIELD_PTR(_f)            \
+    (has_32bit_shinfo ?              \
+     (const void *)&(info->x32._f) : \
+     (const void *)&(info->x64._f))
+#define GET_FIELD_SIZE(_f) \
+    (has_32bit_shinfo ? sizeof(info->x32._f) : sizeof(info->x64._f))
+#define GET_FIELD(_f) \
+    (has_32bit_shinfo ? info->x32._f : info->x64._f)
+
+    n = has_32bit_shinfo ?
+        ARRAY_SIZE(info->x32.evtchn_pending) :
+        ARRAY_SIZE(info->x64.evtchn_pending);
+
+    for ( i = 0; i < n; i++ )
+    {
+        const char *prefix = !i ?
+            "                 evtchn_pending: " :
+            "                                 ";
+
+        print_binary(prefix, GET_FIELD_PTR(evtchn_pending[0]),
+                 GET_FIELD_SIZE(evtchn_pending[0]), "\n");
+    }
+
+    for ( i = 0; i < n; i++ )
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
@@ -173,6 +250,7 @@ int main(int argc, char **argv)
             switch (desc->typecode)
             {
             case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
+            case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(); break;
             case DOMAIN_SAVE_CODE(END): dump_end(); break;
             default:
                 printf("Unknown type %u: skipping\n", desc->typecode);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f0f9c62feb..2375e250af 100644
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
@@ -1659,6 +1660,149 @@ int continue_hypercall_on_cpu(
     return 0;
 }
 
+static int save_shared_info(const struct domain *d, struct domain_context *c,
+                            bool dry_run)
+{
+    struct domain_shared_info_context ctxt = {
+#ifdef CONFIG_COMPAT
+        .flags = has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : 0,
+        .buffer_size = has_32bit_shinfo(d) ?
+                       sizeof(struct compat_shared_info) :
+                       sizeof(struct shared_info),
+#else
+        .buffer_size = sizeof(struct shared_info),
+#endif
+    };
+    size_t hdr_size = offsetof(typeof(ctxt), buffer);
+    int rc;
+
+    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
+    if ( rc )
+        return rc;
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
+    if ( rc )
+        return rc;
+
+    if ( i ) /* expect only a single instance */
+        return -ENXIO;
+
+    rc = domain_load_data(c, &ctxt, hdr_size);
+    if ( rc )
+        return rc;
+
+    if ( ctxt.buffer_size > sizeof(shared_info_t) ||
+         (ctxt.flags & ~DOMAIN_SAVE_32BIT_SHINFO) )
+        return -EINVAL;
+
+    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
+    {
+#ifdef CONFIG_COMPAT
+        has_32bit_shinfo(d) = true;
+#else
+        return -EINVAL;
+#endif
+    }
+
+    if ( is_pv_domain(d) )
+    {
+        shared_info_t *shinfo = xmalloc(shared_info_t);
+
+        rc = domain_load_data(c, shinfo, sizeof(*shinfo));
+        if ( rc )
+        {
+            xfree(shinfo);
+            return rc;
+        }
+
+#ifdef CONFIG_COMPAT
+        if ( has_32bit_shinfo(d) )
+        {
+            memcpy(&d->shared_info->compat.vcpu_info,
+                   &shinfo->compat.vcpu_info,
+                   sizeof(d->shared_info->compat.vcpu_info));
+            memcpy(&d->shared_info->compat.arch,
+                   &shinfo->compat.arch,
+                   sizeof(d->shared_info->compat.vcpu_info));
+            memset(&d->shared_info->compat.evtchn_pending,
+                   0,
+                   sizeof(d->shared_info->compat.evtchn_pending));
+            memset(&d->shared_info->compat.evtchn_mask,
+                   0xff,
+                   sizeof(d->shared_info->compat.evtchn_mask));
+
+            d->shared_info->compat.arch.pfn_to_mfn_frame_list_list = 0;
+            for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
+                d->shared_info->compat.vcpu_info[i].evtchn_pending_sel = 0;
+        }
+        else
+        {
+            memcpy(&d->shared_info->native.vcpu_info,
+                   &shinfo->native.vcpu_info,
+                   sizeof(d->shared_info->native.vcpu_info));
+            memcpy(&d->shared_info->native.arch,
+                   &shinfo->native.arch,
+                   sizeof(d->shared_info->native.arch));
+            memset(&d->shared_info->native.evtchn_pending,
+                   0,
+                   sizeof(d->shared_info->compat.evtchn_pending));
+            memset(&d->shared_info->native.evtchn_mask,
+                   0xff,
+                   sizeof(d->shared_info->native.evtchn_mask));
+
+            d->shared_info->native.arch.pfn_to_mfn_frame_list_list = 0;
+            for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
+                d->shared_info->native.vcpu_info[i].evtchn_pending_sel = 0;
+        }
+#else
+        memcpy(&d->shared_info->vcpu_info,
+               &shinfo->vcpu_info,
+               sizeof(d->shared_info->vcpu_info));
+        memcpy(&d->shared_info->arch,
+               &shinfo->arch,
+               sizeof(d->shared_info->shared));
+        memset(&d->shared_info->evtchn_pending,
+               0,
+               sizeof(d->shared_info->evtchn_pending));
+        memset(&d->shared_info->evtchn_mask,
+               0xff,
+               sizeof(d->shared_info->evtchn_mask));
+
+        d->shared_info.arch.pfn_to_mfn_frame_list_list = 0;
+        for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
+            d->shared_info.vcpu_info[i].evtchn_pending_sel = 0;
+#endif
+
+        xfree(shinfo);
+
+        rc = domain_load_end(c, false);
+    }
+    else
+        rc = domain_load_end(c, true);
+
+    return rc;
+}
+
+DOMAIN_REGISTER_SAVE_LOAD(SHARED_INFO, save_shared_info, load_shared_info);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
index 551dbbddb8..0e855a4b97 100644
--- a/xen/include/public/save.h
+++ b/xen/include/public/save.h
@@ -82,7 +82,18 @@ struct domain_save_header {
 };
 DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
 
-#define DOMAIN_SAVE_CODE_MAX 1
+struct domain_shared_info_context {
+    uint32_t flags;
+
+#define DOMAIN_SAVE_32BIT_SHINFO 0x00000001
+
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


