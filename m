Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C744C91E2B7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 16:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751755.1159803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIJh-0005jj-9x; Mon, 01 Jul 2024 14:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751755.1159803; Mon, 01 Jul 2024 14:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIJh-0005ht-6p; Mon, 01 Jul 2024 14:47:41 +0000
Received: by outflank-mailman (input) for mailman id 751755;
 Mon, 01 Jul 2024 14:47:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bf3o=OB=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sOIJf-0005gv-BD
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 14:47:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbccd4ac-37b8-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 16:47:37 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57d1d45ba34so527696a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 07:47:37 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([193.240.71.118])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf63390sm338228166b.69.2024.07.01.07.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 07:47:35 -0700 (PDT)
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
X-Inumbo-ID: dbccd4ac-37b8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719845256; x=1720450056; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKR4EGxyBOkPJYDl2bmrKCnjrBiSKq+/tdH401KYhs4=;
        b=O3rdkwZzqLD5C/Purq4LquwjtXh80rqxWCLprKH07jiAHPopOUOkrQRaibmbTyKCol
         pZgUrkede+YKzXIDk1sonmXOmGhCHVLYfSJ0U99JQYsySeq4/pHEHmF1WK/dsGCIv+nG
         kh8dcZAaJ4tMVdxDnzKVjvLqqDfMrncbilx1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845256; x=1720450056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKR4EGxyBOkPJYDl2bmrKCnjrBiSKq+/tdH401KYhs4=;
        b=iLdxmS/G94xZej2lIs11rHpqWwEuyESC2W+tLIFUdu2Cx/xwMv16Q/9Yqi9n04lGvp
         pedamGQHwjv54kteMsynpjavkquVitE+ufbP+ab8epumDnr+4fgMvJP2bESDRtSmzDCT
         ADq0DJ2I3Ypn+eSx/Tx5+rDjV3n7DDrUlVAOhdSL5I4Wc/ILdtxR9pOOWdRD1r613pat
         JIcuaHWhV2CdAtksGXfxYIV2iQhDhy2Sop44uNhBb2NXDO3ypQyl3uqktdGlpHg6qJyZ
         dEWEtggop7KEZzs+M5m1J5z2AeKKpOwta9SXlrCjr+H+p/ef4k/eIbu04Sv5MdsAplqP
         L24A==
X-Gm-Message-State: AOJu0YxQZ17xa86lMeTImW4yvLo7hkVA9hUI+o9yG5uioc7xkdYOrTp1
	CgCoHebeHxmgGk1lH9s5uLzhUKASbO4Wj4vzOhpQYl7wzwDo5l27NQWxefk4lqdWFMHLNgifOaY
	Z
X-Google-Smtp-Source: AGHT+IHzNfxepJc4K7x3+wQfr+a9nNcTvTR10adLcblwMSyl1ZRP+VMbrXv+H0arsbjkgxKlOSFEAg==
X-Received: by 2002:a17:907:2d08:b0:a6f:5fc2:fe8b with SMTP id a640c23a62f3a-a75143e71c8mr516507266b.32.1719845256012;
        Mon, 01 Jul 2024 07:47:36 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2] tools/misc: xen-hvmcrash: Inject #DF instead of overwriting RIP
Date: Mon,  1 Jul 2024 15:47:17 +0100
Message-Id: <2cd2f12d49f75b8870c964fa86d29f0e4e18b155.1719840698.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen-hvmcrash would previously save records, overwrite the instruction
pointer with a bogus value, and then restore them to crash a domain
just enough to cause the guest OS to memdump.

This approach is found to be unreliable when tested on a guest running
Windows 10 x64, with some executions doing nothing at all.

Another approach would be to trigger NMIs. This approach is found to be
unreliable when tested on Linux (Ubuntu 22.04), as Linux will ignore
NMIs if it is not configured to handle such.

Injecting a double fault abort to all vCPUs is found to be more
reliable at crashing and invoking memdumps from Windows and Linux
domains.

This patch modifies the xen-hvmcrash tool to inject #DF to all vCPUs
belonging to the specified domain, instead of overwriting RIP.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
Changes in v2:
- Use xendevicemodel API instead of legacy devicemodel API
- Return error status code if no vcpus could be injected
- Use existing exception vector macro defined in `x86-defns.h`
- Clean up unnecessary headers
- Fix NULL build errors
---
 tools/misc/Makefile       |  2 +-
 tools/misc/xen-hvmcrash.c | 90 ++++++++-------------------------------
 2 files changed, 19 insertions(+), 73 deletions(-)

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 66d0d6b09029..c26e544e8393 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -81,7 +81,7 @@ xen-hvmctx: xen-hvmctx.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
 xen-hvmcrash: xen-hvmcrash.o
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxendevicemodel) $(APPEND_LDFLAGS)
 
 xen-memshare: xen-memshare.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
index 1d058fa40a47..efa47c9dfec8 100644
--- a/tools/misc/xen-hvmcrash.c
+++ b/tools/misc/xen-hvmcrash.c
@@ -24,36 +24,25 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <stddef.h>
-#include <stdint.h>
-#include <unistd.h>
 #include <string.h>
 #include <errno.h>
-#include <limits.h>
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <arpa/inet.h>
 
 #include <xenctrl.h>
-#include <xen/xen.h>
-#include <xen/domctl.h>
-#include <xen/hvm/save.h>
+#include <xendevicemodel.h>
+
+#include <xen/asm/x86-defns.h>
 
 int
 main(int argc, char **argv)
 {
     int domid;
     xc_interface *xch;
+    xendevicemodel_handle *dmod;
     xc_domaininfo_t dominfo;
-    int ret;
-    uint32_t len;
-    uint8_t *buf;
-    uint32_t off;
-    struct hvm_save_descriptor *descriptor;
+    int vcpu_id, ret;
+    bool injected = false;
 
     if (argc != 2 || !argv[1] || (domid = atoi(argv[1])) < 0) {
         fprintf(stderr, "usage: %s <domid>\n", argv[0]);
@@ -77,65 +66,22 @@ main(int argc, char **argv)
         exit(1);
     }
 
-    ret = xc_domain_pause(xch, domid);
-    if (ret < 0) {
-        perror("xc_domain_pause");
-        exit(-1);
-    }
-
-    /*
-     * Calling with zero buffer length should return the buffer length
-     * required.
-     */
-    ret = xc_domain_hvm_getcontext(xch, domid, 0, 0);
-    if (ret < 0) {
-        perror("xc_domain_hvm_getcontext");
-        exit(1);
-    }
-    
-    len = ret;
-    buf = malloc(len);
-    if (buf == NULL) {
-        perror("malloc");
-        exit(1);
-    }
-
-    ret = xc_domain_hvm_getcontext(xch, domid, buf, len);
-    if (ret < 0) {
-        perror("xc_domain_hvm_getcontext");
-        exit(1);
-    }
-
-    off = 0;
-
-    while (off < len) {
-        descriptor = (struct hvm_save_descriptor *)(buf + off);
-
-        off += sizeof (struct hvm_save_descriptor);
-
-        if (descriptor->typecode == HVM_SAVE_CODE(CPU)) {
-            HVM_SAVE_TYPE(CPU) *cpu;
+    dmod = xc_interface_dmod_handle(xch);
 
-            /* Overwrite EIP/RIP with some recognisable but bogus value */
-            cpu = (HVM_SAVE_TYPE(CPU) *)(buf + off);
-            printf("CPU[%d]: RIP = %" PRIx64 "\n", descriptor->instance, cpu->rip);
-            cpu->rip = 0xf001;
-        } else if (descriptor->typecode == HVM_SAVE_CODE(END)) {
-            break;
+    for (vcpu_id = 0; vcpu_id <= dominfo.max_vcpu_id; vcpu_id++) {
+        printf("Injecting #DF to vcpu ID #%d...\n", vcpu_id);
+        ret = xendevicemodel_inject_event(dmod, domid, vcpu_id,
+                                X86_EXC_DF,
+                                XEN_DMOP_EVENT_hw_exc, 0, 0, 0);
+        if (ret < 0) {
+            fprintf(stderr, "Could not inject #DF to vcpu ID #%d: %s\n", vcpu_id, strerror(errno));
+            continue;
         }
-
-        off += descriptor->length;
-    }
-
-    ret = xc_domain_hvm_setcontext(xch, domid, buf, len);
-    if (ret < 0) {
-        perror("xc_domain_hvm_setcontext");
-        exit(1);
+        injected = true;
     }
 
-    ret = xc_domain_unpause(xch, domid);
-    if (ret < 0) {
-        perror("xc_domain_unpause");
+    if (!injected) {
+        fprintf(stderr, "Could not inject #DF to any vcpu!\n");
         exit(1);
     }
 
-- 
2.34.1


