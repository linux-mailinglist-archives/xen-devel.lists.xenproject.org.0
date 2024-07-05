Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED54928B39
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754349.1162752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkVz-0003tL-9M; Fri, 05 Jul 2024 15:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754349.1162752; Fri, 05 Jul 2024 15:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkVz-0003qQ-6g; Fri, 05 Jul 2024 15:06:23 +0000
Received: by outflank-mailman (input) for mailman id 754349;
 Fri, 05 Jul 2024 15:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ok7N=OF=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sPkVw-0003qK-Vd
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:06:20 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21cd3a3a-3ae0-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 17:06:18 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77dc08db60so41006866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:06:18 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77b5199566sm156526766b.62.2024.07.05.08.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:06:16 -0700 (PDT)
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
X-Inumbo-ID: 21cd3a3a-3ae0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720191978; x=1720796778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brMFw0vVrRrpDvdTuozVrAa3xTXmg025tR8fcxq9Tms=;
        b=j+wsfp4rhORn8T6b9IxwfaWKgYwFhoBqFVTDDDddzZYeex2/fzMFuA7lkbenwIgskM
         XrhUzr6JR3vMSYWtONi0+pxXpkXEvolXkhZKTP3gW7k3lYjknhtzfUVK0RScAgpn+slI
         l7IY977YEGjI9ZBYYaO+ahIkf29aatfytp1RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720191978; x=1720796778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brMFw0vVrRrpDvdTuozVrAa3xTXmg025tR8fcxq9Tms=;
        b=iQbYi196JQB5niINSzP5Z+zWuv5wi++uEYMg2vHDYO9o5W0YpVxYI99GZQ0N7kdCCP
         dID0PrxTkP7Ae4CLh9yrr9260O40uLnWqfy2LmHNhVjIsm2F01PTTuY7N0nnfZui05bU
         j4Iiqj37MeXKnlwb6y87bcQGmVZvqqC4e41XtJBKe9Y7qZdskyOz4VztS5i0+h3zgfan
         eg0aHizoZ7nnZeumxemxFRID6JO8k7dkkAjneRWleZu2citp9ynUmrSM/PhkAUS5nbLr
         6M0uIZ0V5MBPpES/EqaNz+sWR8nWvnywzZyO3s/VX9Hw5Olztbc6xpqqAZf34dPos2tT
         S1fA==
X-Gm-Message-State: AOJu0Ywn6nVjpsgcIDIsHOu5BmY5dfQoHgdJ+xIrZm6IEkgnKk7eH6Qv
	59MK3sGbTLWSQ2Xk6rgtXw397A+yNi9i+zZAUdkLSyWJ5aFM0Vh0fkPddGZOhYkadj0GqEEijKG
	8
X-Google-Smtp-Source: AGHT+IEJ9SzxlyCKvePY9Vzf8fRVdmlOQkWRvYuvb/pBdbNRHreziJXHAGEqykJjuNtTgsujBxhVwQ==
X-Received: by 2002:a17:907:724e:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a77ba70d7fcmr430660966b.53.1720191977260;
        Fri, 05 Jul 2024 08:06:17 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v3] tools/misc: xen-hvmcrash: Inject #DF instead of overwriting RIP
Date: Fri,  5 Jul 2024 16:05:07 +0100
Message-Id: <280d24e233d040ab8d647aeed4026083e2f370bf.1720190714.git.matthew.barnes@cloud.com>
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
Changes in v3:
- Keep xc_domain_{un,}pause() calls
- Update xen-hvmcrash comment to reflect new behaviour

Changes in v2:
- Use xendevicemodel API instead of legacy devicemodel API
- Return error status code if no vcpus could be injected
- Use existing exception vector macro defined in `x86-defns.h`
- Clean up unnecessary headers
- Fix NULL build errors
---
 tools/misc/Makefile       |  2 +-
 tools/misc/xen-hvmcrash.c | 84 ++++++++++-----------------------------
 2 files changed, 22 insertions(+), 64 deletions(-)

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
index 1d058fa40a47..0ee9a4a2f869 100644
--- a/tools/misc/xen-hvmcrash.c
+++ b/tools/misc/xen-hvmcrash.c
@@ -1,7 +1,7 @@
 /* 
  * xen-hvmcrash.c
  *
- * Attempt to crash an HVM guest by overwriting RIP/EIP with a bogus value
+ * Attempt to crash an HVM guest by injecting #DF to every vcpu
  * 
  * Copyright (c) 2010 Citrix Systems, Inc.
  *
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
@@ -83,59 +72,28 @@ main(int argc, char **argv)
         exit(-1);
     }
 
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
+    dmod = xc_interface_dmod_handle(xch);
 
-    off = 0;
-
-    while (off < len) {
-        descriptor = (struct hvm_save_descriptor *)(buf + off);
-
-        off += sizeof (struct hvm_save_descriptor);
-
-        if (descriptor->typecode == HVM_SAVE_CODE(CPU)) {
-            HVM_SAVE_TYPE(CPU) *cpu;
-
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
+        injected = true;
     }
 
-    ret = xc_domain_hvm_setcontext(xch, domid, buf, len);
+    ret = xc_domain_unpause(xch, domid);
     if (ret < 0) {
-        perror("xc_domain_hvm_setcontext");
+        perror("xc_domain_unpause");
         exit(1);
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


