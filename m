Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACD195DF1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:53:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHu3l-0007zf-O5; Fri, 27 Mar 2020 18:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiP0=5M=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jHu3j-0007yq-R6
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:50:23 +0000
X-Inumbo-ID: cfaf9f10-705b-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfaf9f10-705b-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ari6gro6vIHbJy4JWToLoL3jkvF1i1YmcxQJlN3+ER0=; b=r/izpxsq1BCRc7awuaGGPdcAka
 SW64gj477rlzDT7U5H7ebNrPIH6HbA5vYwGlZU6A11GTLqTPe5I6ofRmoMsWZgN19Af0PZeMDxTQN
 BPHTUgFoiybBRT1j5xktVV+6HFyS3cb2eQuqvrma46qmZFRCleGU4eS1i7DnyMqzJTCU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3h-0008Kh-FX; Fri, 27 Mar 2020 18:50:21 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3h-0007P4-6c; Fri, 27 Mar 2020 18:50:21 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:50:11 +0000
Message-Id: <20200327185012.1795-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327185012.1795-1-paul@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH 4/5] common/domain: add a domain context record
 for shared_info...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... and update xen-ctx to dump some information describing the record.

NOTE: To allow a sensible definition of the record in public/save.h
      this patch also adds a definition of the Xen ABI's de-facto page
      size into public/xen.h.

Signed-off-by: Paul Durrant <paul@xen.org>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/misc/xen-ctx.c      |  8 ++++++
 xen/common/domain.c       | 55 +++++++++++++++++++++++++++++++++++++++
 xen/include/public/save.h | 10 ++++++-
 xen/include/public/xen.h  |  3 +++
 4 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-ctx.c b/tools/misc/xen-ctx.c
index c31dd5d8e9..8f9692843b 100644
--- a/tools/misc/xen-ctx.c
+++ b/tools/misc/xen-ctx.c
@@ -57,6 +57,13 @@ static void dump_header(void)
            h.magic, h.version);
 }
 
+static void dump_shared_info(void)
+{
+    DOMAIN_SAVE_TYPE(SHARED_INFO) s;
+    READ(s);
+    printf("    SHARED_INFO: field_width %u\n", s.field_width);
+}
+
 static void dump_end(void)
 {
     DOMAIN_SAVE_TYPE(END) e;
@@ -124,6 +131,7 @@ int main(int argc, char **argv)
         switch (desc.typecode)
         {
         case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
+        case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(); break;
         case DOMAIN_SAVE_CODE(END): dump_end(); return 0;
         default:
             printf("Unknown type %u: skipping\n", desc.typecode);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3dcd73f67c..484f6bde13 100644
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
@@ -1646,6 +1647,60 @@ int continue_hypercall_on_cpu(
     return 0;
 }
 
+static int save_shared_info(const struct vcpu *v, struct domain_context *c,
+                            bool dry_run)
+{
+    struct domain *d = v->domain;
+    struct domain_shared_info_context ctxt = {};
+
+    if ( !dry_run )
+    {
+        memcpy(ctxt.buffer, d->shared_info, PAGE_SIZE);
+        ctxt.field_width = has_32bit_shinfo(d) ? 4 : 8;
+    }
+
+    return DOMAIN_SAVE_ENTRY(SHARED_INFO, c, v, &ctxt, sizeof(ctxt));
+}
+
+static int load_shared_info(struct vcpu *v, struct domain_context *c)
+{
+    struct domain *d = v->domain;
+    struct domain_shared_info_context ctxt;
+    unsigned int i;
+    int rc;
+
+    rc = DOMAIN_LOAD_ENTRY(SHARED_INFO, c, v, &ctxt, sizeof(ctxt), true);
+    if ( rc )
+        return rc;
+
+    for ( i = 0; i < ARRAY_SIZE(ctxt.pad); i++ )
+        if ( ctxt.pad[i] )
+            return -EINVAL;
+
+    switch ( ctxt.field_width )
+    {
+    case 4:
+        d->arch.has_32bit_shinfo = 1;
+        break;
+
+    case 8:
+        d->arch.has_32bit_shinfo = 0;
+        break;
+
+    default:
+        rc = -EINVAL;
+        break;
+    }
+
+    if ( !rc )
+        memcpy(d->shared_info, ctxt.buffer, PAGE_SIZE);
+
+    return rc;
+}
+
+DOMAIN_REGISTER_SAVE_RESTORE(SHARED_INFO, false, save_shared_info,
+                             load_shared_info);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
index 84981cd0f6..ff804a7dbf 100644
--- a/xen/include/public/save.h
+++ b/xen/include/public/save.h
@@ -69,6 +69,14 @@ struct domain_save_header {
 };
 DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
 
-#define DOMAIN_SAVE_CODE_MAX 1
+struct domain_shared_info_context {
+    uint8_t buffer[XEN_PAGE_SIZE];
+    uint8_t field_width;
+    uint8_t pad[7];
+};
+
+DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct domain_shared_info_context);
+
+#define DOMAIN_SAVE_CODE_MAX 2
 
 #endif /* __XEN_PUBLIC_SAVE_H__ */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 75b1619d0d..cbf603f289 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -37,6 +37,9 @@
 #error "Unsupported architecture"
 #endif
 
+/* The Xen ABI assumes a page size of 4k. */
+#define XEN_PAGE_SIZE 4096
+
 #ifndef __ASSEMBLY__
 /* Guest handles for primitive C types. */
 DEFINE_XEN_GUEST_HANDLE(char);
-- 
2.20.1


