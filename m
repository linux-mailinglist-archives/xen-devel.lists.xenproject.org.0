Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEA75F780F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 14:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417961.662705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmeT-0001vj-2x; Fri, 07 Oct 2022 12:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417961.662705; Fri, 07 Oct 2022 12:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmeS-0001s2-Vg; Fri, 07 Oct 2022 12:40:28 +0000
Received: by outflank-mailman (input) for mailman id 417961;
 Fri, 07 Oct 2022 12:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NbG=2I=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1ogmeR-0001bd-6n
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 12:40:27 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37b9ad0a-463d-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 14:40:26 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id bk15so7078385wrb.13
 for <xen-devel@lists.xenproject.org>; Fri, 07 Oct 2022 05:40:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003b95ed78275sm2237208wms.20.2022.10.07.05.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:40:25 -0700 (PDT)
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
X-Inumbo-ID: 37b9ad0a-463d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdQ1ywQBPJum0BhihWVir9mOqof1BeIfrkRzabeE3Hc=;
        b=E0ADwO8//FyPWDkI1qNXQzo+uMNfFFvYXI9dyWDDOHF7UAhnVcYd4b7bcSQv+JzMfW
         2LGrMjIdEJEWedb3EaxCpq98+jzle/oiUHg2nw4vbyrLGWiSuXcgUKVDVcNh/jBZnlno
         9TzUhcX+zZtA3YeRCfVY70mIWtTUjzvRSgMmzbxvZmr8RvDDyTRAG+zMEVPrDxflH4Py
         uNc93Mt+qho0vWhGM5gOu1exoWkjFFAwAVAk2v7fqoRHUXxtd+K/saxwkXIiVM7WB9xR
         9RQSivs6MxVqouYl74zmHRSn6JUpHsv/wMusIqp+NhKZb9Cs/+Nsw/19WouDQFTgF7Zd
         xylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdQ1ywQBPJum0BhihWVir9mOqof1BeIfrkRzabeE3Hc=;
        b=TVvfmt3wLmPxHTSnRJgDZ18sthZSrfy1LmA7jjcJyX3TWV+vm092sdmXoKdJrDS3vy
         PYY3ptVwIbFzsRxnrYb2P366R3c42pilhjdb1YOfPxOMAUAPpSAwF4UX+bc52SX+azq3
         /nTBs24s3Exw1u+sMqg1+o/bpeVzYFp1PCrpmACXDv07gEP6cSmjwR30EGF9Gzg9Px37
         NJi2IoOi+fDVjklVhui1We3GGx2G7BiVJRg4C2+ojvPo+BC3K9/jQpfxSSaVsk3WaVSj
         kkjuINtbenj19YWm+21kQIb3hnvHaI8Hv+rsF2/Y/hq8IeLCe+YOLN0J/tyj8FDm6CoR
         qfyg==
X-Gm-Message-State: ACrzQf3pH2hTIeqptWPHV/NMSh3DLrMrU3VVFwdhLBXAQbS9E5P91CTp
	eQduOJgKWwui+xQocm6b+PTQlxHcl7+gSQ==
X-Google-Smtp-Source: AMsMyM6OCUBQH3Pu7RIknEpoknCMQbVu/GUlRpRvhhk9hW2I+5N2SYNC5lpnXJTbba7O5yVG2vWJ5A==
X-Received: by 2002:a5d:674f:0:b0:22e:3d59:cf0f with SMTP id l15-20020a5d674f000000b0022e3d59cf0fmr3172589wrw.304.1665146425560;
        Fri, 07 Oct 2022 05:40:25 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH v2 2/2] tools/misc: Add xen-vcpus-stats tool
Date: Fri,  7 Oct 2022 14:39:54 +0200
Message-Id: <df706d6dcfba965909d776dda163fdb261d1a0ea.1665138677.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665138677.git.matias.vara@vates.fr>
References: <cover.1665138677.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a demonstration tool that uses the stats_table resource to
query vcpus' RUNSTATE_running counter for a DomU.

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
Changes in v2:
- use period instead of frec
- rely on version to ensure reading is coherent 

Changes in v1:
- change the name of the tool to xen-vcpus-stats
- set command line parameters in the same order that are passed
- remove header libs.h
- build by default
- remove errno, strerrno, "\n", and identation
- use errx when errno is not needed
- address better the number of pages requested and error msgs
- use the shared_vcpustatspage_t structure
- use the correct frame id when requesting the resource
---
 tools/misc/Makefile          |  6 +++
 tools/misc/xen-vcpus-stats.c | 87 ++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 tools/misc/xen-vcpus-stats.c

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 2b683819d4..837e4b50da 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -49,6 +49,7 @@ TARGETS_COPY += xenpvnetboot
 
 # Everything which needs to be built
 TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
+TARGETS_BUILD += xen-vcpus-stats
 
 # ... including build-only targets
 TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
@@ -135,4 +136,9 @@ xencov: xencov.o
 xen-ucode: xen-ucode.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-vcpus-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
+
+xen-vcpus-stats: xen-vcpus-stats.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
+
 -include $(DEPS_INCLUDE)
diff --git a/tools/misc/xen-vcpus-stats.c b/tools/misc/xen-vcpus-stats.c
new file mode 100644
index 0000000000..29d0efb124
--- /dev/null
+++ b/tools/misc/xen-vcpus-stats.c
@@ -0,0 +1,87 @@
+#include <err.h>
+#include <errno.h>
+#include <error.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <signal.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xen/vcpu.h>
+
+#define rmb()   asm volatile("lfence":::"memory")
+
+static sig_atomic_t interrupted;
+static void close_handler(int signum)
+{
+    interrupted = 1;
+}
+
+int main(int argc, char **argv)
+{
+    xenforeignmemory_handle *fh;
+    xenforeignmemory_resource_handle *res;
+    size_t size;
+    int rc, domid, period, vcpu;
+    shared_vcpustatspage_t * info;
+    struct sigaction act;
+    uint32_t version;
+    uint64_t value;
+
+    if (argc != 4 ) {
+        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
+        return 1;
+    }
+
+    domid = atoi(argv[1]);
+    vcpu = atoi(argv[2]);
+    period = atoi(argv[3]);
+
+    act.sa_handler = close_handler;
+    act.sa_flags = 0;
+    sigemptyset(&act.sa_mask);
+    sigaction(SIGHUP,  &act, NULL);
+    sigaction(SIGTERM, &act, NULL);
+    sigaction(SIGINT,  &act, NULL);
+    sigaction(SIGALRM, &act, NULL);
+
+    fh = xenforeignmemory_open(NULL, 0);
+
+    if ( !fh )
+        err(1, "xenforeignmemory_open");
+
+    rc = xenforeignmemory_resource_size(
+        fh, domid, XENMEM_resource_stats_table,
+        0, &size);
+
+    if ( rc )
+        err(1, "Fail: Get size");
+
+    res = xenforeignmemory_map_resource(
+        fh, domid, XENMEM_resource_stats_table,
+        0, XENMEM_resource_stats_frame_vcpustats, size >> XC_PAGE_SHIFT,
+        (void **)&info, PROT_READ, 0);
+
+    if ( !res )
+        err(1, "Fail: Map");
+
+    while ( !interrupted ) {
+        sleep(period);
+        do {
+            version = info->vcpu_info[vcpu].version;
+            rmb();
+            value = info->vcpu_info[vcpu].runstate_running_time;
+            rmb();
+        } while ((info->vcpu_info[vcpu].version & 1) ||
+                (version != info->vcpu_info[vcpu].version));
+        printf("running_vcpu_time[%d]: %ld\n", vcpu, value);
+    }
+
+    rc = xenforeignmemory_unmap_resource(fh, res);
+    if ( rc )
+        err(1, "Fail: Unmap");
+
+    return 0;
+}
-- 
2.25.1


