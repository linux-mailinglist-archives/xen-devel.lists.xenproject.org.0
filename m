Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D059287BF4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4563.11993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb73-0005k9-3H; Thu, 08 Oct 2020 18:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4563.11993; Thu, 08 Oct 2020 18:58:00 +0000
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
	id 1kQb72-0005jB-Rj; Thu, 08 Oct 2020 18:58:00 +0000
Received: by outflank-mailman (input) for mailman id 4563;
 Thu, 08 Oct 2020 18:57:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb70-0005RO-Or
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:58 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b401a948-9a26-4764-a57a-e7a26aace545;
 Thu, 08 Oct 2020 18:57:46 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6n-00041e-MH; Thu, 08 Oct 2020 18:57:45 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6n-0002P9-Ea; Thu, 08 Oct 2020 18:57:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb70-0005RO-Or
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:58 +0000
X-Inumbo-ID: b401a948-9a26-4764-a57a-e7a26aace545
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b401a948-9a26-4764-a57a-e7a26aace545;
	Thu, 08 Oct 2020 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=08OQ9dhpBtbLKfokq1GJMc6/ONnHhWNL0B52lkG8Jxs=; b=0X+9fnPxu+nVAFDzZo+0JLq+3R
	B9jEyuocVfr4jF570pJIh+UXlKXKAv9fMBqH8w7GhbXuVVfWhY/1Aik64e+/Dy09D6lJnRvUInhuf
	UZfZNSgYOvder6/BoDN6GkxHnS61NcuSKXC+kPFoltX2UfAc7FcAUjFD1VzkDQ66i5RI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6n-00041e-MH; Thu, 08 Oct 2020 18:57:45 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6n-0002P9-Ea; Thu, 08 Oct 2020 18:57:45 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 05/11] common/domain: add a domain context record for shared_info...
Date: Thu,  8 Oct 2020 19:57:29 +0100
Message-Id: <20201008185735.29875-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and update xen-domctx to dump some information describing the record.

NOTE: Processing of the content during restore is currently limited to
      PV domains, and matches processing of the PV-only SHARED_INFO record
      done by libxc. All content is, however, saved such that restore
      processing can be modified in future without requiring a new record
      format.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>

v10:
 - Re-base
 - Amend the specification now there is one
 - Dropped Jan's R-b as modifications are not completely trivial

v9:
 - Use macros to make the code less verbose
 - Add missing check for allocation failure

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
 docs/specs/domain-context.md |  29 +++++++++
 tools/misc/xen-domctx.c      |  80 +++++++++++++++++++++++++
 xen/common/domain.c          | 113 +++++++++++++++++++++++++++++++++++
 xen/include/public/save.h    |  11 ++++
 4 files changed, 233 insertions(+)

diff --git a/docs/specs/domain-context.md b/docs/specs/domain-context.md
index f177cf24b3..95e9f9d1ab 100644
--- a/docs/specs/domain-context.md
+++ b/docs/specs/domain-context.md
@@ -128,6 +128,33 @@ can no longer be safely inferred.
 A record of this type terminates the image. No further data from the buffer
 should be consumed.
 
+### SHARED_INFO
+
+```
+    0       1       2       3       4       5       6       7    octet
++-------+-------+-------+-------+-------+-------+-------+-------+
+| type == 2                     | instance == 0                 |
++-------------------------------+-------------------------------+
+| length                                                        |
++-------------------------------+-------------------------------+
+| flags                         | buffer
++-------------------------------+
+...
+```
+
+\pagebreak
+The record body contains the following fields:
+
+| Field       | Description                                     |
+|-------------|-------------------------------------------------|
+| `flags`     | A bit-wise OR of the following:                 |
+|             |                                                 |
+|             | 0x00000001: The domain has 32-bit (compat)      |
+|             |             shared info                         |
+|             |                                                 |
+| `buffer`    | The shared info (`length` being architecture    |
+|             | dependent[4])                                   |
+
 * * *
 
 [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
@@ -135,3 +162,5 @@ should be consumed.
 [2] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/hvm/save.h
 
 [3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/specs/libxc-migration-stream.pandoc
+
+[4] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/include/xen-foreign/reference.size
diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
index ca135b9a28..5ea6de50d1 100644
--- a/tools/misc/xen-domctx.c
+++ b/tools/misc/xen-domctx.c
@@ -57,6 +57,85 @@ static void dump_start(void)
     printf("    START: Xen %u.%u\n", s->xen_major, s->xen_minor);
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
+    struct domain_context_shared_info *s;
+    bool has_32bit_shinfo;
+    shared_info_any_t *info;
+    unsigned int i, n;
+
+    GET_PTR(s);
+    has_32bit_shinfo = s->flags & DOMAIN_CONTEXT_32BIT_SHARED_INFO;
+
+    printf("    SHARED_INFO: has_32bit_shinfo: %s\n",
+           has_32bit_shinfo ? "true" : "false");
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
+    printf("                 wc: version: %u sec: %u nsec: %u",
+           GET_FIELD(wc_version), GET_FIELD(wc_sec), GET_FIELD(wc_nsec));
+    if ( !has_32bit_shinfo )
+        printf(" sec_hi: %u", info->x64.xen_wc_sec_hi);
+    printf("\n");
+
+#undef GET_FIELD
+#undef GET_FIELD_SIZE
+#undef GET_FIELD_PTR
+}
+
 static void dump_end(void)
 {
     struct domain_context_end *e;
@@ -145,6 +224,7 @@ int main(int argc, char **argv)
             switch (rec->type)
             {
             case DOMAIN_CONTEXT_START: dump_start(); break;
+            case DOMAIN_CONTEXT_SHARED_INFO: dump_shared_info(); break;
             case DOMAIN_CONTEXT_END: dump_end(); break;
             default:
                 printf("Unknown type %u: skipping\n", rec->type);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f748806a45..6c223dae38 100644
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
@@ -1671,6 +1672,118 @@ int continue_hypercall_on_cpu(
     return 0;
 }
 
+static int save_shared_info(struct domain *d, struct domain_ctxt_state *c,
+                            bool dry_run)
+{
+#ifdef CONFIG_COMPAT
+    struct domain_context_shared_info s = {
+        .flags = has_32bit_shinfo(d) ? DOMAIN_CONTEXT_32BIT_SHARED_INFO : 0,
+    };
+    size_t size = has_32bit_shinfo(d) ?
+        sizeof(struct compat_shared_info) :
+        sizeof(struct shared_info);
+#else
+    struct domain_context_shared_info s = {};
+    size_t size = sizeof(struct shared_info);
+#endif
+    int rc;
+
+    rc = domain_save_ctxt_rec_begin(c, DOMAIN_CONTEXT_SHARED_INFO, 0);
+    if ( rc )
+        return rc;
+
+    rc = domain_save_ctxt_rec_data(c, &s, offsetof(typeof(s), buffer));
+    if ( rc )
+        return rc;
+
+    rc = domain_save_ctxt_rec_data(c, d->shared_info, size);
+    if ( rc )
+        return rc;
+
+    return domain_save_ctxt_rec_end(c);
+}
+
+static int load_shared_info(struct domain *d, struct domain_ctxt_state *c)
+{
+    struct domain_context_shared_info s = {};
+    size_t size;
+    unsigned int i;
+    int rc;
+
+    rc = domain_load_ctxt_rec_begin(c, DOMAIN_CONTEXT_SHARED_INFO, &i);
+    if ( rc )
+        return rc;
+
+    if ( i ) /* expect only a single instance */
+        return -ENXIO;
+
+    rc = domain_load_ctxt_rec_data(c, &s, offsetof(typeof(s), buffer));
+    if ( rc )
+        return rc;
+
+    if ( s.flags & ~DOMAIN_CONTEXT_32BIT_SHARED_INFO )
+        return -EINVAL;
+
+    if ( s.flags & DOMAIN_CONTEXT_32BIT_SHARED_INFO )
+    {
+#ifdef CONFIG_COMPAT
+        d->arch.has_32bit_shinfo = true;
+        size = sizeof(struct compat_shared_info);
+#else
+        return -EINVAL;
+#endif
+    }
+    else
+        size = sizeof(struct shared_info);
+
+    if ( is_pv_domain(d) )
+    {
+        shared_info_t *shinfo = xzalloc(shared_info_t);
+
+        if ( !shinfo )
+            return -ENOMEM;
+
+        rc = domain_load_ctxt_rec_data(c, shinfo, size);
+        if ( rc )
+            goto out;
+
+        memcpy(&shared_info(d, vcpu_info), &__shared_info(d, shinfo, vcpu_info),
+               sizeof(shared_info(d, vcpu_info)));
+        memcpy(&shared_info(d, arch), &__shared_info(d, shinfo, arch),
+               sizeof(shared_info(d, arch)));
+
+        memset(&shared_info(d, evtchn_pending), 0,
+               sizeof(shared_info(d, evtchn_pending)));
+        memset(&shared_info(d, evtchn_mask), 0xff,
+               sizeof(shared_info(d, evtchn_mask)));
+
+#ifdef CONFIG_X86
+        shared_info(d, arch.pfn_to_mfn_frame_list_list) = 0;
+#endif
+        for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
+            shared_info(d, vcpu_info[i].evtchn_pending_sel) = 0;
+
+        rc = domain_load_ctxt_rec_end(c, false);
+
+    out:
+        xfree(shinfo);
+    }
+    else
+    {
+        /*
+         * No modifications to shared_info are required for restoring non-PV
+         * domains.
+         */
+        rc = domain_load_ctxt_rec_data(c, NULL, size);
+        if ( !rc )
+            rc = domain_load_ctxt_rec_end(c, true);
+    }
+
+    return rc;
+}
+
+DOMAIN_REGISTER_CTXT_TYPE(SHARED_INFO, save_shared_info, load_shared_info);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
index c4be9f570c..bccbaadd0b 100644
--- a/xen/include/public/save.h
+++ b/xen/include/public/save.h
@@ -49,6 +49,7 @@ struct domain_context_record {
 enum {
     DOMAIN_CONTEXT_END,
     DOMAIN_CONTEXT_START,
+    DOMAIN_CONTEXT_SHARED_INFO,
     /* New types go here */
     DOMAIN_CONTEXT_NR_TYPES
 };
@@ -58,6 +59,16 @@ struct domain_context_start {
     uint32_t xen_major, xen_minor;
 };
 
+struct domain_context_shared_info {
+    uint32_t flags;
+
+#define _DOMAIN_CONTEXT_32BIT_SHARED_INFO 0
+#define DOMAIN_CONTEXT_32BIT_SHARED_INFO \
+    (1U << _DOMAIN_CONTEXT_32BIT_SHARED_INFO)
+
+    uint8_t buffer[XEN_FLEX_ARRAY_DIM];
+};
+
 /* Terminating entry */
 struct domain_context_end {};
 
-- 
2.20.1


