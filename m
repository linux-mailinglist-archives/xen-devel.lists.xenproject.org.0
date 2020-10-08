Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2B287BEC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4565.12018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb77-0005sG-W0; Thu, 08 Oct 2020 18:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4565.12018; Thu, 08 Oct 2020 18:58:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb77-0005rF-IA; Thu, 08 Oct 2020 18:58:05 +0000
Received: by outflank-mailman (input) for mailman id 4565;
 Thu, 08 Oct 2020 18:58:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb75-0005RO-P5
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:58:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4a4771c-8495-46c6-aa76-25ee6f552b4b;
 Thu, 08 Oct 2020 18:57:48 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6p-00041s-5r; Thu, 08 Oct 2020 18:57:47 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6o-0002P9-Ug; Thu, 08 Oct 2020 18:57:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb75-0005RO-P5
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:58:03 +0000
X-Inumbo-ID: f4a4771c-8495-46c6-aa76-25ee6f552b4b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f4a4771c-8495-46c6-aa76-25ee6f552b4b;
	Thu, 08 Oct 2020 18:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=AC7LRRI1wOmmMw28VRmEhixnQ6YAW+ioZhx4wAS3Mgc=; b=I/SgwdNaU4Vq24kIJOAwqscdRv
	Z+eGMyM/eyRDVC81hbY0ckFcIxoD/5YtKXYklLcHW+/UM6+8noE3kpf+Ypmml9H8WOHSBgBzAg+CJ
	GLXHQyhBAsN0XxH+fbzrHDHvHjY4YmBcLWfzIpmUae7OvJO5tvaNyWbGd8yeDq+SzE+0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6p-00041s-5r; Thu, 08 Oct 2020 18:57:47 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6o-0002P9-Ug; Thu, 08 Oct 2020 18:57:47 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 06/11] x86/time: add a domain context record for tsc_info...
Date: Thu,  8 Oct 2020 19:57:30 +0100
Message-Id: <20201008185735.29875-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and update xen-domctx to dump some information describing the record.

NOTE: Whilst the record is x86 specific, it is visible directly in the common
      header as context record numbers should be unique across all
      architectures.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v10:
 - Re-base
 - Amend the specification now there is one
 - Kept Jan's R-b as the changes are cosmetic

v8:
 - Removed stray blank line

v7:
 - New in v7
---
 docs/specs/domain-context.md | 32 ++++++++++++++++++++++++++++++++
 tools/misc/xen-domctx.c      | 12 ++++++++++++
 xen/arch/x86/time.c          | 30 ++++++++++++++++++++++++++++++
 xen/include/public/save.h    |  8 ++++++++
 4 files changed, 82 insertions(+)

diff --git a/docs/specs/domain-context.md b/docs/specs/domain-context.md
index 95e9f9d1ab..8aa3466d96 100644
--- a/docs/specs/domain-context.md
+++ b/docs/specs/domain-context.md
@@ -155,6 +155,38 @@ The record body contains the following fields:
 | `buffer`    | The shared info (`length` being architecture    |
 |             | dependent[4])                                   |
 
+### TSC_INFO
+
+```
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| type == 3                     | instance == 0                 |
++-------------------------------+-------------------------------+
+| length == 20                                                  |
++-------------------------------+-------------------------------+
+| mode                          | khz                           |
++-------------------------------+-------------------------------+
+| nsec                                                          |
++-------------------------------+-------------------------------+
+| incarnation                   |
++-------------------------------+
+```
+
+The record body contains the following fields:
+
+| Field         | Description                                   |
+|---------------|-----------------------------------------------|
+| `mode`        | 0x00000000: Default (emulate if necessary)    |
+|               | 0x00000001: Always emulate                    |
+|               | 0x00000002: Never emulate                     |
+|               |                                               |
+| `khz`         | The TSC frequency in kHz                      |
+|               |                                               |
+| `nsec`        | Elapsed time in nanoseconds                   |
+|               |                                               |
+| `incarnation` | Incarnation (counter indicating how many      |
+|               | times the TSC value has been set)             |
+
 * * *
 
 [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
index 5ea6de50d1..1a5dfb9d5a 100644
--- a/tools/misc/xen-domctx.c
+++ b/tools/misc/xen-domctx.c
@@ -136,6 +136,17 @@ static void dump_shared_info(void)
 #undef GET_FIELD_PTR
 }
 
+static void dump_tsc_info(void)
+{
+    struct domain_context_tsc_info *t;
+
+    GET_PTR(t);
+
+    printf("    TSC_INFO: mode: %u incarnation: %u\n"
+           "              khz %u nsec: %"PRIu64"\n",
+           t->mode, t->incarnation, t->khz, t->nsec);
+}
+
 static void dump_end(void)
 {
     struct domain_context_end *e;
@@ -225,6 +236,7 @@ int main(int argc, char **argv)
             {
             case DOMAIN_CONTEXT_START: dump_start(); break;
             case DOMAIN_CONTEXT_SHARED_INFO: dump_shared_info(); break;
+            case DOMAIN_CONTEXT_TSC_INFO: dump_tsc_info(); break;
             case DOMAIN_CONTEXT_END: dump_end(); break;
             default:
                 printf("Unknown type %u: skipping\n", rec->type);
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 8938c0f435..aec4bfb0f3 100644
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
@@ -2451,6 +2452,35 @@ int tsc_set_info(struct domain *d,
     return 0;
 }
 
+static int save_tsc_info(struct domain *d, struct domain_ctxt_state *c,
+                         bool dry_run)
+{
+    struct domain_context_tsc_info t = {};
+
+    if ( !dry_run )
+        tsc_get_info(d, &t.mode, &t.nsec, &t.khz, &t.incarnation);
+
+    return domain_save_ctxt_rec(c, DOMAIN_CONTEXT_TSC_INFO, 0, &t, sizeof(t));
+}
+
+static int load_tsc_info(struct domain *d, struct domain_ctxt_state *c)
+{
+    struct domain_context_tsc_info t;
+    unsigned int i;
+    int rc;
+
+    rc = domain_load_ctxt_rec(c, DOMAIN_CONTEXT_TSC_INFO, &i, &t, sizeof(t));
+    if ( rc )
+        return rc;
+
+    if ( i ) /* expect only a single instance */
+        return -ENXIO;
+
+    return tsc_set_info(d, t.mode, t.nsec, t.khz, t.incarnation);
+}
+
+DOMAIN_REGISTER_CTXT_TYPE(TSC_INFO, save_tsc_info, load_tsc_info);
+
 /* vtsc may incur measurable performance degradation, diagnose with this */
 static void dump_softtsc(unsigned char key)
 {
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
index bccbaadd0b..86881864cf 100644
--- a/xen/include/public/save.h
+++ b/xen/include/public/save.h
@@ -50,6 +50,7 @@ enum {
     DOMAIN_CONTEXT_END,
     DOMAIN_CONTEXT_START,
     DOMAIN_CONTEXT_SHARED_INFO,
+    DOMAIN_CONTEXT_TSC_INFO,
     /* New types go here */
     DOMAIN_CONTEXT_NR_TYPES
 };
@@ -69,6 +70,13 @@ struct domain_context_shared_info {
     uint8_t buffer[XEN_FLEX_ARRAY_DIM];
 };
 
+struct domain_context_tsc_info {
+    uint32_t mode;
+    uint32_t khz;
+    uint64_t nsec;
+    uint32_t incarnation;
+};
+
 /* Terminating entry */
 struct domain_context_end {};
 
-- 
2.20.1


